Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC8F82689CE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Sep 2020 13:14:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726055AbgINLOD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Sep 2020 07:14:03 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:51315 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726050AbgINLN5 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Sep 2020 07:13:57 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1600082036; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=QkIEED3WzeBtDmtkup8A2lmf5rzNNXYfnnzLfkqTWkQ=; b=R2UJlozezace5lzZGiVMj79zqrYmRCoQynOO13UzyWTHlEEr/NCDMNTsHLH9C3k/MkQDfMik
 +SRy2/QnTDUmi2dSSDxng1BKwj484fezXw3mMdsiYW3bglAkzzeEE3OV78B7NjLAlIZbl3Fi
 OGphrEcIYwgan6qtmIjx2GNKt54=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5f5f505fba408b30ce475bfb (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 14 Sep 2020 11:13:35
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 75C53C433FF; Mon, 14 Sep 2020 11:13:34 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 22C83C433C8;
        Mon, 14 Sep 2020 11:13:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 22C83C433C8
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
Subject: [PATCHv4 1/2] soc: qcom: llcc: Move attribute config to its own function
Date:   Mon, 14 Sep 2020 16:42:59 +0530
Message-Id: <343db8a7b0e85ae6e29b9e79b68b98c22fcbcdce.1599974998.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1599974998.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1599974998.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Cleanup qcom_llcc_cfg_program() by moving llcc attribute
configuration to a separate function of its own. Also
correct misspelled 'instance' caught by checkpatch.

Suggested-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---
 drivers/soc/qcom/llcc-qcom.c | 75 ++++++++++++++++++++----------------
 1 file changed, 41 insertions(+), 34 deletions(-)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index 429b5a60a1ba..60ee31842dea 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -318,14 +318,50 @@ size_t llcc_get_slice_size(struct llcc_slice_desc *desc)
 }
 EXPORT_SYMBOL_GPL(llcc_get_slice_size);
 
-static int qcom_llcc_cfg_program(struct platform_device *pdev)
+static int qcom_llcc_attr_cfg(const struct llcc_slice_config *table)
 {
-	int i;
 	u32 attr1_cfg;
 	u32 attr0_cfg;
 	u32 attr1_val;
 	u32 attr0_val;
 	u32 max_cap_cacheline;
+	int ret;
+
+	attr1_cfg = LLCC_TRP_ATTR1_CFGn(table->slice_id);
+	attr0_cfg = LLCC_TRP_ATTR0_CFGn(table->slice_id);
+
+	attr1_val = table->cache_mode;
+	attr1_val |= table->probe_target_ways << ATTR1_PROBE_TARGET_WAYS_SHIFT;
+	attr1_val |= table->fixed_size << ATTR1_FIXED_SIZE_SHIFT;
+	attr1_val |= table->priority << ATTR1_PRIORITY_SHIFT;
+
+	max_cap_cacheline = MAX_CAP_TO_BYTES(table->max_cap);
+
+	/* LLCC instances can vary for each target.
+	 * The SW writes to broadcast register which gets propagated
+	 * to each llcc instance (llcc0,.. llccN).
+	 * Since the size of the memory is divided equally amongst the
+	 * llcc instances, we need to configure the max cap accordingly.
+	 */
+	max_cap_cacheline = max_cap_cacheline / drv_data->num_banks;
+	max_cap_cacheline >>= CACHE_LINE_SIZE_SHIFT;
+	attr1_val |= max_cap_cacheline << ATTR1_MAX_CAP_SHIFT;
+
+	attr0_val = table->res_ways & ATTR0_RES_WAYS_MASK;
+	attr0_val |= table->bonus_ways << ATTR0_BONUS_WAYS_SHIFT;
+
+	ret = regmap_write(drv_data->bcast_regmap, attr1_cfg, attr1_val);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(drv_data->bcast_regmap, attr0_cfg, attr0_val);
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
@@ -335,45 +371,16 @@ static int qcom_llcc_cfg_program(struct platform_device *pdev)
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
-		if (ret)
-			return ret;
-		ret = regmap_write(drv_data->bcast_regmap, attr0_cfg,
-					attr0_val);
+		ret = qcom_llcc_attr_cfg(&llcc_table[i]);
 		if (ret)
 			return ret;
+
 		if (llcc_table[i].activate_on_init) {
 			desc.slice_id = llcc_table[i].slice_id;
 			ret = llcc_slice_activate(&desc);
 		}
 	}
+
 	return ret;
 }
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

