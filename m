Return-Path: <linux-arm-msm+bounces-111035-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id le/9Fo9XIGon1gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111035-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 18:34:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD58639C53
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 18:34:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=BGErSJaO;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111035-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111035-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A8BDD3177831
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 15:50:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1AE73E5A3E;
	Wed,  3 Jun 2026 15:49:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393E33E0C78
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 15:49:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780501754; cv=none; b=GXEbgRLB1QMEKXSuipRbKNVvly2DURxAmiV6sXpb3xJutWPr4J2pJ1fl5A9JqkVXvO8PElrx80f8hGEV21wpR3ChQm1EkDGfrIP2YQvOaTVid2e0deDooyBHyr0L6Ah1635cjc9HRSbm99Mro4jZwCVrSIm7DsBGVJfXM71j8lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780501754; c=relaxed/simple;
	bh=ySh33wutmbZ5iVOabdfg/J07oPwEj+oqxH12+J3TS5w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cbEQPyB1HFtgpjj1NfE0eySB7qKvueJg11mN6rGyU6QCDOEVnlfwf08qkklA9mbpMqFy7IocdsVHT9sCP4r3JXJfEa2ptxfiYFvP7rxj6n1QI664GT72fFwzw68NPkrDtrLANp8RMkQaEg6eeAVTHERcNi4YgdfkoxnfldiHOzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BGErSJaO; arc=none smtp.client-ip=209.85.221.52
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-45ef616daf6so5437299f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 08:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780501752; x=1781106552; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OjGdyVecCEjJ7bgAij4ZWnfiWhj3pQUXtFRn8jOj/9E=;
        b=BGErSJaO+unIphq7jh3biQBUOYKBmbf+woArDr7U+b3572pj3INt04Luh8L4J94jYh
         R8XgYycJynRLqwNaCtqmNEgkRpScU6jWYfXmC2y0fRCTeAznSE1Tn0aa0SqdfGLa1JIh
         4OVD5R7KSdrI35ZfnaHvbW5v88InYZd9cs02R/9iODjmovVIQamMANf4lZzOhqqf/e4N
         WINUc+Jlqku9uoiCfLBowuSBNRZs2ZfEjzOIvJHS+7diwy250g82gYgXJEk5/uCiJe5n
         FY1K6z4rZaZfYURwmQK8vIXKF2sP4iB6p32R99SIk+2Dq/5iALsAAlwJEe0uIIbcgTCY
         7djQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780501752; x=1781106552;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OjGdyVecCEjJ7bgAij4ZWnfiWhj3pQUXtFRn8jOj/9E=;
        b=fvmmyH3hGweYLbDSSdbboAMew0/+kCTKwiMj9l5eEDlpuOzKtXcZ//tTeQHN51xUot
         r4Myo0GYZnbnzzkWCXT44yGJ70S1G7QR7kjYVLqEY87swo1qOCh674oYFRf3tusSh8wY
         RkK3N6a/WUewGs/rJt5ZXKmVb7cieqe6wZiZxW99xg9b0hM9w7a8pWknuIZYGAyI3yDO
         Dx3Je1iNtBq/7ZcS+hjijPCjHAO58Q/ZVzRvc578GyyKmny+f0rI5Oc5ifmPHydx0cef
         Ks85dgfx0hNL75WYQeRXlGcM0kFxSSNj4qWPHA5Bl125gojzFhZlzCjGpAKQMtzcF64L
         EK3w==
X-Gm-Message-State: AOJu0Yz6F+ukoW85HBQ6Vonf8xJuICyQgW5eya87hpDdMGd9MojEVSe9
	HOoyVRQt2YobXD6AIJqdbwpR3n+GfGF5uugxKEYpQJ9JNnX5+NF4TOmU
X-Gm-Gg: Acq92OHwqUgbk9RPbDyiNDSsMFKPlrOHhSWrzFphFJJjKWYv/V4O20K56ygVLObNF10
	Ay+WHrUxEsJZQ7Gbnj6Q+30ObGFBuJu28wItrDhP1wb4hNj2PtIMXqYMYh3qsGl41Y3aT7lRIte
	Mu869Quq7knxJECFja1foe7znAdJK8gv1H8VXL0yKjDmfLcqrFCLfXaYnVXovTPzCTiGyZXaJdR
	msdzinfDAHB4aMaVVuL8MJTjX7CAMNFx/ylJnXeBrTdmfPAXpOC3KZWx4qVw+MeorOgszoMDoaF
	XDqZi0z+aoGs+UiyvG+aHreW+oNjeKIpuQ+OeDzml1eWKqWwtO/H8nnWNXUjYH9VgKWg21fwfiS
	K/1akh3neB8OwNoTz0NQvEG5DDR+zqzegxhET5dsSdFjlG/qFcOkOI2qxoC0D1BL8+Ufh2WVAJw
	jP5IbR/yV+yOYhuFV4IeJdzOOwZUYdlHA/ahVbaA==
X-Received: by 2002:adf:efd2:0:b0:45e:f381:cd8a with SMTP id ffacd0b85a97d-46021781a7dmr4113017f8f.2.1780501751615;
        Wed, 03 Jun 2026 08:49:11 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:160:43ff:9a39:ef13:72e0:8f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dc412sm8886008f8f.4.2026.06.03.08.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 08:49:11 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Wed, 03 Jun 2026 18:48:22 +0300
Subject: [PATCH v2 2/2] ARM: dts: qcom: msm8926-sony-xperia-yukon-eagle:
 add initial device tree
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-yukon-eagle-v2-2-f86b440583f5@gmail.com>
References: <20260603-yukon-eagle-v2-0-f86b440583f5@gmail.com>
In-Reply-To: <20260603-yukon-eagle-v2-0-f86b440583f5@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com];
	TAGGED_FROM(0.00)[bounces-111035-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:~postmarketos/upstreaming@lists.sr.ht,m:phone-devel@vger.kernel.org,m:xerikasxx@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[xerikasxx@gmail.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ADD58639C53

Add device tree for Sony Xperia M2 (sony-eagle) smartphone
based on the Qualcomm MSM8926 SoC.

Initial features:
- Framebuffer
- GPIO buttons (Volume Down and Camera)
- Regulators
- Internal storage
- SD card
- Accelerometer
- Magnetometer
- Ambient Light/Proximity sensor
- NFC
- pm8226_resin (Volume Up)
- USB/Charger

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 arch/arm/boot/dts/qcom/Makefile                    |   1 +
 .../dts/qcom/msm8926-sony-xperia-yukon-eagle.dts   | 403 +++++++++++++++++++++
 2 files changed, 404 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/Makefile b/arch/arm/boot/dts/qcom/Makefile
index 32a44b02d2fa..6b471a346d82 100644
--- a/arch/arm/boot/dts/qcom/Makefile
+++ b/arch/arm/boot/dts/qcom/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_QCOM) += \
 	msm8226-motorola-falcon.dtb \
+	msm8926-sony-xperia-yukon-eagle.dtb \
 	qcom-apq8016-sbc.dtb \
 	qcom-apq8026-asus-sparrow.dtb \
 	qcom-apq8026-huawei-sturgeon.dtb \
diff --git a/arch/arm/boot/dts/qcom/msm8926-sony-xperia-yukon-eagle.dts b/arch/arm/boot/dts/qcom/msm8926-sony-xperia-yukon-eagle.dts
new file mode 100644
index 000000000000..8ca834796e2c
--- /dev/null
+++ b/arch/arm/boot/dts/qcom/msm8926-sony-xperia-yukon-eagle.dts
@@ -0,0 +1,403 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2026 Erikas Bitovtas <xerikasxx@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "msm8926.dtsi"
+#include "pm8226.dtsi"
+
+/delete-node/ &adsp_region;
+/delete-node/ &mba_region;
+/delete-node/ &mpss_region;
+/delete-node/ &smem_region;
+
+/ {
+	model = "Sony Xperia M2";
+	compatible = "sony,eagle", "qcom,msm8926", "qcom,msm8226";
+	chassis = "handset";
+
+	aliases {
+		mmc0 = &sdhc_1;
+		mmc1 = &sdhc_2;
+		display0 = &framebuffer0;
+	};
+
+	chosen {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		stdout-path = "display0";
+
+		framebuffer0: framebuffer@3201000 {
+			compatible = "simple-framebuffer";
+			reg = <0x03201000 0x800000>;
+			width = <540>;
+			height = <960>;
+			stride = <(540 * 3)>;
+			format = "r8g8b8";
+
+			clocks = <&mmcc MDSS_AHB_CLK>,
+				 <&mmcc MDSS_AXI_CLK>,
+				 <&mmcc MDSS_BYTE0_CLK>,
+				 <&mmcc MDSS_MDP_CLK>,
+				 <&mmcc MDSS_PCLK0_CLK>,
+				 <&mmcc MDSS_VSYNC_CLK>;
+			power-domains = <&mmcc MDSS_GDSC>;
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		button-camera-focus {
+			label = "Camera Focus";
+			gpios = <&tlmm 108 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_CAMERA_FOCUS>;
+			debounce-interval = <15>;
+		};
+
+		button-camera-snapshot {
+			label = "Camera Snapshot";
+			gpios = <&tlmm 107 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_CAMERA>;
+			debounce-interval = <15>;
+		};
+
+		button-volume-down {
+			label = "Volume Down";
+			gpios = <&tlmm 106 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEDOWN>;
+			debounce-interval = <15>;
+		};
+	};
+
+	reserved-memory {
+		framebuffer@3201000 {
+			reg = <0x03201000 0x800000>;
+			no-map;
+		};
+
+		mpss_region: mpss@8000000 {
+			reg = <0x08000000 0x4d00000>;
+			no-map;
+		};
+
+		reserved@cd00000 {
+			reg = <0x0cd00000 0x200000>;
+			no-map;
+		};
+
+		mba_region: mba@d100000 {
+			reg = <0x0d100000 0x3a000>;
+			no-map;
+		};
+
+		reserved@d13a000 {
+			reg = <0x0d13a000 0xc6000>;
+			no-map;
+		};
+
+		wcnss_region: wcnss@d200000 {
+			reg = <0x0d200000 0x5ae000>;
+			no-map;
+		};
+
+		reserved@d850000 {
+			reg = <0x0d850000 0x3b0000>;
+			no-map;
+		};
+
+		adsp_region: adsp@dc00000 {
+			reg = <0x0dc00000 0x1400000>;
+			no-map;
+		};
+
+		reserved@f000000 {
+			reg = <0x0f000000 0x500000>;
+			no-map;
+		};
+
+		venus_region: venus@f500000 {
+			reg = <0x0f500000 0x500000>;
+			no-map;
+		};
+
+		smem_region: smem@fa00000 {
+			reg = <0x0fa00000 0x100000>;
+			no-map;
+		};
+
+		reserved@fb00000 {
+			reg = <0x0fb00000 0x280000>;
+			no-map;
+		};
+
+		rmtfs@fd80000 {
+			compatible = "qcom,rmtfs-mem";
+			reg = <0x0fd80000 0x180000>;
+			no-map;
+
+			qcom,client-id = <1>;
+		};
+	};
+};
+
+&blsp1_i2c2 {
+	status = "okay";
+
+	accelerometer@f {
+		compatible = "kionix,kxtj21009";
+		reg = <0x0f>;
+
+		interrupts-extended = <&tlmm 49 IRQ_TYPE_EDGE_RISING>;
+
+		vdd-supply = <&pm8226_l19>;
+		vddio-supply = <&pm8226_lvs1>;
+
+		mount-matrix = "0", "1", "0",
+			      "-1", "0", "0",
+			      "0", "0", "1";
+	};
+
+	magnetometer@2e {
+		compatible = "yamaha,yas532";
+		reg = <0x2e>;
+
+		vdd-supply = <&pm8226_l19>;
+		iovdd-supply = <&pm8226_lvs1>;
+	};
+
+	light-sensor@48 {
+		compatible = "sensortek,stk3310";
+		reg = <0x48>;
+
+		interrupts-extended = <&tlmm 65 IRQ_TYPE_EDGE_FALLING>;
+
+		proximity-near-level = <1700>;
+	};
+};
+
+&blsp1_i2c3 {
+	status = "okay";
+
+	nfc@28 {
+		compatible = "nxp,pn547", "nxp,nxp-nci-i2c";
+		reg = <0x28>;
+
+		interrupts-extended = <&tlmm 21 IRQ_TYPE_EDGE_RISING>;
+
+		enable-gpios = <&tlmm 20 GPIO_ACTIVE_HIGH>;
+		firmware-gpios = <&tlmm 22 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&pm8226_resin {
+	linux,code = <KEY_VOLUMEUP>;
+
+	status = "okay";
+};
+
+&pm8226_vib {
+	status = "okay";
+};
+
+&rpm_requests {
+	regulators {
+		compatible = "qcom,rpm-pm8226-regulators";
+
+		pm8226_s3: s3 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1300000>;
+		};
+
+		pm8226_s4: s4 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2200000>;
+		};
+
+		pm8226_s5: s5 {
+			regulator-min-microvolt = <1150000>;
+			regulator-max-microvolt = <1150000>;
+		};
+
+		pm8226_l1: l1 {
+			regulator-min-microvolt = <1225000>;
+			regulator-max-microvolt = <1225000>;
+		};
+
+		pm8226_l2: l2 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+		};
+
+		pm8226_l3: l3 {
+			regulator-min-microvolt = <750000>;
+			regulator-max-microvolt = <1287500>;
+		};
+
+		pm8226_l4: l4 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+		};
+
+		pm8226_l5: l5 {
+			regulator-min-microvolt = <1050000>;
+			regulator-max-microvolt = <1200000>;
+		};
+
+		pm8226_l6: l6 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm8226_l7: l7 {
+			regulator-min-microvolt = <1850000>;
+			regulator-max-microvolt = <1850000>;
+		};
+
+		pm8226_l8: l8 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm8226_l9: l9 {
+			regulator-min-microvolt = <2050000>;
+			regulator-max-microvolt = <2050000>;
+		};
+
+		pm8226_l10: l10 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm8226_l12: l12 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm8226_l14: l14 {
+			regulator-min-microvolt = <2750000>;
+			regulator-max-microvolt = <2750000>;
+		};
+
+		pm8226_l15: l15 {
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+		};
+
+		pm8226_l16: l16 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3350000>;
+		};
+
+		pm8226_l17: l17 {
+			regulator-min-microvolt = <2950000>;
+			regulator-max-microvolt = <2950000>;
+		};
+
+		pm8226_l18: l18 {
+			regulator-min-microvolt = <2950000>;
+			regulator-max-microvolt = <2950000>;
+
+			regulator-system-load = <200000>;
+			regulator-allow-set-load;
+		};
+
+		pm8226_l19: l19 {
+			regulator-min-microvolt = <2850000>;
+			regulator-max-microvolt = <2850000>;
+		};
+
+		pm8226_l20: l20 {
+			regulator-min-microvolt = <3075000>;
+			regulator-max-microvolt = <3075000>;
+		};
+
+		pm8226_l21: l21 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2950000>;
+			regulator-allow-set-load;
+		};
+
+		pm8226_l22: l22 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2950000>;
+		};
+
+		pm8226_l23: l23 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2950000>;
+		};
+
+		pm8226_l24: l24 {
+			regulator-min-microvolt = <1300000>;
+			regulator-max-microvolt = <1350000>;
+		};
+
+		pm8226_l25: l25 {
+			regulator-min-microvolt = <1775000>;
+			regulator-max-microvolt = <2125000>;
+		};
+
+		pm8226_l26: l26 {
+			regulator-min-microvolt = <1225000>;
+			regulator-max-microvolt = <1225000>;
+		};
+
+		pm8226_l27: l27 {
+			regulator-min-microvolt = <2100000>;
+			regulator-max-microvolt = <2100000>;
+		};
+
+		pm8226_l28: l28 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2950000>;
+		};
+
+		pm8226_lvs1: lvs1 {};
+	};
+};
+
+&smbb {
+	qcom,fast-charge-current-limit = <1500000>;
+	qcom,fast-charge-safe-voltage = <4250000>;
+	qcom,minimum-input-voltage = <4200000>;
+
+	status = "okay";
+};
+
+&sdhc_1 {
+	vmmc-supply = <&pm8226_l17>;
+	vqmmc-supply = <&pm8226_l6>;
+
+	bus-width = <8>;
+	non-removable;
+
+	status = "okay";
+};
+
+&sdhc_2 {
+	vmmc-supply = <&pm8226_l18>;
+	vqmmc-supply = <&pm8226_l21>;
+
+	bus-width = <4>;
+	cd-gpios = <&tlmm 38 GPIO_ACTIVE_LOW>;
+
+	status = "okay";
+};
+
+&usb {
+	extcon = <&smbb>;
+	dr_mode = "peripheral";
+
+	status = "okay";
+};
+
+&usb_hs_phy {
+	extcon = <&smbb>;
+	v1p8-supply = <&pm8226_l10>;
+	v3p3-supply = <&pm8226_l20>;
+};

-- 
2.54.0


