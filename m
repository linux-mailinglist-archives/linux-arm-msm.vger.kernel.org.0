Return-Path: <linux-arm-msm+bounces-42058-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE729F1001
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 15:59:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 722131886AEE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 14:58:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F62F1F2395;
	Fri, 13 Dec 2024 14:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qrzUf7pG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00A41F12F2
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 14:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734101694; cv=none; b=rjkdhNhDKlaUJZBaukSF7bU3qZO0Too7vJlOwuComvZ5GwRolVfGZCSwsMmuJ8Nw08cmFFGoIZJ6OxpernqT2FAU+6SAXPdMmExqG0F1B5/NLSE9E+8lUmWIObBV8SruszLMi/yXM6r2fOiGu7wALGGOwC0ynWKFASNLD7j1vXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734101694; c=relaxed/simple;
	bh=kkscAfqjZ1iO8Mt1cf8ePp07BRkZZiJewMrsa6+GGrY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S+EyAC1y/V05VXPnJQfU+GBOfzxEMGxrF5R3aNKpGb8DjyBth2IU9GqWw0xWmZvrtlGmbEUfMLvRHGbDfiAnfl92Tu2tqWq90UYsz5yDFedbepkN/IA8QK8DfJ1japRk277XFobbJ3SQJVD1jroA12l3o8EEAeKkvKw1/EEU6DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qrzUf7pG; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-436203f1203so1856905e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 06:54:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734101690; x=1734706490; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6BnGnc4auB4BfoL4yYa22p83zP4f8oOwWvOviDPs2/c=;
        b=qrzUf7pGmrNiRBWY38wzM9w2VTKc+fbSjGB3hEgdvmfPdmY8kr2J+otV6dVY89A5sf
         r9FhUmqcQ2e/5zs193zzOJmAeV8513Nw0N1+9mNgTdFkK8T87CG1sMFCodOZ4ESoAKrt
         HYA+hk2hgR98qsJyRDds9Ldz+vD85oxftB2X/kKtRdL8MS9tqr4zshsQXDRMr8ni6009
         4nm03gAVYM5sRknJDwuMm+rZB7FXalPNCJ+Itzy9CEsf+KB8UbfOIoHFfBdph5tmxOrR
         iczS55S/GZ4amPvUT1Z31FSZVkgr4ScfDV+EKuFOB/Zi0RYvTYtTOy0XQnpAT2YUKslZ
         zZhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734101690; x=1734706490;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6BnGnc4auB4BfoL4yYa22p83zP4f8oOwWvOviDPs2/c=;
        b=rkkM85EFWr9QDlW0QOuT6jlgIfCpfIdrSJsfzKlTxXVjR3dQO5M5Hr3xNnqSsbOIFT
         CV2Qp1HuCF9WdCWqT61+Jzt0cc9myz0iG1WB90LEOFCsLmE9sOb1eq4v7XWLnf3U+aQs
         bBqwmznjPnkerum+uI4L9bcInWIhg2uFDCWyn+d0PdcmCmW9gKo696VcpGWEiwLWgo6u
         OhQkR9GLei4AWhmwHOROkJvzkZ4LK19ZTkaOsP2a0qJGgLwn4Anbf8fhgVrPG6wKig/Z
         KKK+wFQYajzNBXKzjWU1tU4g7d3jE6ZPr5xdDZof3ViJ3L/y3iJV9NxB0zNpgij54v8+
         wxTQ==
X-Gm-Message-State: AOJu0YyL9qsPA5cWTHRqId1GksnOJWYGHQhp6llFY8BY7cpFBHnrTXTa
	+WQ9/e6G7ohs0iNdAaoP/iEvfjuUDGIjxnNcvJw2Hdv1RYAQpBbfxbJgU/+xak4=
X-Gm-Gg: ASbGncv9WXD1jWaH2ugvdX5RL9qqYINBTHqB8RZHw1q/3ZIXenbYn6iZvG7dvgn0xcb
	1RXw4sa/CBxsdhTb+fuHpoU/OZyjdR3+Ar9A0bjG9YCH8nJs5H2ZkgM7IGpKjvITFnkwooyaQLE
	kxu8RPYo8Rh2k3YMolsWIxzhZvI5T/8/IxLyRxKb/LiPLU6NsaBxkVzec/isMS0hZm9MOsHzHwG
	m2VvULmJbOJoLzrBeH4b0HTZXNEeeY/tLjJzlUO0Il9WVJySFG1A0I7nc+lI1/6dr1ywbFu
X-Google-Smtp-Source: AGHT+IF1IC2mqCjLc2vv19TUx2Amo9ZuLxvxJ7yfXZ0E3xlXoptqi7L7F3KE6+ShGn85/Dtt1ZR2XA==
X-Received: by 2002:a05:600c:35c6:b0:434:a30b:5433 with SMTP id 5b1f17b1804b1-4362aa9f021mr9601625e9.5.1734101690392;
        Fri, 13 Dec 2024 06:54:50 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436256b42c8sm51547305e9.29.2024.12.13.06.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 06:54:49 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 13 Dec 2024 15:54:06 +0100
Subject: [PATCH RFT v3 17/23] arm64: dts: qcom: sm6375: Fix ADSP memory
 length
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241213-dts-qcom-cdsp-mpss-base-address-v3-17-2e0036fccd8d@linaro.org>
References: <20241213-dts-qcom-cdsp-mpss-base-address-v3-0-2e0036fccd8d@linaro.org>
In-Reply-To: <20241213-dts-qcom-cdsp-mpss-base-address-v3-0-2e0036fccd8d@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1182;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=kkscAfqjZ1iO8Mt1cf8ePp07BRkZZiJewMrsa6+GGrY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnXEqW2AezEFpOTTUwnTymsNPVg/tLeNbmVkA7h
 V7I9hzceWyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ1xKlgAKCRDBN2bmhouD
 19rdD/4u6ZehyIIUmESVu4qg25AgBZ4GArKdRsYDuvVfnk+UCEOgeiQ2QSBhi5W3Ky8spJfeu4A
 H1W8kIn+p/CQX1AuB1JMBIblDWn0TnvFwhEURJ+H2BMd1JfdPRTiPfFJp8UvNVezbXsisUcnx0n
 v93QSaFjEzUkp7YwOh2ENKfk4ijk06O4lX2nVHF1a4t9uIHXFBzVJ7pKnf3Cg5T2ZdGhBr2HZzf
 XoezfXE88WTH2mSZJX4FI5iC6ZUFdBprTlhxRC2BtbEISJWSw5Tb7O0gxacFAmnUlrkEIOQispd
 gpZ5Aeiv2INneCd6qq2eEjNZYClfK6Cuk1DfX8ZIWlYE5D1ZH3hDfFj/J5GBfF8ABoWKzrHEPxn
 clA832MJv0GWuzToy3N1bKk9J3KirF+u+YyXTyohCklcXgA6Ul8SubJ/bfOKMDUvuePke/OCBLp
 D+kLaMfHxVmzDZocooKfBnsrS1SSZfN20wsSWbTLlgTZgA2nKUqHVuX+CwD5XYOV/+sDmaR9GVj
 jXHhZBSJa/gLjjGD5qWHEbpdCgev2XCLNagZhNjqVR8XiusMN2y4OhU9FRlMIrvIyy6sHY1Z/E2
 4TkSqo0L7faw1n5O+tiTd7fLux4CUB163yAyA/jkh2t9V6VHOpiRja1vtl1FZWudWIwX5J/1wEd
 0xiEfXn4nAyaiNg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

The address space in ADSP (Peripheral Authentication Service) remoteproc
node should point to the QDSP PUB address space (QDSP6...SS_PUB) which
has a length of 0x10000.

This should have no functional impact on Linux users, because PAS loader
does not use this address space at all.

Fixes: fe6fd26aeddf ("arm64: dts: qcom: sm6375: Add ADSP&CDSP")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6375.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6375.dtsi b/arch/arm64/boot/dts/qcom/sm6375.dtsi
index e0b1c54e98c0e8d244b5f658eaee2af5001c3855..613319021238a1fec44660cd9740a980edeb3f10 100644
--- a/arch/arm64/boot/dts/qcom/sm6375.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6375.dtsi
@@ -1559,7 +1559,7 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 
 		remoteproc_adsp: remoteproc@a400000 {
 			compatible = "qcom,sm6375-adsp-pas";
-			reg = <0 0x0a400000 0 0x100>;
+			reg = <0 0x0a400000 0 0x10000>;
 
 			interrupts-extended = <&intc GIC_SPI 282 IRQ_TYPE_EDGE_RISING>,
 					      <&smp2p_adsp_in 0 IRQ_TYPE_EDGE_RISING>,

-- 
2.43.0


