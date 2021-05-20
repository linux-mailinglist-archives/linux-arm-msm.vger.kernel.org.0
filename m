Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FFD438B1A6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 May 2021 16:25:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234985AbhETO0a (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 May 2021 10:26:30 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:37117 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231791AbhETO03 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 May 2021 10:26:29 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1621520707; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=zyVvMEbw6fGlwBlGsUwf0H2yuUNMPC9CYtNKkDWlN6k=; b=AuWOhTNV92eY1z781kLbNbsG5txJv5HGQUlXe3MLa2b0c4Zz7ya33pJHPe4wZqI0dQ7kOJQ7
 5CU1LjXihAo1Q2RPrNXBDIgUV5ta3l28oarRTLEvDdmzt4ZgM8PzCBWywuNMpy3EAgdEShy+
 cyFojXuu/vAFFvCutwAiaz0f4hU=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 60a6713e60c53c8c9db27821 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 20 May 2021 14:25:02
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8F955C43144; Thu, 20 May 2021 14:25:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from hyd-lnxbld210.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 02868C43460;
        Thu, 20 May 2021 14:24:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 02868C43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=srivasam@codeaurora.org
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        srinivas.kandagatla@linaro.org, rohitkr@codeaurora.org,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        swboyd@chromium.org, judyhsiao@chromium.org
Cc:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Subject: [PATCH v2] ASoC: qcom: lpass-cpu: Fix pop noise during audio capture begin
Date:   Thu, 20 May 2021 19:54:32 +0530
Message-Id: <20210520142432.29869-1-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch fixes PoP noise of around 15ms observed during audio capture begin.
Enables BCLK and LRCLK in snd_soc_dai_ops prepare call for introducing some delay
before capture start and clock enable.

Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
---
Changes Since V1:
	-- Enableed BCLK and LRCLK in dai ops prepare API instead of startup API
	-- Added comments 
	
 sound/soc/qcom/lpass-cpu.c | 48 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 46 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index c62d2612e8f5..c5bb3f16d25f 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -93,9 +93,18 @@ static void lpass_cpu_daiops_shutdown(struct snd_pcm_substream *substream,
 		struct snd_soc_dai *dai)
 {
 	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
+	struct lpaif_i2sctl *i2sctl = drvdata->i2sctl;
+	unsigned int id = dai->driver->id;
 
 	clk_disable_unprepare(drvdata->mi2s_osr_clk[dai->driver->id]);
-	clk_unprepare(drvdata->mi2s_bit_clk[dai->driver->id]);
+	/* To ensure BCLK/LRCLK disabled even in device node validation.
+	  Will not impact if disabled in trigger suspend */
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		regmap_fields_write(i2sctl->spken, id, LPAIF_I2SCTL_SPKEN_DISABLE);
+	else
+		regmap_fields_write(i2sctl->micen, id, LPAIF_I2SCTL_MICEN_DISABLE);
+
+	clk_disable_unprepare(drvdata->mi2s_bit_clk[dai->driver->id]);
 }
 
 static int lpass_cpu_daiops_hw_params(struct snd_pcm_substream *substream,
@@ -275,6 +284,8 @@ static int lpass_cpu_daiops_trigger(struct snd_pcm_substream *substream,
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		/* To ensure lpass BCLK/LRCLK is enabled during
+	   		device resume. Will not impact if enabled in prepare */
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
 			ret = regmap_fields_write(i2sctl->spken, id,
 						 LPAIF_I2SCTL_SPKEN_ENABLE);
@@ -296,6 +307,8 @@ static int lpass_cpu_daiops_trigger(struct snd_pcm_substream *substream,
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		/* To ensure lpass BCLK/LRCLK is disabled during
+	   		device suspend */
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
 			ret = regmap_fields_write(i2sctl->spken, id,
 						 LPAIF_I2SCTL_SPKEN_DISABLE);
@@ -308,19 +321,50 @@ static int lpass_cpu_daiops_trigger(struct snd_pcm_substream *substream,
 				ret);
 
 		clk_disable(drvdata->mi2s_bit_clk[dai->driver->id]);
-
+		break;
+	default:
 		break;
 	}
 
 	return ret;
 }
 
+static int lpass_cpu_daiops_prepare(struct snd_pcm_substream *substream,
+		struct snd_soc_dai *dai)
+{
+	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
+	struct lpaif_i2sctl *i2sctl = drvdata->i2sctl;
+	unsigned int id = dai->driver->id;
+	int ret = -EINVAL;
+	/* To ensure lpass BCLK/LRCLK is enabled bit before
+	   playback/capture data flow starts */
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		ret = regmap_fields_write(i2sctl->spken, id, LPAIF_I2SCTL_SPKEN_ENABLE);
+	else
+		ret = regmap_fields_write(i2sctl->micen, id, LPAIF_I2SCTL_MICEN_ENABLE);
+
+	if (ret)
+		dev_err(dai->dev, "error writing to i2sctl reg: %d\n",
+	       ret);
+
+	ret = clk_enable(drvdata->mi2s_bit_clk[id]);
+
+	if (ret) {
+		dev_err(dai->dev, "error in enabling mi2s bit clk: %d\n", ret);
+		clk_disable(drvdata->mi2s_osr_clk[id]);
+		return ret;
+	}
+	return 0;
+}
+
+
 const struct snd_soc_dai_ops asoc_qcom_lpass_cpu_dai_ops = {
 	.set_sysclk	= lpass_cpu_daiops_set_sysclk,
 	.startup	= lpass_cpu_daiops_startup,
 	.shutdown	= lpass_cpu_daiops_shutdown,
 	.hw_params	= lpass_cpu_daiops_hw_params,
 	.trigger	= lpass_cpu_daiops_trigger,
+	.prepare	= lpass_cpu_daiops_prepare,
 };
 EXPORT_SYMBOL_GPL(asoc_qcom_lpass_cpu_dai_ops);
 
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

