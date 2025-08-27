Return-Path: <linux-arm-msm+bounces-71047-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5BCB38B86
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 23:35:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BEEA61BA87BC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 21:35:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15ED62F3C1A;
	Wed, 27 Aug 2025 21:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="grIPs08/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E7130DD3B;
	Wed, 27 Aug 2025 21:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756330500; cv=none; b=WA1T2tZvvsT77aAEr6iMTSvd85VJMjf4hvjgbzTkQ2cDqMIz3Fch0cIEYkQiTHUklKjQy7y+TYxoTLYhV7fF8zT8qoBb1F+DKt3qLBJ9IMOMhXlumMFgCEMTloItN3GoAQY+ZKuAc8YHNbF7AivCjAsjG/EVyFzkarxj9P1KN0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756330500; c=relaxed/simple;
	bh=QcpX55h5PJAVRTi11X7cV7Fa6uhEGt7e9rcElHyaW0s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R51KS0MTTzb1sL/gHVGTXShTQEdMJoz0lyU2xfqBXYc/0yu76QK4r1URV5rn18apAV8dZi91vKIoUh2jtcM2dRIu1a/d8qRn5lgxpLUSICwa9B41YWgYSJgcCVt2QCMN4svXaZy+rqTNZSGVoZBNQWXGqqKkKtxhBB0CjG4YiyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=grIPs08/; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-32326e202e0so279198a91.2;
        Wed, 27 Aug 2025 14:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756330498; x=1756935298; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fbysr8Q057thi5IBavhGuNL0Ocl+NxTnsfRHbgFg4WQ=;
        b=grIPs08/wJqT9jSYJBCLpH9+KSLLYq4wQlU314OjSuoYi0DcGiRVdf4nY8+stiynRQ
         aNhVOJqCkKckTIdtOP/cyqOWMC9niqOPxDcMxeRvcTlnAB/rWnAJ+LNbp2RIV5Sow79K
         DVy5RBFsQq3dIlgp0gJ/27zjonQNLiwuhdWeiZ7mmEGlyT0o26FD8evl5ztf6QOW/g+/
         /N4CXuffHwtzyKOhltdeNx5L3YyKqMD68RP3SJD5oV4nCI4Bv5cKBwCXBvYSPvPIxjsh
         O9+JE2SQIYyx3SVbOBWz2rHDypnR2gngQEp8oxinMoVFbscFw+t5bHMMX9j9T2ry9ojR
         oCWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756330498; x=1756935298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fbysr8Q057thi5IBavhGuNL0Ocl+NxTnsfRHbgFg4WQ=;
        b=A2CndJ5Uxt47Cc96j1VIXJ1c4rWI+DhsBqhRl2+MUH2DGaCh5PeDN6qLpqgIJj0d4k
         afQOFb4vXLhftu4om0a3Z3IVdoSzDgnHDRnnZikwXk6qbRtFmG2+QJZcImnvULV4qgOL
         M0um2YdV3b53J62GQ7/LpEDXdNDund0QBmuc6Yvvwgs4fQmhR/kUxACaoEnH/bcnCKI5
         cUXpoBP/2SdTx8v72GHshWxb9J8exMTZweEdfcVmMCphtaDTWKKonWahzwuZ8Fc7XJsX
         bFBvoacnE4Jhyl4EiA0ba1QykToCk/ZaDo/gN12nVXyF0+6POfQL3mdJknDNrw2/9ywK
         3BQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwJlCCvkYCU9i+TF3DP56TAKbPXJbe+A1CL938G/43pJNweVUG5rpfwXhPDaEBGwvItOAX51Or8FPDucMm@vger.kernel.org, AJvYcCXxcYQ/uI+0LLeGy/Y7hyo66RqtkY6wg9HOR8mWx8rc64UeVI/996zdm/SRrR6fcCSOTSh2zvz3QrFI@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4fKsEcMe8jtvTpGu0XX8ci/G2nptRKthcef+86Ge52vxXaZMI
	fmwnutkKPIGB6H+4C8KX9BlilypD4T5oJrtibuPI7hIefNx6OfUWUb4Q
X-Gm-Gg: ASbGncv/vBbzPkpsnbvx9ALZkKzC3RJOye9/L3ddPQZ45eIn5Pzk7Ks5lQboYATyc68
	9yCMv4fP/sMYFjlWL0mmEosuercZlsX34SRIenuqkmaAu8Oun79IShp3wsBUU6GxbGjMLUp8lCc
	sWtUprXbdSxjox21wzy4OSkSbQ9aGDeesd0VdiBhIsBKsvTzTvoxUkZJWeYtzuFDjnp6z54nNFc
	2lylZ/BQqphLL+YbvX3exJdyy1LcK/pi5NN/porGmeAlVWZhpjAM5LEIfymVhoexIbG4CqPAPGK
	B6RN5ADZ4YWacBfSWdB0nJthEJsmoYp6xKhI77iAfUnpt+mKj5RicZLID/sbemktzsf/LddHjME
	ibm9pC4ZEaoLzXjwMRoDXTQ==
X-Google-Smtp-Source: AGHT+IEsWsQLGBdzNhvrzHc2tMe6DgpgQJ8Y6e0dfxs83gss3jTytVDp8ps/hYEAyjsoBVYIzIpDAQ==
X-Received: by 2002:a17:90b:3d0d:b0:311:df4b:4b93 with SMTP id 98e67ed59e1d1-32515ec3216mr28512033a91.7.1756330498469;
        Wed, 27 Aug 2025 14:34:58 -0700 (PDT)
Received: from archlinux ([179.110.125.177])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-327ab0dbe86sm193016a91.21.2025.08.27.14.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 14:34:58 -0700 (PDT)
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
Subject: [PATCH v8 1/1] arm64: dts: qcom: add initial support for Samsung Galaxy S22
Date: Wed, 27 Aug 2025 21:34:08 +0000
Message-ID: <20250827213414.43033-2-ghatto404@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250827213414.43033-1-ghatto404@gmail.com>
References: <20250827213414.43033-1-ghatto404@gmail.com>
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


