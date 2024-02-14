Return-Path: <linux-arm-msm+bounces-11089-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E06855487
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 22:14:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 464511F28F26
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 21:14:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ED8813EFEF;
	Wed, 14 Feb 2024 21:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FOt/0s8P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2369813DBA4
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Feb 2024 21:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707945244; cv=none; b=KgRx9U/l95gNTsG0yMdq7XW1vNHF15MyqpdSLmgFI8bxwjJlhA/XXok9jl26Et/lQVdyJLFF074WlqqUKOKqI7TA5ZYg756RSzkSPr/eIu8V5haj0GZJRnhb7H9KcCEgnlcNyIWDwtxbRqIZtkqgQ4DPzBWK5ussP79AaBr2Rjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707945244; c=relaxed/simple;
	bh=ThFF7MydSq7GIulN2BiuLPta4fGlEnJTyb85puKw6/Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nA9s1bWurPqP1pm4rR8ig61bsaTg1Tr3TPm30SP12bzjJ+uuSv+ptKT69IDbe8YT9W9eKVPK+9fydAgqxf91/9hRWJVa3lsi2Z6wbl7NLGykyiVDe9w3fd9NIXoGN8jCvrfaaN82AMZ0R4eSnz8Rmtsry/1yw9MRWoZZqMM+kdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FOt/0s8P; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a3d159220c7so16561266b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Feb 2024 13:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707945241; x=1708550041; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sjEaHSfzaAp92cc1QcNapWfjcTbk7tItlWQ+9zi3zaQ=;
        b=FOt/0s8PP+lM+h/8yyjp0z4K8D/WmvxWY+vjQJ3ZdpNBBmwB2Fk2ubgh1kzbzILdHc
         pk1lHjstXg02Zz1Z2/opTmkJFCx4UHEIq7fz/E9IxApyggUm86V5Q+E8wwaTSBDyhPwC
         K59O5yriGkQBs5T/G19rlhwa+bqcu+GPKtJoWRmxJggDTuo9eD9fca67GrHEID9zQchi
         /ZedwrZ+0NpIbWqGPKcZR2SM6Z7enoxcV1A/b8Erc6fbSPcLo1vOfcdxNxVu23vmYtYq
         wQVk+NdzJyyE1r3IYp8OEQ3a60RyyXbpOUEb6sogQlupo9HPe8PsW5JcK5mGKIlzzLkO
         7P5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707945241; x=1708550041;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sjEaHSfzaAp92cc1QcNapWfjcTbk7tItlWQ+9zi3zaQ=;
        b=OdfV8eNmBB2bFg1KKl4J2y/ukWTSeNS5JyO2wSa5bCH32KQpbGcIdTKb4hrw+K8bjr
         4sGl+MaZIam19C3IpFsaFTrhNLUuVFF9jObwXwG+pfZFtHfLsTEYo8XpqzY1IWsfoQ8j
         Ya16Q51QN4p29fCj+YGAbsHSQx8Nbz01ZQrD2bEbOCCLlH9smfdn6Jp4cXUDLtgdPHgQ
         66FqsbxuIesiXa1z0PryRGEA7CdkaZzzedp//W6YPWliZHSucH0z3MVNu4ZlTBzoyifk
         MMDtWKu9AjGnrgGvvodIAtfhoWWAGl1CF84rYm7EBdR4ELDBkB+/+wztofHNtEJ6cWpN
         43LQ==
X-Forwarded-Encrypted: i=1; AJvYcCUua6UHLZfI/EdaOLg+IqL+3MVnCE4eWfXHVPepKYxtX/cf7D2WfWU05k2ycmxmwjeB4cgGKTHfrt3DJHItiIxRoqlAf2wcDvROqVj6Gw==
X-Gm-Message-State: AOJu0Yy/VYI8zFEi/pwACUFzPe4y0hKKCfmRnOQ4TDBoX9AAXsBkDh58
	ETHXS2oiYBB78pZrWBpnrA9x/AnKmea1eQmipKh2SZVdaptsH3/nbEj6pH2VOqg=
X-Google-Smtp-Source: AGHT+IERQ+p2dcu9AWYeFroSMradMDt1xsmtrj5+N7oOZKxSLsUhhZCgXubfKSpX35eOahZ2Zdo3dw==
X-Received: by 2002:a17:906:4903:b0:a36:5079:d6cb with SMTP id b3-20020a170906490300b00a365079d6cbmr2605774ejq.56.1707945241517;
        Wed, 14 Feb 2024 13:14:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW+vB34uCULCafmxyP+an2zDwCoQ+925f8c+4lAxeFTF519JN28ZccJJcGYCAeENcDV66iELaIk1A4qoFKKyHEwG0Vo2al4q+DvaQjaTldODHCB407C8aT7bjWYC1hnM+zPFhaV72MWzWtAUY6i+Wnp9BZkIZLz3uzTn0dImTk9DKWRAw+HoA3xU1O4idD5nfGXU3Mq9RKn75eCER1aG66bmDllsPTFRdkWWk7NIqiRfXaC3LyOc5jfH760Vr3LBdhfVLJ/aHassuZSvNWwIPb6eS/UUaQv8BGKPUZKXmjge3OBCg8XgjzPpVYOCZaXRAfaKuffEPOnSuVnlN7n498PD/Ghh+iFBlhnMR4vExpweMJY6zPprnY8VWwdCIAQQtjEvdyooJ0FGkdRNM6XY3udeRa5Z4/RQSbYWS5K9yE1rUjndLGS/3/sA4aPJp6akvEP/cKjpAAL4D72AHEgKoQ41LuehfhwTIfc8FhmaCC/TH3NX2LoEYI4YCIs3vX2Ly9cyH2UCWw=
Received: from [127.0.1.1] ([188.24.162.93])
        by smtp.gmail.com with ESMTPSA id lj8-20020a170907188800b00a3d22f53210sm1457661ejc.188.2024.02.14.13.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 13:14:01 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Wed, 14 Feb 2024 23:13:46 +0200
Subject: [PATCH RFC v3 1/4] dt-bindings: spmi: Add PMIC ARB v7 schema
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240214-spmi-multi-master-support-v3-1-0bae0ef04faf@linaro.org>
References: <20240214-spmi-multi-master-support-v3-0-0bae0ef04faf@linaro.org>
In-Reply-To: <20240214-spmi-multi-master-support-v3-0-0bae0ef04faf@linaro.org>
To: Stephen Boyd <sboyd@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=3681; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=ThFF7MydSq7GIulN2BiuLPta4fGlEnJTyb85puKw6/Y=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlzS0SrKj6hRZFi7uAuwtr9aowEUfQvftpdaQna
 5nyHsUxNlyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZc0tEgAKCRAbX0TJAJUV
 VklUD/4ij3JO+NzVeF+NUsfQn/3Wvxkg98v/Ye6oGHfxwyOdXuC9LZjLdH8trQeOrhCJGS9XCfa
 OqPUsds0dNdm7ivbhrXTS5qynYgbr/rkIzvAsVzm+FB9NZL0Lx4dha5F1oZ+k1735xnIY/hHBTV
 ioTds6dS5D5TDybVqy9kRe6SOxEOPh65b1V8a+VTZu0TSONnvkHyjlDy9yHujFEmROoWF/n/2UQ
 cA877Bam/c5fB5flWDsD5w2ZMuSQKbE/UiQo/Lqq7ykxT8gMFv+J8qO59Y7FnJ79BktsSbKoBUK
 Y+5BztTBP5e0TMhq9xXBohv5P3LL7plwZayKD2KHW3qHUHUSJrWbMyLJ29ggGt1RU5Z+ZOv0340
 VhdcuHqGdfOdc/lHh9DzrQ5g7GYK750RcCY6/0kqKombn7LIz2pLnBPJgdH5hSEhc91l3/98jiR
 NSRyt5liGQoF8krBSd9i0q97Ky9b6qLNSjn0u9PByULTizJ7kCHyINNBQm703EPd0TqDx2H4Sdi
 fVIsnCJpffPMqotchZW17WHRU+f+x5Xlpa8GkqMvWdnz7OablNRDKep4DPE7Vm733S4QwTE7fJ9
 Jc78/GGJGF3twpRWiF/huUYsaqdlnhxfawIcLvKr6gUnOqgpc3qUFPyAlQsf/GC+ygsSQBNPT00
 o1+eCAT9KBKmoUg==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Add dedicated schema for PMIC ARB v7 as it allows multiple
buses by declaring them as child nodes. These child nodes
will follow the generic spmi bus bindings.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 .../bindings/spmi/qcom,spmi-pmic-arb-v7.yaml       | 119 +++++++++++++++++++++
 1 file changed, 119 insertions(+)

diff --git a/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb-v7.yaml b/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb-v7.yaml
new file mode 100644
index 000000000000..8a93d2145aa5
--- /dev/null
+++ b/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb-v7.yaml
@@ -0,0 +1,119 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb-v7.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SPMI Controller v7 (PMIC Arbiter)
+
+maintainers:
+  - Stephen Boyd <sboyd@kernel.org>
+
+description: |
+  The SPMI PMIC Arbiter v7 is found on Snapdragon chipsets. It is an SPMI
+  controller with wrapping arbitration logic to allow for multiple on-chip
+  devices to control up to 2 SPMI separate buses.
+
+  The PMIC Arbiter can also act as an interrupt controller, providing interrupts
+  to slave devices.
+
+properties:
+  compatible:
+    const: qcom,spmi-pmic-arb-v7
+
+  reg:
+    items:
+      - description: core registers
+      - description: tx-channel per virtual slave regosters
+      - description: rx-channel (called observer) per virtual slave registers
+
+  reg-names:
+    items:
+      - const: core
+      - const: chnls
+      - const: obsrvr
+
+  ranges: true
+
+  '#address-cells':
+    const: 2
+
+  '#size-cells':
+    const: 2
+
+  qcom,ee:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 5
+    description: >
+      indicates the active Execution Environment identifier
+
+  qcom,channel:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 5
+    description: >
+      which of the PMIC Arb provided channels to use for accesses
+
+patternProperties:
+  "spmi@[0-1]$":
+    type: object
+    $ref: /schemas/spmi/spmi.yaml
+
+required:
+  - compatible
+  - reg-names
+  - qcom,ee
+  - qcom,channel
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    spmi: arbiter@c400000 {
+      compatible = "qcom,spmi-pmic-arb-v7";
+      reg = <0x0c400000 0x3000>,
+            <0x0c500000 0x4000000>,
+            <0x0c440000 0x80000>;
+      reg-names = "core", "chnls", "obsrvr";
+
+      qcom,ee = <0>;
+      qcom,channel = <0>;
+
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      spmi_bus0: spmi@0 {
+        reg = <0 0x0c42d000 0 0x4000>,
+              <0 0x0c4c0000 0 0x10000>;
+        reg-names = "cnfg", "intr";
+
+        interrupt-names = "periph_irq";
+        interrupts-extended = <&pdc 1 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-controller;
+        #interrupt-cells = <4>;
+
+        qcom,bus-id = <0>;
+
+        #address-cells = <2>;
+        #size-cells = <0>;
+      };
+
+      spmi_bus1: spmi@1 {
+        reg = <0 0x0c432000 0 0x4000>,
+              <0 0x0c4d0000 0 0x10000>;
+        reg-names = "cnfg", "intr";
+
+        interrupt-names = "periph_irq";
+        interrupts-extended = <&pdc 3 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-controller;
+        #interrupt-cells = <4>;
+
+        qcom,bus-id = <1>;
+
+        #address-cells = <2>;
+        #size-cells = <0>;
+      };
+    };

-- 
2.34.1


