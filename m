Return-Path: <linux-arm-msm+bounces-117449-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id e11lH8adTWrP2wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117449-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 02:45:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CACF2720AFE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 02:45:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=o2tTl8Fh;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117449-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117449-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C376130570DD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 00:44:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A29B7366564;
	Wed,  8 Jul 2026 00:44:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0654C368D42
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 00:44:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783471470; cv=none; b=Rsx3MhEsxqA4FkZXNsaeE93fo3GePGORtdSFYdz6smnOB9Eg1xmGU4xZgyrG+7iPZkjJzgToopZO94gJMpeVibZmRH8hZiv7VHLAviuqH9uVUiJ00lYZMNC31dcDeRkPtDosmlonBTU2xesjcBNi6duQPAjShDL250vb1T/Yry0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783471470; c=relaxed/simple;
	bh=mZln1b3un7cbjtyyqStjeOQ9net19lXjFVDIFyOquDo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WvJG4kjtRAlhssQWT4Dktg+SAXaSi9kttXGi0y6kFBj/VkRUz4GtiJFYOROPGH/4T11tDVpE81xqmZATGkEgvziJIpQ14d9Kdz3INITSorEK51/neEpb8s7e//SEM2BidVX2C3dU8W3qoMoqVZvTs420f0UCwM9It0KweVPXyiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o2tTl8Fh; arc=none smtp.client-ip=209.85.128.43
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-493b1710405so352185e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 17:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783471467; x=1784076267; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vFyMS9ddI0aj7oPecUMKa8Hkd0I3JDhzdUVh4YXV1qM=;
        b=o2tTl8FhNQPiVseHxIWJ2JtSGlRtYXQu46IVXcE/sHaoRdPH0/snFtTi4uTVoNOr6i
         WUxLzxK/KTQwFObMQbUTjAbO7e6kFkskXMs6jxo8/ZGvs9jZgaoXWd57DHy3Oc0BNalm
         QJUUnm44/dQxwcN9OH9QPG6xp0coMRlol8udD8w73yhRMRE/oCQeX64G3BH9oonzTVdu
         TEsrb+Vgh/DKe883blGOJGG3EVvjH0jThbH9fy4gsxjcq26QZr5GOL96rqO93YnaLNsv
         3dc0a5jMH8BLAh4HzLTk0cH2T/yXmb8vcOmmXfBz7Ss/wjxMwk4HZ5rSPiXHEKHyB0JB
         pGNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783471467; x=1784076267;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vFyMS9ddI0aj7oPecUMKa8Hkd0I3JDhzdUVh4YXV1qM=;
        b=C37WiaTGJV9R2OgNAofRRCLuk0UyGHi7X9fk/AcEF8TCWwZZ3nTWNLVy9+2pucsGXd
         megQgWcXh08qRHasmzxwcbCsN8hn/uHpzJRrNQIJysuzOCyX0G4C6mSY9p0YQqe58PqW
         ovcNF1IlgLsI5JZ/qgP754qs23VlDDThBi+CW5o2rPXyW2u1cJnjF74DQMRisFuAThJ4
         5V51GxEfvYtpbw4/B/NPHmVcyAWkKWC64EgCTKg0DfqL5xFY8N3Q+VkE0lRPLc0TV5kw
         pnUOGKc/dbE5bh8MdAH0/DE7glApkbn5Wjar6k5c+sKNEc92Db1fnXe/Milm6tC2JX7F
         2ccw==
X-Gm-Message-State: AOJu0YwhBGAHSeoOql583eFbtPMEcIBqBUG6A3CbDkkXYj3zYufI5uar
	aMDq68tEc7/OTVIR0h0dsHqf/LatmoSY3dP+Ftn8M5dD9ESylPFmhP9G/L0IqnqsyPo=
X-Gm-Gg: AfdE7cmLS1aalhTSY4TaLY+Xfn/+w1M2kiiS0PcjG13BAMaSsZptcK8ol3jTUPXiZQN
	PwFoq1aecBYTpjez3BhOP/7qZEDi3dtM/T57G6BGqSAKmFAD/HrD3UB0HfpzGWCUCKInCZcM6nU
	sdXgN6Vj3AjLPnFjyGUcvYYy5xP8/rYSiNd37+TWgs6yOuBAB54iJS+P9vYVzeC44I1ePN+3/RB
	1tdyo0e7xWiFpxToxtbyVR1KQHct3iI9gAvhm+Tm3JH6OiFnjQ6aBDunUaVGrhqlsFQqngsgiEB
	8r6UP1mSUXTC2tmqVrnNwSWuGmgarbKl0eDC0xl4jXP3xGFMo+/g4E9vFxpg+8X26DRUTIvAddC
	3ajSy7WMyJSn1YKVn1/XDgA0UlCBnGV9MG/uGayfnNh/FufiCWADfvr7GztNqPL5a4qzdtwDQaM
	QvLZbkc1CzF5oplzeTCosKkww=
X-Received: by 2002:a05:600c:8486:b0:493:e365:7630 with SMTP id 5b1f17b1804b1-493e6844d66mr2085525e9.14.1783471467426;
        Tue, 07 Jul 2026 17:44:27 -0700 (PDT)
Received: from [192.168.0.35] ([109.77.92.41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0fc1348sm99727985e9.14.2026.07.07.17.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 17:44:26 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 08 Jul 2026 01:44:12 +0100
Subject: [PATCH v4 05/11] arm64: dts: qcom: x1e80100-crd: Add ov08x40 RGB
 sensor on CSIPHY4
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-x1e-camss-csi2-phy-dtsi-v4-5-572348ad1b2a@linaro.org>
References: <20260708-x1e-camss-csi2-phy-dtsi-v4-0-572348ad1b2a@linaro.org>
In-Reply-To: <20260708-x1e-camss-csi2-phy-dtsi-v4-0-572348ad1b2a@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2881;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=mZln1b3un7cbjtyyqStjeOQ9net19lXjFVDIFyOquDo=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqTZ1csJSnbxl5DRubtGvijMMbOErwHClEpxdoA
 +LAbNUbn8mJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCak2dXAAKCRAicTuzoY3I
 Ohn3D/409TEySLFfraVAwgFFRFVLmHeIVQ51iX4GEnIRDnAM4LuI84WtZEwzRT3etLtBunX+GUK
 kVD797sKMUNZe7hG2y3j+p0lHc0khlOw/WjiSJlcCbH5Iep/CmXJYw6chVhQcqF3GB0TWfhc71y
 +XNnlxoDnNt3kJbBeO3596h5DjuiAE2RHgJ4cx5D7AIekX06AVykvlB8f1WR0yjvcnqZE4LPBZR
 +r1T7nmE49g7TTlB3K853AZKcCCNzKGSR+YwMvflH9z9aLPUYIKDRNnpHeIKdPYri3JaUpJ1CFJ
 5mFt5rELO611vbzfcL/FMWswKf1e7PUEytSk5p4fE+psxGgI2f2JK/589fKl9BEpe+iQnYNH228
 JEilXKsMzNUU43/D68rFsXpmBcHRyosqXZXFJutdnHLY4k62GzhmJjn0XJx4Ga2b/EHRTFCzl5I
 jeflxhcwUw+7I3UvskRGfrBBhmLEKveksu8GgmNVJ8WVJOpZ8NJ5xvLMYirQI0+NEvcfd7DiZvu
 FPdlauLUsCIn22kG9yIwfhP0f3Qi7KtkMgeHndVN5G9TMYaD7JCyAS5iK8Dexp1r+cC76udPTA8
 dkVF1uFc7xBHsIVNe12d8q4MrZbDgKqPVzs00sqwL8IuN1LqDBlxnH0Y3sQA/nHnPRrsUL8e7Kt
 nMQXcyUntrckDdw==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117449-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bryan.odonoghue@linaro.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:from_mime,linaro.org:email,linaro.org:mid,linaro.org:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CACF2720AFE

Define ov08x40 on cci1_i2c1. The RGB sensor appears on the AON CCI pins
connected to CSIPHY4 in four lane mode.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1-crd.dtsi | 96 ++++++++++++++++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
index 7b9a40a7b9a95..838ba830433d0 100644
--- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/gpio-keys.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/phy/phy.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
@@ -933,6 +934,85 @@ &gpu {
 	status = "okay";
 };
 
+&camss {
+	status = "okay";
+
+	ports {
+		/*
+		 * port0 => csiphy0
+		 * port1 => csiphy1
+		 * port2 => csiphy2
+		 * port3 => csiphy4
+		 */
+		port@3 {
+			camss_csiphy4_inep: endpoint@0 {
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&csiphy4_out_ep>;
+			};
+		};
+	};
+};
+
+&cci1 {
+	status = "okay";
+};
+
+&cci1_i2c1 {
+	camera@36 {
+		compatible = "ovti,ov08x40";
+		reg = <0x36>;
+
+		reset-gpios = <&tlmm 237 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&cam_rgb_default>;
+		pinctrl-names = "default";
+
+		clocks = <&camcc CAM_CC_MCLK4_CLK>;
+		assigned-clocks = <&camcc CAM_CC_MCLK4_CLK>;
+		assigned-clock-rates = <19200000>;
+
+		orientation = <0>; /* front facing */
+
+		avdd-supply = <&vreg_l7b_2p8>;
+		dovdd-supply = <&vreg_l3m_1p8>;
+
+		port {
+			ov08x40_out_ep: endpoint {
+				data-lanes = <1 2 3 4>;
+				link-frequencies = /bits/ 64 <400000000>;
+				remote-endpoint = <&csiphy4_in_ep>;
+			};
+		};
+	};
+};
+
+&csiphy4 {
+	vdda-0p8-supply = <&vreg_l2c_0p8>;
+	vdda-1p2-supply = <&vreg_l1c_1p2>;
+
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			csiphy4_in_ep: endpoint {
+				data-lanes = <0 1 2 3>;
+				clock-lanes = <7>;
+				remote-endpoint = <&ov08x40_out_ep>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			csiphy4_out_ep: endpoint {
+				remote-endpoint = <&camss_csiphy4_inep>;
+			};
+		};
+	};
+};
+
 &i2c0 {
 	clock-frequency = <400000>;
 
@@ -1553,6 +1633,22 @@ &tlmm {
 			       <44 4>, /* SPI (TPM) */
 			       <238 1>; /* UFS Reset */
 
+	cam_rgb_default: cam-rgb-default-state {
+		mclk-pins {
+			pins = "gpio100";
+			function = "cam_aon";
+			drive-strength = <16>;
+			bias-disable;
+		};
+
+		reset-n-pins {
+			pins = "gpio237";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
 	edp_reg_en: edp-reg-en-state {
 		pins = "gpio70";
 		function = "gpio";

-- 
2.54.0


