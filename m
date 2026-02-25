Return-Path: <linux-arm-msm+bounces-94112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDklJ0nrnmk/XwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 13:30:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D81881975B0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 13:30:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 26D0D300DD5A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 12:24:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92AD73B52E4;
	Wed, 25 Feb 2026 12:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qwVgvg18"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EAF93AEF58;
	Wed, 25 Feb 2026 12:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772022273; cv=none; b=SE1x5WTlNEVTBOJ8lTzSSk+iRrmEhAXbssI10dmRZqwVBNIgHlTjMJ03JNlG6sGDwftAXAGuFlXpklAR0uELY/y5nR0UHEjTUiKvjdWwLTMxuLb20yw2rIS1xRP+BV0iRcjcGHpsfaxxueYcUI5sf9H6MrxoYrw2kOlZrMEn1jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772022273; c=relaxed/simple;
	bh=OymupniYFLapHs9MtRGJxwGnfRKqDMwYEhAOjtpDKqY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GvMiKLzuvP4L1VFZxmjrfW8fj4JUvQOk8CiEL3mXr/7ZZeUMAmM5JZwubvzjx1Dju57la/B2t7e3l4cmt5zOwRXI6vV0ApSQqfUCgmSMcGc1ckbYPK7iqgfWjVmi7Ovn3Mw/DebzPvwDDOhAaoj5IIKl7CgLQ0y+vIz57k+tfzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qwVgvg18; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FC4CC116D0;
	Wed, 25 Feb 2026 12:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772022273;
	bh=OymupniYFLapHs9MtRGJxwGnfRKqDMwYEhAOjtpDKqY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qwVgvg18D0mMekSM1sBC0IyvGqxQH6SEHk7kuj8Ba74U+DotzegQWXGsIjOw9emuE
	 OF2VnHNjloZ3fvwvn0LoSsk5/4gx8rvxb0+/G+HV7OOLEil+ghKKwgpGRZYH/8UHbS
	 bcrpsFuFJHppwEozhbx/C4fJXQ92gg+NBEauE5RQD5fPuPWSPITi1hqK5tnJGgMZ6e
	 jMg/27BzcJDMmH2ljEa+Ar0pMtX88PBb2LhQxNv6WwcbU98xvIKEoipHMAU+1qrjuB
	 jwZxMlRAHnPSa1O6RwIV8pI+29H6vjj3evlqfE7mtO3+rPzwYC4M0h6dB/gE8wZwlm
	 vUIrhQiOO1FFA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 25 Feb 2026 13:23:30 +0100
Subject: [PATCH v3 10/10] arm64: dts: qcom: lemans-ride-common: Fix up WCN
 power grid
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260225-topic-wcn6855_pmu_dtbdings-v3-10-576ec5c4e631@oss.qualcomm.com>
References: <20260225-topic-wcn6855_pmu_dtbdings-v3-0-576ec5c4e631@oss.qualcomm.com>
In-Reply-To: <20260225-topic-wcn6855_pmu_dtbdings-v3-0-576ec5c4e631@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Rocky Liao <quic_rjliao@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>, 
 linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772022207; l=2448;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=wMX5sXVMNwndcYH2mmByONx+363csMZmAL2q+FLYwqY=;
 b=bpyZNGLXFw1oGYu+aaBzPIBIterlsuncPP5sd+PNg9am2IR2xVVRO55N00Uyhx0IwTlGeClXc
 Y1C0dxX/FwsDIgKtVjO6wBzBKklyL74+HF/O/eMM4TvMq8cyK5XZtfy
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_MATCH_TO(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94112-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,bgdev.pl,holtmann.org,gmail.com,kernel.org,quicinc.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konradybcio@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D81881975B0
X-Rspamd-Action: no action

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Make the dt checker happy by filling out the required properties in
line with the schematics.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi | 32 ++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
index 8fb7d1fc6d56..7ae5f8447b42 100644
--- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
@@ -79,6 +79,18 @@ vreg_3p0: vreg-3p0-regulator {
 		vin-supply = <&vreg_12p0>;
 	};
 
+	vreg_3p3: vreg-3p3-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "VREG_3P3";
+
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		vin-supply = <&vreg_12p0>;
+	};
+
 	vreg_conn_1p8: vreg_conn_1p8 {
 		compatible = "regulator-fixed";
 		regulator-name = "vreg_conn_1p8";
@@ -95,6 +107,22 @@ vreg_conn_pa: vreg_conn_pa {
 		gpio = <&pmm8654au_1_gpios 6 GPIO_ACTIVE_HIGH>;
 	};
 
+	/*
+	 * TODO: These two regulators are actually part of the removable M.2
+	 * card and not the mainboard. Need to describe this differently.
+	 * Functionally it works correctly, because all we need to do is to
+	 * turn on the actual 3.3V supply above.
+	 */
+	vreg_wcn_0p95: vreg-wcn-0p95-regulator {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_WCN_0P95";
+		regulator-min-microvolt = <950000>;
+		regulator-max-microvolt = <950000>;
+
+		vin-supply = <&vreg_3p3>;
+	};
+
 	wcn6855-pmu {
 		compatible = "qcom,wcn6855-pmu";
 
@@ -104,6 +132,8 @@ wcn6855-pmu {
 		vddio-supply = <&vreg_conn_pa>;
 		vddaon-supply = <&vreg_l2c>;
 		vddpmu-supply = <&vreg_conn_1p8>;
+		vddpmumx-supply = <&vreg_wcn_0p95>;
+		vddpmucx-supply = <&vreg_wcn_0p95>;
 		vddrfa0p95-supply = <&vreg_l2c>;
 		vddrfa1p3-supply = <&vreg_l6e>;
 		vddrfa1p9-supply = <&vreg_s5a>;
@@ -982,6 +1012,8 @@ bluetooth {
 		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
 		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
 		vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
 	};
 };
 

-- 
2.53.0


