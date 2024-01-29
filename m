Return-Path: <linux-arm-msm+bounces-8831-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 47870840448
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jan 2024 12:54:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D1F91C22AA8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jan 2024 11:54:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 515D560DDA;
	Mon, 29 Jan 2024 11:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="onsBLnSO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08FCB60B8B
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jan 2024 11:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706529157; cv=none; b=OZcxLsmPGaZW0qaXi2o/al4vLAPA1gHEzuIstnwOCjYSxexTxtocZWFI9DYjFbT4Gl50/JmEa7O78PQZZm4vm0bpsqIQu94IlNH8v/bjm370EQ9iEzGy9+MPNqJvBHWcbwq+HIRpDkOLE+4952DyTmsiuthhZj53WRv16+jJYiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706529157; c=relaxed/simple;
	bh=oMxlIYU8lOKLFt0TEL5h53mUDoaj/hO9QDpO+Y17nsg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qo8hJHuwM6SQMFSyRGgUO2mQSGaWSDoxemCZeGb9ePgy6pi3MYfljQzzwETD7aSdkrzWbwYOd9lRuDOOoagoXqp1kz8MVqMzTJpknia3UFiOIFAtmMoWUZj25r+c36jHMT5/y43GjnoDmyc9bH2ivrA7MFxSiRLmOJIpvOCKugI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=onsBLnSO; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-55a179f5fa1so2855335a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jan 2024 03:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706529152; x=1707133952; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qG0lQDgeayG/ZAaWGjl028iUARha7B2YZJgs2y6qJ/U=;
        b=onsBLnSOlbDh+dU0MK93ZLMDFHtfF+N6xtyDHOtKTDkSOl5a3Oh2oy/7VL8iVjtXIf
         ytk+1oJdeQbQkVEM9mXmvsGKWe75Ly9Hflc/VhV7S/5n+XzZF6z5zxlEvEaIXJmTl/vO
         MY9I/0BkxOp8TKOBQDOMkJ5cU5FGM9UvqzUQXoAN0SIIa1ppv/XDxWTnaO7XaOFIHu9y
         PxqQLpr1vsAhzW89erW+hjk3usObWQypvaqdQQ1I+w7JuK+pE+a8EtDpOqWgtjm+Amko
         /lVQfKI/kepryyi7VCZgawaWUfQME5AY8+L3ik6Qwtr+P+jQXfrAoPcET8yZZTLbPPpK
         Eziw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706529152; x=1707133952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qG0lQDgeayG/ZAaWGjl028iUARha7B2YZJgs2y6qJ/U=;
        b=exuYYTce1jMFLZ0bz83XepOiwvdntP1mgE3N411GtsNzn6Kj7S+994uYSb7FkTk/cP
         zYptKMXlCHjRiJVPpwyCAQo18i8FDltmeEFghgerbOrMSTCPbQ2/T7z+tilMdO9H8ubs
         MFGrku0PRZ42m68gg7uQuZqvZ2LfguojxEzTC6icAwDR3TX9i+f/i4NimEW2uiAPuqQ1
         ybNiSi/3m6Kh76UuPbsVXprg4NT9KLH/0Cf9MTdA8hcU4PWvMjIcCdRzRGRrpGMLmykR
         4R963E4Jtdw4w6jszi6heVwriBCvE+4/wwFr3pIhWAbJju/JgTwiPQrqqwq7n3eUjht6
         nuFQ==
X-Gm-Message-State: AOJu0Yxx8audrLCCKecwF4T/BWArfp9N19AzbApt0VsT71JT0K8+6yZg
	BNkaF0XpMZl7Sszagi05ptyaWdAhFjjd9ofXioVxeKNnK485rkDb6C+5cXv6EPw=
X-Google-Smtp-Source: AGHT+IFDB1cwKRTLnQ9gFJhaKmMAvmpkWXV6hf7V+Jjgh/DxIPtnqqWmUvLckWsARwnj54wstPEtRA==
X-Received: by 2002:a05:6402:2709:b0:55d:3787:fa06 with SMTP id y9-20020a056402270900b0055d3787fa06mr4268042edd.26.1706529152297;
        Mon, 29 Jan 2024 03:52:32 -0800 (PST)
Received: from krzk-bin.. ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id ec19-20020a0564020d5300b0055f29ececeasm19907edb.57.2024.01.29.03.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 03:52:31 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
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
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Sean Anderson <sean.anderson@seco.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v6 5/6] ASoC: dt-bindings: qcom,wsa8840: Add reset-gpios for shared line
Date: Mon, 29 Jan 2024 12:52:15 +0100
Message-Id: <20240129115216.96479-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240129115216.96479-1-krzysztof.kozlowski@linaro.org>
References: <20240129115216.96479-1-krzysztof.kozlowski@linaro.org>
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


