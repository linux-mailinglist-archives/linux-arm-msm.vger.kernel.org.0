Return-Path: <linux-arm-msm+bounces-85488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A4108CC75F0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 12:40:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8F12B30262B7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 11:39:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8713535294B;
	Wed, 17 Dec 2025 11:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fEmL2w0H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E69336EFB;
	Wed, 17 Dec 2025 11:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765971565; cv=none; b=lBSyG/V+xLVaXJha6LPfs5DgBVwCSwN2zu5vUuMYuOH/tCBI+4ZjQ4wgcWUIlsKoxnaohn5KqW7YQ3Qt941Jlbs/Jk275AomceeKVvpK1bwwlxZyW5tOtSD3xAh9NZM02vCDds8Yu79/DMjwUvTvejpxaH1RV5WMLwEfS8ob3OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765971565; c=relaxed/simple;
	bh=UBBMQPfV98dGtF+VcB4/B4DIz83VQKcpLy0TYnD2vFE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D6zmQXJ1We+wcIICe31pi0ejnTnVyzMJdluYhdxr1bBiHpggShCgMEXOXfmDhLYITeXlj3LTQibtwiim5Py+TfOvRXMoJbX7z7wInUHwnyDERdKvGiLzSdt3BEh/KxQ3qXS8SBcLNsGuwZGRi4hIcxnTHegsG9kdukyNwpH4eAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fEmL2w0H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 035B2C113D0;
	Wed, 17 Dec 2025 11:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765971565;
	bh=UBBMQPfV98dGtF+VcB4/B4DIz83VQKcpLy0TYnD2vFE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=fEmL2w0HMLxy3zoW+RrOSvuoRHkInoJeRcEaZCfSRGqzXRjisxoqaT8jzigZgpt8r
	 uyUboI3wrxi5IEOw7+SzbTvNu00Xd+O3nxQSVwZh57ynr2fwLFTTTDMwwz5bX9sxHo
	 FlTVYsZWBlWOpFkVBx/BOsBphqnj8oyaqGE4cYj4RVyZyrzl1fLwV7cFS6kQeDvRZu
	 8d1PHqmnEK3f374Rwape3U9nSpORtUV8iKDvA4zRb00A6KH17gZ021Rh2MQ2cWnGfN
	 tXrSQF4yRtYtVcC3CWyDExWrrGY6FmlmZ6XKkepo1/GcSrxrQ99ohIQF82eTkUOb58
	 J+UiUfqF8/JWQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6CB0D6554E;
	Wed, 17 Dec 2025 11:39:24 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 17 Dec 2025 12:39:24 +0100
Subject: [PATCH v2 2/2] arm64: dts: qcom: sdm845-db845c: Use pad fn instead
 of defining own
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251217-sdm845-mclk-v2-2-7028c2d09145@ixit.cz>
References: <20251217-sdm845-mclk-v2-0-7028c2d09145@ixit.cz>
In-Reply-To: <20251217-sdm845-mclk-v2-0-7028c2d09145@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1827; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=G7P7fQVka9nSGdds0k6Y6wrfFIx/ZErtx2+mqLJCAWY=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpQpZr/A2qM22WqPw+Q71qbjioqzrIiiKfFT/lj
 u8kv9P1j6OJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaUKWawAKCRBgAj/E00kg
 cn5iEACCAAXd6M7MXTNJiUGEdp68z1bey8nzUcpByTrg5KFvdDibR01TBQCztY1SVbelBwL6WMl
 9/Uwwo/j/kK/e9GICVUi+uBlkoVAld5+SFiIUp9LNdHrI+YvXtasQoVwcj76pnJDdF6qehV1hbk
 y6UfA3Z66EMXYcYHSfFGm3CjtkyNlukefbThlr7Fj73E/VCfD7ZEiy+2rOI9Bdi5LOMq2Dfrmtn
 +tBQKZV+Y/9PUZsqQNDdaM7+DuMxDnFBbhSxEBQLmf7R2a7UmuNNwFXne0omCAl7TsHfv/1Vrgx
 QUAGSs64YOMIjY+CVLBRafRFajRYhCN1icVe/BBPUIbCyQNsc5Hs3+WByH18ScWQxWwxvDkxZZv
 LceQsWHlksC/U5qpuLDMUwoI4cvjjPUeG4qqcTBnLFMnBvl5JYDCmVX5gTpUY7aeFsilu2oGjRA
 LianfwjvmoWvzYRhtEhG/d5vQ+t+/diF5TUA83p//S/HIiws2Kiop2m39rJ/LnzkokzICVS6yDg
 4u8GeaMCagB8SLY6c2yc8AyWEpLywfM8DnRHnO4+0K0Lx50UkSuUiN0ELxoi8lUGd4sgOp5RJVn
 QuCmpS8AbCNPKgAwkSj4W5BvML/laY9ujaMhHwbqtYBtP40nmt5UBVChIvnP/cwWsWc0xbwNYI6
 MDQ8nEqyUDlO27A==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Instead of defining own pad function for master clock, pick one offered
by sdm845 device-tree include.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../dts/qcom/sdm845-db845c-navigation-mezzanine.dtso     |  2 +-
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts               | 16 ----------------
 2 files changed, 1 insertion(+), 17 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso b/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso
index dbe1911d8e470..f6c2c98970d76 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso
@@ -40,7 +40,7 @@ camera@10 {
 		/* CAM0_RST_N */
 		reset-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
 		pinctrl-names = "default";
-		pinctrl-0 = <&cam0_default>;
+		pinctrl-0 = <&cam0_default &cam_mclk0_default>;
 
 		clocks = <&clock_camcc CAM_CC_MCLK0_CLK>;
 		clock-names = "xvclk";
diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index ce23f87e0316b..518d2ec657b13 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -877,14 +877,6 @@ rst-pins {
 			drive-strength = <16>;
 			bias-disable;
 		};
-
-		mclk0-pins {
-			pins = "gpio13";
-			function = "cam_mclk";
-
-			drive-strength = <16>;
-			bias-disable;
-		};
 	};
 
 	cam3_default: cam3-default-state {
@@ -895,14 +887,6 @@ rst-pins {
 			drive-strength = <16>;
 			bias-disable;
 		};
-
-		mclk3-pins {
-			function = "cam_mclk";
-			pins = "gpio16";
-
-			drive-strength = <16>;
-			bias-disable;
-		};
 	};
 
 	dsi_sw_sel: dsi-sw-sel-state {

-- 
2.51.0



