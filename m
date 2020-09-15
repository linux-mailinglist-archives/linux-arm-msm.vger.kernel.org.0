Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DD3B269EEC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Sep 2020 08:56:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726131AbgIOG4J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Sep 2020 02:56:09 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:40132 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726087AbgIOG4G (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Sep 2020 02:56:06 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1600152965; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=31GvM1X5XrPQR2a24S8gJeyLSwWFdH/nLg2HUCMHilk=; b=NvHWKnDiK30QDPobDuop2EC8cmBYwjyBy3QxSlxgMaTAWgCE6gvC1ZyIyCitB/loxuBlgRmH
 KiYhiDQMsBOKnudLx82v0QHN+IzSWMAhYcizpyn0HUgE+dm+MvNaBP2zcJEepdOp5Qu8BC9p
 JveMo2ZEt0Ql+g7Auzv+1TkdJ/w=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5f6065717f21d51b30191141 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 15 Sep 2020 06:55:45
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0FE7AC433C8; Tue, 15 Sep 2020 06:55:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 68322C433C8;
        Tue, 15 Sep 2020 06:55:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 68322C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        "Isaac J. Manjarres" <isaacm@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCHv5 2/2] soc: qcom: llcc: Support chipsets that can write to llcc
Date:   Tue, 15 Sep 2020 12:25:26 +0530
Message-Id: <dac7e11cf654fc6d75a6b5ca062ab87b01547810.1600151951.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1600151951.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1600151951.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: "Isaac J. Manjarres" <isaacm@codeaurora.org>

Older chipsets may not be allowed to configure certain LLCC registers
as that is handled by the secure side software. However, this is not
the case for newer chipsets and they must configure these registers
according to the contents of the SCT table, while keeping in mind that
older targets may not have these capabilities. So add support to allow
such configuration of registers to enable capacity based allocation
and power collapse retention for capable chipsets.

Reason for choosing capacity based allocation rather than the default
way based allocation is because capacity based allocation allows more
finer grain partition and provides more flexibility in configuration.
As for the retention through power collapse, it has an advantage where
the cache hits are more when we wake up from power collapse although
it does burn more power but the exact power numbers are not known at
the moment.

Signed-off-by: Isaac J. Manjarres <isaacm@codeaurora.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
[saiprakash.ranjan@codeaurora.org: use existing config and reword commit msg]
Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---
 drivers/soc/qcom/llcc-qcom.c | 32 ++++++++++++++++++++++++++++----
 1 file changed, 28 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index 14311060099d..8b79bbf96f52 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -45,6 +45,9 @@
 #define LLCC_TRP_ATTR0_CFGn(n)        (0x21000 + SZ_8 * n)
 #define LLCC_TRP_ATTR1_CFGn(n)        (0x21004 + SZ_8 * n)
 
+#define LLCC_TRP_SCID_DIS_CAP_ALLOC   0x21f00
+#define LLCC_TRP_PCB_ACT              0x21f04
+
 #define BANK_OFFSET_STRIDE	      0x80000
 
 /**
@@ -89,6 +92,7 @@ struct llcc_slice_config {
 struct qcom_llcc_config {
 	const struct llcc_slice_config *sct_data;
 	int size;
+	bool need_llcc_cfg;
 };
 
 static const struct llcc_slice_config sc7180_data[] =  {
@@ -122,11 +126,13 @@ static const struct llcc_slice_config sdm845_data[] =  {
 static const struct qcom_llcc_config sc7180_cfg = {
 	.sct_data	= sc7180_data,
 	.size		= ARRAY_SIZE(sc7180_data),
+	.need_llcc_cfg	= true,
 };
 
 static const struct qcom_llcc_config sdm845_cfg = {
 	.sct_data	= sdm845_data,
 	.size		= ARRAY_SIZE(sdm845_data),
+	.need_llcc_cfg	= false,
 };
 
 static struct llcc_drv_data *drv_data = (void *) -EPROBE_DEFER;
@@ -318,7 +324,8 @@ size_t llcc_get_slice_size(struct llcc_slice_desc *desc)
 }
 EXPORT_SYMBOL_GPL(llcc_get_slice_size);
 
-static int _qcom_llcc_cfg_program(const struct llcc_slice_config *config)
+static int _qcom_llcc_cfg_program(const struct llcc_slice_config *config,
+				  const struct qcom_llcc_config *cfg)
 {
 	int ret;
 	u32 attr1_cfg;
@@ -361,6 +368,22 @@ static int _qcom_llcc_cfg_program(const struct llcc_slice_config *config)
 	if (ret)
 		return ret;
 
+	if (cfg->need_llcc_cfg) {
+		u32 disable_cap_alloc, retain_pc;
+
+		disable_cap_alloc = config->dis_cap_alloc << config->slice_id;
+		ret = regmap_write(drv_data->bcast_regmap,
+				LLCC_TRP_SCID_DIS_CAP_ALLOC, disable_cap_alloc);
+		if (ret)
+			return ret;
+
+		retain_pc = config->retain_on_pc << config->slice_id;
+		ret = regmap_write(drv_data->bcast_regmap,
+				LLCC_TRP_PCB_ACT, retain_pc);
+		if (ret)
+			return ret;
+	}
+
 	if (config->activate_on_init) {
 		desc.slice_id = config->slice_id;
 		ret = llcc_slice_activate(&desc);
@@ -369,7 +392,8 @@ static int _qcom_llcc_cfg_program(const struct llcc_slice_config *config)
 	return ret;
 }
 
-static int qcom_llcc_cfg_program(struct platform_device *pdev)
+static int qcom_llcc_cfg_program(struct platform_device *pdev,
+				 const struct qcom_llcc_config *cfg)
 {
 	int i;
 	u32 sz;
@@ -380,7 +404,7 @@ static int qcom_llcc_cfg_program(struct platform_device *pdev)
 	llcc_table = drv_data->cfg;
 
 	for (i = 0; i < sz; i++) {
-		ret = _qcom_llcc_cfg_program(&llcc_table[i]);
+		ret = _qcom_llcc_cfg_program(&llcc_table[i], cfg);
 		if (ret)
 			return ret;
 	}
@@ -488,7 +512,7 @@ static int qcom_llcc_probe(struct platform_device *pdev)
 	mutex_init(&drv_data->lock);
 	platform_set_drvdata(pdev, drv_data);
 
-	ret = qcom_llcc_cfg_program(pdev);
+	ret = qcom_llcc_cfg_program(pdev, cfg);
 	if (ret)
 		goto err;
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

