Return-Path: <linux-arm-msm+bounces-56686-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9161FAA86CF
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 May 2025 16:46:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 64E5C1896F50
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 May 2025 14:46:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B1921DB363;
	Sun,  4 May 2025 14:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PojG0M4R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B801C8632;
	Sun,  4 May 2025 14:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746369944; cv=none; b=igpQ8yQGikUPFozYGTLMx6DcH4phJCGdhxv+HEY5tNlcWMw7SofaVrZYNmPOIl+2CVuakS/76VQqGOpVqooVuRZ9zHsyJMAQdRZyPOhEPVjEKBQn8L+VbLYns8ZT9HN1Jc7dcjG7dxgFiy6yRb6UafE34c6eN5/2H5j0Wpujmic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746369944; c=relaxed/simple;
	bh=hZE5Mp6GiZHRqhUj85+sXTi8Fs9hMZVjICkycr0tjoI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W4M787cVeaEDva+qjdzNaeTBtA6lgv2/hphVRcT+cclFYMzrEn7gf3Vhv5G7hF0lFmXATx+lzJNt1RZKz13aXU1UzIKboEg6Wx9LlLR6pcaJYfmIkKawquuNHq1nmdv88XDrh+8Uzc1GLRxT0bJqBu0nqLpgh8/zZ2o8PAlV3h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PojG0M4R; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5f63ac6ef0fso3848101a12.1;
        Sun, 04 May 2025 07:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746369941; x=1746974741; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7BSVq6jDIx0gJiVYHcgvtP/1XdtkFfYyKmECHdYtqDM=;
        b=PojG0M4R4Ks1GWFYNoGuHn4XDAqykiEIs17bHpsmLQhILv15nujmsY+HKrL5hvH6iv
         EdmY6khQhPEn4mXPTCT1VZ14rdcByiq71LXAY7UkFphPBQauIk/EMkO811DqHZEraIZU
         rD+zqm0Mrp+6xtt0vl9uh0770PcuEjj6shUrMLcZAfq3Yh7puwCrsgRHeYj/A+rhw6QR
         oZVYNwnzz83QZvKHQnA6gy3tG+ldkdX4UM9zNslvan010rN/k+aZpWFHyzVU5CQ4mySC
         Cxr2H2IlAu20OcPLjESrijimQ+4mN8qSkuOVkLK/vZnTdYb5grjmqdY4PIqw1COj9o+h
         cyEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746369941; x=1746974741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7BSVq6jDIx0gJiVYHcgvtP/1XdtkFfYyKmECHdYtqDM=;
        b=CKVeYbFdbbEOc5RgqCIThru2TShI0hBaLvADTdsMDYpsNaIzWl1mYvYkey5dR14CwL
         s9IToIXTy8IYNTXrhVUHZ/8OWvtqxgklKPlBCeVoyaJSwqPjHuoDwSO7di4ifstRZ9FR
         ofIxFY/QQU1KufkYSRlV9vu5q0MuomafuoyY8eORarI46EWDGvsM9td7srLZNeSGPqYr
         8iBAcFmwu7nxca1qGSfFJud1gQjcNVEGsEAxqP2RDXiq/uUDXHtwKYu+93zg4VIaMeGL
         GYZyy2yyFfNoCBL3sLAuF9nNr1NWwTYig3MVNTrAqpfYfL7d5s+9EPzgbwRrvh660eue
         3Oag==
X-Forwarded-Encrypted: i=1; AJvYcCUcoDBtpj48VbWKZGWPN4Q5s56E7cDS9nRxgKxMrG5kMnY7B8TwdMnh6mgIBfLJuRaLQjhLCgHCYYFm@vger.kernel.org, AJvYcCUpmctwKRkaxgz+WQrTqhkLkv0wIqBCH/0WWY6LNfsGchH7+2VNq6I+tTMWU4LGLorqPYU2czP3Y6a9Lvq7Hrv/qVM=@vger.kernel.org, AJvYcCUvzCHZAzYBUdS2TsjwLgY9h+R11Q0CwAOClYS+v8l1D2oNRCcL8LwpBSsaw10H6VQZ/ac2DSEXa0TVQQ9X@vger.kernel.org, AJvYcCVnDzsTDxq+oDZt2y1sxoVZw+C8ksfEgSfwtK4XS3zd3sUVLTdmIWrEz0oqMNOpt+jkQfEv8bPIDn+iJCJKZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxF7LDRfMnMwKyhWRyI1r2Sjhukg+oMbVuNmIlE/S3O5MMRtzhL
	B1oJ8T5kskgHJntvs7kfiCCSkCMaiNchxRs9GzvOZzYWGVA2GV5w
X-Gm-Gg: ASbGnctjR5j9eyZQVcsnwfSvBYF7cpcbSdbbEmjoWhPZmJis3vv4xJdGNa/JlCp9NSQ
	HXmroWM8udEPqGTyyK09izyyCsLgHBie+3BIfFcKxWY/Cy0k85XLjy+IZpGSnHHrhVFeTs7E5C2
	TGAK9HnazoUpytx1i1ZPe3TLM6T2aoDITgzsBcEf7aWhjsva23U+UVYTP8e6DOEzsQYIZ8oSDmw
	LWLuyeY+h0O5mYLxA1trxzVBkff/xRe4Tuo/y8SkkZDwUbyHoLaq/nqAzdZxYNTQchREZ+oqKaZ
	54DWynGIBkhPb/gcZLhcNvK6Iru05H8TNCs4XUVN7+MK4xqKhUvgFcd7kdsOEk2ZBLbxgQd0DXf
	CYAeCabpmTRo+phY8
X-Google-Smtp-Source: AGHT+IGseBUdREIdCgIBWp9MzoQsy7P4bCBbCMZPLx3ZedRLperaW69nIVN6ZjiqGB8e6RpDelnxiw==
X-Received: by 2002:a05:6402:3493:b0:5fa:e2bf:5491 with SMTP id 4fb4d7f45d1cf-5fae2bf550bmr2184616a12.11.1746369940623;
        Sun, 04 May 2025 07:45:40 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5faecf59d31sm1147258a12.77.2025.05.04.07.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 07:45:39 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-phy@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 02/10] dt-bindings: phy: samsung,usb3-drd-phy: add exynos2200 support
Date: Sun,  4 May 2025 17:45:19 +0300
Message-ID: <20250504144527.1723980-3-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250504144527.1723980-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250504144527.1723980-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document support for Exynos2200. As the USBDRD 3.2 4nm controller
consists of Synopsys eUSB2.0 phy and USBDP/SS combophy, which will
be handled by external drivers, define only the bus clocked used
by the link controller.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/phy/samsung,usb3-drd-phy.yaml    | 38 +++++++++++++++++--
 1 file changed, 34 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
index 27295acbb..4506c5801 100644
--- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
@@ -26,6 +26,7 @@ properties:
   compatible:
     enum:
       - google,gs101-usb31drd-phy
+      - samsung,exynos2200-usb32drd-phy
       - samsung,exynos5250-usbdrd-phy
       - samsung,exynos5420-usbdrd-phy
       - samsung,exynos5433-usbdrd-phy
@@ -33,24 +34,32 @@ properties:
       - samsung,exynos850-usbdrd-phy
 
   clocks:
-    minItems: 2
+    minItems: 1
     maxItems: 5
 
   clock-names:
-    minItems: 2
+    minItems: 1
     maxItems: 5
     description: |
-      At least two clocks::
+      Typically two clocks:
         - Main PHY clock (same as USB DRD controller i.e. DWC3 IP clock), used
           for register access.
         - PHY reference clock (usually crystal clock), used for PHY operations,
           associated by phy name. It is used to determine bit values for clock
           settings register.  For Exynos5420 this is given as 'sclk_usbphy30'
-          in the CMU.
+          in the CMU. It's not needed for Exynos2200.
 
   "#phy-cells":
     const: 1
 
+  phys:
+    maxItems: 1
+    description:
+      USBDRD-underlying high-speed PHY
+
+  phy-names:
+    const: hs
+
   port:
     $ref: /schemas/graph.yaml#/properties/port
     description:
@@ -150,6 +159,27 @@ allOf:
         - vdda-usbdp-supply
         - vddh-usbdp-supply
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - samsung,exynos2200-usb32drd-phy
+    then:
+      properties:
+        clocks:
+          maxItems: 1
+        clock-names:
+          items:
+            - const: phy
+        reg:
+          maxItems: 1
+        reg-names:
+          maxItems: 1
+      required:
+        - phys
+        - phy-names
+
   - if:
       properties:
         compatible:
-- 
2.43.0


