Return-Path: <linux-arm-msm+bounces-54437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C369A8A02A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 15:54:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 049DC1684E7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 13:54:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8833E1FC0EF;
	Tue, 15 Apr 2025 13:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sZodQFyT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC691CDA2E
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 13:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744725207; cv=none; b=OFqYvPM4MjOcMnNsH3gezBImKkcB+89hIjyPqSFn8Gs77rm9ZqMkCSfnNvkwefH2szfnC7flDZu9tks2vLXCA44CafCQQapzZGXqtwJWHUzBTMj8BuzEJr9lo9dGGumjslMBIL0Qh4g/SF6Fsf41KQI+NKK8eRzHcM3SgnDxuiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744725207; c=relaxed/simple;
	bh=pasHWSU2nGmm0wTdGpnA+YTR6fwTfPInkJzIhRwnGrU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XfUjNJZecdaVaa02LiPNAPeqHbI3kK31YKIkXHxGqMWHyhxX4b7G8p5aY0bqI0N1vmQlzRfD18XQw9Eh0UAtDWzIgpJ0jTM6jEwmBJ4z6CiFnKjl4lxzlYACF0uDL2aA8Y2niDoUrPNjYINOtDi6I2Y92UZCdd4lFenatWx4QpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sZodQFyT; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ac41514a734so925860466b.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 06:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744725203; x=1745330003; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pge4o9cHBqaAOg3mTeBAmeDqZJrFMUn1AiEvtXGp2iw=;
        b=sZodQFyTYNLUZRpUCuitXLY+BSkEaorU/T4H5fH/Rssv/lS4V6PShnYl1o29z8sB1L
         wmeZW8WbXCsL67hLx8tJ2wrhaq10LQLEE7vrFeD++rNUKZI/jeLMAHP+HYjw5BdLWeni
         4ulHd7JDgLrsjys43xDcam/HskijsdS7DeLnMRv4kKq2ccMyYTXDgKQ1D4Gj3WlHR/0r
         dAnOJc2mrUENEpEGajh2A+1YWi+l+EzJpRnXhkXT2872alHWFVEnm57Ka0K+HxpMHiSx
         mGpn9xWh4nHeqLOl3QTjgzK+UoZIUXerSuMsiiWEftjmju71DCEZB9207iUUN6mXMhI0
         NHVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744725203; x=1745330003;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pge4o9cHBqaAOg3mTeBAmeDqZJrFMUn1AiEvtXGp2iw=;
        b=EJwxz7IkmgoT/V/+5kQIezwh0avJmRfnXkyrqywiHXwBcvt0ZYRo4hhmwGfZwTGGH/
         jkhQTKKTcs7FJlzl8lrpsfRkULM5m8PUnL1SHW4AGufuqEN1HTcMhS6bQoyKlvG2p6Y9
         To0FSO7G0+xOlVMleJsXaqmnK0HzN06wv00OGFQyWq89RAi+dSKfmQ8TW35KIuu3DJHz
         C8s3NfQlM7Xmin2Ozrxvlt4O3EE1QhLK8qeNJ6qnIDrtijPk6CUGQ1viu/oQoK2A5oEv
         8++PZEosCAmMd7SJkIB85Toxt5SyvmiaTO5KwH+katmw2WTH7XQb1GQbQBDdvSB56Bcb
         4pVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWW7Sl6Hl3G6hjO12SDRFzuJnWXJKPwChWVeOI36EDbXnNSSUVewxKQMVQ+HeWgnN1mfFMHWLboivnnynHj@vger.kernel.org
X-Gm-Message-State: AOJu0YyJPLPvdoSM+Odu8h3ecsCE1d3r9gW40diWXmrPMHDqwymDe96V
	FoHg6kssZfhiNNOuL84GPENXMw+GTFrpu4P8TALtP5a6p9VMgaC6gq7Fd9Ia3ho=
X-Gm-Gg: ASbGncv3f8y1L+RqPeJ4vJSCNUZ1h7LWQFvX7doxjUBdWXm9Wo/ZrgC9crCuAc3SS2/
	T3e0MP9bIB8Cdqvvo1yCklJ7MgmzgzJA4yjtXsSAYTnuw2k0IIhCY0MdB2qya57SWDZxjSgaode
	eU9VheHq4m3Yy63Sg2lRgzKaEllFRXkMCAOGHRD0diuBK2cUlSUuXQ5Fczm3bsDK3e25TUaqIbt
	8AvbxUiVMEfRQJHwXq84jm3Fc5FqI5VEu4JBvZ9PuxMIx9yijUEqCFfA14G4X07XaAvpVqCz1p2
	lp3Wcu6vp3sFayDhJcLCPmJUU9H7m22uGT9w3MxeozTcNho6+1ImDDA=
X-Google-Smtp-Source: AGHT+IFzbpbH4GLJ5InXnSEyFRv0wczgq6f5oEy25Mu0yL/aDFPOfMB7Jlpd8NTCxr4BmMOv9fFWgw==
X-Received: by 2002:a17:907:8690:b0:ac3:446d:142 with SMTP id a640c23a62f3a-acad3445e2fmr1369567166b.2.1744725202370;
        Tue, 15 Apr 2025 06:53:22 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:7b18:2529:5ce1:343d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acadcc21a44sm681379166b.177.2025.04.15.06.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 06:53:22 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 15 Apr 2025 15:52:48 +0200
Subject: [PATCH 5/8] arm64: dts: qcom: apq8016-sbc: Move non-console UART
 pinctrl to board
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-msm8916-console-pinctrl-v1-5-a1d33ea994b9@linaro.org>
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
by copying the definition for the 4 pin UART1 instance into apq8016-sbc.dts
Having it defined separately in the board DT file makes it clear that the
set of pins/pull etc are specific to the board and UART use case.

No functional change.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/apq8016-sbc.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dts b/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
index f12a5e2b1e8c2cce6e85b8444c97a7e0d7b7c58f..b0c594c5f236c9c1d334e6acfcaa7e41c1f9f3a5 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
@@ -597,6 +597,21 @@ &tlmm {
 		"USR_LED_2_CTRL", /* GPIO 120 */
 		"SB_HS_ID";
 
+	blsp_uart1_default: blsp-uart1-default-state {
+		/* TX, RX, CTS_N, RTS_N */
+		pins = "gpio0", "gpio1", "gpio2", "gpio3";
+		function = "blsp_uart1";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
+	blsp_uart1_sleep: blsp-uart1-sleep-state {
+		pins = "gpio0", "gpio1", "gpio2", "gpio3";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
 	sdc2_cd_default: sdc2-cd-default-state {
 		pins = "gpio38";
 		function = "gpio";

-- 
2.47.2


