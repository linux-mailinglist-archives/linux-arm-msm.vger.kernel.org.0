Return-Path: <linux-arm-msm+bounces-26317-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D460C93246C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 12:54:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 89FE22852DC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 10:54:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D973B1990AD;
	Tue, 16 Jul 2024 10:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QOIe+j4i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241F51990D9
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 10:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721127253; cv=none; b=L+Pgpvu5hazIEykPDyP+QP6211pP1SMfZRN9b+6cPmyqADIlazYNzWW/Lq0ROxNzf1JMGU7/jBmi1h4qpzpzoKuovNZxEUHlnjKudTeDLsJET/uYGXImrR/QnIkYyzEjy9LCpys7HCKwgRaV4lL1QXrEn4UIIbkFbSX08YjuTig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721127253; c=relaxed/simple;
	bh=AxX7wCkkfOj42QI7vsWajUNUXVUkZbWsJaH69GKrKh0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BmpKlg+U3H6Cmy466RQ8UqhuH7NuEubZf8KwlWBBvBhHXR7d/ADTI0Dt6ejpsLPU/9TzK9NsXeGiOAucrFtW/AyK08qF4YUxqoehFVFtULz+/BD4MkFjXwNTYqWE2a/5sBTIwFG04uOPUcW8qSRveL+xT4f1rXHah5+P9IAYyU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QOIe+j4i; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-367e50f71bbso3548064f8f.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 03:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721127250; x=1721732050; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/q+vCguQf3NUUbSEhJNStzM73J6osU7HD6N++I0+lqQ=;
        b=QOIe+j4iAQRkbZsfJSAwQmuOEUSy9+yxy5yeoPVYeYGug54ETMs85nZ1w7aXQECGP1
         1fuOuA0usZZ5mojOB/w4ux6COxUs2H6ObCAfCZ+zEtOli6/GBf2CdmdJvCdsyT88XOuL
         INhk32lR8qPIrmION8tO9eipy/2HsV3/tHc2Hv4mNymNa2ni+7iG4R3a7hF81hehMJ+y
         OXcG/QrJXymAKW9bLHIiuYhHrWPVOkm+PPRcLnT3rs/WQWTAtRYhvnUZFIzWXudU9Yc2
         fU0inutXenNdVnCYgxmPHl6dlKtDGVM9I2SFB9OlBOPX8BRhEL4rn1oloC1mcq7nMuXD
         QQmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721127250; x=1721732050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/q+vCguQf3NUUbSEhJNStzM73J6osU7HD6N++I0+lqQ=;
        b=Q/hGZSEZtF9t3EHYy57wVNeAN5R7vAMHe1/3UubRvS1kZzedI9FS74GMQWOkAZtfwM
         2icoNpl0DMiVBze04KUMjlogx9tqcZGyALxCjqimcZvIrAvETujvWP6Sl3dmqvlB3Srr
         jQ1zYXsZFvh1++8X9B+Lph09x+vxZ1Sn+o5Axa+ESrwViNCvDtcVhv9hIkcUb50KAYZp
         BrhKMO+lg8baAB/qsspWE+ATr4AXJ5SIQytCZpyjVQOB3MUM+ktHb9e1/oxk1Ue5ZXWH
         pF1q0GMYgjSxNVTguq08MkNUdaG8DVlgj2stNd9Mf3WLlGmnKUJomfGkGMtEmNWT7jZX
         xc3w==
X-Forwarded-Encrypted: i=1; AJvYcCXlYxLeVVSIMQDGqmJlAMTnHeQl6NhAe4wH+NqOrS2FoLe/awiPrzRBJNrgpXiWtNixDIt4ISXoYGDsKwmae8F2XWMkH/B7qlbhGSGCmA==
X-Gm-Message-State: AOJu0YzqryUzco7aoKyRZ260IIg49ie6/pioSFItQvg73CJnJpz366tc
	dblwiRoySVtM1h5zc35qpA9ga++b0rTs22/5E+AmUWyBkiQ8ab9Oexfpp5c3CeU=
X-Google-Smtp-Source: AGHT+IEhjOcGQEmu3Anam4Iq8+f5K76T83y06jbOta7ND04zwcw7VGC98aRFKAmunjQoyid33YORuA==
X-Received: by 2002:adf:b30c:0:b0:367:8fbc:8892 with SMTP id ffacd0b85a97d-36826316853mr1075117f8f.44.1721127250680;
        Tue, 16 Jul 2024 03:54:10 -0700 (PDT)
Received: from rayyan-pc.broadband ([2a0a:ef40:ee7:2401:197d:e048:a80f:bc44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680daccbafsm8608295f8f.51.2024.07.16.03.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 03:54:10 -0700 (PDT)
From: Rayyan Ansari <rayyan.ansari@linaro.org>
To: devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Rayyan Ansari <rayyan.ansari@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	de Goede <hdegoede@redhat.com>,
	Jens Axboe <axboe@kernel.dk>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Niklas Cassel <cassel@kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH 2/3] dt-bindings: ata: qcom,ipq806x-ahci: use dtschema
Date: Tue, 16 Jul 2024 11:46:00 +0100
Message-ID: <20240716105245.49549-3-rayyan.ansari@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240716105245.49549-1-rayyan.ansari@linaro.org>
References: <20240716105245.49549-1-rayyan.ansari@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove old text bindings and add ipq806x AHCI compatible to
ahci-common.yaml, as well as its required properties.

Signed-off-by: Rayyan Ansari <rayyan.ansari@linaro.org>
---
 .../bindings/ata/ahci-platform.yaml           | 39 ++++++++++++++-
 .../devicetree/bindings/ata/qcom-sata.txt     | 48 -------------------
 2 files changed, 37 insertions(+), 50 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/ata/qcom-sata.txt

diff --git a/Documentation/devicetree/bindings/ata/ahci-platform.yaml b/Documentation/devicetree/bindings/ata/ahci-platform.yaml
index 358617115bb8..b103d2c44421 100644
--- a/Documentation/devicetree/bindings/ata/ahci-platform.yaml
+++ b/Documentation/devicetree/bindings/ata/ahci-platform.yaml
@@ -30,6 +30,7 @@ select:
           - marvell,armada-3700-ahci
           - marvell,armada-8k-ahci
           - marvell,berlin2q-ahci
+          - qcom,ipq806x-ahci
           - socionext,uniphier-pro4-ahci
           - socionext,uniphier-pxs2-ahci
           - socionext,uniphier-pxs3-ahci
@@ -45,6 +46,7 @@ properties:
               - marvell,armada-8k-ahci
               - marvell,berlin2-ahci
               - marvell,berlin2q-ahci
+              - qcom,ipq806x-ahci
               - socionext,uniphier-pro4-ahci
               - socionext,uniphier-pxs2-ahci
               - socionext,uniphier-pxs3-ahci
@@ -64,11 +66,11 @@ properties:
 
   clocks:
     minItems: 1
-    maxItems: 3
+    maxItems: 5
 
   clock-names:
     minItems: 1
-    maxItems: 3
+    maxItems: 5
 
   interrupts:
     maxItems: 1
@@ -97,6 +99,39 @@ required:
 
 allOf:
   - $ref: ahci-common.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,ipq806x-ahci
+    then:
+      properties:
+        clocks:
+          minItems: 5
+        clock-names:
+          items:
+            - const: slave_iface
+            - const: iface
+            - const: core
+            - const: rxoob
+            - const: pmalive
+        assigned-clocks:
+          minItems: 2
+          maxItems: 2
+        assigned-clock-rates:
+          items:
+            - const: 100000000
+            - const: 100000000
+      required:
+        - phys
+        - phy-names
+        - clocks
+        - clock-names
+        - assigned-clocks
+        - assigned-clock-rates
+
   - if:
       properties:
         compatible:
diff --git a/Documentation/devicetree/bindings/ata/qcom-sata.txt b/Documentation/devicetree/bindings/ata/qcom-sata.txt
deleted file mode 100644
index 094de91cd9fd..000000000000
--- a/Documentation/devicetree/bindings/ata/qcom-sata.txt
+++ /dev/null
@@ -1,48 +0,0 @@
-* Qualcomm AHCI SATA Controller
-
-SATA nodes are defined to describe on-chip Serial ATA controllers.
-Each SATA controller should have its own node.
-
-Required properties:
-- compatible		: compatible list, must contain "generic-ahci"
-- interrupts		: <interrupt mapping for SATA IRQ>
-- reg			: <registers mapping>
-- phys			: Must contain exactly one entry as specified
-			  in phy-bindings.txt
-- phy-names		: Must be "sata-phy"
-
-Required properties for "qcom,ipq806x-ahci" compatible:
-- clocks		: Must contain an entry for each entry in clock-names.
-- clock-names		: Shall be:
-				"slave_iface" - Fabric port AHB clock for SATA
-				"iface" - AHB clock
-				"core" - core clock
-				"rxoob" - RX out-of-band clock
-				"pmalive" - Power Module Alive clock
-- assigned-clocks	: Shall be:
-				SATA_RXOOB_CLK
-				SATA_PMALIVE_CLK
-- assigned-clock-rates	: Shall be:
-				100Mhz (100000000) for SATA_RXOOB_CLK
-				100Mhz (100000000) for SATA_PMALIVE_CLK
-
-Example:
-	sata@29000000 {
-		compatible = "qcom,ipq806x-ahci", "generic-ahci";
-		reg = <0x29000000 0x180>;
-
-		interrupts = <0 209 0x0>;
-
-		clocks = <&gcc SFAB_SATA_S_H_CLK>,
-			 <&gcc SATA_H_CLK>,
-			 <&gcc SATA_A_CLK>,
-			 <&gcc SATA_RXOOB_CLK>,
-			 <&gcc SATA_PMALIVE_CLK>;
-		clock-names = "slave_iface", "iface", "core",
-				"rxoob", "pmalive";
-		assigned-clocks = <&gcc SATA_RXOOB_CLK>, <&gcc SATA_PMALIVE_CLK>;
-		assigned-clock-rates = <100000000>, <100000000>;
-
-		phys = <&sata_phy>;
-		phy-names = "sata-phy";
-	};
-- 
2.45.2


