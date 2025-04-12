Return-Path: <linux-arm-msm+bounces-54112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CF8A86F6B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Apr 2025 22:27:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A9A68C088F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Apr 2025 20:27:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0D80227B9A;
	Sat, 12 Apr 2025 20:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iGXTbH9B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3F7224B04;
	Sat, 12 Apr 2025 20:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744489623; cv=none; b=a9YZKK4UDnYkS1t6DJ+aNLwxXnyOXqaO1EfdL9d7SbxUYIWv9qs2dhVrAVrIJNx5qyLLJY/1kHnYDYufAFn0kYWB4vXAr3dLKm1Z2iwU7G8/UeSofKKLQjbaVR+U4ERAzrj7fyaaXzaF315ioaGntQJhsGFn0Q4bwX78PHp3020=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744489623; c=relaxed/simple;
	bh=Nd+e6Ws+xwrtaSYE3dh3Uuwq9ccaQODygYUBbBo6uZg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VpxxSbfNb4AwcsIYNjnFlFbwFdCKWZHlQ3Ldw5uxlV/3ZRmyECxGzh0QTQt7yUclogOHzldWwdoGCA/agDCPY6Yi1EMKnXp5CZyJPrNR6ZviRZbQC/rxhIQ7i5zEneuBelE5cKiAkx2vZrzHHLP3hAubPSjbMByfAYNBXHqO7qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iGXTbH9B; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso21428025e9.0;
        Sat, 12 Apr 2025 13:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744489618; x=1745094418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FGZMdc52q13yeO94asjBB7hiXHPLQfLBvZpzYqeIrBI=;
        b=iGXTbH9BGawuFFvmVHCP2wWsL2Ls3m7qCOHelbpdbaFdMIHw6cgWhW28X15jfdpFdM
         tGzK+DC9G9vmOoio/XH2K+CMwQMh2dUI+P4J8y2OlcR/49+SrjvAbK1/XLcrJcbcm4+n
         1kjYXbBcz1twBMiB/ke9FIw1m3Eb7jhWieUIsbKcddSdXQlJM8xtqSwvyjyEpySAhZEk
         ameXV4dDKz0+kcH0zkiG/NICSXSsortBz9IofXcnbHTfaefdpMg/Yj+RE9vAespqYIpM
         F3lN94ar/pigiOLT6FRs1MtV5s/F3MKtMkY85V3xwfx62X+m9Px0UKA4rYDdJbaFZMOG
         DgdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744489618; x=1745094418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FGZMdc52q13yeO94asjBB7hiXHPLQfLBvZpzYqeIrBI=;
        b=vgihKB3xgZZi6oHWOicqrGS6h5kQhPoesCcfZEj8YGWqj2CmR8YwbzOpd3TTlXRQ3Z
         LRjnlZBCYRjRO6cVfou5GkB3RJ0K+wBEVp/pBPgTLPlY5EKLUwg7MjsOL7VVB6TBXR8e
         TXhdnCUb4SgLJmjYKUomQKIh8Cak7gNpscW1LUTpKMy+8QYQvcYgItVr8nvc2j/da+S5
         /x92f2Dv5SkIWYSOj9vEDMH9mtdbxfuI1lZbWqGqMBS9jkG5GPXj5wepll/flotH0q9X
         LGpyMSj1SunkziOSMlDJnhhe4/IpGlWbqGJvIW13WfNPGobuPr5gTzLmta7+Uip3UAk5
         vsHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUShp8DQ6MDjOePl40aFIA+UVvDrpFGQKogfX/pd9wp9mLi/3is0i/Zz3y1AFmATDRnv0RpMTNWTFr4VaQ2@vger.kernel.org, AJvYcCVGR5iqPgxF84DL/gQaoVv66RM47ZUh/PuXoHm+Ajt0s2bf4AbbKC16stLV0gFvXfR12jm/WA6F3jMT@vger.kernel.org, AJvYcCWMhSMFfJ2Y+QLxYTCVtbuQm65YxIUeDvC/CVNlpnG5jVRsy5DAUloYPxIYm+ki2m4E3ie91b7np251FKIhlg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPo5senFgc1O37UO1FQdeccSAqCHh8gyCSAnKqCNuFK6zinwU9
	2MU+UPT8YIdmGostFJ/DuI8jF3IOI0W7+FMkN2wFr/qBT8bG/nTnjQRTtg==
X-Gm-Gg: ASbGncuaX9+myZhY7ogbg45lbko+Fu/a6S51MgrOq1DdiFvyea3cAS8nHlaF5tEf6Zf
	iN7wvq7kwKGs0yv0AqlpsoBhO05rMW3e/Am/f0BYernC7ETf6cY6Vnd897Nk3cL6ch3XV+R6XL+
	9qjGbK9umyfrHCuxcCHyy4ZflK3uY/VKzIviB549pUWQyCNuraDXDgLJum02Tpt2qdwb7tQ2XPL
	sehVntxiIJYLpVfkRQpMwEH/uOyqlb9h4UCVsLkdFMfNJ+UUuzyQRBWO4id91weAt8riUhL27Wk
	SGOXeM+JYkxCS4OPS2txQcqVDy2rBxKdV7bBpNqAQQwzMMe7zYfHkA0JTUHadoOt/31O+JEMS8p
	ohHGoO+NQJYIvSR82
X-Google-Smtp-Source: AGHT+IGx6h+geTf/v9W2DKJjLgpVdgmXIoVjN4mCIjEb6l8h9zRIXZaS88d0GwzNPTfrjVbCyUePFg==
X-Received: by 2002:a05:600c:c06:b0:43d:8ea:8d7a with SMTP id 5b1f17b1804b1-43f3a9b00c2mr60408365e9.28.1744489618240;
        Sat, 12 Apr 2025 13:26:58 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2338d802sm131797845e9.1.2025.04.12.13.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 13:26:57 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v4 02/10] dt-bindings: phy: samsung,usb3-drd-phy: add exynos2200 support
Date: Sat, 12 Apr 2025 23:26:12 +0300
Message-ID: <20250412202620.738150-3-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250412202620.738150-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250412202620.738150-1-ivo.ivanov.ivanov1@gmail.com>
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


