Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6F3435E335
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Apr 2021 17:54:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232027AbhDMPx5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Apr 2021 11:53:57 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:17327 "EHLO
        szxga07-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232038AbhDMPxy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Apr 2021 11:53:54 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4FKVSx2vTPz9vgJ;
        Tue, 13 Apr 2021 23:51:13 +0800 (CST)
Received: from localhost.localdomain (10.175.102.38) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.498.0; Tue, 13 Apr 2021 23:53:20 +0800
From:   Wei Yongjun <weiyongjun1@huawei.com>
To:     <weiyongjun1@huawei.com>, Loic Poulain <loic.poulain@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Hemant Kumar <hemantk@codeaurora.org>
CC:     <linux-arm-msm@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        "Hulk Robot" <hulkci@huawei.com>
Subject: [PATCH -next] bus: mhi: pci_generic: Fix possible use-after-free in mhi_pci_remove()
Date:   Tue, 13 Apr 2021 16:03:18 +0000
Message-ID: <20210413160318.2003699-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
X-Originating-IP: [10.175.102.38]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This driver's remove path calls del_timer(). However, that function
does not wait until the timer handler finishes. This means that the
timer handler may still be running after the driver's remove function
has finished, which would result in a use-after-free.

Fix by calling del_timer_sync(), which makes sure the timer handler
has finished, and unable to re-schedule itself.

Fixes: 8562d4fe34a3 ("mhi: pci_generic: Add health-check")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/bus/mhi/pci_generic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index 7c810f02a2ef..5b19e877d17a 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -708,7 +708,7 @@ static void mhi_pci_remove(struct pci_dev *pdev)
 	struct mhi_pci_device *mhi_pdev = pci_get_drvdata(pdev);
 	struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
 
-	del_timer(&mhi_pdev->health_check_timer);
+	del_timer_sync(&mhi_pdev->health_check_timer);
 	cancel_work_sync(&mhi_pdev->recovery_work);
 
 	if (test_and_clear_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status)) {

