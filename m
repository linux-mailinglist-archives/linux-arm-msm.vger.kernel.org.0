Return-Path: <linux-arm-msm+bounces-49056-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D63CA40ED0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Feb 2025 13:23:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B865A1898DCD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Feb 2025 12:23:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BD8E207A35;
	Sun, 23 Feb 2025 12:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EgVYpanU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D3C206F09;
	Sun, 23 Feb 2025 12:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740313358; cv=none; b=NGMl/gRxKfwcwN0vzOUcd+v3mM1ZHhdjb6VH+WbPkb9KOmnAZ5gpAlBZvcKibpnfWnXREAyUeWgvH7CWTg8+TCKheWc4YA4h7/OWiOzwo1TLS8/fL1d2Y6ByBbxIiGvG+s26IMwK+QhAEAMlCKg4/AUlxYxIrZJk2jUjoEqE9/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740313358; c=relaxed/simple;
	bh=8eyA5ctFa9eCCu7fnL3G0PyMQJF4NJW3EXr0Wu5fyFY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pq/b9gdEUcsdgqhCTiPk8JVCsoOaU4BI5JbP+y8L1stQdrVmXc/FAqiIZWPXd1FgQnijTy3zjJ5TFEnnxOPKF4diqEEh0jceyL/BsJPjcWxwbZ39gpVzOPp+qzldi/llJNAOR9qTKo0C/2ZwA7MG0j58vMVW83nKvApU2CEJNcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EgVYpanU; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-439950a45daso21212475e9.2;
        Sun, 23 Feb 2025 04:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740313355; x=1740918155; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vMvQlF05mCiAYcMEroKJ0h4q5UvU+zcKze89brABNJQ=;
        b=EgVYpanUhqn/bSxBojQADa2PE96zp6GnmCkMIplIxKRAfhRJZBOzdyTrO8jubzTyrv
         2RA4Ua1/qMKPzEqjRG3C4WAG2AF7kv2iNOdlYZbxxXYQjuFwnshtpKNUVwHr45qaLl0u
         H6McGMSH0xn/zlATncqRjb8fi3b0ttaw+eX5GIbahwjYvhUQgQ9Bdb39MIhJSbo8T8OO
         /OF1ZPeUshTdHuYZKy7pIqHtGAm2llOaQjix+OgUiOKBewNd6avfYkyHHNWGi7kyDCIW
         1TLWn954bNd5ldUiqX1iUTkOetblD2QeRkUS+EhChzpaxHEUn9yhsygJ/zUzmtgFcN8z
         HHzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740313355; x=1740918155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vMvQlF05mCiAYcMEroKJ0h4q5UvU+zcKze89brABNJQ=;
        b=nSP5qQpA8pIn9AwdNxRhe1ApDqXPZrIqJfPg1O0bnGo/RJF4R3C0G+UNBhJIFtkt+c
         4Lj+Fwjer54x2QqC0W80rRElo4TgG4hqzebtm3FC/EokB83sWJB9JdDa02MJBSrXMmhk
         Akrb4B1f+V/P7aXnmpdEAIIt8wBK8m+h4g9Zip8DjlYQ8WsoE3s74Ua4jFFkgkjmYkSH
         wQThYyOo2CtWNaCOBxgPfZUn8U54WM1hCDBXsVrZxPW51WRQqFxJiqCksL5edmUbYC4o
         HrcKb3om9g+PHPPdm+1VABfRKBM9WJMxht6LVlFy5IUqnWi/PmUF/0xRPDwUJ8MFpwfz
         bnww==
X-Forwarded-Encrypted: i=1; AJvYcCVlAq/JNZmwNqNJxh+saVV4+PzCnSoBM6lVaxsAhDo+pbyOP2OtoJwYyIi9uzdmexayKOVaeyPHN9pU@vger.kernel.org, AJvYcCW/m8tBBgqtHkII9rpTPMP3dtutAvEgaFivSHt/8SrCn3CwXCbnrMsEdv6fNw+O1bkZAzgH4iSLoG8V7XUm@vger.kernel.org, AJvYcCXO+fLpAj7sx8j/N0tmncayHXdWsYGCnxFF19U+TCVY9NHKUl8ItIZz00WmzUKZfrZXd+fn+jqA880BL9mJiTCrH0U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeKBTZ8cVYjUKXmp4V9YnBRE6G4UJALpNilY1DB9qfIqLiVfMj
	Dw1c7MopsUy6DU26NdcDkXBqS0zX5zdfwAj2Nba4FOz42N5enMed
X-Gm-Gg: ASbGncvI14jBacneCYFa+0E1MSytwWhiIkkbP7h7T63DiHSf3KkM71//HiJILppNGws
	OIGoP8+AHF3J9zChtd5QfzadXUEaG719LE/LokC7nMpZTtBA/rjmghRx97BMJD5VpwKerpzXiWy
	a91Mwu2BxKpRVy66c3VLBHAY2lBZKsLxGRhB9cJQFPdpwpq0v32BdyIaNhHfMnv8zorv1a0XZAW
	AmPUOgvroSc5r4kbJIJd+aTq999KIBIx53m/0ZZylAfxa3KoSPMkX3E1sBmzSuaIrmxMKjE2I4g
	qE/M4Sg1fQn2EDTKnKMnZ9tiRVsZnqgppHpQI2JfIVYRFTZ7DVgXMPQeAUCcZp2yArIRywyPT0Q
	2cQ==
X-Google-Smtp-Source: AGHT+IG+0MAODFk+p1TBCBtE4y4nFsqlItck+UeuAIWOTYDShqxnT5f5tx5xGljZ6owFfPbJmR567A==
X-Received: by 2002:a5d:648a:0:b0:38f:43c8:f751 with SMTP id ffacd0b85a97d-38f6f0959c5mr10354553f8f.35.1740313353094;
        Sun, 23 Feb 2025 04:22:33 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259f8602sm29611608f8f.94.2025.02.23.04.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 04:22:32 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Abel Vesa <abel.vesa@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/8] dt-bindings: phy: snps-eusb2: add exynos2200 support
Date: Sun, 23 Feb 2025 14:22:21 +0200
Message-ID: <20250223122227.725233-3-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250223122227.725233-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250223122227.725233-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Exynos 2200 makes use of the Synposys eUSB2 IP, so document it in the
binding. Unlike the currently documented Qualcomm SoCs, it doesn't provide
reset lines for reset control and uses more clocks.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov@gmail.com>
---
 .../bindings/phy/snps,eusb2-phy.yaml          | 64 +++++++++++++++++--
 1 file changed, 57 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/snps,eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/snps,eusb2-phy.yaml
index 22c77968f..f4164db71 100644
--- a/Documentation/devicetree/bindings/phy/snps,eusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/snps,eusb2-phy.yaml
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
@@ -58,11 +59,60 @@ required:
   - compatible
   - reg
   - "#phy-cells"
-  - clocks
-  - clock-names
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
+        - clocks
+        - clock-names
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
+
+      required:
+        - clocks
+        - clock-names
 
 additionalProperties: false
 
-- 
2.43.0


