Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03FE27718AD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Aug 2023 05:05:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229499AbjHGDFp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 6 Aug 2023 23:05:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjHGDFp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 6 Aug 2023 23:05:45 -0400
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 476C1BA
        for <linux-arm-msm@vger.kernel.org>; Sun,  6 Aug 2023 20:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version:
        Content-Type; bh=g3ecp61wnfg/vQjhC4VC12IwfZdDXqEOZSJ2iCuEPXU=;
        b=L/wn+QtAdghGEffnkBGCA2K/hV1vPM58HbFxcJkV3e9AD174ywZTUcEVbqJpV/
        R6KEKcQ2RXHug1d/Gcvwy5DXhyLJvi4t37K0v02YL09/eoIAhO5tmo1rm12vZ6OW
        JN0sRl7jfMUXAEgQX4SvLbBUZv8I9HJvO9q0/XkrPaXAg=
Received: from ubuntu.localdomain (unknown [220.180.239.201])
        by zwqz-smtp-mta-g2-0 (Coremail) with SMTP id _____wA3pSlXX9BkizWcCQ--.22796S2;
        Mon, 07 Aug 2023 11:04:58 +0800 (CST)
From:   =?UTF-8?q?Duke=20Xin=28=E8=BE=9B=E5=AE=89=E6=96=87=29?= 
        <duke_xinanwen@163.com>
To:     mani@kernel.org, loic.poulain@linaro.org, slark_xiao@163.com
Cc:     fabio.porcedda@gmail.com, johan+linaro@kernel.org,
        bhelgaas@google.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, jerry.meng@quectel.com,
        duke.xin@quectel.com,
        =?UTF-8?q?Duke=20Xin=28=E8=BE=9B=E5=AE=89=E6=96=87=29?= 
        <duke_xinanwen@163.com>
Subject: [PATCH v2] bus: mhi: host: pci_generic: Add support for Lenovo RM520N-GL
Date:   Sun,  6 Aug 2023 20:04:54 -0700
Message-Id: <20230807030454.37255-1-duke_xinanwen@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wA3pSlXX9BkizWcCQ--.22796S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uryDWr1fCFWDWF48tFW7CFg_yoW8Gr43pF
        4F9340vF4qvrWjka4kGrWkWF98Xa17Cry7Kr17Cw1Fgr4qyFsYqr929FyF9F9FvFZ5WFya
        qF1rJrWDW3Wqy3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRJCzJUUUUU=
X-Originating-IP: [220.180.239.201]
X-CM-SenderInfo: 5gxnvsp0lqt0xzhqqiywtou0bp/1tbiPRbBe2I0X+eFwwABs4
X-Spam-Status: No, score=-0.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_BL,RCVD_IN_MSPIKE_L4,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Quectel new RM520N-GL product works with the Quectel's existing
RM520N-GL modem settings.But this one is designed for lenovo laptop
usecase, hence Quectel got a new PID.

Signed-off-by: Duke Xin(辛安文) <duke_xinanwen@163.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
Changelog

v1 -> v2

* Adjusted description of quectel modem and limit character length to 75 characters.
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

