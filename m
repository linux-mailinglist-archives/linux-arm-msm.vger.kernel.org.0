Return-Path: <linux-arm-msm+bounces-42055-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 037539F0FEA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 15:58:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 55CF3188A0E4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 14:57:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A2B51F03EC;
	Fri, 13 Dec 2024 14:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vOxuW5yH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD601EF0AD
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 14:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734101689; cv=none; b=l86n0FOy6Gj3jJWX8C0XiLS55FT9FX8XzindWt9XJLeFtPh9DY3MaJkuY2gfGXYLm48vVMDx/ObnUMd0QBlTayVztMYIROKIB8YssIk1p08wyNJrV48+LdrH2+l+4wKBFWxlinE7PSFu6D5h+YXaxKjJ2xKL1HSDM9D6JxK2es4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734101689; c=relaxed/simple;
	bh=7SBFgAew8JfeR0zbJ6uTquGaPm6FhiIBi50wes+3zko=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e6XJsQivw1F+cLAPuS+y6PJXcAvM2oPXCY5pPuwxxgi2bvZjnNjvCyuPIZX+BMTuwCqKF+s4JP6lciznZJ0Uw4+ZnQis0RU4AT0DBl9+yJk/mmCWvp5B8OgClMCGVaZa07zTYc327jautXR8g+1YGFPk9rVO/U5Ui8p7YNHj2zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vOxuW5yH; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4361e82e3c3so2344825e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 06:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734101686; x=1734706486; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HSOiaotFjrdX9Uak/7nrtVBsDX7lzAoKWyjlpUSUNaw=;
        b=vOxuW5yH0/eoZIx5s/IXFX3mSXGBIinUYjR4NWTwgc2zC4chZotQKuxnffG8M3wHco
         HE4G3ihFLz6uV6lCH91BIVnHB8PXTl05UwdZ55timPLoPLJqisC8vPy9dyjdLAukFFqL
         GXefX6TQqsKYWkeKbAWGM0Suu3/kFE/3cPoBt0Vu8x3S2Xg4y5n2vC/SWpw9x5sFUBVY
         t1xKMpVk4zzivDW3ibYI9h4JHwWixR58tXENcQ2PevHKbcF6CjQ3OLWPtbHOck2WuLq8
         DQ15vnn7RWXkhx+vh9Kg3n3pIXzq2PThVwdOl5u0RYEWbYrMkspZcVYobwVhejvWfScL
         VTjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734101686; x=1734706486;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HSOiaotFjrdX9Uak/7nrtVBsDX7lzAoKWyjlpUSUNaw=;
        b=KW9At1+xcF71NacIm9a5u4XJJap0R6RqLJoKEsBzMvuAPpm9zac1mGn/i2m1DVO0mo
         AN5vwodh9ndRRVVUwvc7djKiBF38YLAUpnpUo7UbRULWRMF4OGcEC3dAuQX2jOmtGfS5
         oLHAjyxbEPzK5xbcCBd5DVgeqLj2qWvOqTSB4Tv33ghoFlYPoGT9+qHPeNPSjwsX+J2o
         F/coaP4pebkyntrdQ388x0o3nRY7fH9z0aaeDRqyts6k6iCu8aHws8p35WH19agJ7nWz
         gEMwEK3EmV1hiOhhExlGwpGD4yvxQlTJca3n6tCC6nmierJDG/spmhX7hMYibrdlWSrE
         q6pQ==
X-Gm-Message-State: AOJu0YxE1HtczeU/57wuxUn0zTeKR/r1/fwjrMC7CaYEFnLdOObFqb/C
	GQoyeF8YYu06bkDScB+Uq8w5IR+TDWYLEk9Q/whEeQGAQasB0pkHWZMInuxjJRs=
X-Gm-Gg: ASbGncvZwp/+yTSsL7ZVhJwbFLNKbzxhXnsKnptWoAMIRRcSQIp7jnUf/BfvdP8bb8q
	yrHLPPmaZeFYXmcIWITS97g/lvCYit53Yyoku/Pob0EO3f9Bts3anEzWMQh3iSLUf0AXdseD0Xg
	M8Jpd+Om6z/Zys0Mb4vJrsp8PZNJfh9tGxQO/3fkNcA5q/Th22epWO4mnihIEWw+hR1p3K8zZDO
	IjjFh3R/BgdcNn+IPDqehwkyykCAMQ6rU1FI/A3zfNJ3q9/Mw/7jRCHc1JNyb7THsss99uV
X-Google-Smtp-Source: AGHT+IFUnK6Q/rSKuh82gn3vZeXSl3vtocbMSbcEhsEHsBmXL7Xg/qPzTgSvKurGo0EV0I8TTlUvYg==
X-Received: by 2002:a05:600c:1c1c:b0:42c:aeee:e603 with SMTP id 5b1f17b1804b1-4362aab2452mr9266575e9.7.1734101685647;
        Fri, 13 Dec 2024 06:54:45 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436256b42c8sm51547305e9.29.2024.12.13.06.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 06:54:45 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 13 Dec 2024 15:54:03 +0100
Subject: [PATCH v3 14/23] arm64: dts: qcom: x1e80100: Fix CDSP memory
 length
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241213-dts-qcom-cdsp-mpss-base-address-v3-14-2e0036fccd8d@linaro.org>
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
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1378;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=7SBFgAew8JfeR0zbJ6uTquGaPm6FhiIBi50wes+3zko=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnXEqTc6MupIsUbVqu6cpho/rtJp6UhXjtyEeLU
 Hppw3W6wDOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ1xKkwAKCRDBN2bmhouD
 16lcD/0ezsAvVP5icQ1Ipg/Vj3u7cNr2ELf2mNmXElqjuR85AOdEjoGbcQhzjN5rzd2vD46MPtI
 /iWE1VTve0GPB2BfhqsRBMBARAc65fdpHdlVTcRVeIc2DL4CTjv485ue+xNVJj+aFnFsWCogP/G
 cU3O29oJH5xuuhZZSLmGN+/ZlalJBGuTlbTrp8YFmSWV60GOQwgFU5dQQAzNs5Cu7VBLq/G9wn2
 bGIH6RDa5sKhNWiNANaCBv1L/zPY+iQB1YGd1h+qxowYe4/UEYF9D+z0scmJ19D66E+g+Jx9ORU
 /9mjHttbqHcDiSbNMXhuuyM/ORLyHremhPm6e6ZHPvzMW90EEc5lZcQi5yoHgrhTPFgHWSQj7vD
 n4BR52laLeiTL/dlNIszAryWpPISiVOhkqSwpO8u6TiX6Gg07cL8fGkLAeROoFcnav33VGAjAko
 3YUUt+HL8Cma2BolnQuJLXKfvrLdQ3hmiL36SAAIZeEi1UXKdjKyxCxuxU69GDfF9/5OHGxKSYc
 srLFpWO5pgaHEUzUzK5T+/PsCgmtknRiLLRLGV4rWESsxMnLibibLig5LrU3RhFgz8o9zVP8KoB
 0/R4evTxIF6VNtUqCaiAU4FaaHqeK6ETOihjXGz33VUOKWW8UwxyT5Fgzo/nFjh2SNk+4MdoeeH
 8+x9jeOd00lEsEg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

The address space in CDSP PAS (Peripheral Authentication Service)
remoteproc node should point to the QDSP PUB address space
(QDSP6...SS_PUB) which has a length of 0x10000.  Value of 0x1400000 was
copied from older DTS, but it does not look accurate at all.

This should have no functional impact on Linux users, because PAS loader
does not use this address space at all.

Fixes: 5f2a9cd4b104 ("arm64: dts: qcom: x1e80100: Add ADSP/CDSP remoteproc nodes")
Cc: stable@vger.kernel.org
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 9df6903b5d59aadda26d9e0d4d9f951c5c3add7b..bc2187700ead2f368172040b23e1343cf0895012 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -6458,7 +6458,7 @@ system-cache-controller@25000000 {
 
 		remoteproc_cdsp: remoteproc@32300000 {
 			compatible = "qcom,x1e80100-cdsp-pas";
-			reg = <0 0x32300000 0 0x1400000>;
+			reg = <0x0 0x32300000 0x0 0x10000>;
 
 			interrupts-extended = <&intc GIC_SPI 578 IRQ_TYPE_EDGE_RISING>,
 					      <&smp2p_cdsp_in 0 IRQ_TYPE_EDGE_RISING>,

-- 
2.43.0


