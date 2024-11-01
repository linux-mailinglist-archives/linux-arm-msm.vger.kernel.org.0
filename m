Return-Path: <linux-arm-msm+bounces-36775-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C58739B95E2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 17:52:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 83F392819F7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 16:52:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75AC31C9DCB;
	Fri,  1 Nov 2024 16:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K/Izc+rA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570221CA81
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Nov 2024 16:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730479927; cv=none; b=S/bhZdDJaW7TuFdFWW/wImZkBogT5aqvs9Ib1D1WkbV9noYKNg8xzDZVh+qypDHXlGr2+M/ZGf56MBHMG6rDzRA7M2KutU2tLqdfOGSV379HSsPCyqVswfkT1RSGTlqclotA9PxHNVp6hbbIatrmMJec4mudyqh0HjjGD7sEuAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730479927; c=relaxed/simple;
	bh=T3qzsJEB2tFdfch3vsOxcb/vEpPvkjcRe3QzIZdh4bs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FddsCwPdgVeTYrGiVJlt5aDXlHIYkTgIkiWVdVF29qhXv16P+rPxkoSJKk4jrvzJIMyQOarcmqaZ178aJRgtDbOauH4IvVNeoHt5Gw7IFDmyFv/9lOPDOwrbKaCI5FL1kit5j3ZHQQBkpmF4m6CavrgALDe41g0mgjA4IH33Rik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K/Izc+rA; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a9acedbc767so28813166b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Nov 2024 09:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730479924; x=1731084724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i8PB5dBaZud3vPt9H+NMfe4uFOttps97cf61U+CxGh4=;
        b=K/Izc+rApkBrg7aDZJyRm7eB/1Y6Yn+3vEUT/FY1ZSIsvrZd2mmhcHOIfn/A/tts5p
         wBS/Rp3OOYmU+sKUCGXVENfZwnC4usLcuRMd6nOEUDTiz64N+WxYOhAE5F35HZRhOGgG
         On9DlcElTrMaC4CuoTfJh6+FhvTPkJ1MkYiqbnXqTaIfy/oMeNR1HiIMvB54+y0uF/4e
         SLq/Px78XD1q1S1vr3cxyOYSfJnOyHPcnhf11RcRDtuLSi7Z6f1KgyC3Fog5axXl4ajS
         tXCrB+K4IWxh6q5aAYBxq33FuwIufXlJxmHvzpk35C6fzV459+I2xeAAGEJy96AOh260
         Yo9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730479924; x=1731084724;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i8PB5dBaZud3vPt9H+NMfe4uFOttps97cf61U+CxGh4=;
        b=R7Lk3LDscJpk/Q4RL1tS8wnrzQOSUcC5WydChwq7A7p/QuNG3nrUdAeH9bG7iPsSWL
         BqoEHUnw/wxh5rcCgMKQWtBnho8id4X9GQaG9VTB9wRhs5fqik/YmKI5yr4Iv+S6xa10
         sBYvdZZhL9Fu75WmpLJSDUG+G/5AVnkCVHhEhbu6/3RXL3TcR+B44qGLxSRXK6pqDZfl
         uPIm6URUR+dEoa25PKY2a+6U10Dp+4nFnsYWGUCePV8fDVzIllbGgOpTc4ELidpdR2QH
         9IunmA7FEImdltNHDcINimJdvJ8R3DMjnv6f+JyhxEGQTp4jg3bJdwXtiPPUUNQQR9r9
         9PJg==
X-Forwarded-Encrypted: i=1; AJvYcCWK8gUCy0V0Io88yLUQHcvqe1jBWnKgBFuabooi1C5V4Qbw/l2Qo91HU9t1bwbQwUhwew71Mn4VZZoKfOBU@vger.kernel.org
X-Gm-Message-State: AOJu0YwKOqF6+cB/wlhVy87OX8Aw/ID9SzFUyZ5Wzxo0CiUoQHxMjzpG
	KjldoDKNV6th9eAIDInLSMp1KKabVbpQJXi5xti9LVKTZp4gIOBCM0bOhqyjiYc=
X-Google-Smtp-Source: AGHT+IGRtANYvGWrhQtu3vdhNfP0IhSFvA/Ip7py6OvKZ1/U2o6Uvsc6P0869kN6OpzIIy5XVgAZbg==
X-Received: by 2002:a17:906:dc8f:b0:a99:f388:6f49 with SMTP id a640c23a62f3a-a9de61a0fc0mr906312266b.9.1730479923682;
        Fri, 01 Nov 2024 09:52:03 -0700 (PDT)
Received: from krzk-bin.. ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e564942b1sm202087566b.5.2024.11.01.09.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 09:52:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] ASoC: dt-bindings: qcom,sm8250: Add SM8750 sound card
Date: Fri,  1 Nov 2024 17:51:58 +0100
Message-ID: <20241101165159.370619-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add bindings for SM8750 sound card, compatible with older SM8450
variant.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 2e2e01493a5f..b9e33a7429b0 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -25,6 +25,7 @@ properties:
           - enum:
               - qcom,sm8550-sndcard
               - qcom,sm8650-sndcard
+              - qcom,sm8750-sndcard
           - const: qcom,sm8450-sndcard
       - enum:
           - qcom,apq8096-sndcard
-- 
2.43.0


