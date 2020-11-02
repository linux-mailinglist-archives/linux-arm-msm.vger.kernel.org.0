Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 291A52A24C5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Nov 2020 07:24:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727990AbgKBGYb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Nov 2020 01:24:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727826AbgKBGYa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Nov 2020 01:24:30 -0500
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2BF0C0617A6;
        Sun,  1 Nov 2020 22:24:30 -0800 (PST)
Received: by mail-pl1-x641.google.com with SMTP id j5so6330922plk.7;
        Sun, 01 Nov 2020 22:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MAJnFss+8YqpgdzXd2h0YDHLM++nuYC1QpV+6xW1bs0=;
        b=BJJtCf2DTq9wwFtyTheu27SYm9gCalSl6N2TqhNR+aZK8vwS07NMFAa5erIUQdTKYx
         r25nq9XZnoPiCtbotUy5ZEPtwKATRhgWygvqImIEcV2d7kODHJQFUCJ/mrKbWkL2rJAZ
         R2qnfcnZP2ZzuiMqoZMG2Nkc/EhjHbz9Z2ODUtMhYp7QM5IW9KztuZPDLJWj40tbm87B
         JiSCh982cZkw7Rsa4hw5OmQVwkqtJUB3mOywU4st+LKDqePADz366LWb8so9B5OATqKA
         7n0fe1sJYFJTLCSkFLV9cbPQ+XW9hOPukkpOChET9bG3sPYzsEconefvB49TYoz2KRkT
         BV2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MAJnFss+8YqpgdzXd2h0YDHLM++nuYC1QpV+6xW1bs0=;
        b=ewz+KbZXabICqIiSKhru0pH5UwJ6FA+S2cggzelBhgZWvQXfOjmqE1bQI3tJCiVxbM
         aK5KeQ/5tNls3s/l5MgUCC1v1QpDGRZY/w5ZtUrsaxQ45cKm84GJi+bt3f8k4gN4wZe1
         ijoLGbhepHYdaR/yT2GuaLkBeur/yAbsArsTrqz4k46RZ+AvZa7EterVkFFme+jbE6gQ
         DTGxI5pWet47tEfmV7K4OIz6dl/6EVKtamz6OfdJoZdMAsyCf+NaT0sxsY9uH8b0dD/K
         YpbbLiwFp3jFhMUfJww9pDsSB0gVLXSFM/0sA70E9+Ch8gWTd7ym1bHsE6lZoMCt2TUo
         XtIg==
X-Gm-Message-State: AOAM532+g1iOczfgB5ZxXIL/aEerHDEFDsqlrnucwuoHgyWwmkJTDYjS
        tMD7p5p0hvD+brxPsMvNHFZ+XIjp9H5KGA==
X-Google-Smtp-Source: ABdhPJxJmzfuoZBZ9msfzTg04DFyYCC2ZSN8DgjJyvOKiy2m5h0rtFGKPC8R592V/QUVs7M0ZifiMw==
X-Received: by 2002:a17:902:864b:b029:d3:ce46:2829 with SMTP id y11-20020a170902864bb02900d3ce462829mr20574853plt.16.1604298270218;
        Sun, 01 Nov 2020 22:24:30 -0800 (PST)
Received: from localhost (114-34-18-97.HINET-IP.hinet.net. [114.34.18.97])
        by smtp.gmail.com with ESMTPSA id q8sm12197245pfg.118.2020.11.01.22.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2020 22:24:29 -0800 (PST)
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
Subject: [PATCH v3 2/2] ASoC: qcom: sc7180: Modify machine driver for 2mic
Date:   Mon,  2 Nov 2020 14:24:08 +0800
Message-Id: <20201102062408.331572-3-ajye_huang@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201102062408.331572-1-ajye_huang@compal.corp-partner.google.com>
References: <20201102062408.331572-1-ajye_huang@compal.corp-partner.google.com>
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
 sound/soc/qcom/sc7180.c | 65 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/sound/soc/qcom/sc7180.c b/sound/soc/qcom/sc7180.c
index b391f64c3a80..f86db7871999 100644
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
@@ -169,6 +173,30 @@ static int sc7180_snd_startup(struct snd_pcm_substream *substream)
 	return 0;
 }
 
+static int dmic_get(struct snd_kcontrol *kcontrol,
+		    struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kcontrol);
+	struct sc7180_snd_data *data = snd_soc_card_get_drvdata(dapm->card);
+
+	if (data)
+		ucontrol->value.integer.value[0] = data->dmic_switch;
+	return 0;
+}
+
+static int dmic_set(struct snd_kcontrol *kcontrol,
+		    struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kcontrol);
+	struct sc7180_snd_data *data = snd_soc_card_get_drvdata(dapm->card);
+
+	if (data) {
+		data->dmic_switch = ucontrol->value.integer.value[0];
+		gpiod_set_value(data->dmic_sel, data->dmic_switch);
+	}
+	return 0;
+}
+
 static void sc7180_snd_shutdown(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
@@ -206,6 +234,30 @@ static const struct snd_soc_dapm_widget sc7180_snd_widgets[] = {
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
@@ -238,6 +290,19 @@ static int sc7180_snd_platform_probe(struct platform_device *pdev)
 	card->dapm_widgets = sc7180_snd_widgets;
 	card->num_dapm_widgets = ARRAY_SIZE(sc7180_snd_widgets);
 
+	if (of_property_read_bool(dev->of_node, "dmic-gpios")) {
+		card->dapm_widgets = sc7180_snd_dual_mic_widgets,
+		card->num_dapm_widgets = ARRAY_SIZE(sc7180_snd_dual_mic_widgets),
+		card->dapm_routes = sc7180_snd_dual_mic_audio_route,
+		card->num_dapm_routes = ARRAY_SIZE(sc7180_snd_dual_mic_audio_route),
+		data->dmic_sel = devm_gpiod_get(&pdev->dev, "dmic", GPIOD_OUT_LOW);
+		if (IS_ERR(data->dmic_sel)) {
+			dev_err(&pdev->dev, "DMIC gpio failed err=%d\n",
+				PTR_ERR(data->dmic_sel));
+				return PTR_ERR(data->dmic_sel);
+		}
+	}
+
 	ret = qcom_snd_parse_of(card);
 	if (ret)
 		return ret;
-- 
2.25.1

