Return-Path: <linux-arm-msm+bounces-84493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED57CCA7DE4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 15:00:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1DFCF304DEE0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 13:59:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D39FF33290E;
	Fri,  5 Dec 2025 13:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZUru1TwI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671FE31619B;
	Fri,  5 Dec 2025 13:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764943151; cv=none; b=UCfCGvJuzeWURVpQWssyAwbLwxn++liz3u1YNjDpHnTcPuKhF5rP3lHhbzslgIonLPqDA/OVGWMuzFqtogx7k/LZ69SQ62kTVN/8RUyLZW4VUMKJeUUZwOJK7gYG6lHNQgVhsbAa2mcHpXivLkf3Soi2/dbvmcDOA/ALTHJ/BRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764943151; c=relaxed/simple;
	bh=7RE6j0gZr+sf4UVkD/xrJaRMnPj7rk58n3VPTSEAyIY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AZ1g5u/XWZ+H356aO1aQj+QTuGMB2ucnP+3q3aBx9pYSYDa40kwcZa5EVh5VAJhMIpgRKSnFpJr0D2kKXsflhT31L/OsmAcRR7/+5xiluj5KT5hUC2g4/oXholdIHr8AsQVfXvH4nmu0UndGNThWwI0e1+R6THCR/nVq8bFBu2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZUru1TwI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id BBF7CC19422;
	Fri,  5 Dec 2025 13:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764943150;
	bh=7RE6j0gZr+sf4UVkD/xrJaRMnPj7rk58n3VPTSEAyIY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ZUru1TwI/p60k3uSw00pDDSxGfDeWQsI1fW58Pn5pH4dlRbcHEnekWi4DNPiQM+Oo
	 pZp8PXGcGCcu1JsjR0FAhIqvuMLU0+81JmzCLI3/6pjuVn3VVY3s7O1oetArCYAsb/
	 ZFyNjF2Anqgrd/TPOL8HoZxS2t9GwaFJx83pS8NVMY2XLnb0Zm7fNyNw3m4Wn8k3c/
	 WarmNXGUEIjKwOQxnNujv+i/uSJom11lk/oopdzeV9G0R+2Ctq4ZPGcFHWMdonfotl
	 HN8OMUOBfVgjQ99Iml7fyhITlBjku3/xABY5K+naa/SbEofDw8d2vgsDC7v7hFrwCg
	 IPN7jIfXm5NMw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2689D2F7F7;
	Fri,  5 Dec 2025 13:59:10 +0000 (UTC)
From: Robert Eckelmann via B4 Relay <devnull+longnoserob.gmail.com@kernel.org>
Date: Fri, 05 Dec 2025 22:59:01 +0900
Subject: [PATCH v3 3/3] arm64: dts: qcom: sdm845-xiaomi-beryllium: Add
 placeholders and sort
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251205-slpi-v3-3-a1320a074345@gmail.com>
References: <20251205-slpi-v3-0-a1320a074345@gmail.com>
In-Reply-To: <20251205-slpi-v3-0-a1320a074345@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org, david@ixit.cz, 
 Robert Eckelmann <longnoserob@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1758;
 i=longnoserob@gmail.com; h=from:subject:message-id;
 bh=CzBukQcw2Pb818dELrCQVqLWErkUqxiNllh7zyojUzw=;
 b=owGbwMvMwCVmcOAq9/vk/SGMp9WSGDKNnur+kPwbYSE44Zync0jNhsS3F1xMLkYICe57nxCWx
 ifiMWlSRykLgxgXg6yYIssOt2M6ma5LIzbu3l8GM4eVCWQIAxenAExknhsjw2K/xo1fzK6GJt04
 PTuwrFvWo9F0w4r8/K+HMs5/5ZEyWM3wP9f/qmLDndlG6v8dzlV2ShU8ij8q/2bftR3aE1fwbfB
 P4wEA
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

Reviewed-by: David Heidelberg <david@ixit.cz>
Signed-off-by: Robert Eckelmann <longnoserob@gmail.com>
---
 .../dts/qcom/sdm845-xiaomi-beryllium-common.dtsi   | 29 ++++++++++++++++------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
index ab450d44b3f6..3444908b4a6b 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
@@ -227,6 +227,12 @@ vreg_l26a_1p2: ldo26 {
 	};
 };
 
+&cci_i2c0 {
+	status = "okay";
+
+	/* IMX363 @ 10 */
+};
+
 &cdsp_pas {
 	status = "okay";
 	firmware-name = "qcom/sdm845/Xiaomi/beryllium/cdsp.mbn";
@@ -261,6 +267,22 @@ &ibb {
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
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	/* TAS2559 @ 4C */
+};
+
 &lab {
 	regulator-min-microvolt = <4600000>;
 	regulator-max-microvolt = <6000000>;
@@ -312,13 +334,6 @@ &mss_pil {
 	"qcom/sdm845/Xiaomi/beryllium/modem.mbn";
 };
 
-&ipa {
-	qcom,gsi-loader = "self";
-	memory-region = <&ipa_fw_mem>;
-	firmware-name = "qcom/sdm845/Xiaomi/beryllium/ipa_fws.mbn";
-	status = "okay";
-};
-
 &pm8998_gpios {
 	vol_up_pin_a: vol-up-active-state {
 		pins = "gpio6";

-- 
2.52.0



