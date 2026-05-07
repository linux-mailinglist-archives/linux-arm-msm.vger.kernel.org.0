Return-Path: <linux-arm-msm+bounces-106440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wK5kNp2i/Gn2SAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 16:33:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A73E4EA3FF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 16:33:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6413E30A27F5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 14:26:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 920D14014A0;
	Thu,  7 May 2026 14:26:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8969340FD80;
	Thu,  7 May 2026 14:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778163981; cv=none; b=nw2MAXeX0OKtNNq2+QfdNuJllfCTBvrZC6SGLUz61pFfQRBKihU9J3HR/bZmPlPMMmRdejQcTk12s2LNePvyS2xgscrxHH9cbNxPwzaCzxLofvZrdeM7Hx7FB2aRV8UaigAfD2vBbcmwE4gwMihrjWZfnvWP+8mmOrla15dWBX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778163981; c=relaxed/simple;
	bh=s1q8Z2zLk379tlyeuEzoNaf2j3FUEhXmKv5Jezkio8k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qUitmJd3onPm8gzwGLgyCfuoxbiwJOYXc4Ojd/rjPfmqiKL3mehWb6FiJ1N1XE1Atll9BiuMs7Jr6IO+V3fhWjpPp7rajYTAiRZQEw3A0HrhluLm8TwJAQ9D/LcAJKgJwKn16PS7KWUj4dcIjPLSCXBbtbGYLzvCaw8GNOammrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: esmtpgz12t1778163927tf302c174
X-QQ-Originating-IP: 6pNkx+/7pJSdKrmK5R1qZXvcMjj4jKpdhHhLnPpID5o=
Received: from [192.168.30.32] ( [116.234.74.217])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 07 May 2026 22:25:26 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7635637047860514937
EX-QQ-RecipientCnt: 11
From: Xilin Wu <sophon@radxa.com>
Date: Thu, 07 May 2026 22:25:14 +0800
Subject: [PATCH 3/3] arm64: dts: qcom: sc8280xp: Add reg and clocks for QoS
 configuration
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-sc8280xp-qos-v1-3-15135858cd98@radxa.com>
References: <20260507-sc8280xp-qos-v1-0-15135858cd98@radxa.com>
In-Reply-To: <20260507-sc8280xp-qos-v1-0-15135858cd98@radxa.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xilin Wu <sophon@radxa.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6485; i=sophon@radxa.com;
 h=from:subject:message-id; bh=s1q8Z2zLk379tlyeuEzoNaf2j3FUEhXmKv5Jezkio8k=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDJl/Fpw9mCc9Oyk0sXTFFobP0hNKWSPaTMI38X80V77xP
 zJu1WfHjlIWBjEuBlkxRRaFeIa57JW5156KlerBzGFlAhnCwMUpABNpXM3w35Gh4foRLqV7L3x3
 9emV99+1F9Hbnpqj5fv/Zx7johnvuBgZJmdxG20u03Litv0mFed6dcrVMIecoM2/FR/2CP6Yqyr
 LDwA=
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: MLY6kX+APjAQ3XvEyTG3A63TZMprpixo0rLkwGVpgV89wUgZlq80gsoY
	trJji5sKrFe9T+X1v4Td+aWT40V/Jo7SplzX0Rg78P4eQICRlMEH6pc44zqqzah7lV9bS6P
	M38gjS2l0s9iKQSiW4wQNoFfF/RB9F0UlrrFvCszLpYUQqZjZ2tS6k/MnVokeSbp0b6BYVc
	dz6l2kSWUBfSV44CmWOdlsHenM67fTHjpCm8JCPJU5beswC0CcOOg3ZsLhmRos2r4CpCKlH
	XZHs9iOET5lcogIZ4JjwIqKDooUudiSWUdPv39+u8LjJm6OTKSN+v4N80c0SkfxkRKo1GPs
	5l3vqNxPpQE5Ako6nZqn8cuGAc7w49E9duNcSlM3rmMT9HxcikO1+IPZDcVk4H1XkINFuCU
	H3q4PyNTAKqqCyJCrDH7StZMjK6uaSriL9Ml0DSUvnGQqELAgYBsKEC68UtyTuKzqB75ZHC
	C7BCmT2uLHrrT1/Jrdy5QSgrOP9+EQytpryW2Y7RjnoJA4f9Ulae5PcOLd70s6C9+owd2AA
	NHU8W/48LBrlDI5BjIgt6FVrXo4rYW8xhC+5RfksE+P2+rkEgvgXfX/BdgXwhoTNn5Qma+3
	QTfYVZqMRJTwP5/t8fVJnXLCV7EgF/MlePmoSJxWyfE47/FOrREzKFzf1VdCSRFWOlRj/ZC
	eHkX+xrOImIAseSz1v5zigad43JfgMBkjgO8Tgk6w0xeOaH8zHO4KCCrKo0S3AruM2p8d0F
	/xsS7BYkcP1Zmx8oOkdrlVVn5Sv+R5opWDy5U1HxutGlPrY/FvF3TFa0fDh55yVrK3fQwpI
	em0YS7PJZMV1ymTTRlz13b7FpfA+tDd4zc96EuU2U4lV2Egw+Ntln3f+00tBB6uPOSeaOoP
	MTjmi11hxg78jfkrgSaNsHx1WDSz1tDZUFfFHYPV5VJALy+nfpkhzADd9LzOR0pz5zBoR1g
	LrXKDVzpTdjZsiwqWQpW3gMghQnGnwv4aTzF1JzYlTc5NRam7blmabRAMLjxlC0OE5TlC9t
	/MC+OH6qwlJ8qES3YfpJD2E/PW845zg3BsWjDKflwKZlHZPyelgVmrwAusmTYwRZrXj1Xk3
	qTF0c0WOmFh
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0
X-Rspamd-Queue-Id: 3A73E4EA3FF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[radxa.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_THREE(0.00)[4];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sophon@radxa.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-106440-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Action: no action

Add register ranges for the SC8280XP interconnect providers so the driver
can program the NoC QoS registers.

Move the real NoC providers under soc@0, keep clk_virt and mc_virt as
virtual top-level providers, and add the clocks required for QoS
programming on aggre1_noc and aggre2_noc.

Signed-off-by: Xilin Wu <sophon@radxa.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 157 ++++++++++++++++++++-------------
 1 file changed, 97 insertions(+), 60 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 761f229e8f47..8e64db07a9e9 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -314,78 +314,18 @@ scm: scm {
 		};
 	};
 
-	aggre1_noc: interconnect-aggre1-noc {
-		compatible = "qcom,sc8280xp-aggre1-noc";
-		#interconnect-cells = <2>;
-		qcom,bcm-voters = <&apps_bcm_voter>;
-	};
-
-	aggre2_noc: interconnect-aggre2-noc {
-		compatible = "qcom,sc8280xp-aggre2-noc";
-		#interconnect-cells = <2>;
-		qcom,bcm-voters = <&apps_bcm_voter>;
-	};
-
 	clk_virt: interconnect-clk-virt {
 		compatible = "qcom,sc8280xp-clk-virt";
 		#interconnect-cells = <2>;
 		qcom,bcm-voters = <&apps_bcm_voter>;
 	};
 
-	config_noc: interconnect-config-noc {
-		compatible = "qcom,sc8280xp-config-noc";
-		#interconnect-cells = <2>;
-		qcom,bcm-voters = <&apps_bcm_voter>;
-	};
-
-	dc_noc: interconnect-dc-noc {
-		compatible = "qcom,sc8280xp-dc-noc";
-		#interconnect-cells = <2>;
-		qcom,bcm-voters = <&apps_bcm_voter>;
-	};
-
-	gem_noc: interconnect-gem-noc {
-		compatible = "qcom,sc8280xp-gem-noc";
-		#interconnect-cells = <2>;
-		qcom,bcm-voters = <&apps_bcm_voter>;
-	};
-
-	lpass_noc: interconnect-lpass-ag-noc {
-		compatible = "qcom,sc8280xp-lpass-ag-noc";
-		#interconnect-cells = <2>;
-		qcom,bcm-voters = <&apps_bcm_voter>;
-	};
-
 	mc_virt: interconnect-mc-virt {
 		compatible = "qcom,sc8280xp-mc-virt";
 		#interconnect-cells = <2>;
 		qcom,bcm-voters = <&apps_bcm_voter>;
 	};
 
-	mmss_noc: interconnect-mmss-noc {
-		compatible = "qcom,sc8280xp-mmss-noc";
-		#interconnect-cells = <2>;
-		qcom,bcm-voters = <&apps_bcm_voter>;
-	};
-
-	nspa_noc: interconnect-nspa-noc {
-		compatible = "qcom,sc8280xp-nspa-noc";
-		#interconnect-cells = <2>;
-		qcom,bcm-voters = <&apps_bcm_voter>;
-	};
-
-	nspb_noc: interconnect-nspb-noc {
-		compatible = "qcom,sc8280xp-nspb-noc";
-		#interconnect-cells = <2>;
-		qcom,bcm-voters = <&apps_bcm_voter>;
-	};
-
-	system_noc: interconnect-system-noc {
-		compatible = "qcom,sc8280xp-system-noc";
-		#interconnect-cells = <2>;
-		qcom,bcm-voters = <&apps_bcm_voter>;
-	};
-
 	memory@80000000 {
 		device_type = "memory";
 		/* We expect the bootloader to fill in the size */
@@ -2152,6 +2092,63 @@ rng: rng@10d3000 {
 			clock-names = "core";
 		};
 
+		config_noc: interconnect@1500000 {
+			compatible = "qcom,sc8280xp-config-noc";
+			reg = <0 0x01500000 0 0x2c000>;
+
+			#interconnect-cells = <2>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		system_noc: interconnect@1680000 {
+			compatible = "qcom,sc8280xp-system-noc";
+			reg = <0 0x01680000 0 0x1a400>;
+
+			#interconnect-cells = <2>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		aggre1_noc: interconnect@16c0000 {
+			compatible = "qcom,sc8280xp-aggre1-noc";
+			reg = <0 0x016c0000 0 0x3af80>;
+
+			clocks = <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
+				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
+				 <&gcc GCC_AGGRE_USB3_SEC_AXI_CLK>,
+				 <&gcc GCC_AGGRE_USB3_MP_AXI_CLK>,
+				 <&gcc GCC_AGGRE_USB4_AXI_CLK>,
+				 <&gcc GCC_AGGRE_USB4_1_AXI_CLK>,
+				 <&gcc GCC_AGGRE_USB_NOC_SOUTH_AXI_CLK>,
+				 <&rpmhcc RPMH_IPA_CLK>;
+
+			#interconnect-cells = <2>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		aggre2_noc: interconnect@1700000 {
+			compatible = "qcom,sc8280xp-aggre2-noc";
+			reg = <0 0x01700000 0 0x3af80>;
+
+			clocks = <&gcc GCC_AGGRE_NOC_PCIE0_TUNNEL_AXI_CLK>,
+				 <&gcc GCC_AGGRE_NOC_PCIE1_TUNNEL_AXI_CLK>,
+				 <&gcc GCC_AGGRE_NOC_PCIE_4_AXI_CLK>,
+				 <&gcc GCC_AGGRE_NOC_PCIE_SOUTH_SF_AXI_CLK>,
+				 <&gcc GCC_AGGRE_UFS_CARD_AXI_CLK>,
+				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
+				 <&gcc GCC_DDRSS_PCIE_SF_TBU_CLK>;
+
+			#interconnect-cells = <2>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		mmss_noc: interconnect@1740000 {
+			compatible = "qcom,sc8280xp-mmss-noc";
+			reg = <0 0x01740000 0 0x1fa80>;
+
+			#interconnect-cells = <2>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
 		pcie4: pcie@1c00000 {
 			device_type = "pci";
 			compatible = "qcom,pcie-sc8280xp";
@@ -3352,6 +3349,14 @@ lpasscc: clock-controller@33e0000 {
 			#reset-cells = <1>;
 		};
 
+		lpass_noc: interconnect@3c40000 {
+			compatible = "qcom,sc8280xp-lpass-ag-noc";
+			reg = <0 0x03c40000 0 0xf080>;
+
+			#interconnect-cells = <2>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
 		gpu: gpu@3d00000 {
 			compatible = "qcom,adreno-690.0", "qcom,adreno";
 
@@ -3927,6 +3932,22 @@ opp-6 {
 			};
 		};
 
+		dc_noc: interconnect@90e0000 {
+			compatible = "qcom,sc8280xp-dc-noc";
+			reg = <0 0x090e0000 0 0x5080>;
+
+			#interconnect-cells = <2>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		gem_noc: interconnect@9100000 {
+			compatible = "qcom,sc8280xp-gem-noc";
+			reg = <0 0x09100000 0 0xb8400>;
+
+			#interconnect-cells = <2>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
 		system-cache-controller@9200000 {
 			compatible = "qcom,sc8280xp-llcc";
 			reg = <0 0x09200000 0 0x58000>, <0 0x09280000 0 0x58000>,
@@ -5977,6 +5998,14 @@ cpufreq_hw: cpufreq@18591000 {
 			#clock-cells = <1>;
 		};
 
+		nspa_noc: interconnect@1b0c0000 {
+			compatible = "qcom,sc8280xp-nspa-noc";
+			reg = <0 0x1b0c0000 0 0x10000>;
+
+			#interconnect-cells = <2>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
 		remoteproc_nsp0: remoteproc@1b300000 {
 			compatible = "qcom,sc8280xp-nsp0-pas";
 			reg = <0 0x1b300000 0 0x10000>;
@@ -6112,6 +6141,14 @@ compute-cb@14 {
 			};
 		};
 
+		nspb_noc: interconnect@210c0000 {
+			compatible = "qcom,sc8280xp-nspb-noc";
+			reg = <0 0x210c0000 0 0x10000>;
+
+			#interconnect-cells = <2>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
 		remoteproc_nsp1: remoteproc@21300000 {
 			compatible = "qcom,sc8280xp-nsp1-pas";
 			reg = <0 0x21300000 0 0x10000>;

-- 
2.54.0


