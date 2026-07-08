Return-Path: <linux-arm-msm+bounces-117446-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7ncZM5SdTWrA2wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117446-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 02:45:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C74A720ACB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 02:45:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=Mc5CUGrv;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117446-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117446-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 73BCB30470C3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 00:44:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96E9536A344;
	Wed,  8 Jul 2026 00:44:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570FB36A370
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 00:44:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783471465; cv=none; b=cgEr6HxSjG4NdaGh7LA53Ufokz716ffgmXQAox1VRQktpO4vqIM3aG0NGQiNeQegAZIPyhIF0WgdkLbufddh2TjXS9S20Q94RWklTZaQFOIv7kRZz/lLimzPOOlAGuy5YljJRlwBkJMpJG4DRT2C8/+dQ9XbbIoxYZX0JIz3XAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783471465; c=relaxed/simple;
	bh=NFCULpzSRjECzVlGvUwWPvWRDgzlp9R6F9Sy+uS9w/E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XRSq2Oz+oIHXLcKLB81t1VGWGHpzyODVtYaNLVhTHyV41KPjEfZe8QHpSznbph3Gb2zg7Iraxq2b6J76tOmq6n7Qrv8nnCWA5lfsLm9vhvEDbIj10jjUZx0vkp6ltJzI/vCP3dGVZk7vM8NNva8G1kP3sR2OH19tdLN2R96FRmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Mc5CUGrv; arc=none smtp.client-ip=209.85.128.50
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493ba701891so618845e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 17:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783471462; x=1784076262; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TyBwsulYkPGNh82Flz8VkrGYyu0iw+yuSg8oZwZidi4=;
        b=Mc5CUGrvxSHfNudsjS/bzvN6PdVVgB7ZY3lxqQo46pJKxLKW6e2p6XXiTdcVLSw04z
         n4TUkxFzcN+jiY7Vn2+3GjB2PZRNo7KtxvjHVsYL86Cd5uAWWjI5oZdz9MYsITSzyES2
         RPXeiLEI/qT/vjpnGy0M3chU74sYhy6g0JI+dOt7tdRp9Mcq7pszAF4s7hAxjtnWLmk6
         EBNw/Kg0g5z4W94rksZzLQ+CiLoqgTwU/PffHNGPK6L6D4meNANgqBVSJRts+NP2MN4r
         PESVtpCNqhsIOZjEDypFSmwfeuEkGcLTNLwH+bAW1V9pG4x2tRNq5MgXi8xMxDXbGm54
         kfaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783471462; x=1784076262;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TyBwsulYkPGNh82Flz8VkrGYyu0iw+yuSg8oZwZidi4=;
        b=P7wUpfoRhbSHAqogMoyDnu8sOc7d0jJW63niItQ+0JtBxxpbdLIA166/4NSRbIn3Wd
         WY1m6W60wK61U2o1+PVaykkOFsZ/KLlqQu7Slckz/qdzExNM7oBfWJoBOH6KCrhtxLFY
         WwHSk2ga/Wzi/7Z/k+9dItUMybnAeXdnsxvjr0zKwQXfskw4IZRMjEsJv2Arh8tKB/om
         xN/cFnPZoiwfzOECVcNARwTPSTzaBc4/RDbrbfvSCUxzPxvNoEUydMKHR0C2hjYRFCjo
         Hxk8LlRDkiwPVOXyAUzaoy1fDEwR1MJYEJLqntSuw2h9G7ZMbnxDpZBziJvTHqNH7i5b
         I3Bg==
X-Gm-Message-State: AOJu0YwqJzwPq3qzAMe90F8kl7kEPzVj7fMQsEpGNW/t6rz9L6gcDqIq
	ZQvSmMh7rpFHNim1ZGLcXBIfY6fsZhOdUJRV2Q351a/GHSJzyodtgjXWi95NIh6iv9s=
X-Gm-Gg: AfdE7cmf9dokYJ5v0nHhVOENbshEx+TjQF/fQX91nIdLlodfYuQAGj7iR5rNf6BFmHk
	f0n0QYDp6fNmshDctuY/DpOOUeyfijli6w1x6oEjBu4o0+g8vBmX31XYl2fHsdaFh6iD9EVgSZV
	q1Rc/LHAqoyW5UTyCTzDqh9xqmHpCT4A60TsAJ+Okc9Q0Z0nfR6QK+nhTIW6LpgLBNsFu2ux13j
	Mha9yLNfEb4cuAwQZJP2iB8cWAx5l4ZnUq5wcd+t/Z/fSCN4d2nBB6l5Yrf6+qUu99fJXSZ79wh
	MRguNd8AvexjxrvjMjI4+YsI3Gb+pJCHO5exn2tlpto4H6b5kxvDI50vZB4jbBn15gL85Ydaq/H
	mAre5OGz6yaxv4vA9GQO0WRc0BvooQP/48ttIDU7yW1manevEkzpBAqYUIZIzyzwWokqC57Jh/i
	3kFoJdUsWLyKAwg8LTtN3x/WE=
X-Received: by 2002:a05:600c:c167:b0:493:dfc8:77d6 with SMTP id 5b1f17b1804b1-493e6894732mr1947095e9.12.1783471461674;
        Tue, 07 Jul 2026 17:44:21 -0700 (PDT)
Received: from [192.168.0.35] ([109.77.92.41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0fc1348sm99727985e9.14.2026.07.07.17.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 17:44:20 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 08 Jul 2026 01:44:09 +0100
Subject: [PATCH v4 02/11] arm64: dts: qcom: x1e80100: Add CCI definitions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-x1e-camss-csi2-phy-dtsi-v4-2-572348ad1b2a@linaro.org>
References: <20260708-x1e-camss-csi2-phy-dtsi-v4-0-572348ad1b2a@linaro.org>
In-Reply-To: <20260708-x1e-camss-csi2-phy-dtsi-v4-0-572348ad1b2a@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5126;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=NFCULpzSRjECzVlGvUwWPvWRDgzlp9R6F9Sy+uS9w/E=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqTZ1bTLfReG5P5FbPFDIuxHQipmEWLb2+0PLSO
 nS67ohetgCJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCak2dWwAKCRAicTuzoY3I
 OhSpD/41+Rz8EY5a/BArbJmsFZddNdR4KlrNPqkLEU9WSqVMMs2sBtlwBo+4xKQ0QlUQi09CPnL
 K0UTL/FzgSxI3p0Sq3w9IAOk9nDci0iwaBgrqA3ZjhHm+1PwHf/j7cn0b1W2IP/n4GBHBSvHm0e
 SU+G1m3sm9o3GQ8cdKkZ394GCivIMC2FTcD/p7iaXXqb/H1vMg5ckDuLqNylfsHhfEWEjsocY6H
 DzKRAFs97E0rktbZWl4ehG2cfmF+RGO/ezqKOsy7pKk7nlL7DSmAz3dcfoVsm2S+Wxp9IyRLOOW
 kWrGxyjr+GHlfrC+BzMonhdjpR/AvKEsdBTwYqkgg+ARVlBpHruP+bEx62BSr5PISDgovTh0ovE
 vW8KXDkvTnH1dKEzmYt+ufY5V5PId4W4/1+rSvP5WfSvBCbyWBnbTyRnsoCoZXqYQqqzYoG7yRf
 WNDI8VpzQoneNdXXpwQKO5m0gh7W2lbCrbukhQm1TLcS+uWVh8ca0On29ZgJ/D+gwKNIYvAq5GI
 Px7WoJ9aHYY54Pj1P/ogF2OHTrSvbZL1RPkWhqT4f+WndhyWqz0TdWL/hD6X5vV7QFMXiolKAuw
 JJjAwB1jlv++G1YI3F9b3t7gkPCkHIrYoKIChmIOOlmg+IiLkzpPjONGrCGvio23tXEs0+O8wUz
 2wL6ad1dTmhB4kg==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117446-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bryan.odonoghue@linaro.org,m:konrad.dybcio@oss.qualcomm.com,m:vladimir.zapolskiy@linaro.org,m:abel.vesa@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:from_mime,linaro.org:email,linaro.org:mid,linaro.org:dkim,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2C74A720ACB

Add in two CCI buses.

One bus has two CCI bus master pinouts:
cci_i2c_sda0 = gpio101
cci_i2c_scl0 = gpio102

cci_i2c_sda1 = gpio103
cci_i2c_scl1 = gpio104

The second bus has two CCI bus master pinouts:
cci_i2c_sda2 = gpio105
cci_i2c_scl2 = gpio106

aon_cci_i2c_sda3 = gpio235
aon_cci_i2c_scl3 = gpio236

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 150 ++++++++++++++++++++++++++++++++++++
 1 file changed, 150 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 9a8d6f020a391..9a854da9550c3 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -5551,6 +5551,84 @@ videocc: clock-controller@aaf0000 {
 			#power-domain-cells = <1>;
 		};
 
+		cci0: cci@ac15000 {
+			compatible = "qcom,x1e80100-cci", "qcom,msm8996-cci";
+			reg = <0 0x0ac15000 0 0x1000>;
+
+			interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING>;
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_0_CLK>;
+			clock-names = "camnoc_axi",
+				      "cpas_ahb",
+				      "cci";
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			pinctrl-0 = <&cci0_default>;
+			pinctrl-1 = <&cci0_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci0_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci0_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		cci1: cci@ac16000 {
+			compatible = "qcom,x1e80100-cci", "qcom,msm8996-cci";
+			reg = <0 0x0ac16000 0 0x1000>;
+
+			interrupts = <GIC_SPI 271 IRQ_TYPE_EDGE_RISING>;
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_1_CLK>;
+			clock-names = "camnoc_axi",
+				      "cpas_ahb",
+				      "cci";
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			pinctrl-0 = <&cci1_default>;
+			pinctrl-1 = <&cci1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci1_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci1_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		camcc: clock-controller@ade0000 {
 			compatible = "qcom,x1e80100-camcc";
 			reg = <0 0x0ade0000 0 0x20000>;
@@ -6148,6 +6226,78 @@ tlmm: pinctrl@f100000 {
 			gpio-ranges = <&tlmm 0 0 239>;
 			wakeup-parent = <&pdc>;
 
+			cci0_default: cci0-default-state {
+				cci0_i2c0_default: cci0-i2c0-default-pins {
+					/* cci_i2c_sda0, cci_i2c_scl0 */
+					pins = "gpio101", "gpio102";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				cci0_i2c1_default: cci0-i2c1-default-pins {
+					/* cci_i2c_sda1, cci_i2c_scl1 */
+					pins = "gpio103", "gpio104";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci0_sleep: cci0-sleep-state {
+				cci0_i2c0_sleep: cci0-i2c0-sleep-pins {
+					/* cci_i2c_sda0, cci_i2c_scl0 */
+					pins = "gpio101", "gpio102";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				cci0_i2c1_sleep: cci0-i2c1-sleep-pins {
+					/* cci_i2c_sda1, cci_i2c_scl1 */
+					pins = "gpio103", "gpio104";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci1_default: cci1-default-state {
+				cci1_i2c0_default: cci1-i2c0-default-pins {
+					/* cci_i2c_sda2, cci_i2c_scl2 */
+					pins = "gpio105", "gpio106";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				cci1_i2c1_default: cci1-i2c1-default-pins {
+					/* aon_cci_i2c_sda3, aon_cci_i2c_scl3 */
+					pins = "gpio235", "gpio236";
+					function = "aon_cci";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci1_sleep: cci1-sleep-state {
+				cci1_i2c0_sleep: cci1-i2c0-sleep-pins {
+					/* cci_i2c_sda2, cci_i2c_scl2 */
+					pins = "gpio105", "gpio106";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				cci1_i2c1_sleep: cci1-i2c1-sleep-pins {
+					/* aon_cci_i2c_sda3, aon_cci_i2c_scl3 */
+					pins = "gpio235", "gpio236";
+					function = "aon_cci";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
 			edp0_hpd_default: edp0-hpd-default-state {
 				pins = "gpio119";
 				function = "edp0_hot";

-- 
2.54.0


