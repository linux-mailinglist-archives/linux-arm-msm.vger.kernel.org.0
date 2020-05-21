Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC1611DD1B7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2020 17:27:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730458AbgEUP0J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 May 2020 11:26:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:34208 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730456AbgEUP0J (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 May 2020 11:26:09 -0400
Received: from localhost.localdomain (unknown [157.51.235.56])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CC3C4204EA;
        Thu, 21 May 2020 15:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590074768;
        bh=sPxRjmVagR2FpbE9aRopZRU2YGjsc3WV2suDxh3DSsg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LZfL8uMwx/qSJfSyzBEaBRcZ3Sb2aBMzkzrUf1lAlw8enZ8Fx4FXp1NL/fftiXra/
         C/QT7aTEgFLwIZKcHsMuFYJnjKdGKSkPK6qu3E3JGN9u9C1Ocss5Iwlw0RKxdPkp9N
         HAB2l8328QdSRfik2Kws+/FdVCRJ7pQhKD/Ofeig=
From:   mani@kernel.org
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, jhugo@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bhaumik Bhatt <bbhatt@codeaurora.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 03/14] bus: mhi: core: Add range check for channel id received in event ring
Date:   Thu, 21 May 2020 20:55:29 +0530
Message-Id: <20200521152540.17335-4-mani@kernel.org>
X-Mailer: git-send-email 2.26.GIT
In-Reply-To: <20200521152540.17335-1-mani@kernel.org>
References: <20200521152540.17335-1-mani@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/main.c | 40 +++++++++++++++++++++++++++----------
 1 file changed, 29 insertions(+), 11 deletions(-)

diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index beac8d33d1cb..64022865cb75 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -774,9 +774,18 @@ int mhi_process_ctrl_ev_ring(struct mhi_controller *mhi_cntrl,
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
@@ -819,14 +828,23 @@ int mhi_process_data_event_ring(struct mhi_controller *mhi_cntrl,
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
2.26.GIT

