Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B02D72689CD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Sep 2020 13:14:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725999AbgINLOA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Sep 2020 07:14:00 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:37979 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726046AbgINLNz (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Sep 2020 07:13:55 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1600082035; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=sPC9CWn/37xRSsQF+K5LCg2oEa94RAHPCbBMYYd492U=; b=WXQjd5wLW+we3GBB/TWflslxZ0Kyk1+52Z0eLUgSKV/CAvUakpVE8TNpsNv1gTbeAkAtTTgg
 5cnW3l+fCUBB0V1GXpkA2UdwBpl043oLufv7GcMauZD7WB+EbiYDUqmhI0U2vYbt18Tea1h2
 KSTw8BN9BqBOWHByNU/EEinh0b0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5f5f506932925f96e1ae7232 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 14 Sep 2020 11:13:45
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C0853C433CA; Mon, 14 Sep 2020 11:13:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4C694C433C8;
        Mon, 14 Sep 2020 11:13:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4C694C433C8
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
Subject: [PATCHv4 2/2] soc: qcom: llcc: Support chipsets that can write to llcc regs
Date:   Mon, 14 Sep 2020 16:43:00 +0530
Message-Id: <84742b96802d94da00006be8d51cadce4ae04f9f.1599974998.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1599974998.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1599974998.git.saiprakash.ranjan@codeaurora.org>
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
(saiprakash.ranjan@codeaurora.org: use existing config and reword commit msg)
Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---
 drivers/soc/qcom/llcc-qcom.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index 60ee31842dea..6aedccff49bb 100644
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
@@ -359,7 +365,8 @@ static int qcom_llcc_attr_cfg(const struct llcc_slice_config *table)
 	return ret;
 }
 
-static int qcom_llcc_cfg_program(struct platform_device *pdev)
+static int qcom_llcc_cfg_program(struct platform_device *pdev,
+				 const struct qcom_llcc_config *cfg)
 {
 	int i;
 	u32 sz;
@@ -375,6 +382,22 @@ static int qcom_llcc_cfg_program(struct platform_device *pdev)
 		if (ret)
 			return ret;
 
+		if (cfg->need_llcc_cfg) {
+			u32 disable_cap_alloc, retain_pc;
+
+			disable_cap_alloc = llcc_table[i].dis_cap_alloc << llcc_table[i].slice_id;
+			ret = regmap_write(drv_data->bcast_regmap,
+					LLCC_TRP_SCID_DIS_CAP_ALLOC, disable_cap_alloc);
+			if (ret)
+				return ret;
+
+			retain_pc = llcc_table[i].retain_on_pc << llcc_table[i].slice_id;
+			ret = regmap_write(drv_data->bcast_regmap,
+					LLCC_TRP_PCB_ACT, retain_pc);
+			if (ret)
+				return ret;
+		}
+
 		if (llcc_table[i].activate_on_init) {
 			desc.slice_id = llcc_table[i].slice_id;
 			ret = llcc_slice_activate(&desc);
@@ -484,7 +507,7 @@ static int qcom_llcc_probe(struct platform_device *pdev)
 	mutex_init(&drv_data->lock);
 	platform_set_drvdata(pdev, drv_data);
 
-	ret = qcom_llcc_cfg_program(pdev);
+	ret = qcom_llcc_cfg_program(pdev, cfg);
 	if (ret)
 		goto err;
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

