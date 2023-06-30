Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05EF87434E8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jun 2023 08:24:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230233AbjF3GYF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Jun 2023 02:24:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229883AbjF3GYE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Jun 2023 02:24:04 -0400
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.216])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 694501BCE
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jun 2023 23:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version:
        Content-Type; bh=ISJVHwzHvmijJJrvj2ySMSMkBnauKRMlWEOPSz+Jbws=;
        b=i+K3F/+kq4bILLFDqdNubCShzdw13HIPvfg9E1Ob67Gk4oCRogpDBkcrpL6OBT
        vntWLspcmRGx4v/ykzF/TZOInprZ+z/dNptR0R6W1sSraIWHKzGIHPtpiitHFeuL
        Jh+CnctLsn4bxNklAFGKRq53hTV3t8vTRK8vfND2cNQxA=
Received: from ubuntu.localdomain (unknown [220.180.239.201])
        by zwqz-smtp-mta-g3-1 (Coremail) with SMTP id _____wCH3B3cdJ5kf2foBA--.62394S2;
        Fri, 30 Jun 2023 14:23:27 +0800 (CST)
From:   =?UTF-8?q?Duke=20Xin=28=E8=BE=9B=E5=AE=89=E6=96=87=29?= 
        <duke_xinanwen@163.com>
To:     mani@kernel.org, loic.poulain@linaro.org, slark_xiao@163.com
Cc:     fabio.porcedda@gmail.com, koen.vandeputte@citymesh.com,
        song.fc@gmail.com, bhelgaas@google.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, jerry.meng@quectel.com,
        duke.xin@quectel.com,
        =?UTF-8?q?Duke=20Xin=28=E8=BE=9B=E5=AE=89=E6=96=87=29?= 
        <duke_xinanwen@163.com>
Subject: [PATCH v6] bus: mhi: host: pci_generic: Add support for Quectel RM520N-GL modem
Date:   Thu, 29 Jun 2023 23:23:18 -0700
Message-Id: <20230630062318.12114-1-duke_xinanwen@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCH3B3cdJ5kf2foBA--.62394S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7KryrGw48tr1Utw45KFyDKFg_yoW8tr43pF
        4F9rWIvF4vqFWSy3s7G34kCFn5Wa13uryUKF13Gw10qr4qyw4Fqryv9r1YvF4jvFZ5W3WS
        vF15Jr90g3WqyFUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRleH3UUUUU=
X-Originating-IP: [220.180.239.201]
X-CM-SenderInfo: 5gxnvsp0lqt0xzhqqiywtou0bp/xtbBFQGee2B9nOydugAAs7
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_BL,RCVD_IN_MSPIKE_L3,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add MHI interface definition for RM520 product based on Qualcomm SDX6X chip

Signed-off-by: Duke Xin(辛安文) <duke_xinanwen@163.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
Changelog

v5 -> v6

* Update commit message to include the changelog and reviewd tag.

v4 -> v5

* Add patch CC to mhi@lists.linux.dev.

v3 -> v4

* Limit character length to 75 characters and adjusted "project" description to "product".

v2 -> v3

* Sorted add rm520 id in mhi_pci_id_table and modify commit message.

v1 -> v2

* Use [modem_quectel_em1xx_config] compatible instead of duplicating the configuration.
---
 drivers/bus/mhi/host/pci_generic.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 70e37c490150..1e7caa62f114 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -352,6 +352,16 @@ static const struct mhi_pci_dev_info mhi_quectel_em1xx_info = {
 	.sideband_wake = true,
 };
 
+static const struct mhi_pci_dev_info mhi_quectel_rm5xx_info = {
+	.name = "quectel-rm5xx",
+	.edl = "qcom/prog_firehose_sdx6x.elf",
+	.config = &modem_quectel_em1xx_config,
+	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
+	.dma_data_width = 32,
+	.mru_default = 32768,
+	.sideband_wake = true,
+};
+
 static const struct mhi_channel_config mhi_foxconn_sdx55_channels[] = {
 	MHI_CHANNEL_CONFIG_UL(0, "LOOPBACK", 32, 0),
 	MHI_CHANNEL_CONFIG_DL(1, "LOOPBACK", 32, 0),
@@ -591,6 +601,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
 		.driver_data = (kernel_ulong_t) &mhi_quectel_em1xx_info },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QUECTEL, 0x1002), /* EM160R-GL (sdx24) */
 		.driver_data = (kernel_ulong_t) &mhi_quectel_em1xx_info },
+	/* RM520N-GL (sdx6x), eSIM */
+	{ PCI_DEVICE(PCI_VENDOR_ID_QUECTEL, 0x1004),
+		.driver_data = (kernel_ulong_t) &mhi_quectel_rm5xx_info },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QUECTEL, 0x2001), /* EM120R-GL for FCCL (sdx24) */
 		.driver_data = (kernel_ulong_t) &mhi_quectel_em1xx_info },
 	/* T99W175 (sdx55), Both for eSIM and Non-eSIM */
-- 
2.25.1

