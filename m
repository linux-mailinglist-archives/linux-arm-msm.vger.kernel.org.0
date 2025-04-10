Return-Path: <linux-arm-msm+bounces-53815-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B27A8404C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 12:13:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 752D34A4D2F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 10:10:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9597D26B978;
	Thu, 10 Apr 2025 10:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HGjxgOcj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6066626B2A8;
	Thu, 10 Apr 2025 10:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744279683; cv=none; b=YXuVJC2sfnTxgh09EtnJiVd9pPFm46Vq9302C4rZM5KuXJGvcQJSyyddF30bWXWOlkmG7VRjWRsEpQo6RM8ZJWoSgEwRpFnYTBB4s2rnLB+m0usVkZUsGSL0uLsBam6CkO36ohBcgr9yvWIg2OHZMAtdnYpxP/AYX53rn8c5PO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744279683; c=relaxed/simple;
	bh=vCEiD0VeDvPphO6mrL272x6UVyqhJbkASn305g3+uww=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VPSTpbvFQA9vJSKb8Ez8NocslU+GKqzHHGD5NgtRM5+S5hiFQ1kRArY5+Ftg00Q+X07EoSoTb90+KVu1P9a7yK4R30rzFBGqRgeYNfUp5DHOqnYmlB5xFTVJ49D6Z3RbQgEUt2aK66d74aSe3nmT+67IuE/jLaYlk3ff9M04dnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HGjxgOcj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E5A7EC4CEE9;
	Thu, 10 Apr 2025 10:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744279683;
	bh=vCEiD0VeDvPphO6mrL272x6UVyqhJbkASn305g3+uww=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=HGjxgOcjalfpkvNM3o6WOCvkoxSBh2J4EWCZpnPuVvldphWgjG0YVFfQBphKgVduw
	 bJlivQ5cjeVeXEHppS22hlv+PXGp9jsvhWe4ORN+MdLEJoM8PuSJWIgpzZXiOPxImq
	 LL3NfWb3rFZ7RkZ47oKgo0jO8JuSJiS8pRktF/hdPyZZqeanFK1LsXJwCMIPOP5eYI
	 9c/m8dro3Ykx7Q45Y6x2EN95jDKabVpcm+zgyFTPHxKH2B/5a8XnuL/8L+rcXD7H4x
	 XBV6HpVzGkO9LmJqOcFPzh2pc6yHZLC0NPlMMPgLeoz7SxFLMLuJey3VKyDQEjTuGM
	 SLgGsxomg8ZTg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7E51C369A6;
	Thu, 10 Apr 2025 10:08:02 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Thu, 10 Apr 2025 12:07:28 +0200
Subject: [PATCH v2 1/3] arm64: dts: qcom: x1e80100-hp-x14: add
 usb-1-ss1-sbu-mux
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-hp-x14-v2-1-d36414704a0a@oldschoolsolutions.biz>
References: <20250410-hp-x14-v2-0-d36414704a0a@oldschoolsolutions.biz>
In-Reply-To: <20250410-hp-x14-v2-0-d36414704a0a@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744279681; l=2235;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=2GTwm12Gqkjt+P5Y8u89X8mSed3z0SGqphw3cdBNB8g=;
 b=dBkcN3123Ev1D5obkTcKjfmENFnGC1ZwLqoRWg0LQykEXoHSaFoR8k3AQcoi5hhlyOZ6OYLJC
 63gs7SvyuuzCRGmpHt3GrajV3vDeRC7BA8sa8RGST4W+oY5zquFSkuL
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
 .../boot/dts/qcom/x1e80100-hp-omnibook-x14.dts     | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts b/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
index 26ea1787e5ecfb727a4f890895b7d7fb7b3f005d..582d4326d5d527d20f99e716349ea0e9c0d35099 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
@@ -153,6 +153,14 @@ pmic_glink_ss1_ss_in: endpoint {
 						remote-endpoint = <&usb_1_ss1_qmpphy_out>;
 					};
 				};
+
+				port@2 {
+					reg = <2>;
+
+					pmic_glink_ss1_sbu: endpoint {
+						remote-endpoint = <&usb_1_ss1_sbu_mux>;
+					};
+				};
 			};
 		};
 	};
@@ -477,6 +485,25 @@ vreg_pmu_rfa_1p7: ldo9 {
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
@@ -1424,6 +1451,30 @@ reset-n-pins {
 		};
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

-- 
2.48.1



