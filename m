Return-Path: <linux-arm-msm+bounces-48298-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 20927A38EA5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 23:07:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF75118898E5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 22:07:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0925C1C7019;
	Mon, 17 Feb 2025 22:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="ClVkGORw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF7C1B0F34;
	Mon, 17 Feb 2025 22:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739829963; cv=none; b=RqmpYNnRGF+aNe3jdB6zjoCQRoBmQjdXTlAcMwIzDBHrzd/YIM6sja36aOMXBRmxGqdEvzQ20NwY76jgEI9Z3BAZ39OWDWt54MCAswMe/ci5X5UKsiaIowDrkAHGElMQCLDPDsNir5m1FFF0E0inFX8taRsvfTqVyyAk8EFmXZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739829963; c=relaxed/simple;
	bh=SS4BWu9ddGsvTH1RzieVss0jVfXjz9CbopGLiQCpdOU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L8o0WCqjvY7Un/nbg9CSn0qdgSXbHYRiayXxyEwLSofF+dUeVJ7zsRUlEbiakIrEeqlhWiONpMyCriFqE/iSeRG+hIwYe6kofn4zMmW9q5fHkrdo5+r9f7bP00ykeYRKpUIQYXid/1xemFMOLoLkPXGBLtA/mhmJ6zqe1lBL1JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=ClVkGORw; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1739829951; bh=SS4BWu9ddGsvTH1RzieVss0jVfXjz9CbopGLiQCpdOU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ClVkGORwEWoJkvhKoz45oNHDsSy5UpNU1a8ZgF7UTkQ5HpnjF5xV2i5gHC40x0v6R
	 3Lwt+FrvRnvBZc3SL1BSo0mLYnoTKWTVlqqqbp0qhwDDnJV4MGl+iAh3SNRes43KoM
	 1LV4EVzsFh5Vte3qaIlLsfEZJ7dKw0MqCPLQYQOE=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Mon, 17 Feb 2025 23:05:27 +0100
Subject: [PATCH v5 13/13] ARM: dts: qcom: msm8226-samsung-matisse-common:
 Enable modem
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250217-msm8226-modem-v5-13-2bc74b80e0ae@lucaweiss.eu>
References: <20250217-msm8226-modem-v5-0-2bc74b80e0ae@lucaweiss.eu>
In-Reply-To: <20250217-msm8226-modem-v5-0-2bc74b80e0ae@lucaweiss.eu>
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
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBns7K7LIAhgKul/TdrfYZ9rF6wKCXg+b/I7C1WP
 GRIwYlBNlyJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ7OyuwAKCRBy2EO4nU3X
 VtGdD/9wZhOyZ9rqin2j9RUel1qYSGfVJoksozm9qVZfWKaAaD7ZPNajnbtu7G2e6k0GqkEXJra
 8OTTchrK56xrWlLUXonpMIx4WYBCfsRGWfGz0mBQGns6ZDz7wt+B6XN1/Dj2+Gq2mWiTV5bryZ2
 pNCMEgxK49Wg1e91+N2CcTWi417ooi0iCvE2Ja08P3u1X6x9GtYTvL7vOZQTiRyxOb/HGienK1J
 R1L1vUblNN7ACA9c622zpbjBGXJHBI7KLizuyePTZ9JB5R+CqUhgYrn7a7EoQkmMnov+ef+OOXb
 UsRthJJvyvRwMiCg+KQCc+qj/SK+GowteJQQj1xt3Ue40f09Rwsp0QfW+wunKZoQo76jVOKgPXc
 v0S5ht7d6RafWcBZvm4ND+VeU1sZbRhy4uw0NvEpuc4pdlYQ6S1Y+L/HRIVYqLePvx1YAErqz7u
 pJq7uldLt5on7ydlUxjfkGn4P+9LJhPX0rDv6ueMamISWhfMpuxXussjWTsEYQJR4EGMyTpv1Cm
 oz8JehNasLUIUdiG31biObEDwg2KhnX2I3vDBQsQYAzESn1IXW9RleW44DSVTUNflu10tVIPqxv
 VRHqkknRDzbJDeD3IkgSXhuXpq4lhqITbnP7ye/cutjZzweKEDoCVkrX4LFbB3IcQV1fMXbtnmD
 ID3/idDqhhRDIzg==
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


