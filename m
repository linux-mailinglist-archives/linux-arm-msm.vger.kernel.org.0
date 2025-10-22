Return-Path: <linux-arm-msm+bounces-78257-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CCCAFBFA29F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 08:07:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 918304EAC5F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 06:07:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1C342EDD51;
	Wed, 22 Oct 2025 06:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D+PzS1mF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780822EC0A4
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 06:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761113231; cv=none; b=ZgONY2Lexmf5g5DxtMCS8+aAfUjWDcPx7U+GITExtg2NWhhMW7cXeTe4K5Z9wEAYoZYPwXc1yrdKojyN9Eqre1WUKHb/qekM0rZSNMt0Ouxq1oZZM3NeXp/sIzRhDt5Iih3tANcVHn5dG4eqzRM6fDOMuyaRRJNf9MAktw5q5SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761113231; c=relaxed/simple;
	bh=S97oSVlZN3KadS5+RKsMHqWslriATuoFqnaos8OAnCg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=atpcBULTLeHI8mPPkJaPmMGhmfkZMPlnFHviXfVf4ZE9BAl5jqHYsNmi4GME+4v5mC7W3wNtv93UVQq7buXWx857rWPqPUtTRRQJ46X24Aq06kC6Rb1nsXZVniuwTqrGjQsU6jhDjUDybhlr7do12Yxtwj1bn/x4XslgOw+7ktk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D+PzS1mF; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47114a40161so21800255e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 23:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761113227; x=1761718027; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z2kywcqHndau+ZX1UJrHVrAlF87vou6twWGANcsSckg=;
        b=D+PzS1mF2m5XAgZxJv9W7JVRgqhuEJhiPu8xgtDSBxIUJFXsbT7wX2jyM+KhoLmo7M
         l0gZYApbleMj3lKhMcfbt2dCi4zRWUzNfEVXte4QQnxhCYupOQzuhcloStpalCPR5MWL
         Pb2UIie9zne49V2Ia8IcaiWLA1wU/RVhXDeuPZdx4dfk/FRMyYYfqAk9MU7N2spFr9cn
         RegpidKiA7UZ6KspbWBqjk5EvP8KxzTTqanE043aEg73NrY8RJZxTxj5cyPJxlZduRzU
         32aEyfI3NmIsY/QM17Bsv+rs0dSamTB5gMHJX55bCryuOzbjV/NPWbOlIbAkE0kYiaun
         T/RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761113227; x=1761718027;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z2kywcqHndau+ZX1UJrHVrAlF87vou6twWGANcsSckg=;
        b=OZ1jG4Lw6tntndSGeiReVlXxBEK8xCCrPMPpWPbTYUqg+z4APX12DzMqNSsyS11vb1
         3PLVULEVElwXdWEYeL1+znTHqx6XbyPDi2CO3ZbHYGJ/CSdE2e/tuAIFI635iEHQuV3n
         Ywd25+AZ5/bx8JLJPVfa6CFCZCfiEa/tZ9gVXieinJhGIPpxl8UZZqWceMAHeK6Speiy
         KHPPEHvMWcggXx+iuWfWzDwfKOTsXq7weREBfOdUoCaTDX02MLXcezxXCCtQxDdyt2YA
         ixdSXUfpJr26ZEMfxDwNm1GSz2Orct39uWMqRpnBtjmBDM/K0/l2dRKfX0dWhuBxIuEU
         UX8A==
X-Forwarded-Encrypted: i=1; AJvYcCU3Ebmkiown8ELNjrV0DQuPW46OLFyYF6txHbEDsCiQYxFY9i1DRI9IaCk7SvUjxTKNwJHGMDbKOec8mV/b@vger.kernel.org
X-Gm-Message-State: AOJu0YxBGgj5Yn/r4BeIUOjFNMxNLYJ65+gGFUjCacXm2oDiB0KQIrl4
	ZjZyzbW11Sdel4jrVD83xSbrnbVjFRcwtp3WaHN7o5wXTZ3TOcasLkkTJQxt53KEvSw=
X-Gm-Gg: ASbGncudl/6vbu5Hay6jee+yD6Fg2h48oFEPGddSeNoW7n/HYkTe9uxT/Hu+HzhcEVP
	htQWIR1n/YXJY9F5ecT0L5a2Qks2W8PwlH0NpkkA9B/EpgiQPg+yduYNVO8oDpF3xszvUDB7py2
	V9f8mdQ3fZFWGM/sKOJ31twJrxXnGxiRawH3JwT45kVSWl2s1Uq8m8LWd9gEZlVgsv/Bq3TCiMP
	I4NGL3XLVDJeraAEc77OYESBBxsDCYbE34xP9iBoGZKk4GvadO2hRk4ev52/YhzxNSlmfgsnZN3
	5H450VCV/8lBpxnoGUa7oNTJfsEmYcsRD49PXrEyBn90cxn8RbHue42Xj6pVUdO3aCcaUTpl9FB
	x5tNk/V4oaES9pHKoZ7/0xYAbPhPlqXTWeFiTrUGvZbn9gOLvZ8scEaj51Nal03JCcIJDJJQhW9
	vxgIJpWiLpQtKneQm4
X-Google-Smtp-Source: AGHT+IHvY8MI9FmdOJKvxqkZENHKXLT9a+Nnec2BglSSWqYh5CgLTYL8rIj1yUpyF0vSSs/N2lIokg==
X-Received: by 2002:a05:600c:871a:b0:46f:b43a:aeef with SMTP id 5b1f17b1804b1-4711791d923mr117704085e9.38.1761113226858;
        Tue, 21 Oct 2025 23:07:06 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7259:a00:11f4:2b3f:7c5a:5c10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f009a75bsm23794067f8f.23.2025.10.21.23.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 23:07:06 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 22 Oct 2025 07:06:42 +0100
Subject: [PATCH v3 2/3] arm64: dts: qcom: qcm2290: add LPASS LPI pin
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251022-rb1_hdmi_audio-v3-2-0d38f777a547@linaro.org>
References: <20251022-rb1_hdmi_audio-v3-0-0d38f777a547@linaro.org>
In-Reply-To: <20251022-rb1_hdmi_audio-v3-0-0d38f777a547@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.2

Add the Low Power Audio SubSystem Low Power Island (LPASS LPI) pin
controller device node required for audio subsystem on Qualcomm
QRB2210 RB1. QRB2210 is based on qcm2290 which is based on sm6115.

While at this, also add description of lpi_i2s2 pins (active state)
required for audio playback via HDMI/I2S.

Cc: Srinivas Kandagatla <srini@kernel.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcm2290.dtsi | 38 +++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
index 7303aff33814f256a2ea09a71a640db466370eff..a378bd01099633db49051a87d0b0f06e07c3ed2c 100644
--- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
@@ -19,6 +19,7 @@
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,apr.h>
 #include <dt-bindings/sound/qcom,q6asm.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -673,6 +674,43 @@ data-pins {
 			};
 		};
 
+		lpass_tlmm: pinctrl@a7c0000 {
+			compatible = "qcom,qcm2290-lpass-lpi-pinctrl",
+				     "qcom,sm6115-lpass-lpi-pinctrl";
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
+			lpi_i2s2_active: lpi-i2s2-active-state {
+				sck-pins {
+					pins = "gpio10";
+					function = "i2s2_clk";
+					bias-disable;
+					drive-strength = <8>;
+				};
+
+				ws-pins {
+					pins = "gpio11";
+					function = "i2s2_ws";
+					bias-disable;
+					drive-strength = <8>;
+				};
+
+				data-pins {
+					pins = "gpio12";
+					function = "i2s2_data";
+					bias-disable;
+					drive-strength = <8>;
+				};
+			};
+		};
+
 		gcc: clock-controller@1400000 {
 			compatible = "qcom,gcc-qcm2290";
 			reg = <0x0 0x01400000 0x0 0x1f0000>;

-- 
2.47.3


