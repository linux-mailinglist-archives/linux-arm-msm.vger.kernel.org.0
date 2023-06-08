Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70F43727B6F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jun 2023 11:31:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233955AbjFHJbq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Jun 2023 05:31:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232321AbjFHJbn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Jun 2023 05:31:43 -0400
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 50BFE2136
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jun 2023 02:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version:
        Content-Type; bh=cZS5E3IyUiBQ9Rw6k7iRxMnbafFWJgCjUmX+UlyMFn0=;
        b=o5ixhHlkV6s4C8oUvgweMdyxqHy6eKRVe4/BC9twlIjVOdAHNmjmBrn8rthf4s
        B1PeP2Tnkrulnzar8qeLX8xZ8a5CdQkWjwdUrE0xQIkg10DH7HjtcVUmhlQpjcpn
        K+NOUjnFL6EOltvzmbxWoWwKvdnOAXiCoGHFbd4qFaeG8=
Received: from ubuntu.localdomain (unknown [220.180.239.55])
        by zwqz-smtp-mta-g0-2 (Coremail) with SMTP id _____wBnbtp5n4FkCCZjBw--.17907S2;
        Thu, 08 Jun 2023 17:29:31 +0800 (CST)
From:   =?UTF-8?q?Duke=20Xin=28=E8=BE=9B=E5=AE=89=E6=96=87=29?= 
        <duke_xinanwen@163.com>
To:     mani@kernel.org, loic.poulain@linaro.org, slark_xiao@163.com
Cc:     fabio.porcedda@gmail.com, koen.vandeputte@citymesh.com,
        song.fc@gmail.com, bhelgaas@google.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, jerry.meng@quectel.com,
        duke.xin@quectel.com,
        =?UTF-8?q?Duke=20Xin=28=E8=BE=9B=E5=AE=89=E6=96=87=29?= 
        <duke_xinanwen@163.com>
Subject: [PATCH v4] bus: mhi: host: pci_generic: Add support for quectel's new EM160R-GL product
Date:   Thu,  8 Jun 2023 02:29:27 -0700
Message-Id: <20230608092927.2893-1-duke_xinanwen@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wBnbtp5n4FkCCZjBw--.17907S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7KryrGw48tr1UtFWxKr18AFb_yoW8Gr1kpF
        4F9340vF4qqFWjk34DW3y8AF98Xa17CFy7KwnxCw1Fqr4Dtr4Fqr929ryYk3WqgaykXF1a
        qF1rAryYg3Wj9FUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pR0zuAUUUUU=
X-Originating-IP: [220.180.239.55]
X-CM-SenderInfo: 5gxnvsp0lqt0xzhqqiywtou0bp/1tbivh2Ie1Zchl5BoQAAsi
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

The product's would use the same config as previous EM160R-GL

Signed-off-by: Duke Xin(辛安文) <duke_xinanwen@163.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
Changelog

v3 -> v4

* Update commit message to include the changelog and reviewd tag.

v2 -> v3

* Add patch CC to mhi@lists.linux.dev.

v1 -> v2

* Remove Space before */ and "for laptop" description.
---
 drivers/bus/mhi/host/pci_generic.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 70e37c490150..5f204b819e95 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -591,6 +591,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
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

