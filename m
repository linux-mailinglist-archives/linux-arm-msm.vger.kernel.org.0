Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F2A2269EE9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Sep 2020 08:55:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726092AbgIOGz6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Sep 2020 02:55:58 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:14475 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726066AbgIOGzy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Sep 2020 02:55:54 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1600152953; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=iAG6ZYPnbg49/kiQMOoBFKTXMco1m4zK3AFWpuvLCNQ=; b=gwmKuM9TDtCA2g+U8HhBn0IPJLCj4PQgGuMmbnfByY5RUXhb4C/fvr+41OcMNOS3fZdf2PjK
 c0M/H3LKinKzcveEPmU2N62ZPN+nu/dci8UB6FWWdD/JLlVSqNGmPXtVmtuIWM5Rv4R0nmq+
 yNuCsXNE4U4H2PYeZRDG1eWuxT4=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 5f60656c73afa3417eb50e4b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 15 Sep 2020 06:55:40
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2CD2EC433F0; Tue, 15 Sep 2020 06:55:40 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 52833C433CA;
        Tue, 15 Sep 2020 06:55:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 52833C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCHv5 1/2] soc: qcom: llcc: Move llcc configuration to its own function
Date:   Tue, 15 Sep 2020 12:25:25 +0530
Message-Id: <51f9ad67333eedf326212dd1b040aade6978e5b1.1600151951.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1600151951.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1600151951.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Cleanup qcom_llcc_cfg_program() by moving llcc configuration
to a separate function of its own. Also correct misspelled
'instance' caught by checkpatch.

Suggested-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---
 drivers/soc/qcom/llcc-qcom.c | 89 ++++++++++++++++++++----------------
 1 file changed, 50 insertions(+), 39 deletions(-)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index 429b5a60a1ba..14311060099d 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -318,62 +318,73 @@ size_t llcc_get_slice_size(struct llcc_slice_desc *desc)
 }
 EXPORT_SYMBOL_GPL(llcc_get_slice_size);
 
-static int qcom_llcc_cfg_program(struct platform_device *pdev)
+static int _qcom_llcc_cfg_program(const struct llcc_slice_config *config)
 {
-	int i;
+	int ret;
 	u32 attr1_cfg;
 	u32 attr0_cfg;
 	u32 attr1_val;
 	u32 attr0_val;
 	u32 max_cap_cacheline;
+	struct llcc_slice_desc desc;
+
+	attr1_val = config->cache_mode;
+	attr1_val |= config->probe_target_ways << ATTR1_PROBE_TARGET_WAYS_SHIFT;
+	attr1_val |= config->fixed_size << ATTR1_FIXED_SIZE_SHIFT;
+	attr1_val |= config->priority << ATTR1_PRIORITY_SHIFT;
+
+	max_cap_cacheline = MAX_CAP_TO_BYTES(config->max_cap);
+
+	/*
+	 * LLCC instances can vary for each target.
+	 * The SW writes to broadcast register which gets propagated
+	 * to each llcc instance (llcc0,.. llccN).
+	 * Since the size of the memory is divided equally amongst the
+	 * llcc instances, we need to configure the max cap accordingly.
+	 */
+	max_cap_cacheline = max_cap_cacheline / drv_data->num_banks;
+	max_cap_cacheline >>= CACHE_LINE_SIZE_SHIFT;
+	attr1_val |= max_cap_cacheline << ATTR1_MAX_CAP_SHIFT;
+
+	attr1_cfg = LLCC_TRP_ATTR1_CFGn(config->slice_id);
+
+	ret = regmap_write(drv_data->bcast_regmap, attr1_cfg, attr1_val);
+	if (ret)
+		return ret;
+
+	attr0_val = config->res_ways & ATTR0_RES_WAYS_MASK;
+	attr0_val |= config->bonus_ways << ATTR0_BONUS_WAYS_SHIFT;
+
+	attr0_cfg = LLCC_TRP_ATTR0_CFGn(config->slice_id);
+
+	ret = regmap_write(drv_data->bcast_regmap, attr0_cfg, attr0_val);
+	if (ret)
+		return ret;
+
+	if (config->activate_on_init) {
+		desc.slice_id = config->slice_id;
+		ret = llcc_slice_activate(&desc);
+	}
+
+	return ret;
+}
+
+static int qcom_llcc_cfg_program(struct platform_device *pdev)
+{
+	int i;
 	u32 sz;
 	int ret = 0;
 	const struct llcc_slice_config *llcc_table;
-	struct llcc_slice_desc desc;
 
 	sz = drv_data->cfg_size;
 	llcc_table = drv_data->cfg;
 
 	for (i = 0; i < sz; i++) {
-		attr1_cfg = LLCC_TRP_ATTR1_CFGn(llcc_table[i].slice_id);
-		attr0_cfg = LLCC_TRP_ATTR0_CFGn(llcc_table[i].slice_id);
-
-		attr1_val = llcc_table[i].cache_mode;
-		attr1_val |= llcc_table[i].probe_target_ways <<
-				ATTR1_PROBE_TARGET_WAYS_SHIFT;
-		attr1_val |= llcc_table[i].fixed_size <<
-				ATTR1_FIXED_SIZE_SHIFT;
-		attr1_val |= llcc_table[i].priority <<
-				ATTR1_PRIORITY_SHIFT;
-
-		max_cap_cacheline = MAX_CAP_TO_BYTES(llcc_table[i].max_cap);
-
-		/* LLCC instances can vary for each target.
-		 * The SW writes to broadcast register which gets propagated
-		 * to each llcc instace (llcc0,.. llccN).
-		 * Since the size of the memory is divided equally amongst the
-		 * llcc instances, we need to configure the max cap accordingly.
-		 */
-		max_cap_cacheline = max_cap_cacheline / drv_data->num_banks;
-		max_cap_cacheline >>= CACHE_LINE_SIZE_SHIFT;
-		attr1_val |= max_cap_cacheline << ATTR1_MAX_CAP_SHIFT;
-
-		attr0_val = llcc_table[i].res_ways & ATTR0_RES_WAYS_MASK;
-		attr0_val |= llcc_table[i].bonus_ways << ATTR0_BONUS_WAYS_SHIFT;
-
-		ret = regmap_write(drv_data->bcast_regmap, attr1_cfg,
-					attr1_val);
+		ret = _qcom_llcc_cfg_program(&llcc_table[i]);
 		if (ret)
 			return ret;
-		ret = regmap_write(drv_data->bcast_regmap, attr0_cfg,
-					attr0_val);
-		if (ret)
-			return ret;
-		if (llcc_table[i].activate_on_init) {
-			desc.slice_id = llcc_table[i].slice_id;
-			ret = llcc_slice_activate(&desc);
-		}
 	}
+
 	return ret;
 }
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

