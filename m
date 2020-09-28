Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D15627A7B1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Sep 2020 08:38:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726613AbgI1GiV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Sep 2020 02:38:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726513AbgI1GiV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Sep 2020 02:38:21 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 140C1C0613CE;
        Sun, 27 Sep 2020 23:38:21 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id o20so5933pfp.11;
        Sun, 27 Sep 2020 23:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4BsT30it0uqVB1WMYTnRzRInhOP9DiMllB30Hf1GBMc=;
        b=G3rybhcS1SH9bwJ4tVWLrGwn2MQphTWU1S5C/QyTbUk+mAEcCpKN8EbP7LQZ9Rp8No
         s5G54j/6KtPNuy8C/Ex3NwfyiJr1A+nbBepFRf++TNBBeD9PXEoM6UGz9R7H5VvR4xY1
         t5irZFrjhe5NYkswtb+p/hg77pWYfgwBvs5noUNtw2AW0ac3G0x9NokpNaXFVm5CDMi5
         4mH7yzJZvV+lsYdE7ucVBCTkVlFIt8tsvp9oKtbGxN6frqqBRLrAEez88EBC2BahjInf
         l83hpmKJhAd0zQJ4Sx8q9aSYVcpNkpyDzYcCYsyP0/xOdnPN9Zle/RdqxZoDTFZsMatf
         GalQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4BsT30it0uqVB1WMYTnRzRInhOP9DiMllB30Hf1GBMc=;
        b=YGkU8OjgKwDJtB/Se466GCdPHEDquvtBh2kumEyixVNj0Jd+w5biKMm35gCaBXwFn5
         mckmXzAukINi3I2Vf7kNga3srOoPRaXCy5b1OxD2iPPFKMKYZ9VMrmeFRg7XcXOXs7KT
         Qa6ctO5Ogs6yo09J5N3f9RYa9puIxTqxx+kI831qbLfGdeWawRYJBWYvvE7alWTYI68W
         rYvehclPV1tqXFOE9YDXSa+5I2NQHUKT5ZWPM9xml6QyI3q/XCrCXOBqjy29+5rE8j9r
         pOtKxCjfDXVq53zJZV/RiwJ81dR7Wh25jo5NLAIJRN+sdd+TB1MrKTS6PcyRl7bJfqtX
         uOmg==
X-Gm-Message-State: AOAM5335JqZ7hN9y3zAadaywVWWC2+QtxlzdVN2/zoTdcaKDQ2pH2Xy5
        59rkTq41dO4BQX1jGcOzmQOYgk0qY+VG3543
X-Google-Smtp-Source: ABdhPJyxgmFyFSLKz/iCCPDLGbVs1DgwaczFEGBnOyQJvl6b2b0LZG0bNsqw01cruin/PlcQ+T2gBw==
X-Received: by 2002:a62:dd01:0:b029:13c:f607:5fff with SMTP id w1-20020a62dd010000b029013cf6075fffmr203229pff.3.1601275100351;
        Sun, 27 Sep 2020 23:38:20 -0700 (PDT)
Received: from localhost (114-34-18-97.HINET-IP.hinet.net. [114.34.18.97])
        by smtp.gmail.com with ESMTPSA id x3sm67652pgg.54.2020.09.27.23.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2020 23:38:19 -0700 (PDT)
From:   Ajye Huang <ajye.huang@gmail.com>
X-Google-Original-From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
To:     linux-kernel@vger.kernel.org
Cc:     Mark Brown <broonie@kernel.org>,
        Rohit kumar <rohitkr@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Patrick Lai <plai@codeaurora.org>,
        Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, cychiang@chromium.org,
        tzungbi@chromium.org, dianders@chromium.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org,
        Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Subject: [PATCH v1 2/2] ASoC: qcom: sc7180: Modify machine driver for 2mic
Date:   Mon, 28 Sep 2020 14:37:44 +0800
Message-Id: <20200928063744.525700-3-ajye_huang@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200928063744.525700-1-ajye_huang@compal.corp-partner.google.com>
References: <20200928063744.525700-1-ajye_huang@compal.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In addition, having mixer control to switch between DMICs for
"qcom,sc7180-sndcard-rt5682-m98357-2mic" 2mic case.

Refer to this one as an example,
commit b7a742cff3f6 ("ASoC: AMD: Use mixer control to switch between DMICs")

Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
---
This patch depends on this patch series
https://patchwork.kernel.org/patch/11773223/ .


 sound/soc/qcom/sc7180.c | 60 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/sound/soc/qcom/sc7180.c b/sound/soc/qcom/sc7180.c
index 0e90448523b0..c8751fb9f9bf 100644
--- a/sound/soc/qcom/sc7180.c
+++ b/sound/soc/qcom/sc7180.c
@@ -5,6 +5,8 @@
 // sc7180.c -- ALSA SoC Machine driver for SC7180
 
 #include <dt-bindings/sound/sc7180-lpass.h>
+#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
@@ -24,6 +26,9 @@
 // This will be defined in include/dt-bindings/sound/sc7180-lpass.h
 #define LPASS_DP_RX 2
 
+static struct gpio_desc *dmic_sel;
+static int dmic_switch;
+
 struct sc7180_snd_data {
 	struct snd_soc_card card;
 	u32 pri_mi2s_clk_count;
@@ -170,6 +175,23 @@ static int sc7180_snd_startup(struct snd_pcm_substream *substream)
 	return 0;
 }
 
+static int dmic_get(struct snd_kcontrol *kcontrol,
+		    struct snd_ctl_elem_value *ucontrol)
+{
+	ucontrol->value.integer.value[0] = dmic_switch;
+	return 0;
+}
+
+static int dmic_set(struct snd_kcontrol *kcontrol,
+		    struct snd_ctl_elem_value *ucontrol)
+{
+	if (dmic_sel) {
+		dmic_switch = ucontrol->value.integer.value[0];
+		gpiod_set_value(dmic_sel, dmic_switch);
+	}
+	return 0;
+}
+
 static void sc7180_snd_shutdown(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
@@ -207,6 +229,30 @@ static const struct snd_soc_dapm_widget sc7180_snd_widgets[] = {
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
 };
 
+static const char * const dmic_mux_text[] = {
+	"Front Mic",
+	"Rear Mic",
+};
+
+static SOC_ENUM_SINGLE_DECL(sc7180_dmic_enum,
+			    SND_SOC_NOPM, 0, dmic_mux_text);
+
+static const struct snd_kcontrol_new sc7180_dmic_mux_control =
+	SOC_DAPM_ENUM_EXT("DMIC Select Mux", sc7180_dmic_enum,
+			  dmic_get, dmic_set);
+
+static const struct snd_soc_dapm_widget sc7180_snd_dual_mic_widgets[] = {
+	SND_SOC_DAPM_HP("Headphone Jack", NULL),
+	SND_SOC_DAPM_MIC("Headset Mic", NULL),
+	SND_SOC_DAPM_MIC("DMIC", NULL),
+	SND_SOC_DAPM_MUX("Dmic Mux", SND_SOC_NOPM, 0, 0, &sc7180_dmic_mux_control),
+};
+
+static const struct snd_soc_dapm_route sc7180_snd_dual_mic_audio_route[] = {
+	{"Dmic Mux", "Front Mic", "DMIC"},
+	{"Dmic Mux", "Rear Mic", "DMIC"},
+};
+
 static void sc7180_add_ops(struct snd_soc_card *card)
 {
 	struct snd_soc_dai_link *link;
@@ -238,6 +284,19 @@ static int sc7180_snd_platform_probe(struct platform_device *pdev)
 	card->dapm_widgets = sc7180_snd_widgets;
 	card->num_dapm_widgets = ARRAY_SIZE(sc7180_snd_widgets);
 
+	if (of_device_is_compatible(dev->of_node, "qcom,sc7180-sndcard-rt5682-m98357-2mic")) {
+		card->dapm_widgets = sc7180_snd_dual_mic_widgets,
+		card->num_dapm_widgets = ARRAY_SIZE(sc7180_snd_dual_mic_widgets),
+		card->dapm_routes = sc7180_snd_dual_mic_audio_route,
+		card->num_dapm_routes = ARRAY_SIZE(sc7180_snd_dual_mic_audio_route),
+		dmic_sel = devm_gpiod_get(&pdev->dev, "dmic", GPIOD_OUT_LOW);
+		if (IS_ERR(dmic_sel)) {
+			dev_err(&pdev->dev, "DMIC gpio failed err=%d\n",
+				PTR_ERR(dmic_sel));
+				return PTR_ERR(dmic_sel);
+		}
+	}
+
 	ret = qcom_snd_parse_of(card);
 	if (ret)
 		return ret;
@@ -249,6 +308,7 @@ static int sc7180_snd_platform_probe(struct platform_device *pdev)
 
 static const struct of_device_id sc7180_snd_device_id[]  = {
 	{ .compatible = "qcom,sc7180-sndcard-rt5682-m98357-1mic" },
+	{ .compatible = "qcom,sc7180-sndcard-rt5682-m98357-2mic" },
 	{},
 };
 MODULE_DEVICE_TABLE(of, sc7180_snd_device_id);
-- 
2.25.1

