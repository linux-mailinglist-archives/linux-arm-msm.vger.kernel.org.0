Return-Path: <linux-arm-msm+bounces-83449-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CE8C89ADA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 13:09:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C39884E56F1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 12:08:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDCDD326D77;
	Wed, 26 Nov 2025 12:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DfBkVrkp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450653203B2;
	Wed, 26 Nov 2025 12:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764158929; cv=none; b=FCDGVtikLMz0Y4MjGIG/aclT8hGPMhD7LDeETovBLR/xIGQBzAZARZ5lMIWIf55JuRVqXUYSnFJHoHCNno2dZe0443kCHfgu2rTGCmy5rYeRlr1p2QNZJXMGyjOSUPGa7ZyqSJwPLasTT0k/XDMPVO8KhgzxcZQUTEE0UDesJcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764158929; c=relaxed/simple;
	bh=KksNXx9P03oXSeHXOHVixK9Vw6gIic00TLYHX5ZwPFA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tPjsFG7Jyq9y0g1GQ2k5lSEouiuFhGN5SW+EFrsSVrT2XBx+ENUfLL8oXk66dR+F4Fk7XxNqHj6zEvuLTncovwoPPM1820AIGkTsM/78g0rQE7guHMFOvN7spzSAf2r99lQvmGR75/Qkl1xvNq8e0PtSnez1I5eENDZu2Co2lO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DfBkVrkp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B6417C116C6;
	Wed, 26 Nov 2025 12:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764158928;
	bh=KksNXx9P03oXSeHXOHVixK9Vw6gIic00TLYHX5ZwPFA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=DfBkVrkpFBQTmPz4iAmydxrU9JxFHmrf6U9He9qD573eyuG8xUp/+cl+7H4z6h/HJ
	 MGHiBSPuhaJlLud+BFigGSBa7mFojuZ5fBbujgy2n2UFGEHRF1OCUijHGP4r5UE4ke
	 J03M0y6xTKjYZHhAkvrpOK+8CpBxe3FHsl95WDa8oVJTihmI3sYbo/X5LkmmyVvozR
	 A/ZU94p8LqpxaGiWnvbtxkaQlS5zhibAKr9IT0jBNBIPOozqQZtYjTEEsxGrU9vC2v
	 LCRqf+DycBnRAsjWCJ39AUslbuNlvKgesW8rdEDQadtaL/c8oZvIcAy5w9gaQFcat7
	 YZYKDQFBf9gQw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A325CD1039D;
	Wed, 26 Nov 2025 12:08:48 +0000 (UTC)
From: Robert Eckelmann via B4 Relay <devnull+longnoserob.gmail.com@kernel.org>
Date: Wed, 26 Nov 2025 21:08:36 +0900
Subject: [PATCH 2/2] arm64: dts: qcom: sdm845-xiaomi-beryllium: Add
 placeholders and sort
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-slpi-v1-2-c101d08beaf2@gmail.com>
References: <20251126-slpi-v1-0-c101d08beaf2@gmail.com>
In-Reply-To: <20251126-slpi-v1-0-c101d08beaf2@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Robert Eckelmann <longnoserob@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1659;
 i=longnoserob@gmail.com; h=from:subject:message-id;
 bh=jRDzXV0G0lUQ5KhhdMuc9FwHaZQADAKy3FthKzJhXWc=;
 b=owGbwMvMwCVmcOAq9/vk/SGMp9WSGDLV3p5/4hBrrR3x1jd2ict+xqUK5geOmU3LTjv1/PMaR
 c8o0SnSHaUsDGJcDLJiiiw73I7pZLoujdi4e38ZzBxWJpAhDFycAjAR5RiGf5r+ayczdkqeF48N
 vPn63kvxAxm7bKfyFMR5p9grvZ222Zrhr8QcplWZlaUPridv7juQWVx86rDKApG3OnHvQk/G/yy
 r5gMA
X-Developer-Key: i=longnoserob@gmail.com; a=openpgp;
 fpr=B846C62C6945A558B1BBBF7630C0D50BEF63BF54
X-Endpoint-Received: by B4 Relay for longnoserob@gmail.com/default with
 auth_id=569
X-Original-From: Robert Eckelmann <longnoserob@gmail.com>
Reply-To: longnoserob@gmail.com

From: Robert Eckelmann <longnoserob@gmail.com>

We know these devices are present, most of them are supported by
downstream and close to the mainline kernels.

This is very handy when rebasing the integration tree with the support.

No functional changes.

Signed-off-by: Robert Eckelmann <longnoserob@gmail.com>
---
 .../dts/qcom/sdm845-xiaomi-beryllium-common.dtsi   | 23 +++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
index 0fb1d7e724c4..0b219d0ff451 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
@@ -227,6 +227,10 @@ vreg_l26a_1p2: ldo26 {
 	};
 };
 
+&cci_i2c0 {
+	/* IMX363 @ 10 */
+};
+
 &cdsp_pas {
 	status = "okay";
 	firmware-name = "qcom/sdm845/beryllium/cdsp.mbn";
@@ -261,6 +265,18 @@ &ibb {
 	qcom,discharge-resistor-kohms = <300>;
 };
 
+&ipa {
+	qcom,gsi-loader = "self";
+	memory-region = <&ipa_fw_mem>;
+	firmware-name = "qcom/sdm845/beryllium/ipa_fws.mbn";
+
+	status = "okay";
+};
+
+&i2c5 {
+	/* TAS2559 @ 4C */
+};
+
 &lab {
 	regulator-min-microvolt = <4600000>;
 	regulator-max-microvolt = <6000000>;
@@ -311,13 +327,6 @@ &mss_pil {
 	firmware-name = "qcom/sdm845/beryllium/mba.mbn", "qcom/sdm845/beryllium/modem.mbn";
 };
 
-&ipa {
-	qcom,gsi-loader = "self";
-	memory-region = <&ipa_fw_mem>;
-	firmware-name = "qcom/sdm845/beryllium/ipa_fws.mbn";
-	status = "okay";
-};
-
 &pm8998_gpios {
 	vol_up_pin_a: vol-up-active-state {
 		pins = "gpio6";

-- 
2.52.0



