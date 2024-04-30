Return-Path: <linux-arm-msm+bounces-18873-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E82F8B6A42
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Apr 2024 08:14:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC8691F23BE0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Apr 2024 06:14:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E1A2199D9;
	Tue, 30 Apr 2024 06:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R8nGO2hQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D5818EB8
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Apr 2024 06:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714457641; cv=none; b=AQ3e+6mFmFZKlfTVHh1Frw82mQUckpG5OrhcVm2ClIoBzG2EY24fsDt386cSEXRNOpGPAxyo1gMclmC4/l3kxCDzomUX8SbhOhtJXSIi+OsdOWcthnsvH9DphZiVMOPkrbEHxxXUaTAXUo2UWMHHcLvy1IaTGXXNRS3Q/YkRZIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714457641; c=relaxed/simple;
	bh=jt1D2ByjrZn+3+b2hbWiJrAvnVxKB+ZADxZB6BY649I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DmlqTTdliYrAUmh9gn2DC5gnUXFar+geQFGelRYQABrQYkojhnNdfJq7/+y8XhCwreCc1kJW4CvDV7uiV0J0wH/W8G6HmT6eitb8voaS1xh/qYuTjQQ6u5lHdSl1w4gCm+64/zEllaBSBBFaIr6BOtXoTa3ixigBv3+XiYRLmXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R8nGO2hQ; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6eff9dc1821so4990982b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Apr 2024 23:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714457639; x=1715062439; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wXh9sF7R3fzAgfyMkAPr9tJsPtu8XJez/oIKM/eXa7g=;
        b=R8nGO2hQFErTYN1HJ1ExPKNtnSmJ1DRfz5XfAbofqxErMW7pIsM+sNwc2m5PnNHgIs
         u6SPbnNFtkAcjj8YXbStJZr/2wLIYESrPrbetxVLwthCwDuMl6b4N/X4bePRpFTlivCy
         hE4u8bjKf19ouUV44V3+F9OFFx3fYL2Kl6UUnmh0Vax0GXdC0i5cm42QhnzSxeKPMtI1
         uQ7FovKPAg3JPRrBFm71tr5siAboC+/ibG6XBq1/DXsg9cBiPW6s8Axb7PfrVSJjXktG
         60/GBwO98qfi/p/xc30viW5TsaKwpUfBIzDeQQOL9qYLs8Q5XIpYIPqX8TqkgK+KvK8b
         IBFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714457639; x=1715062439;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wXh9sF7R3fzAgfyMkAPr9tJsPtu8XJez/oIKM/eXa7g=;
        b=TqSJtPFnXJCuINHZQ4tNcSZGdholq353sum6PLFQkg+TKvTyRuO3qpS4kZb1TuugiZ
         TixI3lClcD98sp/dxKShWaS0zM+FhdGuP8Ses5D58kqSniIo2iiEht3R9bK8xM5r2uxg
         U3nuOcogta79GgxpAHc7QHHo7QXQoiZ4Xv2CUPlG8qKTKNMXAnaJ06IW1IN9Zy0dOkHG
         43wU662Ls6nDGxVDy9BkujCRjPjN8NbRCfYLyuzFgmcTpAzyuHnFvGB34znd0UH99aWk
         AxV3KJGkOA2aiGdARHEYuE3/VWvaKHc9vUNJ+PhPv1guLW7rTSEeYYJIbd2pCSH+7jG/
         JEKg==
X-Forwarded-Encrypted: i=1; AJvYcCVKQO3uNWIJyGNY386phTziYV6nopMRk5A19rqwY9TuxkyGBRmF26F5yzAI9q51DJHiD9neIq2MUctDVJVjoVhcSSUf4J4QvSv9r1y06g==
X-Gm-Message-State: AOJu0YxmZ0Q59fi4GFNpf3AiPmb3Ad7Z0SSwA4rruARXFGLZVj1qctcY
	cpIeAXeWb/RKCGVSsI+bEXMYQj4MD/PedBL9J1gRpOSk0aHpXa76q++kYzodCbKQzsBtJRgJVr4
	=
X-Google-Smtp-Source: AGHT+IERNIpcVXnSkXOmcaImsK+5bkppIPbBwq2zMma4pGcKZ6IuGe+V26L0xyysFM6Tlh3EGcEAVw==
X-Received: by 2002:a05:6a21:8801:b0:1ae:42f0:dd40 with SMTP id ta1-20020a056a21880100b001ae42f0dd40mr11483048pzc.10.1714457638098;
        Mon, 29 Apr 2024 23:13:58 -0700 (PDT)
Received: from [127.0.1.1] ([220.158.156.15])
        by smtp.gmail.com with ESMTPSA id bi2-20020a170902bf0200b001e27ad5199csm21393298plb.281.2024.04.29.23.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 23:13:57 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Tue, 30 Apr 2024 11:43:42 +0530
Subject: [PATCH v4 01/10] PCI: qcom-ep: Disable resources unconditionally
 during PERST# assert
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240430-pci-epf-rework-v4-1-22832d0d456f@linaro.org>
References: <20240430-pci-epf-rework-v4-0-22832d0d456f@linaro.org>
In-Reply-To: <20240430-pci-epf-rework-v4-0-22832d0d456f@linaro.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mhi@lists.linux.dev, 
 linux-tegra@vger.kernel.org, Niklas Cassel <cassel@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1435;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=jt1D2ByjrZn+3+b2hbWiJrAvnVxKB+ZADxZB6BY649I=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBmMIway5+22p+3zzxNye4e9nY6gatrHr6KQJdEi
 xojXepGaKCJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZjCMGgAKCRBVnxHm/pHO
 9exSCACQpshGLWqd2q2FIap/b/j21N7ezIygTykNAuBoxRvI52wZ7AgL4XAc7ehW7jUy7ug5Yj4
 TTAr9ibRkE5YNpUxp2kwf08BbNC5DRpcuZCIQYpK1rXSXrQBmDkotbUlhyVLxbe7jiQJsXxMetC
 K/WGd+ng5BS8AmHl2eEkY4QMivJbKBKS5edIIKZ16T2pxXe3vyIonISkA1AIwtlpGT9MU6mu4cf
 6VlwgFmFLZqzZ6M1H1FFyVRFfLDUMRbDmW65qFy07zxaptW12SOqb3qt3wiknS/pnqHopJ90JYg
 TkFD1kWZCtArPpPV3V8m+m1BYaStbdLk91RodRTAtyF0wDmH
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

All EP specific resources are enabled during PERST# deassert. As a counter
operation, all resources should be disabled during PERST# assert. There is
no point in skipping that if the link was not enabled.

This will also result in enablement of the resources twice if PERST# got
deasserted again. So remove the check from qcom_pcie_perst_assert() and
disable all the resources unconditionally.

Fixes: f55fee56a631 ("PCI: qcom-ep: Add Qualcomm PCIe Endpoint controller driver")
Reviewed-by: Niklas Cassel <cassel@kernel.org>
Tested-by: Niklas Cassel <cassel@kernel.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom-ep.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index 2fb8c15e7a91..50b1635e3cbb 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -500,12 +500,6 @@ static int qcom_pcie_perst_deassert(struct dw_pcie *pci)
 static void qcom_pcie_perst_assert(struct dw_pcie *pci)
 {
 	struct qcom_pcie_ep *pcie_ep = to_pcie_ep(pci);
-	struct device *dev = pci->dev;
-
-	if (pcie_ep->link_status == QCOM_PCIE_EP_LINK_DISABLED) {
-		dev_dbg(dev, "Link is already disabled\n");
-		return;
-	}
 
 	dw_pcie_ep_cleanup(&pci->ep);
 	qcom_pcie_disable_resources(pcie_ep);

-- 
2.25.1


