Return-Path: <linux-arm-msm+bounces-48617-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 27FDDA3D3A7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 09:50:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6702017B7E1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 08:50:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C53481EEA5C;
	Thu, 20 Feb 2025 08:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qZ/G4mng"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05A01EE7AB
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 08:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740041395; cv=none; b=D3YfU0vDnLGGXiclzO+ZHN71lR84sXY2dHT0wyB9wrQ/BGtqqkxOR0qNjj4Aaxs4Ssre6snSgy01TlyT+HFCcaB0Egas//deKWW4oj/i7kOpAHlcpB1wgL3U4oLC0dENSnuJJz87hmr3m6jJELVPMpnMW8VBfzjVm2nPH6JIQ38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740041395; c=relaxed/simple;
	bh=jEV8vZz5gqNDMyTZ0uRsv3MOluyxCEuJ8kKQq9xb6d0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ciCQWoAVcezAcW+Wh+6ltYtktF6rv0wZO24Uwq+GYqO2J/Qxx3T/Guz26C5vFDT6L1j4j2pxS1aU6MfSK1zDUBC8+SpgzWxDLoFLO/mWvQtjAywWtoVRrVObVIOjnUrAHgaydNOjzz7Wmzz8aTLqpnn4W3Ulu0qhpgMzf+gppj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qZ/G4mng; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-439990502bdso896155e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 00:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740041392; x=1740646192; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yWB+SbZyOVXJ9r7wbGT1zybdbas8WjeIU9tjrK4U+Qo=;
        b=qZ/G4mngc1ZVhsQuyUKGZKgsod2pDUiY7Xdf/UjuGF7LAs+G4b4OsLmOSMROyT8dz0
         cBPuIHDqiW/7vwJshalgd3jM6zMBEKWBMl5CBxlZOl8iGvl2rF4+nf4B3qkpLeZ/0vMU
         ezGpNe53Gx9lOChqMXmEsheFe2WMoB/1qj3NWSMb6elfG9CqD/V0XZ1PzFJDP4Jb5FUZ
         AgOpruEpTugjlyY8CD1+CxYOhG6C8R8FPOusBNQSbtMGy9LL4J9+0AmqaKPaZblnq28H
         GN6GP9XbwvUa2efL6exna2y7JvgaFAuIhuQwFfzVWy+0/1WrpOnJdvK69+HCrLj4RjV3
         GBRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740041392; x=1740646192;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yWB+SbZyOVXJ9r7wbGT1zybdbas8WjeIU9tjrK4U+Qo=;
        b=oFG5SYKFIqmjbOD161KPyQtoG48YiEJ9GgF0eaY8EV8Hz1D+hPwmJYzhEUMJXetoZh
         /Ko61U8lxYfdth/hNivyJQTF5p6eg15mHTwMp8E4UrkZeubSPTdtY4ycFoov6Y4nDj2K
         sHibOVxNdGx/ZzyS/Tv4Bg99nHeJNZ5jhWYkrCkQ3OsbCDet6+OLjsqdcnFkbw1UFsv9
         eHHHmMA3DSS7iKRSj0/XdtuLqjzYxI5PRjM0rBUfBjx/tTYYeuPJ6CG14oytfcwahvum
         YNDHFlhjTOjfM3X0RDagKdPXIPtEUyq5njwuVyrIpFotMJc0aL5hCMdA7BmsNZSbez1T
         dgEQ==
X-Gm-Message-State: AOJu0Yz33rLDXkQzhNP/6Sjdbqbi0CuzCaLJEMgy0SZjwI1Laz7qWJ3x
	3e+IdzxngOhkRTNt0+LBZxWH5PbEp//TshW2pbx5WQf3HPJU/wDIj4+fHGczwXg=
X-Gm-Gg: ASbGnctujF8JITCwVzLGi657c3Jm3Pc5ZDf4FRrl3/5UdjAaiCH025P1IcosXTDgFKT
	C1RQoatK4xKNTZOF7tMpJoMVt7pUrbC0h6w27ZKd8TRqwiqseuZYx7VE5KFmKE8b2kM67PBZxUf
	RRHH0C9uEbYtfSct7IjKquFvUym7Vwaw0URen1+fnB0gJCtQir9NQvq9Zh3UhA5w9XOeHi+cfAb
	7q3dbirPNp+yjwZRULK7jsCfNDJnlVoZMCbPtt3NoC71gEVrzmnOFvU3wOv5oz5/rwieI5WSqMx
	xd+HJ+08gtJ5PvQWr0WmXFckVty11H8vONNamhZzHkcOFJzwo/T3iVGgZEa9XFT6
X-Google-Smtp-Source: AGHT+IG4bbBOJVCPcprWYWGX/77B392vmnYMBASei1ZZmXUU29L/4ALcpBiVpQXD2ZjiroNLeZ3IYg==
X-Received: by 2002:a05:600c:1549:b0:439:9a40:aa27 with SMTP id 5b1f17b1804b1-4399a40adf7mr22683255e9.5.1740041392220;
        Thu, 20 Feb 2025 00:49:52 -0800 (PST)
Received: from [127.0.1.1] (46-253-189-43.dynamic.monzoon.net. [46.253.189.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a1b8397sm234417565e9.36.2025.02.20.00.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 00:49:51 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 20 Feb 2025 09:49:43 +0100
Subject: [PATCH v2 4/4] arm64: dts: qcom: sm8750-qrd: Enable ADSP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-sm8750-audio-v2-4-fbe243c4afc3@linaro.org>
References: <20250220-sm8750-audio-v2-0-fbe243c4afc3@linaro.org>
In-Reply-To: <20250220-sm8750-audio-v2-0-fbe243c4afc3@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Melody Olvera <quic_molvera@quicinc.com>, 
 Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

Enable ADSP on QRD8750 board.

Reviewed-by: Melody Olvera <quic_molvera@quicinc.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Firmware release will follow up later.
---
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
index f77efab0aef9bab751a947173bcdcc27df7295a8..341774bb042ff88af8acf49c2f0ef14f9994dfc9 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
@@ -782,6 +782,13 @@ &qupv3_1 {
 	status = "okay";
 };
 
+&remoteproc_adsp {
+	firmware-name = "qcom/sm8750/adsp.mbn",
+			"qcom/sm8750/adsp_dtb.mbn";
+
+	status = "okay";
+};
+
 &tlmm {
 	/* reserved for secure world */
 	gpio-reserved-ranges = <36 4>, <74 1>;

-- 
2.43.0


