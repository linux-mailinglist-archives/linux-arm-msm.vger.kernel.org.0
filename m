Return-Path: <linux-arm-msm+bounces-18878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E73AC8B6A57
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Apr 2024 08:15:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A370828230D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Apr 2024 06:15:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A1F54085A;
	Tue, 30 Apr 2024 06:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qLeoM8uP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71ABF3FE4B
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Apr 2024 06:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714457665; cv=none; b=TjSahcpVSr5SQKguY9h5BLhQCsA7fqL4Vk8sF24wXwXmLerXyNErgGf1iCO3aggN2yHcARzYkkfmyLxElGLNdg9vf01zWSt5p7hSqfwlmnGEiyUk3py7z6f4p5WgLj4CZ6hjwZhkjHLctWyKOAKki18nS0HHh38X5t2AY6Pj2V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714457665; c=relaxed/simple;
	bh=fxOFlEqrH8s0NmdUpIncfdRJDV9aXSUPg8/Z2JiONmY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u6Xyuj9cKAs9Hl0lGD9VQaPSAhO5ldfiIKMIts4Hcvn6nEdw4QJsT3yDsg8Gvxq8UdTNTB0WBORajZ0feslvAPY+KSDWvTz10Gqi+Tmb1mSKQCtUN2oN5SrDroikmkWXWdlN/ACW8vZ8tsxlRBuJca8TDi/2w1ahOsVIbg7ipi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qLeoM8uP; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1e2c725e234so48634705ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Apr 2024 23:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714457662; x=1715062462; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u+LhLTTRlVPNIxUlsbxDURUHk794oxoOs4EVupx50CU=;
        b=qLeoM8uPyOiDsWqFjisP7Uie+q4AFONp52NgKyyqj09AF/6JpeMmnT68S7ihhMSbo7
         qtSksCUi3b5O4LMzRuSW6A0V7neoapdmXLDfkDwgz2hPNPFpGyMNO/iogQ3k2oXjZkhV
         KlIQ4wk47f8ZLJGHiKDBztf/ZWAqBUD5cx5/vKwNRDMk7Y4T9Bus+7BysTWmJmV9tkzP
         rV66XggEyl19+VdS8OaIo4gU53AvF8qZndcjJQtoOg7xOzbmZWvc3H8U8kKw9swDhcT1
         xYZA7EHG2uSleR1j46o8S47G+NFsgDNFd/NMrf8QlZaz+lgysKT5o5oBrOCTN1es29CV
         AUHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714457662; x=1715062462;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u+LhLTTRlVPNIxUlsbxDURUHk794oxoOs4EVupx50CU=;
        b=qQlt5TkMl8Nt/EVDZvO31zUSET7a8wz6e/czaFtuNW44qw9OcfLjLOfQtZXE9K05G8
         BpQbNZzQ9iaKrbAZcmwo3HlzRKmX3B+bubI8kMSh5f3/XITN9f22NocNDbQZbXq+WKRU
         8cF+0cNqUqQRHIozpx81ye4bNYvJaLw3tBKPmZ9hLn3TnIUHzyy2kNhmbpkKA02s4UPD
         l4IuMZgkElp08PJl65o6fNHj8vRlZMPC0zBc5t/SkayN+32ebBxDG/01xMXQW6D5GCPW
         sMw1OzFDU9B1gb0av2cEjHvR4eNpcY9NCz0B4oGDNXKtWM8Vcm7qJzUrGMnOM44BHMwY
         OIDg==
X-Forwarded-Encrypted: i=1; AJvYcCXUf87jjvRDZljKwgeZsjkcqWS9GKcXejDsTrd277eAWQf73JZoANHy+ratX7KSs1Mppcd1g4JBUXcSwRJy12/JrEe+9T1uIpqGMWYO6Q==
X-Gm-Message-State: AOJu0YyIM/JAhQwslyALAP/vl1XTYQCj0Q4AI2zgSrdmh/oTOam4D/qc
	f1hlCjWlBSlPQr/xOhb+t9YLhJDxQ3gz9paCXGVEmnB8di2vICAdnSFz76s5aDHuQLTnsOYaX0A
	=
X-Google-Smtp-Source: AGHT+IFWlPaXe3kuXbbaQlVjvn0iudNPxNrJncJAz+KnsWqRTsjZxYwDlzmEsK2RjGwFICO+fhb75A==
X-Received: by 2002:a17:902:ee85:b0:1e4:3909:47e9 with SMTP id a5-20020a170902ee8500b001e4390947e9mr1978403pld.11.1714457661486;
        Mon, 29 Apr 2024 23:14:21 -0700 (PDT)
Received: from [127.0.1.1] ([220.158.156.15])
        by smtp.gmail.com with ESMTPSA id bi2-20020a170902bf0200b001e27ad5199csm21393298plb.281.2024.04.29.23.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 23:14:21 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Tue, 30 Apr 2024 11:43:47 +0530
Subject: [PATCH v4 06/10] PCI: endpoint: pci-epf-{mhi/test}: Move DMA
 initialization to EPC init callback
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240430-pci-epf-rework-v4-6-22832d0d456f@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2562;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=fxOFlEqrH8s0NmdUpIncfdRJDV9aXSUPg8/Z2JiONmY=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBmMIwck7CQqxzGBBs27ekqmsyQcFl5lEyaDCdB8
 8krlBTAf++JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZjCMHAAKCRBVnxHm/pHO
 9QUzCACfAYietdg49h4Io7A9JcQicHUuAGWxbqV4vUVXxeXJtCl6Miy+KCY5XHgGfOgjQtuZvXm
 zvS6jYckAS2N4pvESS0iQlIDy9luPOi0FObpSjpHGWDUabNNjqMIo9CBT+aJartV64WtMWkiwcU
 RGyqedqiMsrit5fYARIa+aBaDTHJaR72PchxxQCcybCBFi2VxP7VfFNzMfOZTyt+uS2FlVRqEe0
 2k1l9TA8KiH8iEx46IL1N6Fy9GsMuJg+yp0McCsDyhEZ2NutAjxigxr7iXRUe+Q0yQnEqHptit1
 go5SFswb1gMp4kr4mCLqpIsVNRVcgVrE/dsmada8hKq3phx3
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

To maintain uniformity across EPF drivers, let's move the DMA
initialization to EPC init callback. This will also allow us to deinit DMA
during PERST# assert in the further commits.

For EPC drivers without PERST#, DMA deinit will only happen during driver
unbind.

Reviewed-by: Niklas Cassel <cassel@kernel.org>
Tested-by: Niklas Cassel <cassel@kernel.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/endpoint/functions/pci-epf-mhi.c  | 16 ++++++++--------
 drivers/pci/endpoint/functions/pci-epf-test.c | 12 ++++++------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/pci/endpoint/functions/pci-epf-mhi.c b/drivers/pci/endpoint/functions/pci-epf-mhi.c
index b662905e2532..205c02953f25 100644
--- a/drivers/pci/endpoint/functions/pci-epf-mhi.c
+++ b/drivers/pci/endpoint/functions/pci-epf-mhi.c
@@ -753,6 +753,14 @@ static int pci_epf_mhi_epc_init(struct pci_epf *epf)
 	if (!epf_mhi->epc_features)
 		return -ENODATA;
 
+	if (info->flags & MHI_EPF_USE_DMA) {
+		ret = pci_epf_mhi_dma_init(epf_mhi);
+		if (ret) {
+			dev_err(dev, "Failed to initialize DMA: %d\n", ret);
+			return ret;
+		}
+	}
+
 	return 0;
 }
 
@@ -765,14 +773,6 @@ static int pci_epf_mhi_link_up(struct pci_epf *epf)
 	struct device *dev = &epf->dev;
 	int ret;
 
-	if (info->flags & MHI_EPF_USE_DMA) {
-		ret = pci_epf_mhi_dma_init(epf_mhi);
-		if (ret) {
-			dev_err(dev, "Failed to initialize DMA: %d\n", ret);
-			return ret;
-		}
-	}
-
 	mhi_cntrl->mmio = epf_mhi->mmio;
 	mhi_cntrl->irq = epf_mhi->irq;
 	mhi_cntrl->mru = info->mru;
diff --git a/drivers/pci/endpoint/functions/pci-epf-test.c b/drivers/pci/endpoint/functions/pci-epf-test.c
index 2430384f9a89..ab714108dfdb 100644
--- a/drivers/pci/endpoint/functions/pci-epf-test.c
+++ b/drivers/pci/endpoint/functions/pci-epf-test.c
@@ -739,6 +739,12 @@ static int pci_epf_test_epc_init(struct pci_epf *epf)
 	bool msi_capable = true;
 	int ret;
 
+	epf_test->dma_supported = true;
+
+	ret = pci_epf_test_init_dma_chan(epf_test);
+	if (ret)
+		epf_test->dma_supported = false;
+
 	epc_features = pci_epc_get_features(epc, epf->func_no, epf->vfunc_no);
 	if (epc_features) {
 		msix_capable = epc_features->msix_capable;
@@ -895,12 +901,6 @@ static int pci_epf_test_bind(struct pci_epf *epf)
 	if (ret)
 		return ret;
 
-	epf_test->dma_supported = true;
-
-	ret = pci_epf_test_init_dma_chan(epf_test);
-	if (ret)
-		epf_test->dma_supported = false;
-
 	return 0;
 }
 

-- 
2.25.1


