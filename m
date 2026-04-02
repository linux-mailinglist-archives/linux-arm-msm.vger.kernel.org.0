Return-Path: <linux-arm-msm+bounces-101437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIDVBMsQzmmnkgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 08:46:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1D4384A7D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 08:46:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8110630CA191
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 06:39:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65CE3333442;
	Thu,  2 Apr 2026 06:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="lODStkLG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C12364EAD
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 06:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775111942; cv=none; b=dpekFP+x5pyEow6EfYib6DhOjUXCp8ZJPyCu95SijMYkOkz4XomFyA+qmUAnQ6WK4oipBhlWY7h3IAdPKQAQTfZRSAuTKjtMeaSWwvxjIdQnNgn0CKr1t55vAV75+7Wcz/qJzOjOOO1t9e4Cq7YIc+WWXYPjS5NtpNubcgR1IOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775111942; c=relaxed/simple;
	bh=sfr5sGWKLV+7cUgvRiDdpIW68jelrwa3IWn9b6yAFYg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MOfNloblq3vrpAm//zDgnBUYJkVsDEs3Te1UyhBQ+zrWC2KN4dmZzmlTcwQpTHaDSv0wZXhRaA0GKmtatm5JFfTMwR98s672QvSVfDGeTxYk2qmpt76uTwO0WTyZyBEHILlLY2yLHoec3YD26axWnmHg6B8VdfhFeiIcgiPz2O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=lODStkLG; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1775111937;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vS032EvzVpRtfXSTOpPqWmTUv6U6bvbz7aB2vYumwkc=;
	b=lODStkLGsUE64y0ldoMytzyQK76r1rgSWUJ4qeprk7xXwN7gsxe6U1iNpgF5QkcOzdUYE5
	crxSMT92XXsv/ABoiuGRzD6l33yeMigEBsg4L9jCbrN51IhEPPeQd6IFhln8cjH2jY0NoT
	37HuziBYhJuCr5Ocd/ueCHovTQ16fh1KPHTyHD5dnmJROdmoQIWobrCC5WPQ6QesJrYpO+
	/bfFPEyxpqt3Uz5Lq3mPN6hz5bWcC7sDSAUQs5eR+5akONg8+N5HmKSYoEhOa3TmyMuhYP
	cdHKE0J4bRlpFfh7KU70l8bevwq3JMwsRq1DePExPI8S39T7D3xOYPznhsnhGA==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Wed, 01 Apr 2026 23:38:28 -0700
Subject: [PATCH v8 01/15] arm64: dts: qcom: sdm845-lg-common: Sort nodes
 and properties
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-judyln-dts-v8-1-7677cfafbc78@postmarketos.org>
References: <20260401-judyln-dts-v8-0-7677cfafbc78@postmarketos.org>
In-Reply-To: <20260401-judyln-dts-v8-0-7677cfafbc78@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, Amir Dahan <system64fumo@tuta.io>, 
 Christopher Brown <crispybrown@gmail.com>, 
 Paul Sajna <sajattack@postmarketos.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775111929; l=4272;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=sfr5sGWKLV+7cUgvRiDdpIW68jelrwa3IWn9b6yAFYg=;
 b=fIFo+Eu+1em2sL59o/NuRenMWbavbYYPYFt7N2TZQvn4w/n/dK5m/79Mq4w/823USH9P4DIjT
 9gIMfWS1J7JALTHJgBQSqgqn9QbK+r4NfiP12/FAyX9EiXEQTrU7Vxt
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[postmarketos.org,quarantine];
	R_DKIM_ALLOW(-0.20)[postmarketos.org:s=key1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101437-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,tuta.io,gmail.com,postmarketos.org,oss.qualcomm.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sajattack@postmarketos.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[postmarketos.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[postmarketos.org:dkim,postmarketos.org:email,postmarketos.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,9d400000:email,b2000000:email,qualcomm.com:email,f0800000:email]
X-Rspamd-Queue-Id: 8C1D4384A7D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Improve adherance to style guidelines below:
https://docs.kernel.org/devicetree/bindings/dts-coding-style.html

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 124 ++++++++++++-------------
 1 file changed, 62 insertions(+), 62 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index 0ee2f4b99fbd..93ed8f240461 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
@@ -38,11 +38,6 @@ reserved-memory {
 		#size-cells = <2>;
 		ranges;
 
-		qseecom_mem: memory@b2000000 {
-			reg = <0 0xb2000000 0 0x1800000>;
-			no-map;
-		};
-
 		gpu_mem: memory@8c415000 {
 			reg = <0 0x8c415000 0 0x2000>;
 			no-map;
@@ -99,6 +94,11 @@ memory@9d400000 {
 			no-map;
 		};
 
+		qseecom_mem: memory@b2000000 {
+			reg = <0 0xb2000000 0 0x1800000>;
+			no-map;
+		};
+
 		rmtfs_mem: rmtfs-region@f0800000 {
 			compatible = "qcom,rmtfs-mem";
 			reg = <0 0xf0800000 0 0x202000>;
@@ -467,14 +467,22 @@ &mss_pil {
 	status = "okay";
 };
 
+&pm8998_gpios {
+	vol_up_pin_a: vol-up-active-state {
+		pins = "gpio6";
+		function = "normal";
+		input-enable;
+		bias-pull-up;
+		qcom,drive-strength = <PMIC_GPIO_STRENGTH_NO>;
+	};
+};
+
 &pm8998_resin {
 	linux,code = <KEY_VOLUMEDOWN>;
 	status = "okay";
 };
 
 &sdhc_2 {
-	status = "okay";
-
 	cd-gpios = <&tlmm 126 GPIO_ACTIVE_LOW>;
 
 	pinctrl-names = "default";
@@ -482,55 +490,8 @@ &sdhc_2 {
 
 	vmmc-supply = <&vreg_l21a_2p95>;
 	vqmmc-supply = <&vddpx_2>;
-};
-
-/*
- * UFS works partially and only with clk_ignore_unused.
- * Sometimes it crashes with I/O errors.
- */
-&ufs_mem_hc {
-	status = "okay";
-
-	reset-gpios = <&tlmm 150 GPIO_ACTIVE_LOW>;
-
-	vcc-supply = <&vreg_l20a_2p95>;
-	vcc-max-microamp = <600000>;
-};
-
-&ufs_mem_phy {
-	status = "okay";
-
-	vdda-phy-supply = <&vdda_ufs1_core>;
-	vdda-pll-supply = <&vdda_ufs1_1p2>;
-};
-
-&usb_1 {
-	status = "okay";
-};
-
-&usb_1_dwc3 {
-	/* TODO: these devices have usb id pin */
-	dr_mode = "peripheral";
-};
-
-&usb_1_hsphy {
-	status = "okay";
-
-	vdd-supply = <&vdda_usb1_ss_core>;
-	vdda-pll-supply = <&vdda_qusb_hs0_1p8>;
-	vdda-phy-dpdm-supply = <&vdda_qusb_hs0_3p1>;
-
-	qcom,imp-res-offset-value = <8>;
-	qcom,hstx-trim-value = <QUSB2_V2_HSTX_TRIM_21_6_MA>;
-	qcom,preemphasis-level = <QUSB2_V2_PREEMPHASIS_5_PERCENT>;
-	qcom,preemphasis-width = <QUSB2_V2_PREEMPHASIS_WIDTH_HALF_BIT>;
-};
 
-&usb_1_qmpphy {
 	status = "okay";
-
-	vdda-phy-supply = <&vdda_usb1_ss_1p2>;
-	vdda-pll-supply = <&vdda_usb1_ss_core>;
 };
 
 /* PINCTRL - additions to nodes defined in sdm845.dtsi */
@@ -571,12 +532,51 @@ sd_card_det_n: sd-card-det-n-state {
 	};
 };
 
-&pm8998_gpios {
-	vol_up_pin_a: vol-up-active-state {
-		pins = "gpio6";
-		function = "normal";
-		input-enable;
-		bias-pull-up;
-		qcom,drive-strength = <PMIC_GPIO_STRENGTH_NO>;
-	};
+/*
+ * UFS works partially and only with clk_ignore_unused.
+ * Sometimes it crashes with I/O errors.
+ */
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 150 GPIO_ACTIVE_LOW>;
+
+	vcc-supply = <&vreg_l20a_2p95>;
+	vcc-max-microamp = <600000>;
+
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vdda_ufs1_core>;
+	vdda-pll-supply = <&vdda_ufs1_1p2>;
+
+	status = "okay";
+};
+
+&usb_1 {
+	status = "okay";
+};
+
+&usb_1_dwc3 {
+	/* TODO: these devices have usb id pin */
+	dr_mode = "peripheral";
+};
+
+&usb_1_hsphy {
+	vdd-supply = <&vdda_usb1_ss_core>;
+	vdda-pll-supply = <&vdda_qusb_hs0_1p8>;
+	vdda-phy-dpdm-supply = <&vdda_qusb_hs0_3p1>;
+
+	qcom,imp-res-offset-value = <8>;
+	qcom,hstx-trim-value = <QUSB2_V2_HSTX_TRIM_21_6_MA>;
+	qcom,preemphasis-level = <QUSB2_V2_PREEMPHASIS_5_PERCENT>;
+	qcom,preemphasis-width = <QUSB2_V2_PREEMPHASIS_WIDTH_HALF_BIT>;
+
+	status = "okay";
+};
+
+&usb_1_qmpphy {
+	vdda-phy-supply = <&vdda_usb1_ss_1p2>;
+	vdda-pll-supply = <&vdda_usb1_ss_core>;
+
+	status = "okay";
 };

-- 
2.53.0


