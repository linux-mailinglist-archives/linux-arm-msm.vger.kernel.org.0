Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF14E447EEA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Nov 2021 12:31:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237860AbhKHLeX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Nov 2021 06:34:23 -0500
Received: from mail-m975.mail.163.com ([123.126.97.5]:32880 "EHLO
        mail-m975.mail.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237827AbhKHLeX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Nov 2021 06:34:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=L49DN
        1odcur1s+IvrPWjh1ERz+utZbxsieOkqObf7w0=; b=CncDmYxYqgFsq0Tu+TXKt
        Bt1J7BurpEupusHquZpNxFWh/cCnxpvWmQEK9QQOMLRaE8QtgsV3yXLdeXMhrwI9
        HFp5sKEYfZwJrBnHQjAJ77ckS2PNO0/YBDAHZdBfzQMP7mhSea60sepzp887ubM+
        JMQGGSeiwJrXbTooRPsiLg=
Received: from localhost.localdomain (unknown [112.97.56.72])
        by smtp5 (Coremail) with SMTP id HdxpCgCXS_mRColhfHpdIw--.24226S2;
        Mon, 08 Nov 2021 19:31:30 +0800 (CST)
From:   Slark Xiao <slark_xiao@163.com>
To:     mani@kernel.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Slark Xiao <slark_xiao@163.com>
Subject: [PATCH] bus: mhi: pci_generic: Fix device recovery failed issue
Date:   Mon,  8 Nov 2021 19:31:27 +0800
Message-Id: <20211108113127.3938-1-slark_xiao@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: HdxpCgCXS_mRColhfHpdIw--.24226S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxZFWfJFyfJF1xKw17Ary5Arb_yoWrJrW3pF
        10gayjkr4rA3yjya1DJw4rCF1jkasxJrWUWrs3Kw1Dt3WxJ34q93s0gF45u3s0kr97Xa4F
        vw1qyrWvqF1UtaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UKeHkUUUUU=
X-Originating-IP: [112.97.56.72]
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/xtbBDRNFZFaEFz17swAAsP
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

  For Foxconn T99W175 device(sdx55 platform) in some host
platform, it would be unavailable once the host execute
 the err handler.
 After checking, it's caused by the delay time too short to
get a successful reset.

  Please see my test evidence as bewlow(BTW, I add some
extra test logs in function mhi_pci_reset_prepare and
mhi_pci_reset_done):
  When MHI_POST_RESET_DELAY_MS equals to 500ms:
   Nov  4 14:30:03 jbd-ThinkEdge kernel: [  146.222477] mhi mhi0: Device MHI is not in valid state
   Nov  4 14:30:03 jbd-ThinkEdge kernel: [  146.222628] mhi-pci-generic 0000:2d:00.0: mhi_pci_reset_prepare reset
   Nov  4 14:30:03 jbd-ThinkEdge kernel: [  146.222631] mhi-pci-generic 0000:2d:00.0: mhi_pci_reset_prepare mhi_soc_reset
   Nov  4 14:30:03 jbd-ThinkEdge kernel: [  146.222632] mhi mhi0:  mhi_soc_reset write soc to reset
   Nov  4 14:30:05 jbd-ThinkEdge kernel: [  147.839993] mhi-pci-generic 0000:2d:00.0: mhi_pci_reset_done
   Nov  4 14:30:05 jbd-ThinkEdge kernel: [  147.902063] mhi-pci-generic 0000:2d:00.0: reset failed

  When MHI_POST_RESET_DELAY_MS equals to 1000ms or 1500ms:
   Nov  4 19:07:26 jbd-ThinkEdge kernel: [  157.067857] mhi mhi0: Device MHI is not in valid state
   Nov  4 19:07:26 jbd-ThinkEdge kernel: [  157.068029] mhi-pci-generic 0000:2d:00.0: mhi_pci_reset_prepare reset
   Nov  4 19:07:26 jbd-ThinkEdge kernel: [  157.068032] mhi-pci-generic 0000:2d:00.0: mhi_pci_reset_prepare mhi_soc_reset
   Nov  4 19:07:26 jbd-ThinkEdge kernel: [  157.068034] mhi mhi0:  mhi_soc_reset write soc to reset
   Nov  4 19:07:29 jbd-ThinkEdge kernel: [  159.607006] mhi-pci-generic 0000:2d:00.0: mhi_pci_reset_done
   Nov  4 19:07:29 jbd-ThinkEdge kernel: [  159.607152] mhi mhi0: Requested to power ON
   Nov  4 19:07:51 jbd-ThinkEdge kernel: [  181.302872] mhi mhi0: Failed to reset MHI due to syserr state
   Nov  4 19:07:51 jbd-ThinkEdge kernel: [  181.303011] mhi-pci-generic 0000:2d:00.0: failed to power up MHI controller

  When MHI_POST_RESET_DELAY_MS equals to 2000ms:
   Nov  4 17:51:08 jbd-ThinkEdge kernel: [  147.180527] mhi mhi0: Failed to transition from PM state: Linkdown or Error Fatal Detect to: SYS ERROR Process
   Nov  4 17:51:08 jbd-ThinkEdge kernel: [  147.180535] mhi mhi0: Device MHI is not in valid state
   Nov  4 17:51:08 jbd-ThinkEdge kernel: [  147.180722] mhi-pci-generic 0000:2d:00.0: mhi_pci_reset_prepare reset
   Nov  4 17:51:08 jbd-ThinkEdge kernel: [  147.180725] mhi-pci-generic 0000:2d:00.0: mhi_pci_reset_prepare mhi_soc_reset
   Nov  4 17:51:08 jbd-ThinkEdge kernel: [  147.180727] mhi mhi0:  mhi_soc_reset write soc to reset
   Nov  4 17:51:11 jbd-ThinkEdge kernel: [  150.230787] mhi-pci-generic 0000:2d:00.0: mhi_pci_reset_done
   Nov  4 17:51:11 jbd-ThinkEdge kernel: [  150.230928] mhi mhi0: Requested to power ON
   Nov  4 17:51:11 jbd-ThinkEdge kernel: [  150.231173] mhi mhi0: Power on setup success
   Nov  4 17:51:14 jbd-ThinkEdge kernel: [  153.254747] mhi mhi0: Wait for device to enter SBL or Mission mode

  I also tried big data like 3000, and it worked as well.
  500ms may not be enough for all support mhi device. We shall
increase it to 2000ms at least.

Signed-off-by: Slark Xiao <slark_xiao@163.com>
---
 drivers/bus/mhi/pci_generic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index 59a4896a8030..4c577a731709 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -20,7 +20,7 @@
 
 #define MHI_PCI_DEFAULT_BAR_NUM 0
 
-#define MHI_POST_RESET_DELAY_MS 500
+#define MHI_POST_RESET_DELAY_MS 2000
 
 #define HEALTH_CHECK_PERIOD (HZ * 2)
 
-- 
2.25.1

