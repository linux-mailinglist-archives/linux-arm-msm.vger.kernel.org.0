Return-Path: <linux-arm-msm+bounces-80095-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3806AC2B860
	for <lists+linux-arm-msm@lfdr.de>; Mon, 03 Nov 2025 12:53:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 236F74F9BF2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Nov 2025 11:46:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0AFF30648F;
	Mon,  3 Nov 2025 11:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m+sJtFzp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3AC5304994;
	Mon,  3 Nov 2025 11:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762170352; cv=none; b=Xb3FN5S+0pDOROufS90XcNg5NqnSt4rOZu1bYCNcVcH6u55LCDdl9RDTJhOYwFsNp7af0NdtQv3aROOMXmdsh1ciR3hrx7rhwlpykuMJiZ4SbGLBMpfSozXTgo8Crc+Lfz03ihFC5+BTlYUQFXPIJUsw5JACWjlA/nUo6fxR1O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762170352; c=relaxed/simple;
	bh=nXDeVQ0wQdG92t3Q9SWNAaZ98jUJtmiwu6D60hINFpw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MvR1NFanX8yZ+6GTmFdj0T+U5xSDZ/IYdpN3frxBWupxBH4ln3KVR5QGoRW5E7Mo+Q0bOPsJJZhsiX/XRDbILHB5nYFJtKq6EsOvNUMMLA/s+gewVCP9fc+v5c9pHK4OjLIUcidy8b9xQ2FfhwhBk1KbITvSr74M0vfqZvlRlsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m+sJtFzp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 58BC8C16AAE;
	Mon,  3 Nov 2025 11:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762170352;
	bh=nXDeVQ0wQdG92t3Q9SWNAaZ98jUJtmiwu6D60hINFpw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=m+sJtFzpxaWS2kkE1jPX6ioUKOnPjQKovA8uiLdM0mO4RVmCLbGcwkLRe4Rl4IqKc
	 bCsXYoKRdNWKUYuwZV73dI6CcEfOLVU7snzMNEk5DXDS0LzsyADbEH2+LifOSfgB2z
	 nihirLxAcpCJAV+Uw7aRso26UnhCWAxvh/+DW/P6uCH8fUaIYJXyDybHABapGo1yEI
	 5NCQksblux3gJ6TauS9yTcNWbRveubtoJxr1vgF67XnUVa1MY350sgsMQZ5CemUeHO
	 sa4kSf1vQUGHKYpeqtbJAQ6G3YBO2hNSskeRSAFIhgq/PGPg2fP7GfsBUmSRULBENi
	 h5R/QWVhDlpJA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50AF4CCFA06;
	Mon,  3 Nov 2025 11:45:52 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Mon, 03 Nov 2025 12:45:52 +0100
Subject: [PATCH v6 3/4] arm64: dts: qcom: sdm845-oneplus: Implement panel
 sleep pinctrl
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251103-s6e3fc2x01-v6-3-d4eb4abaefa4@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1523; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=WQYIgl3txe070LJxSGYEwJAp2NAlPO9ze25JpKPvsUg=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpCJXu3codYCCYJZRipGc1sfbU+nQD0hiJX7MWL
 Op+SBtM62yJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaQiV7gAKCRBgAj/E00kg
 cq/YD/4onliWEg7VvnsY6w+mNK/S6hoSnVahc3ZXt3Ummnspr9ru8MPzmij2H08Bz8L3fW4GsO/
 +oNNlsskD02zjWzOjjxAIY0Qw4tpVpKBUd38qJ/GPsqHkK6kFRZMnSetxIV0mjc3hxgE4JhwQrA
 tO/2ZihiESEPMceoiqVOEbGkNpnJORgl6QfMgXCwdchTH94EyXSQCSHhE7aAb5bJ8o33WJEI4rG
 ilVyE67HSil9nJLz8KAEft0JFl/h38k7w7vol2bWBhyYUEFhKAt1LHNEgQGag7MPxCWGHj7wQGJ
 tsii+MSVC/ZZo/Ogw/zKneng3sw/jhZ7aY3vgYypwCOEJSreEB2xgmCToz5aW1cUMPmXRHgQ46A
 Hil4q0m7xwCqdMT3sadgsaYJr34GN3Sf6eI7GUxiTv/BeJGtiH6gr2fo0RGGNbMvsfgISb62DMt
 wTPvdvVyDUDENWgecMVISkzFHFkUO3QSLH5FTLRA8ngwc7pt9/IXwUyGs/kMAMrt8h+1PUBW/bc
 /Ediq10+hu+AJFhXvJ5iPGTw0qwl3Y+ijkzjU5jj40gSK+3OZQImfmsEAL9UAy49soTx8XboGPG
 s5EbmnDeSRcu1qEv6GWpm4SGzuZTVpd9Yd/PVUq4aQmvLUkn6P2CboMmM3mF6MWho1r5O6JIUMX
 +yFNSKQ5sZWpE8w==
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
index d59a5e8cdeb2c..f00dbc0fff3d4 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -449,8 +449,9 @@ display_panel: panel@0 {
 
 		reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
 
-		pinctrl-names = "default";
 		pinctrl-0 = <&panel_default>;
+		pinctrl-1 = <&panel_sleep>;
+		pinctrl-names = "default", "sleep";
 
 		port {
 			panel_in: endpoint {
@@ -864,6 +865,29 @@ te-pins {
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
 	ts_default_pins: ts-int-state {
 		pins = "gpio99", "gpio125";
 		function = "gpio";

-- 
2.51.0



