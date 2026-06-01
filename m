Return-Path: <linux-arm-msm+bounces-110543-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sIRRGvtJHWo2YgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110543-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 10:59:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EDB61BFC2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 10:59:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D7A3C307543F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 08:53:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D29D38F236;
	Mon,  1 Jun 2026 08:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZRfkbOP5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D880B388876;
	Mon,  1 Jun 2026 08:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780304029; cv=none; b=u2xy/ObzvIfbs5/l0hR1OdgfpvoliDlBSRVwfKDU+JAMmdlyrEBZIqfZ3tWiw9Qebs8H7pEdOh6ZMrvwEsKqh0lcov/XcyEtI4RwLX3iCrwQgDagLh4vSjKTCDofLaRd/dOsOf9c6gV+GKIxtlbXN6H0kFMVvetG5gw1vzDhJ2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780304029; c=relaxed/simple;
	bh=7cYvqj2LxV9vZ3DA27OniB3x2tpawNfmIuO82Z6Dd/A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kjXHeQzzzDZixfnj9gdeZhsjHeKZCCZD78/TBSg2HPPwyLoTkeJSfgKB3H+AgJHCxDJ43BAUGfTj1KyO2MXQoIeuxb9H2URD1RRCGmXGP0mvVCJZ33sjMV6ET8JgucaUJ9nl2gGM5ZQTaTVPlhthm/THuIwGgh0usYC9NVn99e8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZRfkbOP5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9DB85C2BCC6;
	Mon,  1 Jun 2026 08:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780304029;
	bh=7cYvqj2LxV9vZ3DA27OniB3x2tpawNfmIuO82Z6Dd/A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ZRfkbOP5rDxvLgGrjjfrDBCo8tjsZbOsJQidd3kHfto7JwkvAsQfmh2R4zzl6Oebt
	 /9P9p0Glt2pDcIwuw+M5NPnme7tE3qzFvLZnO7P3GMaO+ndLIx22b+aFOwaxVmPvNO
	 ws2ySnlhRkMbHpS0QAGB6EI3oj/ydn1I1DeEVrTo7iMZWxBIK/3FspO7skKAUSpMMQ
	 8FIMBso2RByshLuNsxWrPfvumls0ia+CqaMjWz+mwQCw2ENo3i+ngkSX6Y3aYGY05N
	 nl0KwRH7ro5EuBylRs/lgX2/ovASNbWMPnxInNjzayEUvGU9CMAxSHQVnaft18QYSB
	 8MGHzZ/pnEWGw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96C04CD5BD1;
	Mon,  1 Jun 2026 08:53:49 +0000 (UTC)
From: Antony Kurniawan Soemardi via B4 Relay <devnull+linux.smankusors.com@kernel.org>
Date: Mon, 01 Jun 2026 15:51:22 +0700
Subject: [PATCH v3 09/10] ARM: dts: qcom: msm8960: add Riva
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-msm8960-wifi-v3-9-fec6ac8dba02@smankusors.com>
References: <20260601-msm8960-wifi-v3-0-fec6ac8dba02@smankusors.com>
In-Reply-To: <20260601-msm8960-wifi-v3-0-fec6ac8dba02@smankusors.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780304027; l=3618;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=NO876SML6vSrC8ii+BaxpGZKwRLkKw+vlpNP59pPkt0=;
 b=xVkMVOdbAvinZN+rk3v5IsHzXtpXZ8++tsi+NM/3ChtPMlQALxdnCGGb815G1HKsXibMK2/6o
 7jBSg8ycD/1Bhs08iVFvDa6GToW7RQZ5JFdHai9BWWV/wkIynjry14W
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
X-Endpoint-Received: by B4 Relay for linux@smankusors.com/20250609 with
 auth_id=733
X-Original-From: Antony Kurniawan Soemardi <linux@smankusors.com>
Reply-To: linux@smankusors.com
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110543-lists,linux-arm-msm=lfdr.de,linux.smankusors.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com,smankusors.com,oss.qualcomm.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	HAS_REPLYTO(0.00)[linux@smankusors.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,4.196.180.0:email,0.61.9.0:email,smankusors.com:replyto,smankusors.com:mid,smankusors.com:email,8f000000:email,0.48.215.32:email,qualcomm.com:email]
X-Rspamd-Queue-Id: B7EDB61BFC2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
index 662e2e45bbb8..2ecf33078f8b 100644
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



