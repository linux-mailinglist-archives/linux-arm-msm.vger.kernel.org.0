Return-Path: <linux-arm-msm+bounces-46438-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB39A21531
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 00:38:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 21A15167697
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 23:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1DE11F8696;
	Tue, 28 Jan 2025 23:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="xN3S21HB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7CA61F63EF;
	Tue, 28 Jan 2025 23:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738107393; cv=none; b=ZEg72Nm7p/jvLoUyhyubO61e/8ROgaFRtnG3XMrsOX5xv36ANsuxyZk/vGgAsE9B4Ku1JcLw0NKY1EBGEbauJXCnSQya3p69fJwk2oYJTGN8A+pmxCh5c81ekkS776jzXWkpj2oGcfIXtsAb0pfPvrU89fxz8OdVRI/J6RgwtCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738107393; c=relaxed/simple;
	bh=SS4BWu9ddGsvTH1RzieVss0jVfXjz9CbopGLiQCpdOU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h+i2y1ZpKmoHPNiVxfE1eueNBOWTR42s6j4IeRwwhHMs0pCRUTmk552pfBNg3xSbs93gAtAGsuoBxnXJ3q5HuQBf8sl2ghi1RPiPqFC0fRHjKwkgt4jWi8aCRoJRSGb+dX551yXvEjJM5C+59U5yXCMgCMyUW7HXWk8nFz/A3jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=xN3S21HB; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1738107381; bh=SS4BWu9ddGsvTH1RzieVss0jVfXjz9CbopGLiQCpdOU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=xN3S21HBDqJwIaQgpkwDeVp8bCBu5aRTlm9Zma/3QbnTblUcJEvxUwgRSNhdQ1H5q
	 Ww8f2DJmwRP6k8wkmkNrdSulDx7ic8bHRES0frwOZAD8qPmhypvEOeYC6s7KA1EIGJ
	 bebhCbiSCaCgkWE9iB9cTVDoid4t8C8n91y2srP8=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Wed, 29 Jan 2025 00:35:45 +0100
Subject: [PATCH v4 13/13] ARM: dts: qcom: msm8226-samsung-matisse-common:
 Enable modem
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250129-msm8226-modem-v4-13-2b02ed7b7f1c@lucaweiss.eu>
References: <20250129-msm8226-modem-v4-0-2b02ed7b7f1c@lucaweiss.eu>
In-Reply-To: <20250129-msm8226-modem-v4-0-2b02ed7b7f1c@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 =?utf-8?q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca@lucaweiss.eu>, 
 Stephan Gerhold <stephan.gerhold@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1724; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=W7bAKRt8yj2yIFDoK8M8DwUBnwPfc/tZ4V5bO84GQEk=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBnmWnxR53MHM6lCCbeqx41lNeuS2F3zo2VAHLE0
 rBKyRkMH5uJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ5lp8QAKCRBy2EO4nU3X
 VsjKD/9Zc9/QUk2yVp1axWr/LLzm/m8iIrbOC/rCuPAaFqNldUDHBacyAaow+Ye/6AFahnl+9QL
 O0cIaUfCm1e9aoxIZAWsHvZZa1VIhwHQVpFVH0dz52eiZ3ocNsCRrg41uMMxn84EuKBJcKdo/p2
 UkYDSQ+3dE7vbr220ufXb/2msTfltbmUFtiLFzUn23VKmt2qjLfv0NB62tf188SE/jDglYHlUGH
 ORjWspMfiEB62bjOxgJpmY64QNKLXCmJxNjukllaCsU4J0zRj7tG/J8J0GRus5jvB7V3b253yOk
 GYhbVLEvPShdOf/SKt5La6Wp5isXqCAxhApZ5JSVNB8P59toF9hu88E++I9ouRkeWABqZl0vthj
 oH5yG5f0P05Iv/U9tXjVh9jJwZEj7W/cz3X+5Yxa0Ai9EThZGnkMRuJTBGkq0WAUUz8w9GKQ2Nl
 CCQy3hdPsIqc/zO52sMf3U8rcnonM0OXCA4PuT+9MHogGnuhcBFFGh65CrBjD6JZLe2bwSJC+Ax
 Lz9Bi3wh8DpQDoPn5JucR656ulsw8wvF9dj6g/d08EMC3mZyRDE6YvLqeANXw1ZwCqq759r+BdP
 NVf2K3JwpjZDAyKzQYfQGCZXbMgI+7FwEMYLN1p4mU1+jMOyvFdWOLPVMsefpM9YNTHeRqej4VH
 Bzt5aYyTc3eK60Q==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

From: Matti Lehtimäki <matti.lehtimaki@gmail.com>

Enable modem remoteproc on samsung,matisse-wifi & matisselte.

The mattisselte - being msm8926 - requires an extra mss-supply, so add
that as well.

Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
Reviewed-by: Stephan Gerhold <stephan.gerhold@linaro.org>
Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 arch/arm/boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi | 7 +++++++
 arch/arm/boot/dts/qcom/qcom-msm8926-samsung-matisselte.dts      | 4 ++++
 2 files changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi
index 0a3147656f36ca2616e0e3cc7c1dd808b55f3a88..f1544a7e8369c329360e235c48291a5d4c261fdc 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi
@@ -229,6 +229,13 @@ &blsp1_uart3 {
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
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8926-samsung-matisselte.dts b/arch/arm/boot/dts/qcom/qcom-msm8926-samsung-matisselte.dts
index 772827cad972ad4ff032cfb9310568c5d2f0170f..73e19176eb97af569d99580c6b28fb2e0ec7f1b3 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8926-samsung-matisselte.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8926-samsung-matisselte.dts
@@ -28,6 +28,10 @@ reg_tsp_3p3v: regulator-tsp-3p3v {
 	};
 };
 
+&modem {
+	mss-supply = <&pm8226_s5>;
+};
+
 &tlmm {
 	tsp_en1_default_state: tsp-en1-default-state {
 		pins = "gpio32";

-- 
2.48.1


