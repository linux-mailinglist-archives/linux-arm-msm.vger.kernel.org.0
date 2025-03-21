Return-Path: <linux-arm-msm+bounces-52186-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E26A6BC4C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 15:00:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 68EB0189358B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 13:59:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 384A114601C;
	Fri, 21 Mar 2025 13:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RsvCvtcM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5935478F47;
	Fri, 21 Mar 2025 13:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742565543; cv=none; b=fHgQDL5TvblVi/0q3L/DP5+ht8TnLTwl/ozNjXBzqfcF7T8n5yub4EytkZwSlRWLgAguYVc/6pcmWDbuF/D/XEZ5TLxfb4zRFRC9TI1xGLwLDhiowZ0VSKCj236FniAbwhErobCyRXmabXetJ3GBc1l3P4T+XSayiwRUuh0TZ0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742565543; c=relaxed/simple;
	bh=x8ajurCf6ZvLIBQzFoAafPLIC4tfA+qOVsXwL5R+C/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PP/ibHDtJLVPB3vcPfzleyeR4idSPujs3ZKo4Atez+IzcBoHxe2cSPDIPWUcce+66N9d7tYBsR2OeS0cKcIOEYpiwI5ipHd5U6pEPP1T3hVrqHbqgpxhMkDNiZYB4d68rQ5mWztSWLZT5FU/uA1aRe02UqKqo2XVDhqnYgGzGxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RsvCvtcM; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3914a5def6bso1234429f8f.1;
        Fri, 21 Mar 2025 06:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742565539; x=1743170339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bHKxmG8ByngkXQTkMpyDFQIrJdv7U/tLvQeFlUSDHEw=;
        b=RsvCvtcM59y4LP5atzhUXa7ki3jQp9uZCPUncVbmyxXhAZqyOmGD2SS/CVdLj0XI2Y
         zzMvRZrtXfXViRyMF0qoduAAOdQfYXEdmUvKJgfxYpgEWR3SCZ3wCmISV7+GHLR7nrHT
         1js/3IBS9/VaX91Fi24/3KQ6u+A5mIwCl+rNPOskgdxThGM2pjKOcfqPOIsEbtlZzDVH
         Y4pfAJyZhwXXImD7xe6O+lPQ39Hxr3/yc4Q0OSrgqSOtL8irMhjvCTVLBBIErrQxR7Op
         vQVO/IkSS0waCM2CH8c/MOLtH6uCbJwzFyApweV6Qs5jvtJuUzdPDfrAKDKnfWek603f
         C1OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742565539; x=1743170339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bHKxmG8ByngkXQTkMpyDFQIrJdv7U/tLvQeFlUSDHEw=;
        b=O795l1EEEhDQGUXojI8aRkZbT2L48pMxa/IW2Kt1Av1f4BE3ZvrcE1EHV4y1t47WII
         HwlevEjbWyuT+v1SvFFD3SKywxdlagpsGDOHG9XwKXfwnGxn/BHKuPCABXi2bn4dbewu
         V7Zvh4noBjUivVSv1ZSntatj0zrqreOwzRc//dfYLbPEOHpvjqA6cCf2yG2PRrpFEbF7
         A9O9FGl/PKCQ6xml6KacYTya+fK0K5QBj6wYP3LuiEEnZQcoFzYT17CRB4lV1j4hdRPX
         hwWUAd76gtlWJ5le25Gmmk4s5rmPcht0rbomLWTr+ED82xc1TmmbVhHDs2zElBjzfxsj
         NEoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGpFT25JNFMvkMPopCJEaKPfia1BKcWlPb/BBTifNy81ve769FmlVyxDhJqGmGMg0JT0tRDBvoMDRp@vger.kernel.org, AJvYcCXAr8GF5I008NZt+9Jg8Np//TT/2/8gg2suBc8RCNr/RM1xLxZ7Od8RUx/AFGnbYcpYyKy4bJc3PpXiR3s0YuN4clw=@vger.kernel.org, AJvYcCXfl4uk/9qwoLevoufS6s3A9fAElMmoRZWutY2Z/SAwE3xKvAARFDoSH+NWWYHVIDKUukIrGrgcbc5oAkwv@vger.kernel.org
X-Gm-Message-State: AOJu0YzJHQReJ4NVOHj19k87XT0Sxts9Rav2cdpM63mXdwmfHbQRMD7M
	QnwTxQu2WHQSKJDrF6S2peYRm7oF2qWlLcDucBkBSScaCOyiAucOuPCjRg==
X-Gm-Gg: ASbGnctGOND0Xj5q3WjEbQl2a+isADg9SHiBSleL5Op44WxR+J5Kg8f2twLHD7HClQa
	2B1iK4v5tGA/81j1Vweiy1HDZ6vIcInQlOEmN2OejXaueNzot7HuvBfgDadmnd2IG5abr4Yl7qC
	E/7092GErjMKEOPkuCpCg22PkSvXw8thUZHk6z0q2Qlr38ivqzZZqJBKmxDTEKIr6WuSGfZxij6
	Od7TnUDYweD1XkX3f8bcX17S5kxImB+A8DqAClqeOWIKpLCZCLJExz4xdkjwjwoBP9ldjvmyiuQ
	RlZP182Ni7EMkomiljxrOWOVVTlO50CFJyKneHmsG+0yzEkBpCHDzwwDVTlGoUH56jjuXPyaNTA
	8t0NEsM9aftBBvpFJaIa0
X-Google-Smtp-Source: AGHT+IE4BN38JBiKx76BxP/6BUTVPP+3ckbM6pNBbK+SmHspfVRVwIu2YBrzhMH7wBCy1RoE1+z6EQ==
X-Received: by 2002:a05:6000:1445:b0:390:e655:f998 with SMTP id ffacd0b85a97d-3997f909fa6mr2839938f8f.26.1742565539267;
        Fri, 21 Mar 2025 06:58:59 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9e6651sm2437162f8f.75.2025.03.21.06.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 06:58:58 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Abel Vesa <abel.vesa@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v3 01/10] dt-bindings: phy: add exynos2200 eusb2 phy support
Date: Fri, 21 Mar 2025 15:58:45 +0200
Message-ID: <20250321135854.1431375-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250321135854.1431375-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250321135854.1431375-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As Samsung has been using the same Synopsys eUSB2 IP in Exynos2200,
albeit with a different register layout, rename qcom,snps-eusb2-phy
to snps,eusb2-phy and drop mentions of it being only for Qualcomm SoCs
in the binding description. Document the exynos2200 eUSB2 compatible.
Unlike the currently documented Qualcomm SoCs, it doesn't provide
reset lines for reset control and uses more clocks.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 ...nps-eusb2-phy.yaml => snps,eusb2-phy.yaml} | 62 ++++++++++++++++---
 1 file changed, 54 insertions(+), 8 deletions(-)
 rename Documentation/devicetree/bindings/phy/{qcom,snps-eusb2-phy.yaml => snps,eusb2-phy.yaml} (59%)

diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/snps,eusb2-phy.yaml
similarity index 59%
rename from Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
rename to Documentation/devicetree/bindings/phy/snps,eusb2-phy.yaml
index 142b3c883..87f2c6756 100644
--- a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/snps,eusb2-phy.yaml
@@ -1,16 +1,16 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/phy/qcom,snps-eusb2-phy.yaml#
+$id: http://devicetree.org/schemas/phy/snps,eusb2-phy.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm SNPS eUSB2 phy controller
+title: SNPS eUSB2 phy controller
 
 maintainers:
   - Abel Vesa <abel.vesa@linaro.org>
 
 description:
-  eUSB2 controller supports LS/FS/HS usb connectivity on Qualcomm chipsets.
+  eUSB2 controller supports LS/FS/HS usb connectivity.
 
 properties:
   compatible:
@@ -23,6 +23,7 @@ properties:
               - qcom,x1e80100-snps-eusb2-phy
           - const: qcom,sm8550-snps-eusb2-phy
       - const: qcom,sm8550-snps-eusb2-phy
+      - const: samsung,exynos2200-snps-eusb2-phy
 
   reg:
     maxItems: 1
@@ -31,12 +32,12 @@ properties:
     const: 0
 
   clocks:
-    items:
-      - description: ref
+    minItems: 1
+    maxItems: 3
 
   clock-names:
-    items:
-      - const: ref
+    minItems: 1
+    maxItems: 3
 
   resets:
     maxItems: 1
@@ -62,7 +63,52 @@ required:
   - clock-names
   - vdd-supply
   - vdda12-supply
-  - resets
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sm8550-snps-eusb2-phy
+
+    then:
+      properties:
+        reg:
+          maxItems: 1
+
+        clocks:
+          items:
+            - description: ref
+
+        clock-names:
+          items:
+            - const: ref
+
+      required:
+        - resets
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - samsung,exynos2200-snps-eusb2-phy
+
+    then:
+      properties:
+
+        clocks:
+          items:
+            - description: Reference clock
+            - description: Bus (APB) clock
+            - description: Control clock
+
+        clock-names:
+          items:
+            - const: ref
+            - const: bus
+            - const: ctrl
 
 additionalProperties: false
 
-- 
2.43.0


