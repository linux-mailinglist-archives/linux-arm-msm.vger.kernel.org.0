Return-Path: <linux-arm-msm+bounces-26704-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 56EA09389C1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 09:13:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 122FB280A61
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 07:13:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F05DD41C6E;
	Mon, 22 Jul 2024 07:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="k/SgN9YB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 823C93EA69;
	Mon, 22 Jul 2024 07:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721632283; cv=none; b=m4hMhgMrNawz/xEBV1CW7nXCfb+xF7w5AS7zuiz7uNI5iGPLpbRMoEuYm4Su08O+ImhKQeDFAI+eaNYkwb5x96xGOSVFPFZ753qyKqVnWwZZCmR/ajpmhY2RKmHTiFLCIsQfyuXqBiql0TYFsKv++A98ozpJpwtEeGDrpMY/894=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721632283; c=relaxed/simple;
	bh=KWBpJ7gGcid+EjpgOjWMY+CPLBB3dIruHrlg9txXzvM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YMiBKk+KGP/IeVyg0+O8YrHSwZa/wkX/zg5W5al5H2JyEdtZgLsvV2wXnVxjBB/NDvNp0/NdB3RGo1gHiYy+t+5K1nqbqFTzgZKIV7rDl1raeARXiqqfySQ8qddLbKvBUGRJlaPKzcnHPfB3W8gZxqzz9ZpDTePrvAID9GRugVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=k/SgN9YB; arc=none smtp.client-ip=198.252.153.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4WSBK61M8Mz9v89;
	Mon, 22 Jul 2024 07:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1721632282; bh=KWBpJ7gGcid+EjpgOjWMY+CPLBB3dIruHrlg9txXzvM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=k/SgN9YBdH2P+70phj3OoknI+DRO8iC4By7zmcNBfukI+uE2J2bWZPLmGGa/PVKmp
	 crR8OhBfWPno++aniweyxZ0IOdtqkd9bOfB3KounvuvYqWk+F6fipLVmYzgGGSOswv
	 VyOi7UYpjz7CDRtaTr/viBgUQecr2bGiorRkBIfo=
X-Riseup-User-ID: CC568D24F5FF85FB7943D38D9609E589BCE296E2124344443DF92247DD287E70
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4WSBK32T9lzJrYb;
	Mon, 22 Jul 2024 07:11:19 +0000 (UTC)
From: Dang Huynh <danct12@riseup.net>
Date: Mon, 22 Jul 2024 14:10:16 +0700
Subject: [PATCH 06/12] arm64: dts: qcom: sm6115-pro1x: Enable MDSS and GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240722-qx1050-feature-expansion-v1-6-c4d486435b96@riseup.net>
References: <20240722-qx1050-feature-expansion-v1-0-c4d486435b96@riseup.net>
In-Reply-To: <20240722-qx1050-feature-expansion-v1-0-c4d486435b96@riseup.net>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dang Huynh <danct12@riseup.net>

Fxtec Pro1x uses the same display (BOE BF060Y8M-AJ0) as Pro1.

Signed-off-by: Dang Huynh <danct12@riseup.net>
---
 arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts | 60 +++++++++++++++++++++++--
 1 file changed, 56 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts b/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
index 42567545f56d..6148cc258164 100644
--- a/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
+++ b/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
@@ -89,13 +89,16 @@ ts_vddio_supply: ts-vddio-supply {
 	};
 };
 
-&dispcc {
-	/* HACK: disable until a panel driver is ready to retain simplefb */
-	status = "disabled";
+&gpi_dma0 {
+	status = "okay";
 };
 
-&gpi_dma0 {
+&gpu {
 	status = "okay";
+
+	zap-shader {
+		firmware-name = "qcom/sm6115/Fxtec/QX1050/a610_zap.mbn";
+	};
 };
 
 &i2c1 {
@@ -132,6 +135,42 @@ touchscreen@14 {
 	};
 };
 
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&pm6125_l18a>;
+	status = "okay";
+
+	panel: panel@0 {
+		compatible = "boe,bf060y8m-aj0";
+		reg = <0>;
+
+		reset-gpios = <&tlmm 82 GPIO_ACTIVE_LOW>;
+
+		vddio-supply = <&pm6125_l9a>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&mdss_dsi_n &panel_en_n>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	data-lanes = <0 1 2 3>;
+	remote-endpoint = <&panel_in>;
+};
+
+&mdss_dsi0_phy {
+	status = "okay";
+};
+
 &pm6125_gpios {
 	vol_up_n: vol-up-n-state {
 		pins = "gpio5";
@@ -340,6 +379,19 @@ key_camera_n: key-camera-n {
 		bias-pull-up;
 	};
 
+	mdss_dsi_n: mdss-dsi-n {
+		pins = "gpio82";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	panel_en_n: panel-en-n {
+		pins = "gpio65";
+		function = "gpio";
+		bias-disable;
+	};
+
 	ts_int_n: ts-int-n {
 		pins = "gpio80";
 		function = "gpio";

-- 
2.45.2


