Return-Path: <linux-arm-msm+bounces-26994-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DE39C93BA51
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2024 03:44:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7C7A6B242D8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2024 01:44:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B23141EA73;
	Thu, 25 Jul 2024 01:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="m1ou21kh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DE91D530;
	Thu, 25 Jul 2024 01:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721871809; cv=none; b=IncZbzXbUXTZdpqcW+PpyzrCYONS4bfODkTcEINxVsAKoq84eCjyUHqelT0m0m291KLE8Ycmq6HAoaJuplkBlAbbBLj6npvJVb7YHAasWsqO+R4oDIldnZ4fL1xu/XRyJwY3PVllO12RqG4VQYdo2NggVmhHzgPvZMVEpOiHRn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721871809; c=relaxed/simple;
	bh=UTXwbecjWZcA/crNsy6yoLPgwzEQmmBGb1D8AMOiggU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p8XY6xFccfR+yumulfJyD8aPgHhyY5O/NLJxF0/MLQkulDDBtytDh9YKDvPfVuX7N+CmQN0L3psDAKGbwZC79mHBLELcx7Gx0p76WkFl5fZt0fg32EVz2LwX6h2BCF4L9BUd9D1vwsXo6zRHx1u18sth7aDn5FS05gu2SFSJ24Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=m1ou21kh; arc=none smtp.client-ip=198.252.153.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1.riseup.net (Postfix) with ESMTPS id 4WTtvM3CnHzDq89;
	Thu, 25 Jul 2024 01:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1721871807; bh=UTXwbecjWZcA/crNsy6yoLPgwzEQmmBGb1D8AMOiggU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=m1ou21khwtKccyymhTPcRqPNm0L46f5BnqzZ9nxXH0eLapJo0SMs+8WZ1LnzN6z8i
	 f7zztJKE7N/PTsMEDcHs3EqNo5Ikim7H0OrDXq+V48SWFAMbfi2a7B7RMytp/aO3Yh
	 hhN2hymWH0oJ14Z97enTcKhbE3Ip3y2nhttEs3i4=
X-Riseup-User-ID: FEE392A72BEBE4B5A8EB0635CA82BB0AEC84CA703F9C0B82E4246D96C1AE37BF
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4WTtvJ54CHzJrmm;
	Thu, 25 Jul 2024 01:43:24 +0000 (UTC)
From: Dang Huynh <danct12@riseup.net>
Date: Thu, 25 Jul 2024 08:42:15 +0700
Subject: [PATCH v2 06/11] arm64: dts: qcom: sm6115-pro1x: Enable MDSS and
 GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240725-qx1050-feature-expansion-v2-6-5fac4bbd946f@riseup.net>
References: <20240725-qx1050-feature-expansion-v2-0-5fac4bbd946f@riseup.net>
In-Reply-To: <20240725-qx1050-feature-expansion-v2-0-5fac4bbd946f@riseup.net>
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
index e1e66fe54295..69ef404d9de6 100644
--- a/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
+++ b/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
@@ -93,13 +93,16 @@ ts_vddio_supply: ts-vddio-supply {
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
@@ -136,6 +139,42 @@ touchscreen@14 {
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
+		pinctrl-0 = <&mdss_dsi_n &panel_en_n>;
+		pinctrl-names = "default";
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
@@ -345,6 +384,19 @@ key_camera_n: key-camera-n {
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


