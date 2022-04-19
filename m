Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F87950647A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Apr 2022 08:30:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234545AbiDSGdU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Apr 2022 02:33:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232856AbiDSGdT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Apr 2022 02:33:19 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20685140C8
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Apr 2022 23:30:37 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id t13so23118016pgn.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Apr 2022 23:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IGmYqg606kAg3pvf8xUnL9K7oIiJlnNVadVtLgVbgco=;
        b=RWkdh0fWRj03OC2HBnrauhCncJUjSGJ0AeHUpDr5r/cb7UVOAeXm8EQztSLv93EFEL
         D00g3C3lKxXGUGhNdXhnatXICWxg7LPef+A6Cx/445cmyUV/U40i9vfzpDbbbhTxVuby
         tJ/TZ618PcIYJVvFBrQcn/KAAAqZbf4iXF99U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IGmYqg606kAg3pvf8xUnL9K7oIiJlnNVadVtLgVbgco=;
        b=GbOX6v6EzezvuY9QI0dHROhE216ZjKH0eCh5lnV24LS/QvkyB8YUDoQtQNbgSZlLBA
         QyMxJyx5cEvH5ZiMMhQulMMCfkdmU1zbVn2LNl2NF+pcLA3skw/2WmFVLKxiP98HjTjS
         XiVsllkpmqv8KiPRDRpG5FvzPHFlnAh+EIZfZ3+jepGBcoo7PTTGyQ+bvsgOaPaAO7q5
         asOb1vjIifrG7ZpMp9dSAzYm6rBq919T5lYoyRQ2cUBjFhQ7Xl5eziglgxKVeowMcale
         0aK9evSS6yBIZ/PZ8ct9W2tahlYB3Je5RNAmf+heZ9U+/8QeTS6DLiMzH+0lxklpXU6M
         TAfQ==
X-Gm-Message-State: AOAM5325xsCMB4OT5JUeAab1+Q/8Sxwok7dSUC1qJnWM2AnijaMdQpGh
        R6qQLQObQAGr7LbsIP3kMYANqg==
X-Google-Smtp-Source: ABdhPJy7pNWUWctP7Lv46n/YF3SODEnZqNA23wE38kIGlBCogjWCsgKW/AUcTAlCjeXacJM37KLXkw==
X-Received: by 2002:a05:6a00:2392:b0:4fa:dcd2:5bc1 with SMTP id f18-20020a056a00239200b004fadcd25bc1mr16242411pfc.8.1650349836670;
        Mon, 18 Apr 2022 23:30:36 -0700 (PDT)
Received: from judyhsiao-p920.tpe.corp.google.com ([2401:fa00:1:17:ff0b:b586:d329:c4f4])
        by smtp.gmail.com with ESMTPSA id n14-20020a17090a394e00b001c670d67b8esm15037041pjf.32.2022.04.18.23.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Apr 2022 23:30:36 -0700 (PDT)
From:   Judy Hsiao <judyhsiao@chromium.org>
To:     broonie@kernel.org
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, dianders@chromium.org,
        cychiang@google.com, yuhsuan@chromium.org, judyhsiao@google.com,
        swboyd@chromium.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, Judy Hsiao <judyhsiao@chromium.org>
Subject: [v1] ASoC: qcom: Use MCLK as RT5682I-VS sysclk source
Date:   Tue, 19 Apr 2022 14:29:52 +0800
Message-Id: <20220419062952.356017-1-judyhsiao@chromium.org>
X-Mailer: git-send-email 2.36.0.rc0.470.gd361397f0d-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Both MCLK and BCLK can be the clock source of sysclk via PLL
according to its datasheet.
This patch sets MCLK as the clock source as we use MCLK in the
previous projects.

Fixes: c5198db82d4c ("ASoC: qcom: Add driver support for ALC5682I-VS")
Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
---
 sound/soc/qcom/sc7280.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/qcom/sc7280.c b/sound/soc/qcom/sc7280.c
index 4ef4034ba6ee..dfcb7ed44331 100644
--- a/sound/soc/qcom/sc7280.c
+++ b/sound/soc/qcom/sc7280.c
@@ -21,7 +21,7 @@
 #include "lpass.h"
 
 #define DEFAULT_MCLK_RATE              19200000
-#define RT5682_PLL1_FREQ (48000 * 512)
+#define RT5682_PLL_FREQ (48000 * 512)
 
 struct sc7280_snd_data {
 	struct snd_soc_card card;
@@ -137,15 +137,15 @@ static int sc7280_rt5682_init(struct snd_soc_pcm_runtime *rtd)
 				SND_SOC_DAIFMT_NB_NF |
 				SND_SOC_DAIFMT_I2S);
 
-	ret = snd_soc_dai_set_pll(codec_dai, RT5682S_PLL1, RT5682S_PLL_S_BCLK1,
-					1536000, RT5682_PLL1_FREQ);
+	ret = snd_soc_dai_set_pll(codec_dai, RT5682S_PLL2, RT5682S_PLL_S_MCLK,
+					DEFAULT_MCLK_RATE, RT5682_PLL_FREQ);
 	if (ret) {
 		dev_err(rtd->dev, "can't set codec pll: %d\n", ret);
 		return ret;
 	}
 
-	ret = snd_soc_dai_set_sysclk(codec_dai, RT5682S_SCLK_S_PLL1,
-					RT5682_PLL1_FREQ,
+	ret = snd_soc_dai_set_sysclk(codec_dai, RT5682S_SCLK_S_PLL2,
+					RT5682_PLL_FREQ,
 					SND_SOC_CLOCK_IN);
 
 	if (ret) {
-- 
2.36.0.rc0.470.gd361397f0d-goog

