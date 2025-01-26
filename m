Return-Path: <linux-arm-msm+bounces-46165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE4EA1CE99
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jan 2025 21:58:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C3CE7166A24
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jan 2025 20:58:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5511918E750;
	Sun, 26 Jan 2025 20:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="xqtrzZ+Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5915615E5B8;
	Sun, 26 Jan 2025 20:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737925066; cv=none; b=P0n5hbqwjD92I2xvMkmmTHk3/cny2+zT31vBhja+RFoTQqCHH7fcpFzyXJGbWQdTEgysjlAt5Tvv2AAU1uwqSkKzgB/Nz4iS/sfRjlbplzLObipiBPdllZ5RibFg+ULCF28litcZuqESNlMaxOiar4aCfTRKTjBjEoN+SS3Fcbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737925066; c=relaxed/simple;
	bh=0egKTUGxa+ERnYUVurdjg+IC7rkSiLmW2RdF+5o2nW8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fYIKVv6juzSZHSKGecO7TtzcRHbPJS6+S04plo9oS7Zqaoynvq1vUXhwp3cAWhCPOGHqVRF4x9JuJtlgmglYcuwtO/i3xnS9E/9E1ht57dImNcvzuhqwZ86p2Sp5HwOtcO0H0vgvKng0XMDIRF3sk7QD7LgCfaCCsraBkN+yPHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=xqtrzZ+Q; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1737925055; bh=0egKTUGxa+ERnYUVurdjg+IC7rkSiLmW2RdF+5o2nW8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=xqtrzZ+QUOAPnSOfzX/gpr/RQ6P/PCTlBKauM6jHoeN8SFNv6w5eVacJCt1H0yRij
	 CY1L13V4DBNdGq9un+vTOS/8zyFDXE7oL6Pa0W0V3CXFgl4chnRT0XLYhXjab1fiMH
	 V8QuvseXPmZZvsv6JaKC1wAogMmbhb1TCebEDDS8=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Sun, 26 Jan 2025 21:57:28 +0100
Subject: [PATCH v2 9/9] ARM: dts: qcom: msm8226-samsung-matisse-common:
 Enable modem
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250126-msm8226-modem-v2-9-e88d76d6daff@lucaweiss.eu>
References: <20250126-msm8226-modem-v2-0-e88d76d6daff@lucaweiss.eu>
In-Reply-To: <20250126-msm8226-modem-v2-0-e88d76d6daff@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 =?utf-8?q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=937; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=ms+h1V3/vx0OGMHh37WkMZeY/4HSrJ5DAFiQ+O2CuVY=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBnlqG8zLMCrwklnyIIlr1c6crjkQ04dZtUB4lrn
 0fq1yNYQyKJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ5ahvAAKCRBy2EO4nU3X
 VkYsEACsVDIyxDx8FWCDEzoQ8x3t26S/Pl/WdhGHdaOioL18ZRG+lA6C4Pe0OXoe7ikI/CR7HZs
 yt0SzPuNK+plbni1FYVxv8NBvMlwOw7l59uJnB77h1/OVBYvazgOOI30jUv3yvNenaAlXxnfw/V
 lRtfQfdVBvGVrZOpXeLtE4W4PI+PrKg3XBOclkzifD8I1VLSpq2Ybu2DDH6jewaJ2JfcB7VCIiU
 4lblEu7eqA1EpYo5HaA3Wa7YPu0dKyDKctRTm3Ev5Iucc54lCy0lBD3geZrkPiNw1pCe+Ago929
 xUZsAeQDHswwMkexo0a08tBjv1eJHGGoL8icYNCcNTHtRg4O3LRnyAiqTavRRh+6q5bqtcHDvkA
 yynosjKG7H7TqUGNEimZ5PpJT7FQux6uIfyN5QiHT7ypESkaZzg6zd57JQn0CG4z4F56L5Beo0l
 iAim380hvDG4JwPq1n070ewdmlXYb4dikglX6fWquJD5EoHS7Km+OTy5z2C1pdLjdg3x6bprX8Z
 F6pt52axS+bb63dWgva24XZoXtngJavKEaXlXQi7G0u8dP+coly/K+EoLaDCqUCyUK5Sx/RGlth
 X4OYGRTFZa6Y3t2W2QLWfChwN22IeRpOVqSJ14KpIlPqpvyl2bTw9V4zgkjiLVk0xMKp4WkgnPL
 5D+h5dgx2vz73JA==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

From: Matti Lehtimäki <matti.lehtimaki@gmail.com>

Enable modem remoteproc on samsung,matisse-wifi & matisselte.

Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 arch/arm/boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi
index fbd568c7d6b7415d240aa1a2329d07cf9135274c..4155bfb2136022f2a85d69451c34f06ed2a700ac 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi
@@ -225,6 +225,13 @@ &blsp1_uart3 {
 	status = "okay";
 };
 
+&modem {
+	mx-supply = <&pm8226_l3>;
+	pll-supply = <&pm8226_l8>;
+
+	status = "okay";
+};
+
 &rpm_requests {
 	regulators {
 		compatible = "qcom,rpm-pm8226-regulators";

-- 
2.48.1


