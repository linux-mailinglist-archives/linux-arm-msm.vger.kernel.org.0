Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40B90723FD7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jun 2023 12:42:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236713AbjFFKmi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Jun 2023 06:42:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236775AbjFFKmD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Jun 2023 06:42:03 -0400
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 85C6710E7
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jun 2023 03:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version:
        Content-Type; bh=qyXtGWS1mywUlTqnAaOv5Fx0KyUBRe3RE3M3xbQ/fOk=;
        b=p2WOJPcCZmK/EWQWypbkJrQQKoMO3qKGOaueeMvWejtExJI3wnxP3BoKkFg/6X
        8NLqsJCRsnQRE19LvCv0XpAChfpNgKwgpWU9AYciWNwCcFYvNbscPlkCCkXbBm5m
        Gu6K/a2h1S8+36v7hym0fS81ZIjvlKqhZDtmu4EOgozv8=
Received: from ubuntu.localdomain (unknown [220.180.239.55])
        by zwqz-smtp-mta-g5-0 (Coremail) with SMTP id _____wCXU5nnDH9k6S94Bg--.15940S2;
        Tue, 06 Jun 2023 18:39:38 +0800 (CST)
From:   =?UTF-8?q?Duke=20Xin=28=E8=BE=9B=E5=AE=89=E6=96=87=29?= 
        <duke_xinanwen@163.com>
To:     mani@kernel.org, loic.poulain@linaro.org, slark_xiao@163.com
Cc:     fabio.porcedda@gmail.com, koen.vandeputte@citymesh.com,
        quic_jhugo@quicinc.com, johan+linaro@kernel.org,
        bhelgaas@google.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, jerry.meng@quectel.com,
        duke.xin@quectel.com,
        =?UTF-8?q?Duke=20Xin=28=E8=BE=9B=E5=AE=89=E6=96=87=29?= 
        <duke_xinanwen@163.com>
Subject: [PATCH v6] bus: mhi: host: pci_generic: Add support for Quectel RM520N-GL modem
Date:   Tue,  6 Jun 2023 03:39:32 -0700
Message-Id: <20230606103932.2790-1-duke_xinanwen@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCXU5nnDH9k6S94Bg--.15940S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tF47Jr17tr1kJFykZry7Wrg_yoW8Ary5pF
        4F9rW0vF4qvrWay397C34DGFn5ua13ury7KF9rCw1IqF1qy3yFqryv9Fy2vF4jva95XFW3
        tF1rJr90g3WqyFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JU1RR_UUUUU=
X-Originating-IP: [220.180.239.55]
X-CM-SenderInfo: 5gxnvsp0lqt0xzhqqiywtou0bp/1tbiVwyGe1etrLNHOwAAs-
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_BL,RCVD_IN_MSPIKE_L4,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add MHI interface definition for RM520 product based on Qualcomm SDX6X chip

Signed-off-by: Duke Xin(辛安文) <duke_xinanwen@163.com>
---
 drivers/bus/mhi/host/pci_generic.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index db0a0b062d8e..69be969672f1 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -334,6 +334,16 @@ static const struct mhi_pci_dev_info mhi_quectel_em1xx_info = {
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
@@ -573,6 +583,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
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

