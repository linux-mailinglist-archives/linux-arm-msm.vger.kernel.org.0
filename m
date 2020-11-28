Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED2302C703A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Nov 2020 18:57:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733112AbgK1Rzz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 28 Nov 2020 12:55:55 -0500
Received: from z5.mailgun.us ([104.130.96.5]:53893 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732719AbgK1FAF (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 28 Nov 2020 00:00:05 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606539590; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=3DD1BYpF+9SW/CAV4x8bQZJk2llp6RrwWAsrxopZpsw=; b=YsWg4m7TU3qZFcE053vUaWBxOIwO4rGfe1Wh4RW0K7BsAp95SKotAljgucWM08SEY0Rz0/lZ
 m/HQIUaJCi77tCSVVPHpa03Hgnr69gRc2IYK39iPReHNo//EWCieoN1OZhvejQepciT2CJAp
 KGv9geU5PZ1VA/uSkH78mrj+WdQ=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5fc1d93e1dba509aae478028 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 28 Nov 2020 04:59:42
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E2511C43464; Sat, 28 Nov 2020 04:59:42 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from hyd-lnxbld210.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 07451C433C6;
        Sat, 28 Nov 2020 04:59:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 07451C433C6
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
Subject: [PATCH v4 1/2] Partially revert ASoC: qcom: Fix enabling BCLK and LRCLK in LPAIF invalid state
Date:   Sat, 28 Nov 2020 10:29:18 +0530
Message-Id: <1606539559-4277-2-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606539559-4277-1-git-send-email-srivasam@codeaurora.org>
References: <1606539559-4277-1-git-send-email-srivasam@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This reverts part of commit b1824968221c
("ASoC: qcom: Fix enabling BCLK and LRCLK in LPAIF invalid state")

To identify LPAIF invalid state after device suspend and resume,
made I2S and DMA control registers not volatile, which is not necessary.
Instead invalid reg state can be handled with regcache APIs.
The BCLK ref count is necessary to enable clock only it's in disable state.

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

