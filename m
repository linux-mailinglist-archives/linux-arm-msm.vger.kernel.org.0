Return-Path: <linux-arm-msm+bounces-38909-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B70AC9D68BD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Nov 2024 12:06:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 47D241613BF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Nov 2024 11:06:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04C84187553;
	Sat, 23 Nov 2024 11:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ERPDPUi2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E0937171;
	Sat, 23 Nov 2024 11:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732359974; cv=none; b=jau4n2Cgb/Qb1DIiii2vjjpqcPgkmO2k5ma3qI0JiYQGSjyhNojWILgj0kEddUrMlii3mGg2l7ch0fNrHltJOYiLGtaDSTtJAaipxrSXC2j/nP9JS3rSzyYD57KoBblVytU6fRwuwM6h3IvO9F1yHYDPFUuqS1eFa+fHBvIzhnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732359974; c=relaxed/simple;
	bh=hCWPTU0oR6gGA6LruaUb8nCr9j4CS/MKpzMxuv9RgoA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aXVTTWX5wv+vGyKmRNT3NyjqEy4EePiTNjg3MEX6v7lZX1S9u0/cO8bjyvmKStTvpZGqG3U+HylIDiC/RlPZqn7/XRlvCTFxgQlE7w/j44f55EcwviFn8MkGtrboMv/VYET/hDSCY/WBcvT4g5i2wHKDhzoLpLpfavSZI/y2ie8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ERPDPUi2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9D9AFC4CED0;
	Sat, 23 Nov 2024 11:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732359974;
	bh=hCWPTU0oR6gGA6LruaUb8nCr9j4CS/MKpzMxuv9RgoA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ERPDPUi2habuW4Fa58YZFzlQmnKH0YTjoA+uCpBdi6hsD5s0ssQzBdqf4t2ZkfssR
	 +QRkpcf17/p+BNzUwW8ms7nd4nljffj0n7yIH+4fktTDgoaAzsJL6PK+7Z1Uivqq4X
	 DeKF8BIyiObo/M9rKB6XAnn1eGWTWWWqgMGxBk9y5fz19OHqCRcfle6A0Lu1BNOy9S
	 SapHeBb0NNth6umeyx8kwKL1HvHjvlu93NTFJikt/hvdfrY88eDD75QDnqGxKKK5kG
	 sJ816ctCNzrX6f6khSwnE8kTMGtodBhCntOowS1L7h9H+RxPtNPmwIGOYRdeCNDGvt
	 7dEb5izK2uAfQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F67BE6ADF3;
	Sat, 23 Nov 2024 11:06:14 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maud_spierings.hotmail.com@kernel.org>
Date: Sat, 23 Nov 2024 12:05:52 +0100
Subject: [PATCH 2/4] arm64: dts: qcom: x1e80100-vivobook-s15: Use the
 samsung,atna33xc20 panel driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241123-asus_qcom_display-v1-2-85a9ff9240aa@hotmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732359972; l=1388;
 i=maud_spierings@hotmail.com; s=20241110; h=from:subject:message-id;
 bh=yLKoqyn/v9BZdCsCAd3cnvw+zKCdySrKEuedXGKA2QA=;
 b=uoCHBqf7ckxd0xmfXWvIkgvHSp97O+FFjRU3cLN+A3IzRcAdaRUf8vPZceLIgWhz9KUwxBZFU
 50fBmignuwpBfka5TRx272hEUxjLmkded/cIEBFEwiLc0WqVWM7NiKF
X-Developer-Key: i=maud_spierings@hotmail.com; a=ed25519;
 pk=CeFKVnZvRfX2QjB1DpdiAe2N+MEjwLEB9Yhx/OAcxRc=
X-Endpoint-Received: by B4 Relay for maud_spierings@hotmail.com/20241110
 with auth_id=273
X-Original-From: Maud Spierings <maud_spierings@hotmail.com>
Reply-To: maud_spierings@hotmail.com

From: Maud Spierings <maud_spierings@hotmail.com>

The Asus vivobook s15 uses the ATNA56AC03 panel.
This panel is controlled by the atna33xc20 driver
instead of the generic edp-panel driver

Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
---
 arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
index f25991b887de3fca0092c5f81c881c5d8bd71aac..dbc85aff50a95bfc2ac11528d1901979ec7b1501 100644
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
@@ -475,6 +479,16 @@ &pcie6a_phy {
 	status = "okay";
 };
 
+&pmc8380_3_gpios {
+	edp_bl_en: edp-bl-en-state {
+		pins = "gpio4";
+		function = "normal";
+		power-source = <0>;
+		input-disable;
+		output-enable;
+	};
+};
+
 &qupv3_0 {
 	status = "okay";
 };

-- 
2.47.0



