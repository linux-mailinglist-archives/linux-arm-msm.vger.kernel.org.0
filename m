Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40D217D7BEC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Oct 2023 06:55:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229554AbjJZEzY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Oct 2023 00:55:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232398AbjJZEzX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Oct 2023 00:55:23 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05D8D18C
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Oct 2023 21:55:20 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-27e1eea2f0dso347340a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Oct 2023 21:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698296119; x=1698900919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0pt9Dt+M5cqD+vX+u8z8XsQMJi/gjZagBNhhPpDmywM=;
        b=h5IDYSz7hGryp8xt15E6bGa2LF2/wCAFF0jxfIRN9D0allCTupjyeNCQrO+IBAxXA8
         cqwhT/RmCJ6YNfnUD21UCtIcNcpE+YbAeGIE+qmicQn/Rceg9IomKi5W87YNr823Oaxm
         u4BItzhoaDaE/AtKWlFMJfD8QYaXVuluBqWIBOXR+/0YV3GAQjdTVeQwFrBZxthpmYbD
         gC16X+5i3LxQyhFAHCQe16NdWRjFKMFYtIp/j39kObiEwq4JfjodJIUO27cOQ5cEchXj
         oh+9M3iklg+IAYWocD60LEIUq9CqjsgQA4Qu/Q50sRr+4gP3tYEcEQ20DG4VAA+Pc+w3
         6GaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698296119; x=1698900919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0pt9Dt+M5cqD+vX+u8z8XsQMJi/gjZagBNhhPpDmywM=;
        b=vvDd5xUZrb0qTP1Z7xTu+k3H91CxtKWLK3yUDuQvdyhQr4iPPGcgTDPHbctL4Lz751
         kID5rs2AoRS/97BX7aTOsuT9da0DE6Ufx+JspXuqpW2GhiHQy+7kBb7Hge69ynytCeCX
         X9KjE4zxpwybY0G1VGE81ZlgKfqj7soruAWhYvn4VLKm/t+1dOwuyTPADXBOMgUVhOYb
         UBKd2WfCa2BlBKDVJAC7RMDEaKsa1bD4iFMF1y2y1/DZmnnqPMVpOyf80/Q1+nEPmoce
         42mCILn3oYcRv71M647rOzL/EmBh6LPEx5T5dF+ZAB3J4x1CWMIBHIuunml0frJ+yNOr
         J7FA==
X-Gm-Message-State: AOJu0Yzqq+Y4MU6Ph87RjLOoxH/jxwTxVHzF559ukHS79bXim6FJq4lV
        cK3MRO1J8VPqtEfcyKq32IHA
X-Google-Smtp-Source: AGHT+IGH5YwRzFY52rgnvnzSg5DY2VMsp03WcqH7SiHCYs+p66pVT697qQHpImfoKbqhPSxvzcLyEQ==
X-Received: by 2002:a17:90b:28c3:b0:27d:c36:e134 with SMTP id qj3-20020a17090b28c300b0027d0c36e134mr13144796pjb.42.1698296119397;
        Wed, 25 Oct 2023 21:55:19 -0700 (PDT)
Received: from localhost.localdomain ([103.28.246.120])
        by smtp.gmail.com with ESMTPSA id t16-20020a17090aba9000b00267b38f5e13sm710619pjr.2.2023.10.25.21.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 21:55:17 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mhi@lists.linux.dev
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2] bus: mhi: ep: Add support for interrupt moderation timer
Date:   Thu, 26 Oct 2023 10:25:13 +0530
Message-Id: <20231026045513.12981-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_SBL,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

MHI spec defines the interrupt moderation timer feature using which the
host can limit the number of interrupts being raised for an event ring by
the device. This feature allows the host to process multiple event ring
elements by a single IRQ from the device, thereby eliminating the need to
process IRQ for each element.

The INTMODT field in the event context array provides the value to be used
for delaying the IRQ generation from device. This value, along with the
Block Event Interrupt (BEI) flag of the TRE defines how IRQ is generated to
the host.

Support for interrupt moderation timer is implemented using delayed
workqueue in kernel. And a separate delayed work item is used for each
event ring.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---

Changes in v2:

* Fixed the build issue reported by Kbuild bot.

 drivers/bus/mhi/ep/internal.h |  3 +++
 drivers/bus/mhi/ep/main.c     | 22 +++++++++++++++++++---
 drivers/bus/mhi/ep/ring.c     | 19 ++++++++++++++++++-
 3 files changed, 40 insertions(+), 4 deletions(-)

diff --git a/drivers/bus/mhi/ep/internal.h b/drivers/bus/mhi/ep/internal.h
index a2125fa5fe2f..8c5cf2b67951 100644
--- a/drivers/bus/mhi/ep/internal.h
+++ b/drivers/bus/mhi/ep/internal.h
@@ -126,6 +126,7 @@ struct mhi_ep_ring {
 	union mhi_ep_ring_ctx *ring_ctx;
 	struct mhi_ring_element *ring_cache;
 	enum mhi_ep_ring_type type;
+	struct delayed_work intmodt_work;
 	u64 rbase;
 	size_t rd_offset;
 	size_t wr_offset;
@@ -135,7 +136,9 @@ struct mhi_ep_ring {
 	u32 ch_id;
 	u32 er_index;
 	u32 irq_vector;
+	u32 intmodt;
 	bool started;
+	bool irq_pending;
 };
 
 struct mhi_ep_cmd {
diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index e2513f5f47a6..c06111045a84 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -54,11 +54,27 @@ static int mhi_ep_send_event(struct mhi_ep_cntrl *mhi_cntrl, u32 ring_idx,
 	mutex_unlock(&mhi_cntrl->event_lock);
 
 	/*
-	 * Raise IRQ to host only if the BEI flag is not set in TRE. Host might
-	 * set this flag for interrupt moderation as per MHI protocol.
+	 * As per the MHI specification, section 4.3, Interrupt moderation:
+	 *
+	 * 1. If BEI flag is not set, cancel any pending intmodt work if started
+	 * for the event ring and raise IRQ immediately.
+	 *
+	 * 2. If both BEI and intmodt are set, and if no IRQ is pending for the
+	 * same event ring, start the IRQ delayed work as per the value of
+	 * intmodt. If previous IRQ is pending, then do nothing as the pending
+	 * IRQ is enough for the host to process the current event ring element.
+	 *
+	 * 3. If BEI is set and intmodt is not set, no need to raise IRQ.
 	 */
-	if (!bei)
+	if (!bei) {
+		if (READ_ONCE(ring->irq_pending))
+			cancel_delayed_work(&ring->intmodt_work);
+
 		mhi_cntrl->raise_irq(mhi_cntrl, ring->irq_vector);
+	} else if (ring->intmodt && !READ_ONCE(ring->irq_pending)) {
+		WRITE_ONCE(ring->irq_pending, true);
+		schedule_delayed_work(&ring->intmodt_work, msecs_to_jiffies(ring->intmodt));
+	}
 
 	return 0;
 
diff --git a/drivers/bus/mhi/ep/ring.c b/drivers/bus/mhi/ep/ring.c
index 115518ec76a4..a1071c13761b 100644
--- a/drivers/bus/mhi/ep/ring.c
+++ b/drivers/bus/mhi/ep/ring.c
@@ -157,6 +157,15 @@ void mhi_ep_ring_init(struct mhi_ep_ring *ring, enum mhi_ep_ring_type type, u32
 	}
 }
 
+static void mhi_ep_raise_irq(struct work_struct *work)
+{
+	struct mhi_ep_ring *ring = container_of(work, struct mhi_ep_ring, intmodt_work.work);
+	struct mhi_ep_cntrl *mhi_cntrl = ring->mhi_cntrl;
+
+	mhi_cntrl->raise_irq(mhi_cntrl, ring->irq_vector);
+	WRITE_ONCE(ring->irq_pending, false);
+}
+
 int mhi_ep_ring_start(struct mhi_ep_cntrl *mhi_cntrl, struct mhi_ep_ring *ring,
 			union mhi_ep_ring_ctx *ctx)
 {
@@ -173,8 +182,13 @@ int mhi_ep_ring_start(struct mhi_ep_cntrl *mhi_cntrl, struct mhi_ep_ring *ring,
 	if (ring->type == RING_TYPE_CH)
 		ring->er_index = le32_to_cpu(ring->ring_ctx->ch.erindex);
 
-	if (ring->type == RING_TYPE_ER)
+	if (ring->type == RING_TYPE_ER) {
 		ring->irq_vector = le32_to_cpu(ring->ring_ctx->ev.msivec);
+		ring->intmodt = FIELD_GET(EV_CTX_INTMODT_MASK,
+					  le32_to_cpu(ring->ring_ctx->ev.intmod));
+
+		INIT_DELAYED_WORK(&ring->intmodt_work, mhi_ep_raise_irq);
+	}
 
 	/* During ring init, both rp and wp are equal */
 	memcpy_fromio(&val, (void __iomem *) &ring->ring_ctx->generic.rp, sizeof(u64));
@@ -201,6 +215,9 @@ int mhi_ep_ring_start(struct mhi_ep_cntrl *mhi_cntrl, struct mhi_ep_ring *ring,
 
 void mhi_ep_ring_reset(struct mhi_ep_cntrl *mhi_cntrl, struct mhi_ep_ring *ring)
 {
+	if (ring->type == RING_TYPE_ER)
+		cancel_delayed_work_sync(&ring->intmodt_work);
+
 	ring->started = false;
 	kfree(ring->ring_cache);
 	ring->ring_cache = NULL;

base-commit: 12606ba1d46b34a241eb3d0956727e5379f0f626
-- 
2.25.1

