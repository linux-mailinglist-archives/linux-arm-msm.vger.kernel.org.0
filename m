Return-Path: <linux-arm-msm+bounces-46306-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A81A2010E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 23:49:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B21547A299C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 22:49:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F7E61F12FA;
	Mon, 27 Jan 2025 22:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="elp8XQ6Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61DB31DFD89;
	Mon, 27 Jan 2025 22:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738018006; cv=none; b=ssbTtn5mNJw+BqnduHFHhK4/kYezhRwaD8Vfe4ifse7YwQHXbHxofeD3+ngJBhYalCVkwpEGLYWrCmkfvrksT9Llenujc+gWJLHRP0ZZO/+wkWQ7eHfggRDuZnRpUhYz/CTmg0ZQckUnR5euH07RRZpUn3ecndpVj5Lnaf3A5UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738018006; c=relaxed/simple;
	bh=mE3WxwSPnjxQoKLiFGLPQWGmaOQeOmzENxg/qdhMBSY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hXJ+s56eIYJmB9Ye4E8x/oDSnWFeSP87C3w/aNRS4a9Ij0euCRStOM1VmWmamssPZejbVRcUNeXRWmV2rfqH3Xov2Upe6himkL0mKLEWHCXQltXErP4IIQL97ZdCHlQ4ZI43LR/bX1RhL3XhR36JEs6W0x+XhsjxgV5iGJ4DNTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=elp8XQ6Y; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1738017999; bh=mE3WxwSPnjxQoKLiFGLPQWGmaOQeOmzENxg/qdhMBSY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=elp8XQ6YPrAK8OtHqOjPR3Z2wovcRsEvjy294brNbAseqPwMdhQYpsxRG5n+1rtx+
	 7guJZ9yc2yM4uSYUWM09ipieHjZ+NmBkFfJ3jlJ9VCcfgPqPhQg4MXDk8F5eBE7wQL
	 NJdn6BKzqSEWl2pUlIM/UpcDjs7aEERu4uuhQ/Dk=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Mon, 27 Jan 2025 23:45:45 +0100
Subject: [PATCH v3 13/13] ARM: dts: qcom: msm8226-samsung-matisse-common:
 Enable modem
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250127-msm8226-modem-v3-13-67e968787eef@lucaweiss.eu>
References: <20250127-msm8226-modem-v3-0-67e968787eef@lucaweiss.eu>
In-Reply-To: <20250127-msm8226-modem-v3-0-67e968787eef@lucaweiss.eu>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1665; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=p2uZKUC/cC98/Emuc0q/l0zqi6X3Z3jBScIikxvDilk=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBnmAzKNlbaD0ZX5QiUDcIYnGuLuMVE3gatnoYnd
 6I5XwrlcF+JAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ5gMygAKCRBy2EO4nU3X
 VoTyD/9uQ0kSlsnJs99087Xs5np1NycVcUZRUyyE3DhAkUFUy4KKAYkYFqBTkpC/trMWSW8L2lG
 uYKrmPvXiQQ8TzdpDzIolkotGIgw/RmHzvvvOpnxWU1GYguVUKkGIHppLQ4WZL9s78vATw/OHdY
 5cC57nkMm5IzVpqi7ouSDxcknv4dUmJlujc/KzKaWuD2HPvSFyMWhPkDX2sPjkWmbdDOlnubCZS
 ve2dJUeeOZTAe9GKQupO5tMvbrd129GSFwieYvzc13k/D9/s874f+NUUPJdhgb9AOI12bzErB3N
 ouql9nmFFbYqLQC8rQiZq654WRC2UCaAcKHuKbUTFYCVbaNwAiFVjbvdxbCRYTCNzrbosPOd975
 Eadk/EnqgQe/Rg1zEU95S3wRa9otB8TPE6iuXOHYcbDmTuGbTzGFtRkgMhdXbaoxcu6AWlHpuSe
 mM0qPpSZJon4XZOZ7Lg8nSUZ2A+lf2qlwcK1vR4X910EsAxNB/kGjEUbo7w/lM8Vc1u8aJxsNAP
 mtYDtw+n+UfFhB2JuAvoEczk8SivGoR1oUX9LxOa226tnT1VjWeNWZgCo/U2JN+XB/IvH64JBIS
 4g5Rn+S2iIKunsCpf80ZMpKAqR2JuBME/OEHzN6M3BIBfij3QxIrXsG/O8HphUse7Hdv+InDW5y
 gsggzCvs9vM+pHQ==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

From: Matti Lehtimäki <matti.lehtimaki@gmail.com>

Enable modem remoteproc on samsung,matisse-wifi & matisselte.

The mattisselte - being msm8926 - requires an extra mss-supply, so add
that as well.

Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
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


