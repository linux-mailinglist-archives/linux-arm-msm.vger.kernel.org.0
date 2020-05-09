Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 907841CBC84
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 May 2020 04:27:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728707AbgEIC1T (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 May 2020 22:27:19 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:43393 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728662AbgEIC1H (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 May 2020 22:27:07 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588991226; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=yQPyjhWO4IzWNgBlXCH4ez/ff7ca0LWqm0O6ayE2m4w=; b=ZEKYBEj+RTVYuUMwKotuZ+kzjcRad/RIzkeKr2PI81Tx/uBQmrlFzUVaUkzx6cHBoXtXNHxi
 gk8rU8W923Ufy+d5XDp5cVlsuz/zy4EDqx5EOmdrb05yZa4Q3aj3/cLXpS3euwDKtD42eYP3
 diCY4+bCg3syt6QjH7Pempz1N4o=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5eb614f2.7f0129019d18-smtp-out-n01;
 Sat, 09 May 2020 02:26:58 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A1DE8C433D2; Sat,  9 May 2020 02:26:57 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from bbhatt-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1001DC43637;
        Sat,  9 May 2020 02:26:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1001DC43637
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        hemantk@codeaurora.org, jhugo@codeaurora.org,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v7 3/8] bus: mhi: core: Add range check for channel id received in event ring
Date:   Fri,  8 May 2020 19:26:43 -0700
Message-Id: <1588991208-26928-4-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1588991208-26928-1-git-send-email-bbhatt@codeaurora.org>
References: <1588991208-26928-1-git-send-email-bbhatt@codeaurora.org>
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
Reviewed-by: Jeffrey Hugo <jhugo@codeaurora.org>
---
 drivers/bus/mhi/core/main.c | 40 +++++++++++++++++++++++++++++-----------
 1 file changed, 29 insertions(+), 11 deletions(-)

diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index 605640c..30798ec 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -775,9 +775,18 @@ int mhi_process_ctrl_ev_ring(struct mhi_controller *mhi_cntrl,
 		}
 		case MHI_PKT_TYPE_TX_EVENT:
 			chan = MHI_TRE_GET_EV_CHID(local_rp);
-			mhi_chan = &mhi_cntrl->mhi_chan[chan];
-			parse_xfer_event(mhi_cntrl, local_rp, mhi_chan);
-			event_quota--;
+
+			WARN_ON(chan >= mhi_cntrl->max_chan);
+
+			/*
+			 * Only process the event ring elements whose channel
+			 * ID is within the maximum supported range.
+			 */
+			if (chan < mhi_cntrl->max_chan) {
+				mhi_chan = &mhi_cntrl->mhi_chan[chan];
+				parse_xfer_event(mhi_cntrl, local_rp, mhi_chan);
+				event_quota--;
+			}
 			break;
 		default:
 			dev_err(dev, "Unhandled event type: %d\n", type);
@@ -820,14 +829,23 @@ int mhi_process_data_event_ring(struct mhi_controller *mhi_cntrl,
 		enum mhi_pkt_type type = MHI_TRE_GET_EV_TYPE(local_rp);
 
 		chan = MHI_TRE_GET_EV_CHID(local_rp);
-		mhi_chan = &mhi_cntrl->mhi_chan[chan];
-
-		if (likely(type == MHI_PKT_TYPE_TX_EVENT)) {
-			parse_xfer_event(mhi_cntrl, local_rp, mhi_chan);
-			event_quota--;
-		} else if (type == MHI_PKT_TYPE_RSC_TX_EVENT) {
-			parse_rsc_event(mhi_cntrl, local_rp, mhi_chan);
-			event_quota--;
+
+		WARN_ON(chan >= mhi_cntrl->max_chan);
+
+		/*
+		 * Only process the event ring elements whose channel
+		 * ID is within the maximum supported range.
+		 */
+		if (chan < mhi_cntrl->max_chan) {
+			mhi_chan = &mhi_cntrl->mhi_chan[chan];
+
+			if (likely(type == MHI_PKT_TYPE_TX_EVENT)) {
+				parse_xfer_event(mhi_cntrl, local_rp, mhi_chan);
+				event_quota--;
+			} else if (type == MHI_PKT_TYPE_RSC_TX_EVENT) {
+				parse_rsc_event(mhi_cntrl, local_rp, mhi_chan);
+				event_quota--;
+			}
 		}
 
 		mhi_recycle_ev_ring_element(mhi_cntrl, ev_ring);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
