Return-Path: <linux-arm-msm+bounces-22858-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B656D90AE9D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 15:04:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 36CC21F28C95
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 13:04:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B400E198E81;
	Mon, 17 Jun 2024 13:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BqUPzCrZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854B5198A37
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 13:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718629424; cv=none; b=r3z2YCbpjtZiDe6cA5EZiCpSLcmPDiHbUvTEvRbilimmrFK5cOrru8mpeu7nFk4POfgaUezlNq8mC4M7ARFBgkrx+OaATlBnkLspaADaH3Yug/KMgSbgfaHKXSleut7NsEe7/eFEm8BCGs7rkYY0ZRY3KVDFT/N9M+c2qfL1XSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718629424; c=relaxed/simple;
	bh=6t3ZkqcNeoQQb/+n2YWFMbCwguXnWksaQugNhpxF2Qo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A7UCFep4HrjaVTG0ViUk+6Eb+4SkTLeliSMYd4cZm9fq9wJ8uCZJjROsEbZrXDhuN/vPkb4rGbhm4BmzoWubZlYqQ4hhNDfGXP4dbWcinW1MnDuF6Y2cWhSfN4+N4eu50+CdUcHXwcDSFfwmTuVcGVPia92NO/9TIyDYQrSzJRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BqUPzCrZ; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-57c831b6085so2369691a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 06:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718629421; x=1719234221; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZTDFr+Cm8nDhokWGI5gZCj0FJzBUQBkkvhzHWESthf0=;
        b=BqUPzCrZCd95Vuj4RhTrnwhFIjVK9lrprEtpweO8WimwZWUWo4A70Ly4Io255zhcmo
         TM2KAchY6B1yXo9+BWLeN6h8/TCsyWRJ1uwk38JBJRpa7mM3r/i6gDy6zvqfKNmkEOcr
         nY0TNCWprpcOVE/kAPanPcudYlWPh/RRxUnHv/TP4hCOyIthXQVxq0H0kOt8J5gGRD9f
         /qFkQ/qc+GBEGzlZFYjrJl5BMEBGGw7HbvFWZfReSlFCM3HoiUIawFUFY6GGYZ1yNs47
         9gpw+W74WzcVAaFzLaTjEb4urXo9xwsDigC2slf9TBUN3taRr5k2u4+fwEIbyCz1gYTK
         WA5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718629421; x=1719234221;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZTDFr+Cm8nDhokWGI5gZCj0FJzBUQBkkvhzHWESthf0=;
        b=C5f74zwoYUozF9zWnNAynTeIytMfExWDvcd+UD+dCcl4/xuvlrdQbYp8h2AERogYON
         Mba1z7RkzZca1+l1eZhc4DcePhu/5w7PircB3dt/sO6HdTgmvHC177mNMIezO+TR/KrB
         2O1wvFBvthHaQhB8WB4CKAQUgqdpTTtdfogGczHwnVR4BMbonn4RHJ65riFCaftUswmZ
         wJKM8UauoXs8IbdOYSs96okXQok6w0/R3X1xWren1ehzgvoC74k+r+qty6UUAPcggKhE
         NZ05MYzk60Le/jLikl0wSThsKhFyH18BAgcI9WQmnAU01YAd9lSuRHjtZvw6M1wBicJH
         2uyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDikpUPVIZy5h7r3NbBkbXwFQ7kcjU3yuT7vxnxtIXrzYWiA9SB+yHM6A6ZnJDzXB/qu8PNVsv5WC086NehgFkS1vKJDfOlNdRS9KqJA==
X-Gm-Message-State: AOJu0YzWpsGjViZ7ZmHxUfWpFeFenTkkNlQ9wfuw+MUjeJRLVt57v3wK
	+JAbAHafNteP5wVCDJr/qWMc6mGFy2dvC7k/3Bd1xbBtgqafo6ZdK9mqhHA3mlc=
X-Google-Smtp-Source: AGHT+IG0uo6xbwCVLGemxh8QyVdwKLSreFz59C2NpY1GizeXqWOynGBerO7GobcCbP+4hBGajbjtkQ==
X-Received: by 2002:a50:d48e:0:b0:57c:8e57:c3f0 with SMTP id 4fb4d7f45d1cf-57cbd685122mr7587945a12.16.1718629420843;
        Mon, 17 Jun 2024 06:03:40 -0700 (PDT)
Received: from [127.0.1.1] ([78.10.207.147])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57cb72daa67sm6404349a12.38.2024.06.17.06.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:03:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 17 Jun 2024 15:03:23 +0200
Subject: [PATCH 5/6] ASoC: Constify return of snd_soc_dai_get_pcm_stream()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240617-n-asoc-const-auto-selectable-formats-v1-5-8004f346ee38@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6826;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=6t3ZkqcNeoQQb/+n2YWFMbCwguXnWksaQugNhpxF2Qo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmcDQi7eqb6NCoOY1F4T3SR0rHmp1JLBzjzFZAV
 RyLBDlw2vCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZnA0IgAKCRDBN2bmhouD
 10zJD/0f8jAVU8xwRZB3dmHz6NbBZYEs6J97frvD4lszp15M1r2Nj9ltmNlVz2SkyA91uxRE6tQ
 JqLUjxdsx1ZT4mGBkH+kKn8+3b2U9KHa94WwoxU8f1qzlqiZH5J6Gnf43vheTlJlBHjRPHpswrH
 WSm0AT5yrsNHWqcL0GOcqU6M/PosUm9E8GisLC9VyAv2rj9mmGyECBu1pmbrPmLII9SpqRUfoTx
 pJNFAvbxwArTES3/2q/uhU1xNfk87XjEB6B8VCgf4gfvtXCjJ6sOwS6sOUcWYe1sl4iY1e1tqqQ
 67FniMGKICaYNQR2Y8qtpGNRIGxRsMPI7cu1aJaGUirPxRfAI9KBl3GoJeNj4EWDm7E7SFFSSWj
 5Jllwk6HVm/7eeQAqRMahY/aR2mIKOvEDGOn/s4dUppyFeniXbShPtb0UrdjZHWSjSaOB7d7vTd
 lVMJHm8naCLbYnIC9irS7xN+LJ/mxEdeRmwwnfW1CgZ78YPJRe20a9c7YUXBwCiDL0lHlk6I8XB
 62uEI5KyNlpB+hZ9PO2Dv4gaxAGK1g+iCyqm9aNeoRzfaghDQrIZg5gm8ifWqSjBLMEeHQXWANF
 FRvxsaQSCGLLBfQh3bsgNCC8XzlXuzeeX2aMgQIoFNr23B5q6N2VtMCNOallLX8LFk9BIk9euNi
 scz/N+b7Bn3Z/zg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Returned 'struct snd_soc_pcm_stream' by snd_soc_dai_get_pcm_stream() is
not modified by the users, so it can be changed as pointer to const.
This is a necessary step towards making the 'dai->driver' a pointer to
const.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 include/sound/soc-dai.h   |  2 +-
 sound/soc/intel/avs/pcm.c |  4 ++--
 sound/soc/soc-dai.c       |  2 +-
 sound/soc/soc-pcm.c       | 26 +++++++++++++-------------
 4 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index e9751cc94f8c..bbb72ad4c951 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -473,7 +473,7 @@ struct snd_soc_dai {
 	unsigned int probed:1;
 };
 
-static inline struct snd_soc_pcm_stream *
+static inline const struct snd_soc_pcm_stream *
 snd_soc_dai_get_pcm_stream(const struct snd_soc_dai *dai, int stream)
 {
 	return (stream == SNDRV_PCM_STREAM_PLAYBACK) ?
diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index 88e711875004..c76b86254a8b 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -341,7 +341,7 @@ static int avs_dai_hda_be_prepare(struct snd_pcm_substream *substream, struct sn
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_stream *stream_info;
+	const struct snd_soc_pcm_stream *stream_info;
 	struct hdac_ext_stream *link_stream;
 	struct hdac_ext_link *link;
 	struct avs_dma_data *data;
@@ -637,7 +637,7 @@ static int avs_dai_fe_hw_free(struct snd_pcm_substream *substream, struct snd_so
 static int avs_dai_fe_prepare(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_stream *stream_info;
+	const struct snd_soc_pcm_stream *stream_info;
 	struct avs_dma_data *data;
 	struct hdac_ext_stream *host_stream;
 	unsigned int format_val;
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 0c3a834e504d..9e47053419c1 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -473,7 +473,7 @@ int snd_soc_dai_compress_new(struct snd_soc_dai *dai,
  */
 bool snd_soc_dai_stream_valid(const struct snd_soc_dai *dai, int dir)
 {
-	struct snd_soc_pcm_stream *stream = snd_soc_dai_get_pcm_stream(dai, dir);
+	const struct snd_soc_pcm_stream *stream = snd_soc_dai_get_pcm_stream(dai, dir);
 
 	/* If the codec specifies any channels at all, it supports the stream */
 	return stream->channels_min;
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 711b2f49ed88..bad823718ae4 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -504,7 +504,7 @@ static void soc_pcm_apply_msb(struct snd_pcm_substream *substream)
 	unsigned int bits = 0, cpu_bits = 0;
 
 	for_each_rtd_codec_dais(rtd, i, codec_dai) {
-		struct snd_soc_pcm_stream *pcm_codec = snd_soc_dai_get_pcm_stream(codec_dai, stream);
+		const struct snd_soc_pcm_stream *pcm_codec = snd_soc_dai_get_pcm_stream(codec_dai, stream);
 
 		if (pcm_codec->sig_bits == 0) {
 			bits = 0;
@@ -514,7 +514,7 @@ static void soc_pcm_apply_msb(struct snd_pcm_substream *substream)
 	}
 
 	for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
-		struct snd_soc_pcm_stream *pcm_cpu = snd_soc_dai_get_pcm_stream(cpu_dai, stream);
+		const struct snd_soc_pcm_stream *pcm_cpu = snd_soc_dai_get_pcm_stream(cpu_dai, stream);
 
 		if (pcm_cpu->sig_bits == 0) {
 			cpu_bits = 0;
@@ -538,7 +538,7 @@ static void soc_pcm_hw_init(struct snd_pcm_hardware *hw)
 }
 
 static void soc_pcm_hw_update_rate(struct snd_pcm_hardware *hw,
-				   struct snd_soc_pcm_stream *p)
+				   const struct snd_soc_pcm_stream *p)
 {
 	hw->rates = snd_pcm_rate_mask_intersect(hw->rates, p->rates);
 
@@ -551,20 +551,20 @@ static void soc_pcm_hw_update_rate(struct snd_pcm_hardware *hw,
 }
 
 static void soc_pcm_hw_update_chan(struct snd_pcm_hardware *hw,
-				   struct snd_soc_pcm_stream *p)
+				   const struct snd_soc_pcm_stream *p)
 {
 	hw->channels_min = max(hw->channels_min, p->channels_min);
 	hw->channels_max = min(hw->channels_max, p->channels_max);
 }
 
 static void soc_pcm_hw_update_format(struct snd_pcm_hardware *hw,
-				     struct snd_soc_pcm_stream *p)
+				     const struct snd_soc_pcm_stream *p)
 {
 	hw->formats &= p->formats;
 }
 
 static void soc_pcm_hw_update_subformat(struct snd_pcm_hardware *hw,
-					struct snd_soc_pcm_stream *p)
+					const struct snd_soc_pcm_stream *p)
 {
 	hw->subformats &= p->subformats;
 }
@@ -583,8 +583,8 @@ int snd_soc_runtime_calc_hw(struct snd_soc_pcm_runtime *rtd,
 {
 	struct snd_soc_dai *codec_dai;
 	struct snd_soc_dai *cpu_dai;
-	struct snd_soc_pcm_stream *codec_stream;
-	struct snd_soc_pcm_stream *cpu_stream;
+	const struct snd_soc_pcm_stream *codec_stream;
+	const struct snd_soc_pcm_stream *cpu_stream;
 	unsigned int cpu_chan_min = 0, cpu_chan_max = UINT_MAX;
 	int i;
 
@@ -1712,7 +1712,7 @@ static void dpcm_runtime_setup_fe(struct snd_pcm_substream *substream)
 		hw->formats &= formats;
 
 	for_each_rtd_cpu_dais(fe, i, dai) {
-		struct snd_soc_pcm_stream *cpu_stream;
+		const struct snd_soc_pcm_stream *cpu_stream;
 
 		/*
 		 * Skip CPUs which don't support the current stream
@@ -1750,7 +1750,7 @@ static void dpcm_runtime_setup_be_format(struct snd_pcm_substream *substream)
 
 	for_each_dpcm_be(fe, stream, dpcm) {
 		struct snd_soc_pcm_runtime *be = dpcm->be;
-		struct snd_soc_pcm_stream *codec_stream;
+		const struct snd_soc_pcm_stream *codec_stream;
 		int i;
 
 		for_each_rtd_codec_dais(be, i, dai) {
@@ -1787,7 +1787,7 @@ static void dpcm_runtime_setup_be_chan(struct snd_pcm_substream *substream)
 
 	for_each_dpcm_be(fe, stream, dpcm) {
 		struct snd_soc_pcm_runtime *be = dpcm->be;
-		struct snd_soc_pcm_stream *cpu_stream;
+		const struct snd_soc_pcm_stream *cpu_stream;
 		struct snd_soc_dai *dai;
 		int i;
 
@@ -1809,7 +1809,7 @@ static void dpcm_runtime_setup_be_chan(struct snd_pcm_substream *substream)
 		 * DAIs connected to a single CPU DAI, use CPU DAI's directly
 		 */
 		if (be->dai_link->num_codecs == 1) {
-			struct snd_soc_pcm_stream *codec_stream = snd_soc_dai_get_pcm_stream(
+			const struct snd_soc_pcm_stream *codec_stream = snd_soc_dai_get_pcm_stream(
 				snd_soc_rtd_to_codec(be, 0), stream);
 
 			soc_pcm_hw_update_chan(hw, codec_stream);
@@ -1835,7 +1835,7 @@ static void dpcm_runtime_setup_be_rate(struct snd_pcm_substream *substream)
 
 	for_each_dpcm_be(fe, stream, dpcm) {
 		struct snd_soc_pcm_runtime *be = dpcm->be;
-		struct snd_soc_pcm_stream *pcm;
+		const struct snd_soc_pcm_stream *pcm;
 		struct snd_soc_dai *dai;
 		int i;
 

-- 
2.43.0


