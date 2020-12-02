Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C42AB2CC395
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Dec 2020 18:27:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389088AbgLBRXv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Dec 2020 12:23:51 -0500
Received: from m42-5.mailgun.net ([69.72.42.5]:11897 "EHLO m42-5.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389093AbgLBRXv (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Dec 2020 12:23:51 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606929806; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=QFFA23qy7oqkdGBf28tQidTCwbPKMD40FeR8cTpAYlU=; b=FagzQGrk3b9KkEN1nKbGpQ1FbcbJa99T5M0Y4sadVddnV9pNfFBEcby6P99D6bNU0+ygKwcJ
 2F8eN9hI3xEeY5r18bOkKQjbK+Yor52g4qR65kP6f8GltYkXYlDtXy3/OSfCa5ivq9PHQEJw
 1gaJnpdrkhSnn0KaOcVBRBwKA9I=
X-Mailgun-Sending-Ip: 69.72.42.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 5fc7cd6b07535c81bab9b826 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 02 Dec 2020 17:22:51
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A0825C43467; Wed,  2 Dec 2020 17:22:51 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from hyd-lnxbld210.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E9D7CC43464;
        Wed,  2 Dec 2020 17:22:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E9D7CC43464
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=srivasam@codeaurora.org
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        srinivas.kandagatla@linaro.org, rohitkr@codeaurora.org,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        V Sujith Kumar Reddy <vsujithk@codeaurora.org>
Subject: [PATCH v5 1/2] ASoC: qcom: Fix incorrect volatile registers
Date:   Wed,  2 Dec 2020 22:52:27 +0530
Message-Id: <1606929748-16828-2-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606929748-16828-1-git-send-email-srivasam@codeaurora.org>
References: <1606929748-16828-1-git-send-email-srivasam@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

MI2S and DMA control registers are not volatile,
so remove these from volatile registers list.
Registers reset state check by reading non volatile registers
makes no use, so remove error check from cpu and platform
trigger callbacks.

Fixes commit b1824968221cc ("ASoC: qcom: Fix enabling BCLK and LRCLK in LPAIF invalid state")

Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
---
 sound/soc/qcom/lpass-cpu.c      | 20 ++------------------
 sound/soc/qcom/lpass-platform.c | 11 -----------
 2 files changed, 2 insertions(+), 29 deletions(-)

diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index af684fd..c5e99c2 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -270,18 +270,6 @@ static int lpass_cpu_daiops_trigger(struct snd_pcm_substream *substream,
 	struct lpaif_i2sctl *i2sctl = drvdata->i2sctl;
 	unsigned int id = dai->driver->id;
 	int ret = -EINVAL;
-	unsigned int val = 0;
-
-	ret = regmap_read(drvdata->lpaif_map,
-				LPAIF_I2SCTL_REG(drvdata->variant, dai->driver->id), &val);
-	if (ret) {
-		dev_err(dai->dev, "error reading from i2sctl reg: %d\n", ret);
-		return ret;
-	}
-	if (val == LPAIF_I2SCTL_RESET_STATE) {
-		dev_err(dai->dev, "error in i2sctl register state\n");
-		return -ENOTRECOVERABLE;
-	}
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
@@ -454,20 +442,16 @@ static bool lpass_cpu_regmap_volatile(struct device *dev, unsigned int reg)
 	struct lpass_variant *v = drvdata->variant;
 	int i;
 
-	for (i = 0; i < v->i2s_ports; ++i)
-		if (reg == LPAIF_I2SCTL_REG(v, i))
-			return true;
 	for (i = 0; i < v->irq_ports; ++i)
 		if (reg == LPAIF_IRQSTAT_REG(v, i))
 			return true;
 
 	for (i = 0; i < v->rdma_channels; ++i)
-		if (reg == LPAIF_RDMACURR_REG(v, i) || reg == LPAIF_RDMACTL_REG(v, i))
+		if (reg == LPAIF_RDMACURR_REG(v, i))
 			return true;
 
 	for (i = 0; i < v->wrdma_channels; ++i)
-		if (reg == LPAIF_WRDMACURR_REG(v, i + v->wrdma_channel_start) ||
-			reg == LPAIF_WRDMACTL_REG(v, i + v->wrdma_channel_start))
+		if (reg == LPAIF_WRDMACURR_REG(v, i + v->wrdma_channel_start))
 			return true;
 
 	return false;
diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
index 80b09de..0e71899 100644
--- a/sound/soc/qcom/lpass-platform.c
+++ b/sound/soc/qcom/lpass-platform.c
@@ -452,7 +452,6 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
 	unsigned int reg_irqclr = 0, val_irqclr = 0;
 	unsigned int  reg_irqen = 0, val_irqen = 0, val_mask = 0;
 	unsigned int dai_id = cpu_dai->driver->id;
-	unsigned int dma_ctrl_reg = 0;
 
 	ch = pcm_data->dma_ch;
 	if (dir ==  SNDRV_PCM_STREAM_PLAYBACK) {
@@ -469,17 +468,7 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
 		id = pcm_data->dma_ch - v->wrdma_channel_start;
 		map = drvdata->lpaif_map;
 	}
-	ret = regmap_read(map, LPAIF_DMACTL_REG(v, ch, dir, dai_id), &dma_ctrl_reg);
-	if (ret) {
-		dev_err(soc_runtime->dev, "error reading from rdmactl reg: %d\n", ret);
-		return ret;
-	}
 
-	if (dma_ctrl_reg == LPAIF_DMACTL_RESET_STATE ||
-		dma_ctrl_reg == LPAIF_DMACTL_RESET_STATE + 1) {
-		dev_err(soc_runtime->dev, "error in rdmactl register state\n");
-		return -ENOTRECOVERABLE;
-	}
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

