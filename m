Return-Path: <linux-arm-msm+bounces-73190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC0EB53ED5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 00:48:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A46F716F1AC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 22:48:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09ACC2EE268;
	Thu, 11 Sep 2025 22:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l3zSV+Ou"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4E423E34C
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 22:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757630894; cv=none; b=Tu8OkPh4cBxbVGdF/eWqc65czCONIxhdrAKScYZExJ4r+GOYGPMH+rElvBDvVj8m0Q2hykoclYZmzEjSGnZ2ZXBMCh2Cijk8zfQIEf0JSBV8yOxsYuXk9sOkuteWbsfUeNXr8mZKfzHmUF66ZCMM7tFOLpeQbJZr0SziP5MZex8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757630894; c=relaxed/simple;
	bh=QcpX55h5PJAVRTi11X7cV7Fa6uhEGt7e9rcElHyaW0s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GAXlJH7Ko2SpY5Bmc4RaHNfRnGY3liAP57PusKPK2nyHZmap1LI4RnQhxHaIWxf+SnvfuS+SeHaXn0sAmxBdSojk42tXILkmfmNaUJ8aIi8PNHya+KJZujlebw6gtRSjRligbZd6ruzVv8T9SKJKm7MRag8OsGkCdzQW4klB9fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l3zSV+Ou; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-77264a94031so1020552b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 15:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757630892; x=1758235692; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fbysr8Q057thi5IBavhGuNL0Ocl+NxTnsfRHbgFg4WQ=;
        b=l3zSV+OuLXdjn5P3ssELWuix9ApQyb+TUCfUacpc0Br0DUO/XHS6Lg+9SKxE53rJQ7
         ETt4d+rctGHclg1W+BSEhJLnZYuOOyYJ+RfVv9i9VGS6KGXSFlJ0QI1+FQlVJF9qZ+mX
         M8M14VRPK9rAI9f0ZjzoRm2077806tuYjJGrCBuHmesM4jnIPQnIVwZfNTApk77OTrjM
         ckFiY0IN+STqZQDRoz84dRQ3zLEojz7GCrNXt62Nb8fA/dwoMWVnB0UUgFB3Zc44Ci/A
         G0mXL+/xn3ssvCLuGrQghMmRN+mNUHck1cpzjsN9L2lYwWhES8iXbe00V8zMFUDwEJy+
         YmjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757630892; x=1758235692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fbysr8Q057thi5IBavhGuNL0Ocl+NxTnsfRHbgFg4WQ=;
        b=SOHuHp3+HDBs+yfONu5ihf1bEM2e6YS8h4lL/274nnU9/FhwwIGzKyLS9FJCoSd8Ig
         0mFdoLjPEFSCz+4HiEjUM1cT6d29U0kqfJ0ERktvu7zaHzErOK7dCNuU8/7NMXv4lNNn
         iS/xBHkrSp3obAct7C/TeZS7n0sIHU/nlgEw3KtK62XcClcAWcsbIGOc2Dme17iLGdXo
         agFJuAw/pqOe6j1Z3PckYyxsxDaOKiopYYXBjXsIy4DC+uvWhqJ/o1AxHN8yJ/cxeZDf
         P1BLrL/arPKdQVIQx3JZLvFCod/tidE+1Y/9avNAAp+yyoL0G3X2QOBxho87urNrqwcU
         002g==
X-Gm-Message-State: AOJu0YxjxGYljEQ1Oax9JvFk3ZAfgQX/4YBcIDOjZAIwl8luWq72WXe+
	thjjR08bEvLtkd7Icb6oksr1YAjJ7AXOeOxgLPx6ia1RD6TzCqnFQPax
X-Gm-Gg: ASbGnctrE2bWxIeJqkM+nxi7VJsDEPW/UZE3bIhqd1vkGMGW/MtUFe4zS62ROoXeYp9
	YK4Q4RsBDWj5Ul+K+BbNYtuPj+erlIQ9pJCM7dM5tFAUGv/ROrrqsVfpBkqHSlaASZJtzkdpNhL
	uU4DCmEyzZ3nkdbAbaIAhuCtkYbct9vVMsYrI2JBkceCN7tq8OGlnpz2Ds3z7UOlmLs+V5JXcK0
	f1TYdtjGbGZ0ig+ElehnXHr9OWwOKsYDijUsHWlY1JZJPdRW4fj+iLqiA9CVGe6UdH1zypktoQC
	vv/JU1qo4xZRnT7pBOvYiS1aSoL0w7NjQuyfWtQfvQdyyiwAmXq0f0K0bmqqDMsE9C/W9Ndv+Og
	bDLkFhogVt0T/oHN4g9mvv6amzIAW1A==
X-Google-Smtp-Source: AGHT+IEsEbaCE7mQrB7/KT/rHsKRWCFdx3AEeQOQJqEAthJm9OsYM/loTwHARu2FBafUWR1y3AsUXQ==
X-Received: by 2002:a05:6a00:140f:b0:76b:c882:e0a with SMTP id d2e1a72fcca58-77612060a69mr910226b3a.5.1757630891649;
        Thu, 11 Sep 2025 15:48:11 -0700 (PDT)
Received: from archlinux ([152.245.61.23])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77607a4a24esm3172314b3a.40.2025.09.11.15.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 15:48:11 -0700 (PDT)
From: =?UTF-8?q?Eric=20Gon=C3=A7alves?= <ghatto404@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Eric=20Gon=C3=A7alves?= <ghatto404@gmail.com>
Subject: [RESEND PATCH v8 1/1] arm64: dts: qcom: add initial support for Samsung Galaxy S22
Date: Thu, 11 Sep 2025 22:47:29 +0000
Message-ID: <20250911224734.51415-2-ghatto404@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250911224734.51415-1-ghatto404@gmail.com>
References: <20250911224734.51415-1-ghatto404@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add new device support for the Samsung Galaxy S22 (SM-S901E) phone

What works:
- SimpleFB
- USB

Signed-off-by: Eric Gonçalves <ghatto404@gmail.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/sm8450-samsung-r0q.dts      | 145 ++++++++++++++++++
 2 files changed, 146 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 94a84770b080..d311e637327e 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -285,6 +285,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8350-sony-xperia-sagami-pdx214.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8350-sony-xperia-sagami-pdx215.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8450-hdk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8450-qrd.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sm8450-samsung-r0q.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8450-sony-xperia-nagara-pdx223.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8450-sony-xperia-nagara-pdx224.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-hdk.dtb
diff --git a/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts b/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts
new file mode 100644
index 000000000000..b7533c2287b7
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts
@@ -0,0 +1,145 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/dts-v1/;
+
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+
+#include "sm8450.dtsi"
+#include "pm8350.dtsi"
+#include "pm8350c.dtsi"
+
+/ {
+	model = "Samsung Galaxy S22 5G";
+	compatible = "samsung,r0q", "qcom,sm8450";
+	chassis-type = "handset";
+
+	chosen {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		framebuffer: framebuffer@b8000000 {
+			compatible = "simple-framebuffer";
+			reg = <0x0 0xb8000000 0x0 0x2b00000>;
+			width = <1080>;
+			height = <2340>;
+			stride = <(1080 * 4)>;
+			format = "a8r8g8b8";
+		};
+	};
+
+	vph_pwr: vph-pwr-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vph_pwr";
+		regulator-min-microvolt = <3700000>;
+		regulator-max-microvolt = <3700000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	reserved-memory {
+		/*
+		 * The bootloader will only keep display hardware enabled
+		 * if this memory region is named exactly 'splash_region'
+		 */
+		splash-region@b8000000 {
+			reg = <0x0 0xb8000000 0x0 0x2b00000>;
+			no-map;
+		};
+	};
+};
+
+&apps_rsc {
+	regulators-0 {
+		compatible = "qcom,pm8350-rpmh-regulators";
+		qcom,pmic-id = "b";
+
+		vdd-s1-supply = <&vph_pwr>;
+		vdd-s2-supply = <&vph_pwr>;
+		vdd-s3-supply = <&vph_pwr>;
+		vdd-s4-supply = <&vph_pwr>;
+		vdd-s5-supply = <&vph_pwr>;
+		vdd-s6-supply = <&vph_pwr>;
+		vdd-s7-supply = <&vph_pwr>;
+		vdd-s8-supply = <&vph_pwr>;
+		vdd-s9-supply = <&vph_pwr>;
+		vdd-s10-supply = <&vph_pwr>;
+		vdd-s11-supply = <&vph_pwr>;
+		vdd-s12-supply = <&vph_pwr>;
+
+		vdd-l2-l7-supply = <&vreg_bob>;
+		vdd-l3-l5-supply = <&vreg_bob>;
+
+		vreg_l2b_3p07: ldo2 {
+			regulator-min-microvolt = <3072000>;
+			regulator-max-microvolt = <3072000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5b_0p88: ldo5 {
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <888000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-1 {
+		compatible = "qcom,pm8350c-rpmh-regulators";
+		qcom,pmic-id = "c";
+
+		vdd-s1-supply = <&vph_pwr>;
+		vdd-s2-supply = <&vph_pwr>;
+		vdd-s3-supply = <&vph_pwr>;
+		vdd-s4-supply = <&vph_pwr>;
+		vdd-s5-supply = <&vph_pwr>;
+		vdd-s6-supply = <&vph_pwr>;
+		vdd-s7-supply = <&vph_pwr>;
+		vdd-s8-supply = <&vph_pwr>;
+		vdd-s9-supply = <&vph_pwr>;
+		vdd-s10-supply = <&vph_pwr>;
+
+		vdd-l1-l12-supply = <&vreg_bob>;
+		vdd-l2-l8-supply = <&vreg_bob>;
+		vdd-l3-l4-l5-l7-l13-supply = <&vreg_bob>;
+		vdd-l6-l9-l11-supply = <&vreg_bob>;
+
+		vdd-bob-supply = <&vph_pwr>;
+
+		vreg_bob: bob {
+			regulator-min-microvolt = <3008000>;
+			regulator-max-microvolt = <3960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l1c_1p8: ldo1 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+};
+
+&tlmm {
+	gpio-reserved-ranges = <36 4>; /* SPI (not linked to anything) */
+};
+
+&usb_1 {
+	/* Keep USB 2.0 only for now */
+	qcom,select-utmi-as-pipe-clk;
+
+	dr_mode = "peripheral";
+	maximum-speed = "high-speed";
+	/* Remove USB3 phy */
+	phys = <&usb_1_hsphy>;
+	phy-names = "usb2-phy";
+
+	status = "okay";
+};
+
+&usb_1_hsphy {
+	vdda-pll-supply = <&vreg_l5b_0p88>;
+	vdda18-supply = <&vreg_l1c_1p8>;
+	vdda33-supply = <&vreg_l2b_3p07>;
+
+	status = "okay";
+};
-- 
2.50.1


