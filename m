Return-Path: <linux-arm-msm+bounces-18876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A29418B6A4D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Apr 2024 08:15:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D69D281C44
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Apr 2024 06:15:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31C563A1DE;
	Tue, 30 Apr 2024 06:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cjiTqXdD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC89938DD2
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Apr 2024 06:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714457655; cv=none; b=LEXegwuuU0w+ADPqZsA2IBv8AppH50NowUanBBmxX8/eb0vGx86mZaJ0U8xDMjhC62K3CwbaGSKaLU1YpP34HM3kCf/fYFqxKI3o5a+awsik5oxT/b7KAjPk+fbDxnp1M7famx3P7v8HBlQrGP+L1blQ/i5/78oGn9DEgWtXKrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714457655; c=relaxed/simple;
	bh=oU2zGIiFPGVtB03/PgwQpbKi9Fuvq0u/dW2DrTTfPTI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ez4C29qaVzeEN+xNFM4Zf2RmXAkux4vYVpdkYb4xK1GPBOeQOrHpdIKD6YQOjEj8xg3b7z1UdBJMg0Tb27Z9AVMEuWoZuAphiJ0+nd+YWKpzUB4JOPp8GAuFyizctscc9nU2HbqA2HA06yKWZAaL3JD4y7iVGUYmmCC11DaHvIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cjiTqXdD; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1e5715a9ebdso44032675ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Apr 2024 23:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714457653; x=1715062453; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Qc41MgSnlAlN8GJf3G4R2xizfhgFiDGpk5F5rdug0A=;
        b=cjiTqXdDbSzsWLOXe77ce6Hr+J/NLLFN5gthcLEUuKTw2xq6vZI4Mi/WAh/GvK1V3m
         VzpGJy5cdWLlmRrVDEDSEwstN0FtxwZ/gQKqgkP2BgeOJd8YVV71UQUSgC/Or037pQ0i
         n7kxDe8gD7hUy+Y7xPI8NZkvFIHtJNLDt/1PMlB4PvGAfSnPXcVxgM/qvlDQouiZogTl
         h1XZgrEZI8z9cHC3+AFgpWTJtdGZJQ3NsJfhfOfMEKDPoY2Z/GswhlXHax8MdTJ0y+iz
         Tn63gA/V1k9z/26Dvtk1LRGaVXshWvw3hX5zbSf4bAHjR5qaW6O+Ke3UN7qbOxkTDyXp
         mEcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714457653; x=1715062453;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Qc41MgSnlAlN8GJf3G4R2xizfhgFiDGpk5F5rdug0A=;
        b=qIe0qiKCq3ls0oXnGRu1wLMYugx632vIyzbzf2AAgEz5jFdy5m5Qaom5kfvJZcNozd
         cA7foZenGLaSZa+iN9v+nUa2yVOk1NLoAWXIjy5fH6NN5QWPcbInW0JWVgMPbQM5BZP+
         qlGlHqv/mLCW7w19ta9lvKLor7jT7Q53+93erqr28KK+B6aMGgi8WSl1Ue8eY0D4qxkp
         NsbT0tmjN4X+y/32quxj6JTL69GnxX3uFSAfMcIy2Iz4vlaWNsXjT1ngNfhWsmN9xiiJ
         TjmrsBhPsXjubxBbMtTLNIyh404VUElg72sSIBD9KV3ZjmIdSW6GIVGtncPCLp58O9hD
         L+kA==
X-Forwarded-Encrypted: i=1; AJvYcCUBNI5ljxNaMux7SSMa7YpzHuQa66yN/c8Uf4ilQNvhdPxlqlXwdtZOA6Zwc7No6UQTbvratJWvXhvK1BOjdLrrtLHOuqmc1FTxOCpQWg==
X-Gm-Message-State: AOJu0YyjFrZBW4tAHR71Bzc5upfeP7kd70e9UzB+U4B8Dl9bBaxsSoNd
	PWTtRJnfoN6AMqSnMyLjYucIF1Pma9FGayecPpg6qkBvyIQmCfm/+9YM6gGWMQ==
X-Google-Smtp-Source: AGHT+IGNkX2KfxzpxFsv4vcjdwa2UrLryt0PGxLjlOXFlzKdYsy1WviVaOAyHt9CqF0GaAoMsDzcrA==
X-Received: by 2002:a17:903:187:b0:1e5:a3b2:4ba3 with SMTP id z7-20020a170903018700b001e5a3b24ba3mr12980354plg.56.1714457651066;
        Mon, 29 Apr 2024 23:14:11 -0700 (PDT)
Received: from [127.0.1.1] ([220.158.156.15])
        by smtp.gmail.com with ESMTPSA id bi2-20020a170902bf0200b001e27ad5199csm21393298plb.281.2024.04.29.23.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 23:14:10 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Tue, 30 Apr 2024 11:43:45 +0530
Subject: [PATCH v4 04/10] PCI: qcom-ep: Drop 'Link is enabled' from the
 debug message for BME event
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240430-pci-epf-rework-v4-4-22832d0d456f@linaro.org>
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
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Bjorn Helgaas <helgaas@kernel.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1225;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=oU2zGIiFPGVtB03/PgwQpbKi9Fuvq0u/dW2DrTTfPTI=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBmMIwbP0YCI/ZYbaovtlyprT7opKsvmn8IdjyRm
 Gd98arawG2JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZjCMGwAKCRBVnxHm/pHO
 9cLrCACdN3F3bQBncs69QWwIB672VV3E8QT3cBx36vDSp1/ifbMIuD1IqNptAyGEI6yC41YlbpF
 AtEuJX4ci9QQIIyb24g19PTJSGngnOf8T4cga/axBbd9T7wI0J3m4ZUDrXZFcmSMXLapLPvTVbt
 CN74D4CJTVnfDr3PD7Idq1PVKo+fULpbNDfKyMvABx+OTDTuNa2F/9UX4fPZf3cYJefXAgB8ZFM
 pGIalE/c1KTZIJoToV2F+LJRRdFa8q5f/QAmRu/xocXjuMJMrRDkN9REGPMcW26WNw718J9n6e7
 QuU4d1BW9lFmsOxeAlHfZ6HNL78eDwD3eZ/ivim0xuxIjYjD
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

Bus Master Enable (BME) event that is generated by the Qcom PCIe EP
controller due to host setting the Bus Master Enable bit in the Command
register doesn't have anything to do with the PCIe link.

Hence, drop the bogus statement.

Suggested-by: Bjorn Helgaas <helgaas@kernel.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom-ep.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index f6e925d434f6..dcac177b55fb 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -636,7 +636,7 @@ static irqreturn_t qcom_pcie_ep_global_irq_thread(int irq, void *data)
 		pcie_ep->link_status = QCOM_PCIE_EP_LINK_DOWN;
 		pci_epc_linkdown(pci->ep.epc);
 	} else if (FIELD_GET(PARF_INT_ALL_BME, status)) {
-		dev_dbg(dev, "Received Bus Master Enable event. Link is enabled!\n");
+		dev_dbg(dev, "Received Bus Master Enable event\n");
 		pcie_ep->link_status = QCOM_PCIE_EP_LINK_ENABLED;
 		qcom_pcie_ep_icc_update(pcie_ep);
 		pci_epc_bus_master_enable_notify(pci->ep.epc);

-- 
2.25.1


