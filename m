Return-Path: <linux-arm-msm+bounces-12548-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A431386736D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Feb 2024 12:39:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4466E1F2AD4C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Feb 2024 11:39:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B2BF4CE05;
	Mon, 26 Feb 2024 11:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e9x6N/HH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37834CB4B
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Feb 2024 11:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708947484; cv=none; b=i4T9hXqmCOnuUChym2GfuDb3EChP/1cluzuaIkPu8UB0PGcKqTQcKsmpjMZbkPsjh2HOFXt1GXaE968GchXDttTWStRf2HGKknENQ2A/YE1CB+IMDaDeTO3TPgIDklvOF9LWoxaVgWgcSaweQg7/+0+Mx3uib0Cc43BK7bW0JIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708947484; c=relaxed/simple;
	bh=nHkU+s/hofqacaD6DKpKZMYQycR1YXGCRfONZEYjupQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eRykadN89Z/rUdGnwbiXmOID/v8eC/uOwSKzVXzAarKEGErt82UWivnYq44QKeZXKikrnySJVJHg5mCbAB3NCG0+2hEEpyXGJDtqrN8p8SmnYcTRQLh0KgL42VXfUtHDiJ54PTjmRQ4Nv7okhbvFOOqNZgGIayMMs4HyCsAfL7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e9x6N/HH; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-787c900af02so110414685a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Feb 2024 03:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708947480; x=1709552280; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MkHgfdlubDIZc6YiSfjHe4pC8mX8qCcfR0RdSpyweMY=;
        b=e9x6N/HHyDD5xyrpxDu4iUy9+q/O1p16MCtq8/zd2tu4MyanxwBuojWO2/7NogTpdH
         QuGZuVhhCMn4GstDH31mW70Ort3c0doBWVS0fTbnExhUX176YHI5h2XZ21R1lJLnUA0T
         UsV/ZqtyZ40PIXgdFUCcigRdPsYSt/6/KWjRTeiMxXwdBIBJQqKuLFdB+lJdQUp58Qkt
         ynAxbjm0J0O3e2Px3Uy70cnyRnIP+nqWqlwLGm/w6Ayfmi62Xqu8Wibtysj1tp11GTq7
         8WMRUsVI6kLhE8dp7BQt+VF3cPmwslhNHy5vZ6S8GzdZWAf6PQyysUQnzST8TVVXi70/
         33MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708947480; x=1709552280;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MkHgfdlubDIZc6YiSfjHe4pC8mX8qCcfR0RdSpyweMY=;
        b=ujRj1Cubz74mGe7p2TWqYBsEpbXyBoh7TB6t+WpFicEyukpP4vMhsC9CpaWqBkkwfQ
         xF4zAIS3acnZQf2ZUEPa1GPtl02WEmT3W1XajlfdJcbsXJwZl7MHjVDUEG44xn8N4oGV
         3CATk9KSSlCmNFiGJwEjCdQGl7V0VQXtL1DHI7wriONB+Sbu60O/Rw0HMbDH3y6Kcs3a
         9AvMF8p1RQb6kvS1NN9odTgGwushluC/dgc1ICFV/AmLvSqxvHbx04efexBAUMDvaMUy
         O7ZufqnOJD3InYJ2RaQPsSn0sELygj9/J2+KboN2IbDOyRx4fJSrwF0JfsUKB9NBV8TU
         dpGA==
X-Forwarded-Encrypted: i=1; AJvYcCV/P9r8bHyp16EMsZ0toUFItDKQ7jch8q8U2/q6pbGgflfep8BzxqUGof56wNlh+WXHEXHHM0H6UhGdeJVORW4oIpNWDyg2nVTX1ac5Cw==
X-Gm-Message-State: AOJu0YwSwEPEAe0Bnyn/Ea1e6bnGMDtBauyFn3mPz2qcoiVQ2sT8IMPk
	VyGLUmlCz4yaeR85PaJzLOWrCTBf0fngwMbW2DyYqmZ+8dXpXQIguvuhQC0lZQ==
X-Google-Smtp-Source: AGHT+IGPmvmoIeAgzVE7znxhwcyGl4vLUPNeK2hT4NfYJOQM/VYz+VPl0uXr2ByjXdUb0go/U4WAjg==
X-Received: by 2002:a05:620a:a09:b0:787:bd2f:e30d with SMTP id i9-20020a05620a0a0900b00787bd2fe30dmr12995662qka.19.1708947479856;
        Mon, 26 Feb 2024 03:37:59 -0800 (PST)
Received: from [127.0.1.1] ([117.202.184.81])
        by smtp.gmail.com with ESMTPSA id q15-20020a05620a0c8f00b007878babb96asm2341842qki.94.2024.02.26.03.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 03:37:59 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Mon, 26 Feb 2024 17:07:27 +0530
Subject: [PATCH v3 2/5] PCI: dwc: Skip finding eDMA channels count if glue
 drivers have passed them
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-dw-hdma-v3-2-cfcb8171fc24@linaro.org>
References: <20240226-dw-hdma-v3-0-cfcb8171fc24@linaro.org>
In-Reply-To: <20240226-dw-hdma-v3-0-cfcb8171fc24@linaro.org>
To: Jingoo Han <jingoohan1@gmail.com>, 
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Marek Vasut <marek.vasut+renesas@gmail.com>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: Serge Semin <fancer.lancer@gmail.com>, linux-pci@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Siddharth Vadapalli <s-vadapalli@ti.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1982;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=nHkU+s/hofqacaD6DKpKZMYQycR1YXGCRfONZEYjupQ=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBl3HgF/rASIKBtYR+ctXJQGfZnVs/PLtISbbelP
 4j25M3FMvCJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZdx4BQAKCRBVnxHm/pHO
 9RAEB/0f+JgPn81KF1QoksP35fTFnUOaahH5T1Ggq54hdmm83UwdirBwQRPYJoo83ttnBr0g+tG
 mBgVdFOBCPSBv1ccH+TL3DJy1AEXKyLh3cZ8Kdaf79ZoEGpjrjCDQvj2qcRfD5yEeXjMgvjREpJ
 nmB3ENkWrQsx71qOeeXlq+zoAswDcGaM27iZr01yxP2xOKJyudftYZoINsGwVzqcAqf/WZ7RUtd
 /57hoXRwB8kDATQEWBFlAMlchTcTixFAgyeUw8iFxaJoRzziT/eyIFaLDEoHPU1cz7hlnx3bD1K
 P4UN5LN+i9ZoS+zGOWUkRM6SnJR1Ttljmp7hBiKlzj4fJogF
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

In the case of Hyper DMA (HDMA) present in DWC controllers, there is no way
the drivers can auto detect the number of read/write channels as like its
predecessor embedded DMA (eDMA). So the glue drivers making use of HDMA
have to pass the channels count during probe.

To accommodate that, let's skip finding the channels if the channels count
were already passed by glue drivers. If the channels count passed were
wrong in any form, then the existing sanity check will catch it.

Suggested-by: Serge Semin <fancer.lancer@gmail.com>
Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-designware.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
index 193fcd86cf93..ce273c3c5421 100644
--- a/drivers/pci/controller/dwc/pcie-designware.c
+++ b/drivers/pci/controller/dwc/pcie-designware.c
@@ -927,13 +927,15 @@ static int dw_pcie_edma_find_channels(struct dw_pcie *pci)
 {
 	u32 val;
 
-	if (pci->edma.mf == EDMA_MF_EDMA_LEGACY)
-		val = dw_pcie_readl_dbi(pci, PCIE_DMA_VIEWPORT_BASE + PCIE_DMA_CTRL);
-	else
-		val = dw_pcie_readl_dma(pci, PCIE_DMA_CTRL);
-
-	pci->edma.ll_wr_cnt = FIELD_GET(PCIE_DMA_NUM_WR_CHAN, val);
-	pci->edma.ll_rd_cnt = FIELD_GET(PCIE_DMA_NUM_RD_CHAN, val);
+	if (!pci->edma.ll_wr_cnt || !pci->edma.ll_rd_cnt) {
+		if (pci->edma.mf == EDMA_MF_EDMA_LEGACY)
+			val = dw_pcie_readl_dbi(pci, PCIE_DMA_VIEWPORT_BASE + PCIE_DMA_CTRL);
+		else
+			val = dw_pcie_readl_dma(pci, PCIE_DMA_CTRL);
+
+		pci->edma.ll_wr_cnt = FIELD_GET(PCIE_DMA_NUM_WR_CHAN, val);
+		pci->edma.ll_rd_cnt = FIELD_GET(PCIE_DMA_NUM_RD_CHAN, val);
+	}
 
 	/* Sanity check the channels count if the mapping was incorrect */
 	if (!pci->edma.ll_wr_cnt || pci->edma.ll_wr_cnt > EDMA_MAX_WR_CH ||

-- 
2.25.1


