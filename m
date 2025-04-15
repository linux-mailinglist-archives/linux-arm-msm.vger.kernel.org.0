Return-Path: <linux-arm-msm+bounces-54438-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 285ECA8A029
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 15:54:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9CBD04456C9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 13:54:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 883BF1FF7A5;
	Tue, 15 Apr 2025 13:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ow4Iftyv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20DE81D9A41
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 13:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744725207; cv=none; b=BrpclFXkHX7EBnwMyCn62DeY7icsxXn+YbDJFr9DCKjnPXl/L5fwUTOdIHYxErOdLy+H3RObZ21SatM5tSesa8/pa5C7FUWaFPitls7EI2/nSaySBmQV/Q+5uiZDFNEc2vQ/X/JYT4kv9DZqcEyMbG8p64joKWYVBIhrkgN+bOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744725207; c=relaxed/simple;
	bh=2KwIlvvGECXFrETJCT6z2gk+hxmBfBaHfHMjOZSbJew=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SMgiDj2XsLwl6E286TK0HEEd2Uy+Uklg+urssxhLeEUJOpXEszujqqR2tzDqPfhubd6LCRyM0a7rGG0TqozxhE9fixapsQrdWz2nkNsRvmqg+oKBlrWA3DklenyDAbQBazKxrk1uM1zJRV/wLn09rsk0O/It4F8SB0ImnN/JZxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ow4Iftyv; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-acacb8743a7so835990866b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 06:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744725203; x=1745330003; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IzromOuf9zzJyEBnUnC0UIApSp7seWmK6Swkwn2TE30=;
        b=ow4IftyvpsLLhLr7EM9k4WQnLD38TPJD0GMXoSHK6tEddkfqBDwasXqc6AcA9DY/aE
         sXuplFWIQTB6wA0Tbe+ApnedhZ9exwiKI0vG25lMDi7PWkHUzF3eGaAs3DfAGK8cIZ3n
         mwuCzDyerdEXCBpMuz8oOX96UyuJxMSWgRhoLvkHgPl5Xbqei7xe1zQufImgGQV06WRX
         A6cByR6fPOeb94Z02/R7bXPL3o5X+yqgebCQEWyuz9eTA50xLm8Z/4gzMWwbmeS6lp0L
         PbjuzsmOi+gn8czrdGoZLU94jc+hU1jaAYpqyM17E1i8X6k4K007dMv3zqwUyZHu81j1
         tdWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744725203; x=1745330003;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IzromOuf9zzJyEBnUnC0UIApSp7seWmK6Swkwn2TE30=;
        b=QX6ew8lR6hs2/y45U1fTRvTVhCWdYLrEonPPY7IckUvZmgpfNK82zZfxiWWPX/JcMF
         GYg9VG5TmqiAho5CO/da8Clbkqiqo+EJtpV9PdJthknqU8vn2H4+aWV4ZjKKxJbCfWln
         PxE/I/rTneNQYr0Ile8SN3kHLzvGulVYqEZ6BQpCryojXIAXmviL+3LOmT7rvH77tyLm
         VdIeVBAgewb2DxSdCTM9tEFJyD1T6ZJvyLjfXzOAfdOmfJIusrJ1E7hQ51yRqnRZhbna
         Aia1HL1cEogKMLOsJvp+HpF2+f/ySCH8IFPSpdZkGJc9AjPo4+bWMxtPLngptLgDTjPZ
         fmZA==
X-Forwarded-Encrypted: i=1; AJvYcCUPkEkEX2JTqxJppPzmd9IJp8Uhj8gBtKrcztcuY9hFScZM7s4XWXqKpjWzgooKDS/TcoQRarxhj1b4jD+F@vger.kernel.org
X-Gm-Message-State: AOJu0Yx22oTLI+qkGoGlJSSyiy6srbr9Wn7FPHftcrp9FCdNHmLWuXbl
	QqNNOJWqrLy+vv9EMRXNaWGfCb5HEJTvXTRv0n1Z5a4hrXPr3oLPVXseTxgRQSI=
X-Gm-Gg: ASbGncv5uqtb6DwqMq1tOw2djk8Vbn3LNdlyCRb5AV5vL/IpfjyUXxF+4/JuEZzkFWc
	sjVoDPs2jq6YqfXanVEP54DxklDIIZKCOiU4uLdHFPRETXDnuvVaFqeAmKfWi3xfU/omsL3ZvGz
	pq8ZVcARNxMS3ia9KSkpFXSosgUtXIlG/WGsuE7ac0/zYrtNqzoeWztzagxZ16ShXimEbXs7pd2
	GU75J2wnO9CQPU+cpwasi1UilkmDdC3Qu95iXFQKcgtDD4QE1THy9Z99jn/nRAOR5iy+dYa2ssm
	GjCrXp1TFgUREZVo8RNqvV5l2pvQjFB5wbExS5HdEUroEAWWS5PXZqM=
X-Google-Smtp-Source: AGHT+IFwlxOkxM+FSTXk89qNtD3AqxVqNDqmG63ewdt7FIeooDU3A2bPFLmNB60nWDT25K0clFz4aQ==
X-Received: by 2002:a17:907:d15:b0:aca:d48c:916 with SMTP id a640c23a62f3a-acb166d6d5fmr282910266b.9.1744725203245;
        Tue, 15 Apr 2025 06:53:23 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:7b18:2529:5ce1:343d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acadcc21a44sm681379166b.177.2025.04.15.06.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 06:53:22 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 15 Apr 2025 15:52:49 +0200
Subject: [PATCH 6/8] arm64: dts: qcom: apq8016-schneider-hmibsc: Move UART
 pinctrl to board
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-msm8916-console-pinctrl-v1-6-a1d33ea994b9@linaro.org>
References: <20250415-msm8916-console-pinctrl-v1-0-a1d33ea994b9@linaro.org>
In-Reply-To: <20250415-msm8916-console-pinctrl-v1-0-a1d33ea994b9@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sam Day <me@samcday.com>, Casey Connolly <caleb.connolly@linaro.org>
X-Mailer: b4 0.14.2

Prepare for removing the generic UART pinctrl templates from msm8916.dtsi
by copying the definition for the 4 pin UART1 and 2 pin UART2 instance into
apq8016-schneider-hmibsc.dts. Having it defined separately in the board DT
file makes it clear that the set of pins/pull etc are specific to the board
and UART use case.

No functional change.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 .../boot/dts/qcom/apq8016-schneider-hmibsc.dts     | 35 +++++++++++++++++++---
 1 file changed, 31 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-schneider-hmibsc.dts b/arch/arm64/boot/dts/qcom/apq8016-schneider-hmibsc.dts
index 7a03893530c7b89705f5544491c14edd7120acdc..ce75046ffdac48a206d14499bc711f8f4a777fe5 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-schneider-hmibsc.dts
+++ b/arch/arm64/boot/dts/qcom/apq8016-schneider-hmibsc.dts
@@ -373,6 +373,37 @@ adv7533_switch_suspend: adv7533-switch-suspend-state {
 		bias-disable;
 	};
 
+	blsp_uart1_default: blsp-uart1-default-state {
+		/* TX, RX, CTS_N, RTS_N */
+		pins = "gpio0", "gpio1", "gpio2", "gpio3";
+		function = "blsp_uart1";
+		drive-strength = <16>;
+		bias-disable;
+		bootph-all;
+	};
+
+	blsp_uart1_sleep: blsp-uart1-sleep-state {
+		pins = "gpio0", "gpio1", "gpio2", "gpio3";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	blsp_uart2_default: blsp-uart2-default-state {
+		/* TX, RX */
+		pins = "gpio4", "gpio5";
+		function = "blsp_uart2";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
+	blsp_uart2_sleep: blsp-uart2-sleep-state {
+		pins = "gpio4", "gpio5";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
 	msm_key_volp_n_default: msm-key-volp-n-default-state {
 		pins = "gpio107";
 		function = "gpio";
@@ -469,10 +500,6 @@ &blsp_i2c6_default {
 	drive-strength = <16>;
 };
 
-&blsp_uart1_default {
-	bootph-all;
-};
-
 /* Enable CoreSight */
 &cti0 { status = "okay"; };
 &cti1 { status = "okay"; };

-- 
2.47.2


