Return-Path: <linux-arm-msm+bounces-25359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B74409285F2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 11:55:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E8E5D1C22361
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 09:55:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD135158A03;
	Fri,  5 Jul 2024 09:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="npITUVfc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99FEF156C7B
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jul 2024 09:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720173141; cv=none; b=GcRC0CCLe1Unqup8hCbVIwDePh6hP5tzeuOVd3PBs35AvWrfNmYX04IuDkQMSfwgeY7bS3EHPWhOwuh1/0CVt9Z2/xd42aWA8rwFkJmYXJivAhl27OryfOTBhWuer7up/FapgBoYJyesoKTlpULc3O+u7EyBSKF4fI0tol6aDxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720173141; c=relaxed/simple;
	bh=TI55Go07WmwiV/8/mxI1MAibWeb5pb00J67OAZMLAWU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tmy3bcxDs061aGBqVWEU9GOgCBe1LqxQM5ubj4vFC4fjIqykbNx08t+Wskrt9mXi00JRhVs68EMAIVDaVGM4IZyc62BJ6CRzPpA92TKLD9B3DewXfWGqF0xdT7CIhljHxFRVi2/PWSApPN01uk3ifeUz+Ycdeww8+MAxM5egnOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=npITUVfc; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42565670e20so15711335e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jul 2024 02:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720173138; x=1720777938; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vLdo5ZNT2z5DP6YaYiw/31TFoY7FNKHY9Kz30lffVbQ=;
        b=npITUVfcJ9d6/UAgfo3bOC3bygf0NlpDz267oLl9Iik9aoWQ1xMCvuVbive2kkABf4
         lL3CYyuPbV+84qJo449LLscwLcOq2vUwig+GkYfoqjYvYNI8kWS0n0cN9dQNARUFjct5
         tl5XQOIzPKSCIlcIOXWOQcqsWRmJpEymf1aYT+bXTMhMfHKGbI2QJU8YO/IG2367Xa+v
         xRZiTGHAw8VRU2imqoCF9SIv/tZi6VQPP9jbMdb08+6vcS3bMtsHUpzKvrXPCFgTLXF7
         4rxaZcUqPW5Y7El7fwQM/uFpByzSt04cX/jXOLVNOkohCq0i5ijAdgVbd+ZbpBeEBL6q
         dGnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720173138; x=1720777938;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vLdo5ZNT2z5DP6YaYiw/31TFoY7FNKHY9Kz30lffVbQ=;
        b=DCxGhwToLQK9+LuGzvvpgfDpcP7VVuTjVCbyrU0/olcK9peOm6U/maze4vhQuVlfIO
         pVStil0wsEPEEPAsnCTh4ncKHIywp35rCzdenv86BWN2UX+6w8a9LhOBmfI4s0xa2zaR
         5KDptEtPc3PYNiSCt6c3p27LFNU6gSN+6MWKnwPvZKDpvN/XgOcG+gOZJPdKz4adIQML
         W6Ogj4VfMsFBplYArmPyFF8DAEuiwOFfxn4FalIywHnVrfr+Tu7P/aROu/Xp3MIzgsAy
         6w9ocmNRFP1YQLYx6Zx8ZJ+0TuBVKuGgHBcS/3p2oc9g/41TI+/eEYZNFVsx/HMFFf6X
         S6+A==
X-Forwarded-Encrypted: i=1; AJvYcCV2dmjvir9o6VjWF/2Qy08bbNrRuCWdNMefMc59cVpNXylKFtpHxzsETbdmmRL5XSbor+YB6gdP5MCY9eM76Zi2zPNGR8Z1bGgLcR+RuA==
X-Gm-Message-State: AOJu0Yx7V69JvsfnjRQ/sUouXD4CALK6o0QdYjzPudkVAglGja4F4Tnm
	h+A/BoQJyj+6CvvK7MDtuy+hXK1dp8lZJy9ltwUQR1Bh261a/5nisdIqolpLAeQ=
X-Google-Smtp-Source: AGHT+IHWM39hkrT3BCL3vfzjlAmuka/milJOhLsZ9b2jVVuI/YsPmNdIWSCcp8XEI2B47DXGA4PYGQ==
X-Received: by 2002:a05:600c:6b17:b0:425:8cb6:5613 with SMTP id 5b1f17b1804b1-4264b131627mr39440625e9.9.1720173138065;
        Fri, 05 Jul 2024 02:52:18 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d1650sm55528995e9.2.2024.07.05.02.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 02:52:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 05 Jul 2024 11:51:32 +0200
Subject: [PATCH RESEND 13/22] dt-bindings: thermal: rcar-gen3: reference
 thermal-sensor schema
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240705-dt-bindings-thermal-allof-v1-13-554061b52fbc@linaro.org>
References: <20240705-dt-bindings-thermal-allof-v1-0-554061b52fbc@linaro.org>
In-Reply-To: <20240705-dt-bindings-thermal-allof-v1-0-554061b52fbc@linaro.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Guillaume La Roque <glaroque@baylibre.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, imx@lists.linux.dev, 
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Florian Fainelli <f.fainelli@gmail.com>, 
 linux-rpi-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1327;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=TI55Go07WmwiV/8/mxI1MAibWeb5pb00J67OAZMLAWU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmh8IvuqTqmG0TjJXqzakOUBfK+8z1WVpU62RhN
 HP4ZVcil2aJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZofCLwAKCRDBN2bmhouD
 12L/D/4y67ykiZYFPvIg14LqdydRnQLMNtimrHyOjmnNi6ZkyZiXpMFSLaXCQlRWbqdUt47gam/
 4IjATok/3/SvLkbo2IV0QYXPlGhU1Zp5w/Up82uz74ydZ/Ckw5UK3r7ibxFd6hgrhlGdRtC60vi
 zrTtVOd2njeN40jqyTrNk7hNpBrkllmAX5HdnlDzw2ltUDqIdTSVqMP7KZ7nOcnQ1r70BtEDDCK
 WT9bD9DDbW7kI3Tn0/6r3i9hKfvijriVO0pIWZss/FVZ2zGLp0Qol6i1Ice+xhjO1RlphzZweMS
 qBshFHGYvCQ0nWrECvcUyeIo6lQuaYEZ+pyGu9Z9VRUhsD9TiqUJ4t/0Z269NCKgCvPKB7aZbU0
 TuWY9t8ySj2PLQAtEGegmVToTgHipxADRTx58p2172TdOUAPnPmm3j6lcYmRj5lTZ+lBWkLyL1l
 GEwqIjG0SWSB2TNm8rhntdoW2Imt3Xf2svnNtsCJn2r9w87cP9sdIsO1MXlq0ICfZ0NfznqHkMH
 TP+Nt3lzLEX0KNhP+Xw0Ulr+J7Nz6f7gOL8jbQJfxO5g21KrBeBqPpwhZMjPGWiVXaNi2g0lKu6
 8wTibgLtmpGTEd5TJE+oJlglalDSoEYDgOF/403ECyk+0A5xuSGZtG+9AtTUrJ0v4dodsULFoU3
 Mn5RhWP5AGLuDsg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Device is a thermal sensor and it requires '#thermal-sensor-cells', so
reference the thermal-sensor.yaml to simplify it and bring the
common definition of '#thermal-sensor-cells' property.

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.yaml b/Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.yaml
index 6a81cb6e11bc..d92e882c9e8d 100644
--- a/Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.yaml
@@ -15,6 +15,8 @@ description:
 maintainers:
   - Niklas Söderlund <niklas.soderlund@ragnatech.se>
 
+$ref: thermal-sensor.yaml#
+
 properties:
   compatible:
     enum:
@@ -57,7 +59,6 @@ required:
   - clocks
   - power-domains
   - resets
-  - "#thermal-sensor-cells"
 
 if:
   properties:
@@ -96,7 +97,7 @@ else:
     required:
       - interrupts
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.43.0


