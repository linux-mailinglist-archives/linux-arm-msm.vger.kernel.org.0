Return-Path: <linux-arm-msm+bounces-89876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CNn8MKvdb2n8RwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 20:55:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FF84ADA2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 20:55:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id ADFF176DD48
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 18:02:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7937F44CAE6;
	Tue, 20 Jan 2026 18:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U/8Kphoa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA0D363C50
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 18:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768932083; cv=none; b=XNC9QgZn/swxnXcaKPu+GIfbQ0eCoL57ccLdehgYQgtxcGx5HK/r/SRyEQQBQoCAD20WIfD/PB568G9W8dzIEmg7kTljDV4YId2weccHroe4zuw+5vrgXm0Xe6vUSTXpmRXbSEIm54+RwiYmyZY+Rq4mMHULyTuC75cGnFnO0ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768932083; c=relaxed/simple;
	bh=kzcoFVGN8pND34AM6BpAivg5/H7QIwyrSsZN9PDu6vU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BL8I1RXoRuF9qvotNrECqQJBvSZlcwbEze0owHTK8VI70fiUlHNAQ0WV41hAKyX5bXMQCG4kWt6wD0/mb/xx+mNls1BSUWFai+KuCl9fZirkY7Z3VDOH5GJFJlJGohToEbRyRaGm3TDi5cJJ71iKdxZ3ZdzjbMrTxJfqA5WwVPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U/8Kphoa; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4801d7c72a5so30927745e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 10:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768932079; x=1769536879; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oX5dy+QTue7Dgbmu5PAND/J/yiiRJs/48sYG9nHrQn8=;
        b=U/8KphoajCg9RzZclR6+KJ0HsZ/uDwAWnHu9YYkOQVztyquoVu5Ss88Kg59jBsTVY5
         o05+8YkEbUnCX35Mo61WS/C17fDM8JrEd78eN/UMVeGwBC5rdOF5i10TruPiwnHTgtKg
         aId0XY4rEzh0RH4kKyDNxqoEdmL+r5VBsrJLZGUlvVyIR/qklplLvp9v7c3x/vZG5AzB
         tuEgErBxz61QPjmrmVXcMGJjxy0uHiEABQdVr6yYCx9W9iD2S8lK0QCsQhua2ZHTAvq7
         oTidieK9s03+OIs0GuftwmJfSUq935sPpgqvKhpN8ERcZyz2RRz/aoZA+n0GbREzN+FF
         9y2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768932079; x=1769536879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oX5dy+QTue7Dgbmu5PAND/J/yiiRJs/48sYG9nHrQn8=;
        b=S1wclzTPZfO/kJT7/YFsSv25VhYkudMcBIafmV0/hFiqJoq8/CWbThpH5AZ37MP+HR
         VNVGX6DUAnUNAYhdkCJYgr1XYgH61i+x6jHquvRg86Z88kJSDxUDcqw9K7xA5jgPC1CG
         m7Iqy4EDvxCnK+zasB2j9yh1A0oh96YNM2mb1Ida8/CxNeU33Kygxw+G946QM9n7WRkW
         TTAj56aJCTcrSZ6DAx2Sf2qx5kfsa7HkS33PSx8bOZwj3uWQEHaxiyXrAyHVHkZHPBrW
         udGlchF/dBZRl3FfnkLqvoA3F/AwN6/mt7XKFwCW3VHHCpvAk0PuO1IV6ExDYJclaOMO
         DqnQ==
X-Gm-Message-State: AOJu0Ywdt28owJmKfMwnNxKvy86EfbsMtLQh/fOIhDvYFXM1Xo1+YE9E
	4Uwzl9XxZxPA3xZGeA1mSrynKsyioKqH7j4o+16EslXhZhYQjHwq10MjIlGdUIgt
X-Gm-Gg: AY/fxX47jik0mPmpB7Wo+5l3XTvr2gggz5H7VVCg0QbBkXv9ElvwjLn1aQxVcNeysv4
	7dmeYqp8CtzYNJmMch1WyVxZyDwpK2UmlThfBGYE0NFPUxit/ol24jvx21owZlyIXyJGs/9pJMJ
	/x5SHZcOtad8Chsg5CMDJ9NG1ficwoE4aCnX7N3J+jWBZEA9aokDzqeVX1KyNnu6hPDcsPosikN
	s9KJVM95eLctMuMsAJMoV0CNHhPJrg9oSUmZw6qAPA+qVB20cvrQKhTicaNfkfTeTaF3/CNNvrF
	dDZolYKqnqLaB9oqcWHJc8yDEFJl7m2UtVJpqVp1+KHN3vHmWivzlfEnsUbeJTnqrqzJllMo26Z
	1ONdSyv5Mz1X92/eObhamWtwwrOCThtZtoMgvZin07ubtIWmkm2PjTSWi5uyJuuPSOh62Dk85RA
	nlFm8oFdeKSkbwYsF7dSAKaL00AAzFsRY=
X-Received: by 2002:a05:600c:8109:b0:480:1c69:9d36 with SMTP id 5b1f17b1804b1-4801eb04f54mr192590675e9.17.1768932078844;
        Tue, 20 Jan 2026 10:01:18 -0800 (PST)
Received: from unknown.zextras.com ([78.208.157.140])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47f429071a2sm312013015e9.11.2026.01.20.10.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 10:01:18 -0800 (PST)
From: Gianluca Boiano <morf3089@gmail.com>
To: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: andersson@kernel.org,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robh@kernel.org,
	david@ixit.cz,
	Gianluca Boiano <morf3089@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
	Molly Sophia <mollysophia379@gmail.com>
Subject: [PATCH 7/7] arm64: dts: qcom: add device tree for Xiaomi Mi 8 Lite (platina)
Date: Tue, 20 Jan 2026 19:00:52 +0100
Message-ID: <20260120180052.1031231-8-morf3089@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260120180052.1031231-1-morf3089@gmail.com>
References: <20260120180052.1031231-1-morf3089@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [1.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-89876-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,ixit.cz,gmail.com,somainline.org];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[morf3089@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,0.0.0.1:email,somainline.org:email,ffc00000:email]
X-Rspamd-Queue-Id: 61FF84ADA2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add initial device tree support for the Xiaomi Mi 8 Lite
(codename: platina), a smartphone based on Qualcomm SDM660 SoC with
4/6GB RAM and a 6.26" 1080x2280 display.

This enables:
- Booting to a framebuffer console
- USB support
- Hall effect sensor
- Touchscreen (Novatek NT36672A)
- Battery monitoring
- Charging (pm660_charger)

Co-developed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Co-developed-by: Molly Sophia <mollysophia379@gmail.com>
Signed-off-by: Molly Sophia <mollysophia379@gmail.com>
Signed-off-by: Gianluca Boiano <morf3089@gmail.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/sdm660-xiaomi-platina.dts   | 364 ++++++++++++++++++
 2 files changed, 365 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sdm660-xiaomi-platina.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 8f7b66bee6be..d76e955b4144 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -247,6 +247,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm636-xiaomi-tulip.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm636-xiaomi-whyred.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm660-xiaomi-jasmine.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm660-xiaomi-lavender.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sdm660-xiaomi-platina.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm670-google-sargo.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-db845c.dtb
 
diff --git a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-platina.dts b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-platina.dts
new file mode 100644
index 000000000000..c8ebe2405ee0
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-platina.dts
@@ -0,0 +1,364 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2021, AngeloGioacchino Del Regno
+ *                     <angelogioacchino.delregno@somainline.org>
+ * Copyright (c) 2022, Molly Sophia <mollysophia379@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "sdm660.dtsi"
+#include "sdm660-xiaomi-common.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	model = "Xiaomi Mi 8 Lite";
+	compatible = "xiaomi,platina", "qcom,sdm660";
+	chassis-type = "handset";
+
+	battery: battery {
+		compatible = "simple-battery";
+		charge-full-design-microamp-hours = <3350000>;
+		voltage-min-design-microvolt = <3400000>;
+		voltage-max-design-microvolt = <4400000>;
+	};
+
+	reserved-memory {
+		ramoops@ffc00000 {
+			compatible = "ramoops";
+			reg = <0x0 0xffc00000 0x0 0x100000>;
+			record-size = <0x10000>;
+			console-size = <0x60000>;
+			ftrace-size = <0x10000>;
+			pmsg-size = <0x20000>;
+			ecc-size = <16>;
+		};
+	};
+};
+
+&blsp_i2c4 {
+	status = "okay";
+
+	touchscreen@1 {
+		compatible = "novatek,nt36672a-ts";
+		reg = <0x1>;
+		iovcc-supply = <&vreg_l11a_1p8>;
+		interrupts-extended = <&tlmm 67 IRQ_TYPE_EDGE_RISING>;
+		pinctrl-0 = <&ts_active>;
+		pinctrl-names = "default";
+		reset-gpios = <&tlmm 66 GPIO_ACTIVE_LOW>;
+		touchscreen-size-x = <1080>;
+		touchscreen-size-y = <2280>;
+	};
+};
+
+&framebuffer0 {
+	width = <1080>;
+	height = <2280>;
+	stride = <(1080 * 4)>;
+
+	status = "okay";
+};
+
+&gpio_hall_sensor {
+	status = "okay";
+};
+
+&pm660_charger {
+	monitored-battery = <&battery>;
+
+	status = "okay";
+};
+
+&pm660l_wled {
+	status = "okay";
+};
+
+&rpm_requests {
+	regulators-0 {
+		compatible = "qcom,rpm-pm660l-regulators";
+
+		vdd_s1-supply = <&vph_pwr>;
+		vdd_s2-supply = <&vph_pwr>;
+		vdd_s3_s4-supply = <&vph_pwr>;
+		vdd_s5-supply = <&vph_pwr>;
+		vdd_s6-supply = <&vph_pwr>;
+
+		vdd_l1_l9_l10-supply = <&vreg_s2b_1p05>;
+		vdd_l2-supply = <&vreg_bob>;
+		vdd_l3_l5_l7_l8-supply = <&vreg_bob>;
+		vdd_l4_l6-supply = <&vreg_bob>;
+		vdd_bob-supply = <&vph_pwr>;
+
+		vreg_s1b_1p125: s1 {
+			regulator-min-microvolt = <1125000>;
+			regulator-max-microvolt = <1125000>;
+			regulator-enable-ramp-delay = <200>;
+		};
+
+		vreg_s2b_1p05: s2 {
+			regulator-min-microvolt = <1050000>;
+			regulator-max-microvolt = <1050000>;
+			regulator-enable-ramp-delay = <200>;
+		};
+
+		/* LDOs */
+		vreg_l1b_0p925: l1 {
+			regulator-min-microvolt = <920000>;
+			regulator-max-microvolt = <928000>;
+			regulator-enable-ramp-delay = <250>;
+			regulator-allow-set-load;
+		};
+
+		vreg_l2b_2p95: l2 {
+			/*
+			 * This regulator supports 1.648 - 3.104V on this board
+			 * but we set a max voltage of anything less than 2.7V
+			 * to satisfy a condition in sdhci.c that will disable
+			 * 3.3V SDHCI signaling, which happens to be not really
+			 * supported on this platform.
+			 */
+			regulator-min-microvolt = <1648000>;
+			regulator-max-microvolt = <2696000>;
+			regulator-enable-ramp-delay = <250>;
+			regulator-allow-set-load;
+		};
+
+		vreg_l3b_3p3: l3 {
+			regulator-min-microvolt = <3296000>;
+			regulator-max-microvolt = <3312000>;
+			regulator-enable-ramp-delay = <250>;
+			regulator-min-microamp = <200>;
+			regulator-max-microamp = <600000>;
+			regulator-system-load = <100000>;
+			regulator-allow-set-load;
+		};
+
+		vreg_l4b_2p95: l4 {
+			regulator-min-microvolt = <2944000>;
+			regulator-max-microvolt = <2952000>;
+			regulator-enable-ramp-delay = <250>;
+
+			regulator-min-microamp = <200>;
+			regulator-max-microamp = <600000>;
+			regulator-system-load = <570000>;
+			regulator-allow-set-load;
+		};
+
+		/*
+		 * Downstream specifies a range of 1721-3600mV,
+		 * but the only assigned consumers are SDHCI2 VMMC
+		 * and Coresight QPDI that both request pinned 2.95V.
+		 * Tighten the range to 1.8-3.328 (closest to 3.3) to
+		 * make the mmc driver happy.
+		 */
+		vreg_l5b_2p95: l5 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <3328000>;
+			regulator-enable-ramp-delay = <250>;
+			regulator-allow-set-load;
+			regulator-system-load = <800000>;
+		};
+
+		vreg_l7b_3p125: l7 {
+			regulator-min-microvolt = <2704000>;
+			regulator-max-microvolt = <3128000>;
+			regulator-enable-ramp-delay = <250>;
+		};
+
+		vreg_l8b_3p3: l8 {
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <3400000>;
+			regulator-enable-ramp-delay = <250>;
+		};
+
+		vreg_bob: bob {
+			regulator-min-microvolt = <3304000>;
+			regulator-max-microvolt = <3624000>;
+			regulator-enable-ramp-delay = <500>;
+		};
+	};
+
+	regulators-1 {
+		compatible = "qcom,rpm-pm660-regulators";
+
+		vdd_s1-supply = <&vph_pwr>;
+		vdd_s2-supply = <&vph_pwr>;
+		vdd_s3-supply = <&vph_pwr>;
+		vdd_s4-supply = <&vph_pwr>;
+		vdd_s5-supply = <&vph_pwr>;
+		vdd_s6-supply = <&vph_pwr>;
+
+		vdd_l1_l6_l7-supply = <&vreg_s5a_1p35>;
+		vdd_l2_l3-supply = <&vreg_s2b_1p05>;
+		vdd_l5-supply = <&vreg_s2b_1p05>;
+		vdd_l8_l9_l10_l11_l12_l13_l14-supply = <&vreg_s4a_2p04>;
+		vdd_l15_l16_l17_l18_l19-supply = <&vreg_bob>;
+
+		/*
+		 * S1A (FTAPC0), S2A (FTAPC1), S3A (HFAPC1) are managed
+		 * by the Core Power Reduction hardened (CPRh) and the
+		 * Operating State Manager (OSM) HW automatically.
+		 */
+
+		vreg_s4a_2p04: s4 {
+			regulator-min-microvolt = <2040000>;
+			regulator-max-microvolt = <2040000>;
+			regulator-enable-ramp-delay = <200>;
+			regulator-always-on;
+		};
+
+		vreg_s5a_1p35: s5 {
+			regulator-min-microvolt = <1224000>;
+			regulator-max-microvolt = <1350000>;
+			regulator-enable-ramp-delay = <200>;
+		};
+
+		vreg_s6a_0p87: s6 {
+			regulator-min-microvolt = <504000>;
+			regulator-max-microvolt = <992000>;
+			regulator-enable-ramp-delay = <150>;
+		};
+
+		/* LDOs */
+		vreg_l1a_1p225: l1 {
+			regulator-min-microvolt = <1226000>;
+			regulator-max-microvolt = <1250000>;
+			regulator-enable-ramp-delay = <250>;
+			regulator-allow-set-load;
+		};
+
+		vreg_l2a_1p0: l2 {
+			regulator-min-microvolt = <944000>;
+			regulator-max-microvolt = <1008000>;
+			regulator-enable-ramp-delay = <250>;
+		};
+
+		vreg_l3a_1p0: l3 {
+			regulator-min-microvolt = <944000>;
+			regulator-max-microvolt = <1008000>;
+			regulator-enable-ramp-delay = <250>;
+		};
+
+		vreg_l5a_0p848: l5 {
+			regulator-min-microvolt = <800000>;
+			regulator-max-microvolt = <952000>;
+			regulator-enable-ramp-delay = <250>;
+		};
+
+		vreg_l6a_1p3: l6 {
+			regulator-min-microvolt = <1304000>;
+			regulator-max-microvolt = <1368000>;
+			regulator-allow-set-load;
+			regulator-enable-ramp-delay = <250>;
+		};
+
+		vreg_l7a_1p2: l7 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-enable-ramp-delay = <250>;
+		};
+
+		vreg_l8a_1p8: l8 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-enable-ramp-delay = <250>;
+			regulator-system-load = <325000>;
+			regulator-allow-set-load;
+		};
+
+		vreg_l9a_1p8: l9 {
+			regulator-min-microvolt = <1804000>;
+			regulator-max-microvolt = <1896000>;
+			regulator-enable-ramp-delay = <250>;
+			regulator-allow-set-load;
+		};
+
+		vreg_l10a_1p8: l10 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1944000>;
+			regulator-enable-ramp-delay = <250>;
+			regulator-allow-set-load;
+			regulator-system-load = <14000>;
+		};
+
+		vreg_l11a_1p8: l11 {
+			regulator-min-microvolt = <1784000>;
+			regulator-max-microvolt = <1944000>;
+			regulator-enable-ramp-delay = <250>;
+		};
+
+		vreg_l12a_1p8: l12 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1944000>;
+			regulator-enable-ramp-delay = <250>;
+		};
+
+		/* This gives power to the LPDDR4: never turn it off! */
+		vreg_l13a_1p8: l13 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1944000>;
+			regulator-enable-ramp-delay = <250>;
+			regulator-boot-on;
+			regulator-always-on;
+		};
+
+		vreg_l14a_1p8: l14 {
+			regulator-min-microvolt = <1710000>;
+			regulator-max-microvolt = <1952000>;
+			regulator-enable-ramp-delay = <250>;
+		};
+
+		vreg_l15a_1p8: l15 {
+			regulator-min-microvolt = <1648000>;
+			regulator-max-microvolt = <2952000>;
+			regulator-enable-ramp-delay = <250>;
+		};
+
+		vreg_l16a_2p7: l16 {
+			regulator-min-microvolt = <2704000>;
+			regulator-max-microvolt = <2712000>;
+			regulator-enable-ramp-delay = <250>;
+		};
+
+		vreg_l17a_1p8: l17 {
+			regulator-min-microvolt = <1648000>;
+			regulator-max-microvolt = <2952000>;
+			regulator-enable-ramp-delay = <250>;
+		};
+
+		vreg_l19a_3p3: l19 {
+			regulator-min-microvolt = <3312000>;
+			regulator-max-microvolt = <3328000>;
+			regulator-enable-ramp-delay = <250>;
+			regulator-allow-set-load;
+		};
+	};
+};
+
+/*
+ * Override sdhc_1 from common: platina uses mmc-ddr-1_8v instead of mmc-hs200-1_8v
+ */
+&sdhc_1 {
+	/delete-property/ mmc-hs200-1_8v;
+	mmc-ddr-1_8v;
+};
+
+&tlmm {
+	gpio-reserved-ranges = <8 4>; /* Fingerprint SPI */
+
+	/* Override common pinctrl for platina-specific settings */
+	gpio_hall_sensor_default: gpio-hall-sensor-default-state {
+		pins = "gpio75";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	ts_active: ts-active-state {
+		pins = "gpio66", "gpio67";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-up;
+	};
+};
-- 
2.52.0


