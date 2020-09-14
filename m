Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29987268702
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Sep 2020 10:17:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726221AbgINIRC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Sep 2020 04:17:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726200AbgINIGj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Sep 2020 04:06:39 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64B6FC06178C
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2020 01:06:34 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id x123so11947246pfc.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2020 01:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kvYixO51YaoIO33ChNYvtKOsnVvLnU5BAv+BZxGwFTk=;
        b=UI38tQauwF6q/wy3vIaTpWa9FzMTPPbkRy6jgAxA1eVpTRTDQInb3jTx+mjcTzDT71
         9WgexA+O7RC/r+onSXavWRA+9cpFpymCIRPZ3kGtOBPRfmuz7jYbMtLeY07qZ3k0wC/y
         mcdYMgrM0p1KEkm19ZtcaWvHPqlzRAa/5MmgI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kvYixO51YaoIO33ChNYvtKOsnVvLnU5BAv+BZxGwFTk=;
        b=oHbe2gesq/Gu9Nz7wuxYyUTnOR903Wg/ubcWzIQZ0Dr2WnY3C8SmPXP5om/VrdkzDW
         7Ii7200cva7+7PcqpItw9KPl3hNm8DKayT+dceoIJZeyjDSW+veAY2O3cbfgxzrIUbkC
         tc7pNNQ3FHxBVxK1+yJMriKagkJ0Z/Lg4qaN+7QYml4m7AzARUxqsv4vZ2xcnb+xNstI
         QwQwwsgpfHiOwU9XQnCd/cWgWuxXQtdQzGgxi8cpNqRQtkLV2b0ev4R3lt7XnoYASQVK
         EDU+4oAg8nr7/TSa7Ojm78Bc9BuwM0SenLrTWvGBn05WBnWtQuHguqR+FOmhpZVdH1As
         kTLQ==
X-Gm-Message-State: AOAM530hR9Q5yefj4JBlHexT6VqH9BBHttd0NknMJag2Jee1+UJo0Hsz
        Fq4qeo/oaIWTlL4bzQTCns6zPQ==
X-Google-Smtp-Source: ABdhPJxXip/mDqRJZQ3wAaqFs+DCYW6KnkAccG+NI5GgXGbIsFmEFXolowhXK2+k4gruFv3zUIv5SQ==
X-Received: by 2002:a65:685a:: with SMTP id q26mr873651pgt.28.1600070793902;
        Mon, 14 Sep 2020 01:06:33 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:de4a:3eff:fe7d:d39c])
        by smtp.gmail.com with ESMTPSA id e10sm6323101pjj.32.2020.09.14.01.06.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2020 01:06:33 -0700 (PDT)
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
        Heiko Stuebner <heiko@sntech.de>,
        Srinivasa Rao <srivasam@codeaurora.org>, dianders@chromium.org,
        dgreid@chromium.org, tzungbi@chromium.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org,
        Cheng-Yi Chiang <cychiang@chromium.org>,
        Tzung-Bi Shih <tzungbi@google.com>
Subject: [PATCH v11 1/3] ASoC: hdmi-codec: Use set_jack ops to set jack
Date:   Mon, 14 Sep 2020 16:06:17 +0800
Message-Id: <20200914080619.4178587-2-cychiang@chromium.org>
X-Mailer: git-send-email 2.28.0.618.gf4bc123cb7-goog
In-Reply-To: <20200914080619.4178587-1-cychiang@chromium.org>
References: <20200914080619.4178587-1-cychiang@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use set_jack ops to set jack so machine drivers do not need to include
hdmi-codec.h explicitly.

Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
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
index 8c6f540533ba..403d4c6a49a8 100644
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
+static int hdmi_codec_set_jack(struct snd_soc_component *component,
+			       struct snd_soc_jack *jack,
+			       void *data)
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
+	.set_jack		= hdmi_codec_set_jack,
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
2.28.0.618.gf4bc123cb7-goog

