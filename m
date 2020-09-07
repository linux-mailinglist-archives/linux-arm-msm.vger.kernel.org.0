Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 000ED25F721
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Sep 2020 12:01:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728596AbgIGKBF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Sep 2020 06:01:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728579AbgIGKA5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Sep 2020 06:00:57 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADACAC061756
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2020 03:00:57 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id k13so2309382plk.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2020 03:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2nWlloeWe4+nv6hVrTbPWUl2P9w8K0JESAZLCRmELVU=;
        b=ZSFhT/G0q2ZaK8YsX7jmEYkhDH+k8OV7xGmjBtvpTzk3L39iAumjSbh4Axz8veUrI1
         zbtz8cidopzd53DfFCwBiLaW9GeSIXA49tQhOlPKtK30jJV2Yg7j72ll/sD1XJfplKrS
         AxpoKTS6ly9EvBwPZ/5OZ+U4tj7GTMQmaAlDU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2nWlloeWe4+nv6hVrTbPWUl2P9w8K0JESAZLCRmELVU=;
        b=Ea2JeMNkOMDQFHu8g1ec5EDiygD7iOi2UQuR4qxIjxXPiYKgSGtfqHpPtC3VSpqyVE
         dZuoqmpuRgTUAza/Vz0YUGhgtLId1SPlP/fhRybEiWmGzGqXVinyaBiptJzuT8qPj0vF
         smQ3l8yUVxsywWGMmghlmhf9JiMLVzAawR5FsvThb4YA5JzzOhHE/k3oqSWfUlcRCo+3
         nIifwmG71nrR0P7LVMXGGQwheoCU7Ej57u5eT4bGHQ48cWjlaqAcmwLrNLD/MB3Urs2m
         f8USNbTUEB9zFN7t1dEIo/4KJ/aXnhomJapYwT0KhWS1dOqQnSVoG+rNUDzutjWsi2DJ
         oXrA==
X-Gm-Message-State: AOAM533VXt+0CetNydjaKbKifjBodYmvlE96FCNLDKBCKaV54wdYOC1Z
        B3ECAlwpan3jP+QaX/ap9/zffg==
X-Google-Smtp-Source: ABdhPJyzkGLS8a+7KSSGTBGA/HS6YOR6NLj9qpJjgdERmm+21vDaW83cz9pHjsM1Ewzm/k9QXh/Q8Q==
X-Received: by 2002:a17:902:d709:: with SMTP id w9mr17541295ply.117.1599472857215;
        Mon, 07 Sep 2020 03:00:57 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:de4a:3eff:fe7d:d39c])
        by smtp.gmail.com with ESMTPSA id g17sm11882180pjl.30.2020.09.07.03.00.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2020 03:00:56 -0700 (PDT)
From:   Cheng-Yi Chiang <cychiang@chromium.org>
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
        Stephan Gerhold <stephan@gerhold.net>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>, dianders@chromium.org,
        dgreid@chromium.org, tzungbi@chromium.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org,
        Cheng-Yi Chiang <cychiang@chromium.org>
Subject: [PATCH v7 1/3] ASoC: hdmi-codec: Use set_jack ops to set jack
Date:   Mon,  7 Sep 2020 18:00:37 +0800
Message-Id: <20200907100039.1731457-2-cychiang@chromium.org>
X-Mailer: git-send-email 2.28.0.526.ge36021eeef-goog
In-Reply-To: <20200907100039.1731457-1-cychiang@chromium.org>
References: <20200907100039.1731457-1-cychiang@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use set_jack ops to set jack so machine drivers do not need to include
hdmi-codec.h explicitly.

Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
---
 include/sound/hdmi-codec.h                           |  3 ---
 sound/soc/codecs/hdmi-codec.c                        | 12 ++++--------
 sound/soc/mediatek/mt8173/mt8173-rt5650.c            |  5 ++---
 sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c   |  5 ++---
 .../mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c |  5 ++---
 sound/soc/rockchip/rockchip_max98090.c               |  3 +--
 6 files changed, 11 insertions(+), 22 deletions(-)

diff --git a/include/sound/hdmi-codec.h b/include/sound/hdmi-codec.h
index 7754631a3102..b55970859a13 100644
--- a/include/sound/hdmi-codec.h
+++ b/include/sound/hdmi-codec.h
@@ -117,9 +117,6 @@ struct hdmi_codec_pdata {
 struct snd_soc_component;
 struct snd_soc_jack;
 
-int hdmi_codec_set_jack_detect(struct snd_soc_component *component,
-			       struct snd_soc_jack *jack);
-
 #define HDMI_CODEC_DRV_NAME "hdmi-audio-codec"
 
 #endif /* __HDMI_CODEC_H__ */
diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index 8c6f540533ba..d1de5bcd5daa 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -698,13 +698,9 @@ static void plugged_cb(struct device *dev, bool plugged)
 		hdmi_codec_jack_report(hcp, 0);
 }
 
-/**
- * hdmi_codec_set_jack_detect - register HDMI plugged callback
- * @component: the hdmi-codec instance
- * @jack: ASoC jack to report (dis)connection events on
- */
-int hdmi_codec_set_jack_detect(struct snd_soc_component *component,
-			       struct snd_soc_jack *jack)
+static int hdmi_codec_set_jack_detect(struct snd_soc_component *component,
+				      struct snd_soc_jack *jack,
+				      void *data)
 {
 	struct hdmi_codec_priv *hcp = snd_soc_component_get_drvdata(component);
 	int ret = -EOPNOTSUPP;
@@ -720,7 +716,6 @@ int hdmi_codec_set_jack_detect(struct snd_soc_component *component,
 	}
 	return ret;
 }
-EXPORT_SYMBOL_GPL(hdmi_codec_set_jack_detect);
 
 static int hdmi_dai_spdif_probe(struct snd_soc_dai *dai)
 {
@@ -806,6 +801,7 @@ static const struct snd_soc_component_driver hdmi_driver = {
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
 	.non_legacy_dai_naming	= 1,
+	.set_jack		= hdmi_codec_set_jack_detect,
 };
 
 static int hdmi_codec_probe(struct platform_device *pdev)
diff --git a/sound/soc/mediatek/mt8173/mt8173-rt5650.c b/sound/soc/mediatek/mt8173/mt8173-rt5650.c
index 347b095d478d..c28ebf891cb0 100644
--- a/sound/soc/mediatek/mt8173/mt8173-rt5650.c
+++ b/sound/soc/mediatek/mt8173/mt8173-rt5650.c
@@ -11,7 +11,6 @@
 #include <linux/of_gpio.h>
 #include <sound/soc.h>
 #include <sound/jack.h>
-#include <sound/hdmi-codec.h>
 #include "../../codecs/rt5645.h"
 
 #define MCLK_FOR_CODECS		12288000
@@ -154,8 +153,8 @@ static int mt8173_rt5650_hdmi_init(struct snd_soc_pcm_runtime *rtd)
 	if (ret)
 		return ret;
 
-	return hdmi_codec_set_jack_detect(asoc_rtd_to_codec(rtd, 0)->component,
-					  &mt8173_rt5650_hdmi_jack);
+	return snd_soc_component_set_jack(asoc_rtd_to_codec(rtd, 0)->component,
+					  &mt8173_rt5650_hdmi_jack, NULL);
 }
 
 enum {
diff --git a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
index 06d0a4f80fc1..e53c6200d5a7 100644
--- a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
@@ -10,7 +10,6 @@
 #include <linux/module.h>
 #include <linux/of_device.h>
 #include <linux/pinctrl/consumer.h>
-#include <sound/hdmi-codec.h>
 #include <sound/jack.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
@@ -369,8 +368,8 @@ static int mt8183_da7219_max98357_hdmi_init(struct snd_soc_pcm_runtime *rtd)
 	if (ret)
 		return ret;
 
-	return hdmi_codec_set_jack_detect(asoc_rtd_to_codec(rtd, 0)->component,
-					  &priv->hdmi_jack);
+	return snd_soc_component_set_jack(asoc_rtd_to_codec(rtd, 0)->component,
+					  &priv->hdmi_jack, NULL);
 }
 
 static struct snd_soc_dai_link mt8183_da7219_dai_links[] = {
diff --git a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
index 07410d7afaa9..327dfad41e31 100644
--- a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
@@ -9,7 +9,6 @@
 #include <linux/module.h>
 #include <linux/of_device.h>
 #include <linux/pinctrl/consumer.h>
-#include <sound/hdmi-codec.h>
 #include <sound/jack.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
@@ -350,8 +349,8 @@ mt8183_mt6358_ts3a227_max98357_hdmi_init(struct snd_soc_pcm_runtime *rtd)
 	if (ret)
 		return ret;
 
-	return hdmi_codec_set_jack_detect(asoc_rtd_to_codec(rtd, 0)->component,
-					  &priv->hdmi_jack);
+	return snd_soc_component_set_jack(asoc_rtd_to_codec(rtd, 0)->component,
+					  &priv->hdmi_jack, NULL);
 }
 
 static struct snd_soc_dai_link mt8183_mt6358_ts3a227_dai_links[] = {
diff --git a/sound/soc/rockchip/rockchip_max98090.c b/sound/soc/rockchip/rockchip_max98090.c
index 9acfd024aa5d..c8f1a28a92b7 100644
--- a/sound/soc/rockchip/rockchip_max98090.c
+++ b/sound/soc/rockchip/rockchip_max98090.c
@@ -12,7 +12,6 @@
 #include <linux/gpio.h>
 #include <linux/of_gpio.h>
 #include <sound/core.h>
-#include <sound/hdmi-codec.h>
 #include <sound/jack.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
@@ -238,7 +237,7 @@ static int rk_hdmi_init(struct snd_soc_pcm_runtime *runtime)
 		return ret;
 	}
 
-	return hdmi_codec_set_jack_detect(component, &rk_hdmi_jack);
+	return snd_soc_component_set_jack(component, &rk_hdmi_jack, NULL);
 }
 
 /* max98090 dai_link */
-- 
2.28.0.526.ge36021eeef-goog

