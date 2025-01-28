Return-Path: <linux-arm-msm+bounces-46431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BD3A21515
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 00:37:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 331A21884DBF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 23:37:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C39D01F6663;
	Tue, 28 Jan 2025 23:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="ENEbtBnA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC291F5429;
	Tue, 28 Jan 2025 23:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738107391; cv=none; b=lld3mHzBOZhMK1Y4RgbCKmg9vEBcD3ZsAiOK+v776qmFViKjjY3ora198SxzYtOy2Cp1R/6NvU0Q8YhTK3k1qE27dITsDy59C6eEnJqsBIcapR578WH5p2zdi06HF+SalBgG27r9ZRtN90oKX9IkyPmzwtI85rCrmQ57xOXLkMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738107391; c=relaxed/simple;
	bh=c3OdZXsHQl8Hpj942CA3+f4fIQmaWKu9wILF5OxwWc8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qAsYm8DwcIYsVzPIW46ec8KDqMelwcRdmDZQHPYarA3ZVBApbbba+TinSrHnreNexfyMZRT4dGnzYSqnwQ+OCspkOYQVoSDAONLcVSrr01yKl0/zyB9uW2pIBZbL4MmKr43XRb4BwBG8AbsWUt0gtm1rPnJjC/zzeQju3+n2nVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=ENEbtBnA; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1738107380; bh=c3OdZXsHQl8Hpj942CA3+f4fIQmaWKu9wILF5OxwWc8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ENEbtBnApFwOyEZgl/RvRPyJnJNQXdNFJfvuxIrXiaGwCjYze2fEFygb56H3N5yrM
	 RVUfEm+M0GIq968YR828vBUxhz4HFqxeqspqEjBogtkwfaTZnLksyOuyL/SDYA/S1f
	 cmf4wIOurJyUMKZC44MuXfDXeAwtMRuUzwI/sbFE=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Wed, 29 Jan 2025 00:35:40 +0100
Subject: [PATCH v4 08/13] ARM: dts: qcom: msm8226: Add smsm node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250129-msm8226-modem-v4-8-2b02ed7b7f1c@lucaweiss.eu>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1545; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=eoHX87/Yfz6a9HStDewruF7nDlvvxRzf55C1aXv2xuE=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBnmWnsWVmPlupV2EO7nmpGqAuHGmKlmFEnVar/Z
 niJlh9/DoeJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ5lp7AAKCRBy2EO4nU3X
 Vm0oD/4wpnmCr3tOS8kkxeS3mZDg/GSkaXEDtBbe14BnBk8QV6+VJ5joQIg1ysWUd1UkjqnUnfB
 zAOFf78xCD8vJcppbPci4AeMOc7q2duxRyZgEqOCOcsGvTDkjqkixMBZ4XmywJgJnH49T1+N4Vj
 ZbbPd6hrnLUzsG0yz+tnF2fTCpiVCl9k9tIpc1dOlxs5pIqxvU261NyVyIqe+4JiVy5xC9CA4Xn
 5dzp/+JQqte4nH5W2A+Di59r/TZjRfvHc45Vl+IZ+to9gCq8GsLO0BmVv2fyMSKFatzS5KpjY1S
 +ok2E8BIFSWjfigMlq1LIV9kQiClVObdNKu9hqsK19+FKrNZh3hkgCtLI09ZrNxbUPoQ3L6Efvv
 2e//tSTPAgrsBp8fXtbTGijXT8cpqKQIKHtdb3s6HjHimwbK/jqla3Mobi+ku6cWWsZUvJGcn++
 6y0LuU1oXu535dO1n2M2PPZ6EBPOIRwIWutz2l4MKwSGvomTLCstpOLSFc6ULZOlzV8uginogzQ
 +PGtZpTbwkBTesICRpRSlaIjNuJKG42dHylt+rG1tOgRI+7KiOAQFjiUbfW4/35oWMLm/554zFZ
 0RffCOrGhKybP7RIIvCFY4XIin8Vsuvo39LcO2c2xvE2sBjimd6vqbAarSklq15/AmkkPWlb6Cx
 lrX5zHN6ziVBXEw==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

From: Matti Lehtimäki <matti.lehtimaki@gmail.com>

Add smsm node for remoteproc cores.

Reviewed-by: Stephan Gerhold <stephan.gerhold@linaro.org>
Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
Co-developed-by: Luca Weiss <luca@lucaweiss.eu>
Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi | 34 ++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
index caaeeadf289f78d29403312738bbb714eaad74d2..7e0838af6c2d0dc26e0082471b70578bc627491d 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
@@ -253,6 +253,40 @@ adsp_smp2p_in: slave-kernel {
 		};
 	};
 
+	smsm {
+		compatible = "qcom,smsm";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		mboxes = <0>, <&apcs 13>, <&apcs 9>, <&apcs 19>;
+
+		apps_smsm: apps@0 {
+			reg = <0>;
+			#qcom,smem-state-cells = <1>;
+		};
+
+		modem_smsm: modem@1 {
+			reg = <1>;
+			interrupts = <GIC_SPI 26 IRQ_TYPE_EDGE_RISING>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		adsp_smsm: adsp@2 {
+			reg = <2>;
+			interrupts = <GIC_SPI 157 IRQ_TYPE_EDGE_RISING>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		wcnss_smsm: wcnss@7 {
+			reg = <7>;
+			interrupts = <GIC_SPI 144 IRQ_TYPE_EDGE_RISING>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
 	soc: soc {
 		compatible = "simple-bus";
 		#address-cells = <1>;

-- 
2.48.1


