Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB89D76617B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jul 2023 03:48:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232552AbjG1BsF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Jul 2023 21:48:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232517AbjG1Br5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Jul 2023 21:47:57 -0400
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id AB6BFF2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jul 2023 18:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version:
        Content-Type; bh=L7KPycqqZvvt5Po5/qx4gXmbeJK82Cr7UFEfDRUG2jA=;
        b=gBbG28mmErIhrbwPwVYJMK62kc840VDRSPKYR9hwiP1kgjzl43hlXEc9meqodm
        dy6OFIkhmuS++tXZfCdq3Ey9da4ITy3tBbNhS3f8/Oa8PvxfEAPuNgN+AD0XUG1T
        Uoe74+Ab0RATpPRVXpNURokGoiyax3blAA5UNGouSOXrw=
Received: from ubuntu.localdomain (unknown [220.180.239.201])
        by zwqz-smtp-mta-g2-0 (Coremail) with SMTP id _____wBn1SkaHsNk6Wv4BQ--.61399S2;
        Fri, 28 Jul 2023 09:47:08 +0800 (CST)
From:   =?UTF-8?q?Duke=20Xin=28=E8=BE=9B=E5=AE=89=E6=96=87=29?= 
        <duke_xinanwen@163.com>
To:     mani@kernel.org, loic.poulain@linaro.org, slark_xiao@163.com
Cc:     fabio.porcedda@gmail.com, koen.vandeputte@citymesh.com,
        bhelgaas@google.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, jerry.meng@quectel.com,
        duke.xin@quectel.com,
        =?UTF-8?q?Duke=20Xin=28=E8=BE=9B=E5=AE=89=E6=96=87=29?= 
        <duke_xinanwen@163.com>
Subject: [PATCH] bus: mhi: host: pci_generic: Add support for Lenovo RM520N-GL
Date:   Thu, 27 Jul 2023 18:47:02 -0700
Message-Id: <20230728014702.25775-1-duke_xinanwen@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wBn1SkaHsNk6Wv4BQ--.61399S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtFW5AFWUXFyruFyUCrWxJFb_yoWkKFb_Cr
        Z3WrsxCrnxWrnFvw40gw15Z34jk3WxXF1kGF1IqrZ5Jw17CrZ5Xan3Zr97A3Za93yF9F98
        A3y5W34Fyw12yjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRRrgWDUUUUU==
X-Originating-IP: [220.180.239.201]
X-CM-SenderInfo: 5gxnvsp0lqt0xzhqqiywtou0bp/1tbiVwS6e1etrwuj3QAAsy
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

This modem is designed based on Qualcomm SDX6x and it will align with the quectel previous RM520N-GL modem settings.
But this one is designed for lenovo laptop usecase, hence Quectel got a new PID.

Signed-off-by: Duke Xin(辛安文) <duke_xinanwen@163.com>
---
 drivers/bus/mhi/host/pci_generic.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index fcd80bc92978..e4f2fb67dfaf 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -604,6 +604,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
 	/* RM520N-GL (sdx6x), eSIM */
 	{ PCI_DEVICE(PCI_VENDOR_ID_QUECTEL, 0x1004),
 		.driver_data = (kernel_ulong_t) &mhi_quectel_rm5xx_info },
+	/* RM520N-GL (sdx6x), Lenovo variant */
+	{ PCI_DEVICE(PCI_VENDOR_ID_QUECTEL, 0x1007),
+		.driver_data = (kernel_ulong_t) &mhi_quectel_rm5xx_info },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QUECTEL, 0x100d), /* EM160R-GL (sdx24) */
 		.driver_data = (kernel_ulong_t) &mhi_quectel_em1xx_info },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QUECTEL, 0x2001), /* EM120R-GL for FCCL (sdx24) */
-- 
2.25.1

