Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFD3F2A3AAD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Nov 2020 03:54:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727265AbgKCCyN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Nov 2020 21:54:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725997AbgKCCyN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Nov 2020 21:54:13 -0500
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32F18C0617A6;
        Mon,  2 Nov 2020 18:54:13 -0800 (PST)
Received: by mail-pl1-x644.google.com with SMTP id u2so1926136pls.10;
        Mon, 02 Nov 2020 18:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MZmvUTD8a5qIFa/RrtNuw9Ia5UB2gCWucIEHcm6cBWg=;
        b=dAiYct3LCcMwIUR9xFV0kR3k3PN6NS/o525dQhxgcKavuahk4veX2heP2bUMs+VtWp
         HOUGYrgim2A6fKf4hMqlWit7bvintsMhMMsnijI4G+2LceDp+YVDMxiAjwl8cCNt2O/H
         EJii7+ibaWaPGDaTbeVpsJ10e+OA1P+q4qU68WU1QxRYiQj6p0laXdm2J5DTNNyCO2pW
         bptpjc/uh71HHj0HmymaWaizq3CHktNbi8KDhnNPMOpslGpOdFUAZMAr6vWNrFNagKcp
         bPvBYbYOe4kxjfUu8TKglEXEXzMsJWOzzS2ZSCXMT0dDNleGkFQiBTQSNx3NApvXT7f/
         X/pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MZmvUTD8a5qIFa/RrtNuw9Ia5UB2gCWucIEHcm6cBWg=;
        b=jUBt9IEX2lEEFS0N9CgG/KO4Ko3x3L9XBrSBeGNO96gn7a7twpKRzLvcpbWB/pKq4z
         5PgNCtvkK3Qqxrh/CtV2+tCiwaWWtKkIdSrmlcvC5a5QstB8X5nXghnCs+yx8KjX21Zn
         5GZEjCpQaGdKBPUBNTf6vSaJTCuHJAMjrAgIhhpo/Z9K3YMxILn6xooW15wmq7Q6US6i
         x76Ewb13zB+h+YuaZlDgFreNkf4wwlaE/hsWSNpXJrRznzw6EjGXWGR7GQTB6V4iZcE0
         rARtKPLsjp/FESqlwzLuCIvfBbT2VevHOSs/V2G2jmAh8ZkwdWosyUed0OQZPYvNIwXp
         nYgA==
X-Gm-Message-State: AOAM530B7CDo1HJILUyPSPEc24R9ld9cisMvC4Q+rXXLiTcmqBwt/ipn
        VydfKKIWWIAYl9kpbI9dmTovzDGX4x/DXw==
X-Google-Smtp-Source: ABdhPJyGjthcuzX/2mCMS9kuFEReDkYHnu2MPzpeojpuHsH1wxEjZYGve2ifdjr8vuMnxHlq2Qo2iA==
X-Received: by 2002:a17:902:9886:b029:d6:d25f:7f90 with SMTP id s6-20020a1709029886b02900d6d25f7f90mr5495101plp.41.1604372052440;
        Mon, 02 Nov 2020 18:54:12 -0800 (PST)
Received: from localhost (114-34-18-97.HINET-IP.hinet.net. [114.34.18.97])
        by smtp.gmail.com with ESMTPSA id t10sm876076pjr.37.2020.11.02.18.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 18:54:12 -0800 (PST)
From:   Ajye Huang <ajye.huang@gmail.com>
X-Google-Original-From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
To:     linux-kernel@vger.kernel.org
Cc:     Mark Brown <broonie@kernel.org>,
        Rohit kumar <rohitkr@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Patrick Lai <plai@codeaurora.org>,
        Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        srinivas.kandagatla@linaro.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, cychiang@chromium.org,
        tzungbi@chromium.org, dianders@chromium.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org,
        Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Subject: [PATCH v4 2/2] ASoC: qcom: sc7180: Modify machine driver for 2mic
Date:   Tue,  3 Nov 2020 10:53:47 +0800
Message-Id: <20201103025347.510940-3-ajye_huang@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201103025347.510940-1-ajye_huang@compal.corp-partner.google.com>
References: <20201103025347.510940-1-ajye_huang@compal.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In addition, having mixer control to switch between DMICs by
using "dmic-gpios" property.

Refer to this one as an example,
commit b7a742cff3f6 ("ASoC: AMD: Use mixer control to switch between DMICs")

Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
---
 sound/soc/qcom/sc7180.c | 61 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/sound/soc/qcom/sc7180.c b/sound/soc/qcom/sc7180.c
index b391f64c3a80..345489d08886 100644
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
@@ -28,6 +30,8 @@ struct sc7180_snd_data {
 	u32 pri_mi2s_clk_count;
 	struct snd_soc_jack hs_jack;
 	struct snd_soc_jack hdmi_jack;
+	struct gpio_desc *dmic_sel;
+	int dmic_switch;
 };
 
 static void sc7180_jack_free(struct snd_jack *jack)
@@ -169,6 +173,27 @@ static int sc7180_snd_startup(struct snd_pcm_substream *substream)
 	return 0;
 }
 
+static int dmic_get(struct snd_kcontrol *kcontrol,
+		    struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kcontrol);
+	struct sc7180_snd_data *data = snd_soc_card_get_drvdata(dapm->card);
+
+	ucontrol->value.integer.value[0] = data->dmic_switch;
+	return 0;
+}
+
+static int dmic_set(struct snd_kcontrol *kcontrol,
+		    struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kcontrol);
+	struct sc7180_snd_data *data = snd_soc_card_get_drvdata(dapm->card);
+
+	data->dmic_switch = ucontrol->value.integer.value[0];
+	gpiod_set_value(data->dmic_sel, data->dmic_switch);
+	return 0;
+}
+
 static void sc7180_snd_shutdown(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
@@ -206,6 +231,30 @@ static const struct snd_soc_dapm_widget sc7180_snd_widgets[] = {
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
@@ -238,6 +287,18 @@ static int sc7180_snd_platform_probe(struct platform_device *pdev)
 	card->dapm_widgets = sc7180_snd_widgets;
 	card->num_dapm_widgets = ARRAY_SIZE(sc7180_snd_widgets);
 
+	if (of_property_read_bool(dev->of_node, "dmic-gpios")) {
+		card->dapm_widgets = sc7180_snd_dual_mic_widgets,
+		card->num_dapm_widgets = ARRAY_SIZE(sc7180_snd_dual_mic_widgets),
+		card->dapm_routes = sc7180_snd_dual_mic_audio_route,
+		card->num_dapm_routes = ARRAY_SIZE(sc7180_snd_dual_mic_audio_route),
+		data->dmic_sel = devm_gpiod_get(&pdev->dev, "dmic", GPIOD_OUT_LOW);
+		if (IS_ERR(data->dmic_sel)) {
+			dev_err(&pdev->dev, "DMIC gpio failed err=%d\n", PTR_ERR(data->dmic_sel));
+			return PTR_ERR(data->dmic_sel);
+		}
+	}
+
 	ret = qcom_snd_parse_of(card);
 	if (ret)
 		return ret;
-- 
2.25.1

