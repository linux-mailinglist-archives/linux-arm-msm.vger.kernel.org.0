Return-Path: <linux-arm-msm+bounces-80094-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDC7C2B869
	for <lists+linux-arm-msm@lfdr.de>; Mon, 03 Nov 2025 12:53:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7BF254F0E41
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Nov 2025 11:46:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB2AA306483;
	Mon,  3 Nov 2025 11:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ObJpZC9h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A2530497A;
	Mon,  3 Nov 2025 11:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762170352; cv=none; b=MaNrBaXx5q5xMfrpeW6V+WW0TEsY22LxEOZJ04FaDNPL1vxqZL1sJ5N2Q7NRyNRufhvkT8GFJGPnF8npkWrf1KiZ+zfZTBnu+n91YSHfwTEw5m9oWqdnXLYOM3Cz/xBZQL5ZU5eH2Y9FTTK3tP0B0F07Sb5Xce3m52ecZ2caQ2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762170352; c=relaxed/simple;
	bh=M/Uy+u5ozJkpftLy+xP0oHxYZDk4/bRqLUzu/oAXF6w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mguW7aL2dwso6a5I46GXALa2f19c1FgZRPzhJHr9FATf8Vl0HZecKL1NkUZ9VNR6mwYxvb+8oPrv5z+ewVpaT/BNOQl3RvKfEAqIX9sPkbJjM+HIsWNmtvgSQDDCb+wu6mAIwTOx5aX2OjcJDLApQopQQNDASjRgDTa/w224CZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ObJpZC9h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 493A8C4AF0B;
	Mon,  3 Nov 2025 11:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762170352;
	bh=M/Uy+u5ozJkpftLy+xP0oHxYZDk4/bRqLUzu/oAXF6w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ObJpZC9hggTbTC0OfmQNPx4GpaaYM7OUj1OVkBe/mSPl+c/UGmY3aHh0h3TehO5iq
	 kj/nkjem+/5MaQ0JwM2XYFYUdSl552y4iMHvGieHCu+znGQJMbLvCmGsGcuZf/K7PQ
	 7iOwimaLH9iFS6gfS0ac8MsEadYeyzc//wKhkbe4LBtHMlgeF9kppwE2nrHwZ9GBbp
	 9Y8LBkoc3ONs875Y0PmQE+yDemYC/c9naryJVpUDorvReu+PiGqJunUeLN2IHwGpS4
	 9X9FQDwSTTxeGuxH4XjlqTqwt5yQj9JrVYEiOXne6WQC1gbTb+gSkzA+8pYqLZjmfm
	 kSQjknUn1V1NQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 423A7CCF9FE;
	Mon,  3 Nov 2025 11:45:52 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Mon, 03 Nov 2025 12:45:51 +0100
Subject: [PATCH v6 2/4] arm64: dts: qcom: sdm845-oneplus: Group panel
 pinctrl
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251103-s6e3fc2x01-v6-2-d4eb4abaefa4@ixit.cz>
References: <20251103-s6e3fc2x01-v6-0-d4eb4abaefa4@ixit.cz>
In-Reply-To: <20251103-s6e3fc2x01-v6-0-d4eb4abaefa4@ixit.cz>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2083; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=lb+GbJGxJgK2d3fIap7gSBx+1yLKhKOT53wmKqsWzJ0=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpCJXuX6DPV5P6vzVpZk9sr742nGjlNUVFjnSMP
 7CU2G3IQ3aJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaQiV7gAKCRBgAj/E00kg
 cu3LEAC4YNe6NXKR36r9BEgn0wcY439gaL5NFBykgcsKfbkPo0ZqQk0stJEqFTctgj/oPSYcBmx
 DNhpeWgyrfqKwpWFUOvNiNO7xIdF/iAKd75Qalloa2bUkil9OpBNq3CMSCa/kSGPpOQ9DdGSwt4
 3fr4QJ+Hdn3WjQMPpyNbdWkHWTubj4+io++e14+lSLdcx8x4ICzF4/cWRY0dGjinZRRJWrDgfqV
 bcay7/QcBtp40Q+0e7YjERk14vJFPnMGnby/dAPy8F5fnX5721dDyEMolu2VsWuxdmPL7qMi4kF
 lnzSS2tQvI5TywkWBxC8MA/OvobCpwtL2IAoGnOQVi4vkN2D+6WvijewsQBOKu5eByWXCfJ9nSN
 MPkEyP4qCrakEzkMkSTx9IJro5Yzl/bIu2ZhcCa3R2rUPTbuXlYG4j9dXDOC32j7TYKyTMZ/e/u
 v+dounzXqu1/nYtQXicqAC6+Gah1SpAC/o48ce7G+wQOkWuIbYH24Ahm3OGC/uFtHxxqBUMzwU7
 qIVn2kpGIX+sEqiJOMjTYcRBV7HnVwuJdO1/c0IjuDw6712WWufuzrnKX32F6FTKGBAfF9aCdr4
 WyrPubX7XW/o/OQ1Dk5NMcBDTb209id3RmFfddLRjlypZr78Mx5NoA0FJM8bKRrHFyAZ8dcB6LY
 i8EaDgadXjlhNTg==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

As these pins won't be used outside the group, let's group them.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 46 +++++++++++-----------
 1 file changed, 24 insertions(+), 22 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index d619b710c63fe..d59a5e8cdeb2c 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -450,7 +450,7 @@ display_panel: panel@0 {
 		reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
 
 		pinctrl-names = "default";
-		pinctrl-0 = <&panel_reset_pins &panel_te_pin &panel_esd_pin>;
+		pinctrl-0 = <&panel_default>;
 
 		port {
 			panel_in: endpoint {
@@ -841,32 +841,34 @@ alert_slider_default: alert-slider-default-state {
 		bias-disable;
 	};
 
-	ts_default_pins: ts-int-state {
-		pins = "gpio99", "gpio125";
-		function = "gpio";
-		drive-strength = <16>;
-		bias-pull-up;
-	};
+	panel_default: panel-default-state {
+		esd-pins {
+			pins = "gpio30";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-down;
+		};
 
-	panel_reset_pins: panel-reset-state {
-		pins = "gpio6";
-		function = "gpio";
-		drive-strength = <8>;
-		bias-disable;
-	};
+		reset-pins {
+			pins = "gpio6";
+			function = "gpio";
+			drive-strength = <8>;
+			bias-disable;
+		};
 
-	panel_te_pin: panel-te-state {
-		pins = "gpio10";
-		function = "mdp_vsync";
-		drive-strength = <2>;
-		bias-disable;
+		te-pins {
+			pins = "gpio10";
+			function = "mdp_vsync";
+			drive-strength = <2>;
+			bias-disable;
+		};
 	};
 
-	panel_esd_pin: panel-esd-state {
-		pins = "gpio30";
+	ts_default_pins: ts-int-state {
+		pins = "gpio99", "gpio125";
 		function = "gpio";
-		drive-strength = <2>;
-		bias-pull-down;
+		drive-strength = <16>;
+		bias-pull-up;
 	};
 
 	speaker_default: speaker-default-state {

-- 
2.51.0



