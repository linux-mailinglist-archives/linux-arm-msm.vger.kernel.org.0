Return-Path: <linux-arm-msm+bounces-38913-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 395969D68CB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Nov 2024 12:06:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C8620B21E78
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Nov 2024 11:06:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A737199956;
	Sat, 23 Nov 2024 11:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ajoZpkE0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ADDE193402;
	Sat, 23 Nov 2024 11:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732359975; cv=none; b=Jzisv9SBH3CPr2pZdZu4QR9LCLXVgjNAE0YY4KyhptVGrIBodCJKfppVXfQBgSiO4F9KeWYmASaA5njoVUXV4C1pnWdZ5s646xNiz2QM5Z3tv27Bbl27x813MTefzfpPcbVJPVZv2IDzL8KnJO3dnsDcDRQzWI2DRY8AMljCtHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732359975; c=relaxed/simple;
	bh=fclkgm9lFTykmqvFCLvJfaEh0CEb/3Poq7a5Y05RJYs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=clbSwozHBMNl7JgHg4ESmJwTt0m0MBY0V0VkFaTbRWK75LRu+wiIgOV1A4aSdcONIthbbu1i6N8Tw4EXQwX1dXqOk1/G+q8SDaGpYMhPAy7tN4gtj9Wng4AQ4ipmNOkyrW5eAMsZCeIMskOF2H7rigcdZWG8gTwa76tccFyeXT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ajoZpkE0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C0E5CC4CEDA;
	Sat, 23 Nov 2024 11:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732359974;
	bh=fclkgm9lFTykmqvFCLvJfaEh0CEb/3Poq7a5Y05RJYs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ajoZpkE0HnrZMJgjRuU2svcm+qtPC1Dd7nnpg+oZZ7nVZ5FfnSyHgV45a1sFTmktA
	 AlYMt8W/6OLmvBKOewcGSiPbCSj3vg3/L36Z+jYNenI7buEPqGQ/6JTE5b+cYaZJso
	 yF6MuPYnxcA0TLVv1WQtChUpyeYg68ZJM1GeWZg8YtoHo2vV46qGkSuiw8Jzk8N1dn
	 bNp3h311p5Pzq9CAIS1TELi2AdVygHPeBdxJBLGqkJyxAPyD4A8Slq5+BozSvBid6Y
	 XHq/cee89lG5rWWMwJ1xXy7mrhqGvix9GyGd2ihf5ldbkxM5qUvAGFJ/CI+W1KwgdD
	 E0p1DqrqMm2HA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5A50E6ADF4;
	Sat, 23 Nov 2024 11:06:14 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maud_spierings.hotmail.com@kernel.org>
Date: Sat, 23 Nov 2024 12:05:54 +0100
Subject: [PATCH 4/4] arm64: dts: qcom: x1e80100-vivobook-s15: Add bluetooth
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241123-asus_qcom_display-v1-4-85a9ff9240aa@hotmail.com>
References: <20241123-asus_qcom_display-v1-0-85a9ff9240aa@hotmail.com>
In-Reply-To: <20241123-asus_qcom_display-v1-0-85a9ff9240aa@hotmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732359972; l=1600;
 i=maud_spierings@hotmail.com; s=20241110; h=from:subject:message-id;
 bh=oUN077tbzsv6PE2OOQAgFBjB52brIP7ZWV3kltZu5CE=;
 b=hfeUUDNBuAXzWamtS2UsGNm+PTeDIrfo4pujK9iXZJDMD+Vl6urVEQw130EzWCkjPhYiebpjF
 VPO533gkJBaD+8NrBjTtRp5u1MzmIzYhk3o/76sQUEUEgupnQ99GoBv
X-Developer-Key: i=maud_spierings@hotmail.com; a=ed25519;
 pk=CeFKVnZvRfX2QjB1DpdiAe2N+MEjwLEB9Yhx/OAcxRc=
X-Endpoint-Received: by B4 Relay for maud_spierings@hotmail.com/20241110
 with auth_id=273
X-Original-From: Maud Spierings <maud_spierings@hotmail.com>
Reply-To: maud_spierings@hotmail.com

From: Maud Spierings <maud_spierings@hotmail.com>

Add bluetooth for the asus vivobook s15

Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
---
 .../boot/dts/qcom/x1e80100-asus-vivobook-s15.dts   | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
index 109b9d8816d26550ccfcb9906d69f2745d02f1d3..bb22a853cf49fa2c06d0208932f8b68384e9e407 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
@@ -17,6 +17,11 @@ / {
 	compatible = "asus,vivobook-s15", "qcom,x1e80100";
 	chassis-type = "laptop";
 
+	aliases {
+		serial0 = &uart21;
+		serial1 = &uart14;
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys";
 		pinctrl-0 = <&hall_int_n_default>;
@@ -543,6 +548,14 @@ &tlmm {
 			       <44 4>, /* SPI (TPM) */
 			       <238 1>; /* UFS Reset */
 
+	bt_en_default: bt-en-sleep {
+		pins = "gpio116";
+		function = "gpio";
+		output-low;
+		bias-disable;
+		qcom,drive-strength = <16>;
+	};
+
 	edp_reg_en: edp-reg-en-state {
 		pins = "gpio70";
 		function = "gpio";
@@ -622,6 +635,17 @@ tpad_default: tpad-default-state {
 	};
 };
 
+&uart14 {
+	status = "okay";
+	bluetooth: bt_wcn7850 {
+		compatible = "qcom,wcn7850-bt";
+		pinctrl-names = "default";
+		pinctrl-0 = <&bt_en_default>;
+		enable-gpios = <&tlmm 116 GPIO_ACTIVE_HIGH>;
+		max-speed = <3200000>;
+	};
+};
+
 &usb_1_ss0_hsphy {
 	vdd-supply = <&vreg_l3j_0p8>;
 	vdda12-supply = <&vreg_l2j_1p2>;

-- 
2.47.0



