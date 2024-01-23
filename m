Return-Path: <linux-arm-msm+bounces-7956-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 23730839106
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 15:15:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A71521F2A46F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 14:15:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1722F604A3;
	Tue, 23 Jan 2024 14:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FoHgnanV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1B360268
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 14:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706019230; cv=none; b=Xb/XJANtmjiSOmFYb0p0zwbGJRXfU09zv8wozutm53RBScfjYKxOacWz0DN2U3ls7i0+kxW5hQfAMOvxtDD5JhKZ+EG+6J2m6EOrpwhsOyy2sVOBd3tiAVKdDLjsBBYz049WH+n+2OdsQcGioHnP1eIFD52mLMBA/FJVKBGhDHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706019230; c=relaxed/simple;
	bh=oMxlIYU8lOKLFt0TEL5h53mUDoaj/hO9QDpO+Y17nsg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=A4p6iOZcZAjxrdIXoQUGZXHYgnyZB8NuT1LNOPBzgOGPCIdCnsVGvNElwHGC+vGRX4JOQ5BJMOF2TXZa0DtmhJ03X1LXX2pGf9JukNLna8FN4WK21CLwY7tByvRfCqvmYIptMq7NT8Zf3aZ33yQxvwpFBVOHFi2fR/1DFBtDpr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FoHgnanV; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-337cf4eabc9so3552551f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 06:13:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706019226; x=1706624026; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qG0lQDgeayG/ZAaWGjl028iUARha7B2YZJgs2y6qJ/U=;
        b=FoHgnanVMCi7WgzrN0QbOc6FZbvnblhqMDAzq4gZj2nxoTFiy007yz6PW19fhQWAgy
         cyh1jUVBWT70mhAQWq/MV35jJLTQSLnsnrwjA1Si/yYtYJ0S/VVzYkl5UEexMygbhpGf
         2SgVM/wZOl9ShMADe2aAOFair88GbwVTrWKaQNQXLjjVYhQl6f/d8u4+QyHMKxjS1Vj5
         4C2WTI/ziQmI+lPlbqsbtHQ7AJWKPn64FUGc4VBDNESdR5ZtvIx9CrbheyNg4Cj4xoBO
         k+qwqJob9/4JrkknnHcc4hlbrvyo3VfZAh7rTucRdO/hCj2fAcIS3dL1pr1J87uwwaXd
         2ccA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706019226; x=1706624026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qG0lQDgeayG/ZAaWGjl028iUARha7B2YZJgs2y6qJ/U=;
        b=LPhCUD4VsQTECLiDUauRmQuDqKRFMbjeYEP8cARxfCkd3OaJbndxvin8A0yAsFpz6m
         Hn2RAibFonPIMhe4zl1YlMaVBYsDGxH8U/HM9aOlgKPwBk3THdwvG2pPcgZwbK05/y7D
         2HB6Nl1gJ10eZ4SAQWuAeqzTcBsVxJlzDQaIjEuqvZZfYKkuGt4DvNLqDXIkeXhdyD0e
         J9qGxu2NMobmCu/wiBkZHeNzU7gWk0dXoXQ1Uu5wN8aV8QwFB/S2kds0xhJZlPE13ehX
         PKlCqdcGlchKhgcO4twl6iytemNZwX319Sj0kuHMTsnzESA63K+gqCcq3EyjmTOfm2Ul
         RwFA==
X-Gm-Message-State: AOJu0Yz4p/GgLKpWTGq18V1PzmOP1L2WBt2QZAwJwB74OKb+qjLS2yRZ
	7Svy/2urXhgXqgdZzL94hMabhREQ/PL+uVCeBWxZxZhGZoYB1d3kmS2xuqOqUKM=
X-Google-Smtp-Source: AGHT+IHqKV7UxmdKdHe6zjaK7RBNZnRE3p6gqEa/c3ykA6FNDvoSpVZjiP8ZtDmiAEKBeFc7P6DV7A==
X-Received: by 2002:a05:6000:100a:b0:337:c81e:cdb0 with SMTP id a10-20020a056000100a00b00337c81ecdb0mr2955862wrx.104.1706019226510;
        Tue, 23 Jan 2024 06:13:46 -0800 (PST)
Received: from krzk-bin.. ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id r8-20020adfe688000000b00337d97338b0sm12132298wrm.76.2024.01.23.06.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 06:13:46 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Sean Anderson <sean.anderson@seco.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v4 5/6] ASoC: dt-bindings: qcom,wsa8840: Add reset-gpios for shared line
Date: Tue, 23 Jan 2024 15:13:10 +0100
Message-Id: <20240123141311.220505-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240123141311.220505-1-krzysztof.kozlowski@linaro.org>
References: <20240123141311.220505-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On newer Qualcomm platforms, like X1E80100-CRD, the WSA884x speakers
share SD_N GPIOs between two speakers, thus a coordinated assertion is
needed.  Linux supports handling shared GPIO lines through "reset-gpios"
property, thus allow specifying either powerdown or reset GPIOs (these
are the same).

Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Sean Anderson <sean.anderson@seco.com>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

If previous patches are fine, then this commit is independent and could
be taken via ASoC.
---
 .../devicetree/bindings/sound/qcom,wsa8840.yaml       | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml b/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
index d717017b0fdb..22798d22d981 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
@@ -28,6 +28,10 @@ properties:
     description: Powerdown/Shutdown line to use (pin SD_N)
     maxItems: 1
 
+  reset-gpios:
+    description: Powerdown/Shutdown line to use (pin SD_N)
+    maxItems: 1
+
   '#sound-dai-cells':
     const: 0
 
@@ -37,11 +41,16 @@ properties:
 required:
   - compatible
   - reg
-  - powerdown-gpios
   - '#sound-dai-cells'
   - vdd-1p8-supply
   - vdd-io-supply
 
+oneOf:
+  - required:
+      - powerdown-gpios
+  - required:
+      - reset-gpios
+
 unevaluatedProperties: false
 
 examples:
-- 
2.34.1


