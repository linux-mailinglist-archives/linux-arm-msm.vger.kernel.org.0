Return-Path: <linux-arm-msm+bounces-54111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C05A86F62
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Apr 2025 22:27:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D3C417F25D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Apr 2025 20:27:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABCE8221FDC;
	Sat, 12 Apr 2025 20:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TN+YKEAZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDCE5194124;
	Sat, 12 Apr 2025 20:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744489620; cv=none; b=Ym/KH1M/M8BfFpjQ8AUS8iv/pCvhsp4ie9dOo0Q9dD6AbDMAEemDNM987VC00iCqE/SZGq10rw14GBScKiAGiLXb2OQFdXyQ9BAKan7eg5nR2lpYacgA2ct1jz/CDr/dl6kgtaTgQXnFK4wFIK0x/o1pxtcHCBcmsjFuHWlZz2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744489620; c=relaxed/simple;
	bh=QZ+uianZEUz8/XAB2IogwiYrS7vYk3h2iBHIvEq1MA4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rN8LXMM6F38vGch2+fjN4/cmEH4/Lzn+wVapz249jD5EF8UgLyzGtYGNm+8t80lqPuiOkQgaezqziERpZnwlSz8jFIPstdw95lID7bTVLabBePtPxke7X16IUfmShMHImy2xZ6RdV8GAhMO95J75j/IVjTmOByHe5Kv3KTgzAbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TN+YKEAZ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43d07ca6a80so14699905e9.1;
        Sat, 12 Apr 2025 13:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744489617; x=1745094417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LsQ/Xff2+RA/VYwRRvqpIoChOLpkXdtKapMvgQDbuBs=;
        b=TN+YKEAZbQdzxAGuqlIxmHJtvwWx1A2V7eWMB3vZ5QoveuizwwhgeU+WjGqWZsjQLR
         EGig88DrX8Jb2Caym8TYqBTdy6GoK4MKLj3BBYEkNSwZkv/qcKKv/Kk+PbgFVFs6M0xm
         jCaYl18IvaoCYC8p+Sme3883qvu0zCfDR57XWUxX2VA0hZOhK+M1PLvlGMLDBbv6jOIQ
         bwd1ZzpUTmFuIa6HPktnPkJ1rMl4gCur7Fs80J3XxdXEqylGNLcudVvFKv3IZLPF/KAe
         UoMHAj95bMHM3xZkhL8FkCF3lbByzdRBkE2rFCti4+gcvKhYlaFEMA1/Kg5sP2JoJkpE
         hZUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744489617; x=1745094417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LsQ/Xff2+RA/VYwRRvqpIoChOLpkXdtKapMvgQDbuBs=;
        b=wd9hCJeIEi4OD/ffUgN6PnawPMruIRqsrCmRrXwwsEIajSH9DYZq0p/8O4Z47gWSAx
         /9zT3Fggbr+RFqThpO/DYgGI/xgDl5/+rhVYF/9907BRu7//evCRm/kjnf2fC9vodsmu
         jkKW/SUC4ctnnZwp1GJCpjv/SsOJZMWuLpVaVtCai+hBEqv4hrUXWDYBv3+Wdo0B4Kmd
         IPyQZLliRDKZlfs0RZfP8arD4dEqFWdrCyjaHcnVI781WVU4K7SIr5x9MgiR141Waw2Z
         fUcH1sNnyYPLaEszVN8gFGwvyECVcKlStPqaeWu9NXUnRYSOR9mCBcJHOMlVRnX9e2qt
         q6pA==
X-Forwarded-Encrypted: i=1; AJvYcCVtddb9MWjw6qKPt0DEaREEsBHvGrQy1Euw2DIQpBBvO0dbY72IQ+/zBf8Z3+CIuAKlcojDOL3WBniA@vger.kernel.org, AJvYcCX3MO13CLA0QOHk5Bc3tmoueuYPR1dRgYHInM0OC2XOZniJVps8FNJZFEcvWpYdFl6xl2UVkCPSnOllFKFS@vger.kernel.org, AJvYcCXexnQhfM3kkW1zStZgSHTJRO8mSxrzZAlk+4xgKOPz/TazCkotxh6zwZMBxc5pjXr6smpnwCUKV8z8mIQpOw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2ehvvT8RwEpebKTGaCyUfzvA5+Mn1bzBgQF+Ov/pxeV8HE+Sb
	B/vcGdbh+qPBYyWZjUAnjprnWe8hOaozP4NihF6yte0GK62vxPDk
X-Gm-Gg: ASbGnctWrnwznGlaXvLITselmHvKtQ+lTkoItvi/n/r8VkjydO5xliGhka9w+5EViID
	CmrWrVWa3zSRx5AmfEBeIJoq6zoXFiyAF1xSOTOTwrLQnt0sDo6xUBaoeeo7Fv48P9gOD5wfyT+
	fmgdloNGFg1/sqRorJ3pEeUMNgrVEWLbkPp+A7pDzfZcIzmPVhGhDh66qWnNpYhIc6bxTbywd7s
	HZmRVqFWPsVDdy1HZWImTBDXoxAdn1k9vNzz+CMcbPyGvK1hzQbnAHJfGchaNnP4y6P2GWJ3nRR
	C8nrD+c9jP3qMSdD2mZk6MwJY/AWVi2lMEg6lSozW6fMsSM6fef1bpXUU5WciFMnRNKiNThkixi
	qkPxXDIH2rdgY8lC5
X-Google-Smtp-Source: AGHT+IFP+XkFysoPsINc3NpIKIT4Gtr8job/cOX6Be9DaYeNjIosjEEY2429amZfVdkYJ3ZD3XRl9A==
X-Received: by 2002:a05:600c:b90:b0:43d:fa58:8377 with SMTP id 5b1f17b1804b1-43f3a9afb11mr62712575e9.32.1744489616759;
        Sat, 12 Apr 2025 13:26:56 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2338d802sm131797845e9.1.2025.04.12.13.26.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 13:26:56 -0700 (PDT)
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
Subject: [PATCH v4 01/10] dt-bindings: phy: add exynos2200 eusb2 phy support
Date: Sat, 12 Apr 2025 23:26:11 +0300
Message-ID: <20250412202620.738150-2-ivo.ivanov.ivanov1@gmail.com>
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

Document the exynos2200 eUSB2 compatible. Unlike the currently documented
Qualcomm SoCs, the driver doesn't make use of reset lines for reset
control and uses more clocks.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../bindings/phy/samsung,snps-eusb2-phy.yaml  | 79 +++++++++++++++++++
 1 file changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/samsung,snps-eusb2-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/samsung,snps-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,snps-eusb2-phy.yaml
new file mode 100644
index 000000000..09d3fdd4a
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/samsung,snps-eusb2-phy.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/samsung,snps-eusb2-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung SNPS eUSB2 phy controller
+
+maintainers:
+  - Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
+
+description:
+  eUSB2 controller supports LS/FS/HS usb connectivity on Exynos2200.
+
+properties:
+  compatible:
+    enum:
+      - samsung,exynos2200-snps-eusb2-phy
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
+        compatible = "samsung,exynos2200-snps-eusb2-phy";
+        reg = <0x10ab0000 0x10000>;
+        #phy-cells = <0>;
+
+        clocks = <&cmu_hsi0 7>,
+            <&cmu_hsi0 5>,
+            <&cmu_hsi0 8>;
+        clock-names = "ref", "bus", "ctrl";
+
+        vdd-supply = <&vreg_0p88>;
+        vdda12-supply = <&vreg_1p2>;
+    };
-- 
2.43.0


