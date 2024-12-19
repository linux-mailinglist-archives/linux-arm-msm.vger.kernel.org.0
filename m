Return-Path: <linux-arm-msm+bounces-42835-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 404119F857A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 21:10:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E0F1C165629
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 20:10:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F89E1BD9D3;
	Thu, 19 Dec 2024 20:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NCbeebHP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0DC1B4F0D;
	Thu, 19 Dec 2024 20:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734638914; cv=none; b=a76/o/Kaw53wuHGsh/jnaFfdW5E8oBO911XRHXB1G7wTQqIdgWUUNH7bamRLioiZw3n5hY98gEXssunZUt4MiY5zuZyVAWrwEGvZhoyBf/JB1oS3LTezfoapxudq8hLDvte6YyBElFUuXB34xnUh7ZAP+FXnL/KRmM9c2lAMqHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734638914; c=relaxed/simple;
	bh=cHklw5dKsrv89Er4BjLbZiUv1d0LB4CJNkTF5GFFHn8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nkCQoIO7XvLPmaqDRJ6eMlUk2gmz35q8ks0j8X1uadPwRrGZA+b022WUPTWJK17pzoPaL1uxAV7I1jcUID1qW6fBrFNBhyikVM8xsVitmjePswK+BM9CM/iZ0RHkZDLccf+K+cglDXK4llTs4xT+HrwzkVwkrXzzzXoLzD108F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NCbeebHP; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3043e84c687so10828861fa.1;
        Thu, 19 Dec 2024 12:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734638910; x=1735243710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GcQ7NpJKtc8NYOK8uYoyPnqF29xdASVJC1p61Zb5blk=;
        b=NCbeebHPD4Bs4SeNYXh3kLrLdMtREWUedaw/WVSBzZpPsz5v9ie8g5XO1v94ZoxZwq
         GSb5T6/gFXjGBtxcY+jG+SvEvrMhHL3VjnqpItPZjTDIMF5DRV8/979YAomO8+c7MRX6
         jRi8G69naQ5uv/7iz9q/1LqCiL1unT0PA+PxZA4Oa3/j3QH/5JRmofe0iA3UjObHXuPD
         s6D3v2jZX0gUiA2qySVcGKsQ60GBise1inRhY5VY5pglGxzYQoWAhLnfbSBU/1kgtFpP
         5vmpgpMsNhl0/XwyikPDE0hSvvcDqdaLUwnFXptv9tPj6WH6Bv09MyrQ4NSrSDzMK5BX
         JCFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734638910; x=1735243710;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GcQ7NpJKtc8NYOK8uYoyPnqF29xdASVJC1p61Zb5blk=;
        b=slUQG8losY9VAdw1jB8FeG4k0t5fSmAomIqjrkDpWoU420ZzpGR8BILmY2jtyZtca4
         VuHz16Z4bHHEWK7Fdh08E+JL1/VItK7dzPHQZa8pFm1wJkcrzz/xOXvrQxNDY6E9KpKJ
         /ihcO2S9x3bMNwyjPXOQ40k0XvvGBAnCi8tY7N2NipjsPebx92vSyinoFKULjTqveoWK
         JDYU3Es6AMWIQ1KTujjM1uOlP2xy41ssi7obdlAOXJ3AIkAEBV5HksfY7+ncAl559GwV
         3in8cNMXJGGHHd8FfQQxsJjgprZ9lJq5FwFud9nm9Z3G59LGeewCf8YQ54PcnRjTvCPa
         xivA==
X-Forwarded-Encrypted: i=1; AJvYcCVsn0okp/m/uK+7cCzUF9vft2ZgeAnBNwgEcL+ot8jZ3QNSIcv3Gs9DyRSnYj/klSz36LKMrEyg3179qT64@vger.kernel.org, AJvYcCX3K0QuW1gBXLJKGBwZGayEDXWrzLN5ngNOU82br6BoMoVtGbeZx0B37O2o+CLvZC7z43kF+WXFOCOA@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr03XRAdEmcXgjPpAv+FEJUMaM3umsZWOcH56UNP0YHPE0jknY
	XFSNB1Md/JKA5Mwd+T4OP2osJys4mxmrvsSgAn3htGsiJBiL3zEY
X-Gm-Gg: ASbGnctb8xo020KsJYAdRUvgZlW4HOYC/wSL9Eu2nXgSP4LPc8kMPp/AyyMFgtyD1T8
	rtXYfUQwwunDJTM4FpY609twbA32V2nitcp2woHHbrgLVCMZmb65e8hcwTUkWETiS1nLsJAWJJ9
	T1yiMHXHTIW580AWXksrKzrRuMPM/HXZRp4pKQVyRL0zfMB87+M+P3gkqq+sOc1cyZ9a2nUnPLf
	GuFUOiIP7j+0eyd0DcHCysLBH3b9bzZ8Pjthkcks49oGc26NhKDTw5mjnMk7hGRv7U58NWztp1R
	F9U=
X-Google-Smtp-Source: AGHT+IGy9vuiJjvXqboSFuFdTvH/i/YxpbxiK38dPYU/oInaVl1MSYEuwXPyCSHnbInt1rZn23zlXA==
X-Received: by 2002:a05:6512:318e:b0:540:2fd2:6c87 with SMTP id 2adb3069b0e04-54229533e65mr5023e87.16.1734638910099;
        Thu, 19 Dec 2024 12:08:30 -0800 (PST)
Received: from localhost.localdomain ([2a02:a311:80b0:1c80:9433:9060:39fc:2954])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542238135d8sm265642e87.145.2024.12.19.12.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 12:08:29 -0800 (PST)
From: Maya Matuszczyk <maccraft123mc@gmail.com>
To: Maya Matuszczyk <maccraft123mc@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: platform: Add bindings for Qcom's EC on IT8987
Date: Thu, 19 Dec 2024 21:08:18 +0100
Message-ID: <20241219200821.8328-1-maccraft123mc@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds bindings for the EC firmware running on IT8987 present
on most of X1E80100 devices

Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
---
 .../bindings/platform/qcom,x1e-it8987-ec.yaml | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/platform/qcom,x1e-it8987-ec.yaml

diff --git a/Documentation/devicetree/bindings/platform/qcom,x1e-it8987-ec.yaml b/Documentation/devicetree/bindings/platform/qcom,x1e-it8987-ec.yaml
new file mode 100644
index 000000000000..4a4f6eb63072
--- /dev/null
+++ b/Documentation/devicetree/bindings/platform/qcom,x1e-it8987-ec.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/platform/qcom,x1e-it8987-ec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Embedded Controller on IT8987 chip.
+
+maintainers:
+  - Maya Matuszczyk <maccraft123mc@gmail.com>
+
+description:
+  Most x1e80100 laptops have an EC running on IT8987 MCU chip. The EC controls
+  minor functions, like fans, power LED, and on some laptops it also handles
+  keyboard hotkeys.
+
+properties:
+  compatible:
+    oneOf:
+      - const: qcom,x1e-it8987-ec
+      - items:
+        - const: lenovo,yoga-slim7x-ec
+        - const: qcom,x1e-it8987-ec
+
+  reg:
+    const: 0x76
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        embedded-controller@76 {
+            compatible = "lenovo,yoga-slim7x-ec", "qcom,x1e-it8987-ec";
+            reg = <0x76>;
+
+            interrupts-extended = <&tlmm 66 IRQ_TYPE_LEVEL_HIGH>;
+        };
+    };
+...
-- 
2.45.2


