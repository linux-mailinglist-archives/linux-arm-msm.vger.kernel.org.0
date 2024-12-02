Return-Path: <linux-arm-msm+bounces-39937-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 547169E0AD1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 19:18:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A27E281A99
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 18:18:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9B411DDC29;
	Mon,  2 Dec 2024 18:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PSjB0Axh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0BAD1DD866;
	Mon,  2 Dec 2024 18:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733163503; cv=none; b=MgHHJSqpYW/zvRfepfJ5wRDWwIqJAQrf7U3GVtAHBqpuU93vzpBSU4AdvtzonNOlhoiWuXvTrCZYfpDMTUTP5RCESxziiE4NmF12MYyV09a60Olvx8u18wtpfY0Jfs1bm0dVPbPWYL7X5W0soAgErnDR0o9vNbreQO2dsbnlKMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733163503; c=relaxed/simple;
	bh=KiM+r2+vbQFz4ZNDqr52yOHioGTJ04fsaje5jz3Xr5Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lVjPEc46ij8+WK4zePcD/QdmcHMOJnlj4sAKs4cNt0lms+ze3HZUNDoZajK04ZzVM6yOVSPmRLtUlA1NPf31iz1shp4cBQ9O39+Pep5+S24Y2GdMXg+CUAG/PnGRqVss9d74LicIldmNjv2Nx0Lg7qFjrHLaQjuUulzY4BYJZMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PSjB0Axh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 57919C4CED6;
	Mon,  2 Dec 2024 18:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733163503;
	bh=KiM+r2+vbQFz4ZNDqr52yOHioGTJ04fsaje5jz3Xr5Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=PSjB0Axhn9Bsigm4qrNtdYDoH0A5Ipu+Lb3QRUkEqaU2HMGYlwXRq2BAoCc9hsj/Q
	 cfhVDn+BT32V6wasWFuERR/nErDjLUIFbY0sYcUI2El6OYGqdRVP+/ATeluk7kx14Q
	 v5T+JtVvHPZ3XetL9c9OFnWwPpAbH7xup1NXerhAPGdXJF2Gc9DVym2Nmx906lS3rP
	 3cFEb/4pquhlPyR0QpvzcxmgJtC2Jfi3scMBQCiOKHTpEsWn7Nj28MHNVbB+a05VxL
	 LabVIF7Za/X/3Ami9iDgtc0frTk5ia9OAI9ZiHcVuuVoz5cpY++xNUmUv2uDWZCsM8
	 bQ19Tc3Vd+NOg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AE78E69E81;
	Mon,  2 Dec 2024 18:18:23 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maud_spierings.hotmail.com@kernel.org>
Date: Mon, 02 Dec 2024 19:18:11 +0100
Subject: [PATCH v5 1/3] arm64: dts: qcom: x1e80100-vivobook-s15: Use the
 samsung,atna33xc20 panel driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241202-asus_qcom_display-v5-1-e0d3752ff71f@hotmail.com>
References: <20241202-asus_qcom_display-v5-0-e0d3752ff71f@hotmail.com>
In-Reply-To: <20241202-asus_qcom_display-v5-0-e0d3752ff71f@hotmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Maud Spierings <maud_spierings@hotmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733163500; l=1501;
 i=maud_spierings@hotmail.com; s=20241110; h=from:subject:message-id;
 bh=+p57oSoZcIYd3K5X0WVZ9oWNtOr7Y9V+E7VoIgmgr4k=;
 b=UvCXU/oj2NIOtXiRqc+lXairShldjGizHXQl22p7ObP16xd+ji8CLaUEUTe//M+/Q1XITtCW5
 F6QjXCf8Ck7BZqX6gRkBFI5WMLlOMOkGYpkrMdm610q1AxSlKfp39Gp
X-Developer-Key: i=maud_spierings@hotmail.com; a=ed25519;
 pk=CeFKVnZvRfX2QjB1DpdiAe2N+MEjwLEB9Yhx/OAcxRc=
X-Endpoint-Received: by B4 Relay for maud_spierings@hotmail.com/20241110
 with auth_id=273
X-Original-From: Maud Spierings <maud_spierings@hotmail.com>
Reply-To: maud_spierings@hotmail.com

From: Maud Spierings <maud_spierings@hotmail.com>

The Asus vivobook s15 uses the ATNA56AC03 panel.
This panel is controlled by the atna33xc20 driver instead of the generic
edp-panel driver

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
---
 .../arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
index f25991b887de3fca0092c5f81c881c5d8bd71aac..8cdb2888d10a1dfc0c28480b6636584ab06853bb 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
@@ -407,9 +407,13 @@ &mdss_dp3 {
 
 	aux-bus {
 		panel {
-			compatible = "edp-panel";
+			compatible = "samsung,atna56ac03", "samsung,atna33xc20";
+			enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
 			power-supply = <&vreg_edp_3p3>;
 
+			pinctrl-0 = <&edp_bl_en>;
+			pinctrl-names = "default";
+
 			port {
 				edp_panel_in: endpoint {
 					remote-endpoint = <&mdss_dp3_out>;
@@ -475,6 +479,18 @@ &pcie6a_phy {
 	status = "okay";
 };
 
+&pmc8380_3_gpios {
+	edp_bl_en: edp-bl-en-state {
+		pins = "gpio4";
+		function = "normal";
+		power-source = <1>;
+		qcom,drive-strength = <2>;
+		bias-pull-down;
+		input-disable;
+		output-enable;
+	};
+};
+
 &qupv3_0 {
 	status = "okay";
 };

-- 
2.47.1



