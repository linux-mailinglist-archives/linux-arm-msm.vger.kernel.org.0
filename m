Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 434F572408A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jun 2023 13:10:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229827AbjFFLKf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Jun 2023 07:10:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232135AbjFFLKF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Jun 2023 07:10:05 -0400
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1EB5810C0
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jun 2023 04:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version:
        Content-Type; bh=mTYVFTdCgtId0He4kEdt9FqXajE45fLgY4PNb3H8OUY=;
        b=LjAsG4DcbrYiLh94C33/+PzzyqydlzTUL0hG7uKRsUgfVcYzTLF2FAma4WkEzu
        vIM48kWQ45BovHRAZiRBVSqXCAtLBeAzYHlJUUUeBe++lCuHUhgN4J0H5rJHbwCW
        JHImBV3DREv85MHEWMz5+2WdU9j+h9TrCU0WrTq8ZVusY=
Received: from ubuntu.localdomain (unknown [220.180.239.55])
        by zwqz-smtp-mta-g4-4 (Coremail) with SMTP id _____wDHc0SzE39kxqqXBg--.28631S2;
        Tue, 06 Jun 2023 19:08:38 +0800 (CST)
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
Subject: [PATCH v3] bus: mhi: host: pci_generic: Add support for quectel's new EM160R-GL product
Date:   Tue,  6 Jun 2023 04:08:29 -0700
Message-Id: <20230606110829.6159-1-duke_xinanwen@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDHc0SzE39kxqqXBg--.28631S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtw47Gry7Zw4fAw48tF1fZwb_yoWDKFg_Cr
        Z3XrsxCwnxGr1qqw10gw47A34akF1xXF1vqa4xtrZ5CwnrGrZ5Xws3ZF9Fk3ZY93y5AFyD
        ArW7W3sYywn2yjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRM_-PUUUUUU==
X-Originating-IP: [220.180.239.55]
X-CM-SenderInfo: 5gxnvsp0lqt0xzhqqiywtou0bp/1tbiyBeGe1p7KmVtCgAAsr
X-Spam-Status: No, score=-0.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_BL,RCVD_IN_MSPIKE_L4,
        RCVD_IN_VALIDITY_RPBL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The product's would use the same config as previous EM160R-GL

Signed-off-by: Duke Xin(辛安文) <duke_xinanwen@163.com>
---
 drivers/bus/mhi/host/pci_generic.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index db0a0b062d8e..adfda57f14cf 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -573,6 +573,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
 		.driver_data = (kernel_ulong_t) &mhi_quectel_em1xx_info },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QUECTEL, 0x1002), /* EM160R-GL (sdx24) */
 		.driver_data = (kernel_ulong_t) &mhi_quectel_em1xx_info },
+	/* EM160R-GL (sdx24) */
+	{ PCI_DEVICE(PCI_VENDOR_ID_QUECTEL, 0x100d),
+		.driver_data = (kernel_ulong_t) &mhi_quectel_em1xx_info },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QUECTEL, 0x2001), /* EM120R-GL for FCCL (sdx24) */
 		.driver_data = (kernel_ulong_t) &mhi_quectel_em1xx_info },
 	/* T99W175 (sdx55), Both for eSIM and Non-eSIM */
-- 
2.25.1

