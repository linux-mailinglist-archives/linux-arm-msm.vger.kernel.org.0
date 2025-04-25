Return-Path: <linux-arm-msm+bounces-55673-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A99A9CCAB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 17:19:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F06F5A1A9E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 15:17:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 563E528466C;
	Fri, 25 Apr 2025 15:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JiLx/ck1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F4327B4E6
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 15:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745594261; cv=none; b=n46pvMlvr+/vMr4jK2jNOLwEbb553/jQo//dAh6kztclddltvipQGCZlMya6IGvrLofVdfkQtjv8B62gL62NgI4NpoDu9Fbgek0mgA+/PngX7TCUNxoZPqRNfbnUfFI5WP3meu3C3JUHCt2LSpZxmSnuo8dxDy5ZZ24akQ4TCLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745594261; c=relaxed/simple;
	bh=wcxEeIG/nILR9pbCjMso9yZS3cwzR9yIu9oGH3Xl5mg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HcI8/d3GnCopyfMSKAyBlxPz2ZudDLPOump1GDx3LMlO+SzTtbiXGQZnyUpMcHv5MVT63LWO1d0JgYDtCwNCstQzZa2AQaBu0xZl99loVSieSq6RDsvlqX02TJPysXDehz6EyStZ5fadS1DREzAEuvKNwmaM+3XnbM3ag+zjP9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JiLx/ck1; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39ee57c0b8cso2576932f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 08:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745594257; x=1746199057; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HAQCWAaBVBZ9L8/5seSjJb98H17XEO01YnL9fUDtsAc=;
        b=JiLx/ck1tzAEVxJoK4ZtSFAfYXBk0AyE0gKqyyJvTf76OIlJEFql8wbd5+KG5qlgpd
         Zr6BBgsfTvzfwfg50feK2EsxWNxKORoNbPhoTW37yIhn5zxsIUQTZQDo5okQxmf/MSLg
         RRssJ0lVbKYofiWTjJxSdjQF1inY2MNk9ybFRl5DE/XVMaBgkHMkpcreD+hBb+6IWH+4
         jAnwNqRkd6hIZsxbCnOYPlplq6f4aSfXOUFBY6wL0tQCW5aHpp2m81hhptdKV8eH38gj
         NLqV/Ce1Yaf1NWDpCJMJ0V94bB0a4G/uPpC9zPK/qb4CPcZROK40r+V5HFIv9LyJIpPZ
         0T5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745594257; x=1746199057;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HAQCWAaBVBZ9L8/5seSjJb98H17XEO01YnL9fUDtsAc=;
        b=vegwd5kjvfkJtv8E5pyljDCzIVz+NI48daua0oI2ilu256cRizrDOB9gl8oes+pTlc
         7qu40JNDAY3I4WsCQ1+deMKeb/9YTb3EoFrD/mZMN1u6Di6dpwYTgzGo6lDTwD7yMY9w
         GXrLKX4ovzy81tAgfh5A81hz+lmYq8y1vzAfRj9STlVDUW0V4XRJWLyeWVCPXTNqOLFu
         EwuKxOuLWeR1aCe3lHtG4SgT6fBk9xUfxpQHaLEsKwpN0S97ju9/ZicFTmh+Yj6AP/55
         u03xBJtB90xUbHrT5FMWZ2klqH9REz14negT1ugExgOk5PcKOzvI4MDnz2ZJbDCBYTDT
         tKBw==
X-Forwarded-Encrypted: i=1; AJvYcCVvzks26Vtpo1ADE23/XOrUyWADz03qiDJsf82i+x+Z86+ZZECwvbRkkSJ5yvUGMAVR/vBaSuGW4of//uip@vger.kernel.org
X-Gm-Message-State: AOJu0YwDw1MaP5QH9eRCH2yTvs+GNC5Zp+R0uWrt+BIhutMvIVAVYPfl
	UmF6PekP3FYZ6cScJ4BCuo7kWloMW/Z/YUexPQcdNAYvoFz2DaUAz/2tLBQMyr8=
X-Gm-Gg: ASbGncuBrpPzeyshgutbJf62WfIfTbmIvuB1GAjJFFWt2tsJrJbR+0rdBLgpp9HPVtu
	lVAY7m8GoJnWz1ihnSSnFf3D+hkqlUc3lt4kdBlNCUW79oLZUmGliKuxZRelyilAVQEFpAPGNVB
	qSegvnBFLLyhZtv3etm0skqateLd18qb1hOspGRpCTCPEygz53cfJjjkkDdFkAG9+xKmNQ6poIY
	dZs/dXKsyZy1fmZ9PXblqTqjVPRAXWN4ee2z9VOG/uvneZJV4lVkEYMzBeJ6mfCL7bCBWJ2RHtJ
	D9Zed6Eu8yjZiQm93TavN8LdKAt57izJ7TE6zGQZwm0KsdaQEpmo8jPhetpeSjPfQLsvV0D1phi
	t1rdJYw==
X-Google-Smtp-Source: AGHT+IHPnUJZKu1uWSc7Yc7UKfpd8ifRHajKhLkpvor4eEcE4Bfo34C+hxP3Ocv6ugZpsKzWHcoOtQ==
X-Received: by 2002:a05:6000:1ac5:b0:390:f0ff:2c11 with SMTP id ffacd0b85a97d-3a074e146c6mr2005656f8f.2.1745594256896;
        Fri, 25 Apr 2025 08:17:36 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073ccf44csm2684738f8f.60.2025.04.25.08.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 08:17:36 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 25 Apr 2025 16:17:33 +0100
Subject: [PATCH v2 1/2] dt-bindings: media: qcom,x1e80100-camss: Fixup
 csiphy supply names
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-b4-media-committers-25-04-25-camss-supplies-v2-1-8c12450b2934@linaro.org>
References: <20250425-b4-media-committers-25-04-25-camss-supplies-v2-0-8c12450b2934@linaro.org>
In-Reply-To: <20250425-b4-media-committers-25-04-25-camss-supplies-v2-0-8c12450b2934@linaro.org>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dmitry.baryshkov@oss.qualcomm.com, loic.poulain@oss.qualcomm.com, 
 vladimir.zapolskiy@linaro.org, krzk@kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3102;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=wcxEeIG/nILR9pbCjMso9yZS3cwzR9yIu9oGH3Xl5mg=;
 b=owEBbQKS/ZANAwAIASJxO7Ohjcg6AcsmYgBoC6eOVgILuVdiW/rdoXVAPa8Hid0qCNNOb4rf+
 1EI7p1ll32JAjMEAAEIAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaAunjgAKCRAicTuzoY3I
 OinCEAC22rg67uCiMIQHrV8hUxpc7DcmXiQNrFo637kHhmvfllAYEYnf6g+OuEWiSOWMOUB/PQs
 SvJQKuzX950QQPkQOPOOCiA1QZvUnSz94suaiV5ZvSK7vI2/1GV54Zm+7fjDo6f2vnnCUrutuD2
 Fnhj+/aDuV8k8cZ26YTzOgziLzt9FuS848s5mGJbO+rG0LsMHtJIYg+ylY8eVeplVSBetUiVNC0
 y/ywjwMZSvGTRci2S9FqXpP7WlRJX92Agbun0OsEsQ+y3gJmIdK2QaLXcG1S/4hGRiyuUhOgMtj
 aEsBWtHqY61PN6BXlBM3aNgZcRvYs3kjcvefNj6YOaV58u6MUdRZIyXR9VgY+sK6UzIv5r4qACc
 SKAVcUEP2pA2TsT7pi/cj2tZ8iyyyZmtbKP8cMCQ4Nm8+ve6fgRgrMO20rRLdrYDmR9HC0L2VTF
 Hy20I9ahNKbD5UysFuRkfOWju6VwJwPzgxe28tVuZyGVOzCMOd5tFbQHiR94no1paJT4vqWX8fE
 XCmGrrpNhudwRWtLtTrhCRm2Qomc9zu0Ndmx6adeamn8UDisPE0hTerHhTxeSx2S5PyCnmcNdVe
 bLt87HwR5yYDYpclg/yZOXAE/rky4Ff+DYbxLcMacOQkAJeLEv8UHlXvU2DwmikwLKC4g4xd0Nm
 Oe1u2wN9R8wy+/Q==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Declare a CSIPHY regulator pair 0p8 and 1p2 for each CSIPHY.

Name the inputs based on the voltage so as to have a consistent naming of
these rails across SoCs and PCBs.

There are no upstream users of this yaml definition yet so this change is
safe to make.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/media/qcom,x1e80100-camss.yaml        | 52 +++++++++++++++++-----
 1 file changed, 40 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
index 113565cf2a991a8dcbc20889090e177e8bcadaac..dc7c1a9394c3b547f5e0885bf501ed42dfbeba88 100644
--- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
@@ -118,14 +118,6 @@ properties:
       - const: ife1
       - const: top
 
-  vdd-csiphy-0p8-supply:
-    description:
-      Phandle to a 0.8V regulator supply to a PHY.
-
-  vdd-csiphy-1p2-supply:
-    description:
-      Phandle to 1.8V regulator supply to a PHY.
-
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -157,6 +149,30 @@ properties:
               - clock-lanes
               - data-lanes
 
+  vdd-csiphy0-0p8-supply:
+    description: Phandle to a 0.8V regulator supply to csiphy0.
+
+  vdd-csiphy0-1p2-supply:
+    description: Phandle to a 1.2V regulator supply to csiphy0.
+
+  vdd-csiphy1-0p8-supply:
+    description: Phandle to a 0.8V regulator supply to csiphy1.
+
+  vdd-csiphy1-1p2-supply:
+    description: Phandle to a 1.2V regulator supply to csiphy1.
+
+  vdd-csiphy2-0p8-supply:
+    description: Phandle to a 0.8V regulator supply to csiphy2.
+
+  vdd-csiphy2-1p2-supply:
+    description: Phandle to a 1.2V regulator supply to csiphy2.
+
+  vdd-csiphy4-0p8-supply:
+    description: Phandle to a 0.8V regulator supply to csiphy4.
+
+  vdd-csiphy4-1p2-supply:
+    description: Phandle to a 1.2V regulator supply to csiphy4.
+
 required:
   - compatible
   - reg
@@ -170,10 +186,22 @@ required:
   - iommus
   - power-domains
   - power-domain-names
-  - vdd-csiphy-0p8-supply
-  - vdd-csiphy-1p2-supply
   - ports
 
+anyOf:
+  - required:
+      - vdd-csiphy0-0p8-supply
+      - vdd-csiphy0-1p2-supply
+  - required:
+      - vdd-csiphy1-0p8-supply
+      - vdd-csiphy1-1p2-supply
+  - required:
+      - vdd-csiphy2-0p8-supply
+      - vdd-csiphy2-1p2-supply
+  - required:
+      - vdd-csiphy4-0p8-supply
+      - vdd-csiphy4-1p2-supply
+
 additionalProperties: false
 
 examples:
@@ -347,8 +375,8 @@ examples:
                                  "ife1",
                                  "top";
 
-            vdd-csiphy-0p8-supply = <&csiphy_0p8_supply>;
-            vdd-csiphy-1p2-supply = <&csiphy_1p2_supply>;
+            vdd-csiphy0-0p8-supply = <&csiphy_0p8_supply>;
+            vdd-csiphy0-1p2-supply = <&csiphy_1p2_supply>;
 
             ports {
                 #address-cells = <1>;

-- 
2.49.0


