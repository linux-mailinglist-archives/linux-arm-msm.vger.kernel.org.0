Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A348732617F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Feb 2021 11:45:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231199AbhBZKn4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Feb 2021 05:43:56 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:45850 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230347AbhBZKny (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Feb 2021 05:43:54 -0500
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 26 Feb 2021 02:43:12 -0800
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 26 Feb 2021 02:43:11 -0800
X-QCInternal: smtphost
Received: from gokulsri-linux.qualcomm.com ([10.201.2.207])
  by ironmsg02-blr.qualcomm.com with ESMTP; 26 Feb 2021 16:12:52 +0530
Received: by gokulsri-linux.qualcomm.com (Postfix, from userid 432570)
        id 6DAFE20E7E; Fri, 26 Feb 2021 16:12:52 +0530 (IST)
From:   Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
To:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     manivannan.sadhasivam@linaro.org, jhugo@codeaurora.org,
        hemantk@codeaurora.org, sricharan@codeaurora.org,
        gokulsri@codeaurora.org
Subject: [PATCH v2] bus: mhi: core: Add unique qrtr node id support
Date:   Fri, 26 Feb 2021 16:12:49 +0530
Message-Id: <1614336169-31467-2-git-send-email-gokulsri@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614336169-31467-1-git-send-email-gokulsri@codeaurora.org>
References: <1614336169-31467-1-git-send-email-gokulsri@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On platforms with two or more identical mhi
devices, qmi service will run with identical
qrtr-node-id. Because of this identical ID,
host qrtr-lookup cannot register more than one
qmi service with identical node ID. Ultimately,
only one qmi service will be avilable for the
underlying drivers to communicate with.

On QCN9000, it implements a unique qrtr-node-id
and qmi instance ID using a unique instance ID
written to a debug register from host driver
soon after SBL is loaded.

This change generates a unique instance ID from
PCIe domain number and bus number, writes to the
given debug register just after SBL is loaded so
that it is available for FW when the QMI service
is spawned.

sample:
root@OpenWrt:/# qrtr-lookup
  Service Version Instance Node  Port
       15       1        0    8     1 Test service
       69       1        8    8     2 ATH10k WLAN firmware service
       15       1        0   24     1 Test service
       69       1       24   24     2 ATH10k WLAN firmware service

Here 8 and 24 on column 3 (QMI Instance ID)
and 4 (QRTR Node ID) are the node IDs that
is unique per mhi device.

Signed-off-by: Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
---
 drivers/bus/mhi/core/boot.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/bus/mhi/core/boot.c b/drivers/bus/mhi/core/boot.c
index c2546bf..5e5dad5 100644
--- a/drivers/bus/mhi/core/boot.c
+++ b/drivers/bus/mhi/core/boot.c
@@ -16,8 +16,12 @@
 #include <linux/random.h>
 #include <linux/slab.h>
 #include <linux/wait.h>
+#include <linux/pci.h>
 #include "internal.h"
 
+#define QRTR_INSTANCE_MASK	0x000000FF
+#define QRTR_INSTANCE_SHIFT	0
+
 /* Setup RDDM vector table for RDDM transfer and program RXVEC */
 void mhi_rddm_prepare(struct mhi_controller *mhi_cntrl,
 		      struct image_info *img_info)
@@ -391,6 +395,9 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 	const struct firmware *firmware = NULL;
 	struct image_info *image_info;
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
+	struct pci_dev *pci_dev = to_pci_dev(mhi_cntrl->cntrl_dev);
+	struct pci_bus *bus = pci_dev->bus;
+	uint32_t instance;
 	const char *fw_name;
 	void *buf;
 	dma_addr_t dma_addr;
@@ -466,6 +473,13 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 		return;
 	}
 
+	instance = ((pci_domain_nr(bus) & 0xF) << 4) | (bus->number & 0xF);
+	instance &= QRTR_INSTANCE_MASK;
+
+	mhi_write_reg_field(mhi_cntrl, mhi_cntrl->bhi,
+			    BHI_ERRDBG2, QRTR_INSTANCE_MASK,
+			    QRTR_INSTANCE_SHIFT, instance);
+
 	write_lock_irq(&mhi_cntrl->pm_lock);
 	mhi_cntrl->dev_state = MHI_STATE_RESET;
 	write_unlock_irq(&mhi_cntrl->pm_lock);
-- 
2.7.4

