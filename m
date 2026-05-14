Return-Path: <linux-arm-msm+bounces-107642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKUKGY3aBWrAcQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 16:22:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 59123543046
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 16:22:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4DA1030736B2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 14:10:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14F3B426D3C;
	Thu, 14 May 2026 14:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F2RCgIOn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F3F402B8D;
	Thu, 14 May 2026 14:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778767766; cv=none; b=DW26mCWsj5ZFcxSzNKrzW/+J1nQi+X/OYISrqVdb10DIoBk+5CwrXUFZplRsK/XtvUL6o1lShKXjh33jWW2/9APWOQIkIwPc3r6DO9E8mhCI+4zXpk4HwdXxZ79hdUMHy3JsRSyl1H7LWoOccSdTpwQuHwdN2SEuM60DXSuREpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778767766; c=relaxed/simple;
	bh=F+kY/tJHNLrTSKkaRJlnKzceWlLQNqSIZXo/8bGon8I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YOxZmi5GsTDdgEh/DC0Uwe9+5VnnD1Ez+3fGdViVaEYi2QQ7WqMCbDSK+lIR2zbhpDinGXceyHvXvF2kCPyKlObF+wJNsxIYzI0H05SXJu70I3Q1a6Q9ekxA/KY9ehyxQ2wMSt0bazUcGgV3tU/jsTrpSqvUwwaL7zYSOM7NAxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F2RCgIOn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 15114C2BCF7;
	Thu, 14 May 2026 14:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778767766;
	bh=F+kY/tJHNLrTSKkaRJlnKzceWlLQNqSIZXo/8bGon8I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=F2RCgIOnaxPqcAmvO9Acv00J7bxaU8IvYsY78tNWgYpCLNOcZmpLg4xk23yTcvVqx
	 bX6zRYbcjrfedTnEOItzGgpnzMp2xmN4Gl0Sw0iR8xInDv+Pi2IEkLBxQhyHoJ1LKw
	 9sRmU5aGymVcwPdaPO0mw+eCFUAQtduIreZByktPlNUmldKf8HfQ6RmOKHD4V9DYBd
	 onBkGSsdPVwKBD6dK+O0o79JWuFDa41M1EGHo7TLCovVp+Az0RrseVpbw88wMoA7Gs
	 FvNN5gUo0GOeyh6yF7kGeYRKZL95yUkSmVH4zCRmCU97ZmJ+qP5CC3G/Kmls0sg7uS
	 E0KWslKbMK9uQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06967CD4F3D;
	Thu, 14 May 2026 14:09:26 +0000 (UTC)
From: Antony Kurniawan Soemardi via B4 Relay <devnull+linux.smankusors.com@kernel.org>
Date: Thu, 14 May 2026 21:08:38 +0700
Subject: [PATCH v2 09/10] ARM: dts: qcom: msm8960: add Riva
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-msm8960-wifi-v2-9-7cbae45dab5e@smankusors.com>
References: <20260514-msm8960-wifi-v2-0-7cbae45dab5e@smankusors.com>
In-Reply-To: <20260514-msm8960-wifi-v2-0-7cbae45dab5e@smankusors.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Rudraksha Gupta <guptarud@gmail.com>, 
 Antony Kurniawan Soemardi <linux@smankusors.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778767762; l=3618;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=pGOM+aVPupLXCoq/Ban0utLGNf46qmBaJ3MGJo3tLOI=;
 b=I9ifUU/cwFGKxpW2uILSqmp0sTGjt4ub1bfKhjTtBAphYGgE+z+r0oizpdqkjhz0g9gARSLI2
 IQVVBVtM9hRAYkLwySomOxSzwnIXm+RBusPatqL3Z120gGPwE9ILAXf
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
X-Endpoint-Received: by B4 Relay for linux@smankusors.com/20250609 with
 auth_id=733
X-Original-From: Antony Kurniawan Soemardi <linux@smankusors.com>
Reply-To: linux@smankusors.com
X-Rspamd-Queue-Id: 59123543046
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107642-lists,linux-arm-msm=lfdr.de,linux.smankusors.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com,smankusors.com,oss.qualcomm.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[linux@smankusors.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	DBL_PROHIBIT(0.00)[0.48.215.32:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,smankusors.com:email,smankusors.com:mid,smankusors.com:replyto,4.196.180.0:email,0.61.9.0:email,8f000000:email]
X-Rspamd-Action: no action

From: Antony Kurniawan Soemardi <linux@smankusors.com>

Add the Riva Peripheral Image Loader node to support the Wireless
Connectivity and Networking Subsystem on MSM8960. This includes:

- Reserved memory region for WCNSS firmware
- WCN3660 iris radio controller
- Bluetooth and Wi-Fi sub-devices exposed via the SMD edge
- Pinctrl states for Bluetooth and Wi-Fi power management

Tested-by: Rudraksha Gupta <guptarud@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
---
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 87 ++++++++++++++++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
index fdc060df4544..093c24c47fd6 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
@@ -100,6 +100,11 @@ smem_region: smem@80000000 {
 			reg = <0x80000000 0x200000>;
 			no-map;
 		};
+
+		wcnss_mem: wcnss@8f000000 {
+			reg = <0x8f000000 0x700000>;
+			no-map;
+		};
 	};
 
 	smem {
@@ -321,6 +326,34 @@ i2c12-pins {
 				};
 			};
 
+			riva_bt_default_state: riva-bt-active-state {
+				pins = "gpio28", "gpio29";
+				function = "bt";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			riva_bt_sleep_state: riva-bt-sleep-state {
+				pins = "gpio28", "gpio29";
+				function = "bt";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			riva_wlan_default_state: riva-wlan-active-state {
+				pins = "gpio84", "gpio85", "gpio86", "gpio87", "gpio88";
+				function = "wlan";
+				drive-strength = <6>;
+				bias-pull-down;
+			};
+
+			riva_wlan_sleep_state: riva-wlan-sleep-state {
+				pins = "gpio84", "gpio85", "gpio86", "gpio87", "gpio88";
+				function = "wlan";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
 			sdcc3_default_state: sdcc3-default-state {
 				clk-pins {
 					pins = "sdc3_clk";
@@ -460,6 +493,60 @@ saw1_vreg: regulator {
 			};
 		};
 
+		riva: riva-pil@3200800 {
+			compatible = "qcom,riva-pil";
+			reg = <0x03200800 0x1000>,
+			      <0x03202000 0x2000>,
+			      <0x03204000 0x100>;
+			reg-names = "ccu",
+				    "dxe",
+				    "pmu";
+			pinctrl-0 = <&riva_wlan_default_state>, <&riva_bt_default_state>;
+			pinctrl-1 = <&riva_wlan_sleep_state>, <&riva_bt_sleep_state>;
+			pinctrl-names = "default", "sleep";
+			interrupts-extended = <&intc GIC_SPI 199 IRQ_TYPE_EDGE_RISING>,
+					      <&wcnss_smsm 6 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog", "fatal";
+			memory-region = <&wcnss_mem>;
+
+			status = "disabled";
+
+			iris {
+				compatible = "qcom,wcn3660";
+				clocks = <&cxo_board>;
+				clock-names = "xo";
+			};
+
+			smd-edge {
+				interrupts = <GIC_SPI 198 IRQ_TYPE_EDGE_RISING>;
+				label = "riva";
+				qcom,ipc = <&l2cc 8 25>;
+				qcom,smd-edge = <6>;
+
+				wcnss {
+					compatible = "qcom,wcnss";
+					qcom,smd-channels = "WCNSS_CTRL";
+					qcom,mmio = <&riva>;
+
+					bluetooth {
+						compatible = "qcom,wcnss-bt";
+					};
+
+					wifi {
+						compatible = "qcom,wcnss-wlan";
+						interrupts = <GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH>,
+							     <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>;
+						interrupt-names = "tx",
+								  "rx";
+						qcom,smem-states = <&apps_smsm 10>,
+								   <&apps_smsm 9>;
+						qcom,smem-state-names = "tx-enable",
+									"tx-rings-empty";
+					};
+				};
+			};
+		};
+
 		clock-controller@4000000 {
 			compatible = "qcom,mmcc-msm8960";
 			reg = <0x4000000 0x1000>;

-- 
2.34.1



