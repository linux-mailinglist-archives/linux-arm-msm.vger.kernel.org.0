Return-Path: <linux-arm-msm+bounces-2705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F35227FEE89
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 13:05:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7DCFFB20B1B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 12:05:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7A174502B;
	Thu, 30 Nov 2023 12:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id EDBC9D46;
	Thu, 30 Nov 2023 04:05:09 -0800 (PST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 526E11042;
	Thu, 30 Nov 2023 04:05:56 -0800 (PST)
Received: from bogus (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 791C53F5A1;
	Thu, 30 Nov 2023 04:05:08 -0800 (PST)
Date: Thu, 30 Nov 2023 12:05:06 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: <cristian.marussi@arm.com>, <linux-arm-msm@vger.kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>, <linux-kernel@vger.kernel.org>,
	<quic_mdtipton@quicinc.com>, <linux-arm-kernel@lists.infradead.org>,
	<quic_asartor@quicinc.com>, <quic_lingutla@quicinc.com>
Subject: Re: [PATCH 2/3] firmware: arm_scmi: Fix freq/power truncation in the
 perf protocol
Message-ID: <ZWh6cuApg-sRbA2s@bogus>
References: <20231129065748.19871-1-quic_sibis@quicinc.com>
 <20231129065748.19871-3-quic_sibis@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231129065748.19871-3-quic_sibis@quicinc.com>

On Wed, Nov 29, 2023 at 12:27:47PM +0530, Sibi Sankar wrote:
> Fix frequency and power truncation seen in the performance protocol by
> casting it with the correct type.
>

While I always remembered to handle this when reviewing the spec, seem to
have forgotten when it came to handling in the implementation :(. Thanks
for spotting this.

However I don't like the ugly type casting. I think we can do better. Also
looking at the code around the recently added level index mode, I think we
can simplify things like below patch.

Cristian,
What do you think ?

Regards,
Sudeep

-->8

 drivers/firmware/arm_scmi/perf.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/firmware/arm_scmi/perf.c b/drivers/firmware/arm_scmi/perf.c
index a648521e04a3..2e828b29efab 100644
--- a/drivers/firmware/arm_scmi/perf.c
+++ b/drivers/firmware/arm_scmi/perf.c
@@ -268,13 +268,14 @@ scmi_perf_domain_attributes_get(const struct scmi_protocol_handle *ph,
 		dom_info->sustained_perf_level =
 					le32_to_cpu(attr->sustained_perf_level);
 		if (!dom_info->sustained_freq_khz ||
-		    !dom_info->sustained_perf_level)
+		    !dom_info->sustained_perf_level ||
+		    dom_info->level_indexing_mode)
 			/* CPUFreq converts to kHz, hence default 1000 */
 			dom_info->mult_factor =	1000;
 		else
 			dom_info->mult_factor =
-					(dom_info->sustained_freq_khz * 1000) /
-					dom_info->sustained_perf_level;
+					(dom_info->sustained_freq_khz * 1000UL)
+					/ dom_info->sustained_perf_level;
 		strscpy(dom_info->info.name, attr->name,
 			SCMI_SHORT_NAME_MAX_SIZE);
 	}
@@ -804,9 +805,10 @@ static int scmi_dvfs_device_opps_add(const struct scmi_protocol_handle *ph,

 	for (idx = 0; idx < dom->opp_count; idx++) {
 		if (!dom->level_indexing_mode)
-			freq = dom->opp[idx].perf * dom->mult_factor;
+			freq = dom->opp[idx].perf;
 		else
-			freq = dom->opp[idx].indicative_freq * 1000;
+			freq = dom->opp[idx].indicative_freq;
+		freq *= dom->mult_factor;

 		data.level = dom->opp[idx].perf;
 		data.freq = freq;
@@ -879,7 +881,7 @@ static int scmi_dvfs_freq_get(const struct scmi_protocol_handle *ph, u32 domain,
 		return ret;

 	if (!dom->level_indexing_mode) {
-		*freq = level * dom->mult_factor;
+		*freq = level;
 	} else {
 		struct scmi_opp *opp;

@@ -887,8 +889,9 @@ static int scmi_dvfs_freq_get(const struct scmi_protocol_handle *ph, u32 domain,
 		if (!opp)
 			return -EIO;

-		*freq = opp->indicative_freq * 1000;
+		*freq = opp->indicative_freq;
 	}
+	freq *= dom->mult_factor;

 	return ret;
 }
@@ -908,9 +911,10 @@ static int scmi_dvfs_est_power_get(const struct scmi_protocol_handle *ph,

 	for (opp = dom->opp, idx = 0; idx < dom->opp_count; idx++, opp++) {
 		if (!dom->level_indexing_mode)
-			opp_freq = opp->perf * dom->mult_factor;
+			opp_freq = opp->perf;
 		else
-			opp_freq = opp->indicative_freq * 1000;
+			opp_freq = opp->indicative_freq;
+		opp_freq *= dom->mult_factor;

 		if (opp_freq < *freq)
 			continue;


