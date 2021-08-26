Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BCAF3F8CA2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Aug 2021 19:01:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243178AbhHZRCB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Aug 2021 13:02:01 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:3887 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229986AbhHZRCA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Aug 2021 13:02:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1629997273; x=1661533273;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=RQEhtRtivu+FrdK+WyMh0HrD6utO53RBleoIHmXyIGw=;
  b=zBQor+kHA0IzNysx4ExSMH/YY4UcV1tVjcKpniwjoIVbCYcsShd0xuqp
   sRdMgNcux6X96aPP6wI+rnKRpzjyvzm9PumwzQkOwUwCaeo8p3tkBxmFx
   TPDoRdNJhPFgnkbP8GubwyXCrt7ePMsPfsPHTuX7oQKkgr0z4MTgRVL7Q
   o=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 26 Aug 2021 10:01:13 -0700
X-QCInternal: smtphost
Received: from nalasex01a.na.qualcomm.com ([10.47.209.196])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2021 10:01:12 -0700
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Thu, 26 Aug 2021 10:01:11 -0700
From:   Jeffrey Hugo <quic_jhugo@quicinc.com>
To:     <mani@kernel.org>, <hemantk@codeaurora.org>,
        <bbhatt@codeaurora.org>
CC:     <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Jeffrey Hugo" <quic_jhugo@quicinc.com>
Subject: [PATCH] bus: mhi: core: Use cached values for calculating the shared write pointer
Date:   Thu, 26 Aug 2021 11:01:03 -0600
Message-ID: <1629997263-11147-1-git-send-email-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

mhi_recycle_ev_ring() computes the shared write pointer for the ring
(ctxt_wp) using a read/modify/write pattern where the ctxt_wp value in the
shared memory is read, incremented, and written back.  There are no checks
on the read value, it is assumed that it is kept in sync with the locally
cached value.  Per the MHI spec, this is correct.  The device should only
read ctxt_wp, never write it.

However, there are devices in the wild that violate the spec, and can
update the ctxt_wp in a specific scenario.  This can cause corruption, and
violate the above assumption that the ctxt_wp is in sync with the cached
value.

This can occur when the device has loaded firmware from the host, and is
transitioning from the SBL EE to the AMSS EE.  As part of shutting down
SBL, the SBL flushes it's local MHI context to the shared memory since
the local context will not persist across an EE change.  In the case of
the event ring, SBL will flush its entire context, not just the parts that
it is allowed to update.  This means SBL will write to ctxt_wp, and
possibly corrupt it.

An example:

Host				Device
----				---
Update ctxt_wp to 0x1f0
				SBL observes 0x1f0
Update ctxt_wp to 0x0
				Starts transition to AMSS EE
				Context flush, writes 0x1f0 to ctxt_wp
Update ctxt_wp to 0x200
Update ctxt_wp to 0x210
				AMSS observes 0x210
				0x210 exceeds ring size
				AMSS signals syserr

The reason the ctxt_wp goes off the end of the ring is that the rollover
check is only performed on the cached wp, which is out of sync with
ctxt_wp.

Since the host is the authority of the value of ctxt_wp per the MHI spec,
we can fix this issue by not reading ctxt_wp from the shared memory, and
instead compute it based on the cached value.  If SBL corrupts ctxt_wp,
the host won't observe it, and will correct the value at some point later.

Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
---
 drivers/bus/mhi/core/main.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index c01ec2f..1e7e7bb 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -533,18 +533,13 @@ irqreturn_t mhi_intvec_handler(int irq_number, void *dev)
 static void mhi_recycle_ev_ring_element(struct mhi_controller *mhi_cntrl,
 					struct mhi_ring *ring)
 {
-	dma_addr_t ctxt_wp;
-
 	/* Update the WP */
 	ring->wp += ring->el_size;
-	ctxt_wp = *ring->ctxt_wp + ring->el_size;
 
-	if (ring->wp >= (ring->base + ring->len)) {
+	if (ring->wp >= (ring->base + ring->len))
 		ring->wp = ring->base;
-		ctxt_wp = ring->iommu_base;
-	}
 
-	*ring->ctxt_wp = ctxt_wp;
+	*ring->ctxt_wp = ring->iommu_base + (ring->wp - ring_base);
 
 	/* Update the RP */
 	ring->rp += ring->el_size;
-- 
2.7.4

