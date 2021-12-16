Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A55A476B94
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Dec 2021 09:13:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234870AbhLPINQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Dec 2021 03:13:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234842AbhLPINO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Dec 2021 03:13:14 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 816DBC061756
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Dec 2021 00:13:14 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id m24so18819136pls.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Dec 2021 00:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jORfXqfkT+AmZwZbRfSXnEcMFi32raPXjjq42kYwqXI=;
        b=NyROb5UHfKELvGtaH6JLzZaZrCWR3OMKtVGLIxq1lNesb0I41GMDyDf2xYUtRSXr2R
         8yiOvH7A98JR/I4q1RHTK6tZUn9g84Xik+VxwxNi0+Jc2lz/gw0sgYfpaEZnVDwjvMkN
         iNemcrUv461reOylEuEZE/9u+8Svs9axsMQfm7mOayD1DUClXtF1zAtHWnSyK6Y6TJZl
         S7z07C6mEh9GqE6HNXbkqpxA0u5AZLNPihKqJNN09JBg8QUlZ7FFHntvwWx2kAlxOE9B
         XYkFIPve9HjA+6dbUlQzMnK3anVFI056k31Zgh6wsOUYjF7T3VRduqIqpqN/ptcCetha
         3qpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jORfXqfkT+AmZwZbRfSXnEcMFi32raPXjjq42kYwqXI=;
        b=7qhxyqkFfyHNTy3/xltioZ8dorhGTQG2zfSOMYPwQ4Ig+ZlyKT8HX5s4EAYcmqSMMy
         EVACA+fvCBgpqiu+1Lbn6Fx+m7Tn1YGwbBgY4POoFxzsBbc797d+aI+OVHwLidvTQWf7
         vSq7CetEcOnhurRH44S/Aot8QKACe8KCTQIOKM9UExz0ugr7/t0ayHxk461F5G4IPpri
         MpO2SZbOzLJfbv6lOdIgYi2DFap/Bl4R/iyh/VqilK89hbiL5wjg7tZ+B7fOvx/9je5D
         blBpDmlXkbzLBcZBQPxFu+GJfk5zq+DbWuBRzkDNdTea8HZ28m0pwEUWMcZJ3sj0/hnG
         E9UA==
X-Gm-Message-State: AOAM532I9p7AbnwWh/ZcwF+yMSw/UypThX5EYsEvc/1KhbFi6Oicn0VW
        Ujv9K/dTXS7Ugd6TQpWdmGpI0T0FHzUO
X-Google-Smtp-Source: ABdhPJxSBZxpt9vbJSz9OgvxQmS/MXnfDD2CMsEYXXlEenw0R6KqhonP8LmYH/RF56yror/Md0arcw==
X-Received: by 2002:a17:902:d885:b0:148:a2e8:2c55 with SMTP id b5-20020a170902d88500b00148a2e82c55mr8633167plz.164.1639642394010;
        Thu, 16 Dec 2021 00:13:14 -0800 (PST)
Received: from localhost.localdomain ([117.193.208.121])
        by smtp.gmail.com with ESMTPSA id u38sm326835pfg.4.2021.12.16.00.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 00:13:13 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     mhi@lists.linux.dev, hemantk@codeaurora.org, bbhatt@codeaurora.org,
        loic.poulain@linaro.org, thomas.perrot@bootlin.com,
        aleksander@aleksander.es, slark_xiao@163.com,
        christophe.jaillet@wanadoo.fr, keescook@chromium.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 05/10] bus: mhi: pci_generic: Simplify code and axe the use of a deprecated API
Date:   Thu, 16 Dec 2021 13:42:22 +0530
Message-Id: <20211216081227.237749-6-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211216081227.237749-1-manivannan.sadhasivam@linaro.org>
References: <20211216081227.237749-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

The wrappers in include/linux/pci-dma-compat.h should go away.

Replace 'pci_set_dma_mask/pci_set_consistent_dma_mask' by an equivalent
and less verbose 'dma_set_mask_and_coherent()' call.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Link: https://lore.kernel.org/r/bb3dc436fe142309a2334549db782c5ebb80a2be.1625718497.git.christophe.jaillet@wanadoo.fr
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/pci_generic.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index 4f72bbcc53c9..9ef41354237c 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -532,18 +532,12 @@ static int mhi_pci_claim(struct mhi_controller *mhi_cntrl,
 	mhi_cntrl->regs = pcim_iomap_table(pdev)[bar_num];
 	mhi_cntrl->reg_len = pci_resource_len(pdev, bar_num);
 
-	err = pci_set_dma_mask(pdev, dma_mask);
+	err = dma_set_mask_and_coherent(&pdev->dev, dma_mask);
 	if (err) {
 		dev_err(&pdev->dev, "Cannot set proper DMA mask\n");
 		return err;
 	}
 
-	err = pci_set_consistent_dma_mask(pdev, dma_mask);
-	if (err) {
-		dev_err(&pdev->dev, "set consistent dma mask failed\n");
-		return err;
-	}
-
 	pci_set_master(pdev);
 
 	return 0;
-- 
2.25.1

