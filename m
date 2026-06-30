Return-Path: <linux-arm-msm+bounces-115258-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fFEnLexEQ2o9WQoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115258-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 06:24:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B61076E040D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 06:24:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=T+fELgP4;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115258-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115258-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DF10F3000588
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 04:24:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 869863AB289;
	Tue, 30 Jun 2026 04:24:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA563559F8
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 04:24:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782793447; cv=none; b=e8NDn+hxglCV0HvanCXxUdE8Ei/CTWUFIFLgJe13dTJsnPWRp0thdE/pI4U406XMbboioHw/8tfPgIS0Ai+8VR41BvuZ3Nfuh9nKeNp0+F7LBYS3kUWIrS86YO8hvOCFp2jjnCxOg7xDUB5tzl35No9C/XelYJ9V7heejQJF9zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782793447; c=relaxed/simple;
	bh=/BNVPSG0WbRSTzd0kbO/nPpIHc9BdttO+Yfj9Ivih+U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dsiGUEDhm97q3xzVcBdLJ7wpl6FwN6DIchAyBfjiYl5edAGBD/aohWxX7Hrzq+WASV9ejYT/yb9isjxLP3lDQORQCX8Dm/9YVEeWGUZGVILZz2Ue5km9CsKJuWsCkLeEWNsDQ+9tf4HFQci6i6dK1uxr9tkXOZBQNY3Lm6GbLXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T+fELgP4; arc=none smtp.client-ip=209.85.215.178
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c8b49639fbaso2631522a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 21:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782793445; x=1783398245; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V6z9kgHrkzq/dULKlezqI9ISa94DVtxAwTB+jOqC+x8=;
        b=T+fELgP4hqjkf6UGc/Icwhgh6JTj22UybLirDZdRXcsFfYEQWxwrhFu7aDzahsqCsg
         P7Vo4Yh6uGnBPMJu91ECqAahp27oW9w/H2guPVLK0DcGcSmRJCax+MBSXZ0+k43lGai3
         pi0VWbH7+lJaIzDoHL/cPbs5ZkyxIXrYiQiu7UHto7D/YePahzgOSA96qMUgtVFaoSod
         G45khUiba2dLtRb1bMYbc93ZSdaOea1IRO92XqKKNhLm8TN8oW74TFSAvrCINbW66Xa4
         DJFHvnyYkfDD9ftddW5f92XzDblJ5cjBkjO9mgD3/7W48pF7G1lwmxiHjom/ihZ5z44O
         sd5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782793445; x=1783398245;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V6z9kgHrkzq/dULKlezqI9ISa94DVtxAwTB+jOqC+x8=;
        b=EHvai7d5eC+aNx3ipI1GUSfOvL/Fc1BHwFBOgyMBYRFqaPVYtSxxSC4+Opwqd/UQJw
         s1BMMy4/BbKZ0VUgNhpzTMuf3BFTtU4S+Af0lgNhfilzjrVR1/WTXI7cwQQ4SQ3Qw96c
         GGg9ucUj7m0CW9zxxBUJvyDEr1dZUHCXDkFnQJua/UbQN2i4QJM+A5fASjRNUPSVODEV
         4/8eA0EXY/ZMG+ZoGLRTKvDhNm6ra0ZyZpjkHJ7GYRpgkg0Ly8XNGF2uWsd++ZIBC9P7
         S19pBy2vxLchSv2VGk4dnAOFUYXU/YQai/5NpvRGY3NvT9ihGtgsF3g8O8b89hCeSAIa
         Y54Q==
X-Gm-Message-State: AOJu0YyRLPE2XkInwh9Lkp4YYYbSiToXI6tW6o3fG2QztZK8D0wugcC7
	Tq2q7oS6qcw2fkolPkb2Shz+8o5wo3bgVQfNpjDEB/rKYUlyzZnRb0SJ
X-Gm-Gg: AfdE7cmyUpD56+TOUkF2CRI4SWw2mMrDBMuWgmSs6S8m5j9OyMd3pokZcx0J4nVOT4v
	WOU8rH6uei896S3/wN9OE60z6R8ZjxsnI5tmFGRJTmrUxJl6g78owRbnOPdmN+RwHIiS+bweuc1
	ZneNbsiNfkaX3cKBjGu20cUtEfvwJ/X0wHvVMuVK6JNC3ludDfwc5w30Oad8vS2YgFIq1EfmeWc
	zul4PqzbyPvvme1m5Uh8XTXONKOb0qT2pckbJ8OzYbG9Z9iez6xmxINGiJ4itLPfNiZZdk/gZG4
	2Z45b33Ze5VyyI5PPGK+i+tGN1hdA7fq7iihliw5nf3GSFnE2Zu5dZ3/3gzz+SifdUsvtOPy441
	h8THC5Myvk7Z2DSjQD5/0YCq+pQIyx2OlbylrHgiZcgzU0NLuAyyMAdJjUEsGOZ1bPa7SuIFcgR
	3WRacPkGf+vq4=
X-Received: by 2002:a05:6a21:1b84:b0:3bf:a7d5:df38 with SMTP id adf61e73a8af0-3bfc505cd59mr1808934637.9.1782793445449;
        Mon, 29 Jun 2026 21:24:05 -0700 (PDT)
Received: from nuvole ([2408:844c:b00:2b2f:398a:8bef:b88c:653a])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9bbc6da7a1sm765928a12.2.2026.06.29.21.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 21:24:04 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH] arm64: dts: qcom: sc8280xp-huawei-gaokun3: Add dsi panel DT node
Date: Tue, 30 Jun 2026 12:22:29 +0800
Message-ID: <20260630042229.277799-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-115258-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mitltlatltl@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B61076E040D

DSI panel driver have been added for a while, so add the DT node to
enable it. vdd{a,s}-supply for dsi, dsi_phy are blank since the DSDT
describes the wrong, no impact after manual disabling these wrong
supplies.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 .../boot/dts/qcom/sc8280xp-huawei-gaokun3.dts | 165 ++++++++++++++++++
 1 file changed, 165 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts b/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
index f3c00be67081..658bb253394a 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
@@ -11,6 +11,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <dt-bindings/iio/qcom,spmi-adc7-pm8350.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/gpio-keys.h>
@@ -98,6 +99,52 @@ switch-mode {
 		};
 	};
 
+	vreg_avdd_5p5: regulator-avdd-5p5 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vreg_avdd_5p5";
+		regulator-min-microvolt = <5500000>;
+		regulator-max-microvolt = <5500000>;
+
+		gpio = <&tlmm 53 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&avdd_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
+	vreg_avee_5p5: regulator-avee-5p5 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vreg_avee_5p5";
+		regulator-min-microvolt = <5500000>;
+		regulator-max-microvolt = <5500000>;
+
+		gpio = <&tlmm 52 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&avee_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
+	vreg_vddi_1p8: regulator-vddi-1p8 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vreg_vddi_1p8";
+
+		gpio = <&tlmm 0 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&vddi_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
 	vreg_misc_3p3: regulator-misc-3p3 {
 		compatible = "regulator-fixed";
 
@@ -616,6 +663,9 @@ touchscreen@4f {
 		hid-descr-addr = <0x1>;
 		interrupts-extended = <&tlmm 175 IRQ_TYPE_LEVEL_LOW>;
 
+		/* TODO: set post-reset-deassert-delay-ms */
+		panel = <&panel>;
+
 		vdd-supply = <&vreg_misc_3p3>;
 		vddl-supply = <&vreg_s10b>;
 
@@ -738,6 +788,86 @@ &mdss0_dp1_out {
 	remote-endpoint = <&usb_1_qmpphy_dp_in>;
 };
 
+&mdss0_dsi0 {
+	/* real vdda is unknown */
+
+	qcom,dual-dsi-mode;
+	qcom,master-dsi;
+	qcom,sync-dual-dsi;
+
+	status = "okay";
+
+	panel: panel@0 {
+		compatible = "csot,ppc357db1-4", "himax,hx83121a";
+		reg = <0>;
+
+		pinctrl-0 = <&disp_reset_n>, <&mdp_vsync_default>;
+		pinctrl-names = "default";
+
+		reset-gpios = <&tlmm 38 GPIO_ACTIVE_LOW>;
+
+		vddi-supply = <&vreg_vddi_1p8>;
+		avdd-supply = <&vreg_avdd_5p5>;
+		avee-supply = <&vreg_avee_5p5>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				panel_in_0: endpoint {
+					remote-endpoint = <&mdss0_dsi0_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				panel_in_1: endpoint {
+					remote-endpoint = <&mdss0_dsi1_out>;
+				};
+			};
+		};
+	};
+};
+
+&mdss0_dsi0_out {
+	data-lanes = <0 1 2 3>;
+	remote-endpoint = <&panel_in_0>;
+};
+
+&mdss0_dsi0_phy {
+	/* real vdds is unknown */
+
+	status = "okay";
+};
+
+&mdss0_dsi1 {
+	/* real vdda is unknown */
+
+	qcom,dual-dsi-mode;
+	qcom,sync-dual-dsi;
+
+	status = "okay";
+
+	/* DSI1 is slave, so use DSI0 clocks */
+	assigned-clock-parents = <&mdss0_dsi0_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss0_dsi0_phy DSI_PIXEL_PLL_CLK>;
+};
+
+&mdss0_dsi1_out {
+	data-lanes = <0 1 2 3>;
+	remote-endpoint = <&panel_in_1>;
+};
+
+&mdss0_dsi1_phy {
+	/* real vdds is unknown */
+
+	status = "okay";
+};
+
 &pcie2a {
 	perst-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;
@@ -1303,6 +1433,20 @@ &tlmm {
 
 	gpio-reserved-ranges = <70 2>, <74 6>, <83 4>, <125 2>, <128 2>, <154 4>;
 
+	avdd_reg_en: avdd-reg-en-state {
+		pins = "gpio53";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	avee_reg_en: avee-reg-en-state {
+		pins = "gpio52";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	bt_default: bt-default-state {
 		hstp-bt-en-pins {
 			pins = "gpio133";
@@ -1318,6 +1462,20 @@ hstp-sw-ctrl-pins {
 		};
 	};
 
+	disp_reset_n: disp-reset-n-state {
+		pins = "gpio38";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	mdp_vsync_default: mdp-vsync-default-state {
+		pins = "gpio8";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	i2c4_default: i2c4-default-state {
 		pins = "gpio171", "gpio172";
 		function = "qup4";
@@ -1470,6 +1628,13 @@ usb1_sbu_default: usb1-sbu-state {
 		bias-disable;
 	};
 
+	vddi_reg_en: vddi-reg-en-state {
+		pins = "gpio0";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	wcd_default: wcd-default-state {
 		reset-pins {
 			pins = "gpio106";
-- 
2.54.0


