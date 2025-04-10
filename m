Return-Path: <linux-arm-msm+bounces-53792-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB56A83E12
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 11:14:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3349D7A7169
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 09:12:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7487820E33D;
	Thu, 10 Apr 2025 09:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gPJac4hB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4214920C49F;
	Thu, 10 Apr 2025 09:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744276410; cv=none; b=mAgsKZBS/79v0bWz3w6HUGREmJK/peD0SinW4ozRhzy0wBl8w7tRK1Xg/AxFNFJhf4Ld6bBCTCjzBS5YIOso0de6+ko7PXhaWW4eQT+DevQ6vvxkAwVvlpiq3Eg2ZpS0xCQAhaV+ri20GHil/5rOV0boraGyEiFRiPZwCuys8O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744276410; c=relaxed/simple;
	bh=Cn8/X5Kk2VhUl1FJ/QxiVphTBP9hc4tIAcuKU72Xb+0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FO2pKCY2FoPwywPoPjezlhgict5kmv1QTsr/k8oc27KmBDtuKpgUtcTPo4JKg7KXTUPnDbk/aANoUIbs+JSDpfgM5lYjOuIYQKy0BoZYxO7DgPSJtHGWD3bB2tohnQTRS7HmwTeAuyrmQ9exSMd/5GsYbBkIYO1RBrm/EMnOE8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gPJac4hB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C0934C4CEE9;
	Thu, 10 Apr 2025 09:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744276409;
	bh=Cn8/X5Kk2VhUl1FJ/QxiVphTBP9hc4tIAcuKU72Xb+0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=gPJac4hB0yClk4rmGAGurO+5GHrt+I0QnOU5Dus2fY2UvuAW3Ixn9mmZghtz02KBK
	 sRx1MSIojNFqqSa23hzyGAtXLImJd5oc1+YmypWtuMTS6UEMYmGIyiDavrSCRazOF7
	 ULFAZXN8oZzKfMpmHk/UN+lgyPp4yQ1YmexsTrPYdxBgtBgs+99v323qgZ6rjXiqFx
	 Nqu26RS1wnmRhAqnXLqVt27t4cviNLIUFnbQShToF9t0Lw2gS2IbQuTxUjWhlkwPYr
	 UenepOPLfWH44hEqAk70caBfu/0KoSu3LuMOVNPCSnQB+jjTSk+bYTdDtRSvuxU2JR
	 /Dv7qc4qPwImw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1444C369A4;
	Thu, 10 Apr 2025 09:13:29 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Thu, 10 Apr 2025 11:13:22 +0200
Subject: [PATCH 1/5] arm64: dts: qcom: x1e80100-hp-x14: add
 usb-1-ss1-sbu-mux
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-hp-x14-v1-1-b4e5ca253ec9@oldschoolsolutions.biz>
References: <20250410-hp-x14-v1-0-b4e5ca253ec9@oldschoolsolutions.biz>
In-Reply-To: <20250410-hp-x14-v1-0-b4e5ca253ec9@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744276408; l=2656;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=1QuOk+qTOtwsagXmtC6sIpF6WI7ROIm97jqPlTthzyc=;
 b=6VjqoGKCDfw0IceKLdkNtaey1WlqNP57HxkOCP/MtpZtg1W+QU4Z3YCtMYiIY+KpiwSXkRCPQ
 TrgWuzhMXVRAsESzRng+BelDxflHT9zQvj5IIzshueTwJOD8LexXPRk
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

The usb_1_1 port doesn't have the PS8830 repeater, but apparently some
MUX for DP altmode control. After a suggestion from sgerhold on
'#aarch64-laptops' I added gpio-sbu-mux nodes from the x1e80100-QCP
tree, and this appears to work well. It is still guesswork, but
working guesswork.

Added and rewired for usb_1_1

Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
 .../boot/dts/qcom/x1e80100-hp-omnibook-x14.dts     | 51 ++++++++++++++++++++--
 1 file changed, 47 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts b/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
index 28298021cc367c279eebc08be6165fc1af9f2033..27f6b21589704b1767d45763773da4cf9c43c77b 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
@@ -150,15 +150,15 @@ port@1 {
 					reg = <1>;
 
 					pmic_glink_ss1_ss_in: endpoint {
-						remote-endpoint = <&retimer_ss1_ss_out>;
+						remote-endpoint = <&usb_1_ss1_qmpphy_out>;
 					};
 				};
 
 				port@2 {
 					reg = <2>;
 
-					pmic_glink_ss1_con_sbu_in: endpoint {
-						remote-endpoint = <&retimer_ss1_con_sbu_out>;
+					pmic_glink_ss1_sbu: endpoint {
+						remote-endpoint = <&usb_1_ss1_sbu_mux>;
 					};
 				};
 			};
@@ -533,6 +533,25 @@ vreg_pmu_rfa_1p7: ldo9 {
 			};
 		};
 	};
+
+	usb-1-ss1-sbu-mux {
+		compatible = "onnn,fsusb42", "gpio-sbu-mux";
+
+		enable-gpios = <&tlmm 179 GPIO_ACTIVE_LOW>;
+		select-gpios = <&tlmm 178 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-0 = <&usb_1_ss1_sbu_default>;
+		pinctrl-names = "default";
+
+		mode-switch;
+		orientation-switch;
+
+		port {
+			usb_1_ss1_sbu_mux: endpoint {
+				remote-endpoint = <&pmic_glink_ss1_sbu>;
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -1566,6 +1585,30 @@ usb1_pwr_3p3_reg_en: usb1-pwr-3p3-reg-en-state {
 		bias-disable;
 	};
 
+	usb_1_ss1_sbu_default: usb-1-ss1-sbu-state {
+		mode-pins {
+			pins = "gpio177";
+			function = "gpio";
+			bias-disable;
+			drive-strength = <2>;
+			output-high;
+		};
+
+		oe-n-pins {
+			pins = "gpio179";
+			function = "gpio";
+			bias-disable;
+			drive-strength = <2>;
+		};
+
+		sel-pins {
+			pins = "gpio178";
+			function = "gpio";
+			bias-disable;
+			drive-strength = <2>;
+		};
+	};
+
 	wcd_default: wcd-reset-n-active-state {
 		pins = "gpio191";
 		function = "gpio";
@@ -1668,7 +1711,7 @@ &usb_1_ss1_dwc3_hs {
 };
 
 &usb_1_ss1_qmpphy_out {
-	remote-endpoint = <&retimer_ss1_ss_in>;
+	remote-endpoint = <&pmic_glink_ss1_ss_in>;
 };
 
 &usb_mp {

-- 
2.48.1



