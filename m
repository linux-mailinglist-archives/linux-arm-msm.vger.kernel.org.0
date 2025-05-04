Return-Path: <linux-arm-msm+bounces-56685-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A3EAA86CC
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 May 2025 16:45:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CFCC01896DA2
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 May 2025 14:46:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAD6B1CACF3;
	Sun,  4 May 2025 14:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cN4sCctJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F271224D7;
	Sun,  4 May 2025 14:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746369942; cv=none; b=EXAp7yhSlEa8rMEbMPJRuxPSig+bFbQYkakygbHdGkG9Mi+AMDH+e/1K/MIdE3Dq1sboNeilKmzpY+Y4o1iRCciYmRlB8cN1N5juqDNj9lvyFfayTgMtB/dZxWo3kzPhEBbApLa9MP0coNP/p3HnEGaijcEy6W73KBpBNddpCj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746369942; c=relaxed/simple;
	bh=l4ZEs+cwcb8MF0o19kXrX6MFyG5dUJ2KQQHwtKW7bO0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WUB0X2jTqrBYPObCsDcTgxx2kB/E9rwJfo4ZK6rFyM6UHxpFMK2z63e03/sSOeWvWgrGy59n2slYD04e4+wCRi4cEwRAQoyNPgS1HXm8mgslVrlfEkga1dxEz/8hUvQWOID5n3nSwEwogJCgx6EKt7B64J1zXh+ZqiSFunyh8V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cN4sCctJ; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5e5cded3e2eso1491516a12.0;
        Sun, 04 May 2025 07:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746369939; x=1746974739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IEe2Pk/caZE9tuS2ToysVXZZ+Dp3w9K8dh4ddcOqsJA=;
        b=cN4sCctJs2WKVoPsnqI4jgWmyf9pWsTBMF+fPupknm4gBM91Tpj/5V5vzrYHRHCesN
         FTysOqE14BgTyV7ug6yE3dgKc2EgIFTSPNG+8Gm4FZCyN4Vz2bJYp8vz/KIbjUei9sjM
         0tJIwZB9yrP2IU6zUpN/nM1NgIUoqbyhJbNHB99+u2dZBxvG/Kw5wOi/pcVm1AOtGERg
         gg4/qWwlI4/W1O/qaTrPIsOUl7l/C4jUhaSCgXCyW1TvR+z+u6jUlbpwJhZpuLmmwd37
         6ZXFMYXUD3/tVwLDSSfIDDcU0oPre9Af7psC4wux1g9zECO7IdqTZ28u6t20sXWncK9Q
         hZoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746369939; x=1746974739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IEe2Pk/caZE9tuS2ToysVXZZ+Dp3w9K8dh4ddcOqsJA=;
        b=skCoSb9aUbCQDrYf9VzNutRQDSlw8gb9WxZojrx3zzEHyQMbSqoh02mBI9NAr+6SeG
         C2tYem+9t5xcai3VYDh/NfnqLEV5XrrJByGk2XN+ct8bX5M28ZGzeIY9wDpSBXBHuI4/
         afO7+OQw/MOyvO/j6xprRX3rGwJc/Dj9OTDGJ4cCL92j9Q/y+D/fZSy7uvQIyybQoP8l
         08cx15l9ikFvpcDnee95zpAp6JYLIsmN/ao8Wrh3mzcdy7AlAySItuMZM/p/B4i1hITg
         ww5ZVC/5cWnmGR4NAcGh1b+Y7OEEzbV4ksJgmARv40oGRwDGIOXNmSt9UDvMWEheRzn4
         7Bdw==
X-Forwarded-Encrypted: i=1; AJvYcCVVJ1rFwtOjtbj/6WriO7u+GoMiwZxJPv3dCDlWyqFeH5XzPDcwRlSx70Up/zdOFFlwYnoV6lZwa7xUt/4hfsV2F4I=@vger.kernel.org, AJvYcCVdOS5fdqeTQiNz85hCQ7+BkEBnq4sJ7rcKp0jGpJad2oGfbIZLyOmXrgAaM/4OAf/kzwbCP13AUd5j3V7/iw==@vger.kernel.org, AJvYcCWDKIWapacIibbRX4Gh+qgYFoB/emFQDFDZac6yLgqiQfTcLIwLLx7DYbMuf3sLzeZxw+hb1LmXU4UmNKVf@vger.kernel.org, AJvYcCX8tr7IReewjTtxPwvhq0rDU6+qXdlqwLkagbOnx6bSjH5wD5zTGyJ8yMRGqC/IVO987yd6xPWnDGmb@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/uEUoMnB2juKUdaUM41NQ9fIbEyQRNjosNeTrnluEeAY/0vck
	55eqGRI2a9LHWS0VE8mEusioU6CZilZbsYOSUrRmN83y6/Ve+qDj
X-Gm-Gg: ASbGncsNRK64EUG561z5LYMbQ0C4db9JWL7kgaYNULknEV8VGPJeFMEzSCPZtNddQCg
	ugteFq4uCTNxj6Nf2jmGeMJgzX6Rq/MxN1rCjqEsnFFZG8rnhHdp+UB+LXcZXUQOB8WB47rFBmv
	pYJ9bEVL/felr1vzvTq6Y693908rO27nz7HWztoBEUri+mOkya4GheKpOj6Pv3G+jmY/QAkkRCc
	KjSPzBQmLdeOpYTl92P/RfVBJgz2mPaBsddPg9/Xt4/1CNG5UHq9qbeCsHH+GRVLPlOXA6Sg99S
	R8T34q7VkuTpHU6nvRxAC1j6z/2xaSM9LI7Mi9yFZCmhRov9QX1nN76nZ4KRj64sy7KjvsU4gGS
	RK5lgDsBBq5eBsU20
X-Google-Smtp-Source: AGHT+IHh3dzRLVQA3aqoCJ5MBNUWOlX9P7YffHdktJwcGumENYOkPRjsZ41k9Z0xC0aeBgpqQPMNSg==
X-Received: by 2002:a05:6402:1ecb:b0:5e4:c119:7ff8 with SMTP id 4fb4d7f45d1cf-5faa7f3170bmr4343957a12.4.1746369938837;
        Sun, 04 May 2025 07:45:38 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5faecf59d31sm1147258a12.77.2025.05.04.07.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 07:45:38 -0700 (PDT)
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
Subject: [PATCH v5 01/10] dt-bindings: phy: add exynos2200 eusb2 phy support
Date: Sun,  4 May 2025 17:45:18 +0300
Message-ID: <20250504144527.1723980-2-ivo.ivanov.ivanov1@gmail.com>
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

Document the exynos2200 eUSB2 compatible. Unlike the currently documented
Qualcomm SoCs, the driver doesn't make use of reset lines for reset
control and uses more clocks.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../phy/samsung,exynos2200-eusb2-phy.yaml     | 80 +++++++++++++++++++
 1 file changed, 80 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/samsung,exynos2200-eusb2-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/samsung,exynos2200-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,exynos2200-eusb2-phy.yaml
new file mode 100644
index 000000000..5e7e1bc2e
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/samsung,exynos2200-eusb2-phy.yaml
@@ -0,0 +1,80 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/samsung,exynos2200-eusb2-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Exynos2200 eUSB2 phy controller
+
+maintainers:
+  - Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
+
+description:
+  Samsung Exynos2200 eUSB2 phy, based on Synopsys eUSB2 IP block, supports
+  LS/FS/HS usb connectivity.
+
+properties:
+  compatible:
+    enum:
+      - samsung,exynos2200-eusb2-phy
+
+  reg:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 0
+
+  clocks:
+    items:
+      - description: Reference clock
+      - description: Bus (APB) clock
+      - description: Control clock
+
+  clock-names:
+    items:
+      - const: ref
+      - const: bus
+      - const: ctrl
+
+  resets:
+    maxItems: 1
+
+  phys:
+    maxItems: 1
+    description:
+      Phandle to eUSB2 to USB 2.0 repeater
+
+  vdd-supply:
+    description:
+      Phandle to 0.88V regulator supply to PHY digital circuit.
+
+  vdda12-supply:
+    description:
+      Phandle to 1.2V regulator supply to PHY refclk pll block.
+
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
+  - clocks
+  - clock-names
+  - vdd-supply
+  - vdda12-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    usb_hsphy: phy@10ab0000 {
+        compatible = "samsung,exynos2200-eusb2-phy";
+        reg = <0x10ab0000 0x10000>;
+        #phy-cells = <0>;
+
+        clocks = <&cmu_hsi0 7>,
+                 <&cmu_hsi0 5>,
+                 <&cmu_hsi0 8>;
+        clock-names = "ref", "bus", "ctrl";
+
+        vdd-supply = <&vreg_0p88>;
+        vdda12-supply = <&vreg_1p2>;
+    };
-- 
2.43.0


