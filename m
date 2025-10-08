Return-Path: <linux-arm-msm+bounces-76424-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFF2BC560E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 16:06:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 82ACA4F1BC9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 14:05:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1528298CA2;
	Wed,  8 Oct 2025 14:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FHkFArTi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8F529346F;
	Wed,  8 Oct 2025 14:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759932331; cv=none; b=oXxeFGajoqTMwnjetaA753XksFLNLdppLj9tuDYjPo4uax0rz+Gefs4w98kPILBKqlQ4A29OSVHqT4xhGl3eJv3u3S827ZT/aOpbtDqQ4CJ0h46M2vNK/LYRpB7NqUBJuF02qRPdmQyH/ANZb4T4LE1HLT04ciGV9W75xNE1+Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759932331; c=relaxed/simple;
	bh=HSYJCjE24K+57IxjnTOBA3vYmKAgeNl1JgEZHnukAHQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UGVJKIQiQugaDSNcnTODwuKwMV1VdeH3IIBbRvbKRpcnn30rOCpBSiGT+opA1i3E83sigSEa1X6eRAV93SHLlqeoWRQeHKVLDElI4RnEGnU0bZobKtzIrKO31Qc7BAdnfNOsLnEc/gzSRZmDd65wwKn6RUlZk8TjEdwD7EVZ3KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FHkFArTi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 16D2BC19422;
	Wed,  8 Oct 2025 14:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759932331;
	bh=HSYJCjE24K+57IxjnTOBA3vYmKAgeNl1JgEZHnukAHQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=FHkFArTiqLjHtD8UBeA9BjDpTEDP/ze8wv76kxhwQ5ee+Z/LQ5l+TxLM/T5Uje6S3
	 ZzZ+MnVufUO4SVls5xUeaS9ZzEmaUEk1NqKXcowndG6T7HACqYHUdFoV1vTW4Kc3K2
	 T0BYjAcmdJPuGQg1tMmGFVqpiFRSY4J0CiGBGaqUGH0EV5rF/g5MbJMXX2clr8uy3x
	 wjMylQ24HaRr5QaaCSBqLBiU800+UlMIq5LL5W5xl8suoBoTM8VGwIIBcNHTowg8zi
	 j1oynPpClm7CgY76SZifUR2vWQMwfPB4utrUlQ66QhstJsbf1v4Zy7lXJxI3oKasmj
	 2nYBBBLTxpmCQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ACB3CCA470;
	Wed,  8 Oct 2025 14:05:31 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 08 Oct 2025 16:05:34 +0200
Subject: [PATCH v2 7/7] arm64: dts: qcom: sdm845-oneplus: Implement panel
 sleep pinctrl
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251008-s6e3fc2x01-v2-7-21eca1d5c289@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1489; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=mp3HRjBZ7F75KJMOIKY0ujssyiub4Jy/WN4kGAY5j8g=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBo5m+piiWLIGs1xMLHjYcw1Kxi+dVr02ZH7Mmqu
 OeABLuKSjSJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaOZvqQAKCRBgAj/E00kg
 ctV3D/9lubFbmrou5+gTBa2JMEdcOKJUmBFaw+Vy/vJFor0U3Uxr5rhDtLdAK9/eQ3o2dfZ9LUM
 MJRT5qoA3SorlFBSrV5nVa5HdxdW5b+3hqIupb45Dhr0dm2DfAzT8UFHE1fj60Z57LgEEkVhFVq
 xVY9s9zGXToPHmA1QCvS5RDXCIMyQY76fKWEkKfB5e59hMJHTk0OsE2bbsyRwlMt1u9IWPArgrn
 hzRdI5DQerHDgdav/UHwrw83n/nS2t5R69n3BRGX0inbVaBiTtJZ7AzcDx6dN2sK00TyqYcRRiY
 FN680Vy6dXpP3Hbm6d07dFJbJ3Fm852k4Wc05+8bb0C693tE2JN5XjzFxDxCCggx+yGmhkrMuxo
 v6DqgVAlC1Xt33L0TXhFkslf5ULO1g/dMX3m4Dj7FGdT372tyY4n1J07zXihjgmsjMtZ0SkQTfF
 j1sfS2Q9TVq/f7gHXHhNvUysJitJXJeY7uneJ2ZxJvisOGJHWPh3ljoeOQdlD6350h3WAcgzSAZ
 86felmyHVVn3k08JiNEwuvnD+pb0kJSyzuYhc9235+xO35LPjEXTWmNKgnh3EF1ziQm9m27xrbm
 HtL7grNbnYgi29vGxCd8+pZUUCDMhhzsaDgYLIEMrxxUkV6MBpcuOCKXuehVmMkSwQdDcq/L4qT
 6H3nus+UNFuUMBA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

We can DSI pin from 8mA to 2mA while suspend, do it.

In theory, should give us extra 2 hours of idle battery life.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 26 +++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index c216369fae237..fa538b37ef25b 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -463,8 +463,9 @@ display_panel: panel@0 {
 		te-gpios = <&tlmm 30 GPIO_ACTIVE_HIGH>;
 		reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
 
-		pinctrl-names = "default";
+		pinctrl-names = "default", "sleep";
 		pinctrl-0 = <&panel_default>;
+		pinctrl-1 = <&panel_sleep>;
 
 		port {
 			panel_in: endpoint {
@@ -871,6 +872,29 @@ te-pins {
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



