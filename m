Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CA9F51475E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Apr 2022 12:50:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354947AbiD2KtC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Apr 2022 06:49:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356176AbiD2KsL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Apr 2022 06:48:11 -0400
Received: from mail-m975.mail.163.com (mail-m975.mail.163.com [123.126.97.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3AF07C6EFA
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 03:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=xC4JY
        hOzDaEQzHaSlxCM/0aHm5f8tpI/zQcz2OxAeRI=; b=gvPXF45h1Rwf2XtgzJ74i
        Q5U/H9gQo3KYi4zduQhsGP+JIed0+my2a5Ra5NXelGy5VBoG6qHJY/EPDWLDhfxl
        bs/BVyGjSk+1gFgRlBch54mytm/lBk2AeyXZzmWm1dNnL729RYgFMgAeamMZbaVB
        T2nHT8T5g6HigPfIl0Usl4=
Received: from localhost.localdomain (unknown [112.97.84.12])
        by smtp5 (Coremail) with SMTP id HdxpCgAneHYlwWti3f7uDQ--.354S2;
        Fri, 29 Apr 2022 18:42:48 +0800 (CST)
From:   Slark Xiao <slark_xiao@163.com>
To:     mani@kernel.org, hemantk@codeaurora.org, bbhatt@codeaurora.org
Cc:     gregkh@linuxfoundation.org, loic.poulain@linaro.org,
        christophe.jaillet@wanadoo.fr, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, weiyongjun1@huawei.com,
        Slark Xiao <slark_xiao@163.com>
Subject: [PATCH] bus: mhi: host: Add support for Foxconn T99W373 and T99W368
Date:   Fri, 29 Apr 2022 18:42:41 +0800
Message-Id: <20220429104241.4074-1-slark_xiao@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: HdxpCgAneHYlwWti3f7uDQ--.354S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Aw4DWr1ftFy8ZFyxJry3CFg_yoW8AFy3pF
        4FvrWjya1ktr45K3ykA39ruas5Can3Cry3KF1xKw1a9w4qy3yYqr92gw12vFyYv3s8XFW3
        tFyDWFyag3WqkF7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pNjgwXUUUUU=
X-Originating-IP: [112.97.84.12]
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/xtbCdQDxZGBbC5TtBAAAst
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Product's enumeration align with previous Foxconn
SDX55, so T99W373(SDX62)/T99W368(SDX65) would use
 the same config as Foxconn SDX55.
Remove fw and edl for this new commit.

Signed-off-by: Slark Xiao <slark_xiao@163.com>
---
 drivers/bus/mhi/host/pci_generic.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 9527b7d63840..efc57cd75cec 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -371,6 +371,15 @@ static const struct mhi_pci_dev_info mhi_foxconn_sdx55_info = {
 	.sideband_wake = false,
 };
 
+static const struct mhi_pci_dev_info mhi_foxconn_sdx65_info = {
+	.name = "foxconn-sdx65",
+	.config = &modem_foxconn_sdx55_config,
+	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
+	.dma_data_width = 32,
+	.mru_default = 32768,
+	.sideband_wake = false,
+};
+
 static const struct mhi_channel_config mhi_mv31_channels[] = {
 	MHI_CHANNEL_CONFIG_UL(0, "LOOPBACK", 64, 0),
 	MHI_CHANNEL_CONFIG_DL(1, "LOOPBACK", 64, 0),
@@ -472,6 +481,12 @@ static const struct pci_device_id mhi_pci_id_table[] = {
 	/* T99W175 (sdx55), Based on Qualcomm new baseline */
 	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0bf),
 		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
+	/* T99W368 (sdx65) */
+	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0d8),
+		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx65_info },
+	/* T99W373 (sdx62) */
+	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0d9),
+		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx65_info },
 	/* MV31-W (Cinterion) */
 	{ PCI_DEVICE(0x1269, 0x00b3),
 		.driver_data = (kernel_ulong_t) &mhi_mv31_info },
-- 
2.25.1

