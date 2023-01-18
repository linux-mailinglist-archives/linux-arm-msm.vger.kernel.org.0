Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7ADCB670FD3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 02:18:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229546AbjARBSC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 20:18:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229603AbjARBRc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 20:17:32 -0500
Received: from m12.mail.163.com (m12.mail.163.com [123.126.96.234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id EB00F402FC;
        Tue, 17 Jan 2023 17:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version:
        Content-Type; bh=wHR6WJBFmvZX+Tk029gO+FLBAgU+NQvxJY0m7yagDHs=;
        b=Kqo6u2MdhVq6a0dZOZKttX6druSg1jGr2Z56i0oO1pbYUOz/vjPCURR4mM2OhJ
        Y27tBEa/9Q9ZtjBPKAg+rFynCNa+eYMK9iX2t0+kBW2Nucs28xdMS5vVipMwwpuS
        OyNjlYZTu97NtyRXkiDZiARdVjqMLyeKaXeQex/LjKg1w=
Received: from ubuntu.localdomain (unknown [112.31.70.25])
        by smtp19 (Coremail) with SMTP id R9xpCgDHpPmER8djwoc7Aw--.60229S2;
        Wed, 18 Jan 2023 09:12:38 +0800 (CST)
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
Subject: [PATCH v2] bus: mhi: host: pci_generic: Add support for Quectel RM520N-GL modem
Date:   Tue, 17 Jan 2023 17:12:30 -0800
Message-Id: <20230118011230.25847-1-duke_xinanwen@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: R9xpCgDHpPmER8djwoc7Aw--.60229S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tF1DtryfWr1kuw48KFy8Zrb_yoW8AFyrpF
        4YvrWIvF4ktFW5ta97A34DGFn5uwsxury7KFnrG34IgF4qyayYqryv9F12vF4a9a95XF13
        tFyrJr9xK3WqyFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEZ2adUUUUU=
X-Originating-IP: [112.31.70.25]
X-CM-SenderInfo: 5gxnvsp0lqt0xzhqqiywtou0bp/1tbiPQf6e2I0U+dVtAAAs4
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
 drivers/bus/mhi/host/pci_generic.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index f39657f71483..e1d697839535 100644
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
@@ -569,6 +579,8 @@ static const struct pci_device_id mhi_pci_id_table[] = {
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

