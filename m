Return-Path: <linux-arm-msm+bounces-39138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C309F9D8CA1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 20:11:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8941F28A885
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 19:11:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE8D91B81B8;
	Mon, 25 Nov 2024 19:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pbmaUZCM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A1717F4F6;
	Mon, 25 Nov 2024 19:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732561891; cv=none; b=P9fh523l6nL6UohPy1hFP6MeGeGYP9zEWnhZccQNRZvF80FI/BLjaLPZ5t2CWG/K9wScXS0XfBasliyJb49mtHk7AtrcpefEASTZmaWWL5AvJK7B/s1yrU3fuT09qMAKO69eE8hZsn5IJ40Y25deE4KB5JgAHxoAScEZkgRtPG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732561891; c=relaxed/simple;
	bh=vRgkTNe3qOoDDC/Jj1iI9HpXllP29/Ehd+RAnsMQcQ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y15iETTzh76vxYCdIDtL7acQltKqE8J7FBSUNIqDGmHJLBzmsmemLTL6MNCBIQHgGKRo+6V6LqcUzg+kmcaJMC0CZDfyosHW1TD2syGinHAa+HBplFr3mV4Tx8bO0R2qzRm7menR0lLrukhG2m7JP7W62BB8A/uNds9MfwMZDJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pbmaUZCM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2032CC4CED2;
	Mon, 25 Nov 2024 19:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732561891;
	bh=vRgkTNe3qOoDDC/Jj1iI9HpXllP29/Ehd+RAnsMQcQ8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=pbmaUZCM+Y86ztqHzoqHWcSbm/B3rCIgEqKwvgHdOqAOvGAfBTIxJXx0O0jmoMsH8
	 eiOB2qFvlmULVLLomeOdazMdH1/GJMs2uwUrJGb3BbLLl3lUCbhQ1OxcG7ASpm7t4S
	 dh22KBfUToKMA4qnrmcREqGgGv7PEX8St7Up6D1pf0fn9QcL7b8FmH2epOrSdivaQr
	 LP/fHP2yyyr+BNAuxk9x6dHn6keWSEsYt2vJhUHrS6ha1xwfIj0KOTEcDchhZsOJUy
	 7DXZoJZ3beIWpPlIbdVqB0nnzfH8R84TojRiqzFGzyRgqlmc6jpEl//J9LBEoem9xB
	 W1/AX/4Kr9rPw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B941D58D7B;
	Mon, 25 Nov 2024 19:11:31 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maud_spierings.hotmail.com@kernel.org>
Date: Mon, 25 Nov 2024 20:11:17 +0100
Subject: [PATCH v4 1/3] arm64: dts: qcom: x1e80100-vivobook-s15: Use the
 samsung,atna33xc20 panel driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241125-asus_qcom_display-v4-1-61a4da162406@hotmail.com>
References: <20241125-asus_qcom_display-v4-0-61a4da162406@hotmail.com>
In-Reply-To: <20241125-asus_qcom_display-v4-0-61a4da162406@hotmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Douglas Anderson <dianders@chromium.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Maud Spierings <maud_spierings@hotmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732561888; l=1440;
 i=maud_spierings@hotmail.com; s=20241110; h=from:subject:message-id;
 bh=/7ww43t4PL3OnNaGBy55/XHQy/o3cpc7eGJ7M5Nsi7k=;
 b=59b76BxFiKShlT5Zlo3YLSAemYxcOgNFq5CctPB1xE/ZTqx2Q5XaJwiWfZRyilkGKTyA8kcgW
 ttOuyqOrSX/Dxbi4HspRD0nhqR1GdEoGG04B6KDwY3yUUBGg5ustsmD
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



