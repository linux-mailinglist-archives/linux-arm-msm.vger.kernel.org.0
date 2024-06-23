Return-Path: <linux-arm-msm+bounces-23747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1184191394F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 11:42:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F2E41F21281
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 09:42:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE44179B9C;
	Sun, 23 Jun 2024 09:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b="XUbqly1N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from box.trvn.ru (box.trvn.ru [194.87.146.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D288438C;
	Sun, 23 Jun 2024 09:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.87.146.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719135753; cv=none; b=e2CourG6f4A9Ni/gPooc8qd9YRwx+Cf1FDtAak3B1T8Sm69FE4yBYef1rChHzuxgWygvBjZDk7w7XlXN2kEjhQsLQ31AIiwe8yFPIfWBdhLcfufXxgTRXBd7YxCkMbkTKxmqwF9HwjnfBfxDGsEfhzLV33WG0k5VYb23CDQre4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719135753; c=relaxed/simple;
	bh=zmniZvRHoh5jL1vf5EYtGQpxPG2Az2hORSfAnvblczI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Edxq8xRu35GMyb0Rdx0KIDQDNWjslicUh1AzYbY5RhWogAZx1Hvrv40kVZjbHjyg/tSZbkOVjniVIHDKmOyQTmWvu3TJaDxJf+ZyRDmCfE5AG4Ma4SSQjIOE5fbxI1KJho5CvzXvo+XHmsa6yQsX74rCHej6EikU2l3fmGRbND4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru; spf=pass smtp.mailfrom=trvn.ru; dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b=XUbqly1N; arc=none smtp.client-ip=194.87.146.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trvn.ru
Received: from authenticated-user (box.trvn.ru [194.87.146.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by box.trvn.ru (Postfix) with ESMTPSA id 5661442238;
	Sun, 23 Jun 2024 14:27:10 +0500 (+05)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trvn.ru; s=mail;
	t=1719134830; bh=zmniZvRHoh5jL1vf5EYtGQpxPG2Az2hORSfAnvblczI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XUbqly1NREiOYgUvzIxAciOjSTqFq+/CoMieTM9Rmf73Z1/MZLhX25e9ne7Ca2vVY
	 8PSCx97uKyXnRg3rAZI5AtlhRKAGh4mp+BSMeA8uKFNS5AzL+nXG/qrrdjOmUfonkl
	 Yz8mOje8DR7ezcrh2Dc036qkXwaeMr+Ib/H6RKNtE81NCKLpQFtTlXbC7IHara1ijf
	 uAW3j9Ucfw7MQ94EAbSkZtyb75M1d0VbqPnooi12WM0nSkjROJPMId+iG//9RU6RML
	 1OstRxoZCU+o6Kl5ZcKGTLa57sWzhIBRLPiZrFxRnFtQkSzkjdJ5oB+g5J3AWPWSNI
	 OSDfLyESVBjpw==
From: Nikita Travkin <nikita@trvn.ru>
Date: Sun, 23 Jun 2024 14:26:32 +0500
Subject: [PATCH 3/3] arm64: dts: qcom: msm8916-lg-c50: add initial dts for
 LG Leon LTE
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240623-msm8916-lg-initial-v1-3-6fbcf714d69b@trvn.ru>
References: <20240623-msm8916-lg-initial-v1-0-6fbcf714d69b@trvn.ru>
In-Reply-To: <20240623-msm8916-lg-initial-v1-0-6fbcf714d69b@trvn.ru>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, Nikita Travkin <nikita@trvn.ru>, 
 Anton Bambura <jenneron@postmarketos.org>
X-Developer-Signature: v=1; a=openpgp-sha256; l=3842; i=nikita@trvn.ru;
 h=from:subject:message-id; bh=bC4SZtN+AFLyi1JYMGkC2HvTobEFyqaaDyPlFLIZKfE=;
 b=owEBbQKS/ZANAwAIAUMc7O4oGb91AcsmYgBmd+ppFeSvpz1i9ux/cTpIbt6hiS4fahhBIh/88
 mvE4hfNJ3mJAjMEAAEIAB0WIQTAhK9UUj+qg34uxUdDHOzuKBm/dQUCZnfqaQAKCRBDHOzuKBm/
 dRMuEACfHQlU50aDd43dm3nTkZJKSdD/W5qyjZalh8XT2Dg7jSaB5Q9uv2JgO4kWZDG1iq4rL/Y
 JD6WKaLrvvQWV+WNGDA6Yd8UNYM6e7/9XfCYc0ORAKHKjdlKRPkyk3zkBo8FyOXHIxjnG4kuVvx
 WHBJpbaTZwIXiPDgiYHihyWN58tuIPSaaOnLT6MK5829rcQR3E+FINMy0d7jrozxFZJD4etOwie
 fOQVvouRyZ3TrUf80XNC40sPpCu6yOPEtDseJmZ9wQY0duG5+GeT1V4ukAJnNY7XaWQ8g/AtBBa
 kA7p0FR7L1KCHOSRQHJncBOgy+yI7p/kkl3BnhfD1K+6uCQ9U1tgg3hKesXVWT3SYEah0n/8crl
 iY783Ctq7zsOqau4FNwbOyrgMiCb8WbMhhx6mRtp+RhlMc0q/LisSO+l+JUw+dAgN+Rw9/HqzJ0
 PcfJ2ClCpZeLmx52uY361IhNk6jTT90NSQSEFkxE/t6oqmSBjwHMu8rjV71/YY+Fgg7rKDg5hdd
 kHT0BK7vY6dq7QHWDOuWFHLc+1EZ46/LmTmTbElXLhw78/u9lwTNsO035VWxrfl4nzxhUleuiNc
 bkpA9apYfEKYaVHBUAJpTNDjmKGIrVDRRGnyFsOIaKC19GlQ87JL6oVbYHe2ltWB32S9SHqIN6y
 Xg60yUPk/Pu539w==
X-Developer-Key: i=nikita@trvn.ru; a=openpgp;
 fpr=C084AF54523FAA837E2EC547431CECEE2819BF75

From: Anton Bambura <jenneron@postmarketos.org>

Add initial device-tree for LG Leon LTE (lg-c50), currently supported
features:
- eMMC;
- MicroSD;
- usb in peripheral mode;
- WiFi/BT;
- vibration;
- keys.

Signed-off-by: Anton Bambura <jenneron@postmarketos.org>
Signed-off-by: Nikita Travkin <nikita@trvn.ru>
---
 arch/arm64/boot/dts/qcom/Makefile           |   1 +
 arch/arm64/boot/dts/qcom/msm8916-lg-c50.dts | 140 ++++++++++++++++++++++++++++
 2 files changed, 141 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index b35e46d75a1d..919dfcb26d15 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -31,6 +31,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-alcatel-idol347.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-asus-z00l.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-gplus-fl8005a.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-huawei-g7.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-lg-c50.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-lg-m216.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-longcheer-l8150.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-longcheer-l8910.dtb
diff --git a/arch/arm64/boot/dts/qcom/msm8916-lg-c50.dts b/arch/arm64/boot/dts/qcom/msm8916-lg-c50.dts
new file mode 100644
index 000000000000..a823a1c40208
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8916-lg-c50.dts
@@ -0,0 +1,140 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/dts-v1/;
+
+#include "msm8916-pm8916.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	model = "LG Leon LTE";
+	compatible = "lg,c50", "qcom,msm8916";
+	chassis-type = "handset";
+
+	aliases {
+		mmc0 = &sdhc_1; /* eMMC */
+		mmc1 = &sdhc_2; /* SD card */
+		serial0 = &blsp_uart2;
+	};
+
+	chosen {
+		stdout-path = "serial0";
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&gpio_keys_default>;
+		pinctrl-names = "default";
+
+		label = "GPIO Buttons";
+
+		volume-up-button {
+			label = "Volume Up";
+			gpios = <&tlmm 108 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+		};
+
+		volume-down-button {
+			label = "Volume Down";
+			gpios = <&tlmm 107 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEDOWN>;
+		};
+	};
+
+	reg_sd_vmmc: regulator-sdcard-vmmc {
+		compatible = "regulator-fixed";
+		regulator-name = "sdcard-vmmc";
+		regulator-min-microvolt = <2950000>;
+		regulator-max-microvolt = <2950000>;
+
+		gpio = <&tlmm 60 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		startup-delay-us = <5000>;
+
+		pinctrl-0 = <&sd_vmmc_en_default>;
+		pinctrl-names = "default";
+	};
+};
+
+&blsp_uart2 {
+	status = "okay";
+};
+
+&pm8916_usbin {
+	status = "okay";
+};
+
+&pm8916_vib {
+	status = "okay";
+};
+
+&sdhc_1 {
+	status = "okay";
+};
+
+&sdhc_2 {
+	vmmc-supply = <&reg_sd_vmmc>;
+
+	pinctrl-0 = <&sdc2_default &sdc2_cd_default>;
+	pinctrl-1 = <&sdc2_sleep &sdc2_cd_default>;
+	pinctrl-names = "default", "sleep";
+
+	cd-gpios = <&tlmm 38 GPIO_ACTIVE_HIGH>;
+
+	status = "okay";
+};
+
+&usb {
+	dr_mode = "peripheral";
+	extcon = <&pm8916_usbin>;
+	status = "okay";
+};
+
+&usb_hs_phy {
+	extcon = <&pm8916_usbin>;
+};
+
+&venus {
+	status = "okay";
+};
+
+&venus_mem {
+	status = "okay";
+};
+
+&wcnss {
+	status = "okay";
+};
+
+&wcnss_iris {
+	compatible = "qcom,wcn3620";
+};
+
+&wcnss_mem {
+	status = "okay";
+};
+
+&tlmm {
+	gpio_keys_default: gpio-keys-default-state {
+		pins = "gpio107", "gpio108";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	sd_vmmc_en_default: sd-vmmc-en-default-state {
+		pins = "gpio60";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	sdc2_cd_default: sdc2-cd-default-state {
+		pins = "gpio38";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+};

-- 
2.45.2


