Return-Path: <linux-arm-msm+bounces-30751-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E61596C221
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 17:22:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5589A1F243E6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 15:22:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 513491DC19C;
	Wed,  4 Sep 2024 15:21:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D16B433BC;
	Wed,  4 Sep 2024 15:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725463318; cv=none; b=cSJLB9GGV0ewkRvTt8qn8zoHM2CElDb3hdSK6i5f7rdISY2Vn/YKAtAJGr8P8sWl0aBapYmh4D24E7MNMgWCcmqo7x6M83n2OpVCCXxgzzJsCOliXo/scc3X2c+njxX78lu/sk5cDjLThm/v2K2km/x8QYvsiRAHQ/FPI2DAL2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725463318; c=relaxed/simple;
	bh=zUL0md+GQXEgOtygAw9jDdZbTx+P51ZTlIYVB8XOyek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=grVWR7QW0/Bjlf4pbj9KK1RK0z1C05/5gAx0L7aQP+dhda8b8K9cTwd8H9aRWjaEiPdoaeod906CPeGAubIceTwhm1O5RMV/UvCToFmN5sKxx8nKhDd4I/pkMpfNDyMby4Yop62iMdf4SRzUL7aDCl80YoKDvCc0AdizOJIpIAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 48D26FEC;
	Wed,  4 Sep 2024 08:22:20 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 772303F73F;
	Wed,  4 Sep 2024 08:21:52 -0700 (PDT)
Date: Wed, 4 Sep 2024 16:21:49 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com,
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	johan@kernel.org, konradybcio@kernel.org
Subject: Re: [PATCH V2 2/2] firmware: arm_scmi: Skip adding bad duplicates
Message-ID: <Zth7DZmkpOieSZEr@pluto>
References: <20240904031324.2901114-1-quic_sibis@quicinc.com>
 <20240904031324.2901114-3-quic_sibis@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904031324.2901114-3-quic_sibis@quicinc.com>

On Wed, Sep 04, 2024 at 08:43:24AM +0530, Sibi Sankar wrote:
> Ensure that the bad duplicates reported by the platform firmware doesn't
> get added to the opp-tables.
> 

Hi Sibi,

so if the idea is to make the code more robust when FW sends BAD
duplicates, you necessarily need to properly drop opps in opp_count too.

One other option would be to just loop with xa_for_each BUT opp_count is
used in a number of places...so first of all let's try drop count properly.

Can you try this patch down below, instead of your patch.
If it solves, I will send a patch (after testing it a bit more :D)

Thanks,
Cristian

P.S.: thanks for spotting this, I forgot NOT to trust FW replies as usual :P

--->8---
diff --git a/drivers/firmware/arm_scmi/perf.c b/drivers/firmware/arm_scmi/perf.c
index 397a39729e29..cbac29792d1e 100644
--- a/drivers/firmware/arm_scmi/perf.c
+++ b/drivers/firmware/arm_scmi/perf.c
@@ -340,7 +340,7 @@ static int iter_perf_levels_update_state(struct scmi_iterator_state *st,
 	return 0;
 }
 
-static inline void
+static inline int
 process_response_opp(struct device *dev, struct scmi_perf_domain_info *dom,
 		     struct scmi_opp *opp, unsigned int loop_idx,
 		     const struct scmi_msg_resp_perf_describe_levels *r)
@@ -353,12 +353,16 @@ process_response_opp(struct device *dev, struct scmi_perf_domain_info *dom,
 		le16_to_cpu(r->opp[loop_idx].transition_latency_us);
 
 	ret = xa_insert(&dom->opps_by_lvl, opp->perf, opp, GFP_KERNEL);
-	if (ret)
+	if (ret) {
 		dev_warn(dev, "Failed to add opps_by_lvl at %d for %s - ret:%d\n",
 			 opp->perf, dom->name, ret);
+		return ret;
+	}
+
+	return 0;
 }
 
-static inline void
+static inline int
 process_response_opp_v4(struct device *dev, struct scmi_perf_domain_info *dom,
 			struct scmi_opp *opp, unsigned int loop_idx,
 			const struct scmi_msg_resp_perf_describe_levels_v4 *r)
@@ -371,9 +375,11 @@ process_response_opp_v4(struct device *dev, struct scmi_perf_domain_info *dom,
 		le16_to_cpu(r->opp[loop_idx].transition_latency_us);
 
 	ret = xa_insert(&dom->opps_by_lvl, opp->perf, opp, GFP_KERNEL);
-	if (ret)
+	if (ret) {
 		dev_warn(dev, "Failed to add opps_by_lvl at %d for %s - ret:%d\n",
 			 opp->perf, dom->name, ret);
+		return ret;
+	}
 
 	/* Note that PERF v4 reports always five 32-bit words */
 	opp->indicative_freq = le32_to_cpu(r->opp[loop_idx].indicative_freq);
@@ -382,13 +388,21 @@ process_response_opp_v4(struct device *dev, struct scmi_perf_domain_info *dom,
 
 		ret = xa_insert(&dom->opps_by_idx, opp->level_index, opp,
 				GFP_KERNEL);
-		if (ret)
+		if (ret) {
 			dev_warn(dev,
 				 "Failed to add opps_by_idx at %d for %s - ret:%d\n",
 				 opp->level_index, dom->name, ret);
 
+			/* Cleanup by_lvl too */
+			xa_erase(&dom->opps_by_lvl, opp->perf);
+
+			return ret;
+		}
+
 		hash_add(dom->opps_by_freq, &opp->hash, opp->indicative_freq);
 	}
+
+	return 0;
 }
 
 static int
@@ -396,16 +410,22 @@ iter_perf_levels_process_response(const struct scmi_protocol_handle *ph,
 				  const void *response,
 				  struct scmi_iterator_state *st, void *priv)
 {
+	int ret;
 	struct scmi_opp *opp;
 	struct scmi_perf_ipriv *p = priv;
 
 	opp = &p->perf_dom->opp[st->desc_index + st->loop_idx];
 	if (PROTOCOL_REV_MAJOR(p->version) <= 0x3)
-		process_response_opp(ph->dev, p->perf_dom, opp, st->loop_idx,
-				     response);
+		ret = process_response_opp(ph->dev, p->perf_dom, opp,
+					   st->loop_idx, response);
 	else
-		process_response_opp_v4(ph->dev, p->perf_dom, opp, st->loop_idx,
-					response);
+		ret = process_response_opp_v4(ph->dev, p->perf_dom, opp,
+					      st->loop_idx, response);
+
+	/* Skip BAD duplicates received from firmware */
+	if (ret)
+		return ret == -EBUSY ? 0 : ret;
+
 	p->perf_dom->opp_count++;
 
 	dev_dbg(ph->dev, "Level %d Power %d Latency %dus Ifreq %d Index %d\n",
---8<---



