Return-Path: <linux-arm-msm+bounces-40266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 161AA9E3BED
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 15:01:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFD71285C63
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 14:01:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 115951B86CC;
	Wed,  4 Dec 2024 14:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GuQpHd+B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB8E1F8AC0
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Dec 2024 14:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733320837; cv=none; b=MvjRzsXsjUIaFKfPMy2RTwR/sCmEguiccwdBC6DwRM1de0a1Cy98hApF+ifBJobn+ATjqvKwakWRMp+OnViKM74BAp6zsqzshuYz96KAQ4mJK2Hg/PIdpmBFvBS3VLUYwQeYcrtjZ0oECxvizqyQ586cS23zXuN7PS+m98IalV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733320837; c=relaxed/simple;
	bh=ssp4dcsZCDyLM82QaOE3c2k7MIcONTsg6QEdlf87K3s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oz0i5L9SqQobfknl1EUkvbC1UeCfn63ZhEGSp+Ox8Y8nLao6AeOJKUmP32AQhjqsw0+xO29+JctmHsyHtdpBO98FAdnNoDQKM9JKZaHpaYS3UpRG2lpK96N0TC4GgfatSJGT2/8bWDXutlMUVrOrjnUMTuoGJeHiNcxFebYvDt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GuQpHd+B; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-385ddcfc97bso4684737f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Dec 2024 06:00:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733320833; x=1733925633; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dLrHu50pzztwUqxBZk1ZRxPuancx79BTgjqfe/nlYrM=;
        b=GuQpHd+BknyYyIB5IEpeAd525TxBvFkPimTeMlQMAGcuid448fy8iWlPu6h8wVyiZD
         ez1+vq8QMD6B7iPULs0idlUZA8YBrsyFa+AJFPn4FD4wzhPWic/eEIqXw75nyCpp0Qf6
         aFCKTQWYKbNxnkyXrCEXql+7X4dCxV4jZqnEM+0HHv9fRITeVx8wruTppYNeJaIwQfV8
         JlBxYCcVzPBYXSCgLjxYSPu0eN1eQRjLhfkvJLzw1VwIdKaH7ERNE/N8FrYlLU9p7hz7
         lk/MHEc8vCZRM3cGPGV6DmDVCJ9YI2iX9dxb9wBx8mAipTljsXAFVREN5CYl3fbnaxFU
         KS3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733320833; x=1733925633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dLrHu50pzztwUqxBZk1ZRxPuancx79BTgjqfe/nlYrM=;
        b=H/6hocOdhyeqSltJY48Jxe2o+MbzF5bFMX4n/diBWeQWOF68W07DrI0Rpdq3ptxxOa
         ntpk9KhiMc12TwIE+CmTWFDgGojUvTkYSvYk06F1XueC3IgIIxRzq3Nyo6SYkadIy+PH
         I3V2cUyJM72h6hWbkpUAV5U9AqXvNkTcehowUrZzrDk5m7gzL3y0HLB6egz61ROstv/L
         1b5vdcw4dXljTCaHv1QmTQT+FKmm5le8fJeHaWltI0JMPtsYCmwDA7hN1iWx0RxawIwS
         0IJl7LO4ipr5flHiNmOJZIWI+vag9phveTrpXj3eXDBOdIoAkq9ksVSLeJMf6LAhzqnT
         g10g==
X-Forwarded-Encrypted: i=1; AJvYcCXGJFbEvTKUkM2jWp/aRdIF5/yqQFDOYLFOOdXpIlJ1dlbDuF2cPU7TELYP/Pt2ZsRoCAgctoaBvlnPcI8j@vger.kernel.org
X-Gm-Message-State: AOJu0YwQvxddrSLI6SIPunk/RUtBE3g4Jo7XVXXEPZHnKP5SG1KmPM9m
	g09y3c5YvugH3gEjm2GkSeLu7/wFIjNI11vOQ4P2qgspwJfJZw8oW2kTddgHWDo=
X-Gm-Gg: ASbGncsXIXJCZFK9OxcMIBZmnm55Ntb+dOisODsH7j/LUm1ub4j+GT22g71+5lciXwW
	R5k7DIdHtp+6wYK3PuQIdN2LKJZeW54wZdjkiBwydfFA398w8p2ROlpBRHVR+3KiikeBVmEUcq9
	zV0uAvTRru0r4ZPvpE858MJpRXcwyABe/iP1Apv6YZBVw0CQtoxVyTUcleNY+Dy/6wAdqfKaTfa
	PStaF7SxLCpNwv1nQAJAve078pCr0YMCxNqooGeF49YF6O2dwSfPvCmPZWOvJXDfw2MG8I=
X-Google-Smtp-Source: AGHT+IHYK7Du5iUylGSHkyu3iZhxC6pu4WEqdTfJd2HA8NRTO0kPBBavxBK4pbJjpzuedl5Cz9JDnA==
X-Received: by 2002:a5d:588c:0:b0:385:edd1:2249 with SMTP id ffacd0b85a97d-385fd433008mr5794874f8f.50.1733320832123;
        Wed, 04 Dec 2024 06:00:32 -0800 (PST)
Received: from localhost.localdomain ([2a00:2381:fd67:101:8e2:966d:36c4:3579])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385e2c84d52sm13689978f8f.49.2024.12.04.06.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 06:00:31 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: linux-sound@vger.kernel.org,
	srinivas.kandagatla@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dmitry.baryshkov@linaro.org,
	krzysztof.kozlowski@linaro.org,
	caleb.connolly@linaro.org,
	a39.skl@gmail.com,
	konrad.dybcio@oss.qualcomm.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/4] arm64: dts: qcom: sm6115: add LPASS LPI pin controller
Date: Wed,  4 Dec 2024 14:00:25 +0000
Message-ID: <20241204140027.2198763-3-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241204140027.2198763-1-alexey.klimov@linaro.org>
References: <20241204140027.2198763-1-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the Low Power Audio SubSystem Low Power Island (LPASS LPI) pin
controller device node required for audio subsystem on Qualcomm
QRB4210 RB2.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index 816b8331933d..df2241237b26 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -16,6 +16,7 @@
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,apr.h>
 #include <dt-bindings/sound/qcom,q6asm.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 #include <dt-bindings/thermal/thermal.h>
 
 / {
@@ -810,6 +811,20 @@ data-pins {
 			};
 		};
 
+		lpass_tlmm: pinctrl@a7c0000 {
+			compatible = "qcom,sm6115-lpass-lpi-pinctrl";
+			reg = <0x0 0x0a7c0000 0x0 0x20000>,
+			      <0x0 0x0a950000 0x0 0x10000>;
+
+			clocks = <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+			clock-names = "audio";
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&lpass_tlmm 0 0 19>;
+
+		};
+
 		gcc: clock-controller@1400000 {
 			compatible = "qcom,gcc-sm6115";
 			reg = <0x0 0x01400000 0x0 0x1f0000>;
-- 
2.45.2


