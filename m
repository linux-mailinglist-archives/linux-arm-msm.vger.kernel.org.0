Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A29E43DCFF9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Aug 2021 07:13:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232298AbhHBFOE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Aug 2021 01:14:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232234AbhHBFN5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Aug 2021 01:13:57 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80BE4C06179F
        for <linux-arm-msm@vger.kernel.org>; Sun,  1 Aug 2021 22:13:46 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id m10-20020a17090a34cab0290176b52c60ddso23013844pjf.4
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Aug 2021 22:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=d6QO+qoPrYnXm6doNgVAXn8uk9174Od4qwkAZLnqxu4=;
        b=ahF6JFhQyFCCm4IkDoUHiLUvKcqe/AAERTdsultW2Im879ODNJUz/Mw1T9ezNytBvq
         dPpiZ6tqpwXjZvDEP3CM5ENUSE+TaDkQEtzpymiFBa/r3E426u2d0Q8CBhf+lVULn0Hf
         SlLerKSkJJjnZxFHh1hPy1OuyVXzUYka7SHZy1tPvq+oik+4DqGb+ZwrR5zeEMqn/6PK
         +51Cc4U44FNvb5ahhEQx9UhGuGfk03RuTcoZ+raYa6x/+f+pBwpMq1Zhk9fNfiR3mmaQ
         MYVHBQ5rHaf7nE7nmhv/lgDiO6JqUvBvqXESYa2uHWet0HrCMNK7JVFuf9ueOW80YmOo
         2Jhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d6QO+qoPrYnXm6doNgVAXn8uk9174Od4qwkAZLnqxu4=;
        b=RPUzrKYjT2lUX1eL/6dhdbyaUYuT/aUprCX2wNy5edZfXSIThJDeuCtX6ArCTQFTbt
         a21YvSFEyA9T9aE+rG2HbeKz+suGMv2NEBOwU6/hySZSWL/HthH4h8sCa0cU+G5+2fq6
         NBmuGrr9TziJYCNNGOZWDXBlkfBnM+lyUtfskeMeIdxvQ33xXT1dWCvXkU4bMf0Ex7de
         LqtKENSD8yzSuRdwxa1+7ER9vrfYNAxQQla8Qqz5SYKXOjegSVF6mfpIaD6mftnfQ6FL
         gpD86/D3qvEV39jSr0w4U9Xn2NqGYXt+JfcnPuZNeK8oZX6RTQrp7kHJVNGGx2qziUoC
         1kkg==
X-Gm-Message-State: AOAM530QrdaErwtW2m6+JXwRJ3S1YS4dul5Nd1NyTJGEwanP84oF/YUC
        MbNt4Sw2YFRnuaxV1cUc/PWM
X-Google-Smtp-Source: ABdhPJwA1DYIz6396G8uC6nCVoqo6VzmvPArQJJENMfyDyZTG4qwTG1b5EL9HuCGw6/nx3znzifW4A==
X-Received: by 2002:a63:1155:: with SMTP id 21mr1053634pgr.346.1627881226039;
        Sun, 01 Aug 2021 22:13:46 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:6e99:242f:6391:b1b4:1ad8:fbdf])
        by smtp.gmail.com with ESMTPSA id x26sm9947000pfm.77.2021.08.01.22.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Aug 2021 22:13:45 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org, loic.poulain@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 07/10] bus: mhi: pci_generic: Set register access length for MHI driver
Date:   Mon,  2 Aug 2021 10:42:52 +0530
Message-Id: <20210802051255.5771-8-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210802051255.5771-1-manivannan.sadhasivam@linaro.org>
References: <20210802051255.5771-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bhaumik Bhatt <bbhatt@codeaurora.org>

MHI driver requires register space length to add range checks and
prevent memory region accesses outside of that for MMIO space.
Set it from the PCI generic controller driver before registering
the MHI controller.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
Reviewed-by: Loic Poulain <loic.poulain@linaro.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Link: https://lore.kernel.org/r/1620330705-40192-6-git-send-email-bbhatt@codeaurora.org
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/pci_generic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index 6e1a86021b75..c772d94025fe 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -500,6 +500,7 @@ static int mhi_pci_claim(struct mhi_controller *mhi_cntrl,
 		return err;
 	}
 	mhi_cntrl->regs = pcim_iomap_table(pdev)[bar_num];
+	mhi_cntrl->reg_len = pci_resource_len(pdev, bar_num);
 
 	err = pci_set_dma_mask(pdev, dma_mask);
 	if (err) {
-- 
2.25.1

