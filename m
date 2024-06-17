Return-Path: <linux-arm-msm+bounces-22857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 165A390AE9A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 15:04:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B38D81F28C9A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 13:04:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13BA2197A61;
	Mon, 17 Jun 2024 13:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PG/F06EP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0777D198858
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 13:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718629422; cv=none; b=YSR2GVb8HmwQSpv1JdU4NGqnB2+uW1mGRZek1Wwa2A2wYxrA+C7sTgwmTegIplssnZo9GHb08V4NECWz9j8Jnsh23b372Lr3wvXv0b3IMIvHULzT2SFZeoaQIixoRj8uSg39tjH3ANCh4ucQ8/f62WIAgOgg31I8sJZIjzfLDJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718629422; c=relaxed/simple;
	bh=oC0pfgVa3Dlx6z7hG0aXQvQ0Zxw02RemJzxb8+JzjIA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YaQfTdOgJzeMLIGJArPAyqu0o9Wpvqum1AFwju0iFM12zrGgly29aamhCeKd+kHVKuLrwafQ66CYFW1B260NTKkyFFsDsyuurq6a4HMffPFdP50aE2cZQ9hf0ZCacXfLYGA7Hvc51+s5nSA8XPYVoW3J5C91q2E1eqdTXyLARNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PG/F06EP; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-57cad452f8bso4824875a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 06:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718629419; x=1719234219; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hXtYDqlssObtluhwd5yYfudjspyFdWITZQVCGqmtTl4=;
        b=PG/F06EPp189QMQr8ROvSIhxfQ5BkruEc8LnsKwAYAnruIJGkWFA1r0UgR4xO3S/dN
         Tkucqng5WJf6nmH6HhYwigtdA8iLJGxbA154UH0OLM3tv7OqFrrnzgYP9Gs3NLpNETea
         JBI4rRm42sHRF0ZeLXst1IxFLK0LsaLhopxaJEe1j6xVJFx/Ah1oGGPwK4maISNhrUar
         PVf5J9pppg5qvRwJ63yeIGTuLE3VGcWOMZXqxw4/hXxpfjwugBXTgZelDgl8HnC+VTQu
         AMN1fwsyCqQ/XPkBCDdddyhk6BjNs/mferOmOlcU+Y2p8KgeuZITMC48yVMAFUtIWImx
         laOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718629419; x=1719234219;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hXtYDqlssObtluhwd5yYfudjspyFdWITZQVCGqmtTl4=;
        b=ReKYOnC7QlMA8x4ddjqmApuHHtXA1RGgJRrMat9926byqR0sa+5hT4uzbp3wao5N59
         7zDFoMhBPHbDUE811nbL1j2IzYCUfyKhaiwAd25Dp+PwEVlc3xHRL0GI/IqfxlVaPMg6
         uj410Viw7a418OROClnjQgnZmchLoe47uYzF/doJNhAn5vHA+MbSVgaAtQAsyGgCQIgp
         ZgWjuLbA5pzg/TcOnNMdzofX8l7fYt6/sELPyK7F98rld1qNoKOVulnZXDxVKa1n6CVx
         GjrU+NcCiUrUYOeDTrCO6nQvIPGCT92pDBhc4H4ZxPQe5SvqzsLfmOwI3YGwaIXtuN2M
         1Egg==
X-Forwarded-Encrypted: i=1; AJvYcCVz3xBPRYbItOULOeTFF0oJswhW+bo+73G2xHE8vesId3XO4Q7xTuPFuLBcDORcjStm5HD7cCR5dK3eEvU7/nnUenrOf6ReYLxGtP9qDA==
X-Gm-Message-State: AOJu0YzhLAU3ljFkSM46mZhd4fmlZuRFETuGBETs48z8EMW6j6QCzsGH
	h5zLoaevmDcqi8o3gp4sjFyLLLxtnuhrOXFDf1DsJiaykMDpC/TjaLHK3Ldd8DU=
X-Google-Smtp-Source: AGHT+IEaoNxxPiL1V9qAIPqtvGf7T8Fbc2bl94L6pFSRARPNikz+7tsmf13GahUrnRzW8iYLJeAUBg==
X-Received: by 2002:a50:d793:0:b0:57c:ab22:18a8 with SMTP id 4fb4d7f45d1cf-57cbd651ceemr5891279a12.7.1718629419361;
        Mon, 17 Jun 2024 06:03:39 -0700 (PDT)
Received: from [127.0.1.1] ([78.10.207.147])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57cb72daa67sm6404349a12.38.2024.06.17.06.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:03:38 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 17 Jun 2024 15:03:22 +0200
Subject: [PATCH 4/6] ASoC: Constify DAI passed to get_channel_map
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240617-n-asoc-const-auto-selectable-formats-v1-4-8004f346ee38@linaro.org>
References: <20240617-n-asoc-const-auto-selectable-formats-v1-0-8004f346ee38@linaro.org>
In-Reply-To: <20240617-n-asoc-const-auto-selectable-formats-v1-0-8004f346ee38@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, 
 Cezary Rojewski <cezary.rojewski@intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5852;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=oC0pfgVa3Dlx6z7hG0aXQvQ0Zxw02RemJzxb8+JzjIA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmcDQhZuPcn9ycaEh5vyXfhKSTEwcApSHfOOgdW
 25ck4WYxLmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZnA0IQAKCRDBN2bmhouD
 19WrD/9V0R1cp/MPvW47yAqk0nllwL/C2Pr4G0NMN0Q+vspSHXfzVxM/L2H5DM9CFGGP62GAj7S
 QF732eixnRp80gLfuEus2r9lU+V6X/ml2amoLnGT44cAOkWnMKUkpxznzLLB7h82tNO2nv7VWFD
 IeLEoZ2QsgTwGaX2OZNlcfFbseN/4XgRXmXSg1yoVyZIMnqcVH8V5wH6JyQhE+oZ4Gdp3xtvMWO
 QA5SGFFitEFNg+ThMHAn4H42opusXekUhBo+olBE9ITJlu+GVKn/EnEywhuIWbIdkEgbOglOrh6
 bCAD3AfKSRVyWR3uaaEBaVtpozUoOYoQOphVtMgNZSPsHSb8K7wqYIQa8rmc106xEMNIHdoAOpF
 zFgaSAnE2dZDXiB2DKvXZdUucFkiIal8DdOZmm/TDKjHWCXLzk/k6ieZMCrSJ4kkvYYM9iInMIr
 ENakyrKoJa2K0S3+ddn5/ROVDgP7i70OMZhqUJIVGv7y3xpdyuzdy2uirPuAvrJjdjFqqjLvfSI
 +Exl+BZfTshQ5dFT4i6cH6iDJ/p+CCIL49B7B4gsxxmecQBtUAOmpEr4Dc78HA/SHIDmPfAmpH3
 VTvCmQf0+yfwSzHwgoH1kFNCK2DN+YM3n5fKLiO1ohQBDJrzoR1eNvmIONEO9y2K60arvDtUZpo
 4vAcuxBe3YAQ/bw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

get_channel_map() is supposed to obtain map of channels without
modifying the state of the given DAI, so make the pointer to 'struct
snd_soc_dai' as pointing to const.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 include/sound/soc-dai.h            | 4 ++--
 sound/soc/codecs/lpass-rx-macro.c  | 2 +-
 sound/soc/codecs/lpass-tx-macro.c  | 2 +-
 sound/soc/codecs/lpass-va-macro.c  | 2 +-
 sound/soc/codecs/lpass-wsa-macro.c | 2 +-
 sound/soc/codecs/wcd9335.c         | 2 +-
 sound/soc/codecs/wcd934x.c         | 2 +-
 sound/soc/soc-dai.c                | 4 ++--
 8 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index dccda9f1b160..e9751cc94f8c 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -198,7 +198,7 @@ int snd_soc_dai_digital_mute(struct snd_soc_dai *dai, int mute,
 			     int direction);
 
 
-int snd_soc_dai_get_channel_map(struct snd_soc_dai *dai,
+int snd_soc_dai_get_channel_map(const struct snd_soc_dai *dai,
 		unsigned int *tx_num, unsigned int *tx_slot,
 		unsigned int *rx_num, unsigned int *rx_slot);
 
@@ -307,7 +307,7 @@ struct snd_soc_dai_ops {
 	int (*set_channel_map)(struct snd_soc_dai *dai,
 		unsigned int tx_num, const unsigned int *tx_slot,
 		unsigned int rx_num, const unsigned int *rx_slot);
-	int (*get_channel_map)(struct snd_soc_dai *dai,
+	int (*get_channel_map)(const struct snd_soc_dai *dai,
 			unsigned int *tx_num, unsigned int *tx_slot,
 			unsigned int *rx_num, unsigned int *rx_slot);
 	int (*set_tristate)(struct snd_soc_dai *dai, int tristate);
diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index dfb7e4c69683..723d460daa1e 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -1648,7 +1648,7 @@ static int rx_macro_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int rx_macro_get_channel_map(struct snd_soc_dai *dai,
+static int rx_macro_get_channel_map(const struct snd_soc_dai *dai,
 				    unsigned int *tx_num, unsigned int *tx_slot,
 				    unsigned int *rx_num, unsigned int *rx_slot)
 {
diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index c98b0b747a92..209c12ec16dd 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -1167,7 +1167,7 @@ static int tx_macro_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int tx_macro_get_channel_map(struct snd_soc_dai *dai,
+static int tx_macro_get_channel_map(const struct snd_soc_dai *dai,
 				    unsigned int *tx_num, unsigned int *tx_slot,
 				    unsigned int *rx_num, unsigned int *rx_slot)
 {
diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index 6eceeff10bf6..832648b362ef 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -892,7 +892,7 @@ static int va_macro_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int va_macro_get_channel_map(struct snd_soc_dai *dai,
+static int va_macro_get_channel_map(const struct snd_soc_dai *dai,
 				    unsigned int *tx_num, unsigned int *tx_slot,
 				    unsigned int *rx_num, unsigned int *rx_slot)
 {
diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 6ce309980cd1..1e19c2b28a4f 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -992,7 +992,7 @@ static int wsa_macro_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int wsa_macro_get_channel_map(struct snd_soc_dai *dai,
+static int wsa_macro_get_channel_map(const struct snd_soc_dai *dai,
 				     unsigned int *tx_num, unsigned int *tx_slot,
 				     unsigned int *rx_num, unsigned int *rx_slot)
 {
diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
index 42a99978fe5a..fc0ab00a253f 100644
--- a/sound/soc/codecs/wcd9335.c
+++ b/sound/soc/codecs/wcd9335.c
@@ -2014,7 +2014,7 @@ static int wcd9335_set_channel_map(struct snd_soc_dai *dai,
 	return 0;
 }
 
-static int wcd9335_get_channel_map(struct snd_soc_dai *dai,
+static int wcd9335_get_channel_map(const struct snd_soc_dai *dai,
 				   unsigned int *tx_num, unsigned int *tx_slot,
 				   unsigned int *rx_num, unsigned int *rx_slot)
 {
diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index fcad2c9fba55..b5a929659dc8 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -1960,7 +1960,7 @@ static int wcd934x_set_channel_map(struct snd_soc_dai *dai,
 	return 0;
 }
 
-static int wcd934x_get_channel_map(struct snd_soc_dai *dai,
+static int wcd934x_get_channel_map(const struct snd_soc_dai *dai,
 				   unsigned int *tx_num, unsigned int *tx_slot,
 				   unsigned int *rx_num, unsigned int *rx_slot)
 {
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 55d1a5a099df..0c3a834e504d 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -11,7 +11,7 @@
 #include <sound/soc-link.h>
 
 #define soc_dai_ret(dai, ret) _soc_dai_ret(dai, __func__, ret)
-static inline int _soc_dai_ret(struct snd_soc_dai *dai,
+static inline int _soc_dai_ret(const struct snd_soc_dai *dai,
 			       const char *func, int ret)
 {
 	/* Positive, Zero values are not errors */
@@ -327,7 +327,7 @@ EXPORT_SYMBOL_GPL(snd_soc_dai_set_channel_map);
  * @rx_slot: pointer to an array which imply the RX slot number channel
  *           0~num-1 uses
  */
-int snd_soc_dai_get_channel_map(struct snd_soc_dai *dai,
+int snd_soc_dai_get_channel_map(const struct snd_soc_dai *dai,
 				unsigned int *tx_num, unsigned int *tx_slot,
 				unsigned int *rx_num, unsigned int *rx_slot)
 {

-- 
2.43.0


