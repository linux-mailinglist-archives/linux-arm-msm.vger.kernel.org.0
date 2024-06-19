Return-Path: <linux-arm-msm+bounces-23255-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A41F90F61A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 20:33:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EAB69B21543
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 18:33:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DA84158859;
	Wed, 19 Jun 2024 18:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="nPp/wZaR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60D2158206
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jun 2024 18:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718821999; cv=none; b=sEqiBOMeS99L3/QKJgmIoJH5F3ZkUwYzy41WAmKHAPejkNew+VSVbvKxdQ3cQeIhk5OH2MCtHKtepIrOyY7ZplcM3mlJXUMVF4/pViJP+NtC0UCGauQjqoHbDXS9XnwkEOzwYKZHBKvmo7NXz226uA6Kcn6qPSHwW8EJkCcy27o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718821999; c=relaxed/simple;
	bh=npr+JsWRhOLGgs/iyAHgchW0S+F3M7JDWhTYMWaxa4s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=okGgC0Y3TwJ7Dz1dDllmiuoLihw1IHM6TUzME3Lho83tNwA5jChcum/FoqbjFzCJtTM/U9ecSVXRG/5Ts1rpjpJ8hZlLilepCIWXMs1ZeyXZvIR6KR6YLdrcbP5gdBF8cvVeYWJUmS2ejx5eU2zwGlHNAGqK98Th2PHvvolbJo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=nPp/wZaR; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3609565a1bdso69652f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jun 2024 11:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1718821996; x=1719426796; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2aO6Qz8DqhtKdR2lV/fzuJ9e652CmsqmVwWuOJ3eYns=;
        b=nPp/wZaR4hgsJMJDL7XdsGzKhg+l9R5rlXTcnTfs09lOQU76XkJKmJR9SFqJ1RLdRH
         1D01xz8CXdHCdcQ65i8BjTxVGQAmHVLx9cBmLQHqF52XjSWJvRaJ/KwJnGO0n+XwswJN
         NvV/S1y+yxXttUl1eRD80MKF2273kY0F6M3lnL18RJKsSwSD5sIK6HJh9J+vHpIJtsnu
         8PwuL/x/mQ2V9l2DC2LPNxm5KEu9qfGJbLSEin3kHegBaadSep66rsr/uQZwCaW0UHVt
         +TTvL3obSABfZzhfEPQSh8BkkzKBW94R2xXRT8QjTQQQuwK5qHg7A1c3kGI2AiaZmFKq
         Hi9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718821996; x=1719426796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2aO6Qz8DqhtKdR2lV/fzuJ9e652CmsqmVwWuOJ3eYns=;
        b=b6e2FUJ0d5q0U4L3ENHsACEhVnvSXA+Y0Z6E0ltg6VfMzhKVdcaPE338+IQZ1KGmxA
         9INlxiVbFOUuUiDkE4w0/gcBN9ra0noSMXZh7RVB8mTphURK/SwS670A1jfna7M1TRol
         8As/1aPxOGFKR3tGQQBYyNB2MVLevGLifR1R9UtLy5880Xn6xnKqM1oIskCGeagGZ+mE
         KL6U3OYfMELfSkb+Csu8+v4Uet/Sp1xrmH/JWR5+Cae9DSwO9lSx8O4VPaphc7yx6SyV
         r4s3QW6QDBmH52dTVnIFfCAjXMkjrFWlnedU6VCNi1M2KtnLTZsFdi34OZrObSXLdApZ
         MEsg==
X-Gm-Message-State: AOJu0YwXl/830Ma+U+Una4qVHzARUW2gmmaFPL/1DmRNRDXOtgElB8QG
	ppT9aS7f6lid/8Ykh9Ljuvm550eXyBiQfYWa9m8bxd86lKFPfS2v1Fx5Wa1IiKM=
X-Google-Smtp-Source: AGHT+IFvScl1lSA4FKhQ6Fmx86Xeee/Nl9ibn6cgSyfcX3a5H+BpJOZqLQI0Y89Adkiv+47GC78LJw==
X-Received: by 2002:a5d:5683:0:b0:363:5e15:3bd9 with SMTP id ffacd0b85a97d-3635e153d16mr1881102f8f.57.1718821995833;
        Wed, 19 Jun 2024 11:33:15 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:991f:deb8:4c5d:d73d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36262f77ad9sm4603238f8f.109.2024.06.19.11.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 11:33:14 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 2/2] arm64: dts: qcom: sa8775p-ride-r3: add new board file
Date: Wed, 19 Jun 2024 20:32:54 +0200
Message-ID: <20240619183255.34107-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240619183255.34107-1-brgl@bgdev.pl>
References: <20240619183255.34107-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Revision 3 of the sa8775p-ride board uses a different PHY for the two
ethernet ports and supports 2.5G speed. Create a new file for the board
reflecting the changes.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/boot/dts/qcom/Makefile            |  1 +
 arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts | 42 ++++++++++++++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 0c1cebd16649..916fbdbf5631 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -112,6 +112,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sa8155p-adp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sa8295p-adp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sa8540p-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sa8775p-ride.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sa8775p-ride-r3.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-acer-aspire1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-coachz-r1.dtb
diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts b/arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts
new file mode 100644
index 000000000000..d7f0a25c1fc4
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2023, Linaro Limited
+ */
+
+/dts-v1/;
+
+#include "sa8775p-ride.dtsi"
+
+&ethernet0 {
+	phy-mode = "ocsgmii";
+};
+
+&ethernet1 {
+	phy-mode = "ocsgmii";
+};
+
+&mdio {
+	compatible = "snps,dwmac-mdio";
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	sgmii_phy0: phy@8 {
+		compatible = "ethernet-phy-id31c3.1c33";
+		reg = <0x8>;
+		device_type = "ethernet-phy";
+		interrupts-extended = <&tlmm 7 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&pmm8654au_2_gpios 8 GPIO_ACTIVE_LOW>;
+		reset-assert-us = <11000>;
+		reset-deassert-us = <70000>;
+	};
+
+	sgmii_phy1: phy@0 {
+		compatible = "ethernet-phy-id31c3.1c33";
+		reg = <0x0>;
+		device_type = "ethernet-phy";
+		interrupts-extended = <&tlmm 26 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&pmm8654au_2_gpios 9 GPIO_ACTIVE_LOW>;
+		reset-assert-us = <11000>;
+		reset-deassert-us = <70000>;
+	};
+};
-- 
2.43.0


