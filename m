Return-Path: <linux-arm-msm+bounces-38957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E489C9D6D65
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Nov 2024 11:01:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 79D80B2123F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Nov 2024 10:01:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BF1C1885AA;
	Sun, 24 Nov 2024 10:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RIDatEFS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB3E1531C4;
	Sun, 24 Nov 2024 10:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732442469; cv=none; b=OliUpLf83LsIiy9VX3FxSd5H2FizldqcT30hPqX3Ta840wirKctzVNdwkOimOekwFwj4fQW20hMLUHb1TOGi41Z/E6akmc6quyDa7WOe6Hl3H0jWJGmLVoPJyUY+PC2uakSvbnQjLJs3PP+12cEvpRzvxJ6Y049mXxCb7lhmACo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732442469; c=relaxed/simple;
	bh=P85kdcuROFc2rILlppJv5y6/+fj45JK+pYOQuVNCxcc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E+0a+PsPILss2iQxmq2KjpO2VpxhCUI3tltgdy7wWK/yxkLG0vGQNOyJqtHXEvjtdBFDOxvhTumdbvuXjwU1HCBISz6Vt2ij/ga/rfOsEYgcrUpyS0pVTdfXOWm1a1EGjt72svv7c8meNxwBjb5wTOYpC4d3eYXwXFBff7vzfDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RIDatEFS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6B60FC4CECF;
	Sun, 24 Nov 2024 10:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732442469;
	bh=P85kdcuROFc2rILlppJv5y6/+fj45JK+pYOQuVNCxcc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=RIDatEFSGB9iKvqIQmz6AK25Y9TCQyQ3KmIg2TWWPiAOSIkSGY9awYVm2mqNqsOkw
	 PBjz9orAGBrXXpJ3C56oy6CuOxU6rglAl5nxOKniCplOYo2jTQxeVqIOvyJpKGidis
	 tNrbb1URCXTDKunm1S2AZ5x7e0X0N5WIGCECrZ4GQaAdZntlByUZeLww4uAkYJOSk4
	 y3dOQZh7qJaC2MmGk7+8QE2ov3WJigHgcQrZDT1KFMx1D0dorIL0nX3vGwGpo3d/jQ
	 RrtZArgOAUg04xTmmOX43eRnaCvO8oKoDW2RQIYovywcgk9dZwa5uQjtMmm9Wy291B
	 bPElV+H5PqkKg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 579CDE668A5;
	Sun, 24 Nov 2024 10:01:09 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maud_spierings.hotmail.com@kernel.org>
Date: Sun, 24 Nov 2024 11:00:58 +0100
Subject: [PATCH v3 2/4] arm64: dts: qcom: x1e80100-vivobook-s15: Use the
 samsung,atna33xc20 panel driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241124-asus_qcom_display-v3-2-002b723b1920@hotmail.com>
References: <20241124-asus_qcom_display-v3-0-002b723b1920@hotmail.com>
In-Reply-To: <20241124-asus_qcom_display-v3-0-002b723b1920@hotmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732442467; l=1388;
 i=maud_spierings@hotmail.com; s=20241110; h=from:subject:message-id;
 bh=io+Nj/5iQaZGfv6rQv+gwuuh43FX+z1Sx+z5yfCqbsM=;
 b=KSdSZkES7yt/5gOpmSg4b7kLuhXg4LBdbIabbS9XE1xUxLvej+SQwg6gJei/8uY/7WcYOhY3v
 0BIIMHM8vwzBVUx1rgKoMbYF7MRrA2N99l7QbPM/Y/aqy8Olgh2KNsP
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



