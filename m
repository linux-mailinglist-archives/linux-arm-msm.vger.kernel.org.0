Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B05A34665F0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Dec 2021 15:57:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347169AbhLBPAi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Dec 2021 10:00:38 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.84]:13158 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347178AbhLBPAh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Dec 2021 10:00:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1638457028;
    s=strato-dkim-0002; d=gerhold.net;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=ISZlpR6q5TTOU01pzGOmn4MD3nIWfwVyycowlhQUl7s=;
    b=XEuEI+T7A7+0dbRXcG7rSBPaP/7UsnZVmazgO2Do8eMu1d2aNoydi5SZZDMKHk+0Ui
    ufypw2b/ooYUeP3zBZYhbvIpus+jlnLtXZLWs5E/eC0EMEPfeObjTwTaQkmswL26fKZp
    V+/uVIp2eeIxIijn5OGGaeBcmI8CKK8+tmOTJ6vl5Hfb+QT2Xiw9zKasLL0iOiQzEZT3
    /TxVYFpy1xC79JkYbzxCB5nU7e8hB1enq53OaN9QaB7JuZ8i1vhRQD/9YIycQNSB+vSX
    fTPm1IiBNypYZpGdESx//2JqLfrclL78VN7wJMUv7zoI7KR6S5OwXfASWvW6mkSrIXQ7
    QLXA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQ7UOGqRde+a0fyLyu9s="
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.34.10 AUTH)
    with ESMTPSA id j03bcbxB2Ev8py0
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Thu, 2 Dec 2021 15:57:08 +0100 (CET)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Mark Brown <broonie@kernel.org>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 5/5] ASoC: qcom: apq8016_sbc: Allow routing audio through QDSP6
Date:   Thu,  2 Dec 2021 15:55:05 +0100
Message-Id: <20211202145505.58852-6-stephan@gerhold.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211202145505.58852-1-stephan@gerhold.net>
References: <20211202145505.58852-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The apq8016-sbc-sndcard is designed to be used with the LPASS drivers
(bypassing the combined audio/modem DSP in MSM8916/APQ8016).
Make it possible to use QDSP6 audio instead for the msm8916-qdsp6-sndcard.

This only requires adding some additional hooks that set up the DPCM
backends correctly. Similar code is already used in drivers for newer
SoCs such as apq8096.c, sdm845.c and sm8250.c.

A slightly different initialization sequence is used for the apq8016-sbc
and msm8916-qdsp6 sound card by defining the apq8016_sbc_add_ops()
function as device match data.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 sound/soc/qcom/apq8016_sbc.c | 134 +++++++++++++++++++++++++++++++++--
 1 file changed, 129 insertions(+), 5 deletions(-)

diff --git a/sound/soc/qcom/apq8016_sbc.c b/sound/soc/qcom/apq8016_sbc.c
index ba2a98268ee4..f9d69375320e 100644
--- a/sound/soc/qcom/apq8016_sbc.c
+++ b/sound/soc/qcom/apq8016_sbc.c
@@ -17,6 +17,9 @@
 #include <uapi/linux/input-event-codes.h>
 #include <dt-bindings/sound/apq8016-lpass.h>
 #include "common.h"
+#include "qdsp6/q6afe.h"
+
+#define MI2S_COUNT  (MI2S_QUATERNARY + 1)
 
 struct apq8016_sbc_data {
 	struct snd_soc_card card;
@@ -24,6 +27,7 @@ struct apq8016_sbc_data {
 	void __iomem *spkr_iomux;
 	struct snd_soc_jack jack;
 	bool jack_setup;
+	int mi2s_clk_count[MI2S_COUNT];
 };
 
 #define MIC_CTRL_TER_WS_SLAVE_SEL	BIT(21)
@@ -38,10 +42,10 @@ struct apq8016_sbc_data {
 #define SPKR_CTL_TLMM_WS_EN_SEL_MASK	GENMASK(19, 18)
 #define SPKR_CTL_TLMM_WS_EN_SEL_SEC	BIT(18)
 #define DEFAULT_MCLK_RATE		9600000
+#define MI2S_BCLK_RATE			1536000
 
-static int apq8016_sbc_dai_init(struct snd_soc_pcm_runtime *rtd)
+static int apq8016_dai_init(struct snd_soc_pcm_runtime *rtd, int mi2s)
 {
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	struct snd_soc_dai *codec_dai;
 	struct snd_soc_component *component;
 	struct snd_soc_card *card = rtd->card;
@@ -49,7 +53,7 @@ static int apq8016_sbc_dai_init(struct snd_soc_pcm_runtime *rtd)
 	int i, rval;
 	u32 value;
 
-	switch (cpu_dai->id) {
+	switch (mi2s) {
 	case MI2S_PRIMARY:
 		writel(readl(pdata->spkr_iomux) | SPKR_CTL_PRI_WS_SLAVE_SEL_11,
 			pdata->spkr_iomux);
@@ -128,6 +132,13 @@ static int apq8016_sbc_dai_init(struct snd_soc_pcm_runtime *rtd)
 	return 0;
 }
 
+static int apq8016_sbc_dai_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+
+	return apq8016_dai_init(rtd, cpu_dai->id);
+}
+
 static void apq8016_sbc_add_ops(struct snd_soc_card *card)
 {
 	struct snd_soc_dai_link *link;
@@ -137,6 +148,113 @@ static void apq8016_sbc_add_ops(struct snd_soc_card *card)
 		link->init = apq8016_sbc_dai_init;
 }
 
+static int qdsp6_dai_get_lpass_id(struct snd_soc_dai *cpu_dai)
+{
+	switch (cpu_dai->id) {
+	case PRIMARY_MI2S_RX:
+	case PRIMARY_MI2S_TX:
+		return MI2S_PRIMARY;
+	case SECONDARY_MI2S_RX:
+	case SECONDARY_MI2S_TX:
+		return MI2S_SECONDARY;
+	case TERTIARY_MI2S_RX:
+	case TERTIARY_MI2S_TX:
+		return MI2S_TERTIARY;
+	case QUATERNARY_MI2S_RX:
+	case QUATERNARY_MI2S_TX:
+		return MI2S_QUATERNARY;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int msm8916_qdsp6_dai_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+
+	snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_CBS_CFS);
+	return apq8016_dai_init(rtd, qdsp6_dai_get_lpass_id(cpu_dai));
+}
+
+static int msm8916_qdsp6_startup(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_card *card = rtd->card;
+	struct apq8016_sbc_data *data = snd_soc_card_get_drvdata(card);
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	int mi2s, ret;
+
+	mi2s = qdsp6_dai_get_lpass_id(cpu_dai);
+	if (mi2s < 0)
+		return mi2s;
+
+	if (++data->mi2s_clk_count[mi2s] > 1)
+		return 0;
+
+	ret = snd_soc_dai_set_sysclk(cpu_dai, LPAIF_BIT_CLK, MI2S_BCLK_RATE, 0);
+	if (ret)
+		dev_err(card->dev, "Failed to enable LPAIF bit clk: %d\n", ret);
+	return ret;
+}
+
+static void msm8916_qdsp6_shutdown(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_card *card = rtd->card;
+	struct apq8016_sbc_data *data = snd_soc_card_get_drvdata(card);
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	int mi2s, ret;
+
+	mi2s = qdsp6_dai_get_lpass_id(cpu_dai);
+	if (mi2s < 0)
+		return;
+
+	if (--data->mi2s_clk_count[mi2s] > 0)
+		return;
+
+	ret = snd_soc_dai_set_sysclk(cpu_dai, LPAIF_BIT_CLK, 0, 0);
+	if (ret)
+		dev_err(card->dev, "Failed to disable LPAIF bit clk: %d\n", ret);
+}
+
+static const struct snd_soc_ops msm8916_qdsp6_be_ops = {
+	.startup = msm8916_qdsp6_startup,
+	.shutdown = msm8916_qdsp6_shutdown,
+};
+
+static int msm8916_qdsp6_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
+					    struct snd_pcm_hw_params *params)
+{
+	struct snd_interval *rate = hw_param_interval(params,
+					SNDRV_PCM_HW_PARAM_RATE);
+	struct snd_interval *channels = hw_param_interval(params,
+					SNDRV_PCM_HW_PARAM_CHANNELS);
+	struct snd_mask *fmt = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
+
+	rate->min = rate->max = 48000;
+	channels->min = channels->max = 2;
+	snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S16_LE);
+
+	return 0;
+}
+
+static void msm8916_qdsp6_add_ops(struct snd_soc_card *card)
+{
+	struct snd_soc_dai_link *link;
+	int i;
+
+	/* Make it obvious to userspace that QDSP6 is used */
+	card->components = "qdsp6";
+
+	for_each_card_prelinks(card, i, link) {
+		if (link->no_pcm) {
+			link->init = msm8916_qdsp6_dai_init;
+			link->ops = &msm8916_qdsp6_be_ops;
+			link->be_hw_params_fixup = msm8916_qdsp6_be_hw_params_fixup;
+		}
+	}
+}
+
 static const struct snd_soc_dapm_widget apq8016_sbc_dapm_widgets[] = {
 
 	SND_SOC_DAPM_MIC("Handset Mic", NULL),
@@ -148,11 +266,16 @@ static const struct snd_soc_dapm_widget apq8016_sbc_dapm_widgets[] = {
 
 static int apq8016_sbc_platform_probe(struct platform_device *pdev)
 {
+	void (*add_ops)(struct snd_soc_card *card);
 	struct device *dev = &pdev->dev;
 	struct snd_soc_card *card;
 	struct apq8016_sbc_data *data;
 	int ret;
 
+	add_ops = device_get_match_data(&pdev->dev);
+	if (!add_ops)
+		return -EINVAL;
+
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
@@ -177,12 +300,13 @@ static int apq8016_sbc_platform_probe(struct platform_device *pdev)
 
 	snd_soc_card_set_drvdata(card, data);
 
-	apq8016_sbc_add_ops(card);
+	add_ops(card);
 	return devm_snd_soc_register_card(&pdev->dev, card);
 }
 
 static const struct of_device_id apq8016_sbc_device_id[] __maybe_unused = {
-	{ .compatible = "qcom,apq8016-sbc-sndcard" },
+	{ .compatible = "qcom,apq8016-sbc-sndcard", .data = apq8016_sbc_add_ops },
+	{ .compatible = "qcom,msm8916-qdsp6-sndcard", .data = msm8916_qdsp6_add_ops },
 	{},
 };
 MODULE_DEVICE_TABLE(of, apq8016_sbc_device_id);
-- 
2.34.1

