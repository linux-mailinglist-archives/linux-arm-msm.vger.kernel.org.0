Return-Path: <linux-arm-msm+bounces-33074-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6AC98FC5D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 04:34:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 13083B23042
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 02:34:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72AE21F943;
	Fri,  4 Oct 2024 02:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JHMyYieO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14022209F
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Oct 2024 02:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728009243; cv=none; b=ptChpnne9UyW3qCP63krIyyniEs6SNeIWc7+dBM5OlKArCf2onohP1v7jaT5fvo4IPkco1B31tmz/PThVd/eqApNtH8iOsYU57DZKaZWhYR8xBk9hRQg2AYnJi2809eXBn1yx/SmmUfEbQQu2xZbkpBt/yCfWv/hP595U4+sjLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728009243; c=relaxed/simple;
	bh=dbCuEJvEVy7YBDG6K3ryuaINHgFsf6v50vwWGbHLnKk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oQmFz3apvdwTr2BPO9h3Li+YaSChp61nd9+sA9Gkwg+OAc4kGnAPgs241HtQkuVy/2pSJxrXJVhzuPd+z3fhtrrr5VL+fX/YrzMVCybdKq1RDfEDZTAFEQP+HyD3XZdT9vlxe/b0Mn6wjloq/Hkfpa+Vh6po6Vr+Q9GoiIBK8kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JHMyYieO; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-719b17b2da1so1292993b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Oct 2024 19:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728009241; x=1728614041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=du7/JNW+sZETMBVLzCx5tmC+OyPTiZDvBweNek+J/Aw=;
        b=JHMyYieOssZ8agf3zmkYriBYmaEXm49RLYFo2TYnNZiwDdliAXvNdZg8L6CWvzeamE
         N43EVuSuvbLzutnqGAsDn04NYbrDZimRDR3NHZfEE2sGZIgahd4ESuiHIOwXfqCZLpc2
         g32w/OgWgCUNSpBufr+mn+ZqsVQ90L0PnVxlr66EWxDsI+hzPssBCTuoSpyA1Xq94Ggn
         RiRQ83SF+Q8doV5sSydivI9MOmfjidXkL0vg5JKjhd7G+ohjbWWQIhkeFBp/5VhKtwj8
         SKgkFANrMsmJ4W+8lUOWeVpjSTosEHxtLw1+CUGHwV5ib3Ng52Aix/4pinH/D6Z7780q
         cX+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728009241; x=1728614041;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=du7/JNW+sZETMBVLzCx5tmC+OyPTiZDvBweNek+J/Aw=;
        b=qb2nn6zO8YN6DhreNscYherlbFTFYzXNxw4FpTPmmjpQKMfWogESJMKuO64bnB3U3A
         9sdfoHliM5BUfo3NcDEtmHlliTFtF+/BkUCJTk/Xlt0eCFKQ1inPhYThX6rdzb1j7MIM
         WjBn03h4n094agXPSJAFbvmMMivtYd1O32v1kTovT9GXe/9R2TRGTXS6n748BH2JvCS9
         K81XXYjSO25XUnOLffILDSGAZz2jToOlgcuoT2L1tafgwkvPUDOuWwx7SnZNM8UihKgv
         695QFiOepqDAg2tF76UowL4Hmc3IX42TfkQof3dOwL+Kf9EJW19YSs0xa3Ammj1djLmq
         /XvQ==
X-Gm-Message-State: AOJu0YztMbFMfgj5aqfxDf3Sttg+AgWMrxKSpVpgeU2h5acIMcQlxRnU
	/nQW8enw7pVhnovdmJST7BFEJMaarISkA3w/PZQMPwtkMKS2fx8aq9XFc6BCIQ==
X-Google-Smtp-Source: AGHT+IEJLHXoyO1KJ5gqYKT2vrlKIjq3nJ/JcU72LMLiwqc0Zrq8Su6VykZ+KjqgevvyyKpX4ruZBg==
X-Received: by 2002:a05:6a20:c89c:b0:1d6:ded8:8f33 with SMTP id adf61e73a8af0-1d6dfa46be2mr1848311637.23.1728009241075;
        Thu, 03 Oct 2024 19:34:01 -0700 (PDT)
Received: from localhost.localdomain ([36.255.17.115])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71dd9d7e523sm2127696b3a.65.2024.10.03.19.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 19:33:59 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: mhi@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH] bus: mhi: host: pci_generic: Use pcim_iomap_region() to request and map MHI BAR
Date: Fri,  4 Oct 2024 08:03:51 +0530
Message-Id: <20241004023351.6946-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use of both pcim_iomap_regions() and pcim_iomap_table() APIs are
deprecated. Hence, switch to pcim_iomap_region() API which handles both the
request and map of the MHI BAR region.

Cc: Loic Poulain <loic.poulain@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---

Compile tested only.

 drivers/bus/mhi/host/pci_generic.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 9938bb034c1c..07645ce2119a 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -917,12 +917,12 @@ static int mhi_pci_claim(struct mhi_controller *mhi_cntrl,
 		return err;
 	}
 
-	err = pcim_iomap_regions(pdev, 1 << bar_num, pci_name(pdev));
-	if (err) {
+	mhi_cntrl->regs = pcim_iomap_region(pdev, 1 << bar_num, pci_name(pdev));
+	if (IS_ERR(mhi_cntrl->regs)) {
+		err = PTR_ERR(mhi_cntrl->regs);
 		dev_err(&pdev->dev, "failed to map pci region: %d\n", err);
 		return err;
 	}
-	mhi_cntrl->regs = pcim_iomap_table(pdev)[bar_num];
 	mhi_cntrl->reg_len = pci_resource_len(pdev, bar_num);
 
 	err = dma_set_mask_and_coherent(&pdev->dev, dma_mask);
-- 
2.25.1


