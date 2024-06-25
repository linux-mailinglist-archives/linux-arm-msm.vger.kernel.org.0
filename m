Return-Path: <linux-arm-msm+bounces-24120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D11916CC8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 17:22:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E105C1F2AD6C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 15:22:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A92E41802D3;
	Tue, 25 Jun 2024 15:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ndD+UOKG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC4E17F516
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2024 15:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719328489; cv=none; b=t1qGr8iE45QtCWzLZBAJR6LPTQCV6Pnkj4Sn+7+oXMhpp+RrwbsFPrMiqgm5ZItQUpVYTpkX+jU8pkz7O0rnPco+KulEs9J0y3b9ruoj2xsanKsxGC1l+qCmkPtlQxKFtL+2kieXKdEpagPpa8Mso9yM4PmkmVThR/ZJ/gLlOqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719328489; c=relaxed/simple;
	bh=k1iHtedjV9QVkielOiNOemjYbP3g9sxxZNa/dBLY7fI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XUYdRhggZrUdrk1MmvUnCe25P65/Gd4Liouw5mwYguiukMuEdAgh6sTTYJXat44KsHrwPoD8fymbeMYkdPgZw13/F50tAZP+14LWWuB19j90hWt5O0XCKsMWlPwqdoOEPqSS+u0VVvBvUEy69r5+o9DFUCsvtonUGuaJG7Ra3qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ndD+UOKG; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3620ee2cdf7so3552191f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2024 08:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1719328486; x=1719933286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eaxQjkO+ga+J3aoKVTPSLO6QhoxA4KxcQLOxXe5fbzI=;
        b=ndD+UOKGYVfJC5KLRP/RfSHy3cyDj8TdZcOomeuEwW//Qx/1ruYaad91Nd3t5ojJk6
         BIzprTE6ooGLWnXs3hHZX7Ug9ZFlXKN5YNDfC52km0FXP41fHo8sxcJv9eBrmwN5AOFs
         B+bX6H7LzZPiFdG+yRVkPQJfAxIDOemThLVkNZ0SIGr5LkIFe/alIzRj0NJh3d9686G6
         8LuJQqNnSFLc9+ZJYic5m8vWf2PkonLYmfdPAiPc2EBOBgQP+jaUIqaci9EUStWHYoLy
         T1TfSHXklrYA8C84EJkq0dVjubooPUzoG+AZboPX3yPe9llJEPYiNEoPB5Xe8EOtxACo
         n6eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719328486; x=1719933286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eaxQjkO+ga+J3aoKVTPSLO6QhoxA4KxcQLOxXe5fbzI=;
        b=xL1KosRZkNk5KyV2XES0SZqj/dpPV0h7TL3XPQWM5fv+yH6hPQfGzixFNBVEu6t6PV
         Js5aMrDc6LYgX444XEyAJrcdP+v9oojtEocXNKYN7lG1iHjhaILhYZ9c5J1DC5qb4p+E
         x6uGqKn6V28n6+/qDeV5DcRGnNzey58VOwJkvRq7nLYLh1Oea7qVJWONbsELhh785hUM
         iH88W660SMGysynBfVKhBtQC1sd/uZWLpS9JhKDURMopHDqV2jDMlKwnsYukzbJxRu96
         QadZRct2uXnJ4OVybLWdSSGmxuHNQXPkbyLiyMjioqIgKVBWdiRggAFfMJ2QEK5dP2Oy
         w+IQ==
X-Gm-Message-State: AOJu0Yx1rKWoWWzm9uc9r6Ru/xaNNgZf/WJVU3V+3BP8W6KY0PumGoYa
	Ix2HwotSO2PNeBTXj3PCJogOvUyXaI3E38hk6bXC6AIjwOQ17nCiZUiXDDCHuJA=
X-Google-Smtp-Source: AGHT+IFdH348oNNdczelRSKUmSIbTq236WncTciAk1DA7zjg7Vx/B5Ddu1ouzt/SV1V9cTkxVdQMlg==
X-Received: by 2002:a5d:68d2:0:b0:362:41a4:974d with SMTP id ffacd0b85a97d-366e7a56ecfmr5620684f8f.46.1719328485762;
        Tue, 25 Jun 2024 08:14:45 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:2b2c:4971:1887:588b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3663a2f694asm13215884f8f.77.2024.06.25.08.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 08:14:45 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 3/3] arm64: dts: qcom: sa8775p-ride-r3: add new board file
Date: Tue, 25 Jun 2024 17:14:30 +0200
Message-ID: <20240625151430.34024-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240625151430.34024-1-brgl@bgdev.pl>
References: <20240625151430.34024-1-brgl@bgdev.pl>
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
 arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts | 47 ++++++++++++++++++++
 2 files changed, 48 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 5576c7d6ea06..8b7a81b82213 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -113,6 +113,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sa8155p-adp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sa8295p-adp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sa8540p-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sa8775p-ride.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sa8775p-ride-r3.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-acer-aspire1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-coachz-r1.dtb
diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts b/arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts
new file mode 100644
index 000000000000..d214a87d69b2
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts
@@ -0,0 +1,47 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2023, Linaro Limited
+ */
+
+/dts-v1/;
+
+#include "sa8775p-ride.dtsi"
+
+/ {
+	model = "Qualcomm SA8775P Ride Rev3";
+	compatible = "qcom,sa8775p-ride-r3", "qcom,sa8775p";
+};
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


