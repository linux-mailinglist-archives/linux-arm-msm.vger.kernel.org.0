Return-Path: <linux-arm-msm+bounces-40237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC579E39E2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 13:28:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F13FD164541
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 12:28:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA29C1CCEF0;
	Wed,  4 Dec 2024 12:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MJUZT5nx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2E91B87F8;
	Wed,  4 Dec 2024 12:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733315236; cv=none; b=GqxubPvzvEdGjiwhVvuRpAPf/b4lj7/F44VGtGTaTObopa7GYDZooTKam6hk7sxWUwTB8U6gpeMes9WqmuzcZhbQpwQBEpoPvkoqNXZO9c9Sv7H0IkhjFPo7J3wGWYFXYex2RXXvQODF0kP+DEEbYnhtRreCadQpRoHEqNODSH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733315236; c=relaxed/simple;
	bh=KQEwRGzVH6Guq7P9oNNRzHriyf5ebfsDPTck4Xq685Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E2Hn1VMAJEWsmb3Jj7aRSAl1RhzlAm++JKggZ6s4Lh7LAN5MTZgi8hcGuq6ucF3SqU9GWvn1rDT2LYEugU7XsbRKcVyZ8fTdSPtuS3jlIVyykt1lrTLdh8zkOdgLSjTi7MqU+yHoH/a1wiZ9yelp2S/zGjvnD8/je+nDHIK8ME4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MJUZT5nx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 50A44C4CEE1;
	Wed,  4 Dec 2024 12:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733315236;
	bh=KQEwRGzVH6Guq7P9oNNRzHriyf5ebfsDPTck4Xq685Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=MJUZT5nxEINyp/XN+HeUlRl90jts+RL99KAnp2TGuEuJJ6wJhZnOHo1b5iuaHSARW
	 fi5ZPX97UxRUbLKwVReDNoLZBD6nwgwetFM4ZLAvlgPyIPYR/2XvptVJmxgg008LLS
	 /JchyMR9k6v3A3h4KN96G2FmBZ4A4Laid2f+jR/AVc791nhCnsSE6SXemVB22YERKE
	 TLs2e2Yma/D3kkdbO+iFyox8oiWYFJQuHv+0kGrcMpriRR7w8tr+blGVcgcCkcD8oQ
	 WPJJxOBGjbKrPKss0aDPElTD4QchnfUO52AGvXhmrmt0AllwLY6YtvGpm1agHy9GkF
	 ngDyFlzdz/WGw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37336E7716B;
	Wed,  4 Dec 2024 12:27:16 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maud_spierings.hotmail.com@kernel.org>
Date: Wed, 04 Dec 2024 13:26:37 +0100
Subject: [PATCH v6 1/3] arm64: dts: qcom: x1e80100-vivobook-s15: Use the
 samsung,atna33xc20 panel driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241204-asus_qcom_display-v6-1-91079cd8234e@hotmail.com>
References: <20241204-asus_qcom_display-v6-0-91079cd8234e@hotmail.com>
In-Reply-To: <20241204-asus_qcom_display-v6-0-91079cd8234e@hotmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Johan Hovold <johan@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Maud Spierings <maud_spierings@hotmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733315235; l=1761;
 i=maud_spierings@hotmail.com; s=20241110; h=from:subject:message-id;
 bh=2plrXoM2oHD6ge2JBJBJrVaTYK/6c0XEQaFkS7h2S9s=;
 b=GCoUf+wme21lJ7gKtzW4klH/UMu4volNQo+Byt34+ICLXhmWrwG2SQiJ08tDg2Cn45ekTmKtG
 MRLof8zJvmwB6H9zDIeiuH9q/zCqhAjvTM5gtsP/dOdy1bQHy3jFEO7
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
 .../boot/dts/qcom/x1e80100-asus-vivobook-s15.dts      | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
index f25991b887de3fca0092c5f81c881c5d8bd71aac..d909167dc7119fba56e0240f6f24fd1a803fa94c 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
@@ -8,6 +8,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 
 #include "x1e80100.dtsi"
 #include "x1e80100-pmics.dtsi"
@@ -407,9 +408,13 @@ &mdss_dp3 {
 
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
@@ -475,6 +480,18 @@ &pcie6a_phy {
 	status = "okay";
 };
 
+&pmc8380_3_gpios {
+	edp_bl_en: edp-bl-en-state {
+		pins = "gpio4";
+		function = "normal";
+		power-source = <1>; /* 1.8 V */
+		qcom,drive-strength = <PMIC_GPIO_STRENGTH_MED>;
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



