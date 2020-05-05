Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F7991C6420
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2020 00:48:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729517AbgEEWrl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 May 2020 18:47:41 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:56627 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729332AbgEEWrk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 May 2020 18:47:40 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588718859; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=p7x9bPOAZ72ahqYQE5ScY6mzGnilCuQrGBBB0lSKv+o=; b=w/JiF2fTuJcghyi7AQO2YOqHWhMtODafwl3hb191f9yz3fOg5O4ARU7I3f3kod2JtCzf3qzF
 kH6jZT4U0GjDr82Kx2NYT2k/j4BtfRsV/yKfPNJreZX88DSwSsCTAw8I8QyLd0BtTcLzl6su
 w7leii+GpA5V+0Fy+bZKN8ZLZYo=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5eb1ecfc.7f608a92a500-smtp-out-n04;
 Tue, 05 May 2020 22:47:24 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6EE8DC433CB; Tue,  5 May 2020 22:47:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from bbhatt-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 94DE4C433F2;
        Tue,  5 May 2020 22:47:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 94DE4C433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     mani@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        hemantk@codeaurora.org, jhugo@codeaurora.org,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v6 8/8] bus: mhi: core: Ensure non-zero session or sequence ID values are used
Date:   Tue,  5 May 2020 15:47:12 -0700
Message-Id: <1588718832-4891-9-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1588718832-4891-1-git-send-email-bbhatt@codeaurora.org>
References: <1588718832-4891-1-git-send-email-bbhatt@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

While writing any sequence or session identifiers, it is possible that
the host could write a zero value, whereas only non-zero values should
be supported writes to those registers. Ensure that the host does not
write a non-zero value for them and also log them in debug messages.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
---
 drivers/bus/mhi/core/boot.c     | 15 +++++++--------
 drivers/bus/mhi/core/internal.h |  1 +
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/bus/mhi/core/boot.c b/drivers/bus/mhi/core/boot.c
index e5fcde1..7b9b561 100644
--- a/drivers/bus/mhi/core/boot.c
+++ b/drivers/bus/mhi/core/boot.c
@@ -43,10 +43,7 @@ void mhi_rddm_prepare(struct mhi_controller *mhi_cntrl,
 		      lower_32_bits(mhi_buf->dma_addr));
 
 	mhi_write_reg(mhi_cntrl, base, BHIE_RXVECSIZE_OFFS, mhi_buf->len);
-	sequence_id = prandom_u32() & BHIE_RXVECSTATUS_SEQNUM_BMSK;
-
-	if (unlikely(!sequence_id))
-		sequence_id = 1;
+	sequence_id = MHI_RANDOM_U32_NONZERO(BHIE_RXVECSTATUS_SEQNUM_BMSK);
 
 	mhi_write_reg_field(mhi_cntrl, base, BHIE_RXVECDB_OFFS,
 			    BHIE_RXVECDB_SEQNUM_BMSK, BHIE_RXVECDB_SEQNUM_SHFT,
@@ -189,7 +186,9 @@ static int mhi_fw_load_amss(struct mhi_controller *mhi_cntrl,
 		return -EIO;
 	}
 
-	dev_dbg(dev, "Starting AMSS download via BHIe\n");
+	sequence_id = MHI_RANDOM_U32_NONZERO(BHIE_TXVECSTATUS_SEQNUM_BMSK);
+	dev_dbg(dev, "Starting AMSS download via BHIe. Sequence ID:%u\n",
+		sequence_id);
 	mhi_write_reg(mhi_cntrl, base, BHIE_TXVECADDR_HIGH_OFFS,
 		      upper_32_bits(mhi_buf->dma_addr));
 
@@ -198,7 +197,6 @@ static int mhi_fw_load_amss(struct mhi_controller *mhi_cntrl,
 
 	mhi_write_reg(mhi_cntrl, base, BHIE_TXVECSIZE_OFFS, mhi_buf->len);
 
-	sequence_id = prandom_u32() & BHIE_TXVECSTATUS_SEQNUM_BMSK;
 	mhi_write_reg_field(mhi_cntrl, base, BHIE_TXVECDB_OFFS,
 			    BHIE_TXVECDB_SEQNUM_BMSK, BHIE_TXVECDB_SEQNUM_SHFT,
 			    sequence_id);
@@ -246,14 +244,15 @@ static int mhi_fw_load_sbl(struct mhi_controller *mhi_cntrl,
 		goto invalid_pm_state;
 	}
 
-	dev_dbg(dev, "Starting SBL download via BHI\n");
+	session_id = MHI_RANDOM_U32_NONZERO(BHI_TXDB_SEQNUM_BMSK);
+	dev_dbg(dev, "Starting SBL download via BHI. Session ID:%u\n",
+		session_id);
 	mhi_write_reg(mhi_cntrl, base, BHI_STATUS, 0);
 	mhi_write_reg(mhi_cntrl, base, BHI_IMGADDR_HIGH,
 		      upper_32_bits(dma_addr));
 	mhi_write_reg(mhi_cntrl, base, BHI_IMGADDR_LOW,
 		      lower_32_bits(dma_addr));
 	mhi_write_reg(mhi_cntrl, base, BHI_IMGSIZE, size);
-	session_id = prandom_u32() & BHI_TXDB_SEQNUM_BMSK;
 	mhi_write_reg(mhi_cntrl, base, BHI_IMGTXDB, session_id);
 	read_unlock_bh(pm_lock);
 
diff --git a/drivers/bus/mhi/core/internal.h b/drivers/bus/mhi/core/internal.h
index 0965ca3..80b32c2 100644
--- a/drivers/bus/mhi/core/internal.h
+++ b/drivers/bus/mhi/core/internal.h
@@ -452,6 +452,7 @@ enum mhi_pm_state {
 #define PRIMARY_CMD_RING		0
 #define MHI_DEV_WAKE_DB			127
 #define MHI_MAX_MTU			0xffff
+#define MHI_RANDOM_U32_NONZERO(bmsk)	(prandom_u32_max(bmsk) + 1)
 
 enum mhi_er_type {
 	MHI_ER_TYPE_INVALID = 0x0,
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
