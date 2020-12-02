Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AAA32CB980
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Dec 2020 10:45:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388599AbgLBJot (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Dec 2020 04:44:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388627AbgLBJos (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Dec 2020 04:44:48 -0500
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 106F1C08E860
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Dec 2020 01:44:24 -0800 (PST)
Received: by mail-pg1-x544.google.com with SMTP id n7so302826pgg.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Dec 2020 01:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hesBFBojopE7IXyDHX9xv1pvWQunAb7Jbvi4ET2s6mg=;
        b=O+4jPsZtWP+eaoXAjBDW/UBLL8u4+f70p9fgqatvstbeOqHnHsZc5BFM6mXMyR0yqF
         ymxh4DMJnFvOhl+zDYcqj2vA3wkHCl8BlTetoAM5H640i5MAwmaIfnXm8WaFxbvS5S+w
         1YsaCurhV5RhLd0kWQl3V88TtA7Ir0r4NFRVGstbm/svqaI5jJQX/GU7O8mI4GswzhxF
         X23Yra3I+fJ/Dvw3L4h/JZgfJlIDP/fk/VFrg+yRdHSxYBr4V6QrNosF2J/+KnfEkfL/
         Y57uHl/ynIk7g5CjYsPZ0C+o47SRrdhl5nYodHY6In+5Cszu7YdTOjqn2ebfqfDfc+Do
         FW5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hesBFBojopE7IXyDHX9xv1pvWQunAb7Jbvi4ET2s6mg=;
        b=O9nI6vC35y5VkOKxghGIJe54hQU6I52JkH9BHJGSUgR085t9OG9FVliohoQUzaOq7T
         AomdJ0Ta9282PmA7VCU3j7kkK3W/GVV+uQUMHGKD1VyZ/LZ0ponb+L2IfemcbwuPODrd
         pLJsskMHKCo8V8W1fftknjHoYgIkadkjZ9iTPTXn5DylyKr5+ppzTN3B0mNReETOS/3p
         tHbg72S5fmirWQU3TqNCbQdm74OnamwO31YL8y5jdBc0eB2v75BeCRXVt+26mW/aBhOx
         SKPKVaBV3zSvy+kTwU/gdv4+OXURqt/MyAw8ytMdhErKP99uWoqeDUnMFnPbFCOb+8/D
         zSNg==
X-Gm-Message-State: AOAM533mZ4qDuu+z65a/Mj2p6wED1dN6YYZB0z9UwwDNxSzwGikorijS
        OYqW9NL35IfjzmO2IcZ36OAu
X-Google-Smtp-Source: ABdhPJxNFeNbpI/hjcUUAp5oFAZHzrjkJ1EXDmF3Y6UuchNNH0C9DG6qIzO/kz+xXl7uPibe/ZkciQ==
X-Received: by 2002:a63:4b05:: with SMTP id y5mr1895628pga.342.1606902263544;
        Wed, 02 Dec 2020 01:44:23 -0800 (PST)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id bg8sm1393990pjb.52.2020.12.02.01.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Dec 2020 01:44:22 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org, loic.poulain@linaro.org,
        kernel test robot <lkp@intel.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 29/29] mhi: pci_generic: Fix implicit conversion warning
Date:   Wed,  2 Dec 2020 15:11:59 +0530
Message-Id: <20201202094159.107075-30-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201202094159.107075-1-manivannan.sadhasivam@linaro.org>
References: <20201202094159.107075-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Loic Poulain <loic.poulain@linaro.org>

Fix the following warning with explicit cast:

warning: implicit conversion from 'unsigned long long' to
'dma_addr_t' (aka 'unsigned int')
mhi_cntrl->iova_stop = DMA_BIT_MASK(info->dma_data_width);

Fixes: 855a70c12021 ("bus: mhi: Add MHI PCI support for WWAN modems")
Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
Reported-by: kernel test robot <lkp@intel.com>
Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/pci_generic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index e3df838c3c80..f5bee76ea061 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -273,7 +273,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	mhi_cntrl_config = info->config;
 	mhi_cntrl->cntrl_dev = &pdev->dev;
 	mhi_cntrl->iova_start = 0;
-	mhi_cntrl->iova_stop = DMA_BIT_MASK(info->dma_data_width);
+	mhi_cntrl->iova_stop = (dma_addr_t)DMA_BIT_MASK(info->dma_data_width);
 	mhi_cntrl->fw_image = info->fw;
 	mhi_cntrl->edl_image = info->edl;
 
-- 
2.25.1

