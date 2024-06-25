Return-Path: <linux-arm-msm+bounces-24136-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DC8916EA6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 18:59:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B0271C2337D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 16:59:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 638D7176AC0;
	Tue, 25 Jun 2024 16:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dcZIrqfp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69AF176245
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2024 16:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719334746; cv=none; b=g/iyATkeU0kqzkthc1d91u7FNPP6ftzvs7+C92Jwfqq2MffpvfcL8zVrB6snzvQG5DA0oqG3uF0kAP3fTxQ3TOFXXVJrG4bUm1LlRdv8syqjiufF6x64zg+Cqjyui19W05/MiJU5AoTwWREtN+S3jGht0KfWX7AipMHafG/YqpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719334746; c=relaxed/simple;
	bh=vF37Z0aZiJEeLWEKoNSeoRo+xDDMR/tNEztnp1b16K4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R4/Fo9A+Se8RGxMnbDn5wcJ0e8fjepA7g39UsdkPyaAia9kMZxjNIV1CkVgIDIiq1jiqM5muCcXGde9L7kaQE85/kkwnVyFbWz6FE3oQYVcwq4YWXfk0JNV+i7O+Iz4FJ3TRltUIYyhX6vvhUf5GBAyXhwuak5EGWHrvehc9tjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dcZIrqfp; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52ccc40e72eso3962096e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2024 09:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719334743; x=1719939543; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=re76ACXG9OmJmqLT6FZEpdvG6nPrWdtBRKUnS+4yqic=;
        b=dcZIrqfp8OrxErBKmBJFIzdyCS202Dt3ebWdcJIAgH9ojEptfEeBJoHFnuE2tD8tTo
         n4hTO4tUkddJM/uk6P76P3k4grf+lh189wwYCfl152k8KNJOpmKOgB6IlG6I8jV+Iih1
         CPwb5LSmjl8/fQkqBMgWHhTd4DBlIJva3FbW7SYvqSIaJKGG7JYMKHxzhob8AEqoXDHE
         qfKR377sCGsYOn1qbvtMyMBNWxdjxta5bY2tb7RqadfwmMnqgB3cVwCOD6kllKi1PoON
         e6Pxg63EtU6XjKmhGZet5zdEHhNgbuDPf/cdUmo1GT69oZAmTn/x5U+3jTF3rTJfTZk/
         bZoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719334743; x=1719939543;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=re76ACXG9OmJmqLT6FZEpdvG6nPrWdtBRKUnS+4yqic=;
        b=n5rQtc5IgrDWGI2QXbqzf52HP84Nn4YPGY+rjv3YWsW2gloiPDSlxreB+h5peBH9rB
         febfdv3qtR85KMeu3SfJ8CXDPIWm8A6z5rOvN0MfIM5YGpaoJUcgYYLTktRwVSKEz+8t
         qHo2CAGI9M/IJgCrbx+mUxZvnpz0pQDbIZdoCHeA0SwXFi4o+As3JFX4g5KT/b8Dojhu
         t1WymCQOr5mZsXu6ZsZeR2wBOtNpMctyF/YjzmucXcG00Ba9vzMmP3eJHXiI99U65ti6
         RQuomxuOyYTK8vYo3eS1qLQJNymmAqX0Cbznqdc3/ZPzehuAd5W8L/8/RbQsKG0m1xWD
         +dmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUN9OYyFw8C/m6+ON9YRVh0S+7QmHWYod9uou0LLXZnT3cTxT47/+saDj7+qVXc7JzRCr1hqRWb2Ybc0uOyLbB7SGHAU55/JuxajyptAA==
X-Gm-Message-State: AOJu0Yw8JundS/vvvYw+BC5chsQtFrDKHcC/DNDcSAVkUfHk4gLMjQbd
	YTccZVV5tCaPLsFOEz/kEswhqbTqfDUAvtGUxZp8F8h+dDF/k+UNlpoyRoBtnBM=
X-Google-Smtp-Source: AGHT+IGR7Qhyf8Y3HWNl1SPoUEbvvo2YHcOxUjAhBJioVQV9vrofLD/WBQj8YIQ9FREJo6iOttG1lg==
X-Received: by 2002:ac2:515d:0:b0:52b:c233:113c with SMTP id 2adb3069b0e04-52ce1835167mr5952139e87.17.1719334743050;
        Tue, 25 Jun 2024 09:59:03 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247d211881sm217969785e9.46.2024.06.25.09.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 09:59:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 25 Jun 2024 18:58:45 +0200
Subject: [PATCH 1/3] ASoC: codecs: lpass-wsa-macro: Drop unused define
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240625-qcom-audio-wsa-second-speaker-v1-1-f65ffdfc368c@linaro.org>
References: <20240625-qcom-audio-wsa-second-speaker-v1-0-f65ffdfc368c@linaro.org>
In-Reply-To: <20240625-qcom-audio-wsa-second-speaker-v1-0-f65ffdfc368c@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=701;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=vF37Z0aZiJEeLWEKoNSeoRo+xDDMR/tNEztnp1b16K4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmevdR2h79GggPHusd3v4VoaUckqX1xpQHoZro9
 O3/5py+BuSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZnr3UQAKCRDBN2bmhouD
 17waEACaU+lphVs4h28nyJ272D/X1VUo+55FfxobbeqYsSpPQ51epzL42gqR6bZv/EAhLTwpt9p
 tIis5PZNOFo84hb8oeOmO+BOQJ2mLXJlXxZqQIyKY5up0QeZVRjsPhiuKEfXgBEMCHNHfHFMN3+
 HphpHgIKzGKXUYKrhe9Ymyz9/idKlT7q+YbJ8kaIMSNGHAmxhnBio7z87BR0u4oepsPiMYb4XRk
 6OwBj/p0uW9Ux2VOb7qn33XJvVRAxJXLVDQIsktfSKvVKaNQWBZouBalLkU7PpAXhxbZt85qgrA
 X2TgQkWpNalV4iUINTzg1xdLleD6++IOMBvrfyLtotLRV95YQwZjjqCgPXCjVJJJzZTUeVBpJgN
 M8F9oqkjDzJVvPd+85LopPzGg/LN7PeJwumRXczq8KZ6un/s+JJNOrYMadyjc39bULymJ7P/CxJ
 IUne9tVtpFoyvXGI6sivNZ0ZlWhPzMo4ysolyQZW6t/VAXU17mxWsZguBDEbwgNlZZSfbWd1Axu
 AgYjSR37ujOpePfPwL+Qw6/fnZxEtLxoGTvXQ6szdtfzkY7r4AaN3GdZ1IxXqOewTt5Lo8iaOi2
 zGCzV+jMP4w2wcumATat+vyR/pQ/kSw8Xd/n8tGi2foCCe6J3y3xQXqUt/Y3zKtvNRPwfDa0TN7
 KvinIJNSTw+speg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

WSA_MACRO_MUX_INP_MASK2 define is not used.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/lpass-wsa-macro.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 6ce309980cd1..d12aff62a868 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -235,7 +235,6 @@
 #define NUM_INTERPOLATORS 2
 #define WSA_NUM_CLKS_MAX	5
 #define WSA_MACRO_MCLK_FREQ 19200000
-#define WSA_MACRO_MUX_INP_MASK2 0x38
 #define WSA_MACRO_MUX_CFG_OFFSET 0x8
 #define WSA_MACRO_MUX_CFG1_OFFSET 0x4
 #define WSA_MACRO_RX_COMP_OFFSET 0x40

-- 
2.43.0


