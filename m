Return-Path: <linux-arm-msm+bounces-2768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C24C47FFCF8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 21:44:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F000281A81
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 20:44:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D34A5A104;
	Thu, 30 Nov 2023 20:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 15D711731;
	Thu, 30 Nov 2023 12:43:57 -0800 (PST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5ED9F1042;
	Thu, 30 Nov 2023 12:44:43 -0800 (PST)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 617BF3F73F;
	Thu, 30 Nov 2023 12:43:55 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	quic_mdtipton@quicinc.com,
	quic_asartor@quicinc.com,
	quic_lingutla@quicinc.com,
	Sibi Sankar <quic_sibis@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH 1/2] firmware: arm_scmi: Fix frequency truncation by promoting multiplier to u64
Date: Thu, 30 Nov 2023 20:43:42 +0000
Message-ID: <20231130204343.503076-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the frequency truncation for all values equal to or greater 4GHz by
updating the multiplier 'mult_factor' to u64 type. It is also possible
that the multiplier itself can be greater than or equal to 2^32. So we need
to also fix the equation computing the value of the multiplier.

Fixes: a9e3fbfaa0ff ("firmware: arm_scmi: add initial support for performance protocol")
Reported-by: Sibi Sankar <quic_sibis@quicinc.com>
Closes: https://lore.kernel.org/all/20231129065748.19871-3-quic_sibis@quicinc.com/
Cc: Cristian Marussi <cristian.marussi@arm.com>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_scmi/perf.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/arm_scmi/perf.c b/drivers/firmware/arm_scmi/perf.c
index 81dd5c5e5533..8ce449922e55 100644
--- a/drivers/firmware/arm_scmi/perf.c
+++ b/drivers/firmware/arm_scmi/perf.c
@@ -152,7 +152,7 @@ struct perf_dom_info {
 	u32 opp_count;
 	u32 sustained_freq_khz;
 	u32 sustained_perf_level;
-	u32 mult_factor;
+	u64 mult_factor;
 	struct scmi_perf_domain_info info;
 	struct scmi_opp opp[MAX_OPPS];
 	struct scmi_fc_info *fc_info;
@@ -273,8 +273,8 @@ scmi_perf_domain_attributes_get(const struct scmi_protocol_handle *ph,
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
--
2.43.0


