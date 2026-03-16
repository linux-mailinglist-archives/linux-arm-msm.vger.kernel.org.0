Return-Path: <linux-arm-msm+bounces-97761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJo0GjZZt2nQQAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 02:13:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C246029350F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 02:13:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 957AD301BF41
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 01:12:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A1FB2222CC;
	Mon, 16 Mar 2026 01:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Yw0pgsoH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A692623C4E9
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 01:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773623576; cv=none; b=sWt22pT0QNm+umCf00MirhJmhQvkfX0efiswxD0KCe5MOptc+/d3V1UXTM/9nOBLj52JfTlbIQ2crXv9xR/e1KRS/gvSEhSYyK2ss/Wr2Swodv3o//M5noH1xvjEb2hFiY11ptx+nUHCFtevoUCI3gwzMUZtYKvOnalGbrNZybU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773623576; c=relaxed/simple;
	bh=89pCG9foB/aUmIOQftGcQVpa85kxE85oYki4tXopqsk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=advGdrqRAfT9hP11NRC6CSY64DEwYJp/TFAWHJqioC5b6brGJ+Lir647arQS/8JACHg9bqKpgekgu459j8guXwDcfZIF8RzLwQ3xUAPCfKCl10mmInkzcogjpIy9cbMalxJsxk4cB15eoPDEuEaHVXOx7YwhxDHNq0p2FGLDONQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Yw0pgsoH; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48534b59cf3so35490275e9.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Mar 2026 18:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773623573; x=1774228373; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KvhMcTkFeg87VPIJT1Cy/Iqmh/F0pkytp6qTG1E/Oh4=;
        b=Yw0pgsoHCP5JEPyStciVDHBwaioHO+vJlOQ1dJMAbNH35gas1gpJyQU76R3op4FPAr
         dyNZVGWWDrtpLb6z/DRJNV7DzV/AT1SoN2f5JhkYbFsGuaRq2n+/7gjVtr2f3ep5eu9t
         9gCv1U+eKfSOuEbqqF6fvV51UzVC9ljipeq9qljNeG+3CtOMdjBeCwbQ0r2i/SbPoMJ1
         T4w39X7MOAFo4l+EL/cltFdXdFm/xzKPuFojI92qol9KwcovhnjP+I1WbpqsHiq4BKq4
         Wy+7NXWr0PeCBBSYvVEeXYw8WfT+FdfhzSo+Z/1yDjl0o9MgSZSG6b4TQkphSz0tYlKq
         BYng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773623573; x=1774228373;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KvhMcTkFeg87VPIJT1Cy/Iqmh/F0pkytp6qTG1E/Oh4=;
        b=JR9IQz1m73V8jpzYd8sFB62cZKEC+nOF7PRa879decnj8dFsLnQHWbgJ79iTaG005T
         pT5Thi5u4g9j00akM/HOYPv4Vc6j5bjxk2VyDW2DtcTAjll2l87IzKOnBgYPOwxLaj+n
         JB8auPAj/1U0aBqwu9WaSEA7mWtJyarYUQ8NBjifMTskXzF5u2s0fj6s2y3BfO1nz5GM
         8Jo7caq/skNkinzziSlL+lPQHHha5O2LykYF6ff/en8qPeMpYLaW0Bgg0HaGCml6WlBt
         ZeYIOh3tA/qtlPy5b2QLwg372fwBEkpUMnNE1GnJlEb6NgR5om6MCYDTKHI0heUeEVAV
         cTIQ==
X-Gm-Message-State: AOJu0Ywj2HD06nbSByzomM3WkIYAvHjhcvSkFFlkh05i0Xu9ONAKmB03
	8LK1aap8B6Ia8Oia7RNxd0iszGDZ7lLsoADLFXk2x8yZ/WEWeAOw9JhGWCNkhAAZoBc=
X-Gm-Gg: ATEYQzzdlU8zZ7el98EpiuWEsaMQq0O2ftAp8ZVwM00rsqQkoOQEi84YDZXVm7SphQ+
	1AapWljGRZfAb2cSm47fLNbwA+YJiOM53XhlV+zOi2nbwnn1wmuMyRFt4TXKVrONPnmf0RiDe/I
	bTeqjkd4up34IODa7UUYoJUtFvj50+6/RwKWnLt5hQ3yDEwRp8Sc2zn4wfbhJt8bkMiNT2NaXuc
	FLyeci46KiLoxQxkXfUmM1ucjVfMvpgHU/PWPGtER3g+UfCEdxHolh0Vb+TWzK4rtpyyOGbLup5
	NLZGklNpZknZfXV9/5jxpm4SjI5BWiml02m6L9RkRYEvVFGO+HOQLFQI3CMzi4dhogy8NB/2AU2
	n0kPElonWJx8qwtFzimtKE4m6qZM/qXF49574ysyQwPvVnpnhBehpRjfdV3r3noXnB7pAyv3mEv
	oFmB5rWJD4LUSJdZUMt+OaCQoiGbwKm2vqfVc=
X-Received: by 2002:a05:600c:c8d:b0:485:39d4:2dd9 with SMTP id 5b1f17b1804b1-48556711e98mr181894855e9.33.1773623573090;
        Sun, 15 Mar 2026 18:12:53 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.190.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541aba60esm560918225e9.5.2026.03.15.18.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 18:12:51 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Mon, 16 Mar 2026 01:12:44 +0000
Subject: [PATCH v2 02/11] arm64: dts: qcom: x1e80100: Add CCI definitions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-x1e-camss-csi2-phy-dtsi-v2-2-859f3fa55790@linaro.org>
References: <20260316-x1e-camss-csi2-phy-dtsi-v2-0-859f3fa55790@linaro.org>
In-Reply-To: <20260316-x1e-camss-csi2-phy-dtsi-v2-0-859f3fa55790@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5073;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=89pCG9foB/aUmIOQftGcQVpa85kxE85oYki4tXopqsk=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpt1kZacTF1LuRO6Z6KnPeg91x2OYB39LuJnGRJ
 M7dAE5ebguJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCabdZGQAKCRAicTuzoY3I
 OrttD/oCHB2RG1P3vynPmokNxiXWOghFaN3WbNt+slQm2gMnZ9SzdccxYuKYEdzOh86dslRvuEn
 QH1/VuTYYjunLMV2lqFujrTs6BazBANQOkQLSjezCzDYEdGoGQRUMdb+/EBrflvIcMNOnmQECcg
 CTfFWytYw1tApr6ohpGl7eJP5f+Om34LsWlGJ7Yi9nC+3RtuvOcfKTP5lx2J1YN81gRq6ga8bkC
 TrBKhjc6IXBuzUtJlPSYcxKtgiMIHbtD+QVQxTb7d7+QtF4eIfs8u22VUXduG5vDXaknbEUIkFE
 92ertnqyKvAFqXHdguRJIjoB+GGPtHaupINwUCdotT31J8BGt109JqctRiDqWPKDXdE3cfD4gde
 NT2W1bszLcPuAdPM4C4lzgCdyiE3TJhp6qV1uiuUsWd5HdjFPe/0o1qEUUlYcUq2MlI7ZIVywyo
 t1YGw+UOVJ4hQfLX/P6jtL+8/f5wHh5Z4O4vLWiNQvKVTYH0g9EbTKbxtoV+UdTXjPu6N57p6TJ
 TuZeSSNxxySqdXVGbXkACDfVTTFxFDEOqf6rMxEYHIIyqWhHcPoquieq8UO8B4VQhKGThRN077U
 09FkZgSqOt3e7oCBm6YZLSpHLJ1L6ihqmaKtBmku+GbQJa7oZLESZyqCk7PBXuH92xw2Fzn7PpV
 WdnUW1VTImBzi2w==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-97761-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.1:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ac15000:email,aaf0000:email]
X-Rspamd-Queue-Id: C246029350F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 150 ++++++++++++++++++++++++++++++++++++
 1 file changed, 150 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 029ec012d0a94..38f9da6ad9ca5 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -5465,6 +5465,84 @@ videocc: clock-controller@aaf0000 {
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
@@ -6115,6 +6193,78 @@ tlmm: pinctrl@f100000 {
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
2.52.0


