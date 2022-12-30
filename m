Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34B41659623
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Dec 2022 09:14:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234427AbiL3IOS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Dec 2022 03:14:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234095AbiL3IOQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Dec 2022 03:14:16 -0500
X-Greylist: delayed 937 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 30 Dec 2022 00:14:14 PST
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A0AC8193F3;
        Fri, 30 Dec 2022 00:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version:
        Content-Type; bh=E9HpHLqgjy0h2hyIEIGNv9NmMuTdVk+OKWwEi64Mkzk=;
        b=poW0W6/5D+k9/qIhEKN7tO71sWnWqOnMFRDjhRlySeF7ccZPec1xslZqpE1jZo
        55W3kxYlmI0dARItrhh4d0X6kRB41EiDM7piyImpHUN+DxvP0ll8bO3YjNQ3w7w4
        Fl8xi0vW1C8zgOptp8yjtSvDGh5iL1PaqFBgy7UxoGWqw=
Received: from ubuntu.localdomain (unknown [112.31.70.25])
        by zwqz-smtp-mta-g4-2 (Coremail) with SMTP id _____wD3LGT5ma5jfWdJAA--.30241S2;
        Fri, 30 Dec 2022 15:57:47 +0800 (CST)
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
Subject: [PATCH] bus: mhi: host: pci_generic: Add support for Quectel RM520N-GL modem
Date:   Thu, 29 Dec 2022 23:57:26 -0800
Message-Id: <20221230075726.122806-1-duke_xinanwen@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3LGT5ma5jfWdJAA--.30241S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxZFyDAr4DXw1DtF45ur4DJwb_yoW5Zw1rpF
        WxZrWFyrs2yw43X3yfA34DKas5Zw1fCr9rKrnrCw1Iq3Wvy3y8ZFW0g342qFWYvayvqF1f
        tF1rJr9xu3WDJrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEZXOZUUUUU=
X-Originating-IP: [112.31.70.25]
X-CM-SenderInfo: 5gxnvsp0lqt0xzhqqiywtou0bp/1tbivh3ne1Zcf+WpiAAAsO
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The project is based on Qualcomm's sdx6x chips for laptop,so the mhi interface definition and
enumeration align with previous Quectel sdx24 configuration

Signed-off-by: Duke Xin(辛安文) <duke_xinanwen@163.com>
---
 drivers/bus/mhi/host/pci_generic.c | 46 ++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index f39657f71483..83f40617af9a 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -335,6 +335,50 @@ static const struct mhi_pci_dev_info mhi_quectel_em1xx_info = {
 	.sideband_wake = true,
 };
 
+static const struct mhi_channel_config mhi_quectel_rm5xx_channels[] = {
+	MHI_CHANNEL_CONFIG_UL(0, "NMEA", 32, 0),
+	MHI_CHANNEL_CONFIG_DL(1, "NMEA", 32, 0),
+	MHI_CHANNEL_CONFIG_UL_SBL(2, "SAHARA", 32, 0),
+	MHI_CHANNEL_CONFIG_DL_SBL(3, "SAHARA", 32, 0),
+	MHI_CHANNEL_CONFIG_UL(4, "DIAG", 32, 1),
+	MHI_CHANNEL_CONFIG_DL(5, "DIAG", 32, 1),
+	MHI_CHANNEL_CONFIG_UL(12, "MBIM", 32, 0),
+	MHI_CHANNEL_CONFIG_DL(13, "MBIM", 32, 0),
+	MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
+	MHI_CHANNEL_CONFIG_DL(33, "DUN", 32, 0),
+	/* The EDL firmware is a flash-programmer exposing firehose protocol */
+	MHI_CHANNEL_CONFIG_UL_FP(34, "FIREHOSE", 32, 0),
+	MHI_CHANNEL_CONFIG_DL_FP(35, "FIREHOSE", 32, 0),
+	MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0_MBIM", 128, 2),
+	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0_MBIM", 128, 3),
+};
+
+static struct mhi_event_config mhi_quectel_rm5xx_events[] = {
+	MHI_EVENT_CONFIG_CTRL(0, 128),
+	MHI_EVENT_CONFIG_DATA(1, 128),
+	MHI_EVENT_CONFIG_HW_DATA(2, 1024, 100),
+	MHI_EVENT_CONFIG_HW_DATA(3, 1024, 101)
+};
+
+static const struct mhi_controller_config modem_quectel_rm5xx_config = {
+	.max_channels = 128,
+	.timeout_ms = 20000,
+	.num_channels = ARRAY_SIZE(mhi_quectel_rm5xx_channels),
+	.ch_cfg = mhi_quectel_rm5xx_channels,
+	.num_events = ARRAY_SIZE(mhi_quectel_rm5xx_events),
+	.event_cfg = mhi_quectel_rm5xx_events,
+};
+
+static const struct mhi_pci_dev_info mhi_quectel_rm5xx_info = {
+	.name = "quectel-rm5xx",
+	.edl = "qcom/prog_firehose_sdx6x.elf",
+	.config = &modem_quectel_rm5xx_config,
+	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
+	.dma_data_width = 32,
+	.mru_default = 32768,
+	.sideband_wake = true,
+};
+
 static const struct mhi_channel_config mhi_foxconn_sdx55_channels[] = {
 	MHI_CHANNEL_CONFIG_UL(0, "LOOPBACK", 32, 0),
 	MHI_CHANNEL_CONFIG_DL(1, "LOOPBACK", 32, 0),
@@ -569,6 +613,8 @@ static const struct pci_device_id mhi_pci_id_table[] = {
 		.driver_data = (kernel_ulong_t) &mhi_quectel_em1xx_info },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QUECTEL, 0x2001), /* EM120R-GL for FCCL (sdx24) */
 		.driver_data = (kernel_ulong_t) &mhi_quectel_em1xx_info },
+	{ PCI_DEVICE(PCI_VENDOR_ID_QUECTEL, 0x1004), /* RM520N-GL (sdx6x) */
+		.driver_data = (kernel_ulong_t) &mhi_quectel_rm5xx_info },
 	/* T99W175 (sdx55), Both for eSIM and Non-eSIM */
 	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0ab),
 		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
-- 
2.25.1

