Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5B12333B74
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Mar 2021 12:31:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231696AbhCJLaf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Mar 2021 06:30:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232735AbhCJLaD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Mar 2021 06:30:03 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52234C06174A
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Mar 2021 03:29:56 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id n22so6887445wmc.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Mar 2021 03:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=/bhWoPiGy1P6sOdpSnQcWMITpyete28UGsPz1h+/i80=;
        b=UQ9B1CPVR8ZjfsaXVu+caNPNwoU7A9psRAL81WHFF4Gq2SC+6a9q5uUGLh0Gpm6meg
         3jFZgrFkvD9NZaeR5c2FlWH1NRv4G4slYUWb2y3IRfKhaLHS4f2ZoRRPfI7cTA64cyNb
         VXDCU58FPDzGQUkZfXnRd1ac/rs9SGhNfOOLM8hKn2UL/ECVZJLdiZDmSqsveKHysu8R
         o99Kz1TtxKAgnK3DRmZsN81BHPehQrxHSxuGQFc11r+n0GO3HKBsJwrsZn7dlFmopT59
         wjqaGX0mHbSR1Ksd6zGaaseljlU/HW+Zd0TFD6ObuqMILvP5Dq3aV42B3vasp9XF5ebn
         Djfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=/bhWoPiGy1P6sOdpSnQcWMITpyete28UGsPz1h+/i80=;
        b=mYMEIKF+6ID62085GdJyhyGLwLwLbXMv4nI8E4bHZk/TPHQfeaN8njxqA/HDawBABI
         fkpR/XCEYpHgm9oVMKAGS2E0WMPTogkEXqw9MmIZoQ/lNr0MMDTlhXGfhR+gW0tOdZ4v
         N42/o6HNXwGw2r0mFSUnoV7Sc4KpYSGec61bmve/sct6OAXd188d6BvozJ+zodmkDV1f
         NK3OMlk3+GtXt/WBUL1R1DFtxodG8dWNSXZ7boi0wuMvTHFpjMEvOz91pcRdpj7imIt0
         3K8ZlSH5IN/M7XSSon/yebN96nJNokdrfqyLbddz44hlFqpoYGHjM+XPdjhJUn1LRrJq
         biOQ==
X-Gm-Message-State: AOAM531PJRpANmGg4sr2yYqN540+KMk5gVSj6gvM4U53LoaUhXtYXXlQ
        cmCt6ZL0FAAOx6Q53xxyS5RgeA==
X-Google-Smtp-Source: ABdhPJzEC+z0SYiF+moDHo3czj/c1SoqMY575rMc+Tedm2hogiccluglOD/h9xCcOnqB7vnJP9xv4A==
X-Received: by 2002:a05:600c:4fd0:: with SMTP id o16mr2908624wmq.123.1615375794708;
        Wed, 10 Mar 2021 03:29:54 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:82c:5f0:46d1:ffa8:9938:224a])
        by smtp.gmail.com with ESMTPSA id o20sm8899888wmq.5.2021.03.10.03.29.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Mar 2021 03:29:53 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH] bus: mhi: Command completion workaround
Date:   Wed, 10 Mar 2021 12:38:28 +0100
Message-Id: <1615376308-1941-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some buggy hardwares (e.g sdx24) may report the current command
ring wp pointer instead of the command completion pointer. It's
obviously wrong, causing completion timeout. We can however deal
with that situation by completing the cmd n-1 element, which is
what the device actually completes.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/bus/mhi/core/main.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index 16b9640..3e3c520 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -707,6 +707,7 @@ static void mhi_process_cmd_completion(struct mhi_controller *mhi_cntrl,
 {
 	dma_addr_t ptr = MHI_TRE_GET_EV_PTR(tre);
 	struct mhi_cmd *cmd_ring = &mhi_cntrl->mhi_cmd[PRIMARY_CMD_RING];
+	struct device *dev = &mhi_cntrl->mhi_dev->dev;
 	struct mhi_ring *mhi_ring = &cmd_ring->ring;
 	struct mhi_tre *cmd_pkt;
 	struct mhi_chan *mhi_chan;
@@ -714,6 +715,23 @@ static void mhi_process_cmd_completion(struct mhi_controller *mhi_cntrl,
 
 	cmd_pkt = mhi_to_virtual(mhi_ring, ptr);
 
+	if (unlikely(cmd_pkt == mhi_ring->wp)) {
+		/* Some buggy hardwares (e.g sdx24) sometimes report the current
+		 * command ring wp pointer instead of the command completion
+		 * pointer. It's obviously wrong, causing completion timeout. We
+		 * can however deal with that situation by completing the cmd
+		 * n-1 element.
+		 */
+		void *ring_ptr = (void *)cmd_pkt - mhi_ring->el_size;
+
+		if (ring_ptr < mhi_ring->base)
+			ring_ptr += mhi_ring->len;
+
+		cmd_pkt = ring_ptr;
+
+		dev_warn(dev, "Bad completion pointer (ptr == ring_wp)\n");
+	}
+
 	chan = MHI_TRE_GET_CMD_CHID(cmd_pkt);
 	mhi_chan = &mhi_cntrl->mhi_chan[chan];
 	write_lock_bh(&mhi_chan->lock);
-- 
2.7.4

