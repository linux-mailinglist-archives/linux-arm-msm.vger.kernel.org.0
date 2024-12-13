Return-Path: <linux-arm-msm+bounces-42046-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9824A9F0FC3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 15:55:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 30059165CA4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 14:55:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AE101E3DE6;
	Fri, 13 Dec 2024 14:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ylw7Rjbw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB27D1E3785
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 14:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734101674; cv=none; b=RD9oPzcLFeW7cZlqJ9/42/yugiQWupCniOPRBQMAKk7MNtdyQv0LZ0tAEnE1koEwIZdn1jcb4GvnIUCBrKRxlVDbxjhNqt3IayNFJhKr5Gbov+GNfofDzarJ4NapTJxFzqi0LniBc3KQAGp2/hInOP4wfC7Ye/SkPwUitxKvPL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734101674; c=relaxed/simple;
	bh=XAEiKnCO1r1d3Rt38gaJyxFTDUYuD0/ITOVOdeMu+YQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ChvFuqdNm/93fCoAB/ugF6J0l6+AxOUjMZG95x8w6JzT1olDzlss1PmCWp9HZWNRYp2fdZ3ZgOXY2yN1p/KIcj5ptGC8TdPTjWZblRmMJQ9HpdqKPjtjomtGIGWiRHz+svEepe1V6rsUQFOTRFQGtnoqYzhVRHJdkcNRkaKhBO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ylw7Rjbw; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-38625aa01b3so137374f8f.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 06:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734101671; x=1734706471; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dIBR65NQgnFdG5+Wr1oGSIxsxM3LOWc73QgneL07cmA=;
        b=ylw7RjbwXsMSBJhyEXGcagRiUClaPZafXfwAXzBcdyCy9jgVKW39T1kS+/3deyV9u4
         hXk0jzkEMstX4lE8taxQj+3Nudp2AakYQtxBoB2PtHNF22dPzRl8M5pyhsbRPI7LJD3n
         OJMniH9qEkIASiLZpGt3hqEHwKgH3Qhol/FiQj6fVCYGZ4D+I4pjcMTwivLv1n+0I4uy
         hIlLiAS792bH4N7FNOhWW6mceO8+hEvH9Rz9R+/cirsp4r55MOY/6yGERSQBCQWEm1yz
         1whUOTV3RQB4UctPm84gYpktfVxu0S0uTPS/NceYydEEt1smtYP7twDPutQnygilvOtt
         JlyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734101671; x=1734706471;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dIBR65NQgnFdG5+Wr1oGSIxsxM3LOWc73QgneL07cmA=;
        b=QhsGoYDVlP9D/UCBQK7a7QTtbKp41eDpQkw9BvhO5MwHaDRS6ecD/8A6uQnKCKf4Zh
         ZhFNPBd1zjUgBGxx13cSeEmPrJJugIbjAtUeg+HmWKRx2yrGVHm9tRZTYd0siZIxofcZ
         1EqLi7S8l9m1MNHnyeTXD2RpauEFMDBixgQhTPfespzuamJ5RNbQsrJBslLu0C2ACjo+
         vQjuO1QdJYcL+SwmvAhRkzj6IlVQMf4z/JAXUkatOFnAq6Nm+MSQwo27Q45UfPlgugsP
         /MgYu9F+VXIgpnSBdw0xQcD/mpRdVGHv8oCC2pYjMpE7uCMzKo34TwdRfVJmgewcimde
         avTw==
X-Gm-Message-State: AOJu0YyQ2Q2gBwsG47vJ70Ieu3xCRCeeNX3j6JhmX6fZVernWE3wFZEP
	KUf953MyT8xvGYAgX9ajlaFZWKEYRs2N079d7bbUPNAtEsaxW7fArDuHfMBW76c=
X-Gm-Gg: ASbGncs4B0k7Mj5ECgpxJXs5Ul17Oh8JKu1UxUIx2LmN9g9hVPmfVjOX6CXK+FqH0yI
	bG1EMWhgH/GkUOhQsUsvpwqTshTcj3jJtUvbMfCQIvPcqxs8sk0QazGqUiCJmBb2JqX2BklrK7Y
	zfQhGm2UfnHd9VZaSVWpEigVpICb9aZkJ3KYvaiaD3M2v5+CpcB6vXM/NElJgviDfu5BsDcJO0k
	OWqz2y4rCYRJGkiqsul5SWW99xdb0L9PBryDhZ2jD7DUi9sls89HmreRB9d6Zp13DpoSr+K
X-Google-Smtp-Source: AGHT+IHig/JnTEFFGqixtBJKsYK9tuq4eWeEObvfR7ChV+V/m684qCQ0Tl99jvlECfUXk+EL/mj/Uw==
X-Received: by 2002:a5d:584d:0:b0:385:e16b:72be with SMTP id ffacd0b85a97d-3888e0c249fmr818317f8f.14.1734101671068;
        Fri, 13 Dec 2024 06:54:31 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436256b42c8sm51547305e9.29.2024.12.13.06.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 06:54:30 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 13 Dec 2024 15:53:54 +0100
Subject: [PATCH v3 05/23] arm64: dts: qcom: sm8450: Fix CDSP memory length
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241213-dts-qcom-cdsp-mpss-base-address-v3-5-2e0036fccd8d@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1353;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=XAEiKnCO1r1d3Rt38gaJyxFTDUYuD0/ITOVOdeMu+YQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnXEqL3xeYOLNicK9EC7/9JLiByvtqRj/A2wQBD
 gN/amAddceJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ1xKiwAKCRDBN2bmhouD
 19jWD/sEtxJfvFz9eFBBGyIZtF84DnLjW1GCAwAvWBR+hwCrGxPPopgWCRIv8NeCKADocBeAMfg
 tRSdJ25Tsj8u40wAexGIIhry+00VWwHPzvg+ajD/xH2/wmbE6HXq4q3f0eHxet++PfkGBYlXOEi
 v64zVsqZ6QQdiKgDLQ/M2xg0yW0yuc/b3fwIG4N7Cljf/0PFDtf/lXx5K4KWb7HThvLmezU2vT4
 GAiURYUNGSJKxALudq8GbAqKB4h+Eet2GnrAekf5hpTen6Ang2ejUjMf1qsnT/AvGhvBUTah9p3
 +HlEeR5bOItwS3n4vqS3dfBhNebhB6ydzLE06YNJqEBY+bFzBrMmHXsaFwHjmqWdjEtu7DpIWf0
 ufDjhj0UE4dZOLSdbqKlIrLzDvkPTmm+vfezocf8E8+NfW8V1m3NWCmy662bUJ76v7/RhtWIpSg
 d8jhxG6NDj2ABTLvwpjbfHgWRV8ljUCZy2JWqE3iU6o6HjgDiPEW5IwvInq4ubZT8ywdUNoIMAG
 m07Ol6kbtL8AgFCIflhi6Jznt97e0vzqwbaSWB0JwKdXPXz4i31Sx1NLikgzDJEpbTjFPREneM6
 xPjt1DytON0XYDjPKX12jZGNScoHllffoe8e8LCh1/894I3Cz5ZDa+zQon6Ja6CB6lmWFNtkBGk
 K+qT68eBTRuaacw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

The address space in CDSP PAS (Peripheral Authentication Service)
remoteproc node should point to the QDSP PUB address space
(QDSP6...SS_PUB) which has a length of 0x10000.  Value of 0x1400000 was
copied from older DTS, but it does not look accurate at all.

This should have no functional impact on Linux users, because PAS loader
does not use this address space at all.

Fixes: 1172729576fb ("arm64: dts: qcom: sm8450: Add remoteproc enablers and instances")
Cc: stable@vger.kernel.org
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index d028079c11bdc2dd2b254f7f7d85e315a86f79bc..7a3bf847b0b9eae2094b0a8f48f6900a31b28ae4 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -2800,7 +2800,7 @@ vamacro: codec@33f0000 {
 
 		remoteproc_cdsp: remoteproc@32300000 {
 			compatible = "qcom,sm8450-cdsp-pas";
-			reg = <0 0x32300000 0 0x1400000>;
+			reg = <0 0x32300000 0 0x10000>;
 
 			interrupts-extended = <&intc GIC_SPI 578 IRQ_TYPE_EDGE_RISING>,
 					      <&smp2p_cdsp_in 0 IRQ_TYPE_EDGE_RISING>,

-- 
2.43.0


