Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E7843828D9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 May 2021 11:54:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230157AbhEQJzo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 May 2021 05:55:44 -0400
Received: from mail-m972.mail.163.com ([123.126.97.2]:55192 "EHLO
        mail-m972.mail.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229474AbhEQJzo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 May 2021 05:55:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=QcAgy
        SaWC8DBmwtZa4v/kTfz8gjW0AhnQxlrhSqSjCM=; b=BYIXtf8cacLLAymc3D2AK
        XKwPf+DkOG9lKZt7UaGFC0MtqfuMt5VwISUIe3x0mGbRFW8tXyB4GL3T0TV4V74s
        G6ffQkM9C8+vVCePpo2f7KJmZFlEt7hwl641oNcHZIAZv8jbujLbBsqEHEKDuPdN
        4NO4/itNQ0qhooQAhMab+E=
Received: from localhost.localdomain (unknown [211.94.251.182])
        by smtp2 (Coremail) with SMTP id GtxpCgBn7MRJPaJgcBKNBQ--.921S2;
        Mon, 17 May 2021 17:54:18 +0800 (CST)
From:   Shujun Wang <wsj20369@163.com>
To:     mani@kernel.org, hemantk@codeaurora.org, loic.poulain@linaro.org,
        jarvis.w.jiang@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Shujun Wang <wsj20369@163.com>
Subject: [PATCH RESEND,v2] bus: mhi: pci_generic: T99W175: update channel name from AT to DUN
Date:   Mon, 17 May 2021 17:54:15 +0800
Message-Id: <20210517095415.3626-1-wsj20369@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: GtxpCgBn7MRJPaJgcBKNBQ--.921S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tr43Gw15Gw4Dur4kGF45ZFb_yoW8Gw4xpF
        4I93yYyrnYy345XFy8A34kKF90g3Z7X3yDtr1DC340qrn5Aw1qqrW8K34IgFn09F92vF4F
        yrnIqFyfAF1UA3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07b1a93UUUUU=
X-Originating-IP: [211.94.251.182]
X-CM-SenderInfo: hzvmjiqtwzqiywtou0bp/1tbiTAuVF1SInnZMDgAAsz
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jarvis Jiang <jarvis.w.jiang@gmail.com>

According to MHI v1.1 specification, change the channel name of T99W175
from "AT" to "DUN" (Dial-up networking) for both channel 32 and 33,
so that the channels can be bound to the Qcom WWAN control driver, and
device node such as /dev/wwan0p3AT will be generated, which is very useful
for debugging modem

Fixes: aac426562f56 ("bus: mhi: pci_generic: Introduce Foxconn T99W175 support")
Signed-off-by: Jarvis Jiang <jarvis.w.jiang@gmail.com>
Signed-off-by: Shujun Wang <wsj20369@163.com>
---

v2: Add: Fixes: aac426562f56

 drivers/bus/mhi/pci_generic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index 7c810f02a2ef..8c7f6576e421 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -311,8 +311,8 @@ static const struct mhi_channel_config mhi_foxconn_sdx55_channels[] = {
 	MHI_CHANNEL_CONFIG_DL(5, "DIAG", 32, 1),
 	MHI_CHANNEL_CONFIG_UL(12, "MBIM", 32, 0),
 	MHI_CHANNEL_CONFIG_DL(13, "MBIM", 32, 0),
-	MHI_CHANNEL_CONFIG_UL(32, "AT", 32, 0),
-	MHI_CHANNEL_CONFIG_DL(33, "AT", 32, 0),
+	MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
+	MHI_CHANNEL_CONFIG_DL(33, "DUN", 32, 0),
 	MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0_MBIM", 128, 2),
 	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0_MBIM", 128, 3),
 };
-- 
2.25.1

