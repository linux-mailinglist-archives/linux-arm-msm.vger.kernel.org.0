Return-Path: <linux-arm-msm+bounces-51422-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C44EA613B5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 15:34:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F810173AE4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 14:34:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BEBA202F83;
	Fri, 14 Mar 2025 14:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rzc3tv3K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BAC7202C4E
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 14:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741962812; cv=none; b=Q3ZsMUm5nwCvoSV2p6oN6lbitNW1GaTO4SQFK8Pz/ExR8CaJngVLm7icRjn4fjtgbJpg+XiKjtiLEsBAQQdSrgLqZS5ZgXnWnVikrcZZ7bGffsNt96Op7ACorOFDLsKUtQyBFUNJaRK7xJ4oz5PSjgkWL/G/QYPKVC9rjn+QCnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741962812; c=relaxed/simple;
	bh=49SQFDPVrfSgd5vzQ59y3EoTLS1r9SAAvEbV2EPsJ2Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UlgSzZ2t5I7wbO86O+MpJyo2iPmwZNFxp9JMJC6WIkam9MmhTxZ4z4KW2a15S4Zog6d4yutQH656Q+SollnBRvvbpvqmOt+B9lzxlM73932XwnAoc4f/G5ijAqra4Kraim0tYkO+I/hrTjxe/wRtu42+pXFOJOw2BmcmW0DnDLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rzc3tv3K; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43bb6b0b898so20800275e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 07:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741962809; x=1742567609; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BmrpnnLM0D4kCXujXrwrPhEB5OgiMQcaOkuo+01fN7M=;
        b=rzc3tv3Kd0ou7jNF7JWL+FlHnqVTYsD4DERINfn7Y7TPYu81vwaJ4gydWITQiL8Let
         pvI0/ihYKeViKibewSdmS37Vvsjtxx2lapsfoqUi+Cd6gMLPL5UAT5ZXPSarezmuvstH
         CI+8+/GuUsL4yoQr5PlpSsS8mZl0d06+9H+LfE0ikYeqYihUMqFxwa6LcYRnJ1x+Ss6x
         lQHNTWHP88aGohRijSwAPe5DZETw8BbeTpaDrI3icP9nziG5+AVwN68J2yJBrHPWuzUK
         iQsEsnmjLVVPMzok406CjcHssduRztpP9eUp+D2AA6ap6ZpsRvMkKmKVqVoZiF+vzj4I
         4/bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741962809; x=1742567609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BmrpnnLM0D4kCXujXrwrPhEB5OgiMQcaOkuo+01fN7M=;
        b=MViQeCAT8bpB2teW6U61Ss5c73Vyffr0Wv2pLniu20okkIgCxDz+Bq68aPIey+BXis
         j2yrSbTSg1g0ZSUChFVceaSelxwNyQ7p05o1eRe6pbeGgO98zyXfGD+nJ9JAysXjCfhY
         QBLjzA9BpE9yslpDI84FzhT0Ep6cpw5hXgPif03uXYYvvBMDU6hq9wrLY9Bb5zN0Fygl
         /rbJpbaZPXwyV5AxBs0gC3SKsrBP3Ud01ECGReGNKBRZeHvU2ypjORUDzZcH9mGMp1wU
         C6mJCS5gvVNeoxHVLqcYVACH7vsS/4foxEV2dEAecRM16+Fzi8xsiYzw45EJsRSvsMfq
         yGXw==
X-Forwarded-Encrypted: i=1; AJvYcCV7x9OIPn9TudYulUifEYkbFn8ATDQglc2KedqyUrrXwIA9bSWz1QHCuAiiGBlftoTdBnKhEs0LjSU2clEp@vger.kernel.org
X-Gm-Message-State: AOJu0YynkqsVOR/evGM422fLnSu/z04l3GJS691Aqc/p+HoDL09efXt8
	c/NqWAqWr2A9Yn9a9pMfm3BsIFzIxuTQwORZVT4PiWbAubb3gY4Jte5HH4OgR9k=
X-Gm-Gg: ASbGncsbUL63bmqCq/o4XJgt2HRTSCX9S41vBzYaB3v9fw1aAh74IATWrsFwwd/QAiW
	EZntKti9K0s6k3qaTThXx5f/MStYnzBdqByHELRJgFtrQLAGvnWdv0LwIQibEuNo/BUvDA6SPlK
	4TmCfhAGsi7z/gsYm7A7X2URWbbkYJpxdfFxOScjbNiBHoMhdbD2Iwot9qXTp1pcEo/SnO3Srwk
	/Ms46T0S5it8bslp+j5EFMiwaDa+FA1YATWN2unLhIHVDJMSLgD23g9lZbuko8hA7loK1THb3LB
	pYYO/mg7YE+LlXGMuMc81FWFbkeRX/K1vXKoGd1Fiywd2Qk0yWDjFj4p2iRqd5csXp5gmA==
X-Google-Smtp-Source: AGHT+IHv9cZ7VMEGzbxjDU272hTTPtgC2UDh1G+FUstyJcGJxM6GpRj97dHRlcSdi5ciiW0phluAww==
X-Received: by 2002:a5d:64a1:0:b0:390:e8e4:7e3e with SMTP id ffacd0b85a97d-3971cd573fbmr3738351f8f.6.1741962809334;
        Fri, 14 Mar 2025 07:33:29 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c82c2690sm5699168f8f.25.2025.03.14.07.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 07:33:28 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: broonie@kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	krzysztof.kozlowski@linaro.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmitry.baryshkov@linaro.org,
	johan+linaro@kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v4 5/5] ASoC: qdsp6: q6apm-dai: fix capture pipeline overruns.
Date: Fri, 14 Mar 2025 14:32:20 +0000
Message-Id: <20250314143220.6215-6-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250314143220.6215-1-srinivas.kandagatla@linaro.org>
References: <20250314143220.6215-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Period sizes less than 6k for capture path triggers overruns in the
dsp capture pipeline.

Change the period size and number of periods to value which DSP is happy with.

Fixes: 9b4fe0f1cd79 ("ASoC: qdsp6: audioreach: add q6apm-dai support")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index a636f9280645..292cab61831c 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -24,8 +24,8 @@
 #define PLAYBACK_MIN_PERIOD_SIZE	128
 #define CAPTURE_MIN_NUM_PERIODS		2
 #define CAPTURE_MAX_NUM_PERIODS		8
-#define CAPTURE_MAX_PERIOD_SIZE		4096
-#define CAPTURE_MIN_PERIOD_SIZE		320
+#define CAPTURE_MAX_PERIOD_SIZE		65536
+#define CAPTURE_MIN_PERIOD_SIZE		6144
 #define BUFFER_BYTES_MAX (PLAYBACK_MAX_NUM_PERIODS * PLAYBACK_MAX_PERIOD_SIZE)
 #define BUFFER_BYTES_MIN (PLAYBACK_MIN_NUM_PERIODS * PLAYBACK_MIN_PERIOD_SIZE)
 #define COMPR_PLAYBACK_MAX_FRAGMENT_SIZE (128 * 1024)
-- 
2.39.2


