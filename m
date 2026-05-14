Return-Path: <linux-arm-msm+bounces-107540-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPZfCetzBWpuXQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107540-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 09:04:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B7F53EAAD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 09:04:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 13DD93042008
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 07:04:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E0563D1CBE;
	Thu, 14 May 2026 07:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OT3tVIeL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36BE53AD50A;
	Thu, 14 May 2026 07:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778742242; cv=none; b=gpNSlRFDuQH2su/VElpsWYDcwOq7M+GqZR9hxFSEsTiN6uVtVDKkgzMEovyuJKrV0N6gMmiEemilCjbJ8X9uSoJL0tdU88iKZYAAGhX69EevJBjZ7yeGIwj55vy0z6ypAqglPYQBPc00b61rd1lyDxYxuMl0TlaHBv7hgpm8gxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778742242; c=relaxed/simple;
	bh=6eoAio/r860/nuK3rR88ARrvf/PvZn5/47UYJ7YmRb8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eJ8XSt6WWP7JbvMdpnL2ZVZdWNmTBCO48ttySV0ZTOo5DU77lxYkbNsUhwC4kCQsxoLF2CMbSgTNpKYNtm6ebEGGD+BLLnq7NFRtDbaDmhRkv21+QJ3p9l4Qtg8NeJfRywMMvvoiFr27oO+UQuDFVsGzOoXXg9wcmufZo7q127s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OT3tVIeL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0866EC2BCF7;
	Thu, 14 May 2026 07:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778742242;
	bh=6eoAio/r860/nuK3rR88ARrvf/PvZn5/47UYJ7YmRb8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OT3tVIeLqzt673LooJYHoaGO0aY+UftnjkrFMONkp2Hey4svOxcvGc6FY2khvwRfq
	 F8HlOqWcIgS2zAyNA1dnhu9qoYsLpSIEhyCW7YLPsG2r//utvS0TG5tbW/pjSLPbTP
	 P5btSAjZizICBogP0VBZ1rB/YsxXORLHJYtrb4s3cBDvH6fKFIG9HFn8KeAqNlm1dU
	 g+J/KxZxWOHLCzc0Qfth2JhV8pjghcCl+C1uP6X5WmDuqZ4ZArCSONVHpT96cpgfxK
	 AX51YDBa/koCb01tm3lEwvMG12A4dFv2JJ4Yi4U/KmIDcLfxY/i+LcabDdSXbAxTub
	 oMc6UYoSV/dew==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8EF1CD4851;
	Thu, 14 May 2026 07:04:01 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Date: Thu, 14 May 2026 00:04:02 -0700
Subject: [PATCH 3/3] ARM: dts: qcom: msm8960: Add CPU frequency scaling
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-expressatt_cpufreq-v1-3-487fd2d78859@gmail.com>
References: <20260514-expressatt_cpufreq-v1-0-487fd2d78859@gmail.com>
In-Reply-To: <20260514-expressatt_cpufreq-v1-0-487fd2d78859@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Rudraksha Gupta <guptarud@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778742241; l=6751;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=IeR+d4K/5j6SSF3Qt1EdfG/VVX1WUOv9oq94PSWVQE8=;
 b=bYHSWaiN6ctsmGuqClUdwNTMbOR524TV4dwpCN/60kVY5WqQZme+KATZUqeGM0UQ8niBHZ2pv
 BoaBESE/9aQBbtAIKYgQy65kWQngsEiJkmGnDj7E5CNcbN12fkEWF5R
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=ETrudRugWAtOpr0OhRiheQ1lXM4Kk4KGFnBySlKDi2I=
X-Endpoint-Received: by B4 Relay for guptarud@gmail.com/20240916 with
 auth_id=211
X-Original-From: Rudraksha Gupta <guptarud@gmail.com>
Reply-To: guptarud@gmail.com
X-Rspamd-Queue-Id: D3B7F53EAAD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107540-lists,linux-arm-msm=lfdr.de,guptarud.gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_PROHIBIT(0.00)[0.31.224.40:email,0.0.0.1:email,4.196.180.0:email,0.10.174.96:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	HAS_REPLYTO(0.00)[guptarud@gmail.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.1.148:email,0.32.7.56:email,c0:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.31.220.64:email]
X-Rspamd-Action: no action

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
Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 133 ++++++++++++++++++++++++++++++-
 1 file changed, 131 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
index a427f0f41cd1..b5b9239c7aa0 100644
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
@@ -74,6 +82,116 @@ l2: l2-cache {
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
+			opp-supported-hw = <0xFFFFFFFF 0xFFFFFFFF 0xFFFFFFFF>;
+		};
+
+		opp-486000000 {
+			opp-hz = /bits/ 64 <486000000>;
+			opp-microvolt-speed0-pvs0-v0 = <975000>;
+			opp-microvolt-speed0-pvs1-v0 = <925000>;
+			opp-microvolt-speed0-pvs3-v0 = <875000>;
+			opp-supported-hw = <0xFFFFFFFF 0xFFFFFFFF 0xFFFFFFFF>;
+		};
+
+		opp-594000000 {
+			opp-hz = /bits/ 64 <594000000>;
+			opp-microvolt-speed0-pvs0-v0 = <1000000>;
+			opp-microvolt-speed0-pvs1-v0 = <950000>;
+			opp-microvolt-speed0-pvs3-v0 = <900000>;
+			opp-supported-hw = <0xFFFFFFFF 0xFFFFFFFF 0xFFFFFFFF>;
+		};
+
+		opp-702000000 {
+			opp-hz = /bits/ 64 <702000000>;
+			opp-microvolt-speed0-pvs0-v0 = <1025000>;
+			opp-microvolt-speed0-pvs1-v0 = <975000>;
+			opp-microvolt-speed0-pvs3-v0 = <925000>;
+			opp-supported-hw = <0xFFFFFFFF 0xFFFFFFFF 0xFFFFFFFF>;
+		};
+
+		opp-810000000 {
+			opp-hz = /bits/ 64 <810000000>;
+			opp-microvolt-speed0-pvs0-v0 = <1075000>;
+			opp-microvolt-speed0-pvs1-v0 = <1025000>;
+			opp-microvolt-speed0-pvs3-v0 = <975000>;
+			opp-supported-hw = <0xFFFFFFFF 0xFFFFFFFF 0xFFFFFFFF>;
+		};
+
+		opp-918000000 {
+			opp-hz = /bits/ 64 <918000000>;
+			opp-microvolt-speed0-pvs0-v0 = <1100000>;
+			opp-microvolt-speed0-pvs1-v0 = <1050000>;
+			opp-microvolt-speed0-pvs3-v0 = <1000000>;
+			opp-supported-hw = <0xFFFFFFFF 0xFFFFFFFF 0xFFFFFFFF>;
+		};
+
+		opp-1026000000 {
+			opp-hz = /bits/ 64 <1026000000>;
+			opp-microvolt-speed0-pvs0-v0 = <1125000>;
+			opp-microvolt-speed0-pvs1-v0 = <1075000>;
+			opp-microvolt-speed0-pvs3-v0 = <1025000>;
+			opp-supported-hw = <0xFFFFFFFF 0xFFFFFFFF 0xFFFFFFFF>;
+		};
+
+		opp-1134000000 {
+			opp-hz = /bits/ 64 <1134000000>;
+			opp-microvolt-speed0-pvs0-v0 = <1175000>;
+			opp-microvolt-speed0-pvs1-v0 = <1125000>;
+			opp-microvolt-speed0-pvs3-v0 = <1075000>;
+			opp-supported-hw = <0xFFFFFFFF 0xFFFFFFFF 0xFFFFFFFF>;
+		};
+
+		opp-1242000000 {
+			opp-hz = /bits/ 64 <1242000000>;
+			opp-microvolt-speed0-pvs0-v0 = <1200000>;
+			opp-microvolt-speed0-pvs1-v0 = <1150000>;
+			opp-microvolt-speed0-pvs3-v0 = <1100000>;
+			opp-supported-hw = <0xFFFFFFFF 0xFFFFFFFF 0xFFFFFFFF>;
+		};
+
+		opp-1350000000 {
+			opp-hz = /bits/ 64 <1350000000>;
+			opp-microvolt-speed0-pvs0-v0 = <1225000>;
+			opp-microvolt-speed0-pvs1-v0 = <1175000>;
+			opp-microvolt-speed0-pvs3-v0 = <1125000>;
+			opp-supported-hw = <0xFFFFFFFF 0xFFFFFFFF 0xFFFFFFFF>;
+		};
+
+		opp-1458000000 {
+			opp-hz = /bits/ 64 <1458000000>;
+			opp-microvolt-speed0-pvs0-v0 = <1237500>;
+			opp-microvolt-speed0-pvs1-v0 = <1187500>;
+			opp-microvolt-speed0-pvs3-v0 = <1137500>;
+			opp-supported-hw = <0xFFFFFFFF 0xFFFFFFFF 0xFFFFFFFF>;
+		};
+
+		opp-1512000000 {
+			opp-hz = /bits/ 64 <1512000000>;
+			opp-microvolt-speed0-pvs0-v0 = <1250000>;
+			opp-microvolt-speed0-pvs1-v0 = <1200000>;
+			opp-microvolt-speed0-pvs3-v0 = <1150000>;
+			opp-supported-hw = <0xFFFFFFFF 0xFFFFFFFF 0xFFFFFFFF>;
+		};
 	};
 
 	memory@80000000 {
@@ -81,6 +199,13 @@ memory@80000000 {
 		reg = <0x80000000 0>;
 	};
 
+	kraitcc: clock-controller {
+		compatible = "qcom,krait-cc-v1";
+		clocks = <&gcc PLL9>, <&gcc PLL10>, <&acc0>, <&acc1>, <&pxo_board>;
+		clock-names = "hfpll0", "hfpll1", "acpu0_aux", "acpu1_aux", "qsb";
+		#clock-cells = <1>;
+	};
+
 	soc: soc {
 		compatible = "simple-bus";
 		ranges;
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
@@ -348,7 +477,7 @@ acc0: clock-controller@2088000 {
 		};
 
 		saw0: power-manager@2089000 {
-			compatible = "qcom,msm8960-saw2-cpu", "qcom,saw2";
+			compatible = "qcom,msm8960-saw2-v1.1-cpu", "qcom,saw2";
 			reg = <0x02089000 0x1000>, <0x02009000 0x1000>;
 
 			saw0_vreg: regulator {
@@ -367,7 +496,7 @@ acc1: clock-controller@2098000 {
 		};
 
 		saw1: power-manager@2099000 {
-			compatible = "qcom,msm8960-saw2-cpu", "qcom,saw2";
+			compatible = "qcom,msm8960-saw2-v1.1-cpu", "qcom,saw2";
 			reg = <0x02099000 0x1000>, <0x02009000 0x1000>;
 
 			saw1_vreg: regulator {

-- 
2.54.0



