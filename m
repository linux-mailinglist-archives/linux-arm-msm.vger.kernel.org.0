Return-Path: <linux-arm-msm+bounces-79504-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C15FC1BF75
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 17:12:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7D8F85C63F7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 15:42:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 989E534AB04;
	Wed, 29 Oct 2025 15:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sYgTanQb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133AB346E7E
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 15:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761752475; cv=none; b=ezuNlOEq8sWKNqb6JVvR3Xu+gDc6eb5TFgYMttp/dZTNAJ82lZj5p9EbFU60j6Qzbm7uLS0yosZDfaiGCWT4cV1WyrxPoqGznM7XesDiFU93gP1R7qT/QTgskmwdITjGT4sCA0HDyvHC2tRaSFmd+KcjqE2eWregICRPmeFKHnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761752475; c=relaxed/simple;
	bh=zsAEyeg1jfIl+cCh/2Hdx2ueebnP7hIfBxaXs2Ojz8A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SzrUmltWNB5Q9isRKbZRHJtMF0S+NK/DlVZuOq4v2A/ZAButjK2bVnfsmYH4FlyCNdQSItiXZpi0MP4phbqMN1ND8nZnvafgaEWapeewQ456K8P3uNyyD6wjzhJB5Ls4lUo86oikp5OXcXg7uqr0Fuq7P56p8VMXXzGnzO/Nr3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sYgTanQb; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-472cbd003feso5739175e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 08:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761752467; x=1762357267; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gdb0lDefddMt0D6PbK/m2suv0ruD4zoj8//MvUeYLmY=;
        b=sYgTanQb0O9W05ljH+kp63iPy9w9PTZcBTP4uo+QRsr5llLFeW17xnxyEEKjfYNUp2
         kFiHJg7cbbrNT8C11NYvtAem9IVrgzek1C9/aUf6EjLwE5F30lGdfDCTh21hv4s4Veuu
         VYO+GjUiSsNrWmCEYytFowWx3ZX0C26yd7+pBHN1OXehmXXY11ELTW64V8oUKXijuj3h
         AeRxa36uAwjHB8YDHkL17mLcY4ruOyhUizLIm+apzDV+Sev3cZ72sF6mz90rsuVSocwx
         MSdBgKuSOinM94cZGncoywVQcFEwvoyMK9lahLW3nkY/llxblu/iHZC7haXpYP10XrbM
         9asA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761752467; x=1762357267;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gdb0lDefddMt0D6PbK/m2suv0ruD4zoj8//MvUeYLmY=;
        b=KqEJdhy+ILtLx7LM9WAsexUfZQiFPEmKaCcUzBgFO1fYD2XT1X2wdNGtcdaclglk5J
         Vv0nilPrEAoc3P75U7iKYaKZbWfyYrR1/Lhfj3UJjSngzTtPHFhx8zGcsnWYCMqYdHM3
         +H1V6VD/vlAjGbXVw016Tt+NZIEY0dN00uDMvQJOybP4X1JDMVh85yIOFNs0bG10X6A8
         kh1pmrs+S/m4r/53AD/k23ZCEbLsorKRcQCnqnv3qFWwt8WepD3egghmDSFP0JeOUx5n
         oTHRyLBx81A0we4sKA852ujIKtAOxDY6rtvK9bpMciXvLaxQ46vcTt7+8zustZ0J9B2S
         81+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXjwnjpjgQX2Ye0pg+rBr6ls54HGGGUaJlmjjPGWb5K+fCdBHgit9e3qZPIVfAXkuPobkKtfNRZwjGY5aJA@vger.kernel.org
X-Gm-Message-State: AOJu0YwjqMZQkvBOsAIcWNBrwsPA0uxAQn+Mngs4QQC8PiRY/YONKbGd
	FvJ9sWhsiA/ndPZX6l5l5bSMX400ljoKAr2lZxS2WQj9IG4w7W+rPBITaDcdfleLIbA=
X-Gm-Gg: ASbGncvUJx7aCw4JXJenSV6QXLwJGNFNbPJqeOaj22PnX5YjAGKit+NYD1XJDis90Gk
	xr0QxeOxCqv6rWCgilUvqYt0+0rfT8uIZJE0NgQqKJmaResbBq4ttI5a9FTvfV56MDKzF+xjgTd
	B5DdYujSPzLUgpsmhxcPHUFRszsvLREMHPi3zdhSCr/FIf9DhxDme2k+ieFnwr7R3APFea+QHzP
	fete3FCz22ttJ4STCZ3yykPrIrISpbwC75lzQ3VbfWyalpqs6ptAV8odwGaQ/ERT8QqKelumQ5+
	ehQoOXVzyk4Rki5oa+oOHPZOPKvY+Cyro/78qB9iTYaYbxotThNpIZfaZeiY3mCBdDyg7mdH0oJ
	zFarCCvRA2C235rTa3ATJU+nJt8CIEgs8hJUQHBCdkgTNnKJw6naqSV+Mabx2OIVt/vlBIGb2Q3
	UEYeHoXgu+otHbXPelOXIHbKJAT5M=
X-Google-Smtp-Source: AGHT+IE8hNgr9g8e2Zz0yvPQFvK8mKgX9oJBviH/t6Vo3EOFrgHFwxbAGI5abfNG6aNB+j6GsgJgNA==
X-Received: by 2002:a05:600c:350a:b0:471:1387:377e with SMTP id 5b1f17b1804b1-4771e1e6562mr18386975e9.6.1761752466984;
        Wed, 29 Oct 2025 08:41:06 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952df5c9sm27006875f8f.41.2025.10.29.08.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 08:41:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 29 Oct 2025 16:40:44 +0100
Subject: [PATCH 7/9] dt-bindings: PCI: qcom,pcie-sm8450: Add missing
 required power-domains
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-dt-bindings-pci-qcom-fixes-power-domains-v1-7-da7ac2c477f4@linaro.org>
References: <20251029-dt-bindings-pci-qcom-fixes-power-domains-v1-0-da7ac2c477f4@linaro.org>
In-Reply-To: <20251029-dt-bindings-pci-qcom-fixes-power-domains-v1-0-da7ac2c477f4@linaro.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Abel Vesa <abel.vesa@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1043;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=zsAEyeg1jfIl+cCh/2Hdx2ueebnP7hIfBxaXs2Ojz8A=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpAjWEW+5vYbpfp62UH0yalwogiktQKoiAHGCvH
 Xo2NZoy2E2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaQI1hAAKCRDBN2bmhouD
 12tDD/4l8m/Ma4c4hJyxOkubd2iAXysfbP7ZYBqxa12otAQnR6OYqMP6wketKWzaIzSnbjzI/6X
 fwi4G2WilW0GpfX46aHnp+xub7mN+yori+DEGnbwE+M/3UH+wMTuDrHzXOcF9YXRS5qVrF9vw72
 1ue5JLxnJjPvp3mTlGR4bdrivkuVhhuVUtFCD+pZguoDS1/XZ0NjaRjBto1twK1GtvYEnDc+DK+
 uIzrsK/MlDyt69t+SDyF1z9lzOxpY3/yy9b2CvrAcnCoVcJV8NzAdBYSD9EDntajru799aWiufM
 FhxIR998gm1bdDZ4dedeUM1Y2z1lVk9QZG765mZNa1An9mGI7EUVzn1lOr159Xul/VNs9L/RkuH
 fPAWfWtRfRKd6H/6eUETB0VYEScpV7YMY6pltJFg/RdcI4Whns8yIX0OIncjOE9H7agF9WsfxBa
 c2I94hGuA2fZBSHTLE3417OOQzQe3sKMGKXJ9txOxzt9uaqyb4sF5RiavCKVyTfE1wX2ohL0SkY
 V9Q93aV1Wcx9M6fJIvn7w4fn++rvwQO0dTG4DsNQoE2aD6ZCQAxg07wZ+Mdf0QkoOdkd7NXc+JZ
 r7q39Ie7i4vS6czsVt41uv2znoJ7az4Qd9be0xIVPTR/EvJ4bUzpgwUz2DOrJehckLIMngw99r/
 fOBTkYuCg8HZHkA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Commit 88c9b3af4e31 ("dt-bindings: PCI: qcom,pcie-sm8450: Move SM8450 to
dedicated schema") move the device schema to separate file, but it
missed a "if:not:...then:" clause in the original binding which was
requiring power-domains for this particular chip.

Cc: <stable@vger.kernel.org>
Fixes: 88c9b3af4e31 ("dt-bindings: PCI: qcom,pcie-sm8450: Move SM8450 to dedicated schema")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/pci/qcom,pcie-sm8450.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-sm8450.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-sm8450.yaml
index 6e0a6d8f0ed0..20c764717800 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie-sm8450.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-sm8450.yaml
@@ -77,6 +77,9 @@ properties:
     items:
       - const: pci
 
+required:
+  - power-domains
+
 allOf:
   - $ref: qcom,pcie-common.yaml#
 

-- 
2.48.1


