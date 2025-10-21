Return-Path: <linux-arm-msm+bounces-78155-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B1979BF6595
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 14:10:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C2DBA4046B2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 12:06:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8561D33344A;
	Tue, 21 Oct 2025 11:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NwFuJJU5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F92332ED8;
	Tue, 21 Oct 2025 11:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761047588; cv=none; b=C5Q4GSBZ7Qi19PMfs24elSUuQ7DCkEvfB4zJ3/duBo/vWw2XL//f1Ru/bJL/aW4xcu2AnHsHTO6tdE4cF7dJo7fhvpqDTL/LMruoKlh75HEzJknzNM0SYR0Xs4sS82S2fT4W6woXkFqhfDc6FYNFJ6abgaUF3Hd22bwrRGQm+uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761047588; c=relaxed/simple;
	bh=fj87h6fHhPiKSl6C5poX504gv/9y/218PwQyedWdhg8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=evOmBg1NW8RihavwvVhWqaSxruFfQvZaI4l1rBQYRGa52FdozHDAjEp5wyEziTrLaYVqY5fLxS6XXjtfznFfaJUQs2t76jfjrEiAGI71fSfEfgb9YniHuSgYj2pB9Kg8ME1Lg7qOCUKJjf0HiXVJpCw2sa8LzVnXS6CMJr4woQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NwFuJJU5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EC279C116C6;
	Tue, 21 Oct 2025 11:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761047588;
	bh=fj87h6fHhPiKSl6C5poX504gv/9y/218PwQyedWdhg8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=NwFuJJU5vMMje1o9FS3cTBBT8Izn7i/8faRGaxEOI4bLpe+a+Y2kTMZvrIugMuTPe
	 3fek92YoK7nPY3AnMoANHkzZ2it4YyW5jTmR/0JC+mNOHr/dP1ISgF+jXPv6Y+UkBV
	 rASTSVRDUlooecuMux0CuBM9soTzeJivtakTuilOoWlPFYY/XzYb/VdX1pGqnlfyva
	 PN3MRqrg2Q/ZadK0aIjgt+EE2m5az616tT5p257NkYHYlq0bj2NkccvpUp4V9+VFET
	 RKay/RlTgmmaDoRKlarquQv4WPWFslLZ3PSNzoyaw8twb5XPI3WdoWxrVZe3stkjrE
	 CtaKIpRhu5YBQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E140FCCD1AB;
	Tue, 21 Oct 2025 11:53:07 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 21 Oct 2025 13:53:04 +0200
Subject: [PATCH v4 4/7] arm64: dts: qcom: sdm845-oneplus: Group panel
 pinctrl
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251021-s6e3fc2x01-v4-4-5e3ee21c688a@ixit.cz>
References: <20251021-s6e3fc2x01-v4-0-5e3ee21c688a@ixit.cz>
In-Reply-To: <20251021-s6e3fc2x01-v4-0-5e3ee21c688a@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2066; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=KTrLESxmqDJURSGJs44NIqxmLK4hwbD8ph2DGEQH+CE=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBo93QhYI72W+xL1iYR88xJCffoEAu642WnVDrao
 s6SRRtq/dOJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaPd0IQAKCRBgAj/E00kg
 clv6EACVHWSXf8INehHmARalnfS2d8uET3mOQRebSwlbgVKmeQntR6cmrg9LGNOck6cod4zRIzC
 ZSB0DUjS1eKC+Dy6HM6gxpNI9F1NWIlv8cC6X6tj4isG+wUXeu6fGvTXrJk9m67fh0ZxFjSRSbd
 o7BBbzrWtgqpGbjtLpxLu0tRnhaULOF/5lHWcCvTMUHcSjcx99arDFSVd8/+4QPUtdjBhVCcLwP
 Naqj3RIad4j5qHt1t9uiowVqpvxQ0K1hYjn64AAajW9+5mAEPkOD7ZbspRc6njSAQpb0yktcpbL
 LNUTS6cXL6IV7R0GlSMFkTEYMy6s1TS/fBz18y+/iMcm0ZEuL0n72OOK3Palr34WOjf3M+UsQ7j
 HkTfK1mWg5HbSPCrVx+JlpboizW8Z6zexy/3xPkIgaMSZ2iSJH7s0UhAQhlGie5JYWdqwXM4oNK
 9KOn/Jl1kz0VYLneK4yuSO0W4F6CKEbOpstc9T5iMwwX8THJ0sZ+o/Kn9ty1Gk1sFTou6VHleYo
 aIJ7NrWw0lLtlsUw1zSTyLzBWrjXOYOzHiriR5iFIZNhMjIrdw5DalOo2Px9hQKVu/ZBATfSkyM
 lAvI518j9mmulDWEEzi0cpU7ek08GELVHfoK+H5xdejDqPcZwFEhdItAjCoZF90n3mFeH2808qg
 WCAHQYlKOUi/xFg==
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
index 1cf03047dd7ae..9b571fab9c80c 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -463,7 +463,7 @@ display_panel: panel@0 {
 		reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
 
 		pinctrl-names = "default";
-		pinctrl-0 = <&panel_reset_pins &panel_te_pin &panel_esd_pin>;
+		pinctrl-0 = <&panel_default>;
 
 		port {
 			panel_in: endpoint {
@@ -847,6 +847,29 @@ panel_poc_default: poc-state {
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
@@ -861,27 +884,6 @@ ts_default_pins: ts-int-state {
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



