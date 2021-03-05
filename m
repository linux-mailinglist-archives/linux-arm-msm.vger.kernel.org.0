Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C6C132DE76
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Mar 2021 01:52:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231463AbhCEAwT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Mar 2021 19:52:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231430AbhCEAwS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Mar 2021 19:52:18 -0500
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBC68C061756
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 Mar 2021 16:52:16 -0800 (PST)
Received: by mail-qk1-x72c.google.com with SMTP id d20so434599qkc.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Mar 2021 16:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cgOQi/vVU6ZZA3ZTTPU47X1SZKTsVoK9deRtexYnDh0=;
        b=cTpqXglB2XTwF2LgJ/l2DHTGzF2gQGj7D/nJUkOvhpdAd+2h1jPY3p4tCfZNj5yY+e
         7zOrCbBN6lt9lhLX06eLXdrqYwSeDO5mPPLt2LzT01lMbwAR8m3y3YZ5o883v5JLqoZN
         0bq0/PaKCVK5rbc03Ru3/h4s6uGkw2gHP/rts200u3N1T241DDe7EJJrBOVtZzB5xUMV
         VYReP5acG+DYkUszKAHC1XyKLSG6N4FvkHlnFxbvppb5M/MqkQDZy4/6udaf/7DubcBR
         NaJvudSE/73zC+d6Pr7NQO4ywzjgm9c/6rC3w5q97DzxXlx/BH2EE+27XtG+kxmKL+aw
         dDmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cgOQi/vVU6ZZA3ZTTPU47X1SZKTsVoK9deRtexYnDh0=;
        b=sQRJunZzd6MwVwRw88DdeDXaC5QS23WfXMc+2ZcJBw4C/2wf3hShuqMU9UvqbMHut1
         lGL2tcOJ4c7jgly8RlQphxY7/kZQtV8Tg5jGVWIvYwkyy9Ygy/3A8y4d+YZjtyhlUwdq
         eMw/RgwqKL5cMx8hGnwNrDdNtxlHiz5M8O0Ky9bExQe0DNHFmHreMtK9woDkEuNouLdO
         nwt061tXFh6QiBPjc+BV5zf37k6V1CyIi4nnHLcXRNW1QsYl3/eANTJclCoFSU/pYINU
         2F6eL77NpjXYjcmpDKaKWjBvmaTnqK0T15YEPd0EE/4NtFG3V4RbMPvxZYLQ/61EF3PC
         7OPg==
X-Gm-Message-State: AOAM531T58Hu/3ZCw4DumdiOlOOYaZwFACBH5t5AEGV6DoCBN26ykkrB
        OJWPTDNIxGNJ2JaarrI+GSrtwpfvOT7EH1Z0
X-Google-Smtp-Source: ABdhPJwV2DQk5G1xaNKIxBVw8PIYkhGkjDXsi5yohmD/k0nUgCRzjx31VeKi18H2T/lLHZqWiSqxgQ==
X-Received: by 2002:a05:620a:799:: with SMTP id 25mr7288891qka.182.1614905535831;
        Thu, 04 Mar 2021 16:52:15 -0800 (PST)
Received: from localhost.localdomain (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id n67sm754456qkb.35.2021.03.04.16.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Mar 2021 16:52:15 -0800 (PST)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        alsa-devel@alsa-project.org (moderated list:QCOM AUDIO (ASoC) DRIVERS),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ASoC: codecs: lpass-wsa-macro: fix RX MIX input controls
Date:   Thu,  4 Mar 2021 19:50:48 -0500
Message-Id: <20210305005049.24726-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Attempting to use the RX MIX path at 48kHz plays at 96kHz, because these
controls are incorrectly toggling the first bit of the register, which
is part of the FS_RATE field.

Fix the problem by using the same method used by the "WSA RX_MIX EC0_MUX"
control, which is to use SND_SOC_NOPM as the register and use an enum in
the shift field instead.

Fixes: 2c4066e5d428 ("ASoC: codecs: lpass-wsa-macro: add dapm widgets and route")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 sound/soc/codecs/lpass-wsa-macro.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index f399f4dff5511..bd2561f9fb9fa 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -1211,14 +1211,16 @@ static int wsa_macro_enable_mix_path(struct snd_soc_dapm_widget *w,
 				     struct snd_kcontrol *kcontrol, int event)
 {
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
-	u16 gain_reg;
+	u16 path_reg, gain_reg;
 	int val;
 
-	switch (w->reg) {
-	case CDC_WSA_RX0_RX_PATH_MIX_CTL:
+	switch (w->shift) {
+	case WSA_MACRO_RX_MIX0:
+		path_reg = CDC_WSA_RX0_RX_PATH_MIX_CTL;
 		gain_reg = CDC_WSA_RX0_RX_VOL_MIX_CTL;
 		break;
-	case CDC_WSA_RX1_RX_PATH_MIX_CTL:
+	case WSA_MACRO_RX_MIX1:
+		path_reg = CDC_WSA_RX1_RX_PATH_MIX_CTL;
 		gain_reg = CDC_WSA_RX1_RX_VOL_MIX_CTL;
 		break;
 	default:
@@ -1231,7 +1233,7 @@ static int wsa_macro_enable_mix_path(struct snd_soc_dapm_widget *w,
 		snd_soc_component_write(component, gain_reg, val);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
-		snd_soc_component_update_bits(component, w->reg,
+		snd_soc_component_update_bits(component, path_reg,
 					      CDC_WSA_RX_PATH_MIX_CLK_EN_MASK,
 					      CDC_WSA_RX_PATH_MIX_CLK_DISABLE);
 		break;
@@ -2068,14 +2070,14 @@ static const struct snd_soc_dapm_widget wsa_macro_dapm_widgets[] = {
 	SND_SOC_DAPM_MUX("WSA_RX0 INP0", SND_SOC_NOPM, 0, 0, &rx0_prim_inp0_mux),
 	SND_SOC_DAPM_MUX("WSA_RX0 INP1", SND_SOC_NOPM, 0, 0, &rx0_prim_inp1_mux),
 	SND_SOC_DAPM_MUX("WSA_RX0 INP2", SND_SOC_NOPM, 0, 0, &rx0_prim_inp2_mux),
-	SND_SOC_DAPM_MUX_E("WSA_RX0 MIX INP", CDC_WSA_RX0_RX_PATH_MIX_CTL,
-			   0, 0, &rx0_mix_mux, wsa_macro_enable_mix_path,
+	SND_SOC_DAPM_MUX_E("WSA_RX0 MIX INP", SND_SOC_NOPM, WSA_MACRO_RX_MIX0,
+			   0, &rx0_mix_mux, wsa_macro_enable_mix_path,
 			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
 	SND_SOC_DAPM_MUX("WSA_RX1 INP0", SND_SOC_NOPM, 0, 0, &rx1_prim_inp0_mux),
 	SND_SOC_DAPM_MUX("WSA_RX1 INP1", SND_SOC_NOPM, 0, 0, &rx1_prim_inp1_mux),
 	SND_SOC_DAPM_MUX("WSA_RX1 INP2", SND_SOC_NOPM, 0, 0, &rx1_prim_inp2_mux),
-	SND_SOC_DAPM_MUX_E("WSA_RX1 MIX INP", CDC_WSA_RX1_RX_PATH_MIX_CTL,
-			   0, 0, &rx1_mix_mux, wsa_macro_enable_mix_path,
+	SND_SOC_DAPM_MUX_E("WSA_RX1 MIX INP", SND_SOC_NOPM, WSA_MACRO_RX_MIX1,
+			   0, &rx1_mix_mux, wsa_macro_enable_mix_path,
 			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
 
 	SND_SOC_DAPM_MIXER_E("WSA_RX INT0 MIX", SND_SOC_NOPM, 0, 0, NULL, 0,
-- 
2.26.1

