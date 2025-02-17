Return-Path: <linux-arm-msm+bounces-48265-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0E6A38BAC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 19:56:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 39EE01659A1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 18:56:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EFC62376E4;
	Mon, 17 Feb 2025 18:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PcJWsTxU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C13237160
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 18:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739818588; cv=none; b=jSdZtnTu8oRFtTz7znNiRoKVFRWTYkwvB8KTM/LC/EPQlUmYaQ8QiP+xKRb13CuxpGzKvpwOp1GEiwUJkj+e5mOwBNnMfPSBrpwsI0g/FvyD/3ciEnytIe3iysSlu9neOrM0DqTRdOQDiWqNHSin3Au1QmZTeqYFZZgsOQW2g2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739818588; c=relaxed/simple;
	bh=l4JKzQ7pT7dVKATcLHSyA8F/AwMI6R5uxNc1u1FYr2M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uQ0JnQ8/ZQp5SmRY1l0I/Qs4611ejzBwAIXEshciKz0XSQJ+1LlSFeuRY9Voxb+sgc6TeAW10YB04rirVaUg8ZTecRQ3TIBRhHJ1T4HoZx1Ka9NNDSfc2IWrP1x7c+UBwVcK9YlzrA5eWezvnYKXMW3+NaDLSq+WU6aOiPDmEUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PcJWsTxU; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54605bfcc72so2129338e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 10:56:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739818584; x=1740423384; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bz6BpF1sTUoyQbskCCw4iC8Ct5cQ1B/7naF3psgq1HQ=;
        b=PcJWsTxU8Es1qVasq2OOyladhhPSu1JpWD9a3TCQCfmj7NxZYWJiOl/Mkiaxh6dgBX
         cyA8p0b/8gJ8tCn7wTzAZBoptUMg3BKo+2weG9oA4ZlKgqB+x+tAMQDHxVSGYI11dUr/
         D1qZ4rtIUYfMO99TFyuCbV9buoneAfwMDIrvo/BiTYIKEWvZ9APM7xSiyfNlg481OR7+
         4tPv0/bDVImoJliFJ6XMYsXJEQcvJzggcJU3f+bk+lGuW7hoMaw7Vi6uNidqbxDgyRqM
         /MXlRY4ipZlXbTtlrNAq+PnumGzdl0Ljxs7LOQpLN8VkXLrP5IcKwt0V+MLbV7/iYvsz
         0Gvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739818584; x=1740423384;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bz6BpF1sTUoyQbskCCw4iC8Ct5cQ1B/7naF3psgq1HQ=;
        b=DXrZmIVWMGnIN1lsk2Dn9xy/yzqJTYFjyd2cc7QCw3dgnBuXFKtCICptRedjgZMQm0
         a/CxFEGihvDs3dU8jAMXIKlG+h9zt45oiKZ8uWDcMI/3vK9liyO4Y+LqeayWyp/eoIEN
         ZPcL2MwXV8qmaBQb1VvQkCfwgfuo0UBzXKCLMrwM0rpE+RGPgzdQ25X402bIcmK59prb
         EoJ4kf4OSsHjZUeUVDF5IWGe16Kl09fOkZ0CEYC8CTjgANo3OJaUBK5o8RZ8E8vZvd2q
         t8x+0A9LzA4dPAhyE7W+8GHrdrP1SrCkZ0VvhF6kORQKYqLJANH3jwRS8cC6734sZdgW
         CkKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYaEGT5A7+d4HlQ3RfvA3oIAYTBwdKCTKdE91qB+rdA/SnFyEbN6kbaIrv3PH/SqCjK5A7jHNsNAZYsCbN@vger.kernel.org
X-Gm-Message-State: AOJu0YzhyZSv/FsrD7pTpg+1xwcjYpWW+Nci3zmCtD1iawvwvFM561Jj
	d0/bZvml+w7IZZzeYkaYaJWT2sv21iB7Q2AYV2wUOzPp7d2+MBUG8Vs9zSMG9r8=
X-Gm-Gg: ASbGncuh9ZLedg2KVLRaH/edFJ5cw50g+kZn9lOH3Mo/DE8JjcKEc/GIXUAoAYPFlir
	eO39tURUmJQo9xAeSB/tGIO9y2jRiDb0ApwgVdAgooKHk6EhFie2erGq1yMH39SdzdR1kU2iqR6
	F+eSF2DxpujFMN8Zn/5A4rUpFhZu3h+WiiCOYaDBIc15jzkrxQkJniSAA/LcWWGatfQ67a/M4Ui
	Rb0Y+5nfDqIKiK20BCYh2Z713V2o+O6NOvnn5M4Y4MPkA30NoINs8srp8dZCCiFK+YqBMpxzPbF
	coLc+mdXNzc+YC4Ty+tyoTUmQxxnTfw1UYn9HKZELhmJBRJO684Kf4PcvZY=
X-Google-Smtp-Source: AGHT+IHN2v198izquScuzTQDg28XFm7jz6L4NWpqzntJBOiAYfiwQ5drbWExIGyigAAFAUDYzPn9lw==
X-Received: by 2002:a05:6512:3b8d:b0:545:2e8a:941c with SMTP id 2adb3069b0e04-54530362603mr3406655e87.24.1739818584199;
        Mon, 17 Feb 2025 10:56:24 -0800 (PST)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00--782.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::782])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5462006b0ecsm559806e87.160.2025.02.17.10.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 10:56:22 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 17 Feb 2025 20:56:14 +0200
Subject: [PATCH 2/6] dt-bindings: PCI: qcom-ep: enable DMA for SM8450
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-sar2130p-pci-v1-2-94b20ec70a14@linaro.org>
References: <20250217-sar2130p-pci-v1-0-94b20ec70a14@linaro.org>
In-Reply-To: <20250217-sar2130p-pci-v1-0-94b20ec70a14@linaro.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Mrinmay Sarkar <quic_msarkar@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1524;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=l4JKzQ7pT7dVKATcLHSyA8F/AwMI6R5uxNc1u1FYr2M=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBns4ZPWq89hJ26Q/eFUKUe1IK+q3E5JsH6r76PA
 2E+VX3413+JAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZ7OGTwAKCRAU23LtvoBl
 uOhHEAC2NdE9o/AGIi7osGKgLOcKSpXu1swFXSoUf2bzkz3MuEImLUcfqu0tE6eRU6ljFDsBq1+
 ML86ZgpBM6Aev9ZUVEM119lGLwb0S3xWNVOmx6N7DOnf23viSZ+txgggjd7F4wg6MClkdfrEK0G
 f6sIOgMLYx/g7T5oNXdrUxjPee1qW1Jjq6xb4F9N2LM3uGJKxNTUAp0vjAasJcSw8gIv2iedGEK
 2XWly4PX7Kdxd/mYhmQTcQKMUz8JJnoNtCktjxZhRHLFeNqNkYG+3faKxt9DgOgacwE43QEyoSE
 ieh/MHGmU0T6xwzr6jus4bM/sjQcHWdz3QLbyHo2wZTDvwAfCpy9tXRXMFVy+UHUqR6iFpVqGvM
 YQT5ZfuKqeNj6D/kmzOmzSK6oz7isEB0FrpeaehmDcJyry4+5vQO+kDoy84P7ZLRlCSdwdH6qb2
 /ZogTYfFE6PxN5JhRsUmcTjDD8G1SX8JckKo/yEeXtsiuiPNpB5ZL5jMcc3+nG5YXaYCC7irCfp
 O3NEpH57Sr3z8PdvL5NieSXpapmgtZUJXbLmIyj/OqB8TxI/cNzTVfLNNRsd6FCe0kdfVszPR88
 qeQWMtdT50en+Q1+y8G1fBLxZXdVPHnlKRnzOxehfX6axmqdM6nIzRWO8MB6/M0yILPmB/VephT
 aOULzSgydXDrqwA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Qualcomm SM8450 platform can (and should) be using DMA for the PCIe EP
transfers. Extend the MMIO regions and interrupts in order to acommodate
for the DMA resources. Upstream DT doesn't provide support for the EP
mode of the PCIe controller, so while this is an ABI break, it doesn't
break any of the supported platforms.

Fixes: 63e445b746aa ("dt-bindings: PCI: qcom-ep: Add support for SM8450 SoC")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
index 800accdf5947e7178ad80f0759cf53111be1a814..460191fc4ff1b64206bce89e15ce38e59c112ba6 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
@@ -173,9 +173,9 @@ allOf:
     then:
       properties:
         reg:
-          maxItems: 6
+          maxItems: 7
         reg-names:
-          maxItems: 6
+          maxItems: 7
         clocks:
           items:
             - description: PCIe Auxiliary clock
@@ -197,9 +197,9 @@ allOf:
             - const: ddrss_sf_tbu
             - const: aggre_noc_axi
         interrupts:
-          maxItems: 2
+          maxItems: 3
         interrupt-names:
-          maxItems: 2
+          maxItems: 3
 
   - if:
       properties:

-- 
2.39.5


