Return-Path: <linux-arm-msm+bounces-57218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E4DAAF45D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 09:11:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C6221BA876D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 07:11:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AA3E22172E;
	Thu,  8 May 2025 07:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TZugPGOn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF1421D599
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 May 2025 07:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746688241; cv=none; b=Ru/+oUNRdPysxs/D3x308Lo7LOoCaYJ6IG1xjjjckGjrxmMDU0EdwCyBoQihkMQtHHeMDHkZyk+mupowK9cd6LaaHLQ30UifzmCitN9im/MC3x5nfHpiEyvtLNoCFPpS5/iVMIM6TMtm/plegB0UXDFlyMB0FIp/0yzNAVFUA8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746688241; c=relaxed/simple;
	bh=DxjgbttCz+WbWbTBQh3uh5PZxc6tk82mAeHt4QTMKaE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gbWw7ImrELs2WxNwxfDSc4kXFxTq+pD+I3y3DgB60cL+o/6rdATYsKKXpIVFYfoQGLjR8L+KHhrSpXTTusP3sKwIYtVq0Dhp5cUYYzhrYyEBOyFY8b6RbEx7Jiz8Op7YzDwq/Z0EshQzJ+bhJzpwhTa0ShIaz2cgfg5u30/9fEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TZugPGOn; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so6662375e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 May 2025 00:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746688237; x=1747293037; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z2xdDt4RdWfJikzYadK7Wm2Dj/LeNHY+o4TedGbXhPE=;
        b=TZugPGOnAnizTz7qkXkQGx3EpoBd+ZlQRTwhHexL/wf/YDJkBZi30eD7DJP353jows
         +unNSGkhyxsntZ2vAbJuF3Y89HZgyjrmkMPTY7GH6Vkbsbnoggh0aCK+jYBj+0zojwB3
         +S3tnp4VoJvh7VEn7+0zoFC4U8oH3feZVbWI4tsSYHo/C8uki3XFvoX/ZJlSk0hykgXK
         afn70pzSJZcE7FS0cPl95q79TuX6JvpbydvWG2yKGhNrAarV2Js1tRzORyOtolPzpvhO
         YNQg4AhuDAdw13FWfuRbC6JfIkJIMs0ng24eeDC287Q99tOY9mEwkOHL3fmeCh7uYTKR
         /ptQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746688237; x=1747293037;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z2xdDt4RdWfJikzYadK7Wm2Dj/LeNHY+o4TedGbXhPE=;
        b=Q35ANh+Zo+n0ZkLZ5XJVXeOtnltKu6+KuM2BS0QPAJ3o1CopEEWKUO2yHGCaWyfOnb
         jb+b0NBuLxLN7C0HPO9IOQ6A+t6ulp5Q0SFadTpTPoIcEL2h4SFJa+ZWJEAIzsOjQYvo
         LFWROAkZhdKerOKXgAt3HsWGHnITOOVjk50Bkr+WSDHFlm3I141RrbGweCKLNxYuY2BX
         nWAfmC0CrOIV9ue7Bkui1vF2KhexfajbTaW6dij/x+f7yNlFIeyeXXGvhNngVysmKKqc
         IFy651vyXJL6yiuEwdZ5m6b9lZZc/OgQNZWooyGvx7mgtnukHoYvzXKh7/nk0aTaca+J
         LjIA==
X-Forwarded-Encrypted: i=1; AJvYcCUAsDQ3Ta+OeFvHNZnsdgVf/NdJGgb845mMgozPOhQMaUYatjtB/HvcNVxIcpcGWcu65XUn0rdxT4FMoANX@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6lvpMVAUB4h0V0dubqugZ6q9WePJ4rNyE5PoG+/Y7kJiif652
	M8GiXudO7iKErAx09lleGWrXLrl7dcSYxoGgWwP4PkiO1QhiyHH4Wb4UR64UcQ==
X-Gm-Gg: ASbGncspZElKMQkC3MAK/bItLtdX0lvjcU5Xa6PvlxPFeWzmA9q+w8WuFtK98WoWb//
	dVUPWR09ZM18gDhckKcIUgZZb+XRtZzIpSVPz9d2ETDltfDnoZZN3PgQUfiqIhxcg+huiXxvQL+
	jLqBF7Sy03QHfBli/nuLUhzbQ9j28BNE9W71PnbYqRA6iTAWq8KhxcEI87Z+dU6HVUeqZQoKtCP
	0k/nWt9D8QyX29hVpmnpWUX3fAE0EA/U2ydAu4ZtuphK2LuPx1kpxKF4n0h56essmK8T3nGp+3q
	h47zBqIXEZexVqxKrvC+y2OQzyraKfNR8aCYFaN+Kad7SB3TQiIH76O2ge/PHIJh1RS6KdTzFGo
	1Tp7kVI9PHq8dKuzicCE7EBOHH+MLBks1RaZDXA==
X-Google-Smtp-Source: AGHT+IFU6Tfiix8kiA6qL1KyPENFK6H5A0dQpfBujyLXJD3m07n9Que2XUBEh0Jtu1ubwVrnoTFrSw==
X-Received: by 2002:a05:600c:3d9b:b0:43c:f629:66f3 with SMTP id 5b1f17b1804b1-442d02f421emr16664105e9.18.1746688237328;
        Thu, 08 May 2025 00:10:37 -0700 (PDT)
Received: from [127.0.1.1] (cust-east-par-46-193-69-61.cust.wifirst.net. [46.193.69.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b178absm19500236f8f.97.2025.05.08.00.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 00:10:36 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Thu, 08 May 2025 12:40:31 +0530
Subject: [PATCH v4 2/5] PCI/ERR: Add support for resetting the slots in a
 platform specific way
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250508-pcie-reset-slot-v4-2-7050093e2b50@linaro.org>
References: <20250508-pcie-reset-slot-v4-0-7050093e2b50@linaro.org>
In-Reply-To: <20250508-pcie-reset-slot-v4-0-7050093e2b50@linaro.org>
To: Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
 Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Zhou Wang <wangzhou1@hisilicon.com>, 
 Will Deacon <will@kernel.org>, Robert Richter <rric@kernel.org>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Marc Zyngier <maz@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>
Cc: dingwei@marvell.com, cassel@kernel.org, Lukas Wunner <lukas@wunner.de>, 
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
 linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2766;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=DxjgbttCz+WbWbTBQh3uh5PZxc6tk82mAeHt4QTMKaE=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBoHFjpfv/vQkWgyV/Hq0GucliJi+U/7FE1Skrvp
 pJ+nrHeneGJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaBxY6QAKCRBVnxHm/pHO
 9UI+CACk0xFNBFRLakdLLAf9Ya1C7nW/+a/VQ4SxfviZzgiZSwQ3wAKQ1nn3pFJTctodOrYHrYt
 L3jspau7qSV/E69KaX8cHFBStVMmk8Ey9z4rzTqwgNJTiZu1osrkc0SiKydSeqMot1pRreGsKhv
 w6jmJPaJL6AL5/Wc44rKPtCqMktlSapMC4oZdAwUzr+ZolkNNdqp3Ptf12CclgABbIy0YDvrotC
 GnquyUFgI1V0jIOUvvcsv/n1eLtFUktxnxLDS83usEfAJ1WpRavyboLRCrmQ1K00Gvk58fZaWkN
 /w9ORtH6GykTqjVpzegZfHZz6+OjWKawa8B4PrmHhI29wJoR
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

Some host bridge devices require resetting the slots in a platform specific
way to recover them from error conditions such as Fatal AER errors, Link
Down etc... So introduce pci_host_bridge::reset_slot callback and call it
from pcibios_reset_secondary_bus() if available.

The 'reset_slot' callback is responsible for resetting the given slot
referenced by the 'pci_dev' pointer in a platform specific way and bring it
back to the working state if possible. If any error occurs during the slot
reset operation, relevant errno should be returned.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/pci.c      | 12 ++++++++++++
 drivers/pci/pcie/err.c |  5 -----
 include/linux/pci.h    |  1 +
 3 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 4d7c9f64ea24ec754a135a2585c99489cfa641a9..13709bb898a967968540826a2b7ee8ade6b7e082 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -4982,7 +4982,19 @@ void pci_reset_secondary_bus(struct pci_dev *dev)
 
 void __weak pcibios_reset_secondary_bus(struct pci_dev *dev)
 {
+	struct pci_host_bridge *host = pci_find_host_bridge(dev->bus);
+	int ret;
+
+	if (host->reset_slot) {
+		ret = host->reset_slot(host, dev);
+		if (ret)
+			pci_err(dev, "failed to reset slot: %d\n", ret);
+
+		return;
+	}
+
 	pci_reset_secondary_bus(dev);
+
 }
 
 /**
diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
index de6381c690f5c21f00021cdc7bde8d93a5c7db52..b834fc0d705938540d3d7d3d8739770c09fe7cf1 100644
--- a/drivers/pci/pcie/err.c
+++ b/drivers/pci/pcie/err.c
@@ -234,11 +234,6 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
 	}
 
 	if (status == PCI_ERS_RESULT_NEED_RESET) {
-		/*
-		 * TODO: Should call platform-specific
-		 * functions to reset slot before calling
-		 * drivers' slot_reset callbacks?
-		 */
 		status = PCI_ERS_RESULT_RECOVERED;
 		pci_dbg(bridge, "broadcast slot_reset message\n");
 		pci_walk_bridge(bridge, report_slot_reset, &status);
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 0e8e3fd77e96713054388bdc82f439e51023c1bf..8d7d2a49b76cf64b4218b179cec495e0d69ddf6f 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -599,6 +599,7 @@ struct pci_host_bridge {
 	void (*release_fn)(struct pci_host_bridge *);
 	int (*enable_device)(struct pci_host_bridge *bridge, struct pci_dev *dev);
 	void (*disable_device)(struct pci_host_bridge *bridge, struct pci_dev *dev);
+	int (*reset_slot)(struct pci_host_bridge *bridge, struct pci_dev *dev);
 	void		*release_data;
 	unsigned int	ignore_reset_delay:1;	/* For entire hierarchy */
 	unsigned int	no_ext_tags:1;		/* No Extended Tags */

-- 
2.43.0


