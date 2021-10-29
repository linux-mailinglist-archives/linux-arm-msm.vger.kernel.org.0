Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5951543FB2A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Oct 2021 13:04:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231815AbhJ2LHG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Oct 2021 07:07:06 -0400
Received: from mail-m975.mail.163.com ([123.126.97.5]:34582 "EHLO
        mail-m975.mail.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231740AbhJ2LHG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Oct 2021 07:07:06 -0400
X-Greylist: delayed 906 seconds by postgrey-1.27 at vger.kernel.org; Fri, 29 Oct 2021 07:07:05 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=JYyGR
        LNKi017QibCH1siUqmU3fuMg/foUal9bxN55gk=; b=PpUuuOtSzUpptyNYH6ZHf
        pvGyXVrl4tuZ0lze87GSYxj+hsPnvKCxZw9ocsj5y1DsDKbZWZym/hKis2cFErdD
        ILyUliaZrEhs+VSh5u/6CcSn0tBXBhrQ9Xv33lW0Zj7mQGJ7jrUEj+HeTDNwtw3c
        HREIX/CcCU8MHPK0UBYKC8=
Received: from localhost.localdomain (unknown [112.97.56.167])
        by smtp5 (Coremail) with SMTP id HdxpCgC3xcix0Xth4N8vHg--.5208S2;
        Fri, 29 Oct 2021 18:49:22 +0800 (CST)
From:   Slark Xiao <slark_xiao@163.com>
To:     mani@kernel.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Slark Xiao <slark_xiao@163.com>
Subject: [PATCH v2] bus: mhi: pci_generic: Add new device ID support for T99W175
Date:   Fri, 29 Oct 2021 18:49:18 +0800
Message-Id: <20211029104918.3976-1-slark_xiao@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: HdxpCgC3xcix0Xth4N8vHg--.5208S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7CFWfAry5tF4fXryftr17GFg_yoW8XF4xpF
        4SgFWakF4kZF15KFykKw4kZFy5ua17Zry3KF17Cw1YgrnrAayFgwn7Gr1fWayUtFZYqF1a
        qr1jvryjq3WqkaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j8xhdUUUUU=
X-Originating-IP: [112.97.56.167]
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/xtbBrRI7ZF75cI5TvQAAsX
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add new device ID 0xe0bf for T99W175.
This device ID is created because it is using Qualcomm SDX55 new base line.

Test evidence as below:
root@jbd-ThinkPad-P1-Gen-4:/dev# lspci -nn | grep Foxconn
0000:08:00.0 Wireless controller [0d40]: Foxconn International, Inc. Device [105b:e0bf]
root@jbd-ThinkPad-P1-Gen-4:/dev# cat wwan0at0 & echo -ne "ati\r" > wwan0at0
[2] 2977
root@jbd-ThinkPad-P1-Gen-4:/dev# ati
Manufacturer: Qualcomm
Model: T99W175
Revision: T99W175.F0.6.0.0.6.CC.005  1  [Oct 21 2021 10:00:00]
IMEI:
+GCAP: +CGSM

OK

Signed-off-by: Slark Xiao <slark_xiao@163.com>
---

v2: Add descriptions about the dfiiference between 0xe0ab and 0xeobf.
---
 drivers/bus/mhi/pci_generic.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index 59a4896a8030..94d8aa9c2eae 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -423,6 +423,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
 	/* DW5930e (sdx55), Non-eSIM, It's also T99W175 */
 	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0b1),
 		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
+	/* T99W175 (sdx55), Based on Qualcomm new baseline */
+	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0bf),
+		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
 	/* MV31-W (Cinterion) */
 	{ PCI_DEVICE(0x1269, 0x00b3),
 		.driver_data = (kernel_ulong_t) &mhi_mv31_info },
-- 
2.25.1

