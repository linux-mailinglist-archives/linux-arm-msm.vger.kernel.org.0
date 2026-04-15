Return-Path: <linux-arm-msm+bounces-103292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sMOKLt9832lAUAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 13:56:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E1C404125
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 13:56:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 54DF730058FA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 11:56:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64A4D37B03F;
	Wed, 15 Apr 2026 11:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G/qM2Fq1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1B52BD11;
	Wed, 15 Apr 2026 11:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776254173; cv=none; b=DaFeBVH9mr8gAkg8Y1Ro0Oc650iq57tOp8Q64VrQMgxGmdhKcVJ6VmvVkkjl1dAou0cjkeB5Y8wQWpvCnALqKD2RSloD3sLzpHMOVfHe/9m3s9qiHPFGumSYbFgyqzePZUjjW6iADjObh6EhrSDcyL7AAfSksGb8Unwove2+IAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776254173; c=relaxed/simple;
	bh=wbM+ddeeUe0Stlr/XVa56jLfToZOkCU6yAJHPhGlRAY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=aKnZH1k/hcQ62LOSTppABFIoKLATNteCQ8bV3lyKBbEBcIarGD3Hi2FLVOypbeP/6gVTJrfm0gHi3LcZeoHCkV3/u8ofJg1Nez8WWT3ECUOjOcKb0kBeW9N2XgDLcom5ikSRHy4z7Rx5VBzxl9hG7OwhjWr2CRYw6i2pcVa7OfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G/qM2Fq1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C0549C19424;
	Wed, 15 Apr 2026 11:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776254172;
	bh=wbM+ddeeUe0Stlr/XVa56jLfToZOkCU6yAJHPhGlRAY=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=G/qM2Fq1/bb9gv4rTlXBzWMFHiGm6iKx3tmV7eUb2R8n/0U4TEbg5015/n1f0W3Yi
	 e7DnOger82B4l6lAZdRqWO23r/V7JPgydgzSpTYtKuWdIc4S/ykRO9SghtgFVWZx1/
	 EIiykiX3dORgLtsy4UZ8Am+dBJDfciPytDwsxIEZpH9idLYrapUi2TvrBUxB1B1V0b
	 3+kkrR6L38Tf6CHnhhTD/73+YdJAhSYRsKpEYi4fvxBV5zsHQ0H8sa4XWAQ1zuVlQJ
	 VcOrGtWEP8cUg2ivJyf8TWl+b8nnwVUeiG10c/UOcSUdFkt+D3XH65TjP5TWdvTEmk
	 H/ydZaVLjLeAg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACFE5F4198F;
	Wed, 15 Apr 2026 11:56:12 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 15 Apr 2026 13:56:08 +0200
Subject: [PATCH] arm64: dts: qcom: sdm845-shift-axolotl: describe WiFi/BT
 properly
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260415-axolotl-wifi-v1-1-07df39cfc0a4@ixit.cz>
X-B4-Tracking: v=1; b=H4sIANd832kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDE0NT3cSK/Jz8khzd8sy0TF1LIwuD1DQLCzNDi0QloJaCotS0zAqwcdG
 xtbUAHx2u0V4AAAA=
X-Change-ID: 20260415-axolotl-wifi-9280ef88618a
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2911; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=m+1gBdPtLHFUl/FZSDkO1ZCLirKtvrPu1z4kfRZxdtU=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBp33zaBHJJ7tdDyjIkv2tD9QKaMuEipuGeY8xy6
 /VyaEIVhxSJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCad982gAKCRBgAj/E00kg
 crFEEADExORWdeDstIT/UDZrBsjq/ilsoTTMrKPkU/l2bL7gKl2cTONbMXHyCq6fF60tZiNQWrM
 /yXAXIx2hQ3PvP1N1++pz7vSH/tgbDRu76BtTIeFf6HVtFw088DJPIO2AwXseCNfz625/RsqaGJ
 rRZ1K55lg1BJfiqbs7BETgPjUgWkAVPH08Yes8SqpTCIOfFQqmVgZAaEjbBb/XOUbD4kVQIDCbW
 pxu1F+6aYc5pB2io4Dle868N0mUTyd0GFoLyPhKD2oU9ex/C5mvF2eWh02nOF5ewOjJPb9I+Ii4
 AL62NOJh9qu+mkqSJdT3Isogz0mwFI1pG02KOt7H4aCgoFAbJWJQl6ir/TnGZV3KObz013Bsmex
 88uSDnPzUvdE/Fu2UhFGdXy6FBLvv3gqXnFxY1QQwmnT2i/d4qDfO524PFofUO4OtcG1PYaZ1mp
 2N9zFOb+YfUdQ63r8RKbgsQhdTE0m6Gy/i+dt5G+8Myw6BxF2Uxeiy/4D0sAD2gCw+hOk/nvnuk
 OIUT6MKopQuVku7U75qHQGODACHgxwtnGQEePUWnwpq+BgCrqpaN1XScIdNUr2JN+qrxmIUnsdE
 Sp+wj/+V05so8nmK+6NkmzZ6GDRv0MHaf8Z6h8CuA/lbBael6ytojl2m3mg+vGW2UXa/peYu/++
 JpBdg/TMdFzCzMw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103292-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	HAS_REPLYTO(0.00)[david@ixit.cz];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 43E1C404125
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: David Heidelberg <david@ixit.cz>

The onboard WiFi / BT device, WCN3990, has a simple on-chip PMU, which
further spreads generated voltage. Describe the PMU in the device tree.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts | 65 +++++++++++++++++++----
 1 file changed, 55 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
index 7d81198bc499c..c14a798035d1b 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
@@ -105,6 +105,43 @@ vreg_s4a_1p8: pm8998-smps4 {
 
 		vin-supply = <&vph_pwr>;
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
@@ -526,6 +563,13 @@ &mss_pil {
 };
 
 &pm8998_gpios {
+	sw_ctrl_default: sw-ctrl-default-state {
+		pins = "gpio3";
+		function = "normal";
+		input-enable;
+		bias-pull-down;
+	};
+
 	volume_up_gpio: pm8998-gpio6-state {
 		pinconf {
 			pins = "gpio6";
@@ -732,10 +776,11 @@ bluetooth {
 		 */
 		firmware-name = "SHIFT/axolotl/crnv21.bin";
 
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
@@ -790,14 +835,14 @@ &venus {
 };
 
 &wifi {
-	status = "okay";
-
 	vdd-0.8-cx-mx-supply = <&vreg_l5a_0p8>;
-	vdd-1.3-rfa-supply = <&vreg_l17a_1p3>;
-	vdd-1.8-xo-supply = <&vreg_l7a_1p8>;
-	vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
-	vdd-3.3-ch1-supply = <&vreg_l23a_3p3>;
+	vdd-1.8-xo-supply = <&vreg_pmu_xo>;
+	vdd-1.3-rfa-supply = <&vreg_pmu_rf>;
+	vdd-3.3-ch0-supply = <&vreg_pmu_ch0>;
+	vdd-3.3-ch1-supply = <&vreg_pmu_ch1>;
 
 	qcom,calibration-variant = "shift_axolotl";
 	qcom,snoc-host-cap-8bit-quirk;
+
+	status = "okay";
 };

---
base-commit: e6efabc0afca02efa263aba533f35d90117ab283
change-id: 20260415-axolotl-wifi-9280ef88618a

Best regards,
-- 
David Heidelberg <david@ixit.cz>



