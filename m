Return-Path: <linux-arm-msm+bounces-15948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C8D893D54
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Apr 2024 17:52:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C8043B22112
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Apr 2024 15:52:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98E0351C4A;
	Mon,  1 Apr 2024 15:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wy82DoZu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F126F51016
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Apr 2024 15:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711986673; cv=none; b=NiIsIKRXP4a2TSjDYbhK9JgI2DW+wXkIVqPnLLU0V6guK2iz8QdQ2QVXlHK3bI5yX1zq84pFhDMb+ruvvc7l6UeLBm5smoChF1yZ7xUvY9R4evBHf2gB0sfs9009e2soDwvqzh6EAyNzSk4Gs3Gd4Fax9uXet1pW10kBk27vWkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711986673; c=relaxed/simple;
	bh=zRqM7O4QJ9QR9QAQtoYpWdK8RL4rvRClmGOwhFTCtKY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tscS6OgreW/kpQeSwHSCxVraMv4sk0oWOqQpCaxoH3WuDN7Ue+JImhpfcK949jWMw0wVZdx+/Eq/cwtbE9K2dciySwBao108k4MVc9jOWuwG8bZc1J28Nlz/WLTJbk/8VW0r6rilH5ZS6dAp+PL7A+utlfzDhDDtBLMN+IUqDqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wy82DoZu; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1e0f0398553so37213795ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Apr 2024 08:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711986671; x=1712591471; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wf5qp3kEMFhsDeZa+NERTddlDqgA0B9PoJGogDWVdDU=;
        b=wy82DoZu1rhH4ilu2uYsNkxp0uOOFpJ4Hk1zJ1cq2r/8qHxygfwdXJK1D3LDUcxuzs
         OtWI+14VSlwBqC9dTfxa0EAu/m7+Rc+UQCqLyHh2QpoODBXtbEwZB2jRwG9xGu5a3V/r
         2+5jjHK+JoU8ISgvkMl9cIgSjuYWJZVgppDQgqMOKSuZ7lM09bsXrQJ2MTwdMwxZnl+A
         ADhqCj13h3i0nUPgHrnYOpO8JNjsvDH4BpZNwyNrzH87ZkrfbkKwS8es329jArIxpvYi
         gHeYVrzRMk3hPYcXqiDTQu49HL4p6upYeCnJ8cbdWDGOd9vtKlplymLtznoMcqCtZwgb
         WB4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711986671; x=1712591471;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wf5qp3kEMFhsDeZa+NERTddlDqgA0B9PoJGogDWVdDU=;
        b=CCXczGwLTEqxPN0dNZE/yjx5E+AgdFKVAM6TVZeJpRJkTn9LjUQR9idUfN+NXQkD08
         EZN9Mm6dfPZLP/l/40+iVSb2cCq37rZ+4AXX7tCWOo9IA2Bha3vLz1A1A8oQtHyl3B/g
         zeb56sETcFuPCT8O9JaBGQp1726XSxtjbhs36u6v5wM82YhTMa/V60IRXs5TkBU0ud6r
         ywP3x95I/mg5pjbr2Fyto69E0KN1EExsv8/4cv2qgo0vFgTxheWNJQ7YQdJjjt9n7qcV
         wYstrRgRcbfHZ/LJ28V0EDM63rZHjTNkw5fJLGaYemqYIBw9j3CJr+NKps2bWxnIJH6o
         OyBw==
X-Forwarded-Encrypted: i=1; AJvYcCW8Ucr+sLFn7NaTnBbqAE9ClFF7b0uvROIgydTc+8WAtFzqN7GGBGFkn2zQMPy2t4hioJC/kyVIlhYwk/3/8m9lbP9HduPaMVyTWhvUdQ==
X-Gm-Message-State: AOJu0YxT7KFblg6g7K4jqV8ioPRfle+BgCr/PunLye5leRTsqejZPU2D
	7oNhlsjtV+7JQ/UMnLHmcf4EK8ZjTj1WfjXJyW+mbvNyvB61DQzBhODOjVoERA==
X-Google-Smtp-Source: AGHT+IGap+sYza98GvPHjuTeNYMlCEl+c2qLgEfw/BuVD1pRzSe138R04jmnV0lOziikjgGrlQcWYQ==
X-Received: by 2002:a17:903:41d1:b0:1e0:b73c:e879 with SMTP id u17-20020a17090341d100b001e0b73ce879mr12930947ple.68.1711986671258;
        Mon, 01 Apr 2024 08:51:11 -0700 (PDT)
Received: from [127.0.1.1] ([103.28.246.102])
        by smtp.gmail.com with ESMTPSA id kh6-20020a170903064600b001e21957fecdsm8949076plb.246.2024.04.01.08.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Apr 2024 08:51:10 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Mon, 01 Apr 2024 21:20:31 +0530
Subject: [PATCH v2 05/10] PCI: epf-{mhi/test}: Move DMA initialization to
 EPC init callback
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240401-pci-epf-rework-v2-5-970dbe90b99d@linaro.org>
References: <20240401-pci-epf-rework-v2-0-970dbe90b99d@linaro.org>
In-Reply-To: <20240401-pci-epf-rework-v2-0-970dbe90b99d@linaro.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Jingoo Han <jingoohan1@gmail.com>
Cc: linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mhi@lists.linux.dev, 
 linux-tegra@vger.kernel.org, Niklas Cassel <cassel@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2516;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=zRqM7O4QJ9QR9QAQtoYpWdK8RL4rvRClmGOwhFTCtKY=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBmCtfUGdMnXrY09ZBOL8F9lt+fV4bkGmqX4yzHv
 JEDRzakX82JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZgrX1AAKCRBVnxHm/pHO
 9e16CACpQKDNhpv2wVnXQuSo7FipwYiAPFw7B7IkFye9w0aKDK/a24rCFtQHwiS3d7bWb725nId
 5ZSgMIVacTO/tja/ih53qDSvseRRb65btJyC/QEeYKG004HySoO/LbdnndI7EYB5dMSR4JT4sG6
 O7nPXkKN5CQwv6H8dK5UZpn5A+/QXasxJmDJGVV4UgifGVSZLNiMnScp8Cif5wsRcyTUvJv+Q5K
 TJyKhT6SarbQza3iZ4ShaNbctSOrEfMxQprdKAjI5021kfz2jcU14qb2siHXfSZfFkM90mlW0iE
 WJl6Pztv0Dt8R4sD2Q7Fcg/HiMsAonnbkPeOAuzaoLaVGj7V
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

To maintain uniformity across EPF drivers, let's move the DMA
initialization to EPC init callback. This will also allow us to deinit DMA
during PERST# assert in the further commits.

For EPC drivers without PERST#, DMA deinit will only happen during driver
unbind.

Reviewed-by: Niklas Cassel <cassel@kernel.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/endpoint/functions/pci-epf-mhi.c  | 16 ++++++++--------
 drivers/pci/endpoint/functions/pci-epf-test.c | 12 ++++++------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/pci/endpoint/functions/pci-epf-mhi.c b/drivers/pci/endpoint/functions/pci-epf-mhi.c
index b3c26ffd29a5..4d5c638744a1 100644
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
index 1a4a35e7bf94..8756ffc5977b 100644
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
@@ -898,12 +904,6 @@ static int pci_epf_test_bind(struct pci_epf *epf)
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


