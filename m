Return-Path: <linux-arm-msm+bounces-92551-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cOR6IYXji2kVcgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92551-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 03:03:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BAF120A35
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 03:03:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A48413006805
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 02:03:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AACB82F39CE;
	Wed, 11 Feb 2026 02:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FYFxsPwE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C51F2ECEAE
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 02:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770775427; cv=none; b=PADf653cuLFHE7G2NqIZytqBYVpdV2jJv7zlYaPnAD+bwJJe8roDnkF26Tgnf45a8FlRoCoVYmqdOCpk5tTaTxm+vl5QIfy/AF0829FwC6c0aqtEgo5SN+kbR2Aeh9WYk12qMQfErD6o/MCrcuO9sdBWkMlq3wla9wqI3/KRM6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770775427; c=relaxed/simple;
	bh=EY4BO1esIzW6WkXAlJRYz+1OzcPsW9ZtxwuvdrlbJ5A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cL+SitupNWNTzBdgLocpdHVwzGAclrrN96+RsGFklCosyV3wosm0LLnpL8Ie2jaDP8srXMTtWFLUGMNcuD10NnnfgyTE8xTxmc5z/uKMU4k+9PQ9Gp9nQuYSvpoeKvmpdTlDzdrMmRkp1GNyVMCmocMUYhaGemi9MAH850XYcHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FYFxsPwE; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-505d872f90fso56121081cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 18:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770775425; x=1771380225; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vYsO9VMFUab61ZBhjwug7zpcW4jpZ2h1dPhNlTsioFg=;
        b=FYFxsPwEETaZgl7h1fh4JcjBc5LQJTI/RaFUlvt996Ygl/ONBCt4QnXMf9KUTQiIix
         2to4eePOx96dN5x2zZTwuBYT+VdKjv+Gb9CSFJGYzfVyjUHpjmC+14zmFNHDOq4zhs+D
         eW2U5DY2XAx6SD/SFx3VgmneW8Ew9s+eI/hY/Z9DdOpSBkXuQ2ODblmzs1lbV5m5Pqwl
         Pc6G4+Plkq+O0KfVXq7wn/iPafxPWyfmK+6okepakG6Bj3M643mtshzdEznzT0ej/Hfw
         70cVgN38874/9IjsAN2zuTDdgNXMHZveQ6VEBxUbOtKbHG1V2yrHVEL+3k55AwnzfLW1
         906A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770775425; x=1771380225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vYsO9VMFUab61ZBhjwug7zpcW4jpZ2h1dPhNlTsioFg=;
        b=qNhDaTb89BG36/TMfI3AjU7MVzAeawEc1M728yRYoGv+JE4mqPhN6wlgErbuPkJSSt
         cWJ1kHRU3MR6xQbf76lKZI57icKN+XeVUNxzTK7DiIvvF/jiS+d38tl6dVuyERN8dkUq
         VbQhuAaADHOZbDdnB7si1Zf9YQbioigy3TFZ7Tev7BkD8yKTHJYzLnNCjMDAFfKah3Db
         TnZoFPnG5l21UyQTbtUFnk0LI3uUzrUvqlipWDMcbViCsWFfa4FRaw76SLswQPWTkF+4
         G8WoiJ5/edryVlgr7MF+IkESjfo8wkqOpE6JS19yVeTHdtQTFs/IJoFpVZ4okGiKl6mI
         QGKg==
X-Forwarded-Encrypted: i=1; AJvYcCXy7pFn7a3bxSDSPI/eCdVUjO00Hg2Mk8ys7dAcAgwb/piIHoYOD9XYXvILEMA4L/0ToNCzI4AswBbqoCZs@vger.kernel.org
X-Gm-Message-State: AOJu0Yye3IAva9LbP7ZyGSUWeZwrhuVX5C8vNLB8lc7RFBBF4lZMPQXv
	iP5O6WPxiwIQIYMZmWi5mf9aF7w8u2/fwASu4Z6JRUcAF/aPaYt1ZxBqTBcT+w==
X-Gm-Gg: AZuq6aIIlngcvu16BeyIhVTOwXg2BbshZnKi3oMFc5aWEy0vKPtLpicA2O0OO3ARupN
	wXwNvT+Vn1ejmHlfCLp1SlifRB4zP72iYgSdOmzmH9HtpBgBATm3ZsFO6dlT0GFvTIDYxPJmkxk
	J9VQ098n/YwnURo70cjiA2B3Q0UMEiaGZ/UbhMUS3CQPrXf5eqqnRUvzgcZ6LBazRHDpW8zzKhv
	1XjW3WXP+9YNDzuvFy9PED8ebuxIWCwj2AA07uUm+cRknPQTSbP0vZzQ8ZFTBHOf7ZPhvzouqwp
	HRRnvBKqIZGUCn/s1Hiqd8eyO85PqFSo+ZVDeR5ojiizYPdvhAC3Hwtlg8NlpIPdi6TI3gWK26F
	zaz4QGDE3G33zbnUjtR1YKzFL5ZF1zqe6AozXvlUV5kQLf94LJh/4UtO9wplAb9uy6LOE+6HuFG
	k4969LKjnadCR0KdcY1t/U/s8HlQ==
X-Received: by 2002:a05:622a:43:b0:4f3:57ec:b252 with SMTP id d75a77b69052e-50673d98dabmr44112011cf.48.1770775425044;
        Tue, 10 Feb 2026 18:03:45 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50684b9d5ebsm1446581cf.26.2026.02.10.18.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 18:03:44 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Johan Hovold <johan@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 09/10] ASoC: qcom: add sdm660 internal sound card support
Date: Tue, 10 Feb 2026 21:03:01 -0500
Message-ID: <20260211020302.2674-10-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260211020302.2674-1-mailingradian@gmail.com>
References: <20260211020302.2674-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92551-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com,linuxfoundation.org,quicinc.com,vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[mainlining.org,gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 64BAF120A35
X-Rspamd-Action: no action

The Snapdragon 670 and Snapdragon 660 both share the same drivers for
the sound cards. These different sound cards are tasha, tavil, and
internal. Add support for the internal sound card.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 sound/soc/qcom/Kconfig           |  12 ++
 sound/soc/qcom/Makefile          |   2 +
 sound/soc/qcom/sdm660-internal.c | 271 +++++++++++++++++++++++++++++++
 3 files changed, 285 insertions(+)
 create mode 100644 sound/soc/qcom/sdm660-internal.c

diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
index e6e24f3b9922..86b2778adc1a 100644
--- a/sound/soc/qcom/Kconfig
+++ b/sound/soc/qcom/Kconfig
@@ -167,6 +167,18 @@ config SND_SOC_MSM8996
 	  APQ8096 SoC-based systems.
 	  Say Y if you want to use audio device on this SoCs
 
+config SND_SOC_SDM660_INT
+	tristate "SoC Machine driver for SDM660 and SDM670 boards"
+	depends on QCOM_APR
+	depends on OF
+	depends on PM
+	select SND_SOC_QDSP6
+	select SND_SOC_QCOM_COMMON
+	help
+	  This adds support for audio on Qualcomm Technologies Inc.
+	  SDM660 and SDM670 SoC-based systems.
+	  Say Y if you want to use audio devices on these SoCs.
+
 config SND_SOC_SDM845
 	tristate "SoC Machine driver for SDM845 boards"
 	depends on QCOM_APR && I2C && SOUNDWIRE
diff --git a/sound/soc/qcom/Makefile b/sound/soc/qcom/Makefile
index 985ce2ae286b..9a0da6279299 100644
--- a/sound/soc/qcom/Makefile
+++ b/sound/soc/qcom/Makefile
@@ -24,6 +24,7 @@ snd-soc-apq8016-sbc-y := apq8016_sbc.o
 snd-soc-apq8096-y := apq8096.o
 snd-soc-sc7180-y := sc7180.o
 snd-soc-sc7280-y := sc7280.o
+snd-soc-sdm660-int-y := sdm660-internal.o
 snd-soc-sdm845-y := sdm845.o
 snd-soc-sm8250-y := sm8250.o
 snd-soc-sc8280xp-y := sc8280xp.o
@@ -38,6 +39,7 @@ obj-$(CONFIG_SND_SOC_MSM8996) += snd-soc-apq8096.o
 obj-$(CONFIG_SND_SOC_SC7180) += snd-soc-sc7180.o
 obj-$(CONFIG_SND_SOC_SC7280) += snd-soc-sc7280.o
 obj-$(CONFIG_SND_SOC_SC8280XP) += snd-soc-sc8280xp.o
+obj-$(CONFIG_SND_SOC_SDM660_INT) += snd-soc-sdm660-int.o
 obj-$(CONFIG_SND_SOC_SDM845) += snd-soc-sdm845.o
 obj-$(CONFIG_SND_SOC_SM8250) += snd-soc-sm8250.o
 obj-$(CONFIG_SND_SOC_QCOM_COMMON) += snd-soc-qcom-common.o
diff --git a/sound/soc/qcom/sdm660-internal.c b/sound/soc/qcom/sdm660-internal.c
new file mode 100644
index 000000000000..beb810aa4eb9
--- /dev/null
+++ b/sound/soc/qcom/sdm660-internal.c
@@ -0,0 +1,271 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2015-2020, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2023, Richard Acayan. All rights reserved.
+ */
+
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/jack.h>
+#include <sound/soc.h>
+#include <sound/soc-card.h>
+#include <sound/soc-dai.h>
+#include <sound/soc-dapm.h>
+#include <sound/soc-jack.h>
+
+#include "common.h"
+#include "qdsp6/q6afe.h"
+
+#define DEFAULT_SAMPLE_RATE_48K		48000
+#define DEFAULT_INT_MCLK_RATE		9600000
+#define MI2S_BCLK_RATE			1536000
+
+struct sdm660_int_snd_data {
+	struct snd_soc_jack jack;
+	bool jack_setup;
+	uint32_t int0_mi2s_clk_count;
+	uint32_t int3_mi2s_clk_count;
+};
+
+static int snd_sdm660_int_startup(struct snd_pcm_substream *stream)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(stream);
+	struct sdm660_int_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
+	struct snd_soc_dai *cpu = snd_soc_rtd_to_cpu(rtd, 0);
+
+	switch (cpu->id) {
+	case INT0_MI2S_RX:
+		data->int0_mi2s_clk_count++;
+		if (data->int0_mi2s_clk_count == 1)
+			snd_soc_dai_set_sysclk(cpu,
+				Q6AFE_LPASS_CLK_ID_INT0_MI2S_IBIT,
+				MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
+
+		/*
+		 * Downstream specifies that the AFE is a clock consumer, but
+		 * the sound is distorted (loud on the right channel and sped
+		 * up) unless we set it as a producer.
+		 */
+		snd_soc_dai_set_fmt(cpu, SND_SOC_DAIFMT_CBP_CFP);
+
+		break;
+	case INT3_MI2S_TX:
+		data->int3_mi2s_clk_count++;
+		if (data->int3_mi2s_clk_count == 1)
+			snd_soc_dai_set_sysclk(cpu,
+				Q6AFE_LPASS_CLK_ID_INT3_MI2S_IBIT,
+				MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
+
+		/*
+		 * Downstream specifies that the AFE is a clock consumer, but
+		 * the sound is distorted (slowed down) unless we set it as a
+		 * producer.
+		 */
+		snd_soc_dai_set_fmt(cpu, SND_SOC_DAIFMT_CBP_CFP);
+
+		break;
+	default:
+		dev_err(rtd->dev, "%s: invalid dai id 0x%x\n", __func__,
+			cpu->id);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static void snd_sdm660_int_shutdown(struct snd_pcm_substream *stream)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(stream);
+	struct sdm660_int_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
+	struct snd_soc_dai *cpu = snd_soc_rtd_to_cpu(rtd, 0);
+
+	switch (cpu->id) {
+	case INT0_MI2S_RX:
+		data->int0_mi2s_clk_count--;
+		if (data->int0_mi2s_clk_count == 0)
+			snd_soc_dai_set_sysclk(cpu,
+				Q6AFE_LPASS_CLK_ID_INT0_MI2S_IBIT,
+				0, SNDRV_PCM_STREAM_PLAYBACK);
+
+		break;
+	case INT3_MI2S_TX:
+		data->int3_mi2s_clk_count--;
+		if (data->int3_mi2s_clk_count == 0)
+			snd_soc_dai_set_sysclk(cpu,
+				Q6AFE_LPASS_CLK_ID_INT3_MI2S_IBIT,
+				0, SNDRV_PCM_STREAM_PLAYBACK);
+
+		break;
+	default:
+		dev_err(rtd->dev, "%s: invalid dai id 0x%x\n", __func__,
+			cpu->id);
+		break;
+	}
+}
+
+static int snd_sdm660_int_hw_free(struct snd_pcm_substream *stream)
+{
+	return 0;
+}
+
+static int snd_sdm660_int_prepare(struct snd_pcm_substream *stream)
+{
+	return 0;
+}
+
+static const struct snd_soc_ops sdm660_int_ops = {
+	.startup = snd_sdm660_int_startup,
+	.shutdown = snd_sdm660_int_shutdown,
+	.hw_free = snd_sdm660_int_hw_free,
+	.prepare = snd_sdm660_int_prepare,
+};
+
+static int sdm660_int_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
+					 struct snd_pcm_hw_params *params)
+{
+	struct snd_interval *rate = hw_param_interval(params,
+					SNDRV_PCM_HW_PARAM_RATE);
+	struct snd_interval *channels = hw_param_interval(params,
+			SNDRV_PCM_HW_PARAM_CHANNELS);
+	struct snd_mask *fmt = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
+
+	rate->min = rate->max = DEFAULT_SAMPLE_RATE_48K;
+	snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S16_LE);
+
+	channels->min = channels->max = 2;
+
+	return 0;
+}
+
+static void sdm660_int_jack_free(struct snd_jack *jack)
+{
+	struct snd_soc_component *component = jack->private_data;
+
+	snd_soc_component_set_jack(component, NULL, NULL);
+}
+
+static int sdm660_int_dai_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+	struct sdm660_int_snd_data *data = snd_soc_card_get_drvdata(card);
+	struct snd_soc_dai *cpu = snd_soc_rtd_to_cpu(rtd, 0);
+	/* first codec on INT0_MI2S_RX must be the analog codec */
+	struct snd_soc_dai *codec = snd_soc_rtd_to_codec(rtd, 0);
+	struct snd_jack *jack;
+	int ret;
+
+	if (!data->jack_setup) {
+		/* headset buttons not tested */
+		ret = snd_soc_card_jack_new(card, "Headset Jack",
+					    SND_JACK_HEADSET | SND_JACK_BTN_0
+					  | SND_JACK_BTN_1 | SND_JACK_BTN_2
+					  | SND_JACK_BTN_3 | SND_JACK_BTN_4,
+					    &data->jack);
+		if (ret < 0) {
+			dev_err(card->dev, "could not create headset jack\n");
+			return ret;
+		}
+
+		data->jack_setup = true;
+	}
+
+	switch (cpu->id) {
+	case INT0_MI2S_RX:
+		jack = data->jack.jack;
+
+		jack->private_data = codec->component;
+		jack->private_free = sdm660_int_jack_free;
+
+		ret = snd_soc_component_set_jack(codec->component,
+						 &data->jack,
+						 NULL);
+		if (ret < 0) {
+			dev_err(card->dev, "could not set headset jack\n");
+			return ret;
+		}
+
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static void snd_sdm660_int_add_ops(struct snd_soc_card *card)
+{
+	struct snd_soc_dai_link *link;
+	int i;
+
+	for_each_card_prelinks(card, i, link) {
+		if (link->no_pcm == 1) {
+			link->ops = &sdm660_int_ops;
+			link->be_hw_params_fixup = sdm660_int_be_hw_params_fixup;
+		}
+
+		link->init = sdm660_int_dai_init;
+	}
+}
+
+static const struct snd_soc_dapm_widget snd_sdm660_int_dapm_widgets[] = {
+};
+
+static int snd_sdm660_int_probe(struct platform_device *pdev)
+{
+	struct snd_soc_card *card;
+	struct sdm660_int_snd_data *data;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	card = devm_kzalloc(dev, sizeof(struct snd_soc_card), GFP_KERNEL);
+	if (!card)
+		return -ENOMEM;
+
+	data = devm_kzalloc(dev, sizeof(struct sdm660_int_snd_data), GFP_KERNEL);
+	if (!card)
+		return -ENOMEM;
+
+	card->driver_name = "sdm660-internal";
+	card->dapm_widgets = snd_sdm660_int_dapm_widgets;
+	card->num_dapm_widgets = ARRAY_SIZE(snd_sdm660_int_dapm_widgets);
+	card->dev = dev;
+	card->owner = THIS_MODULE;
+
+	ret = qcom_snd_parse_of(card);
+	if (ret)
+		return ret;
+
+	snd_soc_card_set_drvdata(card, data);
+
+	snd_sdm660_int_add_ops(card);
+
+	return devm_snd_soc_register_card(dev, card);
+}
+
+static void snd_sdm660_int_remove(struct platform_device *pdev)
+{
+}
+
+static const struct of_device_id snd_sdm660_int_device_id[] = {
+	{ .compatible = "qcom,sdm660-internal-sndcard", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, snd_sdm660_int_device_id);
+
+static struct platform_driver snd_sdm660_int_driver = {
+	.probe = snd_sdm660_int_probe,
+	.remove = snd_sdm660_int_remove,
+	.driver = {
+		.name = "sdm660-int-sndcard",
+		.of_match_table = snd_sdm660_int_device_id,
+		.pm = &snd_soc_pm_ops,
+	},
+};
+module_platform_driver(snd_sdm660_int_driver);
+
+MODULE_DESCRIPTION("sdm660 Internal ASoC Machine Driver");
+MODULE_LICENSE("GPL");
-- 
2.53.0


