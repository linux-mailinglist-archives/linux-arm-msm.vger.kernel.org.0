Return-Path: <linux-arm-msm+bounces-76425-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F20BC5611
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 16:06:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 61C3D4F7052
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 14:05:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A717A299924;
	Wed,  8 Oct 2025 14:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rqVIxxcJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9852949E0;
	Wed,  8 Oct 2025 14:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759932331; cv=none; b=jP7K11HnX6/kIpjbK+lEMV2Dss+RJAFqdXaxnbxBO392fwI/vb9czcXEXZRq/rS+JgEuigSB2OSpprytI27+WPLYn1RVlTmDhc16bJfejAHf0nVhz4IHWCzHtbtaoda8k4aY7rnfwM7G4UnWRToOVpZ1Le8sUFDzKgyFpUBUt0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759932331; c=relaxed/simple;
	bh=3tJVUsaowdxp80K3Fs3VhRaBsb6TetaqSeHKjLqO0jw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QnVdWmINeTr7e87+MpGYjwvD5wFTG91mxpjFiTOlR3fgN7xJ9hXv5Dy1D+eiUO8cILMqp4LNTQ6r5CjaXlyvAuwMY4CqVAtjapC5LMIUOSwILkcInvURpdbsG2AG/t6oPr7HyMmQFf1S3Sf0yd7r0Dy+iEvKrh6qAQe6ZkiLFrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rqVIxxcJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 03E62C116B1;
	Wed,  8 Oct 2025 14:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759932331;
	bh=3tJVUsaowdxp80K3Fs3VhRaBsb6TetaqSeHKjLqO0jw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rqVIxxcJO148BVvATmBNP60JwSd8Bt6TK58/BoU4jM4VzHkys8LxMYWWtFt7HLUUx
	 gxAFGFiD1hnpqL1Zt5Y5fRp3EEqVngnEXP5GfM8ilubnHNc8/WCuWtJin5uga09Nci
	 Eye/d9goSGSXfmyoOridtOpDgZmycluw0P9t5+97tAIvBCoz5Q1JE8BrzyFkwjqBBA
	 v8V6uQreZHIPmLl683yvKVL31x30+JPxVblOHsy5WPokuQ3fp7D6LvhGAc1bgCB9GE
	 fKDUIxRVlSC9zgsb25ckbkie+d/d/KuLM5VZ3DglIeteSvTZkf8jWFTcOSr5W2G8Ly
	 tTulIaYm1xNUQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF60ECAC5BB;
	Wed,  8 Oct 2025 14:05:30 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 08 Oct 2025 16:05:33 +0200
Subject: [PATCH v2 6/7] arm64: dts: qcom: sdm845-oneplus: Group panel
 pinctrl
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251008-s6e3fc2x01-v2-6-21eca1d5c289@ixit.cz>
References: <20251008-s6e3fc2x01-v2-0-21eca1d5c289@ixit.cz>
In-Reply-To: <20251008-s6e3fc2x01-v2-0-21eca1d5c289@ixit.cz>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Casey Connolly <casey.connolly@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1999; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=5GvFr+5VUexi+/uUvkg17qDYTvfgOqthqFHsVHOQK9s=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBo5m+pSpDF0SJRbsFIkbOPU53ElSfE6bo5AUBbn
 l3JVHR30AiJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaOZvqQAKCRBgAj/E00kg
 coq/EACxm8V+s0Y/GDc4+gVDvkY1g+g4y3f0RhQEwClSHssMxMNmbCxY7f9eueSAqwxXBfrWr4z
 4aFp7r9k9rlwakNfvhT3ipco+ytuYDQqttfn5Ss/HXY77th0irTQqReLr/d3kGWR4OkGM+KAz61
 5EcmdBz51zP8WI7VAS1dDnMVJhve6iF5ZFf0hDKmQD0wczm1TC7r0sfaSIvC+wyeJ1V5Q4P49ly
 IPBQuOaCw6Sw5x4jlb/0Z4g6VaaSAkcj3Chjb9qOEgvVCKunKWPNTFjXOKtCCSbj6gOeIzyHz02
 thIkj0TS/br95Z9InQZsug2jkT5OEMBoZ3de7K8scYn/22869iTEoT0tlWn/D8cu1PVYy2zd7AJ
 KTwcQS8/FasiJzL7JH508Q3EFuOfAwSGQ+IS5j/4P2Cjk/7pxhtj4Imlbgvp8KeNLHS9UUavvfU
 qURiaqUyGbokyCe7HYITHjVvgpgd3PinlpQ84Xa3UitAl+9wMYbVq7NpxqP2F+8WilgUFR5jqsS
 7XDDEsKKrYdoGZSgly4Xthg4Zo+c/J6yo/Ow3zqbYAwsHvPKLiHDAYcfWHjyqStub7JINVR6w7h
 FaFKkEJRehg5RLyqYr+6PR2GKK7eiEucsqaY4ttAgLsaM05yANZ56h5PoXhuZhuG33SCxmiatqY
 nGSVzyYqbupIkXA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

As these pins won't be used outside the group, let's group them.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 46 +++++++++++-----------
 1 file changed, 24 insertions(+), 22 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index 75989b377f8bc..c216369fae237 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -464,7 +464,7 @@ display_panel: panel@0 {
 		reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
 
 		pinctrl-names = "default";
-		pinctrl-0 = <&panel_reset_pins &panel_te_pin &panel_esd_pin>;
+		pinctrl-0 = <&panel_default>;
 
 		port {
 			panel_in: endpoint {
@@ -848,6 +848,29 @@ panel_poc_default: poc-state {
 		bias-disable;
 	};
 
+	panel_default: panel-default-state {
+		esd-pins {
+			pins = "gpio30";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-down;
+		};
+
+		reset-pins {
+			pins = "gpio6";
+			function = "gpio";
+			drive-strength = <8>;
+			bias-disable;
+		};
+
+		te-pins {
+			pins = "gpio10";
+			function = "mdp_vsync";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
 	tri_state_key_default: tri-state-key-default-state {
 		pins = "gpio40", "gpio42", "gpio26";
 		function = "gpio";
@@ -862,27 +885,6 @@ ts_default_pins: ts-int-state {
 		bias-pull-up;
 	};
 
-	panel_reset_pins: panel-reset-state {
-		pins = "gpio6";
-		function = "gpio";
-		drive-strength = <8>;
-		bias-disable;
-	};
-
-	panel_te_pin: panel-te-state {
-		pins = "gpio10";
-		function = "mdp_vsync";
-		drive-strength = <2>;
-		bias-disable;
-	};
-
-	panel_esd_pin: panel-esd-state {
-		pins = "gpio30";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-pull-down;
-	};
-
 	speaker_default: speaker-default-state {
 		pins = "gpio69";
 		function = "gpio";

-- 
2.51.0



