Return-Path: <linux-arm-msm+bounces-81460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE44C53648
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 17:29:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ADE09621C59
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 15:11:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FE41351FB6;
	Wed, 12 Nov 2025 15:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xOQzuV7X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB40351FBC
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 15:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762959780; cv=none; b=Ea0GIdj4HuumMcFAxSVAhqLl7QXNIWebMLlUKrivrn+xmziWsgX6tvoDkuzYdpFitUnx6P2VpL21k5ER06iUlyDbw5Lww0rU0KRxQzuHexNbCyrrSdjogTHMVbLq7wB8FEhpp3Uqj0B/G5GhKiFQmnnXhPi9JIvbG+n49QbtUeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762959780; c=relaxed/simple;
	bh=9wI3XI3vhU2/1t7DVfjRwTFblg1SWjTrVbr5Qsqq9gE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D3EEEncofQIhr+Ml3zV/SDYilvd/Yke/vpWcLm3c/Ka1/cr3uSPNQemAjrBHdYjkTbA72jIBPoZGhHSMVYS0FMlAm7qkcLWWqBs0U4CjoR/bZ5hn7JhzQH4ECfX7xmnQ3o0+iJRq9FuTvQzLU6vdcenLxhTZZKIgYcaE2vCfBPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xOQzuV7X; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-42b2a64d425so123991f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 07:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762959776; x=1763564576; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l7GbuBQ988JH0ZhSiVFagMg/s2WGUhsawfzvur8N2Co=;
        b=xOQzuV7XmO6FeyuHeCW5WP7NGRr38Uq2rTVBRDuCSkX/aVSnoxj6u9YPLI8OLObc5/
         QefGJJSXynyyoDyYNzKVVEsB7X4NxA+4Ay/l+zBFVQuhJa6FuFW4ENvOUwCvpvp3q3y4
         nBr5zQxGyK3Xew90ZULie0kPWQlTBuxWU9xBwgoMOHcGdyV00LUTa/RppbLYm5WHqEJf
         uWMZN+LIHMmk/NvMDEpGizWewFYovqXT5rGGITTY+obUu1l9Sz1Y1A/NsDu/yel10y1N
         F2rbx6xAunrqWsvoI5ywpRKqlNshkEvmmbe7nbDLGICbJC4sfOLMseMO2nS//SIZyB4c
         DVhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762959776; x=1763564576;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l7GbuBQ988JH0ZhSiVFagMg/s2WGUhsawfzvur8N2Co=;
        b=OJqbM+MHjDxYyTGFKuslQ1rCy5TiK091+fhYgQy8Jt4jNnE6gI/HsRpHWGA2y/NKwx
         KkKRB4mfy5tBgPog8Xl6ef011mYQwiC2c+Z/nlNo905QGufxmHUZtc7V/N+s+iEvjk4Q
         nysrZYA7oZD90nEU1JTJ5iE/QVlpHDFpsOAP7PkVXUwcEYHgkBMYvwFxFFkj3oYlzEn8
         vz2E/QVpcyd3nvxRMQaKJ/StfGMh023nhwlLg8Tr6XBjxbJfhNvKnu+sf+GTMr7IGDPe
         l32cTVFeSnvoNYFV1Ob4BUuma7gdTFNdHe2LCl7SYFfMeBWfjZ56qNakdCD2ibgZL5jn
         /M6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXMXLKtMfzi62l5HowAdBhKnMrtJbXv5KFYPUOXHjuNegdtKzDA3Ca7CgI/ZUwwKWAVTIIjPVOVbsqEYSFC@vger.kernel.org
X-Gm-Message-State: AOJu0YwLz7/5rgZFhIwMEmHFqOyugEm8nK838CDF7e/tBQqc4suhatT5
	aZU8H0POe87n2G5v+Sj4bEsIJlpjUNsqveiU85O0G4BWPPgl1weF6VdXePfS9mL+r7A=
X-Gm-Gg: ASbGncv5tRVaasXBNSqVMIm4MldvzxnZUsI/WBQLJBUCyBmV6KgF9eXfZUZUo3mXMDp
	1ROyUPiHm7njMokBq3zADNhzJx4rQX/V52SZP9J7a7Il/E3/DYu2+FdyGddKqFdf5CZ74yXAUrJ
	S1tkF27V7+aHYvx9ZwrarG/9HEbS8AiqdOgqJ3UVaiSJIaN93TZSVBVgQ9fHuX7JDmeG9ncLZr0
	jm0xZF+wJRrCr9ATL2rlHt0j+sxB2jpLmhVhCcU3qfNBPxCo0wlC0fq9UcJ8t23VaQd8ijZgEPV
	BdfzZ1ENXPjjVr5O8uZRvZ+pPeO2UliXu0LHa01VHe0s8f78ggdV7tIAncNZMOet+rud+PIByr1
	cwcWYXPKg/gvfkt4q+k4qGU2n+Cmx27uIIsso5VCLKQOJPAdSWFTTDot0ZYw+qug6BCat3XVo0g
	HT3q9AOYKtLUtYgpTFVtQ2dws+buc=
X-Google-Smtp-Source: AGHT+IF4vqpVhka8/jFdEYgRGP+JAXApvr6mWEmwiz38pK4RlMObIbzFbJ1c92mmewKPgGRpo/JYjw==
X-Received: by 2002:a05:600c:1f95:b0:46f:da97:91cc with SMTP id 5b1f17b1804b1-477870b6229mr17052135e9.6.1762959776126;
        Wed, 12 Nov 2025 07:02:56 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477889be9a1sm15134355e9.6.2025.11.12.07.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 07:02:55 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 12 Nov 2025 16:02:39 +0100
Subject: [PATCH v2 2/4] arm64: dts: qcom: sm8750-mtp: Enable display
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-sm8750-display-dts-v2-2-d1567c583821@linaro.org>
References: <20251112-sm8750-display-dts-v2-0-d1567c583821@linaro.org>
In-Reply-To: <20251112-sm8750-display-dts-v2-0-d1567c583821@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Jessica Zhang <jesszhan@quicinc.com>, 
 Abhinav Kumar <abhinavk@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2169;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=9wI3XI3vhU2/1t7DVfjRwTFblg1SWjTrVbr5Qsqq9gE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpFKGX8hk+ml9OdnfHvyxw3a/Bo+Vncy5kjOznV
 Pn1h1F0yRaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaRShlwAKCRDBN2bmhouD
 16e1D/43pXkQ9jlQQMaJ84xSuA3DVggOqUQg9O9sQp4lEeQF7ThhnpFrbU4jhd/+68VpEtHPfk7
 vrnoYEk/6UXQYG6Nz76PTUzoZ7meD36MIhT7F4SJ0e7ufw0+/SZkczrfUrXpfITn5GM8mDKEYX8
 /i6duT5z674K/bIv/oRQrcL5uibE8g1nwl6i5TmL3hUqWsKFucuOdmbZaUVMCVqto8qOet0sWTg
 EdAUjRPq8wkXPOnudjo8ZstqOc+qvhrGCQmnVa0bAckxwbNlLv33c59sL9FcicO5RWP6XfU2Byw
 m5YSkkcvZ0J6AIXktjWVUUxlDmLSu4BU9V4Q9NBW2NN3H0Y4h3VC42IkEQP/gCZ3+TLdD8O0rbB
 bOTTzjLyx4Vr26cBKxkGMMbQBJysYDgw8ygsOK60H5kGY7LQjSCavxejpSwF18TWOX9W+Eczt8x
 80gJczFuN6CgaY4VwDnnSI/Xjxvy9MVStca7B0+pkPCfJheqhqGZmz+ce3pilH3j4Pcz1eh6u1z
 FImDE3dhdcCc4ZIDrOKpEDnUXEuCuTphV2wxSa13Wf3Y8bcMwzor0cjCa9zoQzbA91c1ZGcEfDE
 z/Foj2ezIAijH+EvifUlHDJnVCGutcdVIqYreQp7uM3adFtWghHnZWKpRbFrwOAoE2ASFKyxvEI
 gkp52+m1WSsomTA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Enable display on MTP8750 board with Novatek NT37801 panel.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 70 +++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
index c8cb521b4c26..68644eccdbff 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
@@ -933,6 +933,48 @@ &lpass_vamacro {
 	qcom,dmic-sample-rate = <4800000>;
 };
 
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l3g_1p2>;
+
+	status = "okay";
+
+	panel@0 {
+		compatible = "novatek,nt37801";
+		reg = <0>;
+
+		reset-gpios = <&tlmm 98 GPIO_ACTIVE_LOW>;
+
+		vddio-supply = <&vreg_l12b_1p8>;
+		vci-supply = <&vreg_l13b_3p0>;
+		vdd-supply = <&vreg_l11b_1p0>;
+
+		pinctrl-0 = <&disp0_reset_n_active>, <&mdp_vsync_active>;
+		pinctrl-1 = <&disp0_reset_n_suspend>, <&mdp_vsync_suspend>;
+		pinctrl-names = "default", "sleep";
+
+		port {
+			panel0_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&panel0_in>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l3i_0p88>;
+
+	status = "okay";
+};
+
 &pm8550_flash {
 	status = "okay";
 
@@ -1194,6 +1236,34 @@ sw-ctrl-pins {
 		};
 	};
 
+	disp0_reset_n_active: disp0-reset-n-active-state {
+		pins = "gpio98";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	disp0_reset_n_suspend: disp0-reset-n-suspend-state {
+		pins = "gpio98";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	mdp_vsync_active: mdp-vsync-active-state {
+		pins = "gpio86";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	mdp_vsync_suspend: mdp-vsync-suspend-state {
+		pins = "gpio86";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
 	wcd_default: wcd-reset-n-active-state {
 		pins = "gpio101";
 		function = "gpio";

-- 
2.48.1


