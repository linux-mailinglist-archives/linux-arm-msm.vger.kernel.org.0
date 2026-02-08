Return-Path: <linux-arm-msm+bounces-92166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eNM6JGb/iGkY0QQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Feb 2026 22:25:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBCA10A367
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Feb 2026 22:25:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3A7A4300B449
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Feb 2026 21:25:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E856334C989;
	Sun,  8 Feb 2026 21:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JpdVKc3O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2EED34A799;
	Sun,  8 Feb 2026 21:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770585947; cv=none; b=WPDBg5kIIiTV3jwEhiVqA21sSiRCVYikOapIGrIPmPTE+OkKffzgllz7h00Ry8CmyuNe0wc3WCx1OG2KDAiYHEtHN4Re1NAykahPLzCCRkU1BxBTfNHW6r7Bu+bXJTvEcQwV2uGxkeT9qzh0qx8UQKHQDPu2vAM11+jHongQQ3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770585947; c=relaxed/simple;
	bh=H1BQ4H3yJh8Bb4ZJctWhcNzvFm6ImOvMAXKQSyqu16U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bIMsuAdPmJ0Al5x4yI2+nPAbK8tkXfRsuSsbEO6UdodRDkF55ysdK8YHZ5YoZnza1YAGvlpoDDRPFbZXK3VV5vA+GS9j7F6F4XuUB1+/PGvX7tNJn+mRFS1H4xHYTXdrFMqXHwM2I8UlhKoN5xjD40USZOOlyeZUKDSHVlhctQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JpdVKc3O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9CD4FC2BC86;
	Sun,  8 Feb 2026 21:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770585947;
	bh=H1BQ4H3yJh8Bb4ZJctWhcNzvFm6ImOvMAXKQSyqu16U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=JpdVKc3OuY5gw5KD+D1lJybjetOMJGkP9MBEoqMZBDUbmntjeqA/tu31EWaxX46wL
	 Do4LBtvlE8iZta6tsTJ2KFH71N7pxA2/Rk9K/fsg67w8e98kKZOPR3ynBi5mssBN6b
	 bXz6PEEUVapV09LY4BrOOLZyEerHVxYhpYmQe8Lht5DZm2JzvEjibxu5EFs1TK84+9
	 yVj62H1aDUAraxyiHGh/qHWoKvZoHVvtIRrlTx0LlYkUpy+WnYNs9YuO+cd7uCiBW9
	 A0zGRgIQUjDa9EG2ncD/+kSVhvgs0ibzMB7ne+bgFxifxeNbNfeBi5f/YjGS+xdrht
	 gM013JYmFFoWg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9580FEF06F2;
	Sun,  8 Feb 2026 21:25:47 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Sun, 08 Feb 2026 22:25:41 +0100
Subject: [PATCH 4/4] arm64: dts: qcom: x1-vivobook-s15: add Hamoa- and
 Purwa-compatible device trees
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260208-b4-vivobook-v1-4-3a9b5e153909@oldschoolsolutions.biz>
References: <20260208-b4-vivobook-v1-0-3a9b5e153909@oldschoolsolutions.biz>
In-Reply-To: <20260208-b4-vivobook-v1-0-3a9b5e153909@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Maud Spierings <maud_spierings@hotmail.com>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770585945; l=34417;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=9C7feBACK+YYsXk95ykY3IK2KG5gyVUhRTb3ATBSW8A=;
 b=FQoKaM0EELjz7MWdyxABeb/NDwQ7abk/lHddnOOm0Hvg2gzTMu18xu+l2UpHFAfYfxOnRrvZ9
 jFFrYuuBF9jCMLBTqmyHzNohOvguFzdHYAaVApycrVi3XfHakr1kYBI
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,hotmail.com,oldschoolsolutions.biz];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-92166-lists,linux-arm-msm=lfdr.de,jens.glathe.oldschoolsolutions.biz];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[jens.glathe@oldschoolsolutions.biz];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.2:email,0.0.0.43:email,0.0.0.1:email,0.0.0.15:email];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[3a:email,0.0.0.8:email,0.0.0.47:email,0.0.0.0:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DEBCA10A367
X-Rspamd-Action: no action

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

The ASUS Vivobook S15 (S5507) [1] is available with Hamoa and Purwa SoC.

Add the Purwa-based device tree, and change the Hamoa-based device tree to include
x1-asus-vivobook-s15.dtsi.

[1]: https://www.asus.com/de/laptops/for-home/vivobook/asus-vivobook-s-15-s5507/techspec/

Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
 arch/arm64/boot/dts/qcom/Makefile                  |    2 +
 .../boot/dts/qcom/x1e80100-asus-vivobook-s15.dts   | 1425 +-------------------
 .../boot/dts/qcom/x1p42100-asus-vivobook-s15.dts   |   47 +
 3 files changed, 89 insertions(+), 1385 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index f80b5d9cf1e80e4efcd70f14cef4e7d4a1ec48eb..baa7ec904b4878a41e6fd9c678025f28cb484cf3 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -380,6 +380,8 @@ x1e80100-microsoft-romulus15-el2-dtbs	:= x1e80100-microsoft-romulus15.dtb x1-el2
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-microsoft-romulus15.dtb x1e80100-microsoft-romulus15-el2.dtb
 x1e80100-qcp-el2-dtbs	:= x1e80100-qcp.dtb x1-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-qcp.dtb x1e80100-qcp-el2.dtb
+x1p42100-asus-vivobook-s15-el2-dtbs	:= x1p42100-asus-vivobook-s15.dtb x1-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= x1p42100-asus-vivobook-s15.dtb x1p42100-asus-vivobook-s15-el2.dtb
 x1p42100-asus-zenbook-a14-el2-dtbs	:= x1p42100-asus-zenbook-a14.dtb x1-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= x1p42100-asus-zenbook-a14.dtb x1p42100-asus-zenbook-a14-el2.dtb
 x1p42100-asus-zenbook-a14-lcd-el2-dtbs	:= x1p42100-asus-zenbook-a14-lcd.dtb x1-el2.dtbo
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
dissimilarity index 96%
index 17269eb0638acb81cef7112285372b5d306ed8c3..ed6ca0be367cfec22b9fe21a1a3a93be65ed195a 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
@@ -1,1385 +1,40 @@
-// SPDX-License-Identifier: BSD-3-Clause
-/*
- * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
- * Copyright (c) 2024, Xilin Wu <wuxilin123@gmail.com>
- */
-
-/dts-v1/;
-
-#include <dt-bindings/gpio/gpio.h>
-#include <dt-bindings/input/gpio-keys.h>
-#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
-#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
-
-#include "hamoa.dtsi"
-#include "hamoa-pmics.dtsi"
-
-/ {
-	model = "ASUS Vivobook S 15";
-	compatible = "asus,vivobook-s15", "qcom,x1e80100";
-	chassis-type = "laptop";
-
-	aliases {
-		serial1 = &uart14;
-	};
-
-	gpio-keys {
-		compatible = "gpio-keys";
-		pinctrl-0 = <&hall_int_n_default>;
-		pinctrl-names = "default";
-
-		switch-lid {
-			gpios = <&tlmm 92 GPIO_ACTIVE_LOW>;
-			linux,input-type = <EV_SW>;
-			linux,code = <SW_LID>;
-			wakeup-source;
-			wakeup-event-action = <EV_ACT_DEASSERTED>;
-		};
-	};
-
-	hdmi-bridge {
-		compatible = "parade,ps185hdm";
-
-		pinctrl-0 = <&hdmi_hpd_default>;
-		pinctrl-names = "default";
-
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			port@0 {
-				reg = <0>;
-
-				hdmi_bridge_dp_in: endpoint {
-					remote-endpoint = <&usb_1_ss2_qmpphy_out_dp>;
-				};
-			};
-
-			port@1 {
-				reg = <1>;
-
-				hdmi_bridge_tmds_out: endpoint {
-					remote-endpoint = <&hdmi_con>;
-				};
-			};
-		};
-	};
-
-	hdmi-connector {
-		compatible = "hdmi-connector";
-		type = "a";
-
-		port {
-			hdmi_con: endpoint {
-				remote-endpoint = <&hdmi_bridge_tmds_out>;
-			};
-		};
-	};
-
-	pmic-glink {
-		compatible = "qcom,x1e80100-pmic-glink",
-			     "qcom,sm8550-pmic-glink",
-			     "qcom,pmic-glink";
-		orientation-gpios = <&tlmm 121 GPIO_ACTIVE_HIGH>,
-				    <&tlmm 123 GPIO_ACTIVE_HIGH>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		/* Left-side port, closer to the screen */
-		connector@0 {
-			compatible = "usb-c-connector";
-			reg = <0>;
-			power-role = "dual";
-			data-role = "dual";
-
-			ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				port@0 {
-					reg = <0>;
-
-					pmic_glink_ss0_hs_in: endpoint {
-						remote-endpoint = <&usb_1_ss0_dwc3_hs>;
-					};
-				};
-
-				port@1 {
-					reg = <1>;
-
-					pmic_glink_ss0_ss_in: endpoint {
-						remote-endpoint = <&retimer_ss0_ss_out>;
-					};
-				};
-
-				port@2 {
-					reg = <2>;
-
-					pmic_glink_ss0_con_sbu_in: endpoint {
-						remote-endpoint = <&retimer_ss0_con_sbu_out>;
-					};
-				};
-			};
-		};
-
-		/* Left-side port, farther from the screen */
-		connector@1 {
-			compatible = "usb-c-connector";
-			reg = <1>;
-			power-role = "dual";
-			data-role = "dual";
-
-			ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				port@0 {
-					reg = <0>;
-
-					pmic_glink_ss1_hs_in: endpoint {
-						remote-endpoint = <&usb_1_ss1_dwc3_hs>;
-					};
-				};
-
-				port@1 {
-					reg = <1>;
-
-					pmic_glink_ss1_ss_in: endpoint {
-						remote-endpoint = <&retimer_ss1_ss_out>;
-					};
-				};
-
-				port@2 {
-					reg = <2>;
-
-					pmic_glink_ss1_con_sbu_in: endpoint {
-						remote-endpoint = <&retimer_ss1_con_sbu_out>;
-					};
-				};
-			};
-		};
-	};
-
-	reserved-memory {
-		linux,cma {
-			compatible = "shared-dma-pool";
-			size = <0x0 0x8000000>;
-			reusable;
-			linux,cma-default;
-		};
-	};
-
-	vreg_edp_3p3: regulator-edp-3p3 {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VREG_EDP_3P3";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-
-		gpio = <&tlmm 70 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-
-		pinctrl-0 = <&edp_reg_en>;
-		pinctrl-names = "default";
-
-		regulator-always-on;
-		regulator-boot-on;
-	};
-
-	vreg_nvme: regulator-nvme {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VREG_NVME_3P3";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-
-		gpio = <&tlmm 18 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-
-		pinctrl-0 = <&nvme_reg_en>;
-		pinctrl-names = "default";
-
-		regulator-boot-on;
-	};
-
-	vreg_rtmr0_1p15: regulator-rtmr0-1p15 {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VREG_RTMR0_1P15";
-		regulator-min-microvolt = <1150000>;
-		regulator-max-microvolt = <1150000>;
-
-		gpio = <&pmc8380_5_gpios 8 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-
-		pinctrl-0 = <&usb0_pwr_1p15_reg_en>;
-		pinctrl-names = "default";
-
-		regulator-boot-on;
-	};
-
-	vreg_rtmr0_1p8: regulator-rtmr0-1p8 {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VREG_RTMR0_1P8";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <1800000>;
-
-		gpio = <&pm8550ve_9_gpios 8 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-
-		pinctrl-0 = <&usb0_1p8_reg_en>;
-		pinctrl-names = "default";
-
-		regulator-boot-on;
-	};
-
-	vreg_rtmr0_3p3: regulator-rtmr0-3p3 {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VREG_RTMR0_3P3";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-
-		gpio = <&pm8550_gpios 11 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-
-		pinctrl-0 = <&usb0_3p3_reg_en>;
-		pinctrl-names = "default";
-
-		regulator-boot-on;
-	};
-
-	vreg_rtmr1_1p15: regulator-rtmr1-1p15 {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VREG_RTMR1_1P15";
-		regulator-min-microvolt = <1150000>;
-		regulator-max-microvolt = <1150000>;
-
-		gpio = <&tlmm 188 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-
-		pinctrl-0 = <&usb1_pwr_1p15_reg_en>;
-		pinctrl-names = "default";
-
-		regulator-boot-on;
-	};
-
-	vreg_rtmr1_1p8: regulator-rtmr1-1p8 {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VREG_RTMR1_1P8";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <1800000>;
-
-		gpio = <&tlmm 175 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-
-		pinctrl-0 = <&usb1_pwr_1p8_reg_en>;
-		pinctrl-names = "default";
-
-		regulator-boot-on;
-	};
-
-	vreg_rtmr1_3p3: regulator-rtmr1-3p3 {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VREG_RTMR1_3P3";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-
-		gpio = <&tlmm 186 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-
-		pinctrl-0 = <&usb1_pwr_3p3_reg_en>;
-		pinctrl-names = "default";
-
-		regulator-boot-on;
-	};
-
-	vph_pwr: regulator-vph-pwr {
-		compatible = "regulator-fixed";
-
-		regulator-name = "vph_pwr";
-		regulator-min-microvolt = <3700000>;
-		regulator-max-microvolt = <3700000>;
-
-		regulator-always-on;
-		regulator-boot-on;
-	};
-
-	/*
-	 * TODO: These two regulators are actually part of the removable M.2
-	 * card and not the CRD mainboard. Need to describe this differently.
-	 * Functionally it works correctly, because all we need to do is to
-	 * turn on the actual 3.3V supply above.
-	 */
-	vreg_wcn_0p95: regulator-wcn-0p95 {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VREG_WCN_0P95";
-		regulator-min-microvolt = <950000>;
-		regulator-max-microvolt = <950000>;
-
-		vin-supply = <&vreg_wcn_3p3>;
-	};
-
-	vreg_wcn_1p9: regulator-wcn-1p9 {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VREG_WCN_1P9";
-		regulator-min-microvolt = <1900000>;
-		regulator-max-microvolt = <1900000>;
-
-		vin-supply = <&vreg_wcn_3p3>;
-	};
-
-	vreg_wcn_3p3: regulator-wcn-3p3 {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VREG_WCN_3P3";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-
-		gpio = <&tlmm 214 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-
-		pinctrl-0 = <&wcn_sw_en>;
-		pinctrl-names = "default";
-
-		regulator-boot-on;
-	};
-
-	wcn7850-pmu {
-		compatible = "qcom,wcn7850-pmu";
-
-		vdd-supply = <&vreg_wcn_0p95>;
-		vddio-supply = <&vreg_l15b_1p8>;
-		vddaon-supply = <&vreg_wcn_0p95>;
-		vdddig-supply = <&vreg_wcn_0p95>;
-		vddrfa1p2-supply = <&vreg_wcn_1p9>;
-		vddrfa1p8-supply = <&vreg_wcn_1p9>;
-
-		wlan-enable-gpios = <&tlmm 117 GPIO_ACTIVE_HIGH>;
-		bt-enable-gpios = <&tlmm 116 GPIO_ACTIVE_HIGH>;
-
-		pinctrl-0 = <&wcn_wlan_en>, <&wcn_bt_en>;
-		pinctrl-names = "default";
-
-		regulators {
-			vreg_pmu_rfa_cmn: ldo0 {
-				regulator-name = "vreg_pmu_rfa_cmn";
-			};
-
-			vreg_pmu_aon_0p59: ldo1 {
-				regulator-name = "vreg_pmu_aon_0p59";
-			};
-
-			vreg_pmu_wlcx_0p8: ldo2 {
-				regulator-name = "vreg_pmu_wlcx_0p8";
-			};
-
-			vreg_pmu_wlmx_0p85: ldo3 {
-				regulator-name = "vreg_pmu_wlmx_0p85";
-			};
-
-			vreg_pmu_btcmx_0p85: ldo4 {
-				regulator-name = "vreg_pmu_btcmx_0p85";
-			};
-
-			vreg_pmu_rfa_0p8: ldo5 {
-				regulator-name = "vreg_pmu_rfa_0p8";
-			};
-
-			vreg_pmu_rfa_1p2: ldo6 {
-				regulator-name = "vreg_pmu_rfa_1p2";
-			};
-
-			vreg_pmu_rfa_1p8: ldo7 {
-				regulator-name = "vreg_pmu_rfa_1p8";
-			};
-
-			vreg_pmu_pcie_0p9: ldo8 {
-				regulator-name = "vreg_pmu_pcie_0p9";
-			};
-
-			vreg_pmu_pcie_1p8: ldo9 {
-				regulator-name = "vreg_pmu_pcie_1p8";
-			};
-		};
-	};
-};
-
-&apps_rsc {
-	regulators-0 {
-		compatible = "qcom,pm8550-rpmh-regulators";
-		qcom,pmic-id = "b";
-
-		vdd-bob1-supply = <&vph_pwr>;
-		vdd-bob2-supply = <&vph_pwr>;
-		vdd-l1-l4-l10-supply = <&vreg_s4c_1p8>;
-		vdd-l2-l13-l14-supply = <&vreg_bob1>;
-		vdd-l5-l16-supply = <&vreg_bob1>;
-		vdd-l6-l7-supply = <&vreg_bob2>;
-		vdd-l8-l9-supply = <&vreg_bob1>;
-		vdd-l12-supply = <&vreg_s5j_1p2>;
-		vdd-l15-supply = <&vreg_s4c_1p8>;
-		vdd-l17-supply = <&vreg_bob2>;
-
-		vreg_bob1: bob1 {
-			regulator-name = "vreg_bob1";
-			regulator-min-microvolt = <3008000>;
-			regulator-max-microvolt = <3960000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_bob2: bob2 {
-			regulator-name = "vreg_bob2";
-			regulator-min-microvolt = <2504000>;
-			regulator-max-microvolt = <3008000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l2b_3p0: ldo2 {
-			regulator-name = "vreg_l2b_3p0";
-			regulator-min-microvolt = <3072000>;
-			regulator-max-microvolt = <3100000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l4b_1p8: ldo4 {
-			regulator-name = "vreg_l4b_1p8";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l13b_3p0: ldo13 {
-			regulator-name = "vreg_l13b_3p0";
-			regulator-min-microvolt = <3072000>;
-			regulator-max-microvolt = <3072000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l14b_3p0: ldo14 {
-			regulator-name = "vreg_l14b_3p0";
-			regulator-min-microvolt = <3072000>;
-			regulator-max-microvolt = <3072000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l15b_1p8: ldo15 {
-			regulator-name = "vreg_l15b_1p8";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-	};
-
-	regulators-1 {
-		compatible = "qcom,pm8550ve-rpmh-regulators";
-		qcom,pmic-id = "c";
-
-		vdd-l1-supply = <&vreg_s5j_1p2>;
-		vdd-l2-supply = <&vreg_s1f_0p7>;
-		vdd-l3-supply = <&vreg_s1f_0p7>;
-		vdd-s4-supply = <&vph_pwr>;
-
-		vreg_l3c_0p8: ldo3 {
-			regulator-name = "vreg_l3c_0p8";
-			regulator-min-microvolt = <912000>;
-			regulator-max-microvolt = <912000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_s4c_1p8: smps4 {
-			regulator-name = "vreg_s4c_1p8";
-			regulator-min-microvolt = <1856000>;
-			regulator-max-microvolt = <2000000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-	};
-
-	regulators-2 {
-		compatible = "qcom,pmc8380-rpmh-regulators";
-		qcom,pmic-id = "d";
-
-		vdd-l1-supply = <&vreg_s1f_0p7>;
-		vdd-l2-supply = <&vreg_s1f_0p7>;
-		vdd-l3-supply = <&vreg_s4c_1p8>;
-		vdd-s1-supply = <&vph_pwr>;
-
-		vreg_l1d_0p8: ldo1 {
-			regulator-name = "vreg_l1d_0p8";
-			regulator-min-microvolt = <880000>;
-			regulator-max-microvolt = <920000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l2d_0p9: ldo2 {
-			regulator-name = "vreg_l2d_0p9";
-			regulator-min-microvolt = <912000>;
-			regulator-max-microvolt = <920000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l3d_1p8: ldo3 {
-			regulator-name = "vreg_l3d_1p8";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-	};
-
-	regulators-3 {
-		compatible = "qcom,pmc8380-rpmh-regulators";
-		qcom,pmic-id = "e";
-
-		vdd-l2-supply = <&vreg_s1f_0p7>;
-		vdd-l3-supply = <&vreg_s5j_1p2>;
-
-		vreg_l2e_0p8: ldo2 {
-			regulator-name = "vreg_l2e_0p8";
-			regulator-min-microvolt = <880000>;
-			regulator-max-microvolt = <920000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l3e_1p2: ldo3 {
-			regulator-name = "vreg_l3e_1p2";
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-	};
-
-	regulators-4 {
-		compatible = "qcom,pmc8380-rpmh-regulators";
-		qcom,pmic-id = "f";
-
-		vdd-l1-supply = <&vreg_s5j_1p2>;
-		vdd-l2-supply = <&vreg_s5j_1p2>;
-		vdd-l3-supply = <&vreg_s5j_1p2>;
-		vdd-s1-supply = <&vph_pwr>;
-
-		vreg_s1f_0p7: smps1 {
-			regulator-name = "vreg_s1f_0p7";
-			regulator-min-microvolt = <700000>;
-			regulator-max-microvolt = <1100000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-	};
-
-	regulators-6 {
-		compatible = "qcom,pm8550ve-rpmh-regulators";
-		qcom,pmic-id = "i";
-
-		vdd-l1-supply = <&vreg_s4c_1p8>;
-		vdd-l2-supply = <&vreg_s5j_1p2>;
-		vdd-l3-supply = <&vreg_s1f_0p7>;
-		vdd-s1-supply = <&vph_pwr>;
-		vdd-s2-supply = <&vph_pwr>;
-
-		vreg_l3i_0p8: ldo3 {
-			regulator-name = "vreg_l3i_0p8";
-			regulator-min-microvolt = <880000>;
-			regulator-max-microvolt = <920000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-	};
-
-	regulators-7 {
-		compatible = "qcom,pm8550ve-rpmh-regulators";
-		qcom,pmic-id = "j";
-
-		vdd-l1-supply = <&vreg_s1f_0p7>;
-		vdd-l2-supply = <&vreg_s5j_1p2>;
-		vdd-l3-supply = <&vreg_s1f_0p7>;
-		vdd-s5-supply = <&vph_pwr>;
-
-		vreg_s5j_1p2: smps5 {
-			regulator-name = "vreg_s5j_1p2";
-			regulator-min-microvolt = <1256000>;
-			regulator-max-microvolt = <1304000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l1j_0p8: ldo1 {
-			regulator-name = "vreg_l1j_0p8";
-			regulator-min-microvolt = <880000>;
-			regulator-max-microvolt = <920000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l2j_1p2: ldo2 {
-			regulator-name = "vreg_l2j_1p2";
-			regulator-min-microvolt = <1256000>;
-			regulator-max-microvolt = <1256000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l3j_0p8: ldo3 {
-			regulator-name = "vreg_l3j_0p8";
-			regulator-min-microvolt = <880000>;
-			regulator-max-microvolt = <920000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-	};
-};
-
-&gpu {
-	status = "okay";
-};
-
-&gpu_zap_shader {
-	firmware-name = "qcom/x1e80100/ASUSTeK/vivobook-s15/qcdxkmsuc8380.mbn";
-};
-
-&i2c0 {
-	clock-frequency = <400000>;
-	status = "okay";
-
-	touchpad@15 {
-		compatible = "hid-over-i2c";
-		reg = <0x15>;
-
-		hid-descr-addr = <0x1>;
-		interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
-
-		pinctrl-0 = <&tpad_default>;
-		pinctrl-names = "default";
-
-		wakeup-source;
-	};
-};
-
-&i2c1 {
-	clock-frequency = <400000>;
-	status = "okay";
-};
-
-&i2c3 {
-	clock-frequency = <400000>;
-	status = "okay";
-
-	typec-mux@8 {
-		compatible = "parade,ps8830";
-		reg = <0x08>;
-
-		clocks = <&rpmhcc RPMH_RF_CLK3>;
-
-		vdd-supply = <&vreg_rtmr0_1p15>;
-		vdd33-supply = <&vreg_rtmr0_3p3>;
-		vdd33-cap-supply = <&vreg_rtmr0_3p3>;
-		vddar-supply = <&vreg_rtmr0_1p15>;
-		vddat-supply = <&vreg_rtmr0_1p15>;
-		vddio-supply = <&vreg_rtmr0_1p8>;
-
-		reset-gpios = <&pm8550_gpios 10 GPIO_ACTIVE_LOW>;
-
-		pinctrl-0 = <&rtmr0_default>;
-		pinctrl-names = "default";
-
-		orientation-switch;
-		retimer-switch;
-
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			port@0 {
-				reg = <0>;
-
-				retimer_ss0_ss_out: endpoint {
-					remote-endpoint = <&pmic_glink_ss0_ss_in>;
-				};
-			};
-
-			port@1 {
-				reg = <1>;
-
-				retimer_ss0_ss_in: endpoint {
-					remote-endpoint = <&usb_1_ss0_qmpphy_out>;
-				};
-			};
-
-			port@2 {
-				reg = <2>;
-
-				retimer_ss0_con_sbu_out: endpoint {
-					remote-endpoint = <&pmic_glink_ss0_con_sbu_in>;
-				};
-			};
-		};
-	};
-};
-
-&i2c5 {
-	clock-frequency = <400000>;
-	status = "okay";
-
-	keyboard@3a {
-		compatible = "hid-over-i2c";
-		reg = <0x3a>;
-
-		hid-descr-addr = <0x1>;
-		interrupts-extended = <&tlmm 67 IRQ_TYPE_LEVEL_LOW>;
-
-		pinctrl-0 = <&kybd_default>;
-		pinctrl-names = "default";
-
-		wakeup-source;
-	};
-
-	eusb5_repeater: redriver@43 {
-		compatible = "nxp,ptn3222";
-		reg = <0x43>;
-		#phy-cells = <0>;
-
-		vdd3v3-supply = <&vreg_l13b_3p0>;
-		vdd1v8-supply = <&vreg_l4b_1p8>;
-
-		reset-gpios = <&tlmm 7 GPIO_ACTIVE_LOW>;
-
-		pinctrl-0 = <&eusb5_reset_n>;
-		pinctrl-names = "default";
-	};
-
-	eusb3_repeater: redriver@47 {
-		compatible = "nxp,ptn3222";
-		reg = <0x47>;
-		#phy-cells = <0>;
-
-		vdd3v3-supply = <&vreg_l13b_3p0>;
-		vdd1v8-supply = <&vreg_l4b_1p8>;
-
-		reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
-
-		pinctrl-0 = <&eusb3_reset_n>;
-		pinctrl-names = "default";
-	};
-
-	eusb6_repeater: redriver@4f {
-		compatible = "nxp,ptn3222";
-		reg = <0x4f>;
-		#phy-cells = <0>;
-
-		vdd3v3-supply = <&vreg_l13b_3p0>;
-		vdd1v8-supply = <&vreg_l4b_1p8>;
-
-		reset-gpios = <&tlmm 184 GPIO_ACTIVE_LOW>;
-
-		pinctrl-0 = <&eusb6_reset_n>;
-		pinctrl-names = "default";
-	};
-
-	/* EC @ 0x76 */
-};
-
-&i2c7 {
-	clock-frequency = <400000>;
-	status = "okay";
-
-	typec-mux@8 {
-		compatible = "parade,ps8830";
-		reg = <0x8>;
-
-		clocks = <&rpmhcc RPMH_RF_CLK4>;
-
-		vdd-supply = <&vreg_rtmr1_1p15>;
-		vdd33-supply = <&vreg_rtmr1_3p3>;
-		vdd33-cap-supply = <&vreg_rtmr1_3p3>;
-		vddar-supply = <&vreg_rtmr1_1p15>;
-		vddat-supply = <&vreg_rtmr1_1p15>;
-		vddio-supply = <&vreg_rtmr1_1p8>;
-
-		reset-gpios = <&tlmm 176 GPIO_ACTIVE_LOW>;
-
-		pinctrl-0 = <&rtmr1_default>;
-		pinctrl-names = "default";
-
-		retimer-switch;
-		orientation-switch;
-
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			port@0 {
-				reg = <0>;
-
-				retimer_ss1_ss_out: endpoint {
-					remote-endpoint = <&pmic_glink_ss1_ss_in>;
-				};
-			};
-
-			port@1 {
-				reg = <1>;
-
-				retimer_ss1_ss_in: endpoint {
-					remote-endpoint = <&usb_1_ss1_qmpphy_out>;
-				};
-			};
-
-			port@2 {
-				reg = <2>;
-
-				retimer_ss1_con_sbu_out: endpoint {
-					remote-endpoint = <&pmic_glink_ss1_con_sbu_in>;
-				};
-			};
-		};
-	};
-};
-
-&iris {
-	firmware-name = "qcom/x1e80100/ASUSTeK/vivobook-s15/qcvss8380.mbn";
-	status = "okay";
-};
-
-&mdss {
-	status = "okay";
-};
-
-&mdss_dp0 {
-	status = "okay";
-};
-
-&mdss_dp0_out {
-	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
-};
-
-&mdss_dp1 {
-	status = "okay";
-};
-
-&mdss_dp1_out {
-	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
-};
-
-&mdss_dp2 {
-	status = "okay";
-};
-
-&mdss_dp2_out {
-	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
-};
-
-&mdss_dp3 {
-	/delete-property/ #sound-dai-cells;
-
-	pinctrl-0 = <&edp0_hpd_default>;
-	pinctrl-names = "default";
-
-	status = "okay";
-
-	aux-bus {
-		panel {
-			compatible = "samsung,atna56ac03", "samsung,atna33xc20";
-			enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
-			power-supply = <&vreg_edp_3p3>;
-
-			pinctrl-0 = <&edp_bl_en>;
-			pinctrl-names = "default";
-
-			port {
-				edp_panel_in: endpoint {
-					remote-endpoint = <&mdss_dp3_out>;
-				};
-			};
-		};
-	};
-};
-
-&mdss_dp3_out {
-	data-lanes = <0 1 2 3>;
-	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
-
-	remote-endpoint = <&edp_panel_in>;
-};
-
-&mdss_dp3_phy {
-	vdda-phy-supply = <&vreg_l3j_0p8>;
-	vdda-pll-supply = <&vreg_l2j_1p2>;
-
-	status = "okay";
-};
-
-&pcie4 {
-	pinctrl-0 = <&pcie4_default>;
-	pinctrl-names = "default";
-
-	status = "okay";
-};
-
-&pcie4_phy {
-	vdda-phy-supply = <&vreg_l3i_0p8>;
-	vdda-pll-supply = <&vreg_l3e_1p2>;
-
-	status = "okay";
-};
-
-&pcie4_port0 {
-	reset-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
-
-	wifi@0 {
-		compatible = "pci17cb,1107";
-		reg = <0x10000 0x0 0x0 0x0 0x0>;
-
-		vddaon-supply = <&vreg_pmu_aon_0p59>;
-		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
-		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
-		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
-		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
-		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
-		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
-		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
-		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
-	};
-};
-
-&pcie6a {
-	vddpe-3v3-supply = <&vreg_nvme>;
-
-	pinctrl-0 = <&pcie6a_default>;
-	pinctrl-names = "default";
-
-	status = "okay";
-};
-
-&pcie6a_phy {
-	vdda-phy-supply = <&vreg_l1d_0p8>;
-	vdda-pll-supply = <&vreg_l2j_1p2>;
-
-	status = "okay";
-};
-
-&pcie6a_port0 {
-	reset-gpios = <&tlmm 152 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
-};
-
-&pm8550_gpios {
-	rtmr0_default: rtmr0-reset-n-active-state {
-		pins = "gpio10";
-		function = "normal";
-		power-source = <1>; /* 1.8V */
-		bias-disable;
-		input-disable;
-		output-enable;
-	};
-
-	usb0_3p3_reg_en: usb0-3p3-reg-en-state {
-		pins = "gpio11";
-		function = "normal";
-		power-source = <1>; /* 1.8V */
-		bias-disable;
-		input-disable;
-		output-enable;
-	};
-};
-
-&pm8550ve_9_gpios {
-	usb0_1p8_reg_en: usb0-1p8-reg-en-state {
-		pins = "gpio8";
-		function = "normal";
-		power-source = <1>; /* 1.8V */
-		bias-disable;
-		input-disable;
-		output-enable;
-	};
-};
-
-&pmc8380_3_gpios {
-	edp_bl_en: edp-bl-en-state {
-		pins = "gpio4";
-		function = "normal";
-		power-source = <1>; /* 1.8 V */
-		qcom,drive-strength = <PMIC_GPIO_STRENGTH_MED>;
-		bias-pull-down;
-		input-disable;
-		output-enable;
-	};
-};
-
-&pmc8380_5_gpios {
-	usb0_pwr_1p15_reg_en: usb0-pwr-1p15-reg-en-state {
-		pins = "gpio8";
-		function = "normal";
-		power-source = <1>; /* 1.8V */
-		bias-disable;
-		input-disable;
-		output-enable;
-	};
-};
-
-&qupv3_0 {
-	status = "okay";
-};
-
-&qupv3_1 {
-	status = "okay";
-};
-
-&qupv3_2 {
-	status = "okay";
-};
-
-&remoteproc_adsp {
-	firmware-name = "qcom/x1e80100/ASUSTeK/vivobook-s15/qcadsp8380.mbn",
-			"qcom/x1e80100/ASUSTeK/vivobook-s15/adsp_dtbs.elf";
-
-	status = "okay";
-};
-
-&remoteproc_cdsp {
-	firmware-name = "qcom/x1e80100/ASUSTeK/vivobook-s15/qccdsp8380.mbn",
-			"qcom/x1e80100/ASUSTeK/vivobook-s15/cdsp_dtbs.elf";
-
-	status = "okay";
-};
-
-&smb2360_0 {
-	status = "okay";
-};
-
-&smb2360_0_eusb2_repeater {
-	vdd18-supply = <&vreg_l3d_1p8>;
-	vdd3-supply = <&vreg_l2b_3p0>;
-};
-
-&smb2360_1 {
-	status = "okay";
-};
-
-&smb2360_1_eusb2_repeater {
-	vdd18-supply = <&vreg_l3d_1p8>;
-	vdd3-supply = <&vreg_l14b_3p0>;
-};
-
-&tlmm {
-	gpio-reserved-ranges = <34 2>, /* Unused */
-			       <44 4>, /* SPI (TPM) */
-			       <238 1>; /* UFS Reset */
-
-	edp_reg_en: edp-reg-en-state {
-		pins = "gpio70";
-		function = "gpio";
-		drive-strength = <16>;
-		bias-disable;
-	};
-
-	eusb3_reset_n: eusb3-reset-n-state {
-		pins = "gpio6";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-pull-up;
-		output-low;
-	};
-
-	eusb5_reset_n: eusb5-reset-n-state {
-		pins = "gpio7";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-pull-up;
-		output-low;
-	};
-
-	eusb6_reset_n: eusb6-reset-n-state {
-		pins = "gpio184";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-pull-up;
-		output-low;
-	};
-
-	hall_int_n_default: hall-int-n-state {
-		pins = "gpio92";
-		function = "gpio";
-		bias-disable;
-	};
-
-	hdmi_hpd_default: hdmi-hpd-default-state {
-		pins = "gpio126";
-		function = "usb2_dp";
-		bias-disable;
-	};
-
-	kybd_default: kybd-default-state {
-		pins = "gpio67";
-		function = "gpio";
-		bias-disable;
-	};
-
-	nvme_reg_en: nvme-reg-en-state {
-		pins = "gpio18";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-disable;
-	};
-
-	pcie4_default: pcie4-default-state {
-		clkreq-n-pins {
-			pins = "gpio147";
-			function = "pcie4_clk";
-			drive-strength = <2>;
-			bias-pull-up;
-		};
-
-		perst-n-pins {
-			pins = "gpio146";
-			function = "gpio";
-			drive-strength = <2>;
-			bias-disable;
-		};
-
-		wake-n-pins {
-			pins = "gpio148";
-			function = "gpio";
-			drive-strength = <2>;
-			bias-pull-up;
-		};
-	};
-
-	pcie6a_default: pcie6a-default-state {
-		clkreq-n-pins {
-			pins = "gpio153";
-			function = "pcie6a_clk";
-			drive-strength = <2>;
-			bias-pull-up;
-		};
-
-		perst-n-pins {
-			pins = "gpio152";
-			function = "gpio";
-			drive-strength = <2>;
-			bias-disable;
-		};
-
-		wake-n-pins {
-			pins = "gpio154";
-			function = "gpio";
-			drive-strength = <2>;
-			bias-pull-up;
-		};
-	};
-
-	rtmr1_default: rtmr1-reset-n-active-state {
-		pins = "gpio176";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-pull-up;
-	};
-
-	tpad_default: tpad-default-state {
-		pins = "gpio3";
-		function = "gpio";
-		bias-disable;
-	};
-
-	usb1_pwr_1p15_reg_en: usb1-pwr-1p15-reg-en-state {
-		pins = "gpio188";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-pull-up;
-	};
-
-	usb1_pwr_1p8_reg_en: usb1-pwr-1p8-reg-en-state {
-		pins = "gpio175";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-pull-up;
-	};
-
-	usb1_pwr_3p3_reg_en: usb1-pwr-3p3-reg-en-state {
-		pins = "gpio186";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-pull-up;
-	};
-
-	wcn_bt_en: wcn-bt-en-state {
-		pins = "gpio116";
-		function = "gpio";
-		drive-strength = <16>;
-		bias-pull-down;
-	};
-
-	wcn_sw_en: wcn-sw-en-state {
-		pins = "gpio214";
-		function = "gpio";
-		drive-strength = <16>;
-		bias-disable;
-	};
-
-	wcn_wlan_en: wcn-wlan-en-state {
-		pins = "gpio117";
-		function = "gpio";
-		drive-strength = <16>;
-		bias-disable;
-	};
-};
-
-&uart14 {
-	status = "okay";
-
-	bluetooth {
-		compatible = "qcom,wcn7850-bt";
-		max-speed = <3200000>;
-
-		vddaon-supply = <&vreg_pmu_aon_0p59>;
-		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
-		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
-		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
-		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
-		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
-		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
-	};
-};
-
-&usb_1_ss0_hsphy {
-	vdd-supply = <&vreg_l3j_0p8>;
-	vdda12-supply = <&vreg_l2j_1p2>;
-
-	phys = <&smb2360_0_eusb2_repeater>;
-
-	status = "okay";
-};
-
-&usb_1_ss0_qmpphy {
-	vdda-phy-supply = <&vreg_l2j_1p2>;
-	vdda-pll-supply = <&vreg_l1j_0p8>;
-
-	status = "okay";
-};
-
-&usb_1_ss0 {
-	status = "okay";
-};
-
-&usb_1_ss0_dwc3 {
-	dr_mode = "host";
-};
-
-&usb_1_ss0_dwc3_hs {
-	remote-endpoint = <&pmic_glink_ss0_hs_in>;
-};
-
-&usb_1_ss0_qmpphy_out {
-	remote-endpoint = <&retimer_ss0_ss_in>;
-};
-
-&usb_1_ss1_hsphy {
-	vdd-supply = <&vreg_l3j_0p8>;
-	vdda12-supply = <&vreg_l2j_1p2>;
-
-	phys = <&smb2360_1_eusb2_repeater>;
-
-	status = "okay";
-};
-
-&usb_1_ss1_qmpphy {
-	vdda-phy-supply = <&vreg_l2j_1p2>;
-	vdda-pll-supply = <&vreg_l2d_0p9>;
-
-	status = "okay";
-};
-
-&usb_1_ss1 {
-	status = "okay";
-};
-
-&usb_1_ss1_dwc3 {
-	dr_mode = "host";
-};
-
-&usb_1_ss1_dwc3_hs {
-	remote-endpoint = <&pmic_glink_ss1_hs_in>;
-};
-
-&usb_1_ss1_qmpphy_out {
-	remote-endpoint = <&retimer_ss1_ss_in>;
-};
-
-&usb_1_ss2_qmpphy {
-	vdda-phy-supply = <&vreg_l2j_1p2>;
-	vdda-pll-supply = <&vreg_l2d_0p9>;
-
-	/delete-property/ mode-switch;
-	/delete-property/ orientation-switch;
-
-	status = "okay";
-
-	ports {
-		port@0 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			/delete-node/ endpoint;
-
-			usb_1_ss2_qmpphy_out_dp: endpoint@0 {
-				reg = <0>;
-
-				data-lanes = <3 2 1 0>;
-				remote-endpoint = <&hdmi_bridge_dp_in>;
-			};
-
-			/* No USB3 lanes connected */
-		};
-	};
-};
-
-&usb_2 {
-	status = "okay";
-};
-
-&usb_2_dwc3 {
-	dr_mode = "host";
-};
-
-&usb_2_hsphy {
-	vdd-supply = <&vreg_l2e_0p8>;
-	vdda12-supply = <&vreg_l3e_1p2>;
-
-	phys = <&eusb5_repeater>;
-
-	status = "okay";
-};
-
-&usb_mp {
-	status = "okay";
-};
-
-&usb_mp_hsphy0 {
-	vdd-supply = <&vreg_l2e_0p8>;
-	vdda12-supply = <&vreg_l3e_1p2>;
-
-	phys = <&eusb3_repeater>;
-
-	status = "okay";
-};
-
-&usb_mp_hsphy1 {
-	vdd-supply = <&vreg_l2e_0p8>;
-	vdda12-supply = <&vreg_l3e_1p2>;
-
-	phys = <&eusb6_repeater>;
-
-	status = "okay";
-};
-
-&usb_mp_qmpphy0 {
-	vdda-phy-supply = <&vreg_l3e_1p2>;
-	vdda-pll-supply = <&vreg_l3c_0p8>;
-
-	status = "okay";
-};
-
-&usb_mp_qmpphy1 {
-	vdda-phy-supply = <&vreg_l3e_1p2>;
-	vdda-pll-supply = <&vreg_l3c_0p8>;
-
-	status = "okay";
-};
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2024, Xilin Wu <wuxilin123@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "hamoa.dtsi"
+#include "x1-asus-vivobook-s15.dtsi"
+
+/ {
+	model = "ASUS Vivobook S 15";
+	compatible = "asus,vivobook-s15", "qcom,x1e80100";
+	chassis-type = "laptop";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/x1e80100/ASUSTeK/vivobook-s15/qcdxkmsuc8380.mbn";
+};
+
+&iris {
+	firmware-name = "qcom/x1e80100/ASUSTeK/vivobook-s15/qcvss8380.mbn";
+	status = "okay";
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/x1e80100/ASUSTeK/vivobook-s15/qcadsp8380.mbn",
+			"qcom/x1e80100/ASUSTeK/vivobook-s15/adsp_dtbs.elf";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/x1e80100/ASUSTeK/vivobook-s15/qccdsp8380.mbn",
+			"qcom/x1e80100/ASUSTeK/vivobook-s15/cdsp_dtbs.elf";
+
+	status = "okay";
+};
+
diff --git a/arch/arm64/boot/dts/qcom/x1p42100-asus-vivobook-s15.dts b/arch/arm64/boot/dts/qcom/x1p42100-asus-vivobook-s15.dts
new file mode 100644
index 0000000000000000000000000000000000000000..336bd0c10992f2a60b384b247ae2219f75d8b8a4
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/x1p42100-asus-vivobook-s15.dts
@@ -0,0 +1,47 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2024, Xilin Wu <wuxilin123@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "purwa.dtsi"
+#include "x1-asus-vivobook-s15.dtsi"
+
+/delete-node/ &pmc8380_6;
+/delete-node/ &pmc8380_6_thermal;
+
+/ {
+	model = "ASUS Vivobook S 15 X1P-42-100";
+	compatible = "asus,vivobook-s15-x1p4", "qcom,x1p42100";
+	chassis-type = "laptop";
+};
+
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/x1p42100/ASUSTeK/vivobook-s15/qcdxkmsucpurwa.mbn";
+};
+
+&iris {
+	firmware-name = "qcom/x1p42100/ASUSTeK/vivobook-s15/qcvss8380.mbn";
+	status = "okay";
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/x1p42100/ASUSTeK/vivobook-s15/qcadsp8380.mbn",
+			"qcom/x1p42100/ASUSTeK/vivobook-s15/adsp_dtbs.elf";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/x1p42100/ASUSTeK/vivobook-s15/qccdsp8380.mbn",
+			"qcom/x1p42100/ASUSTeK/vivobook-s15/cdsp_dtbs.elf";
+
+	status = "okay";
+};
+

-- 
2.51.0



