Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 822DD1BE92B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2020 22:53:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727085AbgD2UxC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Apr 2020 16:53:02 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:32866 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727117AbgD2Uwq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Apr 2020 16:52:46 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588193565; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=NsPL69Xo3E+IisBEF2zEVVgd/bqvPUP5NCiuc+qa0eE=; b=Rg5BvDMKESdOi/10djS/ehCUsQu+/b9fiCO/tJJzJYwpaHiTJwl+TN4twRGFml5OF8zk9ZdG
 D8RUDl169yNTe+qggWoM59LqYyPmSddvDJBzlf80/Lhg+o2iOk/UjAI+DgiRQPuaNVs8uVRd
 uCY4jEVVTuFCuPUEWPyy7uFQ4R0=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ea9e918.7ff444d120a0-smtp-out-n02;
 Wed, 29 Apr 2020 20:52:40 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E9E46C432C2; Wed, 29 Apr 2020 20:52:39 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from bbhatt-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 873CBC44788;
        Wed, 29 Apr 2020 20:52:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 873CBC44788
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     mani@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        hemantk@codeaurora.org, jhugo@codeaurora.org,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v3 3/9] bus: mhi: core: Add range check for channel id received in event ring
Date:   Wed, 29 Apr 2020 13:52:25 -0700
Message-Id: <1588193551-31439-4-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1588193551-31439-1-git-send-email-bbhatt@codeaurora.org>
References: <1588193551-31439-1-git-send-email-bbhatt@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Hemant Kumar <hemantk@codeaurora.org>

MHI data completion handler function reads channel id from event
ring element. Value is under the control of MHI devices and can be
any value between 0 and 255. In order to prevent out of bound access
add a bound check against the max channel supported by controller
and skip processing of that event ring element.

Signed-off-by: Hemant Kumar <hemantk@codeaurora.org>
Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
---
 drivers/bus/mhi/core/main.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index aee64f9..b8e4aac 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -783,6 +783,9 @@ int mhi_process_ctrl_ev_ring(struct mhi_controller *mhi_cntrl,
 		case MHI_PKT_TYPE_TX_EVENT:
 			chan = MHI_TRE_GET_EV_CHID(local_rp);
 			mhi_chan = &mhi_cntrl->mhi_chan[chan];
+			if (WARN_ON(chan >= mhi_cntrl->max_chan))
+				goto next_event;
+
 			parse_xfer_event(mhi_cntrl, local_rp, mhi_chan);
 			event_quota--;
 			break;
@@ -791,6 +794,7 @@ int mhi_process_ctrl_ev_ring(struct mhi_controller *mhi_cntrl,
 			break;
 		}
 
+next_event:
 		mhi_recycle_ev_ring_element(mhi_cntrl, ev_ring);
 		local_rp = ev_ring->rp;
 		dev_rp = mhi_to_virtual(ev_ring, er_ctxt->rp);
@@ -827,6 +831,9 @@ int mhi_process_data_event_ring(struct mhi_controller *mhi_cntrl,
 		enum mhi_pkt_type type = MHI_TRE_GET_EV_TYPE(local_rp);
 
 		chan = MHI_TRE_GET_EV_CHID(local_rp);
+		if (WARN_ON(chan >= mhi_cntrl->max_chan))
+			goto next_event;
+
 		mhi_chan = &mhi_cntrl->mhi_chan[chan];
 
 		if (likely(type == MHI_PKT_TYPE_TX_EVENT)) {
@@ -837,6 +844,7 @@ int mhi_process_data_event_ring(struct mhi_controller *mhi_cntrl,
 			event_quota--;
 		}
 
+next_event:
 		mhi_recycle_ev_ring_element(mhi_cntrl, ev_ring);
 		local_rp = ev_ring->rp;
 		dev_rp = mhi_to_virtual(ev_ring, er_ctxt->rp);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
