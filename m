Return-Path: <linux-arm-msm+bounces-78648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AAEC03614
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 22:24:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 589644E809A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 20:24:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E27DB2D47F1;
	Thu, 23 Oct 2025 20:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zv/G+MoI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FF32C11EF;
	Thu, 23 Oct 2025 20:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761251070; cv=none; b=eQocQDO5qNq34d2d0o6yxkdCIdbmGki6cGjk2DIEGmbnrHiHkDtstqlfwciKQoeJAN5Jani0n01A0DK/ERrC6SEqw3c0D/ekLVAVY6qSHxdaus9y+LOfWCTu7AkNs+TPM9s9gNZEqKV2T/3TSoACnwn59kGajnL/jXzAWxtqzok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761251070; c=relaxed/simple;
	bh=5X+p8856R9wQw/SJFD+sls3MORYg4XJwRc2UpYjPT94=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MvBFhCn2l0jW+XzQG9KigvRnT9Fd/qwe4BF2MR3dg1UnrX0bGm0wj5XnM9BIGFQpEsQbE2H4xq5QqNIrVq7r5zDU5vWUCVnFLv+w+ou3255irqRTYHj+VSGuveTM8gXjJQzFsnQDkkYzHdW6x9he6SUwAz62EgJM2cPWgoxXY9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zv/G+MoI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CA760C2BC86;
	Thu, 23 Oct 2025 20:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761251069;
	bh=5X+p8856R9wQw/SJFD+sls3MORYg4XJwRc2UpYjPT94=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Zv/G+MoIvnUtHDfW+AUGZo2pNNFg7UH/6/z9gcLJ4S8LOHVRdpTjwcgLEHbasKmdJ
	 rO/2PJ4X/iRpGvtt7VRmImCAX3dyxgQ77bkiiOLqfR4a+c1qLrIoipqVd+CshsW4XQ
	 inrdCkv/teCfTuI1HzgaSHUw86hbForXAXtSWEqM7J9s7M8KtjBs46CG0X+YyaCzv8
	 6eJVYW9yyxTxnu5lNTVV4f23N+cNiarT+qaSg3NJaMRbFSTVt7Tp+Og2EE3NZDHJGe
	 KC0UC6yRhEJX7PiupNKncGcBAt1Fv6kCJCnJLUF989a8CIE1Z+maJbOOo+OdfcJfQO
	 B0RKSEWKLcVoQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C068BCCF9E3;
	Thu, 23 Oct 2025 20:24:29 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 23 Oct 2025 22:24:29 +0200
Subject: [PATCH v5 5/6] arm64: dts: qcom: sdm845-oneplus: Implement panel
 sleep pinctrl
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251023-s6e3fc2x01-v5-5-8f8852e67417@ixit.cz>
References: <20251023-s6e3fc2x01-v5-0-8f8852e67417@ixit.cz>
In-Reply-To: <20251023-s6e3fc2x01-v5-0-8f8852e67417@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1553; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=ojFoQ3nmgXFa6brSu0i4y7xk0ivDDVrkpAAIpMNxPBQ=;
 b=kA0DAAgBYAI/xNNJIHIByyZiAGj6jvuhdaObq7PRbz6REhvlARUPOBsk3a8lzcAfCE3kAQ1eQ
 okCMwQAAQgAHRYhBNd6Cc/u3Cu9U6cEdGACP8TTSSByBQJo+o77AAoJEGACP8TTSSBy88YP/3Gm
 XfoA4EZd63lFay2zcCR7647GB3tHS4bLu/VXW2dvPstWbrgHCMIqLK0G8X7WVdtoPPwQZoJhHjn
 3a+fHeIR/r/TZN6F2L1qoJ5e85XahXf9KlmDiPogPC77eFDi1eBC+IsBDh855OxFE9SkENGnpFx
 kGtkVHsejmfpQey/D5CmxK0XLNR80iyxYGU55JyA9uU0gPQNZ9v8MRLPkPEEOWeOtYfLod9b3af
 nApOrtczzTYfNHYr9UA/g6f9QYLV5v87JfCQNBo8D5r576taBKM4vk/hB/ZoLN22cdgdsEJHLA/
 IErb1Vffegt7an9wrRF5F7huEx/29SS8n0JIUaTL/fZfazmCIYPc5nUoTSk8qDAmD1ArtzxXKLA
 9SK2yyLRVQdEefBAOJPanhUIHk+ksasurNdSzhxdAVaRe4hk/VasG12P/w5qPK/ATLH8P8sorgQ
 mVRWydEfij7eQnejurFTJux8TexA3ounkOrfrnMcYrlPqiJUPC44PF23iqjQVbvLLlYHWDMAWrd
 HHApzz5nRKIfUs/MtUCpGuNiGzWn3DAa50Zm6FFyrrT7pk92FUryRCZJp01DJcwWdVJ1WT8lSpi
 5dnPVppzNPHy1PzbposBTriJRHoouW2kGDkR4qmkQETClWcC1BRBLidSQxFhAFiQeIoId9jnhnP
 MEtwc
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

We can DSI pin from 8mA to 2mA while suspend, do it.

In theory, should give us extra 2 hours of idle battery life.

cosmetic: sort pinctrl properties.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 26 +++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index 9b571fab9c80c..a8e87507d667b 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -462,8 +462,9 @@ display_panel: panel@0 {
 
 		reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
 
-		pinctrl-names = "default";
 		pinctrl-0 = <&panel_default>;
+		pinctrl-1 = <&panel_sleep>;
+		pinctrl-names = "default", "sleep";
 
 		port {
 			panel_in: endpoint {
@@ -870,6 +871,29 @@ te-pins {
 		};
 	};
 
+	panel_sleep: panel-sleep-state {
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
+			drive-strength = <2>;
+			bias-pull-down;
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

-- 
2.51.0



