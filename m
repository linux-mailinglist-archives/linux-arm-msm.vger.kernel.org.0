Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3CB03A4A7F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jun 2021 23:03:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229540AbhFKVFz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Jun 2021 17:05:55 -0400
Received: from smtp13.smtpout.orange.fr ([80.12.242.135]:25793 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S230526AbhFKVFz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Jun 2021 17:05:55 -0400
Received: from localhost.localdomain ([86.243.172.93])
        by mwinf5d75 with ME
        id Fx3s2500921Fzsu03x3tKb; Fri, 11 Jun 2021 23:03:53 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 11 Jun 2021 23:03:53 +0200
X-ME-IP: 86.243.172.93
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     mani@kernel.org, hemantk@codeaurora.org, loic.poulain@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] bus: mhi: pci-generic: Add missing 'pci_disable_pcie_error_reporting()' calls
Date:   Fri, 11 Jun 2021 23:03:50 +0200
Message-Id: <f70c14701f4922d67e717633c91b6c481b59f298.1623445348.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If an error occurs after a 'pci_enable_pcie_error_reporting()' call, it
must be undone by a corresponding 'pci_disable_pcie_error_reporting()'
call

Add the missing call in the error handling path of the probe and in the
remove function.

Fixes: b012ee6bfe2a ("mhi: pci_generic: Add PCI error handlers")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/bus/mhi/pci_generic.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index 7c810f02a2ef..d84b74396c6a 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -665,7 +665,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	err = mhi_register_controller(mhi_cntrl, mhi_cntrl_config);
 	if (err)
-		return err;
+		goto err_disable_reporting;
 
 	/* MHI bus does not power up the controller by default */
 	err = mhi_prepare_for_power_up(mhi_cntrl);
@@ -699,6 +699,8 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	mhi_unprepare_after_power_down(mhi_cntrl);
 err_unregister:
 	mhi_unregister_controller(mhi_cntrl);
+err_disable_reporting:
+	pci_disable_pcie_error_reporting(pdev);
 
 	return err;
 }
@@ -721,6 +723,7 @@ static void mhi_pci_remove(struct pci_dev *pdev)
 		pm_runtime_get_noresume(&pdev->dev);
 
 	mhi_unregister_controller(mhi_cntrl);
+	pci_disable_pcie_error_reporting(pdev);
 }
 
 static void mhi_pci_shutdown(struct pci_dev *pdev)
-- 
2.30.2

