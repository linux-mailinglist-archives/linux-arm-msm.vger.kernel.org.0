Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A2F530B7D5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Feb 2021 07:31:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231987AbhBBG3h (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Feb 2021 01:29:37 -0500
Received: from mail29.static.mailgun.info ([104.130.122.29]:12549 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231908AbhBBG27 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Feb 2021 01:28:59 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1612247319; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=t4d4srjb9O8cuvbHKvxP3tMfBWF01KKcSjaLhMt8Gww=; b=NNAmP+7tLBOktSNIzB39UZHEpAcFcoavLAulLysqphEYJT6jYKw3IiCMmgi44L6/vdByCNIt
 RsYm8prgswxJxm2eSdEbTIylX/2/ttWsYu6J1GxHNLuLSZ2C0RAoNtvnhEVZXjMzt/nWb0XI
 AxnExYuXzPNYWPD6cEe0W8z0xKM=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 6018f0e27a21b36a9d335c96 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 02 Feb 2021 06:27:46
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5B7B8C433CA; Tue,  2 Feb 2021 06:27:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from hyd-lnxbld210.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 157F0C433C6;
        Tue,  2 Feb 2021 06:27:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 157F0C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=srivasam@codeaurora.org
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        srinivas.kandagatla@linaro.org, rohitkr@codeaurora.org,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        swboyd@chromium.org
Cc:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Subject: [PATCH] ASoC: qcom: Fix typo error in HDMI regmap config callbacks
Date:   Tue,  2 Feb 2021 11:57:27 +0530
Message-Id: <20210202062727.22469-1-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Had a typo in lpass platform driver that resulted in crash
during suspend/resume with an HDMI dongle connected.

The regmap read/write/volatile regesters validation callbacks in lpass-cpu
were using MI2S rdma_channels count instead of hdmi_rdma_channels.

This typo error causing to read registers from the regmap beyond the length
of the mapping created by ioremap().

This fix avoids the need for reducing number hdmi_rdma_channels,
which is done in
commit 7dfe20ee92f6 ("ASoC: qcom: Fix number of HDMI RDMA channels on sc7180").
So reverting the same.

Fixes: 7cb37b7bd0d3c ("ASoC: qcom: Add support for lpass hdmi driver")

Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
---
 sound/soc/qcom/lpass-cpu.c    | 8 ++++----
 sound/soc/qcom/lpass-sc7180.c | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index a669202e0001..c642e5f8f28c 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -595,7 +595,7 @@ static bool lpass_hdmi_regmap_writeable(struct device *dev, unsigned int reg)
 			return true;
 	}
 
-	for (i = 0; i < v->rdma_channels; ++i) {
+	for (i = 0; i < v->hdmi_rdma_channels; ++i) {
 		if (reg == LPAIF_HDMI_RDMACTL_REG(v, i))
 			return true;
 		if (reg == LPAIF_HDMI_RDMABASE_REG(v, i))
@@ -641,7 +641,7 @@ static bool lpass_hdmi_regmap_readable(struct device *dev, unsigned int reg)
 	if (reg == LPASS_HDMITX_APP_IRQSTAT_REG(v))
 		return true;
 
-	for (i = 0; i < v->rdma_channels; ++i) {
+	for (i = 0; i < v->hdmi_rdma_channels; ++i) {
 		if (reg == LPAIF_HDMI_RDMACTL_REG(v, i))
 			return true;
 		if (reg == LPAIF_HDMI_RDMABASE_REG(v, i))
@@ -668,7 +668,7 @@ static bool lpass_hdmi_regmap_volatile(struct device *dev, unsigned int reg)
 	if (reg == LPASS_HDMI_TX_LEGACY_ADDR(v))
 		return true;
 
-	for (i = 0; i < v->rdma_channels; ++i) {
+	for (i = 0; i < v->hdmi_rdma_channels; ++i) {
 		if (reg == LPAIF_HDMI_RDMACURR_REG(v, i))
 			return true;
 	}
@@ -812,7 +812,7 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
 			return PTR_ERR(drvdata->hdmiif);
 
 		lpass_hdmi_regmap_config.max_register = LPAIF_HDMI_RDMAPER_REG(variant,
-					variant->hdmi_rdma_channels);
+					variant->hdmi_rdma_channels - 1);
 		drvdata->hdmiif_map = devm_regmap_init_mmio(dev, drvdata->hdmiif,
 					&lpass_hdmi_regmap_config);
 		if (IS_ERR(drvdata->hdmiif_map)) {
diff --git a/sound/soc/qcom/lpass-sc7180.c b/sound/soc/qcom/lpass-sc7180.c
index 735c9dac28f2..8c168d3c589e 100644
--- a/sound/soc/qcom/lpass-sc7180.c
+++ b/sound/soc/qcom/lpass-sc7180.c
@@ -171,7 +171,7 @@ static struct lpass_variant sc7180_data = {
 	.rdma_channels		= 5,
 	.hdmi_rdma_reg_base		= 0x64000,
 	.hdmi_rdma_reg_stride	= 0x1000,
-	.hdmi_rdma_channels		= 3,
+	.hdmi_rdma_channels		= 4,
 	.dmactl_audif_start	= 1,
 	.wrdma_reg_base		= 0x18000,
 	.wrdma_reg_stride	= 0x1000,
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

