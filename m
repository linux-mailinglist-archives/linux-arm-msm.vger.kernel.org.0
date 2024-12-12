Return-Path: <linux-arm-msm+bounces-41626-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F13009EDCD0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 01:50:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3431283779
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 00:50:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D583C18A6A1;
	Thu, 12 Dec 2024 00:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Cf0yDtv6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C02118871D
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 00:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733964481; cv=none; b=jFj9HSzmj8ySutEsnxc0wad3ZLNOkuG9m/3bM0E35HLmcMAAYSWKaS4o7Ud/JgCYDY1okD/5rzAgYhgyQgTdQwtYiIoWezHm05+BPtkxbNOHpz6wyN3vDcFmM2NoUaq/1GDefE7Yb7VLwkggrPdP3inloO3tRwc3oFS4N1OwzSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733964481; c=relaxed/simple;
	bh=QzuIeMsbqn06WI5qhPV1wr/oyc12cKZ+XBOtXN5CYbk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Oa7QQJ391tG/EDle3CLozGGEuygblzK/WSxzpmr814cdUNzgj21SnQj5/Le0QpNu/IZLzEt3M5k+rJr4lCPkJFN9Z26NBqUvt8DFG+Iy/jDp3oe9ygKcl3kX7IhrBUpLdYR1UCP2BNKXW4JksgoFSg6dQUxUhxA2ZtfhgtT3gHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Cf0yDtv6; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-385df53e559so15308f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 16:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733964478; x=1734569278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8YUv9wXf1xeMulszUqTOEITp7UUlDCUgSWoOEuWnA1U=;
        b=Cf0yDtv61ODSF0SdIoYHtgfcMmCSDWWtc/iE3ul6sPR6qU4XVCOI3tDDXgvhgF6SQG
         n10ix4qfFx+qAvU4XHjm3zpvwLR9N/FqS1MsByQMCwwz4N1aKH6C81c66QDnQv9FKze/
         cjfo+YgZsKg3mzhObTqbx8tYbOwDFY/2kRS7mvQQvA+RpeEyHujBB8AOuM88t661GzAu
         JiUZwBW31X2g0Zfv7rZHUxRGz3QDWTPI51FZbn1uOM62LY+zWaFOKfRrr8wwtcLcTTIj
         jS6plzepqGM15KRz3j9Vl4F4oyslsOCBZji7jeqx2SGjL0pF1qGg39EDnkTzHXwlYqY2
         kPHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733964478; x=1734569278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8YUv9wXf1xeMulszUqTOEITp7UUlDCUgSWoOEuWnA1U=;
        b=Yot+jHgBWmTQhF/fSSeDWRh09T3VPHdTXm2NB0HY6CPFSIScjAQUHIlsX+YueeRzT5
         2SxHLWvkcPY5GImCdYpsg/+bSuKtuFq69ymzVBT3xQQroJ77wHsbSJE/QkowODyVpv5U
         SvDXNGGv14j4nEE4AnSm0oyzdZWUcCXZ2DFhUuCrcKDJM/df++atiVvjIzPiTU7/o1d2
         uukO7Xw3COTpNEF+i0pO+lnef3NQNC4SSVlMSicVxmL6pQ5pcxAxZfz2hwwpcawF0h56
         l9LZrROUUdcl6Qr/iwjpYPAYW30agIftaRNu8WosOAKN23i7jttJbd/INowbw07WIMHP
         bqyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXn8BXPcnzwySeXPxmMZyp90bMPjMZmBlK3HczTBbk7eBwssudODyeWd2bLuz55ckyA5/UZlH4WZlAEFu7M@vger.kernel.org
X-Gm-Message-State: AOJu0YwZlc3Qy+eNua7fnaPxAYMcMmALQpX3Hujub6b0IcWmg5spP1m5
	fXyJtz6O+x6JxgctM1EzSD2Dj3+Ps/vujq8x+ZCu+6YdnCjkW5UFsPK6lEDbms4=
X-Gm-Gg: ASbGncuEw/VwJfn/mRVLqOQOtKg9cDtDtB3KPvovsiPefbm4KHHAPbBDQvOtEv8Vedu
	NF7oO2zlk3SyQ7lT2dCEu5bJJ1dJVxVBGSlN0AlUdnCSMiAhy78EtUnfKvXk12Aj9NiJLuWMVWi
	W4UTbthpscexRg1nz3Gj0mzihNPH51t3Qoyoqg14Zw0jkgf7pimGmyHyllMYPzZluTQPBbbCfKj
	H5Klo+zJVXFaC4LJW0bTzsEl/c1sqgeXiq/wBq36aLOWwhiYwGL68AexbNo1fsDURHqNq+E
X-Google-Smtp-Source: AGHT+IGJvDlNsdYx4DutxMjQy1pOyYpJ0oJ3EbMe3FkPnkQ/U4TLzzGqGgOOv0KPDA2qNTcXJbpfuQ==
X-Received: by 2002:a5d:6f1e:0:b0:385:ea11:dd92 with SMTP id ffacd0b85a97d-3878768e6a0mr1224692f8f.15.1733964477946;
        Wed, 11 Dec 2024 16:47:57 -0800 (PST)
Received: from localhost.localdomain ([2.222.231.247])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-387824a4ef4sm2459660f8f.39.2024.12.11.16.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 16:47:56 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: broonie@kernel.org,
	konradybcio@kernel.org,
	konrad.dybcio@oss.qualcomm.com,
	andersson@kernel.org,
	srinivas.kandagatla@linaro.org
Cc: tiwai@suse.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dmitry.baryshkov@linaro.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 14/14] ASoC: qcom: sm8250: force single channel via RX_1 output for qrb4210
Date: Thu, 12 Dec 2024 00:47:27 +0000
Message-ID: <20241212004727.2903846-15-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241212004727.2903846-1-alexey.klimov@linaro.org>
References: <20241212004727.2903846-1-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In case of mono configurations we need to enforce single channel
output. This is required for audio playback on QRB4210 RB2 board
since it has only one WSA8815 amplifier.
Implement data variant for qrb4210-rb2-sndcard with
sm8250_qrb4210_fixup_params() that does that.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 sound/soc/qcom/sm8250.c | 28 +++++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index 45e0c33fc3f3..b54acaee8dd1 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -23,8 +23,23 @@ struct sm8250_snd_data {
 	struct sdw_stream_runtime *sruntime[AFE_PORT_MAX];
 	struct snd_soc_jack jack;
 	bool jack_setup;
+	void (*sndcard_fixup_params)(struct snd_interval *channels,
+				     struct snd_soc_dai *cpu_dai);
 };
 
+static void sm8250_qrb4210_fixup_params(struct snd_interval *channels,
+					struct snd_soc_dai *cpu_dai)
+{
+	/* QRB410 RB2 board has only one WSA8815 amplifier */
+	switch (cpu_dai->id) {
+	case RX_CODEC_DMA_RX_1:
+		channels->min = channels->max = 1;
+		break;
+	default:
+		break;
+	}
+}
+
 static int sm8250_snd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct sm8250_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
@@ -35,14 +50,19 @@ static int sm8250_snd_init(struct snd_soc_pcm_runtime *rtd)
 static int sm8250_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 				     struct snd_pcm_hw_params *params)
 {
+	struct sm8250_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
 	struct snd_interval *rate = hw_param_interval(params,
 					SNDRV_PCM_HW_PARAM_RATE);
 	struct snd_interval *channels = hw_param_interval(params,
 					SNDRV_PCM_HW_PARAM_CHANNELS);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 
 	rate->min = rate->max = 48000;
 	channels->min = channels->max = 2;
 
+	if (data->sndcard_fixup_params)
+		data->sndcard_fixup_params(channels, cpu_dai);
+
 	return 0;
 }
 
@@ -168,6 +188,7 @@ static int sm8250_platform_probe(struct platform_device *pdev)
 	if (!data)
 		return -ENOMEM;
 
+	data->sndcard_fixup_params = device_get_match_data(&pdev->dev);
 	card->dev = dev;
 	dev_set_drvdata(dev, card);
 	snd_soc_card_set_drvdata(card, data);
@@ -181,9 +202,10 @@ static int sm8250_platform_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id snd_sm8250_dt_match[] = {
-	{.compatible = "qcom,sm8250-sndcard"},
-	{.compatible = "qcom,qrb4210-rb2-sndcard"},
-	{.compatible = "qcom,qrb5165-rb5-sndcard"},
+	{.compatible = "qcom,sm8250-sndcard", .data = NULL },
+	{.compatible = "qcom,qrb4210-rb2-sndcard",
+	 .data = sm8250_qrb4210_fixup_params },
+	{.compatible = "qcom,qrb5165-rb5-sndcard", .data = NULL },
 	{}
 };
 
-- 
2.45.2


