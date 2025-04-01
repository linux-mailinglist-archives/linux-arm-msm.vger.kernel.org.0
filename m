Return-Path: <linux-arm-msm+bounces-52986-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E13FA7836B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 22:43:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A78DA16A613
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 20:43:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E44B213E8E;
	Tue,  1 Apr 2025 20:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EtIJ4ee8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC9220E32B;
	Tue,  1 Apr 2025 20:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743540208; cv=none; b=YIIyrUED0iIL1tbvA05BNKV8eD3ByuIU9rgR20eedpgORRdf9XQWH7aJarBNCKpkD0Um5U7pyYkdTM0dGKAfESldHd4rDoSRiKs8VWoXoovyTmZAnEY8H4cUbHwVtJTn8vRz3EQP/5QfygINikYqdlHOdE6Aeu9VZr5gLNI7p6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743540208; c=relaxed/simple;
	bh=zQhKR8kVOAEtr8R3vm7SqBVF3sJt9l6H/kz5zrldLtk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DO96ICoYCqIZ/y+Bpbd2GlBAS8FQw7LjKI1FPt69T33i9PmHJ3ILRvNaM+yrm8SLQhhDQsdFH5N9dSuxIsXfQzgXM4EUM1y0u/Lc/+SaAD7EmBrelQFNj6rww1v+gMieHS46BR+0373OBefvo8BWYs2IQVHFnA0Boi2x5toMFMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EtIJ4ee8; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30dd5a93b49so40446891fa.0;
        Tue, 01 Apr 2025 13:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743540204; x=1744145004; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ncjIuT5qgvMbEBzrNid23ot35c1++uRBRoVD3rabhTU=;
        b=EtIJ4ee8pUdS5iu5UvRHsMuLig308qB3C9KbcsQLS8MSP8t9nwIx00+t67F62KEEBO
         cWM0PrJXffgonT8C26Yma1py09wL3M45IOc3P5sCFkp1i78IFBCuGynzzPCbv/ndfc57
         msrZTSYCVWgahRVXs5tKJcTljiiUsshP6BF6EfFNxka2X6RFylsBkPpqrIiwkwER7k8U
         mTOkba/j1G3+LlRmxjtmLWC+z7l8kSb/WrvfvNLd3OcPtnQh8y6ydqdQwHFh3rOOQpEO
         oHH6oioD0geCseQ3rUxLrwLamxE4/KwZA6x0dRmgf/r1hdiYSNPROfi4/G6UOWncaRHd
         kPlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743540204; x=1744145004;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ncjIuT5qgvMbEBzrNid23ot35c1++uRBRoVD3rabhTU=;
        b=nkIFohfO8zOeO5KxsiphauVcHRMRUAIbBhVxHZigKHSjKqQgi5dzJCmE0SFVHca5rz
         3FQ72fhe1UgKvadtePzaVztaNZCBXmgffdlJBeWKt2AhWVBTBfZmmajZODJWOZ18sT6c
         5BmHnFtK0BAV0vF8e5OYHinALPd7h0+QSAJVzoWSYE6JXSwCd56xT7hBd61byWrwwoe3
         uAkkoJmfBmxYh9wuYzmOAIwLi6U1edRh2HHVGZNuOkX8PJ9G5Xyt7uVXczJZwP3ifJzc
         aOe2nVhoY0PzGLAUQE/OHxl18m3/qzPOP007C+nwb28pSfA6l7fayD/H/2wuaCwqKdrt
         VGNA==
X-Forwarded-Encrypted: i=1; AJvYcCV1s4sdO5uNd/xm41H3+b052sfitkYkXK80sQmUrmlwQvYAkWdAGY6gz4N1kMNoWPkPvLZpWNQDgKqS7edL@vger.kernel.org, AJvYcCVEfKxjSTAp6klBX9+d/SVZt6vZkkGZZjMXuMgR8k4HjhnnOsCyPLYEd8W2zsCrLXjB6VG7ehDLPsp6zLg=@vger.kernel.org, AJvYcCVPzJGFJI0Add/pvuvF5w7vzJsMIMvTGOHBcRTVrll2zMq0bWcTbNTlGqrZmjLEIF6pFb4BUEHxgVyhTshq@vger.kernel.org, AJvYcCWlw+nAgPMeUOxFgMwvO1C/ZzoengDq3STafb+0D/CDWcfnsFJ52hSuYybSEY6BMlo3ni29yAAt@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ5MmyjkI6NdhP8u1Jo4aC/2bzuk33fDtQrHGDnpBRoejO7Ozk
	pFzUIde4aXUprYC7sYsNeanY5b1H7OyYxEMV2t6y0lE0FKk19nUz
X-Gm-Gg: ASbGncuulTOyEU4bwklovXrVn+5RUqiRoE81LhAjD9aUkrqEw021ejy8IRWaBHOOK4L
	U98I3vfNsBD9wh5qjJmpJrBYDFHBgINJt52WnZAWRw7QrmrHsH6f/A0bDsD2eEwx9aTosyAm0oP
	USKI9nSUpg/Cmy0598VtnT4dVo3MEnL54cp90syiIMO3yCyHmiAzvHD2cuLUbFypsv+Xrooloh/
	m4sojEWno1uaNjSUdmjEC1BhoL4hm/b0+Qwxx3YOk+p2jgAHIjylQnc1pQQw0jw7jy7Dbk2+PoB
	Q64gDz/oA9gCh0LD3OP5x+Rhfnk4hxak1ZXWlpqPrPgkd3uH9zvrIdbeO/LFTDMxi6jjnw==
X-Google-Smtp-Source: AGHT+IELNpGF2l/VAeH0aVpMUHnDd9JFi7xa5NDaI1mW4wUTHj9x8t8WdiqPNbT5mJBgMSpH5VHtxQ==
X-Received: by 2002:a05:651c:1602:b0:30b:b184:a8ef with SMTP id 38308e7fff4ca-30de024b43cmr43726451fa.14.1743540203883;
        Tue, 01 Apr 2025 13:43:23 -0700 (PDT)
Received: from localhost.localdomain ([87.249.25.136])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30dd2ab8581sm18308161fa.25.2025.04.01.13.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 13:43:22 -0700 (PDT)
From: Evgeny Pimenov <pimenoveu12@gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Evgeny Pimenov <pimenoveu12@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Venkata Prasad Potturu <quic_potturu@quicinc.com>,
	Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-patches@linuxtesting.org,
	Fedor Pchelkin <pchelkin@ispras.ru>,
	Mikhail Kobuk <m.kobuk@ispras.ru>,
	Alexey Khoroshilov <khoroshilov@ispras.ru>,
	stable@vger.kernel.org
Subject: [PATCH] ASoC: qcom: Fix sc7280 lpass potential buffer overflow
Date: Tue,  1 Apr 2025 23:40:58 +0300
Message-Id: <20250401204058.32261-1-pimenoveu12@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Case values introduced in commit
5f78e1fb7a3e ("ASoC: qcom: Add driver support for audioreach solution")
cause out of bounds access in arrays of sc7280 driver data (e.g. in case
of RX_CODEC_DMA_RX_0 in sc7280_snd_hw_params()).

Redefine LPASS_MAX_PORTS to consider the maximum possible port id for
q6dsp as sc7280 driver utilizes some of those values.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 77d0ffef793d ("ASoC: qcom: Add macro for lpass DAI id's max limit")
Cc: stable@vger.kernel.org # v6.0+
Suggested-by: Mikhail Kobuk <m.kobuk@ispras.ru>
Suggested-by: Alexey Khoroshilov <khoroshilov@ispras.ru>
Signed-off-by: Evgeny Pimenov <pimenoveu12@gmail.com>
---
 sound/soc/qcom/lpass.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
index 27a2bf9a6613..de3ec6f594c1 100644
--- a/sound/soc/qcom/lpass.h
+++ b/sound/soc/qcom/lpass.h
@@ -13,10 +13,11 @@
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <dt-bindings/sound/qcom,lpass.h>
+#include <dt-bindings/sound/qcom,q6afe.h>
 #include "lpass-hdmi.h"
 
 #define LPASS_AHBIX_CLOCK_FREQUENCY		131072000
-#define LPASS_MAX_PORTS			(LPASS_CDC_DMA_VA_TX8 + 1)
+#define LPASS_MAX_PORTS			(DISPLAY_PORT_RX_7 + 1)
 #define LPASS_MAX_MI2S_PORTS			(8)
 #define LPASS_MAX_DMA_CHANNELS			(8)
 #define LPASS_MAX_HDMI_DMA_CHANNELS		(4)
-- 
2.39.5

