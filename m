Return-Path: <linux-arm-msm+bounces-40804-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DE49E7455
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 16:35:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5FC0228566A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 15:35:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7BAC2101BF;
	Fri,  6 Dec 2024 15:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yn3L+2iz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3A4210190
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Dec 2024 15:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733499194; cv=none; b=IrZ7EGId+rc6O7mm9zxjRA5Cy0KwwCL5wsol/PhWXVrpMqYrAlnBjg66OpFdz/wkZq1pIraa/DkmnznrIYUAsl/pTFOMiK3sRMHFFpJB5E/GpH0Bp91KyyDUtmjqd3Fy2F+iOxr0PEJnaTJ2F3HFiCm7SDQ88/6HcrdfjC6V5wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733499194; c=relaxed/simple;
	bh=bPAnYB/s6vieXWSOzn1vH05zgwW4o+c+eEtY53Ov46A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m+79hDXZKxD50VZ0rBtnW48xcrszknP3HB2Ebmf33FSN9cIWg1zxw4RjV+VPiX9pFssBmPtJjfmBBTVBVZby2/sU2EdGLOTN1V09InQIR7d0Y9kVmUEMx1i61TUytEqgML/ZuWfy/2yVdLWNRb6WXboK366aAzpgppKXA/hdhgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yn3L+2iz; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-434975a1fb1so1641945e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Dec 2024 07:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733499191; x=1734103991; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OWuD8zuyT3IgCkVdHQ+4bAa6ou/qCQZMjs3Ko6QG9sA=;
        b=yn3L+2izkjeQxHrj6TI4oh/eH0nTTRf+fc504Vw6v3TKC8WZFv040AvuDlpD1fkDOZ
         bHUo43x26jAh80n+vMDpdGGL9lcgMg1dD9QDombJTbPO9ZhGJbv2o2ospWc9qEumHpsn
         exF39DuU/XEjG9Lhpy2psjuBeSTBBKk+5GBpSLerTADb4pRXpkPU2K6pwp2ArTEgBGc/
         6NIMuKB5JNRxC5fEX1W4DQTWU8FcY1CHMFMbPkLoEdLL/S6/rKt5BmfxZAN5Kc4oY5rH
         Rm7g4NbCUq0dIP2Kyqp+rE7zd0sb0e06eVW0ZHle+NfvbdsPoo29PKM8LN6xLDW0273j
         2IIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733499191; x=1734103991;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OWuD8zuyT3IgCkVdHQ+4bAa6ou/qCQZMjs3Ko6QG9sA=;
        b=GP+3+oXgU2CS+IH2u+GXIn1qcdvZe3LtQMn0o0mm6+Cho100q/xvYVv0Y2xrWazxTd
         rnfbzIG0jBF3WmSQ65wvw3NvxbQa+0z72zSiA/S5V8byJSJDRiTmMVXex0N+9pb2NuXE
         JJ3BqoEbjQIGjQC+03rIW74x29KTrJKFU8Vsvzif7VJu3IfZn+XiREIZGJ3onmMRU9p+
         h9yMz0cvyNSVtHt+UFsq00SiJMNLtKm+dvRd3GU/6ArXWB4wuW0iwwQqqzOIdH0G+wNx
         nMoF1djeBDTI2D6sQxGCWUKfmWDscbMIiife2ImuZ+byK7DVn7lrr2MTuZU/UMCc10Ro
         dMxA==
X-Gm-Message-State: AOJu0Yzl21iBygG6wtqthSJ6+jKTZgea8qFgy/wAy3tmH6nU3E0+k05v
	G/Nf1jBUqaixSdEdX5dmQ1Oj+I1YgBR/r+QOsGWrG5iJPUHnAyK2mrey6k6b043tRZjfqKhOqtf
	4s0o=
X-Gm-Gg: ASbGnctpmSYbttJQf0MEiy00WNIC1LNeCrBj6g0FKlBLeLeP57zMTdyw1rv1Bj65xro
	iEEzX2V4mYGYToLPJwiHrkKZe7Soe2xH3/MqRbCbQlnS2+foVQAkL6O/Nm1MWPQb08aTeHZzExu
	AxBavSG2vSpCnt7lz+xl3IMplP+K+V/nBbEvPjGjPdQKbEyYoPHZ1+IZK8TGKgRGtssuXu4xqAL
	nr58poN2+8tQhOfJs2l2QRhjxPiLLwiIQfoLng1IL1O7ipA4VatxZTBVqZFo1gJcw==
X-Google-Smtp-Source: AGHT+IHO6a10fK6sGX+cEkltx4I+yeKtD8CTs+qOiqhYV8pnh9XhBa+2qtGKM66S8MGbRQq3KZ42fw==
X-Received: by 2002:a05:600c:1ca2:b0:42c:b9c8:2b95 with SMTP id 5b1f17b1804b1-434dded59ffmr12276365e9.6.1733499190989;
        Fri, 06 Dec 2024 07:33:10 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434da113580sm61158035e9.29.2024.12.06.07.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 07:33:10 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 06 Dec 2024 16:32:36 +0100
Subject: [PATCH PATCH RFT 12/19] arm64: dts: qcom: sm8650: Fix MPSS memory
 length
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241206-dts-qcom-cdsp-mpss-base-address-v1-12-2f349e4d5a63@linaro.org>
References: <20241206-dts-qcom-cdsp-mpss-base-address-v1-0-2f349e4d5a63@linaro.org>
In-Reply-To: <20241206-dts-qcom-cdsp-mpss-base-address-v1-0-2f349e4d5a63@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Abel Vesa <abel.vesa@linaro.org>, Sibi Sankar <quic_sibis@quicinc.com>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1284;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=bPAnYB/s6vieXWSOzn1vH05zgwW4o+c+eEtY53Ov46A=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnUxkXitOvpR0/Pk5AKzd0e+RCiPIkOk+6vahFS
 jVnE4TfW46JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ1MZFwAKCRDBN2bmhouD
 13giD/9tzgeQtYOOpVI4c4clu7bGO5Ukw9a5ap9iGLXZuQavigCuW1KErvzBija+cC681GPvSek
 UCnFK+HpbV5c6tSvihbmXYD/1sAnH7QEMrtuI9SVFAGAc1EaMs5//TLzKbCjQSsY0VOSEcda8bd
 QLJFYbKinXO/he9YOxzZv1CkUr3uWNa1ljp7EqUGpfhGcoHMqgRHHRGNczkMXlnOf5Xw5G3p7SI
 zqyQE3+QIDnWoeAntPICS+MGAaOY3Vqm9dAgfuxscNF2poGbuMDXr6jdQ++EwE+/4JfLNtJvM1B
 XVTaH7h3Q4AqHQFNDwVqf2iUefyZFy1TLuoAJZXdnm75pYqrfRmBbGjRFUIlK55+9KyESF+luIo
 fHD8i+7upNGxI78sCTIcq7ftCEIr+523JmD04Ko1OiNZyiW1+eFKoMTSR65GuaIQKM3I0BrTHzJ
 pM8J9n36lCwZ1uGUnqrSMXiNdVVDcTvcSDqz/npDwrzYmnzjyrJKZPm2JXB5LkZODU/AQ8Cf8b8
 NMMqxJwd/vVqTIOyjntSlutI99RGOOS7b8Y8pw4uk1dtRO9/lllkAAU0cgL3mlnQeJCPkV50kZm
 izcAJRjqsL5dgYqTt1tz9oQGYodalEWgG8cAF3clElLh3sIBqAnQLFrtKpZ2MbiGU3rBLukxtLo
 luXDJfmsNB2x2HQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

The address space in MPSS/Modem PAS (Peripheral Authentication Service)
remoteproc node should point to the QDSP PUB address space
(QDSP6...SS_PUB) which has a length of 0x10000.  Value of 0x4040 was
copied from older DTS, but it grew since then.

This should have no functional impact on Linux users, because PAS loader
does not use this address space at all.

Fixes: 10e024671295 ("arm64: dts: qcom: sm8650: add interconnect dependent device nodes")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 1d935bcdcb2eee7b56e0a1f71c303a54d870e672..6ae81c191fae8f1788adb399a364886d3fc2dfdb 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -2853,7 +2853,7 @@ ipa: ipa@3f40000 {
 
 		remoteproc_mpss: remoteproc@4080000 {
 			compatible = "qcom,sm8650-mpss-pas";
-			reg = <0 0x04080000 0 0x4040>;
+			reg = <0x0 0x04080000 0x0 0x10000>;
 
 			interrupts-extended = <&intc GIC_SPI 264 IRQ_TYPE_EDGE_RISING>,
 					      <&smp2p_modem_in 0 IRQ_TYPE_EDGE_RISING>,

-- 
2.43.0


