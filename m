Return-Path: <linux-arm-msm+bounces-39313-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A47B9DA7F5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 13:38:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B20F1B2424D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 12:30:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A55071FC7ED;
	Wed, 27 Nov 2024 12:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jgwf+m9U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB75E1FC7D8
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Nov 2024 12:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732710604; cv=none; b=XTvqDtLfOIrqmaDCzpyQ1TH3HOtrDxAPhmv+GkPBdVZle2c1CTp502+FLTcDp2Nc3dV1nw+RV7urJVkzeZEreQ+C6mExJuyuXJVhchRF0NiYHQ+8+4PtWpysQB3+NtpvdBoOgyVYqPR1eqOFZuVRssuI1w2rHwQ7b+ZUWufdrAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732710604; c=relaxed/simple;
	bh=iyu4hyGtRQ9BSK/cbE3Hv+9qfGlOO/mAhRIDazIo4xs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q2Vc/vn0fIwP8E3GnjnWlMH0lMdrcLJ8WxvhUPNvaCsgfrex+p1YWTFiFo+8mockU8spolmiawSYPWoPV51RSiSPsD6ChC2faLBW1kiJ9R9tg0SzfLEJYcTWINSEXRRVJcjTazPEM9vW0rMSDH1EALiAe//QoMyJ1aaIj+WrlpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jgwf+m9U; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53ddb4c05c0so667362e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Nov 2024 04:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732710601; x=1733315401; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hH6aDQnPFD78bvqj4M1knlglxon1pLBcKd5lu/QTjgY=;
        b=Jgwf+m9UQ73eYBLQzjWE0b1jqt6ZQaXA9V4UZL35K8qAz9lddxZjN41748cSEqanGd
         0ER9a6tuydbUt0EEEVa1ND/yTCnPERD/lvhXw0twdKCNwI0KLCqoA4is6jWKzVAGdZl2
         T2zJ/CbDC8SyPe8MLiCMgz4CRPVD8GjyQWiO8TSr4S7DWcnXHFHvKXMRKwaKB93u0lMr
         tB2Akczmqn2mY6kLHOLwr5iuDuDy2vASuiqqEPKwB89kkfBgz7jRmEVzfZqp/F5M/cOi
         VbRscLfC1/1Uv3v9brFEOq6lM3XqxRSbeps6Ks7aW+pJdZaUXVsxalcUDwngMRZgQhPC
         2aaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732710601; x=1733315401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hH6aDQnPFD78bvqj4M1knlglxon1pLBcKd5lu/QTjgY=;
        b=qmE890EXaF9xwG/K9TqaaLIYl921WcQVyI2LtuFZuBDCw0+BTU8dVJVOxRSbC+D1Ln
         52n5TmOhgM9zIW7xxTesb3MIH9lJ+6ls8Onh0g5uiq+n5DALkXwmA7orFZfxho+Z8Wep
         0+ww0hsEl0LiEY3SRZf4tnF4XpghkCSuv4DSZPYO2OvbJkBCFH23R9w6ii3bV5sPdxds
         ikFSUZQ7JqkWKw2IYNq7o3wP5Qhvk86CVfI3do/K/8HuY5m+CoZNlgKZ1cjQKmpggNIt
         orybmMWOsSnCXvd3e7Mf2Ps7qyUX5l/eghH0clXA5t45PD7SOfs6f2spalGRuaTFO8su
         dcIA==
X-Forwarded-Encrypted: i=1; AJvYcCX/MnTHSBc8+YPmH7gPv1MdxXdA2j6OPrNt9DufBhW5Q095NvVobnHFri7CP8viAl4Sbo4sU2keWvaaR11K@vger.kernel.org
X-Gm-Message-State: AOJu0Yzzo5WCgaDArOP7m053vWELsLldSaosgjQdBEuGLHRVwhee+pU0
	F3i06oeLtfP8iJTKiIowNvpp684N5opgT9T2sPOJ/FppOOsBlvood1cktwHjY5I=
X-Gm-Gg: ASbGnct7Vsy4l21gVLcdL/CLDCi2gTZG9JjMQy17ucdndDjnkDymx0kztXclGZa5Yft
	V2SVVFwVEk+s3Sj7mhuhNwudds80W3NqWG2q4nlApBxx/AWojHbTAMlsKLozkgyDLHoiBNHWf37
	n9O48ZQ6kCnKMRTWQPX3wtYBWCWXPAZJIRrKfTajzDdhYKQLf14lrNOHKe61MsNfAGOxZPUMo+F
	3c2aY/LSeHlTyaLaKQwWy44HVbjLc2vO3075z79nBnX500IEWwFLwECapqhYqY0tH6BSQ2SrQur
	UXwoEXrcaWjqyddzpg0uYvriXTI5v/1PPqk2sWs=
X-Google-Smtp-Source: AGHT+IFCByu2ouCkagZKW4uLx+JbF+mJHdB3pW79idrkJu93Q0BIq6XuKCYGutC6aXKhGUwZWS65TA==
X-Received: by 2002:a05:6512:3085:b0:53d:e7d7:6122 with SMTP id 2adb3069b0e04-53df0020b5cmr468360e87.0.1732710600880;
        Wed, 27 Nov 2024 04:30:00 -0800 (PST)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd24953a1sm2276621e87.228.2024.11.27.04.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 04:30:00 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 3/6] dt-bindings: media: qcom,sm8250-camss: Fix interrupt types
Date: Wed, 27 Nov 2024 14:29:47 +0200
Message-ID: <20241127122950.885982-4-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241127122950.885982-1-vladimir.zapolskiy@linaro.org>
References: <20241127122950.885982-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Qualcomm IP catalog says that all CAMSS interrupts are edge rising,
fix it in the documented example from CAMSS device tree bindings for
SM8250 SoC.

Fixes: 46f8ac8497c5 ("media: dt-bindings: media: camss: Add qcom,sm8250-camss binding")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/media/qcom,sm8250-camss.yaml     | 28 +++++++++----------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
index fa5073c0fd1e..06db2c1e6079 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
@@ -329,20 +329,20 @@ examples:
             vdda-phy-supply = <&vreg_l5a_0p88>;
             vdda-pll-supply = <&vreg_l9a_1p2>;
 
-            interrupts = <GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 448 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 359 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH>;
+            interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 86 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 89 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>;
             interrupt-names = "csiphy0",
                               "csiphy1",
                               "csiphy2",
-- 
2.45.2


