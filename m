Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8ED4332DC9F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Mar 2021 22:59:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241203AbhCDV7H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Mar 2021 16:59:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241201AbhCDV6z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Mar 2021 16:58:55 -0500
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F40AC061756
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 Mar 2021 13:58:15 -0800 (PST)
Received: by mail-qk1-x734.google.com with SMTP id b130so17947719qkc.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Mar 2021 13:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Nbze8gCMaDI1IAu3LD9VNB/zoM+54xD6O96EqggyI0s=;
        b=IZjJYUNqOQbo9CYLDbRcg72SwHxQPuq2eSOygLV6vR9RtY3wNlxNYVh7g26gKTKvwt
         mWsJwGMFB7TO7XflIEjcWFfm/NPylMEMCkH8H+qLhwFm6dCZPQgfedOIaxv7Oi/qHF9G
         UacVXBbyE4YNwNWxWnRgCfpPy7asBHKc3MKUrS2v8aRqxsBEsuxZSIQCnr7Bj6GufwhE
         lcSyInQxYjODsYO8xzmJGu/1eMh7n5OXVx2P9O4WZ8deWyiseVdDrjewmZrgtv9+ngRK
         2Fe2o29USbcfSyaXBORZ0igeMGXa7jrQWX5OlF3GYx3qseMIhhl8rCNdikmCBNITh6Hg
         AYLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Nbze8gCMaDI1IAu3LD9VNB/zoM+54xD6O96EqggyI0s=;
        b=r/9PZExrcNvjzUvxbpRxpzv6cW2K+MjW7Djjz4EkVDM/jEWfaEBOx+JeYJ0mhwXWI2
         BU9ZkTtsn9YgghC7DIKpBRAluZlOvFvJASnIVTMUcb5S4qVvdHOQsT0l2o1BrERgQsFQ
         gox+Xb8o2Qli3dCYGZSBjlN5uRuphr8Era3MZz7BGgIb9a5/5gk6TcdvrKAW49HavXVe
         39/OC+948NXh0Z3X7PU/UOyoC1FDqEpuEvUaI6VjTqsNm73kC78AsP7ywIfkZD3hZ9y+
         BHUdbcBy7sTCDYmQgk7WeZ+fU881jIBVHiSQkqSjQA6oI13ev24+OZ/2y2O5F6B6YTnx
         CTHg==
X-Gm-Message-State: AOAM530wYZJTkcO6Z9IDr6UrZWPELcM0D4I2ywuVTmCLuIwq5ZRRjaVf
        wVycH/ulGlTnuxq80U2RoaATt0+Wx7gTpggU
X-Google-Smtp-Source: ABdhPJyFUWcvnNRd82OokzjaRJTgmmSWE/c7ZWKgoh6oN5NNeHBtiFc/KvFGUxbGcE3941wMNT/0Cg==
X-Received: by 2002:a37:9f91:: with SMTP id i139mr6270897qke.72.1614895093854;
        Thu, 04 Mar 2021 13:58:13 -0800 (PST)
Received: from localhost.localdomain (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id m21sm460478qka.28.2021.03.04.13.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Mar 2021 13:58:13 -0800 (PST)
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
Subject: [PATCH] ASoC: codecs: lpass-va-macro: mute/unmute all active decimators
Date:   Thu,  4 Mar 2021 16:56:46 -0500
Message-Id: <20210304215646.17956-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

An interface can have multiple decimators enabled, so loop over all active
decimators. Otherwise only one channel will be unmuted, and other channels
will be zero. This fixes recording from dual DMIC as a single two channel
stream.

Also remove the now unused "active_decimator" field.

Fixes: 908e6b1df26e ("ASoC: codecs: lpass-va-macro: Add support to VA Macro")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 sound/soc/codecs/lpass-va-macro.c | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index 91e6890d6efcb..3d6976a3d9e42 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -189,7 +189,6 @@ struct va_macro {
 	struct device *dev;
 	unsigned long active_ch_mask[VA_MACRO_MAX_DAIS];
 	unsigned long active_ch_cnt[VA_MACRO_MAX_DAIS];
-	unsigned long active_decimator[VA_MACRO_MAX_DAIS];
 	u16 dmic_clk_div;
 
 	int dec_mode[VA_MACRO_NUM_DECIMATORS];
@@ -549,11 +548,9 @@ static int va_macro_tx_mixer_put(struct snd_kcontrol *kcontrol,
 	if (enable) {
 		set_bit(dec_id, &va->active_ch_mask[dai_id]);
 		va->active_ch_cnt[dai_id]++;
-		va->active_decimator[dai_id] = dec_id;
 	} else {
 		clear_bit(dec_id, &va->active_ch_mask[dai_id]);
 		va->active_ch_cnt[dai_id]--;
-		va->active_decimator[dai_id] = -1;
 	}
 
 	snd_soc_dapm_mixer_update_power(widget->dapm, kcontrol, enable, update);
@@ -880,18 +877,19 @@ static int va_macro_digital_mute(struct snd_soc_dai *dai, int mute, int stream)
 	struct va_macro *va = snd_soc_component_get_drvdata(component);
 	u16 tx_vol_ctl_reg, decimator;
 
-	decimator = va->active_decimator[dai->id];
-
-	tx_vol_ctl_reg = CDC_VA_TX0_TX_PATH_CTL +
-				VA_MACRO_TX_PATH_OFFSET * decimator;
-	if (mute)
-		snd_soc_component_update_bits(component, tx_vol_ctl_reg,
-					      CDC_VA_TX_PATH_PGA_MUTE_EN_MASK,
-					      CDC_VA_TX_PATH_PGA_MUTE_EN);
-	else
-		snd_soc_component_update_bits(component, tx_vol_ctl_reg,
-					      CDC_VA_TX_PATH_PGA_MUTE_EN_MASK,
-					      CDC_VA_TX_PATH_PGA_MUTE_DISABLE);
+	for_each_set_bit(decimator, &va->active_ch_mask[dai->id],
+			 VA_MACRO_DEC_MAX) {
+		tx_vol_ctl_reg = CDC_VA_TX0_TX_PATH_CTL +
+					VA_MACRO_TX_PATH_OFFSET * decimator;
+		if (mute)
+			snd_soc_component_update_bits(component, tx_vol_ctl_reg,
+					CDC_VA_TX_PATH_PGA_MUTE_EN_MASK,
+					CDC_VA_TX_PATH_PGA_MUTE_EN);
+		else
+			snd_soc_component_update_bits(component, tx_vol_ctl_reg,
+					CDC_VA_TX_PATH_PGA_MUTE_EN_MASK,
+					CDC_VA_TX_PATH_PGA_MUTE_DISABLE);
+	}
 
 	return 0;
 }
-- 
2.26.1

