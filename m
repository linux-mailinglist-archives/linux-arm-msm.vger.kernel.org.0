Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 805552AFEF9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Nov 2020 06:43:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728159AbgKLFeV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Nov 2020 00:34:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728656AbgKLBqT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Nov 2020 20:46:19 -0500
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17476C061A47
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2020 17:43:59 -0800 (PST)
Received: by mail-pf1-x441.google.com with SMTP id x15so1685516pfm.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2020 17:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=T0cFLEEzOBFqtPRqMbrgxpfYm1hPATc5ZUJsnwS3q7c=;
        b=LgjrYdJr7PcK+o197Nr+M5YH81CU1kOQf2n6pwsvQRiOxMXmItm5chnTeozaAoJ0Q4
         SxG/HgzFyozp3Og4Uif7goQ54o8689RbQEAhI1ILXi3+Q8GdvxlHRIDf1gDhPyUdzqVM
         oXcvYE0eA5TcEi3KVaF6rmQgmkLcHtSLG9Y99caQWnsnl99fKAEAf6BEcJsTtqwddOqC
         uf22xYAnyAW481MGFegKkOgaVXiVbXJeFLcPpLcBDNlirbysgj8ZPzpdc18opa3Cv7Zd
         zrs9ObKES1hLHIPdk39FXE7W3Yp5U3mzu2s1QLOVX0x7ymmxHQmetvNme4G9DH6Zj2VP
         JwDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T0cFLEEzOBFqtPRqMbrgxpfYm1hPATc5ZUJsnwS3q7c=;
        b=L9QOC0VBzpb/VrbuD7rUWTijEqYDEWT4qsOqTaaYRTy0xuui0In/GrXVHxZ7/7fotl
         OpaPKimEq0YvMnRh4gI+tmdvfI/xfL8SbvJ/hnyFgm2NL5RVygrwl4v70UBRC37hZP6g
         2mhj4pCKYb1Fx2wj/WeEDtHMUAqwKWue7+d7iUtlnqQaE8WHfCPXxP7UikReKzSAflir
         JvGBFyr6JqpnrO7cE0pXu5YgqQLsdWmWM6+WWoH1+Sty/brAE4j7MUNFZwkRpbbVZVd9
         a6uBbBO39EEjuhIHP2Zd6sLRrBGWGTMuGPmLt5SnGphThtg5716jDlqvFcvY3+5K1M0V
         Adaw==
X-Gm-Message-State: AOAM530JhxC3Ny4OTRVJIib6Hkb/Yv5MEP8M5TfcRug/xTFz49YwGuYj
        c5qnIf4980LIZSlVlR6wNkqS
X-Google-Smtp-Source: ABdhPJxhXBXAQ6Jc8mv7FpRXR4ISG3WBs0ZhHALrJYJpygtGndZHImr5i3ZP86b31Evg5crtBLGF8A==
X-Received: by 2002:a62:804d:0:b029:18b:9bf:2979 with SMTP id j74-20020a62804d0000b029018b09bf2979mr8087291pfd.11.1605145438665;
        Wed, 11 Nov 2020 17:43:58 -0800 (PST)
Received: from xuyuqing-ZenBook-UX425JA-UX425JA.huaqin.com ([101.78.151.194])
        by smtp.gmail.com with ESMTPSA id m6sm4062413pfa.61.2020.11.11.17.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 17:43:58 -0800 (PST)
From:   xuyuqing <xuyuqing@huaqin.corp-partner.google.com>
To:     linux-kernel@vger.kernel.org
Cc:     Mark Brown <broonie@kernel.org>, Taniya Das <tdas@codeaurora.org>,
        Rohit kumar <rohitkr@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Patrick Lai <plai@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>, dianders@chromium.org,
        dgreid@chromium.org, tzungbi@chromium.org, cychiang@chromium.org,
        judyhsiao@chromium.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org,
        zhouguohui@huaqin.corp-partner.google.com,
        xuyuqing@huaqin.corp-partner.google.com
Subject: [PATCH v2 2/2] ASoC: qcom: sc7180: Modify machine driver for sound card
Date:   Thu, 12 Nov 2020 09:43:28 +0800
Message-Id: <20201112014328.695232-3-xuyuqing@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201112014328.695232-1-xuyuqing@huaqin.corp-partner.google.com>
References: <20201112014328.695232-1-xuyuqing@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Bypass set jack because there is no jack on coachz.
Create route for dmic.

Signed-off-by: xuyuqing <xuyuqing@huaqin.corp-partner.google.com>
---
 sound/soc/qcom/Kconfig  |  1 +
 sound/soc/qcom/sc7180.c | 86 ++++++++++++++++++++++++++++++++++-------
 2 files changed, 74 insertions(+), 13 deletions(-)

diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
index 41cb08bd5588..27f93006be96 100644
--- a/sound/soc/qcom/Kconfig
+++ b/sound/soc/qcom/Kconfig
@@ -145,6 +145,7 @@ config SND_SOC_SC7180
 	select SND_SOC_LPASS_SC7180
 	select SND_SOC_MAX98357A
 	select SND_SOC_RT5682_I2C
+	select SND_SOC_ADAU7002
 	help
 	  To add support for audio on Qualcomm Technologies Inc.
 	  SC7180 SoC-based systems.
diff --git a/sound/soc/qcom/sc7180.c b/sound/soc/qcom/sc7180.c
index 878fd0169aab..e2e6567566af 100644
--- a/sound/soc/qcom/sc7180.c
+++ b/sound/soc/qcom/sc7180.c
@@ -221,16 +221,69 @@ static void sc7180_snd_shutdown(struct snd_pcm_substream *substream)
 	}
 }
 
+static int sc7180_adau7002_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+
+	switch (cpu_dai->id) {
+	case MI2S_PRIMARY:
+		return 0;
+	case MI2S_SECONDARY:
+		return 0;
+	case LPASS_DP_RX:
+		return sc7180_hdmi_init(rtd);
+	default:
+		dev_err(rtd->dev, "%s: invalid dai id 0x%x\n", __func__,
+			cpu_dai->id);
+		return -EINVAL;
+	}
+	return 0;
+}
+
+static int sc7180_adau7002_snd_startup(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+
+	switch (cpu_dai->id) {
+	case MI2S_PRIMARY:
+		snd_soc_dai_set_fmt(codec_dai,
+				    SND_SOC_DAIFMT_CBS_CFS |
+				    SND_SOC_DAIFMT_NB_NF |
+				    SND_SOC_DAIFMT_I2S);
+
+		break;
+	case MI2S_SECONDARY:
+		break;
+	case LPASS_DP_RX:
+		break;
+	default:
+		dev_err(rtd->dev, "%s: invalid dai id 0x%x\n", __func__,
+			cpu_dai->id);
+		return -EINVAL;
+	}
+	return 0;
+}
+
 static const struct snd_soc_ops sc7180_ops = {
 	.startup = sc7180_snd_startup,
 	.shutdown = sc7180_snd_shutdown,
 };
 
+static const struct snd_soc_ops sc7180_adau7002_ops = {
+	.startup = sc7180_adau7002_snd_startup,
+};
+
 static const struct snd_soc_dapm_widget sc7180_snd_widgets[] = {
 	SND_SOC_DAPM_HP("Headphone Jack", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
 };
 
+static const struct snd_soc_dapm_widget sc7180_adau7002_snd_widgets[] = {
+	SND_SOC_DAPM_MIC("DMIC", NULL),
+};
+
 static const char * const dmic_mux_text[] = {
 	"Front Mic",
 	"Rear Mic",
@@ -255,23 +308,15 @@ static const struct snd_soc_dapm_route sc7180_snd_dual_mic_audio_route[] = {
 	{"Dmic Mux", "Rear Mic", "DMIC"},
 };
 
-static void sc7180_add_ops(struct snd_soc_card *card)
-{
-	struct snd_soc_dai_link *link;
-	int i;
-
-	for_each_card_prelinks(card, i, link) {
-		link->ops = &sc7180_ops;
-		link->init = sc7180_init;
-	}
-}
-
 static int sc7180_snd_platform_probe(struct platform_device *pdev)
 {
 	struct snd_soc_card *card;
 	struct sc7180_snd_data *data;
 	struct device *dev = &pdev->dev;
+	struct snd_soc_dai_link *link;
 	int ret;
+	int i;
+	bool no_headphone;
 
 	/* Allocate the private data */
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
@@ -299,17 +344,32 @@ static int sc7180_snd_platform_probe(struct platform_device *pdev)
 		}
 	}
 
+	if (of_device_is_compatible(dev->of_node, "google,sc7180-coachz")) {
+		no_headphone = true;
+		card->dapm_widgets = sc7180_adau7002_snd_widgets;
+		card->num_dapm_widgets = ARRAY_SIZE(sc7180_adau7002_snd_widgets);
+	}
+
 	ret = qcom_snd_parse_of(card);
 	if (ret)
 		return ret;
 
-	sc7180_add_ops(card);
+	for_each_card_prelinks(card, i, link) {
+		if (no_headphone) {
+			link->ops = &sc7180_adau7002_ops;
+			link->init = sc7180_adau7002_init;
+		} else {
+			link->ops = &sc7180_ops;
+			link->init = sc7180_init;
+		}
+	}
 
 	return devm_snd_soc_register_card(dev, card);
 }
 
 static const struct of_device_id sc7180_snd_device_id[]  = {
-	{ .compatible = "google,sc7180-trogdor"},
+	{.compatible = "google,sc7180-trogdor"},
+	{.compatible = "google,sc7180-coachz"},
 	{},
 };
 MODULE_DEVICE_TABLE(of, sc7180_snd_device_id);
-- 
2.25.1

