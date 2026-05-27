Return-Path: <linux-arm-msm+bounces-110022-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NOqGkdPF2rcAggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110022-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 22:08:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B025E9EFA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 22:08:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B63063026E6A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 20:08:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA5F23B6345;
	Wed, 27 May 2026 20:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rwGgBdLX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A743B7746
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 20:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779912498; cv=none; b=hqIjZX3S+fwrUjRpcSvd4u8Bqj/Jhr1xgTu0HLRzYwrEPeu/KyOfhHoVNRZbXrQOLIbI35VJol+/E6ijVcy0WSFgF1a9H20xJ6qVo5PJ73XEWX5sO5jW81wf5/doiu0QEVNEqSscrTovfayaymlO1hxOn93AFIfFmmaBO3TtkcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779912498; c=relaxed/simple;
	bh=lXRYxV8BCeM1Ig1y7stIz4NtSN2B115lw5iyl627e18=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j2BJODdWdrfzwgyCmY6cDE47z57D8KGYhaDJ3zlR1jhjLGE0B/O1qbYrYdvZ2HN9TamsNlhz4UIvZTTBU6Wj1HUYOVlRdq1yovWn/r6aNkEM60h84Tqz9zZYC9Cn6ZGshKI7emdZ5aQJ0O9UyKhlURjlXYnuiIwfTLgUxPvijYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rwGgBdLX; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-7dbe0943b21so8514887b3.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 13:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779912495; x=1780517295; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KBNDk3pJptpsPFzFd9QbD4p87S9pxZvqzSFC06CbzCE=;
        b=rwGgBdLXHFp7zebT/erRii3FsvQLhRaRFqwvIqUReMM5BZvwo8B87qfwLa8JCOjvkJ
         ERqY93oSpRRZ9sByy6IJwIFSFKmulV4N88yGqWAO3IgemNr3W0S5Mg+pRDEdKYogdpVh
         zrEzG9svV2BV7FwB7/lmFh956Ddni0Aq4UzwUlu2N76Jaok1kXw0Wrn79KUhau5B6VVy
         9VJRkn9Vf8sT/HMVKQ9Ag4vlwvqKe3e8GaHfCSwdCWE3EDtfyGfc9kX6sGb5t5Q3xj8c
         /06jcCeLJWceR58nCp2FaQ45y/XU2OvZSx6hjBIthxBBx4JktZ2IHmYwe3W7RcOUBQvd
         v99Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779912495; x=1780517295;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KBNDk3pJptpsPFzFd9QbD4p87S9pxZvqzSFC06CbzCE=;
        b=S6UptOL1FcYS65hnQoRwsjvZWYxmWB4o5iU45S11aPulz9vmoTwsyqCq/eXwnjAQc/
         Z3cnZ/cuPedn9brdw3p5+XIPLqHi/DIwwSRVEksYOQbOniNB4MEueu5jdewkAgH1/5XO
         wKf4r9SWRJzaZuG95QQOfcoGHDTxVOv6vfviQBXvF8i2IafTI5cKQPGr3Rij9sOTkBNR
         6H42jFBxhN9uWB5EC8ZQwcvDjIPbrPXGnrMPgjOD9rtRvf7SE2YYtPZI8rKgRq1WU1QW
         ml+sy6fxHtWJlMJNgIDk73uPnPEa5SvTNjaM6vvyTUwMzIisWtIwNL1fRBTKC3/4NYBI
         DOmg==
X-Gm-Message-State: AOJu0Yzb13b9XtoJyVH5IwcszsiuGbEsf6MdH+4FZ9oSCSVoGATw7SDT
	wCiFBYvZiBAD9kx6yY1v9LUeHkOo1ZXL99cZlpElcx2h4PZ5kVFSH9Fp
X-Gm-Gg: Acq92OFXiJVeR7ylWdiPZyXDQZUsMdItr47fiPXRgJJIBNPIMzqOTTU1Bi/2EGUIb+l
	z/f5FK0SQ7DOkD20PcUFW5ckmOcxhi8w3e7kRzdXNNAlfyvr1B3+nS6QzB1oi/Ofat7yZHai6eC
	Q/2HyInEUTBXyv+iB0W5fbUybL/snUxqUNhjjEtwEvWTqNm3Fa+uViXMG3K+33jey17x06ZHuEp
	1vk192rDV/gX79VdTeNbEqEljn5OPinay3kKzRwhcbHVLg/xx9g6qehsMi6GUbQv9J9wnmu6GKs
	/EtBKdpd60AlhIvaJYvIEPCZKuzeLgJFdQDlr8eHSwr+EUaF2s46HLtQxc4AWfgWTfHrunTASWv
	l9Ojgp3AI5jZRbfqyxQCmxjyquLx6cQx7s5azPqKfz0MtPlspxN4IN27JJUy1NWhXBYHl9wLksM
	tfixxDg6vXo0gT4zotUWaeQOmaAiXSFh6poxS3vM9Iso+mU1c=
X-Received: by 2002:a05:690c:dc7:b0:7bf:eadc:c13d with SMTP id 00721157ae682-7d20e5dd83cmr235702787b3.31.1779912495505;
        Wed, 27 May 2026 13:08:15 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7d38be36898sm79065497b3.27.2026.05.27.13.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 13:08:15 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Wed, 27 May 2026 23:08:02 +0300
Subject: [PATCH 2/2] ARM: dts: qcom: msm8926-sony-xperia-yukon-eagle: add
 initial device tree
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260527-yukon-eagle-v1-2-98119d64a71b@gmail.com>
References: <20260527-yukon-eagle-v1-0-98119d64a71b@gmail.com>
In-Reply-To: <20260527-yukon-eagle-v1-0-98119d64a71b@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110022-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 40B025E9EFA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add device tree for Sony Xperia M2 (sony-eagle) smartphone
based on the Qualcomm MSM8926 SoC.

Initial features:
- Framebuffer
- Regulators
- Internal storage
- SD card
- Accelerometer
- Magnetometer
- Ambient Light/Proximity sensor
- NFC
- USB/Charger

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 arch/arm/boot/dts/qcom/Makefile                    |   1 +
 .../dts/qcom/msm8926-sony-xperia-yukon-eagle.dts   | 406 +++++++++++++++++++++
 2 files changed, 407 insertions(+)

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
index 000000000000..a203f97aa86c
--- /dev/null
+++ b/arch/arm/boot/dts/qcom/msm8926-sony-xperia-yukon-eagle.dts
@@ -0,0 +1,406 @@
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
+			regulator-always-on;
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
+			regulator-always-on;
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
+			regulator-always-on;
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


