Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 823D043DA0B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Oct 2021 06:00:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229651AbhJ1ECh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Oct 2021 00:02:37 -0400
Received: from mail-m972.mail.163.com ([123.126.97.2]:45970 "EHLO
        mail-m972.mail.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbhJ1ECg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Oct 2021 00:02:36 -0400
X-Greylist: delayed 909 seconds by postgrey-1.27 at vger.kernel.org; Thu, 28 Oct 2021 00:02:35 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=XVv5S
        FdNpgCsY/DIDBoDScNacGKqd9KJsrwwR7Ljgzo=; b=M0uiqBWXmiPppcfgTxKPY
        X+0R/VytFXd9NRxzuh0/3oY4NEQTl9/A8drjCsd8I0sKdnY2INTV+2yxrj2evZYY
        LstL/k4DejCeURBu3v+dmrXiBD1Sxf/XTV16z0SZAt0gjxX3p4VIEgqWn/S4sjfJ
        o9r7YRZAr1Kjb+qkMwZIl4=
Received: from localhost.localdomain (unknown [112.97.53.33])
        by smtp2 (Coremail) with SMTP id GtxpCgD3_yuzHHphNOvxGg--.49164S2;
        Thu, 28 Oct 2021 11:44:52 +0800 (CST)
From:   Slark Xiao <slark_xiao@163.com>
To:     mani@kernel.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Slark Xiao <slark_xiao@163.com>
Subject: [PATCH] bus: mhi: pci_generic: Add new device ID support for T99W175
Date:   Thu, 28 Oct 2021 11:44:31 +0800
Message-Id: <20211028034431.3563-1-slark_xiao@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: GtxpCgD3_yuzHHphNOvxGg--.49164S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7AF4xuw1rtFy7Ww1xuFW3ZFb_yoW8Gr1rpF
        4S9FWakF4kZF1UKFykK34kZFya9a17CryUKFy7Cw1Ygr1qy3yYgwn3GryxWayUtFZ0qF4a
        qr1jvryjqa4qyaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRppBgUUUUU=
X-Originating-IP: [112.97.53.33]
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/xtbBrRU6ZF75cHu5FAAAsn
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add new device ID 0xe0bf for T99W175.

Test evidence as below:
root@jbd-ThinkPad-P1-Gen-4:/dev# lspci -nn | grep Foxconn
0000:08:00.0 Wireless controller [0d40]: Foxconn International, Inc. Device [105b:e0bf]
root@jbd-ThinkPad-P1-Gen-4:/dev# cat wwan0at0 & echo -ne "ati\r" > wwan0at0
[2] 2977
root@jbd-ThinkPad-P1-Gen-4:/dev# ati
Manufacturer: Qualcomm
Model: T99W175
Revision: T99W175.F0.6.0.0.6.CC.005  1  [Oct 21 2021 10:00:00]
IMEI:
+GCAP: +CGSM

OK

Signed-off-by: Slark Xiao <slark_xiao@163.com>
---
 drivers/bus/mhi/pci_generic.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index 59a4896a8030..566483dc15db 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -423,6 +423,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
 	/* DW5930e (sdx55), Non-eSIM, It's also T99W175 */
 	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0b1),
 		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
+	/* T99W175 (sdx55) */
+	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0bf),
+		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
 	/* MV31-W (Cinterion) */
 	{ PCI_DEVICE(0x1269, 0x00b3),
 		.driver_data = (kernel_ulong_t) &mhi_mv31_info },
-- 
2.25.1

