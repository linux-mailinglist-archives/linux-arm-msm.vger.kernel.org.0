Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45D3037F70C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 May 2021 13:46:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231394AbhEMLrb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 May 2021 07:47:31 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:28775 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231967AbhEMLra (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 May 2021 07:47:30 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1620906381; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=R3PRA2rUnS5fig4+xW1jrQHWFtxLg10TUka5lgODj/c=; b=VaKAUbIdtcnokDlJVlVa17aM8KdWR2FOApKVornmyQHwBSU5nqK286gZAlrF9xsmHTWIbmHp
 HWKqA/Oahq/+QfbOMl8oD3dISCKnWhW1Gb30vZtjtf9kPxATNvng+dTR3QF1DDCAJpxvytiu
 F/AxyukM2af3YNNi8i7l9HszAOA=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 609d1174c7220f8fd31f5714 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 13 May 2021 11:45:56
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2EB3BC43460; Thu, 13 May 2021 11:45:56 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from hyd-lnxbld210.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1220EC433F1;
        Thu, 13 May 2021 11:45:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1220EC433F1
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
Subject: [PATCH] ASoC: qcom: lpass-cpu: Fix pop noise during audio capture begin
Date:   Thu, 13 May 2021 17:15:39 +0530
Message-Id: <20210513114539.4813-1-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch fixes PoP noise of around 15ms observed during audio capture begin.
Enables BCLK and LRCLK in snd_soc_dai_ops startup call for introducing some delay
before capture start and clock enable.

Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
---
 sound/soc/qcom/lpass-cpu.c | 37 +++++++++++++++++++++++++++++++++----
 1 file changed, 33 insertions(+), 4 deletions(-)

diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index c62d2612e8f5..3dcfc2f115a7 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -73,14 +73,28 @@ static int lpass_cpu_daiops_startup(struct snd_pcm_substream *substream,
 		struct snd_soc_dai *dai)
 {
 	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
-	int ret;
+	struct lpaif_i2sctl *i2sctl = drvdata->i2sctl;
+	unsigned int id = dai->driver->id;
+	int ret = -EINVAL;
 
 	ret = clk_prepare_enable(drvdata->mi2s_osr_clk[dai->driver->id]);
 	if (ret) {
 		dev_err(dai->dev, "error in enabling mi2s osr clk: %d\n", ret);
 		return ret;
 	}
-	ret = clk_prepare(drvdata->mi2s_bit_clk[dai->driver->id]);
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		ret = regmap_fields_write(i2sctl->spken, id,
+						 LPAIF_I2SCTL_SPKEN_ENABLE);
+	} else  {
+		ret = regmap_fields_write(i2sctl->micen, id,
+						 LPAIF_I2SCTL_MICEN_ENABLE);
+	}
+	if (ret)
+		dev_err(dai->dev, "error writing to i2sctl reg: %d\n",
+			ret);
+
+	ret = clk_prepare_enable(drvdata->mi2s_bit_clk[dai->driver->id]);
 	if (ret) {
 		dev_err(dai->dev, "error in enabling mi2s bit clk: %d\n", ret);
 		clk_disable_unprepare(drvdata->mi2s_osr_clk[dai->driver->id]);
@@ -93,9 +107,23 @@ static void lpass_cpu_daiops_shutdown(struct snd_pcm_substream *substream,
 		struct snd_soc_dai *dai)
 {
 	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
+	struct lpaif_i2sctl *i2sctl = drvdata->i2sctl;
+	unsigned int id = dai->driver->id;
+	int ret = -EINVAL;
 
 	clk_disable_unprepare(drvdata->mi2s_osr_clk[dai->driver->id]);
-	clk_unprepare(drvdata->mi2s_bit_clk[dai->driver->id]);
+	clk_disable_unprepare(drvdata->mi2s_bit_clk[dai->driver->id]);
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		ret = regmap_fields_write(i2sctl->spken, id,
+					 LPAIF_I2SCTL_SPKEN_DISABLE);
+	} else  {
+		ret = regmap_fields_write(i2sctl->micen, id,
+					 LPAIF_I2SCTL_MICEN_DISABLE);
+	}
+	if (ret)
+		dev_err(dai->dev, "error writing to i2sctl reg: %d\n",
+				ret);
 }
 
 static int lpass_cpu_daiops_hw_params(struct snd_pcm_substream *substream,
@@ -308,7 +336,8 @@ static int lpass_cpu_daiops_trigger(struct snd_pcm_substream *substream,
 				ret);
 
 		clk_disable(drvdata->mi2s_bit_clk[dai->driver->id]);
-
+		break;
+	default:
 		break;
 	}
 
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

