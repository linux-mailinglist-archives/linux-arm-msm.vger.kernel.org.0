Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06417458DB5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Nov 2021 12:47:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239309AbhKVLuE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Nov 2021 06:50:04 -0500
Received: from so254-9.mailgun.net ([198.61.254.9]:48631 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239304AbhKVLuE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Nov 2021 06:50:04 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1637581618; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=ZUDvFPbBnLqQUOEhZHSfxSn7mRT8gBANa7FnKL+byww=; b=J2koorky6PudYyALFOETkr3lMwqc4sN8Z0P9Im+G0SnIbKcrhvWQajg9QrUshjGifeTQEDEA
 jcOJRFWxSA8gimCYsD5PmBJpCYgACKJoryQqWx0F8lH76LTv25Dvma6Hc5IBk02cV+lHy1AI
 SsZ37+bMAPMuV9UoXnw/xnrnuM0=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 619b83316bacc185a557e047 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 22 Nov 2021 11:46:57
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C9080C43635; Mon, 22 Nov 2021 11:46:56 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from hu-srivasam-hyd.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 996A8C4338F;
        Mon, 22 Nov 2021 11:46:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 996A8C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        srinivas.kandagatla@linaro.org, rohitkr@codeaurora.org,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        swboyd@chromium.org, judyhsiao@chromium.org
Cc:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        Venkata Prasad Potturu <potturu@codeaurora.org>
Subject: [PATCH v5 05/10] ASoC: qcom: Add helper function to get dma control and lpaif handle
Date:   Mon, 22 Nov 2021 17:16:34 +0530
Message-Id: <1637581599-24120-1-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support function to get dma control and lpaif handle to avoid
repeated code in platform driver

Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Co-developed-by: Venkata Prasad Potturu <potturu@codeaurora.org>
Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
---
 sound/soc/qcom/lpass-platform.c | 90 ++++++++++++++++++++---------------------
 1 file changed, 43 insertions(+), 47 deletions(-)

diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
index a44162c..59c0884 100644
--- a/sound/soc/qcom/lpass-platform.c
+++ b/sound/soc/qcom/lpass-platform.c
@@ -177,6 +177,44 @@ static int lpass_platform_pcmops_close(struct snd_soc_component *component,
 	return 0;
 }
 
+static void __get_lpaif_handle(struct snd_pcm_substream *substream,
+				struct snd_soc_component *component,
+				struct lpaif_dmactl **dmactl, int *id, struct regmap **map)
+{
+	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
+	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
+	struct snd_pcm_runtime *rt = substream->runtime;
+	struct lpass_pcm_data *pcm_data = rt->private_data;
+	struct lpass_variant *v = drvdata->variant;
+	int dir = substream->stream;
+	unsigned int dai_id = cpu_dai->driver->id;
+	struct lpaif_dmactl *l_dmactl;
+	struct regmap *l_map;
+	int l_id;
+
+	if (dir ==  SNDRV_PCM_STREAM_PLAYBACK) {
+		l_id = pcm_data->dma_ch;
+		if (dai_id == LPASS_DP_RX) {
+			l_dmactl = drvdata->hdmi_rd_dmactl;
+			l_map = drvdata->hdmiif_map;
+		} else {
+			l_dmactl = drvdata->rd_dmactl;
+			l_map = drvdata->lpaif_map;
+		}
+	} else {
+		l_dmactl = drvdata->wr_dmactl;
+		l_id = pcm_data->dma_ch - v->wrdma_channel_start;
+		l_map = drvdata->lpaif_map;
+	}
+	if (dmactl)
+		*dmactl = l_dmactl;
+	if (id)
+		*id = l_id;
+	if (map)
+		*map = l_map;
+}
+
 static int lpass_platform_pcmops_hw_params(struct snd_soc_component *component,
 					   struct snd_pcm_substream *substream,
 					   struct snd_pcm_hw_params *params)
@@ -191,22 +229,12 @@ static int lpass_platform_pcmops_hw_params(struct snd_soc_component *component,
 	unsigned int channels = params_channels(params);
 	unsigned int regval;
 	struct lpaif_dmactl *dmactl;
-	int id, dir = substream->stream;
+	int id;
 	int bitwidth;
 	int ret, dma_port = pcm_data->i2s_port + v->dmactl_audif_start;
 	unsigned int dai_id = cpu_dai->driver->id;
 
-	if (dir ==  SNDRV_PCM_STREAM_PLAYBACK) {
-		id = pcm_data->dma_ch;
-		if (dai_id == LPASS_DP_RX)
-			dmactl = drvdata->hdmi_rd_dmactl;
-		else
-			dmactl = drvdata->rd_dmactl;
-
-	} else {
-		dmactl = drvdata->wr_dmactl;
-		id = pcm_data->dma_ch - v->wrdma_channel_start;
-	}
+	__get_lpaif_handle(substream, component, &dmactl, &id, NULL);
 
 	bitwidth = snd_pcm_format_width(format);
 	if (bitwidth < 0) {
@@ -379,24 +407,9 @@ static int lpass_platform_pcmops_prepare(struct snd_soc_component *component,
 	int ret, id, ch, dir = substream->stream;
 	unsigned int dai_id = cpu_dai->driver->id;
 
-
 	ch = pcm_data->dma_ch;
-	if (dir ==  SNDRV_PCM_STREAM_PLAYBACK) {
-		if (dai_id == LPASS_DP_RX) {
-			dmactl = drvdata->hdmi_rd_dmactl;
-			map = drvdata->hdmiif_map;
-		} else {
-			dmactl = drvdata->rd_dmactl;
-			map = drvdata->lpaif_map;
-		}
-
-		id = pcm_data->dma_ch;
-	} else {
-		dmactl = drvdata->wr_dmactl;
-		id = pcm_data->dma_ch - v->wrdma_channel_start;
-		map = drvdata->lpaif_map;
-	}
 
+	__get_lpaif_handle(substream, component, &dmactl, &id, &map);
 	ret = regmap_write(map, LPAIF_DMABASE_REG(v, ch, dir, dai_id),
 				runtime->dma_addr);
 	if (ret) {
@@ -444,26 +457,12 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
 	struct lpaif_dmactl *dmactl;
 	struct regmap *map;
 	int ret, ch, id;
-	int dir = substream->stream;
 	unsigned int reg_irqclr = 0, val_irqclr = 0;
 	unsigned int  reg_irqen = 0, val_irqen = 0, val_mask = 0;
 	unsigned int dai_id = cpu_dai->driver->id;
 
 	ch = pcm_data->dma_ch;
-	if (dir ==  SNDRV_PCM_STREAM_PLAYBACK) {
-		id = pcm_data->dma_ch;
-		if (dai_id == LPASS_DP_RX) {
-			dmactl = drvdata->hdmi_rd_dmactl;
-			map = drvdata->hdmiif_map;
-		} else {
-			dmactl = drvdata->rd_dmactl;
-			map = drvdata->lpaif_map;
-		}
-	} else {
-		dmactl = drvdata->wr_dmactl;
-		id = pcm_data->dma_ch - v->wrdma_channel_start;
-		map = drvdata->lpaif_map;
-	}
+	__get_lpaif_handle(substream, component, &dmactl, &id, &map);
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
@@ -597,10 +596,7 @@ static snd_pcm_uframes_t lpass_platform_pcmops_pointer(
 	struct regmap *map;
 	unsigned int dai_id = cpu_dai->driver->id;
 
-	if (dai_id == LPASS_DP_RX)
-		map = drvdata->hdmiif_map;
-	else
-		map = drvdata->lpaif_map;
+	__get_lpaif_handle(substream, component, NULL, NULL, &map);
 
 	ch = pcm_data->dma_ch;
 
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

