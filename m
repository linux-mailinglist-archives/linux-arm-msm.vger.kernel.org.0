Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BA103BF4C7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jul 2021 06:30:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229580AbhGHEd2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Jul 2021 00:33:28 -0400
Received: from smtp13.smtpout.orange.fr ([80.12.242.135]:36977 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S229568AbhGHEd1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Jul 2021 00:33:27 -0400
Received: from localhost.localdomain ([86.243.172.93])
        by mwinf5d71 with ME
        id SUWk2500421Fzsu03UWk09; Thu, 08 Jul 2021 06:30:45 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 08 Jul 2021 06:30:45 +0200
X-ME-IP: 86.243.172.93
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     mani@kernel.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] bus: mhi: pci_generic: Simplify code and axe the use of a deprecated API
Date:   Thu,  8 Jul 2021 06:30:37 +0200
Message-Id: <bb3dc436fe142309a2334549db782c5ebb80a2be.1625718497.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The wrappers in include/linux/pci-dma-compat.h should go away.

Replace 'pci_set_dma_mask/pci_set_consistent_dma_mask' by an equivalent
and less verbose 'dma_set_mask_and_coherent()' call.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
If needed, see post from Christoph Hellwig on the kernel-janitors ML:
   https://marc.info/?l=kernel-janitors&m=158745678307186&w=4
---
 drivers/bus/mhi/pci_generic.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index bb0326883470..dd3199de07e2 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -510,18 +510,12 @@ static int mhi_pci_claim(struct mhi_controller *mhi_cntrl,
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
2.30.2

