Return-Path: <linux-arm-msm+bounces-43897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B50EA00AAC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 15:38:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A086F3A4284
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 14:38:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D246D1FAC23;
	Fri,  3 Jan 2025 14:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ymf5idym"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED681FA25D
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jan 2025 14:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735915117; cv=none; b=sKTzdlpUU9DJnetQBR5GjMzNYYu51ts9ReoJedSVfiMznyLnA0Hu9Hxme8KAiKNIwJPJip2pMcpn0JDIx4FAcmIOQB5aWE9jWOTkXXW1aZn1pia1UyNtxjqOgQ+3r6MLAZ90fjiEs07v6M+4tdHVzeVuFI12t60IK+57W2Brd8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735915117; c=relaxed/simple;
	bh=6MYAyJNiKjIJRjZP+kRmtZAtfqVcLkXfnhiloyCSICI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r28bnhE/uuExSajSInbdMaHVETFr/n/ZnmWz5TLd4RobafbZHm/fjeTY1y/CHRs7TpMVXeV0yRN9hhjHnjBwqiLTTH6ga60QHLDt6vqWeJdBWmYZLjw1qgplC9vbczHOY71sA55GHMI9PmMbFERfX3RZz1bbnp5Zr0Y6mB6pi58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ymf5idym; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-385e27c75f4so8797012f8f.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jan 2025 06:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735915113; x=1736519913; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KvFk6EK6W/VRxWdLvZU9XD5Dh65CwZ2VlJ4c/jgx6xY=;
        b=Ymf5idymuzicDiW02UuBaZWIAbDvibb78DPoW3ylp439HCoftLbQTRSToEYBbmIhDm
         6DX9fcTpM3jo71U6EEcxYSe4RSFaTIOtrXgJ+XRUMpOFC2Kb30yj9+myHJ+WH5OxSv8Q
         qiks/2pfGFsaRzYK2MaB0Ji4b5fM1B2sjDJDkvl/TcOOmiLky8uZGcI0M2jspEr+jKn/
         js4+qlCk4IoBIY3kZNcuagay3KH0UOwGYsF50n7Cs+006GQBtT4ljkJpeo9HPopDGMr+
         RohbxMJ7LGzoQVOrEsBNI7+OBCzwq/x+8eA9Vvgx+Hv4UnkILqCclRDXm8yWbAIIWkRL
         CZPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735915113; x=1736519913;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KvFk6EK6W/VRxWdLvZU9XD5Dh65CwZ2VlJ4c/jgx6xY=;
        b=bISjWq/dKDsIGa7fl9qnGliqw3LcZEI6/KYlBzh6QAaDoH9+Bly0OonTAT3gtFNWbn
         71IfbaEj4XXeg5z6a6elfGXXSw/FKFPFMPVeMojtlW/HnjmCw75Y6Qz8CF5nDFIdMhN+
         JyW3lGrMTICOiC91HNDPJdrZW0pKJnD/ey1jBY+6or2S/YOm62kp5omlozPXC8d5pdjp
         2MdPWjmrW3+s2bdN3qVNd4UMf1/+7m6lNctqya79tz+2ocYkRgMqCh05v/6a8MSmnKxt
         +5Fn3KZ4o9ho+24SYns+CG2mStLkcIbELpDciwyPHmmz11alW77Qnnj7ORGnxVA2xUrn
         coAg==
X-Gm-Message-State: AOJu0YyfCbHhLuOsgTSLG04j5rr31tKcYnqmwyKA0wJmUA+c/sSL4Fd9
	mXinFQdusI0RPiY47arW9oi53zvYCR0k5RXTC+SqioKbHIugdPfNOkkMYRwkF9wSXLYgSXsle3h
	Z
X-Gm-Gg: ASbGncsSe2JcQrog2co+E7pfen0gux0o3LHcTlKygk77bNfaSN9oMSAr0up/2RuxYuo
	HWi8rVVBlSeZUZhXsWtKeY/q+IMyN3rqi0t0TW0sDoNHJw4vuu/A/GGOEuDLP3SbvIUl8pKhCyo
	liYnW1Iy/oR2kDDNWp2aG1pQi7blztnrCW0M0nq7qvmO5jStZhhtmsODmb7c7XZAOlvTUrtbUaV
	R+HzkXrpCoWGaQF0l7M8ooS8FbNM7AWx9A0ctXd7P1JyBMr0llswai2a2bJcCf1T9dLuQl1IZRP
	SA==
X-Google-Smtp-Source: AGHT+IEXFOZ+0uZp/4l43sA+IegSsxHw2PJ6o4TvVY4/FxpHANnNWTFPHdMmzUntC1G9T6ixXRt4qw==
X-Received: by 2002:a05:6000:186b:b0:386:3835:9fec with SMTP id ffacd0b85a97d-38a223f76aemr49024142f8f.44.1735915113174;
        Fri, 03 Jan 2025 06:38:33 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c846ca4sm41558404f8f.43.2025.01.03.06.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 06:38:32 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 03 Jan 2025 15:38:27 +0100
Subject: [PATCH 2/2] arm64: dts: qcom: sm8650: setup gpu thermal with
 higher temperatures
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250103-topic-sm8650-thermal-cpu-idle-v1-2-faa1f011ecd9@linaro.org>
References: <20250103-topic-sm8650-thermal-cpu-idle-v1-0-faa1f011ecd9@linaro.org>
In-Reply-To: <20250103-topic-sm8650-thermal-cpu-idle-v1-0-faa1f011ecd9@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5322;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=6MYAyJNiKjIJRjZP+kRmtZAtfqVcLkXfnhiloyCSICI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnd/ZmZONkGPkWRBeHrOF+YcppWKlIJtf6T1DNYzq9
 Uu+bV+KJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ3f2ZgAKCRB33NvayMhJ0fCGD/
 0UKMFH58M5axg9yTfUD9YC54sXBCnEAy/fHTxLa2H6OAPNZ924D66SJU9kK15RLLQ9QHM/y9YHHY9E
 IP6PJoahgFyKEgl13gBvMyOylkKprMYsRI8AAaYZobZdazRfp+rvyOV78FgRnxXcj59MmL45qzqxNE
 U/Xqu3AccEGT2quRNFXDLvm4B8W4qElSXZuD4ynvYFeCQw94g1nliDaUq6zOjssMct2mHspj/2cM5P
 nG1YgBuS+USVvAhgjtG45rCQDreRyj0S8L9NiXfnJ7L38l6tU66dS5Wz+bDTGevc7p3ngeLjtdI5ap
 U1e0OyEwzakT747w6m9BdlyISFibDWZIQm1TmPFRK8UUTV8Ju66L0D/h8YeizFRS8Hdt/jLHM8dN4a
 b5lXcGIv2jWAH7nN3Uznx3Qisnnx5cULozFetICL094eGOadxtdXinWXKoNvFaJ7H1qEfvAU6j8VMO
 XoP5QeOCeBMzoXxbqnaU1KJpFiGZ4Ne0Vh7rYtkAdrs7148/X7n3plrKO/NrRMx3L00rvOiyW+TCRI
 YAle8CDDzSdowg+psfbbzj0+PhB9wR0bifjZq4RLGd9srzvXSFx1RLek6LjG9Od2WxnZ/+6Gsyypha
 b3StsmKFdYlO0EsZRgKS5HHNFnLlFhgEtSVsDcirj6mkB1HbKrweylDx1QVw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

On the SM8650, the dynamic clock and voltage scaling (DCVS) for the GPU
is done in an hardware controlled loop by the GPU Management Unit (GMU).

Since the GMU does a better job at maintaining the GPUs temperature in an
acceptable range by taking in account more parameters like the die
characteristics or other internal sensors, it makes no sense to try
and reproduce a similar set of constraints with the Linux devfreq thermal
core.

Instead, set higher temperatures in the GPU trip points corresponding to
the temperatures provided by Qualcomm in the dowstream source, which will
trigger the devfreq thermal core if the GMU cannot handle the temperature
surge, and try our best to avoid reaching the critical temperature trip
point which should trigger an inevitable thermal shutdown.

Fixes: 497624ed5506 ("arm64: dts: qcom: sm8650: Throttle the GPU when overheating")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 48 ++++++++++++++++++------------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 448374a32e07151e35727d92fab77356769aea8a..ddcb57886eb5eac2a70d28e6ad68fc6820b5dcf1 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -6507,19 +6507,19 @@ map0 {
 
 			trips {
 				gpu0_alert0: trip-point0 {
-					temperature = <85000>;
+					temperature = <95000>;
 					hysteresis = <1000>;
 					type = "passive";
 				};
 
 				trip-point1 {
-					temperature = <90000>;
+					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "hot";
 				};
 
 				trip-point2 {
-					temperature = <110000>;
+					temperature = <125000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
@@ -6540,19 +6540,19 @@ map0 {
 
 			trips {
 				gpu1_alert0: trip-point0 {
-					temperature = <85000>;
+					temperature = <95000>;
 					hysteresis = <1000>;
 					type = "passive";
 				};
 
 				trip-point1 {
-					temperature = <90000>;
+					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "hot";
 				};
 
 				trip-point2 {
-					temperature = <110000>;
+					temperature = <125000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
@@ -6573,19 +6573,19 @@ map0 {
 
 			trips {
 				gpu2_alert0: trip-point0 {
-					temperature = <85000>;
+					temperature = <95000>;
 					hysteresis = <1000>;
 					type = "passive";
 				};
 
 				trip-point1 {
-					temperature = <90000>;
+					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "hot";
 				};
 
 				trip-point2 {
-					temperature = <110000>;
+					temperature = <125000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
@@ -6606,19 +6606,19 @@ map0 {
 
 			trips {
 				gpu3_alert0: trip-point0 {
-					temperature = <85000>;
+					temperature = <95000>;
 					hysteresis = <1000>;
 					type = "passive";
 				};
 
 				trip-point1 {
-					temperature = <90000>;
+					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "hot";
 				};
 
 				trip-point2 {
-					temperature = <110000>;
+					temperature = <125000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
@@ -6639,19 +6639,19 @@ map0 {
 
 			trips {
 				gpu4_alert0: trip-point0 {
-					temperature = <85000>;
+					temperature = <95000>;
 					hysteresis = <1000>;
 					type = "passive";
 				};
 
 				trip-point1 {
-					temperature = <90000>;
+					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "hot";
 				};
 
 				trip-point2 {
-					temperature = <110000>;
+					temperature = <125000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
@@ -6672,19 +6672,19 @@ map0 {
 
 			trips {
 				gpu5_alert0: trip-point0 {
-					temperature = <85000>;
+					temperature = <95000>;
 					hysteresis = <1000>;
 					type = "passive";
 				};
 
 				trip-point1 {
-					temperature = <90000>;
+					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "hot";
 				};
 
 				trip-point2 {
-					temperature = <110000>;
+					temperature = <125000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
@@ -6705,19 +6705,19 @@ map0 {
 
 			trips {
 				gpu6_alert0: trip-point0 {
-					temperature = <85000>;
+					temperature = <95000>;
 					hysteresis = <1000>;
 					type = "passive";
 				};
 
 				trip-point1 {
-					temperature = <90000>;
+					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "hot";
 				};
 
 				trip-point2 {
-					temperature = <110000>;
+					temperature = <125000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
@@ -6738,19 +6738,19 @@ map0 {
 
 			trips {
 				gpu7_alert0: trip-point0 {
-					temperature = <85000>;
+					temperature = <95000>;
 					hysteresis = <1000>;
 					type = "passive";
 				};
 
 				trip-point1 {
-					temperature = <90000>;
+					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "hot";
 				};
 
 				trip-point2 {
-					temperature = <110000>;
+					temperature = <125000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};

-- 
2.34.1


