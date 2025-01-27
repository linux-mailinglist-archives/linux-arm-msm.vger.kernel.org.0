Return-Path: <linux-arm-msm+bounces-46252-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3986FA1D750
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 14:51:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 602487A46EA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 13:50:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 840FC2040A9;
	Mon, 27 Jan 2025 13:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Nzo9wULU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94D7203712
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 13:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737985706; cv=none; b=fgVhPr86AcdZsh2VVfJ6rCeL+EwAdRuBHOY49MYqBFiy+HSzdNxJfM6eMvjXcnUvBSMcqKhuEGTql7/XUNzdArMcO4GUZuCB4gLxi3GU1ibaso0PBVNgsTu/z2cymGmgwZMCBzBGHz7UV7fWRPSFeWrFeGbeZneAo99TMCECFD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737985706; c=relaxed/simple;
	bh=E3qMiGePTLHOvt4i2UMkpioqulIAIrX7oJdX/Dr1FNY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rWEZNmcSm5SjjZAbQ+KhOh9lhzapkrNwhjGngw5m8jhA1TeAH6dBy8i7vMMKA1/X2hNciUzCXRPJ9e4M7Ixj7Aq2OE8wi5HS+lNmuGr1vnXAnyOIQbM4TBZOKQURbFufFC9CAhaTjXGSoCY4AfNM20eDUoLG63+M+5oCaNxRfeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Nzo9wULU; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43616bf3358so7277395e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 05:48:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737985703; x=1738590503; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fUSeHo0uYL31/wa63Qs+E/4wJtCju9nL7i2AxA6QCG4=;
        b=Nzo9wULU9Qd/zOMLvmvXf51cWyu6NRocX/M/EVn/LlESWtAl3dqtc3i7mkPOHl7kR5
         Bf5OvW4dXlhS6vrtzYd7/OhdcEtbyvbAPNx4povJLkOVqiwC50mjzG8yTAV+4M4yuPtb
         Cf1BnUN6F325BYYPCihAcuaJt/8mYP5Y5j7yeKNSmUpObwaaecjatdDmHrOTuUz41xjB
         VKU2KU3zasHOzmjC4zSaDnRzhz1ho8uCV8L8VFhzs1X2RVL101OQBq1lcTI70bu4FE5X
         T2KYRVmhjpVpa3fSDkimNpiDCVoXcd8irm/F4FQeY4cqFhJWwoKX++gom/ufCbfrJ8Ee
         iH/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737985703; x=1738590503;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fUSeHo0uYL31/wa63Qs+E/4wJtCju9nL7i2AxA6QCG4=;
        b=CKPJNTnNEKwgsM26D73QLTmmSQpOVWWuZ/Lhsab9baAW9fj0RU9+m6SCPpZs/j7ohQ
         XTqiuf5+pbKEu+Zc1slqSaU5gZhWRN/U5KmoW9lZNo3jsCGO4r9WKiRAQOXjxnWGzZDE
         KSWKSyFO7DDvjcxTJYNBkI/Hu/m5STHJ0GUAdsl2BXMB1fI3+RPG8DeRwWvZf7PfiOTY
         qb/Wn9cQU91rHjJZ6mss1a+hva8eKisFt5pDJecuRn0Jx1G9LSmPUG6YSUMuF1YVNiQR
         RtMqx6aUy1Yf6kQnXBAQ1oseh4hbHthe+hqzn8ivkUUtcScj8zPsIZFhLmwJm7nu4Jsd
         HRGA==
X-Gm-Message-State: AOJu0YxVTliCDQfQlk8/n79cSBG+GiDz90zPN9SyJRmzuz8QDKDmZ/V7
	t0rSlZ28SdAL/mvqNft8WXBgytvI/dW+cwSb/G6mL7RLzZ2wiEiFyeCLTOUg6/Jpy1Po+Lf4cyt
	g
X-Gm-Gg: ASbGncuEMkYI7RBUGNE9tOzIINWQUyzW8rbfY8dePMkybCBG4TeW3NI3CtS8hAuRJzk
	7Weg4uXAm/CW2+IZ8CXKJQkp3dpK9q7Nx3PIaenbF0SPAO5Jv+CEHKJ6I0hM7bFw1zMEse9oRLi
	A9JwokzJkp0egClFzIGSNhPxJEobKAYNE3TidkTQRjZwn22xuYThuB20pbb4bBcO7AOFF7Czs6K
	LV6FJMtcavuY2lcW5+bkO3CBZwCZ1L3twRcgLOGB2dq5gn3qQH2lMDXuWSbo0UGN706Zne5Evt/
	usDs7UnLC+nUonIdUMY=
X-Google-Smtp-Source: AGHT+IGVHAu0I5Sw1x+SEZPSL6gAtpQBGRuiTeDkV3hMBJeELvP3wQGgX7M8Uju95o7qI4A8V1FqvQ==
X-Received: by 2002:a05:600c:4f54:b0:434:f9c1:a5b1 with SMTP id 5b1f17b1804b1-4389141c9cemr144222565e9.3.1737985702190;
        Mon, 27 Jan 2025 05:48:22 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd47f292sm131038555e9.3.2025.01.27.05.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 05:48:21 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 27 Jan 2025 14:47:45 +0100
Subject: [PATCH 12/24] arm64: dts: qcom: sc8180x: Use the header with DSI
 phy clock IDs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250127-dts-qcom-dsi-phy-clocks-v1-12-9d8ddbcb1c7f@linaro.org>
References: <20250127-dts-qcom-dsi-phy-clocks-v1-0-9d8ddbcb1c7f@linaro.org>
In-Reply-To: <20250127-dts-qcom-dsi-phy-clocks-v1-0-9d8ddbcb1c7f@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1503;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=E3qMiGePTLHOvt4i2UMkpioqulIAIrX7oJdX/Dr1FNY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnl46Jlh/4jOiYEh4Mck5PmnJduHHKJfNyS3NE1
 0us2f+jW0eJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ5eOiQAKCRDBN2bmhouD
 1/ETD/9xU+u05xQ8PYc/4FNLzThBNgcNBWBa+y6FM0N+GR6v0F15YS3lA7GdcNZdVLDUhPBsijX
 Jg73XIGB2hvqT/GG4eTkMVdND1p23betkQVmLjYXrNijm9yxab3JpDAsY55e42rmK0w/eL6FuTL
 79roGxHnHJzVNab9Yzqu6/nq4hDkIE1eOmdzP23qtgEyL4eyQ1F6gSz8i68g21hrJOrPX1M0zTP
 s48lKq2fTfnSXA1Yt8wPJ4FwpzsWtuwaDv7Mg/LM8qQT1xNzCAVELDV9d1T7as1uDjjbSBq8YF8
 lGxmqzsCMg056vgH3miLpJufNKvh4vvCCzMAUaXER+ocOYnBGQjVgbCquIiTgq1UdqhmFaFnhiu
 6487lm6XAaMvchNrlmU2fMsJB2JrV6B3S0uixsIggpQ9kMJIzQ0WjUM/z5HaqotzfCXfK8y5Fli
 iVpEEt+Mgi/xLlE5HOznENlx0R0ZvAWWMP2z1SBz3/5mRiN36UZRuVcUDoc0iEaEbc4NfatT6g0
 6CkpkARJo5XRkCOwEmecZdSIpuvU6ih971GwA0j5lkPMoghfDyLTW7HQ8/7zP3fhgTF7hMxsW2V
 bfrwlVIUs0hES17KR1hUrZOHrXlezIhddQNdGl4pIDDOLJodB7L5Z+WBqKj8RYVIZDfc0FTuXd/
 E5NTEVGuK/ZxJLQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use the header with DSI phy clock IDs to make code more readable.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on:
https://lore.kernel.org/all/20250127132105.107138-1-krzysztof.kozlowski@linaro.org/
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index 28693a3bfc7fefd883a7dee69a406235317c3047..547bf2a0249fef88d0778a5390cfda76a9d7e4f1 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -5,6 +5,7 @@
  */
 
 #include <dt-bindings/clock/qcom,dispcc-sm8250.h>
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <dt-bindings/clock/qcom,gcc-sc8180x.h>
 #include <dt-bindings/clock/qcom,gpucc-sm8150.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
@@ -3465,10 +3466,10 @@ dispcc: clock-controller@af00000 {
 			compatible = "qcom,sc8180x-dispcc";
 			reg = <0 0x0af00000 0 0x20000>;
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
-				 <&mdss_dsi0_phy 0>,
-				 <&mdss_dsi0_phy 1>,
-				 <&mdss_dsi1_phy 0>,
-				 <&mdss_dsi1_phy 1>,
+				 <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>,
+				 <&mdss_dsi1_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss_dsi1_phy DSI_PIXEL_PLL_CLK>,
 				 <&usb_prim_qmpphy QMP_USB43DP_DP_LINK_CLK>,
 				 <&usb_prim_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
 				 <&edp_phy 0>,

-- 
2.43.0


