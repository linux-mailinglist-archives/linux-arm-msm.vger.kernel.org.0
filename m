Return-Path: <linux-arm-msm+bounces-70014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5419AB2E750
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 23:16:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2F2AAA3035
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 21:16:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFAC325F7A4;
	Wed, 20 Aug 2025 21:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kkP+I3k3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F772C0F91
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 21:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755724574; cv=none; b=hAgj2vBzmkj0apl5WZwkyGLWUc4NHWOQOZ+Utj8RwUjB050r0sjp8JdMisKR2U5CJoDPCDIzj1DYKHqVirleUHW3UV2sKInPHvZdef+qWjNzq0AMAdhcA7PmmfJ63LTJGaU/fgANdaAzX0VBfxPcHg99CfOCqdHYQ0CHLsEFVow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755724574; c=relaxed/simple;
	bh=+PRTzfNNIvKL6e++6M7NvDK0aJyyzVKFHkecFLwW9Xg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pY90TSyP1APG2hHLeMsqwf2zXp2+Cb4Pq+l0Kz14FBaqaZwAGn2XGlv8B9megV7OPB8bb4+8tREtJcDcIeZH4w2QGmxZ9pmfQj8wRIm8Pqf+wJbJumCNHyl2VpiW9On3zGvpalgEhbLsopiIYt5U9BHWBagJ/29sEbXxyjh5gHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kkP+I3k3; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45a1b0b42d5so2182405e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 14:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755724571; x=1756329371; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HBBvkxhekDJYu1ta91SINgdOpf53PrlBWNzBxoGqaxI=;
        b=kkP+I3k3FUSfZ5q9/2YPjdnVBgIWWaQIhiCrMnwqU/bVno4ratIe8XRFAymhH9U3fq
         k3JWS3V1rp/Mf187p91dO3ZqOdWX62kvDqMKKMMaqy9AV2drRhdGflhJ77UBWTroELcg
         iHCVXHAdxpscQ1zVgNhRpR5P9Ko0wa/gjUHeAIQbygEVH3Zci+Uaw8tgTlp26XQdQM3t
         X+gFV1rDUEfUg1ocULjpl3l+ykew5IDolNIOdxJvRd1NqbD6g0cyTXpBiTvwjU/30tNB
         yh5Yy7+/SCKV0HXDz+fAQgPEVfPjXJGnWidNQoWKLrj0KHk2CCa2K2hrnQrRWpSIa815
         V5hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755724571; x=1756329371;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HBBvkxhekDJYu1ta91SINgdOpf53PrlBWNzBxoGqaxI=;
        b=va2aJTcjy3GO0RlYpKxN+V4BxUJMJe00bW2Op5CWUMIqqWnH4i+yK+LNmRu7M1Ibwh
         LwCw3E475jKGpLES3nV/pr7D4ayZjWfr1z68m4pg/AvCI2STTV+GeOAMKzjidIGaOhFg
         lYjOC2//2CVZQDPsPR6re4IDRjZhcN3PoBYvpllJoR1C9FtXN9/F9E+NXJ0zvR9yjxjN
         f7783pmX1lwQQInM0hD3VpG1prx8FXrkbbGx0jWcu6+kMSUPK5tvZcwEm/jnXwMoB2xU
         T3s7hQCTW3KtdfavzS+qt344q+DlQxrIqjbY/QWxHa9kbVoz925dyyO9oBDsEe7xQZt3
         GQpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgFmiPl0YHJlgTAA9fJS1zWHXtE2ivZzIXP5xCg6NHhol1YUpvf1IAo87709RHbc+FJZ3nh6lollNqUZu3@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5fCGzhbkv+hpOHw/nMHFzHvib6d/mfDlQt9A3TmLY3mL9i6A8
	+orx0BbtuZpjiR+PK0AkR8XzNhcV/cnNF9yksc4oyhgsLKe7Hhhu5ZSFoWOdxz+TXGw=
X-Gm-Gg: ASbGncs9U6HA47xTAmIq7srxRC0ojSCFv5MQdGNRT+zysfns6FEzvDvjQXvYeFbrKMH
	3tOsVrshjkN5jeMwNyv4/ecVt4AEo+AN6n5B0sYyN74FCufUExISKwqlhFVQul94thSewrLUFJ0
	6L3Urdo8mgk6wOmNGSihm3g9SSFx9IB0f8f0GmGd2GpDLVW5rk1e9MasK7yR/4jTeflyeBCaoy5
	bZG8ZeIEQUIOSLrV6dFl44f/MxHYyyP6eUD+08IiOwBrDcJsqZ/ISjyiza2y+QHOuwHEMgU2tDM
	Mw/lR51NIaQVNVcjjliXzEen6lJEiPNLSmvCTVDHOTNVp59oFM318YZSzGoL9uCo1+/ngnrtWwI
	r8/4Ncvv8tBZkOucVb8d86foeP49+4NcxdyRJfU0=
X-Google-Smtp-Source: AGHT+IGSz0r8TSH88aPMH1bxFbynfRL/v7euJ/dUaZezLflt1bN9iwq2BCWh1nK7cdl57YdF5i30aA==
X-Received: by 2002:a05:6000:2dc2:b0:3b9:7bea:149e with SMTP id ffacd0b85a97d-3c49405d7c8mr168242f8f.8.1755724570942;
        Wed, 20 Aug 2025 14:16:10 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7259:a00:41e2:cc8d:197b:62f6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b4d7b2948sm162105e9.0.2025.08.20.14.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 14:16:10 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH 0/2] Add raw OPUS codec support for compress offload
Date: Wed, 20 Aug 2025 22:15:58 +0100
Message-Id: <20250820-opus_codec_rfc_v1-v1-0-54d5c7560856@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA47pmgC/32NUQqDMBBEryL73ZSNtmr71XsUCUmMulBc2bTSI
 rl7Uw9QmJ83MG82iEEoRLgWG0hYKRLPGfShAD/ZeQyK+sxQYnnGWteKl1c0nvvgjQzerFq5Gl1
 fYdteKgd5t0gY6L07713mieKT5bNfrPrX/rPloNJDgw7tSdsGbw+arfCRZYQupfQFbmHVNrMAA
 AA=
X-Change-ID: 20250616-opus_codec_rfc_v1-b60bd308893b
To: Vinod Koul <vkoul@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Patrick Lai <plai@qti.qualcomm.com>, 
 Annemarie Porter <annemari@quicinc.com>, 
 srinivas.kandagatla@oss.qualcomm.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 kernel@oss.qualcomm.com, Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
X-Mailer: b4 0.14.2

This series adds support in kernel to recognise raw (or plain) OPUS
codec playback for compress offloading. At this point this series
doesn't deal with OPUS packets packed in any kind of containers (OGG or
others) and focuses on adding missing bits for pure OPUS packets.

The second patch adds its usage in Qualcomm Audio DSP code. To correctly
recognise raw OPUS packets by qdsp6, each packets needs to be prepended
with 4-bytes field that contains length of a raw OPUS packet.
It is expected to be useful for usecases when OPUS packets are streamed
over network and they are not encapsulated in a container. Userspace
application that will use the compress API has to manually add such
4-bytes long field to each OPUS packet.

This is tested on sm8750-mtp. It is expected that next hardware revisions
will also support raw OPUS codec offloading.

Dependencies are:
-- hardware with DSP that supports decoding OPUS packets (>=sm8750);
-- adsp fastrpc;
-- explicitly setting format in sm8750 soundcard driver;
-- running adsprpcd tool with support for Audio PD and DSP libraries
loading support (or its alternative);
-- tinycompress fcplay tool that will prepare raw opus packets and
do the required addition of length field;
-- mfc module in topology compress-playback path, that module is
expected to parse channel mapping and do the required things to
map streams/channels to physically-present output channels on backend.

The userspace tinycompress tool with support for raw OPUS compress
playback is located here:
https://github.com/laklimov/tinycompress_opus
branch: opus_v3_workinprogress

The userspace tool is not expected that it is ready and still needs
some work, for instance recognition that it runs on Qualcomm hardware.
More like working PoC.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
Changes since RFC (mostly as suggetsed by Srini):
- added struct snd_dec_opus_ch_map to struct snd_dec_opus;
- changed tags;
- reworked comments for struct snd_dec_opus;
In qcom audioreach patch:
- corrected how {stream_count,coupled_count} is ejected from mcfg->codec;
- stopped dealing with channel mapping parsing (this is internal struct for
  decoder on audio DSP side);
- used sizeof(*opus_cfg) for payload size;
Tinycompress/fcplay:
- small updates to match kernel structs.
- Link to RFC: https://lore.kernel.org/r/20250616-opus_codec_rfc_v1-v1-0-1f70b0a41a70@linaro.org

---
Alexey Klimov (2):
      ALSA: compress: add raw opus codec define and opus decoder structs
      ASoC: qcom: qdsp6/audioreach: add support for offloading raw opus playback

 include/uapi/sound/compress_params.h | 43 +++++++++++++++++++++++++++++++++++-
 sound/soc/qcom/qdsp6/audioreach.c    | 27 ++++++++++++++++++++++
 sound/soc/qcom/qdsp6/audioreach.h    | 17 ++++++++++++++
 sound/soc/qcom/qdsp6/q6apm-dai.c     |  3 ++-
 sound/soc/qcom/qdsp6/q6apm.c         |  3 +++
 5 files changed, 91 insertions(+), 2 deletions(-)
---
base-commit: 886e5e7b0432360842303d587bb4a65d10741ae8
change-id: 20250616-opus_codec_rfc_v1-b60bd308893b

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>


