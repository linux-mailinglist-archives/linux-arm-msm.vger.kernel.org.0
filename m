Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65A4367F42F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Jan 2023 04:04:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229681AbjA1DEz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Jan 2023 22:04:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231975AbjA1DEy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Jan 2023 22:04:54 -0500
X-Greylist: delayed 941 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 27 Jan 2023 19:04:52 PST
Received: from m12.mail.163.com (m12.mail.163.com [123.126.96.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3B2967264D
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jan 2023 19:04:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version:
        Content-Type; bh=z4JngmKmsUiT6Go8w637Ajw0YEGtBAe0+3wXDZzMYvg=;
        b=kVuso8PSwtcAuQ2ZHvxkpAdJpB13oJnDQ30kpcUR2cgTS1r44qWR0c2jvymaUe
        xZh9VKeH7XHjtIoniXIjHcmuTuNtNHx8tjt3Hz41r5urW6u36uZ6E5Ngzj3KCRAh
        UHQOZMefaRF8g2tC0JMIqY0LXSvmEvC2Sb6Bk2RweN8+o=
Received: from ubuntu.localdomain (unknown [220.180.239.55])
        by smtp19 (Coremail) with SMTP id R9xpCgDHwKTgjNRjTovaBw--.8240S2;
        Sat, 28 Jan 2023 10:48:03 +0800 (CST)
From:   =?UTF-8?q?Duke=20Xin=28=E8=BE=9B=E5=AE=89=E6=96=87=29?= 
        <duke_xinanwen@163.com>
To:     mani@kernel.org, slark_xiao@163.com
Cc:     loic.poulain@linaro.org, gregkh@linuxfoundation.org,
        dnlplm@gmail.com, yonglin.tan@outlook.com,
        fabio.porcedda@gmail.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, inux-kernel@vger.kernel.org,
        jerry.meng@quectel.com, duke.xin@quectel.com,
        =?UTF-8?q?Duke=20Xin=28=E8=BE=9B=E5=AE=89=E6=96=87=29?= 
        <duke_xinanwen@163.com>
Subject: [PATCH v3] bus: mhi: host: pci_generic: Add support for Quectel RM520N-GL modem
Date:   Fri, 27 Jan 2023 18:47:54 -0800
Message-Id: <20230128024754.2562-1-duke_xinanwen@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: R9xpCgDHwKTgjNRjTovaBw--.8240S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tF1DtryfWr1kuw48KFy8Zrb_yoW8AFWfpF
        45ZrWIvF4ktFW5ta97A34DGFn5Wwsxury7KFnrG34IgF1qy3yYqryvgF12vF4Y9a95XF13
        tFyrJr9Ig3WqkFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUn_-gUUUUU=
X-Originating-IP: [220.180.239.55]
X-CM-SenderInfo: 5gxnvsp0lqt0xzhqqiywtou0bp/1tbiPRQFe2I0VCdKYAABsZ
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The project is based on Qualcomm's sdx6x chips for laptop,so the mhi interface definition and
enumeration align with previous Quectel sdx24 configuration

Signed-off-by: Duke Xin(辛安文) <duke_xinanwen@163.com>
---
 drivers/bus/mhi/host/pci_generic.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index f39657f71483..416dabe2c282 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -335,6 +335,16 @@ static const struct mhi_pci_dev_info mhi_quectel_em1xx_info = {
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
@@ -569,6 +579,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
 		.driver_data = (kernel_ulong_t) &mhi_quectel_em1xx_info },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QUECTEL, 0x2001), /* EM120R-GL for FCCL (sdx24) */
 		.driver_data = (kernel_ulong_t) &mhi_quectel_em1xx_info },
+	/* RM520N-GL (sdx6x), eSIM Project */
+	{ PCI_DEVICE(PCI_VENDOR_ID_QUECTEL, 0x1004),
+		.driver_data = (kernel_ulong_t) &mhi_quectel_rm5xx_info },
 	/* T99W175 (sdx55), Both for eSIM and Non-eSIM */
 	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0ab),
 		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
-- 
2.25.1

