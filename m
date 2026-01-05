Return-Path: <linux-arm-msm+bounces-87450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 920B0CF3E48
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 14:44:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D4E0030409C7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 13:42:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2B152673AA;
	Mon,  5 Jan 2026 13:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cc85s27+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A659D242D6A;
	Mon,  5 Jan 2026 13:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767619964; cv=none; b=ZbtnZUtuUfMywsV1S7iwruP6MkqIR4DBYNcnSnXocv+Gg3WPo+NzL49BzHov6FLm3sWi8r2/FgVs7ZMvD4mLEI22VgTHIxezQZnUSo6tfXYDJ1Q0zAwJt24XuW5vy4r5vsQqzPSnLyGg3VXxuybq5wpSAl4oFQYU8P/HDRl0c9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767619964; c=relaxed/simple;
	bh=d0QOaMZo/Hvkcd1e6/0gFf64ZqhjOoDB4Uo4/a0cj+M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z3Ak/m/rGxvAaYOExGqhoemypEUweQjaSQTVP74Te7pL7huC3XPRxUwl5iujN65fionxyvUDlvCsbadMeL7Q7v1A4JB9PRVllzwQYe7dCLbHZUzn0Xe+7it1VgcqZL6L9kVjTxrQO0u/LAza1cqnw6hRNbvYI1vRIhWF6jLBUbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cc85s27+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4976DC2BC87;
	Mon,  5 Jan 2026 13:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767619964;
	bh=d0QOaMZo/Hvkcd1e6/0gFf64ZqhjOoDB4Uo4/a0cj+M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=cc85s27+Fmir5AQrLtZJterqBy8bZGxflB0vsCCP7coJtim9feQB5Z0S9BrIXZHdG
	 NjD3h90uN6SghqlSN52S0VmOSk3m7/wQFVPRgezpTy2YKgRXAeuSCm5y1qsko+eRoe
	 pPadWfiKbcfTtzOPxhDMh7OviHRSqD9OrqZP3BHiaf/AGNt77aE7xuzrQvyfc8uJ30
	 KiJeosNrUCfxdkqKIBxXK6Gx1PFZifrjtNIJUaQqC0tLE1Gwx/+57G0Nkss7WdATQV
	 kGKSvXRM+B7QDErHoFFFZsnPNG55dXYz3WdxfIqaaSLi6AG66WNqRw+9RIzQJJd3yP
	 sY4H7KFOmeMfw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FCA9C79F92;
	Mon,  5 Jan 2026 13:32:44 +0000 (UTC)
From: Robert Eckelmann via B4 Relay <devnull+longnoserob.gmail.com@kernel.org>
Date: Mon, 05 Jan 2026 22:31:53 +0900
Subject: [PATCH v4 3/3] arm64: dts: qcom: sdm845-xiaomi-beryllium: Add
 placeholders and sort
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-slpi-v4-3-e6e0abfad3a4@gmail.com>
References: <20260105-slpi-v4-0-e6e0abfad3a4@gmail.com>
In-Reply-To: <20260105-slpi-v4-0-e6e0abfad3a4@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org, david@ixit.cz, 
 Robert Eckelmann <longnoserob@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1802;
 i=longnoserob@gmail.com; h=from:subject:message-id;
 bh=EM/NFegAHroxA02lkzL/+IA7UF2v/eqwuF0ytn6UwBI=;
 b=owGbwMvMwCVmcOAq9/vk/SGMp9WSGDKj91ZNmL/v1YS+Bu0fPUnWh3yUb7Xy5kgbH3yZeidvS
 UiD5gqVjlIWBjEuBlkxRZYdbsd0Ml2XRmzcvb8MZg4rE8gQBi5OAZhIRQIjw2WfJ/LPevbUZplE
 lTqtVHV6GC3j9VxPrYFxBWfR4r8sxQx/hUN1f0zvu+/f6TxbkjWhrEbzw4q5q8/d0Gif0HveVeY
 3NwA=
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
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Robert Eckelmann <longnoserob@gmail.com>
---
 .../dts/qcom/sdm845-xiaomi-beryllium-common.dtsi   | 27 ++++++++++++++++------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
index ab450d44b3f6..6f1bff7a37cd 100644
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
 	firmware-name = "qcom/sdm845/Xiaomi/beryllium/cdsp.mbn";
@@ -261,6 +265,22 @@ &ibb {
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
@@ -312,13 +332,6 @@ &mss_pil {
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



