Return-Path: <linux-arm-msm+bounces-55827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48683A9DDAD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Apr 2025 00:53:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 483445A40E5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Apr 2025 22:52:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F3AC20125F;
	Sat, 26 Apr 2025 22:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kUavhUVN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653B917A2F0
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Apr 2025 22:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745707976; cv=none; b=SAmiIHYA/R8lzL8qPmADKSQTb6Yk1OEjpQyfIO0FVKHW2x5Y1X3QyDHy6P/JCubGos61UQ0MflgLt1tVhk/mZ5tz30g3DXFA/mUDEk3IIh5v12TGOpysdhFwssak57aZhWeuo0RGpyPDgBjCDPJfWvyvqHFzP9nCgeW4NpWq+HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745707976; c=relaxed/simple;
	bh=wcxEeIG/nILR9pbCjMso9yZS3cwzR9yIu9oGH3Xl5mg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DM7wG3uz8c0fc9BguVGek3PLVZebLfNFQ6oIEbzYSycfg7SSG8ohv7hlPtIaIt/yhp+YDn086VHQgDiMoQgcLs9jR9hUWw/XtuYc6iPQgoOTWyBxZyXo1BCLrQhiFblGkAeHZN5IjcgN09gDbA2IIojm3IBhm4rC6v6vu2wivu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kUavhUVN; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43d04ea9d9aso15817815e9.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Apr 2025 15:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745707973; x=1746312773; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HAQCWAaBVBZ9L8/5seSjJb98H17XEO01YnL9fUDtsAc=;
        b=kUavhUVNFCunb+/ArDVqhVNs9clfIDx47XOGqEzLLWi3IloOxq3inIGKhci1Fg0851
         ONaTK/9YUdQ+MHnQTCysix4xQKgn1u+et82ZGfGhAj5WFEidb7AdKEn6IN4aDzVaQVRR
         f9PsqDp/ycuBkNcAFVbTobQFEyzF2RvDcMPZU9kybVXqcroI4wQGLCfGiPmgwd+oUa73
         NQvks6GzQNX3z+QrB4iAASp22+Vaty7djUXrLPFz0LxIK+fkZs0KMPI6kQqSd++ACX7W
         HIJEWmwdVDMcEBkdcCW2a8V3gnaVpIEg0LMAXzFZUVolxjMOJsuX5WrYVevwbcXVuoln
         erlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745707973; x=1746312773;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HAQCWAaBVBZ9L8/5seSjJb98H17XEO01YnL9fUDtsAc=;
        b=OAORcEYjbmvlRTDwI3r3IK790BH90DWJQLkoPUuErWiKXodDA1YFRijddgoqQ186h/
         s1FGskpGbDth6m2/agC2DuQgLWbdRQEAMkWlwM0qUqXkN4NOzYpjEe1WGJHKVAZdG5IT
         XgSUhRCWeNrb5lIdGJCBVHYHC537Xvo2hsABKn8jQ5++Zcw58jye4uDHuXWsN2CIoH+F
         WcZFIxxXZ1sid1MmdHW7VHKB7LkEHqGd+HHHIk98lwT4M8E89HcXdNEvHiAqiglkP5PJ
         02MxM99cBwT1y97U/jqNHMvFbEBFhbvTdPbVc64Q0tWKWwSH8c8SohpcLz8M7vG3j6G0
         UGvw==
X-Forwarded-Encrypted: i=1; AJvYcCVsOLfyxmmUXMWLlP4S7wfanqSHuoSr23+U46Ev37kjhz0MnPykiLLqr1q5czeuVnFkgYh4SpmVAO3orhTJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyzpAwTFDge10CCT52V32n3yzvBZ/5Bbf7t4ZEaLh78IxY1CZSD
	1D5Li8DxUlu3STbej0Olpf1z41vQqgQ1pY820I9xrerTOlSIQHVYsZdQNX6w3l8=
X-Gm-Gg: ASbGncvanOIqMKqZHQaPO2G687kyX9PImPVGgbng8Awz/+ez421fwV2Jjb7NNAXwZqo
	i52lOb3OGnq5JwIMn2wRJWrrzK+K2di7DlQuBMhVXXG5XkkwcMEhcqIvi9QIkFlJOQFoi+WJr77
	30iE06fY86oFpChjBNxY9fRoPVTd16WmeeioXsHzfoDMlW6C7bW5TS+mZyMG/4USVUFfM/XuRus
	FWjfzTEoceRuDzzhRJ/C2Mc+05LmIbJjs3Xnc+BVTV+EbI4mXiJCdDhImrk7cfYRTBItdcuKMXw
	nsAF8XGEqqaEVgt7ehFUxYakzi2hbthjdRUZjXT987JNSgXSRo3m8hQAe8p4anD0d3Pnc2IN4yM
	rAqpJ3g==
X-Google-Smtp-Source: AGHT+IF1Asy0853DyQQ9p4VHU/AtjevRBJ+r0Z+2rcSHTVtDv8isvqLYBjAZhzTgjqdud5T8mcm1tw==
X-Received: by 2002:a05:600c:1c96:b0:43c:fb36:d296 with SMTP id 5b1f17b1804b1-440ab845facmr27097195e9.25.1745707972717;
        Sat, 26 Apr 2025 15:52:52 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a53044besm75268915e9.14.2025.04.26.15.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 15:52:52 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Sat, 26 Apr 2025 23:52:48 +0100
Subject: [PATCH v3 1/2] dt-bindings: media: qcom,x1e80100-camss: Fixup
 csiphy supply names
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250426-b4-media-committers-25-04-25-camss-supplies-v3-1-19e5e72ffc3e@linaro.org>
References: <20250426-b4-media-committers-25-04-25-camss-supplies-v3-0-19e5e72ffc3e@linaro.org>
In-Reply-To: <20250426-b4-media-committers-25-04-25-camss-supplies-v3-0-19e5e72ffc3e@linaro.org>
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
 b=owEBbQKS/ZANAwAIASJxO7Ohjcg6AcsmYgBoDWPBzGEZSJqfm4ZbNjN/QS7q1pKZyOgCWXXda
 M0/FqOxwHiJAjMEAAEIAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaA1jwQAKCRAicTuzoY3I
 OjVZD/9yC+3Vj7UdQNC9B4RnJTA7QRFfdvRDQY2w5JFlb2Gk7MdKBz2z+PgDekROQdp7hMGDyAa
 OGnb0fNIQaW0AGnis5K71lV4WsFS3TMwYcYc6Q35P+qCZfQjBYOhxDrWFAx+FXINNPu/TWXH4ys
 0Bp773ZGBwucBFhbxVCxgU05t8CP5a+7A/qGLfMMLlKHI4djLRWi1q6BIN0RhDeoozbFNkmm3J1
 Tq8wpBDDXI3k0ICLL9641o/hk0bdNoFNwrNY3ORTghc8c2XH/Gcbn4r8DmZzFuSzkQoNnMxLlE9
 lJ2VkMM/2OubHVjYYF7m5PaelWhSQbEFfJ9t+l9xRzb8Z64A1Xd/Bb4WdmNqBYN/JOqIX66iBwM
 eR7wievt7EEr0RChq3l8yegtRpzo8LzttWuXf1dP/8rCUHKNhIszFl2KAquVN095kf5D4e5MX94
 vdAMEtLYZukcUjNFIRP6w1bvdox6ivM6yxYFs6imUYOYBouc7etvjuX7PyUZz6qtKH1IkRYrsW/
 SXivT8vKba4sfRf0gg0lHJt9qa4uMuSvjTLuMfSKvKqge5Z8HsQjDuhzhmHNy4At2Iaow2Ot0FV
 hMWt39D14yBxFAx9Li/Zb/hlPsURcDJ9rDQRRtMYloCJkcx375YngsvR9myRZ8nBrpzx0L5a1ac
 g0554o3qeiHFMDg==
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


