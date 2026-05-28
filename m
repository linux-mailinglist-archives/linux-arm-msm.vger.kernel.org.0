Return-Path: <linux-arm-msm+bounces-110048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPgmBfi4F2qwOggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 05:39:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 852B25EC3B5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 05:39:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 672DE3036CCD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 03:39:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26669311946;
	Thu, 28 May 2026 03:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PaWe9U4x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877673112AB;
	Thu, 28 May 2026 03:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779939571; cv=none; b=J1b80ggUDVGC+qxlCSl8C2pZapwKegQXcfed0NHQV9JWgRdm1X9X9f635K72en+hXKnNPgtIlQA6krgKTKhRG3H/k2EZaz4aUonJxRvy5Mb/EG7Veb+60SNp+a0RJIBhoQB2v6nHPdIAcUgvQm/M+o3jtWmloigBh4H1gAHWUcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779939571; c=relaxed/simple;
	bh=95CTCcnU8taxi9/mgQTgRaCweFn/W7gXcVo+1QPHOWs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RILD0opwUVpAJheoR1lU3x5O68oQg7PksIhSPjDhJp0dAq067DVk/JjDiOWbu2IrJz6cgQK5kCJ97n4h4B4t1mMAwTuwj1kHMJ0R0tCqDK0K5LnE/hQa31FQyg/MmV3k/TuUGaq7xChXSfqSM7w2ta+K6lXUmCE6yDb2x+RF4jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PaWe9U4x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A8B0DC2BCFA;
	Thu, 28 May 2026 03:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779939570;
	bh=95CTCcnU8taxi9/mgQTgRaCweFn/W7gXcVo+1QPHOWs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=PaWe9U4xs8ElwIOz5jiJRxCx3oHTqjT+hxgtggjSrN7hDxw/ASNKmeb5XCxFwh+uf
	 tEzhQiE7DRsWLB2gxDIpYlJ9t1ZaOGacibNo2eq+S5bcSkYZBFT1i+vBxS9M78ckZf
	 OobzDTlWrfC25LnnmFcWNvWIo/po3g3/80Ac3rs8zbWBbX2/33m019Z6K6l/EwRWQ6
	 XP6uWvi+6cr76VgK7Nz1fFT0ZI34ZOfeH0fAXey0RMEC392LyainWFvx7J0PkMKW/5
	 mePTXSYumsPYHH6+ZaGIwybwu08XFZk/YB5NXKLQiFp5GmR0CySiF05bkfXR+BHjSm
	 0dnudb7g5bDxg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1995CD5BD1;
	Thu, 28 May 2026 03:39:30 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Date: Wed, 27 May 2026 20:39:30 -0700
Subject: [PATCH v2 3/3] ARM: dts: qcom: msm8960: Add CPU frequency scaling
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260527-expressatt_cpufreq-v2-3-b9b7726ccb6d@gmail.com>
References: <20260527-expressatt_cpufreq-v2-0-b9b7726ccb6d@gmail.com>
In-Reply-To: <20260527-expressatt_cpufreq-v2-0-b9b7726ccb6d@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>, 
 Ilia Lin <ilia.lin@kernel.org>, Viresh Kumar <vireshk@kernel.org>, 
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 Rudraksha Gupta <guptarud@gmail.com>, 
 Antony Kurniawan Soemardi <linux@smankusors.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779939570; l=5719;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=WlqrFZxEtlslS92JpD8deBZvwae3glnW+krKqNCk7sI=;
 b=wIHakbLcgl2Yb+LsQMAyCOtD+o3Er80lkUYw6OeRoWlKaEQjEV9tuRe8Ls9cBuNICtzRzPLFX
 sM2CzwKqIXgDfCa5j4LQH5TR21RmpbynpFq+e/6ShOOX2uRlzCEfYPi
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=ETrudRugWAtOpr0OhRiheQ1lXM4Kk4KGFnBySlKDi2I=
X-Endpoint-Received: by B4 Relay for guptarud@gmail.com/20240916 with
 auth_id=211
X-Original-From: Rudraksha Gupta <guptarud@gmail.com>
Reply-To: guptarud@gmail.com
X-Spamd-Result: default: False [1.34 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110048-lists,linux-arm-msm=lfdr.de,guptarud.gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,smankusors.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	HAS_REPLYTO(0.00)[guptarud@gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_PROHIBIT(0.00)[0.0.1.148:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-0.989];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,0.0.0.0:email,0.0.0.1:email,c0:email,4.196.180.0:email,0.10.174.96:email]
X-Rspamd-Queue-Id: 852B25EC3B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rudraksha Gupta <guptarud@gmail.com>

Enable Krait DVFS on MSM8960 by adding the required device tree nodes:

- OPP table with 12 operating points from 384 MHz to 1.512 GHz, with
  per-PVS voltages for slow, nominal, and fast silicon bins.
- Krait clock controller (krait-cc-v1) driving the CPU muxes from
  PLL9/PLL10, ACC aux outputs, and PXO.
- PVS efuse nvmem cell in qfprom for the cpufreq-nvmem driver to
  read the speed-bin and process voltage class.
- CPU idle state for Standalone Power Collapse (SPC).
- operating-points-v2, clocks, cpu-supply, and cpu-idle-states wired
  into both CPU nodes.

Link: https://github.com/CyanogenMod/android_kernel_samsung_d2/blob/0dbe2b56847b304d30b809dfd08ba3b4a61d9af8/arch/arm/mach-msm/acpuclock-8960.c#L120-L235
Assisted-by: Claude:claude-opus-4.6
Tested-by: Antony Kurniawan Soemardi <linux@smankusors.com>
Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 129 +++++++++++++++++++++++++++++++
 1 file changed, 129 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
index a427f0f41cd1..3bb78a704850 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
@@ -54,6 +54,10 @@ cpu@0 {
 			reg = <0>;
 			enable-method = "qcom,kpss-acc-v1";
 			device_type = "cpu";
+			operating-points-v2 = <&cpu_opp_table>;
+			clocks = <&kraitcc 0>;
+			cpu-supply = <&saw0_vreg>;
+			cpu-idle-states = <&cpu_spc>;
 			next-level-cache = <&l2>;
 			qcom,acc = <&acc0>;
 			qcom,saw = <&saw0>;
@@ -64,6 +68,10 @@ cpu@1 {
 			reg = <1>;
 			enable-method = "qcom,kpss-acc-v1";
 			device_type = "cpu";
+			operating-points-v2 = <&cpu_opp_table>;
+			clocks = <&kraitcc 1>;
+			cpu-supply = <&saw1_vreg>;
+			cpu-idle-states = <&cpu_spc>;
 			next-level-cache = <&l2>;
 			qcom,acc = <&acc1>;
 			qcom,saw = <&saw1>;
@@ -74,6 +82,123 @@ l2: l2-cache {
 			cache-level = <2>;
 			cache-unified;
 		};
+
+		idle-states {
+			cpu_spc: cpu-spc {
+				compatible = "qcom,idle-state-spc", "arm,idle-state";
+				entry-latency-us = <400>;
+				exit-latency-us = <900>;
+				min-residency-us = <3000>;
+			};
+		};
+	};
+
+	cpu_opp_table: opp-table-cpu {
+		compatible = "operating-points-v2-krait-cpu";
+		nvmem-cells = <&pvs_efuse>;
+
+		opp-384000000 {
+			opp-hz = /bits/ 64 <384000000>;
+			opp-microvolt-speed0-pvs0-v0 = <950000>;
+			opp-microvolt-speed0-pvs1-v0 = <900000>;
+			opp-microvolt-speed0-pvs3-v0 = <850000>;
+			opp-supported-hw = <0x1>;
+		};
+
+		opp-486000000 {
+			opp-hz = /bits/ 64 <486000000>;
+			opp-microvolt-speed0-pvs0-v0 = <975000>;
+			opp-microvolt-speed0-pvs1-v0 = <925000>;
+			opp-microvolt-speed0-pvs3-v0 = <875000>;
+			opp-supported-hw = <0x1>;
+		};
+
+		opp-594000000 {
+			opp-hz = /bits/ 64 <594000000>;
+			opp-microvolt-speed0-pvs0-v0 = <1000000>;
+			opp-microvolt-speed0-pvs1-v0 = <950000>;
+			opp-microvolt-speed0-pvs3-v0 = <900000>;
+			opp-supported-hw = <0x1>;
+		};
+
+		opp-702000000 {
+			opp-hz = /bits/ 64 <702000000>;
+			opp-microvolt-speed0-pvs0-v0 = <1025000>;
+			opp-microvolt-speed0-pvs1-v0 = <975000>;
+			opp-microvolt-speed0-pvs3-v0 = <925000>;
+			opp-supported-hw = <0x1>;
+		};
+
+		opp-810000000 {
+			opp-hz = /bits/ 64 <810000000>;
+			opp-microvolt-speed0-pvs0-v0 = <1075000>;
+			opp-microvolt-speed0-pvs1-v0 = <1025000>;
+			opp-microvolt-speed0-pvs3-v0 = <975000>;
+			opp-supported-hw = <0x1>;
+		};
+
+		opp-918000000 {
+			opp-hz = /bits/ 64 <918000000>;
+			opp-microvolt-speed0-pvs0-v0 = <1100000>;
+			opp-microvolt-speed0-pvs1-v0 = <1050000>;
+			opp-microvolt-speed0-pvs3-v0 = <1000000>;
+			opp-supported-hw = <0x1>;
+		};
+
+		opp-1026000000 {
+			opp-hz = /bits/ 64 <1026000000>;
+			opp-microvolt-speed0-pvs0-v0 = <1125000>;
+			opp-microvolt-speed0-pvs1-v0 = <1075000>;
+			opp-microvolt-speed0-pvs3-v0 = <1025000>;
+			opp-supported-hw = <0x1>;
+		};
+
+		opp-1134000000 {
+			opp-hz = /bits/ 64 <1134000000>;
+			opp-microvolt-speed0-pvs0-v0 = <1175000>;
+			opp-microvolt-speed0-pvs1-v0 = <1125000>;
+			opp-microvolt-speed0-pvs3-v0 = <1075000>;
+			opp-supported-hw = <0x1>;
+		};
+
+		opp-1242000000 {
+			opp-hz = /bits/ 64 <1242000000>;
+			opp-microvolt-speed0-pvs0-v0 = <1200000>;
+			opp-microvolt-speed0-pvs1-v0 = <1150000>;
+			opp-microvolt-speed0-pvs3-v0 = <1100000>;
+			opp-supported-hw = <0x1>;
+		};
+
+		opp-1350000000 {
+			opp-hz = /bits/ 64 <1350000000>;
+			opp-microvolt-speed0-pvs0-v0 = <1225000>;
+			opp-microvolt-speed0-pvs1-v0 = <1175000>;
+			opp-microvolt-speed0-pvs3-v0 = <1125000>;
+			opp-supported-hw = <0x1>;
+		};
+
+		opp-1458000000 {
+			opp-hz = /bits/ 64 <1458000000>;
+			opp-microvolt-speed0-pvs0-v0 = <1237500>;
+			opp-microvolt-speed0-pvs1-v0 = <1187500>;
+			opp-microvolt-speed0-pvs3-v0 = <1137500>;
+			opp-supported-hw = <0x1>;
+		};
+
+		opp-1512000000 {
+			opp-hz = /bits/ 64 <1512000000>;
+			opp-microvolt-speed0-pvs0-v0 = <1250000>;
+			opp-microvolt-speed0-pvs1-v0 = <1200000>;
+			opp-microvolt-speed0-pvs3-v0 = <1150000>;
+			opp-supported-hw = <0x1>;
+		};
+	};
+
+	kraitcc: clock-controller {
+		compatible = "qcom,krait-cc-v1";
+		clocks = <&gcc PLL9>, <&gcc PLL10>, <&acc0>, <&acc1>, <&pxo_board>;
+		clock-names = "hfpll0", "hfpll1", "acpu0_aux", "acpu1_aux", "qsb";
+		#clock-cells = <1>;
 	};
 
 	memory@80000000 {
@@ -112,6 +237,10 @@ qfprom: efuse@700000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
+			pvs_efuse: pvs@c0 {
+				reg = <0xc0 0x04>;
+			};
+
 			tsens_calib: calib@404 {
 				reg = <0x404 0x10>;
 			};

-- 
2.54.0



