Return-Path: <linux-arm-msm+bounces-63276-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 34ECAAF01D7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 19:30:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D85FF520945
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 17:30:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE7FF283FD9;
	Tue,  1 Jul 2025 17:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bUFQL+z4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C099227FB3B
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Jul 2025 17:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751390943; cv=none; b=HUAVP2IVNqz8P/xPiVJQnoMQgt2ZB6r+lrynjetcUylmhX/B6XiLVWLQnpU/4euxzfHSxOXajROCuspHX0IJWTLl0UTm39xy8EaBfRdrvRPKV3hrGYT2g/QmKyK7hPqQWFEa9RXJemC+jVY1DdhWvmHcgs7KhffuGMJM//QwK4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751390943; c=relaxed/simple;
	bh=f3r9QS6Ff7gAlNMdR46m+asSbUOrL1rpH8x+IyKBwJc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nqfp5h5hnUUmSfXJfjelEmPNlbOTHREc7PD4C4jmbCwFABx3awVF4Inmc2qzFn8xGf4ZcGk2sBl6D/8XVLEm04Isd5xHaMomeEjeVWRHbZsfNPpgWjkQcPbIWXer+2Q3Nck2hjT3/X6a3Lf86HAO3lS5XU/IBQVpfOZSp1tjnMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bUFQL+z4; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-450cfb790f7so50050515e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jul 2025 10:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751390940; x=1751995740; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/y6Hgcw/oLowryHfdzVYEkIORqp2EL/7QgmBhCk+m8I=;
        b=bUFQL+z4pJMGbY3T0olgZjpGs3Ppjt7g1gXuW/XiZ/z/eYj0yZZwWrXUrieCxms4nX
         TwFg3ZSBcPXzN02KBIyhp6EIgbg56qgm48L9b5ZgA44O0p/xsnGRkX9udb/JpiSL3OKV
         h5meN8vg7N+br3ynt3zhW0UOB5xSYutgX4rSgp7tPFyeh4Wus4GEG47/9UXBVHPOEsvh
         ePACKkZmJIvpmbS/rMlGMB9I99VWWDnv5tVnrO78IfcC7dVjbCahuViK4Ol2sZLMpO2B
         2ZkgDsDukg0b/4YgJptaxVgnEq4ZF4qlJql9+Kg6av0I6y8iBXjEeZW1k8xY7QX0S7BE
         4liQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751390940; x=1751995740;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/y6Hgcw/oLowryHfdzVYEkIORqp2EL/7QgmBhCk+m8I=;
        b=lXT//55y2tCTIS0y3SL+CdAHzn1IVDl+DCcUW3+5QJoi2W7tJKrmjXLvZObGffXA0T
         FY7YIseYrB7tg2xf/blZbqheVxxTWZbDTpjOibCTr5HjGMr4LAdmv+pufpFuMw1TrQDD
         pEE0qfnOJOiSmv2o3MGiSOCUCcjK8pxrZhkKKw9OVDqeXTDmbPnBJjiIB+E8mytYml29
         sTRYHwu88aZaCe+c2+fJRrF91UyiLD9MqXHIJCTYsfWytY7hWSbZy9XRsNjJZsZjwfXC
         GNBspZLVPSbgXNA99K1SffXqKLQzX328SBfbBPWACcjQP6fVlYBVZmUbbG1I0qPTHFWr
         /9Pw==
X-Forwarded-Encrypted: i=1; AJvYcCVpxJcysF4sJyQeaaK4/gg24h8aOoG0Bjq0+wogtxrhNwSdaNqTJzhdki5w3sQRX2xaWXg/VSrFH8sq9WzJ@vger.kernel.org
X-Gm-Message-State: AOJu0Ywrh5eRDoy+yYeml2AQD/13HdPG1EqtceQ7KHSnPkO/Snl4lWwj
	ElaYB57uNVmds+5Rg0WI2z4YQze9RvFVmcnAcDxClsATOASq7t7V+p3IMqLOs6Cflng=
X-Gm-Gg: ASbGncu3xS18AEaY/VGi5Jxg6LGsmJizWITPIwI5uibODKEqIy3y/++VOdK3k9yGShO
	dG/mNYTZ+VFNFPRyM8V5h1HgHZiiIJVYG4O/vBfxehZLuizhSCjcEDI3rGqu2219yD1Rq73orkD
	oVWvKaKVvkHB19BwCRy/yqpZ8wqS5dkVD47O5NYgn0Vh+fBd/JP5JPnZidv2ThkMZAH+vnn3Avr
	k6gA3+2Cc7vWeGFv3GR+4I3/ZFlC1tu7sPGPM6W53Bcf2DD2HCd1+CVPKaw4smQy8MgRuFzr3l8
	t0lspKKE2AUUiSBg+jRlObCmznU53G5fGKgy76CDKrRuONO2eeBSjBD5gb3NSw2EOk6dkvk0CuC
	6pQ==
X-Google-Smtp-Source: AGHT+IGOjQY9tSAGB2eFqWczvzKFeSwWfbshRjZbRtV8jkqhQWE3SX1v/Q7xboVyabgLEHGsCDwfkw==
X-Received: by 2002:a05:600c:35c9:b0:453:608:a18b with SMTP id 5b1f17b1804b1-453947d8ff2mr165994175e9.9.1751390940040;
        Tue, 01 Jul 2025 10:29:00 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:1425:eda1:87ab:f850])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538234b1b9sm198716175e9.11.2025.07.01.10.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 10:28:59 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 01 Jul 2025 19:28:38 +0200
Subject: [PATCH 6/6] arm64: dts: qcom: x1e80100: Add videocc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-x1e-videocc-v1-6-785d393be502@linaro.org>
References: <20250701-x1e-videocc-v1-0-785d393be502@linaro.org>
In-Reply-To: <20250701-x1e-videocc-v1-0-785d393be502@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Jagadeesh Kona <quic_jkona@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Stefan Schmidt <stefan.schmidt@linaro.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

Add the video clock controller for X1E80100, similar to sm8550.dtsi. It
provides the needed clocks/power domains for the iris video codec.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index a9a7bb676c6f8ac48a2e443d28efdc8c9b5e52c0..890eaaa40184a18bff54f2d750968112a2546d19 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -5,6 +5,7 @@
 
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,sc8280xp-lpasscc.h>
+#include <dt-bindings/clock/qcom,sm8450-videocc.h>
 #include <dt-bindings/clock/qcom,x1e80100-dispcc.h>
 #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
 #include <dt-bindings/clock/qcom,x1e80100-gpucc.h>
@@ -5171,6 +5172,20 @@ usb_1_ss1_dwc3_ss: endpoint {
 			};
 		};
 
+		videocc: clock-controller@aaf0000 {
+			compatible = "qcom,x1e80100-videocc";
+			reg = <0 0x0aaf0000 0 0x10000>;
+			clocks = <&bi_tcxo_div2>,
+				 <&gcc GCC_QMIP_VIDEO_VCODEC_AHB_CLK>;
+			power-domains = <&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MXC>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		mdss: display-subsystem@ae00000 {
 			compatible = "qcom,x1e80100-mdss";
 			reg = <0 0x0ae00000 0 0x1000>;

-- 
2.49.0


