Return-Path: <linux-arm-msm+bounces-41019-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C059E9189
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 12:07:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 146FB281C68
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 11:07:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64EAE224882;
	Mon,  9 Dec 2024 11:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D69ceDVl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C3F2236F6
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Dec 2024 11:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733742182; cv=none; b=Ane3bTQcRsGGJyajcecUCbk52s/ha8RsB57RQFG9RMWTHWgq84nLsEWiRqc7NdPzPRzGAj5hoxOg5hZryqVzs4ai2R0XJkxq2BFtZ27vVuhY98SLXa5/WgxloyJCgE+czdqVuUNsTlO8lY/hZZIbEbSiy0mAYKBZ6AolcmCznG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733742182; c=relaxed/simple;
	bh=KNZAbjmVONlwWaLzG4pKciOZsI12f8QX5famGIgKN4s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pE2kXctdFOqngXYybQMqB8bBgJbXQhYroDU+xwYb7lgj4pQODrr06zW9VEgVR8/eZ59QVaFqLBL8h/CY8YhUqrrbsTI4GncV2di+FmghFLFWaexfq9sie1GB/anRXe1qKmItHrGtheFDOP+vMJVVkZ/a8HICFkRfooZ9gNNpQEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D69ceDVl; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-aa551d5dd72so76836966b.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Dec 2024 03:02:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733742177; x=1734346977; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QAaVRwVOSTNlQl4wGWGQTJ+u4VaoEY9iNcXW/N9EBYU=;
        b=D69ceDVlrj0Hb2usuqW+BgelxANFJZBKe26UFx8jxdrcy4dJ/j7OhxU9t/S0iU5jz7
         v1cYM95ex96WsrrZiYKTRFO9J4rlZFkz6UbcA6kV9ic0hYmCtUmTBweKIcicX1VMZwdK
         qNerzb5ocRI12H2Inr4QK0KaLwbow0k8X8yQ0OeO0U0vD62/PBEH/2kFTd6JyfGepNml
         iHKpIfQPycTjGmIK6doKM/VFcYB6NgnCVXrV8794l+IAN889XeJtcDzrCFM1RQuv3b8X
         VQPdxJL2Dvbax4yZRZjDpH/iBR+jacA0S6jpoeFHenBd7yFrvBYbCNqoEgtDYO3Wputz
         y2iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733742177; x=1734346977;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QAaVRwVOSTNlQl4wGWGQTJ+u4VaoEY9iNcXW/N9EBYU=;
        b=rwFf6WgrnAxAEWfaZQ1+4rSVQThE1AIRPwB5xChZSkH8FQh2KdefndhRWLsTgdI0dZ
         vcvklnm3NUyTlA61A1f74YlUqJNe/WCYFqZ0U5ZD9JqREqk1Eqi/Hjh3URvMl51jDBIk
         o833/vGs+84by9ZIGsH1SIvzK89DcvfXn04XLjeKmagwn/kFSJvvVO7sB1k/IBStxIXb
         l12wtersQlFqIvcdP7kW9j93RNvATQY0tFvcnViDIRCpz2kbOkEjxtoRxqdA+KGbr6gc
         ncednUD+jWo1Mi8AEUqB9TWG/NmHOXt8vYJOf/War/zY094sXsMHGYcZ39WGdDIiWwyT
         b+mQ==
X-Gm-Message-State: AOJu0YwnLI75uq/iftXadycrpCnpgBKRJnTEqYi8GFCS+bghZY6eloq2
	BmTByUX2O31kz7mbwhvgwmuHZqvUcZqYT44wOJNLspjnoDjuinVCc9oTNuFJGkg=
X-Gm-Gg: ASbGncvh7iOYIqXi8H+wWPGfWoyU7y5mJ0xfJuWCnCHMiEKwN/UisL1i/pyxslOrNtm
	dbx4CVrLzDF9EGhc2DHOvO8srcdRMSXzqW1Q9BhY/5YYH4HHKdF/8XJ2vDp+Gdvs/qe+b+zHrik
	JKMnCTmFuGMzxNcZqYe0rSBrhDSSpXuWa/542+hbHwv1DkE9bNw1NcSLq7UTxFbgBHra0wdfAme
	p7P5flj9sdL0aAoORPLh13UgSQ5n4uuPOGZfgBovtbPKoRZG8Pz4gykmtWtNoCg6YoMxw==
X-Google-Smtp-Source: AGHT+IFsh0IW4nVrVem66RNZuyFbrM3YfAFlvCILgj28pLdq3AkrGuyNbqWT9+sMesCAjx85bwbB+w==
X-Received: by 2002:a05:6402:849:b0:5cf:ca6e:400d with SMTP id 4fb4d7f45d1cf-5d3be69a983mr4023479a12.3.1733742177555;
        Mon, 09 Dec 2024 03:02:57 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3dd4f641bsm3348818a12.51.2024.12.09.03.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 03:02:57 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 09 Dec 2024 12:02:21 +0100
Subject: [PATCH v2 16/19] arm64: dts: qcom: sm6350: Fix MPSS memory length
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241209-dts-qcom-cdsp-mpss-base-address-v2-16-d85a3bd5cced@linaro.org>
References: <20241209-dts-qcom-cdsp-mpss-base-address-v2-0-d85a3bd5cced@linaro.org>
In-Reply-To: <20241209-dts-qcom-cdsp-mpss-base-address-v2-0-d85a3bd5cced@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1249;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=KNZAbjmVONlwWaLzG4pKciOZsI12f8QX5famGIgKN4s=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnVs4+BohC3aei1nVmhWl5xl8DDIChkIexXA1wx
 sWvfaQ4HB2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ1bOPgAKCRDBN2bmhouD
 1/50D/4ribLsjmgHdAPHMj+++vUUCZGI385wfyv6nbt13SqwY0Kwp+WqcC6R/1H7Ez/LCdhLN/9
 aAASrCx3ezkzMG68dTDi+b4MDW7XeWa8H5v7U07TO2li6xWLAUUVopfIGIVIlBn72Eaz+eeogzP
 nRgzRVzGt04OLDOYyE3orpGpr5/r+0Cl1YeHPhDC/el6Y8wBp1ETXXu+z5uVS4CsFnXcNkFNH81
 XsW7+XEXo1pC10klyML9bmawd5xz3PNNH2GqVeVIGzIUbRDbpA7XwzI9Ro8+GMWv2DKyLQUjE88
 uS+VrNFbcAHLIOMqM7K61Ix7Xvnq0ob5dcTYM+aqz06os8QhIumGPdd3Ajegz3cGO/tHCpcnzqy
 IKSh/40NA68pgB6XC/pxzMlRcNaFWawkktkVX8hbW3TnsMpWnQ+yYAHg6V9FXRcBChPCj0FQxCU
 qSMOwzgUfal+qQqIUxTCERNDg2OUW1rF4NWInaqEmTCd8m+awhuz+lpLmf2RVSMaDU9K8ArA6MX
 0S5dgH6Bs8K+R4pQzd7NjT9e30DM/wBa69EOAulQEXoggBEfTTDIYH4lcPxWj9yyqDvmEgvJOax
 278y/YbypFscvzP04/Mq/YGu7/huS8cKh0KmQ77Aadollgwse1mryLpotlEFJjbuLZ3W3R+y5kG
 b0NIR+FfDg+KIXg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

The address space in MPSS/Modem PAS (Peripheral Authentication Service)
remoteproc node should point to the QDSP PUB address space
(QDSP6...SS_PUB) which has a length of 0x10000.  Value of 0x4040 was
copied from older DTS, but it grew since then.

This should have no functional impact on Linux users, because PAS loader
does not use this address space at all.

Cc: stable@vger.kernel.org
Tested-by: Luca Weiss <luca.weiss@fairphone.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 3df506c2745ea27f956ef7d7a4b5fbaf6285c428..64b9602c912c970b49f57e7f2b3d557c44717d38 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -1503,7 +1503,7 @@ gpucc: clock-controller@3d90000 {
 
 		mpss: remoteproc@4080000 {
 			compatible = "qcom,sm6350-mpss-pas";
-			reg = <0x0 0x04080000 0x0 0x4040>;
+			reg = <0x0 0x04080000 0x0 0x10000>;
 
 			interrupts-extended = <&intc GIC_SPI 136 IRQ_TYPE_EDGE_RISING>,
 					      <&modem_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,

-- 
2.43.0


