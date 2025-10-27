Return-Path: <linux-arm-msm+bounces-78978-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E98EC0F0A5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 16:49:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 67E4119C5721
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 15:48:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC6B3313E2E;
	Mon, 27 Oct 2025 15:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="gRxg1sLf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23A630E83E
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 15:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761579909; cv=none; b=bFuehs0iT1gMNNoyCcAuCKLy7J99fQiK55KwShMX7sOCbEi4hRm23wcr/HsrMQ5RbPZb8CGlurw6S3E7uxXuduo2iB0u0/whE945W3hCiQvPKVtnXJ4rsq2r3vQ+GpN9Tg0ujC732P9v36hDl1Exqf5vs12J64nNOTJzm/jkP98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761579909; c=relaxed/simple;
	bh=7o+nqASHx7UH7QHI/rACvEF8YONzSPI+tDQ5Q819Mjo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FV2LXeCgFv6IKGuknSJc2HIRDnqWSU1VN9rSHscle9QDCRzHFJyGhNNRS/VN9bBYbnnen3KWlW/JgGWP3OWxEMstXzQrfP8QUld0VW6WxUpWT6nZd2xDgxE6E0bH4jKbM4FQi4nHfM+sKmjdge0xKR/tHRG4Qkyg5Occ1oSXcRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=gRxg1sLf; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47112a73785so30945375e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 08:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761579904; x=1762184704; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2OlAwR0Ez2lmPLsYc3tLDTQTUPw8dFRTu8oJtM9uyYA=;
        b=gRxg1sLfl/oNehVvqBWREMyuSzblcB8cWusv0Rv41CZPh5rigCp2Yji9sKEJ2FDcx1
         55OH+GAbdGH7pjQDtBBTkCiGaiFnhNdWt7H8mT6BcpCttcwz4vB0qcI3WKxOvizNjtzo
         t7Xo/Z5GfeE6iGEKyDe7B0gqtQGIz3pIcOod+DRGXt1FiHrKcRO6Do8eJCsB5tbcqgLy
         IwyjXQjrpyc8+zI15ZiyVUSF7i2cySFic5+BVRgiHc0QeQUXwqDwmUlxtP3s7dcJAD+/
         5IxbT849DQud7vfgnw8JadpQ3FeSe1fA4s69iXuSwm4jhIEmoqXfLPyUIlzX47p+pxm5
         1L1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761579904; x=1762184704;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2OlAwR0Ez2lmPLsYc3tLDTQTUPw8dFRTu8oJtM9uyYA=;
        b=EfaiH0nJrwWqnGbsF2oQVzVFrGBogt9AH6nJbGNtw0NhlGaq1LONe6w1TzsrGS7wgE
         VXZsHerWxcfQIAymADyfIbRmDcffx3/y221dGmgzf8Dsz7xh1FH6p02mQGoqMALifYgM
         GRYP/+3YYNtcHLZHUBpnqAxyK54UqMb3luSoHLyBG+u3z6Ng8to+JRCaqHL+H3tTJhWB
         aVJu+HyNuMlGCikbwU3CX+/ocUyeBMO8g2sq7xazUVA/4b5fcdUO/zqSrjqYITbobjrA
         MZHWBD0/wvkTEDKX45lGbUIgsAbLMP0ggwnh1DDhTovc2sxEOtWA4UzmO4RnONuI+Ljq
         ALdQ==
X-Gm-Message-State: AOJu0YwlAlgkKPIqx5Ldu/XThv7+/mznejjp5Of/opz+J9Xk8pmrIkug
	jXPUXg1EOLQnAPHgnTtHegiC6mS5iuPJ8igZbYvjJZKmEl9JcZVyEKD/Lj4IQxhzbdM=
X-Gm-Gg: ASbGncv2se/Z6iqIFtl9nQZOfwdX/4dUl+OvG/MEFhJE0yHgxQgrzFfAP4c1Tpm/gUk
	gdR1q7SeMMXdRMp1pVIwzlXSD0dHO92z7j/gIDMgdy1y659OO+wjrp/6/sXP/2EPdhb0jK78PL/
	W4+IqDRA8A4GqlZp82cpd/uH9UGZXNhZaf8+WQu4DTQES9OcYayvWByRRTZwpAq228qiWgGaVne
	TcpKH3V0Wya9oaS/qW9VcHomD2D4UjmTakwylm4TiitHXK2eGdYmNRqMiHsFTsSB0D5924lKbCd
	6zKT0gaaUMD9/E0qDBOJtM7fTpRSN2W5ourd1uqs+82k61Nw7UASq70b1aF2EUG7pFTKvi3+mGR
	+oFkv4wf4U7Nw55lU7uFPIlLE1SvVKqAmzwbIlM5w67gGvpXRBU8U1n6VsW+mts26adaozQ7bD+
	TskWG1acfv3CdGjHfJ
X-Google-Smtp-Source: AGHT+IF3LUL3bfxhtdpuEv0pHPdlEkBGo06ytgVfCVUCGuaC1FOwUetTffXhS0o9uNVApIit+32qLA==
X-Received: by 2002:a05:600d:416d:b0:475:dcbb:76b0 with SMTP id 5b1f17b1804b1-47717dfaa40mr966635e9.12.1761579903932;
        Mon, 27 Oct 2025 08:45:03 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c1c6:7dde:fe94:6881])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dd477d0esm138708045e9.0.2025.10.27.08.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 08:45:03 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 27 Oct 2025 16:44:49 +0100
Subject: [PATCH v3 1/8] dt-bindings: net: qcom: document the ethqos device
 for SCMI-based systems
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-qcom-sa8255p-emac-v3-1-75767b9230ab@linaro.org>
References: <20251027-qcom-sa8255p-emac-v3-0-75767b9230ab@linaro.org>
In-Reply-To: <20251027-qcom-sa8255p-emac-v3-0-75767b9230ab@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4896;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=OSzCwUgDD3l4L0pYJMm0DD9DnJ/KFBo24c29rgi8yQk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo/5N6lhNlND4rsq376wqaZULe50mt5NDwwtTRC
 AFI8PIWioaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaP+TegAKCRARpy6gFHHX
 cruND/9HOgu2X1rNis9f+h3vpeLQ56ytu76P+bQW61H4CEezr3VWwQLx8BRjR1WXEoMT+5TlQRs
 ipD2fBeg8mJEbLux1Ltn6ag6107Soa/wvshuCQLxGVql/6xlYoDxSEEptIPhKa87T5+cb9tkCFJ
 xnw7Y4Wmsi9CKCy0YmRXURj0Gp+5llGqF6v0GYFf47t0PMRU6EQaxv5WFe7nw1V2ZA3ObckRqO2
 /e6dA0pR8x+mdWoIX9kdjlHcXEtlIseWvd+t3xM1UhGQM6atPn6tzQTh3JYd0uYChSqoqqxEO7x
 HjKBGc8YG1yjalOGpowa/eVeCjdVXw5KoUwZIREYEGEEnj5n4UssoDUABQC/LnKNGkoFRnF+0Bm
 Gg+7o9dasJAxuLr1Me2URwCXqUmxY6MQaN7/FqJm32LzdDs4z25W8siYaIc6hgl+/He8Nc1NAqP
 54GzTigkE5CjoL26SEhe+fRWClFSMDXUQQaFEfPDzvo5ZqPXkxZ/i4Jzac7IElpTQ6ItiKflDXL
 uqL6938plMXE7AQDbQ6IiZG20RV8dFgp6lHN3fN6Ktz4SLWi1jNkPMeFP9MzpATft99M2HDcAII
 NJVxIgZOSCbNz6zOqA9UlgkJ1Xo4f018d/ZhkyJ2hY4Sd1Sdc+Vt13hMV3uJCsJCuSJOd8luOwo
 i45uTVSxobapSnQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Describe the firmware-managed variant of the QCom DesignWare MAC. As the
properties here differ a lot from the HLOS-managed variant, lets put it
in a separate file.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../devicetree/bindings/net/qcom,ethqos-scmi.yaml  | 101 +++++++++++++++++++++
 .../devicetree/bindings/net/snps,dwmac.yaml        |   5 +-
 MAINTAINERS                                        |   1 +
 3 files changed, 106 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos-scmi.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos-scmi.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..b821299d7b30cdb802d9ee5d9fa17542b8334bd2
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/qcom,ethqos-scmi.yaml
@@ -0,0 +1,101 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/qcom,ethqos-scmi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Ethernet ETHQOS device (firmware managed)
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
+  - Konrad Dybcio <konradybcio@kernel.org>
+  - Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+description:
+  dwmmac based Qualcomm ethernet devices which support Gigabit
+  ethernet (version v2.3.0 and onwards) with clocks, interconnects, etc.
+  managed by firmware
+
+allOf:
+  - $ref: snps,dwmac.yaml#
+
+properties:
+  compatible:
+    const: qcom,sa8255p-ethqos
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: stmmaceth
+      - const: rgmii
+
+  interrupts:
+    items:
+      - description: Combined signal for various interrupt events
+      - description: The interrupt that occurs when HW safety error triggered
+
+  interrupt-names:
+    items:
+      - const: macirq
+      - const: sfty
+
+  power-domains:
+    minItems: 3
+
+  power-domain-names:
+    items:
+      - const: core
+      - const: mdio
+      - const: serdes
+
+  iommus:
+    maxItems: 1
+
+  dma-coherent: true
+
+  phys: true
+
+  phy-names:
+    const: serdes
+
+required:
+  - compatible
+  - reg-names
+  - power-domains
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    ethernet: ethernet@7a80000 {
+        compatible = "qcom,sa8255p-ethqos";
+        reg = <0x23040000 0x10000>,
+              <0x23056000 0x100>;
+        reg-names = "stmmaceth", "rgmii";
+
+        iommus = <&apps_smmu 0x120 0x7>;
+
+        interrupts = <GIC_SPI 946 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 782 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "macirq", "sfty";
+
+        dma-coherent;
+
+        snps,tso;
+        snps,pbl = <32>;
+        rx-fifo-depth = <16384>;
+        tx-fifo-depth = <16384>;
+
+        phy-handle = <&ethernet_phy>;
+        phy-mode = "2500base-x";
+
+        snps,mtl-rx-config = <&mtl_rx_setup1>;
+        snps,mtl-tx-config = <&mtl_tx_setup1>;
+
+        power-domains = <&scmi8_pd 0>, <&scmi8_pd 1>, <&scmi8_dvfs 0>;
+        power-domain-names = "core", "mdio","serdes";
+    };
diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index dd3c72e8363e70d101ed2702e2ea3235ee38e2a0..312d1bbc2ad1051520355039f5587381cbd1e01c 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -71,6 +71,7 @@ properties:
         - loongson,ls7a-dwmac
         - nxp,s32g2-dwmac
         - qcom,qcs404-ethqos
+        - qcom,sa8255p-ethqos
         - qcom,sa8775p-ethqos
         - qcom,sc8280xp-ethqos
         - qcom,sm8150-ethqos
@@ -180,7 +181,8 @@ properties:
           - const: ahb
 
   power-domains:
-    maxItems: 1
+    minItems: 1
+    maxItems: 3
 
   mac-mode:
     $ref: ethernet-controller.yaml#/properties/phy-connection-type
@@ -643,6 +645,7 @@ allOf:
                 - ingenic,x1830-mac
                 - ingenic,x2000-mac
                 - qcom,qcs404-ethqos
+                - qcom,sa8255p-ethqos
                 - qcom,sa8775p-ethqos
                 - qcom,sc8280xp-ethqos
                 - qcom,sm8150-ethqos
diff --git a/MAINTAINERS b/MAINTAINERS
index 252b06d4240cc2b67405b8a967055bd53dec7c8e..14c80fbad8b97cc5562555d2422c81724d42111d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21218,6 +21218,7 @@ M:	Vinod Koul <vkoul@kernel.org>
 L:	netdev@vger.kernel.org
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/net/qcom,ethqos-scmi.yaml
 F:	Documentation/devicetree/bindings/net/qcom,ethqos.yaml
 F:	drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
 

-- 
2.48.1


