Return-Path: <linux-arm-msm+bounces-100305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2PjVIemBxmnQLAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 14:11:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 685F1344D2C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 14:11:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C64EE309A7A3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 13:07:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D5AD3E9585;
	Fri, 27 Mar 2026 13:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b//2ncFG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2816D3E8675;
	Fri, 27 Mar 2026 13:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774616830; cv=none; b=BU43kWOjey44MXrCtflt4XKvHdYfbQ4jhkqxHVfrbCb2HB11j7B0My48d9/b1XQEeTDtSh/uWzG7v+J4dL7dBi4Xp6MOZ4nN3gGrjJ76Zm2Bke5YhIRHDdKgNXpITNNxMW04w2NmCHubTHsPn2M7NYmj6ZfhFiZaK2Kg7mXeb/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774616830; c=relaxed/simple;
	bh=1RuCyC0Y29MQmA/I/TR5dpfX8DVivwLP+vb4lQF4CU0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pr2d/pPF1zOb39oDV3eSVxsc1CeT9OG5wSgz1fPe04y4CFBO7QmCTtLKyhts2ynN534ptDYGKUmJZlz8E3LZ5RVGUWASW1P5JMKcZAuyi7PrFwY7q4uHzHILxPmOdiRks164d7miIXIO/hioa4Ftc+mbF5estSeuxEVmbCHngFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b//2ncFG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CA00FC2BCB1;
	Fri, 27 Mar 2026 13:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774616829;
	bh=1RuCyC0Y29MQmA/I/TR5dpfX8DVivwLP+vb4lQF4CU0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=b//2ncFGeFcLl/ZyyWFP8vbCptCasg3ysIEBSPiJs05Nu1P+tiTA/rPldG/L3nSHZ
	 CO8fK2i24cNAiYB/V/j42XOOGgQiR70gBoVay6U7iXhUzfb1e8s/Fj1f/OfSopmcF6
	 snclzVpDSN5JtPglwP4RdkDu8xCxeWBhTfyITIRIxAXzo4APcpEr2cP3T/ueNLUs3B
	 j0NvPNMgUQK5r1o1O5j5efjIj7DUOAr6y5+HY+7gadMh9dcKBmTUsc+h6d5dSZq4yg
	 3N4CoTRf7p2xX107l5Ll3m9DJP0Fcatyn9k6Y3g7AjHg07C8g5w5z/GdrodXc/wdi6
	 ztYrOTjF4Z2Ow==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C004010ED677;
	Fri, 27 Mar 2026 13:07:09 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Fri, 27 Mar 2026 14:07:09 +0100
Subject: [PATCH RFC 2/2] arm64: dts: qcom: sdm845-oneplus: Describe
 Wi-Fi/BT properly
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-wcn3990-pwrctl-sdm845-v1-2-3f5c34e3fdd0@ixit.cz>
References: <20260327-wcn3990-pwrctl-sdm845-v1-0-3f5c34e3fdd0@ixit.cz>
In-Reply-To: <20260327-wcn3990-pwrctl-sdm845-v1-0-3f5c34e3fdd0@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Paul Sajna <sajattack@postmarketos.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3019; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=NCuUO0OX7Mr016a4HOAuAhnhl+ajm2fLd9iQQBmLAt0=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpxoD8Qe4h2VZLhPgPoUe4sAXGVqdILj/8ed33v
 db8HIPKYVuJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCacaA/AAKCRBgAj/E00kg
 cvgpD/0bABCwRGI5o4Z960vl++GWAX4kCXkOXuW3WQNFLlMPU5T24inK5paz+KoLvmHaztP6plX
 8SHbWQLRs1wKrKH4bOpnY9WzTokua6nepHJqlVC2ONOrzcqfF9WDIyW8kPVWGS8R1Ddlf0yEuef
 jCIDQad1qCR6CgL91KQOp/7cpeEANQ1jdb6I6KFtc9owS79dlCoZQBFtUToqQADpq6AKXD9Q4B6
 24D2ZLnLuuij3A0oV2ST1uQxL13lQ2SM5n+sbP+6Zzke4JUl4fKXiXLaoGirtKn3d32t1Stivc+
 2PRspSajo3iva68wnZxnoUY1s7h5iZ4ExsxL9f9L6raafiXwxo9ekQyuKkcyDYvFleHAAmc4iM8
 Al+NkluL9D6NIGt7evGEpabp1GCqJyeHJqOOKEqNbBaYxYuglcsapfBT8Zoa5I2t7arJouLvEIT
 W34GN4JBSyURsuuxCLC5GByU9wDjLfTjZzf0D1uSYhYZ3moTJRV6EC1544yF8j75ZO4gCAUgy+L
 KKu7ToLPi56qpzkLMonNHuzedgCxv3Bq3UqQpU7Ajbam4qF1oERmuxkJr9c2fkYYFhVo+E7bLll
 3/wJIn2yU74hnIaocpLO0RrRZ0A/AATQb+Esj+x/CJ5Vip7aly5RFoFXxC2QEljo4HvzZX6J9ku
 DjzKW9Kk/YGOGMQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100305-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[david@ixit.cz];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ixit.cz:email,ixit.cz:replyto,ixit.cz:mid]
X-Rspamd-Queue-Id: 685F1344D2C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: David Heidelberg <david@ixit.cz>

The onboard Wi-Fi / BT device, WCN3990, has a simple on-chip PMU, which
further spreads generated voltage. Describe the PMU in the device tree
and rewire Bluetooth and WiFi supply properties to use the PMU LDO
outputs instead of referencing the SoC regulators directly.

Verified against the datasheet.

Assisted-by: Claude:claude-opus-4.6
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 65 +++++++++++++++++++---
 1 file changed, 56 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index ea187244c92a9..6b7378cf4d493 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -230,6 +230,43 @@ panel_vddi_poc_1p8: panel-vddi-poc-regulator {
 		pinctrl-names = "default";
 		regulator-boot-on;
 	};
+
+	wcn3990-pmu {
+		compatible = "qcom,wcn3990-pmu";
+
+		pinctrl-0 = <&sw_ctrl_default>;
+		pinctrl-names = "default";
+
+		vddio-supply = <&vreg_s4a_1p8>;
+		vddxo-supply = <&vreg_l7a_1p8>;
+		vddrf-supply = <&vreg_l17a_1p3>;
+		vddch0-supply = <&vreg_l25a_3p3>;
+		vddch1-supply = <&vreg_l23a_3p3>;
+
+		swctrl-gpios = <&pm8998_gpios 3 GPIO_ACTIVE_HIGH>;
+
+		regulators {
+			vreg_pmu_io: ldo0 {
+				regulator-name = "vreg_pmu_io";
+			};
+
+			vreg_pmu_xo: ldo1 {
+				regulator-name = "vreg_pmu_xo";
+			};
+
+			vreg_pmu_rf: ldo2 {
+				regulator-name = "vreg_pmu_rf";
+			};
+
+			vreg_pmu_ch0: ldo3 {
+				regulator-name = "vreg_pmu_ch0";
+			};
+
+			vreg_pmu_ch1: ldo4 {
+				regulator-name = "vreg_pmu_ch1";
+			};
+		};
+	};
 };
 
 &adsp_pas {
@@ -536,6 +573,14 @@ &mss_pil {
 };
 
 &pm8998_gpios {
+	sw_ctrl_default: sw-ctrl-default-state {
+		pins = "gpio3";
+		function = "normal";
+
+		input-enable;
+		bias-pull-down;
+	};
+
 	volume_down_gpio: pm8998-gpio5-state {
 		pinconf {
 			pins = "gpio5";
@@ -804,10 +849,11 @@ bluetooth {
 		 */
 		firmware-name = "OnePlus/enchilada/crnv21.bin";
 
-		vddio-supply = <&vreg_s4a_1p8>;
-		vddxo-supply = <&vreg_l7a_1p8>;
-		vddrf-supply = <&vreg_l17a_1p3>;
-		vddch0-supply = <&vreg_l25a_3p3>;
+		vddio-supply = <&vreg_pmu_io>;
+		vddxo-supply = <&vreg_pmu_xo>;
+		vddrf-supply = <&vreg_pmu_rf>;
+		vddch0-supply = <&vreg_pmu_ch0>;
+
 		max-speed = <3200000>;
 	};
 };
@@ -981,13 +1027,14 @@ &wcd9340 {
 };
 
 &wifi {
-	status = "okay";
 	vdd-0.8-cx-mx-supply = <&vreg_l5a_0p8>;
-	vdd-1.8-xo-supply = <&vreg_l7a_1p8>;
-	vdd-1.3-rfa-supply = <&vreg_l17a_1p3>;
-	vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
-	vdd-3.3-ch1-supply = <&vreg_l23a_3p3>;
+	vdd-1.8-xo-supply = <&vreg_pmu_xo>;
+	vdd-1.3-rfa-supply = <&vreg_pmu_rf>;
+	vdd-3.3-ch0-supply = <&vreg_pmu_ch0>;
+	vdd-3.3-ch1-supply = <&vreg_pmu_ch1>;
 
 	qcom,calibration-variant = "oneplus_sdm845";
 	qcom,snoc-host-cap-8bit-quirk;
+
+	status = "okay";
 };

-- 
2.53.0



