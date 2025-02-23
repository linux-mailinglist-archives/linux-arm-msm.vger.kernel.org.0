Return-Path: <linux-arm-msm+bounces-49057-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 971C6A40ED6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Feb 2025 13:23:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A4A797AB66F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Feb 2025 12:22:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 636B6207DE8;
	Sun, 23 Feb 2025 12:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MrAxln4M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CFC3206F16;
	Sun, 23 Feb 2025 12:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740313358; cv=none; b=lO9FrYKlho+38kesm+3rkNe8QvdPb8W+w+O+s7n1ZILdn1JGe2wtZyUHEv+sFJOuL4AZ8OtDT8c3ra0uSMYsZaCjAlxTbRcE0pDe4Q8Gn5o5qiPA3atmdj+BVn/dHAaF5yKjQ/a+9pbHTS0s5+sM0p7uVLrweZd67CNMmeXVRzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740313358; c=relaxed/simple;
	bh=XpX6AEIeWqhI9NarS2+Jte5eYMQsoExH2SeFYA9z3jE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IRCwsO7xKnqTjle7yqtbE84nGPN0k7AkhgHGz+PbQib4w+Xr82bietvqdWZ5ePVbCPQXN2De2mLuLJ+6/qAIZkjyubh4eQOgMoErCVFjfBrVWJ6ikGX0dkr6h8seodIrWNqFWbMcVdWtWd72AZq6omGR0AXwRKjYYQwyoxA4yq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MrAxln4M; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-38f2f391864so1944281f8f.3;
        Sun, 23 Feb 2025 04:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740313355; x=1740918155; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2TbGBzUDvgVe7DZmZtqsqC9SxMmEhDsYTwwUDb5o6oI=;
        b=MrAxln4MXNbdGhNpgPL8jvBczJx1Z1SsEuCcKbJ9ieZ6p4iC05ME9UcLlBEp830pOn
         UlG5M0pEgrRxiRhXBGSyLtZ+W7cqN+c9JWr5p2QpMoQf8xEf9BiLn95OZNN/azF61U31
         OqzqUKD1+wGODZiwd2Z49AiuwS9s8zSnmZB99ivebpJlkZnMCFSfMvd4k11vkfv1mV05
         ymBogDQwBoUa7XkWUeJOtwLZzKWrhM2+6iAJLnskVYvHfMFDJZb5Xffzy6sp1lbWvB3z
         Yf+U/7F6hqQTajLNtxGSjNE1Lqx7Rl6C/CxCki2FlJTUPSsVxGu8LuFPAch7DEM/5JuE
         Tgjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740313355; x=1740918155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2TbGBzUDvgVe7DZmZtqsqC9SxMmEhDsYTwwUDb5o6oI=;
        b=bosSQ6yxmI14csIJ8rCfxA6c7zKZ5Afvl0JMmG0okmlur4xJLujiEznzyDNj1QDMoe
         VIMK0KEhudNx9qrf6Z5L1Y4JPu8Xk3/Dk79YZ4FaP321xHtVn3Igg/+UJUXHXqKzSW8n
         DXcPhxAgp1Vuz59iFmOVsVcx52pLyRYDvjver2CihQOUWfvQ00bYtR+6lKgEPM8xE0dN
         3Z3d3uvFICPX/8VyLqFGmy6BK87Pn6ZpWD+7NkL5rPtt9RAQbJp1MjBKwVtaco6ZbPgc
         34N/ddOJJSZSwIs5robEnmqwbL3GiREY262iNpT09gvXtF+RdE769NyzrAk1sIfaZuGT
         mW8A==
X-Forwarded-Encrypted: i=1; AJvYcCUEmQEGs04FTmEt61fmugK3OGU8/y0S2kYpHG4x/OfMh+iCTnKD//Dnd1ty8iTqStiER+wJCYdV/zEXMCpkQMGvLQQ=@vger.kernel.org, AJvYcCVXjQqjDHhiw8fkNur+ovw5bYhmVaOAl4t1hdLSQ9b8f6bac8ffkHt8d+7lTGm1wAxMkMaEtkrXjLzLHCts@vger.kernel.org, AJvYcCWEA1vir8NivoYVoazToDJ2ISLSvThzYKM1BIWPtpym5Lzf5Kk4O2u4tVr+hqEtE+trX56EJPuGq0lb@vger.kernel.org
X-Gm-Message-State: AOJu0YxtmpH6FwO114P5Bq2efcRb7wTHtS89pQwYbW9hwVb+x9qS6Zqx
	JIRWecvCAYZySrIDmyGX4Ca3zoQQYFGZiBfDtYjNJ2ePJC/yWlTK
X-Gm-Gg: ASbGncveL/o9dM+9Dnrt8Te4o752agwLJE7ndJmYpGpjaha6h7Bx/q5iiv0kSw34ORw
	wZU7ZvyQ77D08N9BK0lcXsNoEC3Q44DJIcCK9N561QNJMmyyGmqsBp2Ow/gDnZHRQIHZDXTjzSH
	r7diuefyvTQjpOUF9+D/nfeQ5vqcBJvm9yaoRlSGxgS3fdytbEbDiHS9J9jzodplAIfAe0WVs3M
	5s17ztCx0AApgjqtDW4+paKn2qLIQFM6lzjTzBs2QKKVHYE4cLOnRICkpUXtq4k0eWnFaI89nj5
	5kL4RZEbXPzOGYFxw0+bbAyi8Kzzl0ycd0TDh5mxyS94NfFAQsellUHsr+/KRAiCU0tqK7Z1JK7
	Nqw==
X-Google-Smtp-Source: AGHT+IFMMFEPDMQAE9igHIO1s4NQHd7QMje6bLzkA+Bu0OEI2dPAuclKIJlYvuVA53CK1jDPbgzvtA==
X-Received: by 2002:a5d:584b:0:b0:38f:3b41:c952 with SMTP id ffacd0b85a97d-38f6e754b82mr7082161f8f.4.1740313354607;
        Sun, 23 Feb 2025 04:22:34 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259f8602sm29611608f8f.94.2025.02.23.04.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 04:22:34 -0800 (PST)
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
Subject: [PATCH v2 3/8] dt-bindings: phy: add samsung,exynos2200-usbcon-phy schema file
Date: Sun, 23 Feb 2025 14:22:22 +0200
Message-ID: <20250223122227.725233-4-ivo.ivanov.ivanov1@gmail.com>
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

The Exynos2200 SoC has a USB controller PHY, which acts as an
intermediary between a USB controller (typically DWC3) and other PHYs
(UTMI, PIPE3). Add a dt-binding schema for it.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../phy/samsung,exynos2200-usbcon-phy.yaml    | 76 +++++++++++++++++++
 1 file changed, 76 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml
new file mode 100644
index 000000000..7d879ec8b
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/samsung,exynos2200-usbcon-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Exynos2200 USB controller PHY
+
+maintainers:
+  - Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
+
+description:
+  Exynos2200 USB controller PHY is an intermediary between a USB controller
+  (typically DWC3) and other PHYs (UTMI, PIPE3).
+
+properties:
+  compatible:
+    enum:
+      - samsung,exynos2200-usbcon-phy
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: bus clock
+
+  clock-names:
+    items:
+      - const: bus
+
+  "#phy-cells":
+    const: 0
+
+  phys:
+    maxItems: 1
+    description:
+      Phandle to eUSB2 PHY
+
+  samsung,pmu-syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    maxItems: 1
+    items:
+      minItems: 1
+      items:
+        - description: phandle for PMU system controller interface, used to
+                       control PMU registers bits for USBCON PHY
+        - description: offset of the pmu control register
+    description:
+      Should be phandle/offset pair. The phandle to System Register syscon node
+      and the offset for USBCON PHY.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - "#phy-cells"
+  - phys
+  - samsung,pmu-syscon
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/samsung,exynos2200-cmu.h>
+
+    usb_con_phy: phy@10aa0000 {
+        compatible = "samsung,exynos2200-usbcon-phy";
+        reg = <0x10aa0000 0x10000>;
+        clocks = <&cmu_hsi0 CLK_MOUT_HSI0_NOC>;
+        clock-names = "bus";
+        #phy-cells = <0>;
+        phys = <&usb_hs_phy>;
+        samsung,pmu-syscon = <&pmu_system_controller 0x72c>;
+    };
-- 
2.43.0


