Return-Path: <linux-arm-msm+bounces-78158-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F40BF65A0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 14:11:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 820DA4070CA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 12:06:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5D1B338923;
	Tue, 21 Oct 2025 11:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nZhH0hmf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F35333448;
	Tue, 21 Oct 2025 11:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761047588; cv=none; b=PW6jjB1SSnGuGjCw2l5ZQltEk3XNQG1O/si8F8/YvfT9jvaqGwwtqshDC0OtYnsoUrNPmEGnBDSRT/6ugg49UAXwE/iUxZRvvJHQORNsXshPEaXRixV1ZTJ6+tSfv6PnuHWwxwSHU1ObgP/Jr4uR3+cLWJYvlp6Vk61eJZjrCRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761047588; c=relaxed/simple;
	bh=5X+p8856R9wQw/SJFD+sls3MORYg4XJwRc2UpYjPT94=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DsIDBrPPvgVGxVBpKf+0K/hIwFi6YoeTFLWLZfDoxJgCNqSDeid+JLN+/uhLOXSuH3Xq2fVKpM1YJ+U1pKJ+igiqQQq7cXOrMpLBO+sHz4939fmN+6oDTn5hdfKuQU/yV0rqBKjpWMoXCfUzJaNj92q9xGYEkGcVh0UzUklk4Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nZhH0hmf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 07371C4AF11;
	Tue, 21 Oct 2025 11:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761047588;
	bh=5X+p8856R9wQw/SJFD+sls3MORYg4XJwRc2UpYjPT94=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=nZhH0hmfxcLNLc2ea/l65V1JzbY1kVZD/92V/QBPMR3mjOhP7+PpWeMQsiORsHMyk
	 Z7cGmvIANeL3wbcl0V+RyiYeZW1PhJWI/7DfX+EXlnSNurpA+bx/5enh1v860VWqJ5
	 8Lsfwb1WFFDygKXNSRS3cnO8eOzFBwPhORu+Vj4clD8/vzp7XbssveD37MweXKzhJ6
	 ZhEQVD8c/dDfNZOhPhbzFtVbsAuJTtmqGroKwWzomypAjY2MRgNPBAV2Zv49rFhEkG
	 AKDudNx5mQLqoFeM/1LzwsBedt9ci206X69g7RPenzFGCK1hUO1DYXmfaOtG2S5+d9
	 tsV77kJl7n3ig==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1FA1CCD1AA;
	Tue, 21 Oct 2025 11:53:07 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 21 Oct 2025 13:53:05 +0200
Subject: [PATCH v4 5/7] arm64: dts: qcom: sdm845-oneplus: Implement panel
 sleep pinctrl
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251021-s6e3fc2x01-v4-5-5e3ee21c688a@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1553; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=ojFoQ3nmgXFa6brSu0i4y7xk0ivDDVrkpAAIpMNxPBQ=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBo93QhGUWPwsDLQX/S4Ji9ihyCdz32C3uI7IHz7
 Ec7HIEqTquJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaPd0IQAKCRBgAj/E00kg
 cgMgD/9TkrWg/mJUQaXp3FmThwVY5VV227lcdjmNTnPhmymZAA30WGukQfNt2vZCk+rCrR+RExp
 j4W1AZ+kIObqR4zqfEvP6Hsi7IeWM8a7RLbRxE6Zhm0XzdvGyZHTh/gss3oTv52aqOMFcugFrAm
 kJGTb3nxQrvq0oxlvtomkDyctnjStgdWsAg7wN+LSZibq1X7Wb3z0Cu9WoF0+k/2ZUbHmxDCOgC
 eTrSCHq9/XgnCPn89jfEKWWolfIGU1JS/MYF16zhyCjvq7RzgyJSeqWkDkHngJUqlYO9Zo6lA1m
 f0l+RPesMKt3LOjwrUvTxtZDcaa1FFCAfRpGDyhMXvEPBFIQscpiwko15+UeJopcujKVS7GEwWc
 Q2NEwhm1Yk4eW6Fniev1JRkVn5fmtT+luk3TCzyfkzw3R5zr4kul3lFbUnVx70OrRGB49B+xsuL
 P1IdimovTumVt9TFy6OsakUsrTEeWxAVLhEuO/tj9F2YpgwtM40sp+cO/97mQC+lJXoaEkTBeM4
 s+lEA3peBRifYBjHvd4P5cdA3Kaj+4Ib6LQNHUcB+3FTxhUmNJVXORR1f5tUQgkIVx5JOY7bYRY
 YIR2gsPVl1bkXpfof4P7uldLMl67znsw1KVnnw0dwHSaU0yKd1swuPZ3yXzU4I9gLbAGM3KfJxc
 hjhoaoShycK0cQA==
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



