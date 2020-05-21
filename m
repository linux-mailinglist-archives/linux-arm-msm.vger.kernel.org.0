Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFD061DD1CF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2020 17:28:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730531AbgEUP04 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 May 2020 11:26:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:34938 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727898AbgEUP0z (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 May 2020 11:26:55 -0400
Received: from localhost.localdomain (unknown [157.51.235.56])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BB3B8204EA;
        Thu, 21 May 2020 15:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590074815;
        bh=dvLttKvJJ7BKe09U0t/JMfDNzj7Lp4Uczo90kVKoK48=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tfI73kdyKuHG+IJXgrnsgleaBqKY+0Hjlnd4C9EUB2zn/refyE9gmwtkgSVOWJgqG
         heB8xI2rykLSFh0wi6tzjx2iVALLJDuEKy/N14YFQ0MSEoX8P+nodfvBngcuciha9m
         7R5BO6uxWvu+0o4MtvrcN6/V5svPzaKCCX7mmV14=
From:   mani@kernel.org
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, jhugo@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 14/14] bus: mhi: core: Handle syserr during power_up
Date:   Thu, 21 May 2020 20:55:40 +0530
Message-Id: <20200521152540.17335-15-mani@kernel.org>
X-Mailer: git-send-email 2.26.GIT
In-Reply-To: <20200521152540.17335-1-mani@kernel.org>
References: <20200521152540.17335-1-mani@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jeffrey Hugo <jhugo@codeaurora.org>

The MHI device may be in the syserr state when we attempt to init it in
power_up().  Since we have no local state, the handling is simple -
reset the device and wait for it to transition out of the reset state.

Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/pm.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
index e6236a3ca39d..1bd61a64d7bb 100644
--- a/drivers/bus/mhi/core/pm.c
+++ b/drivers/bus/mhi/core/pm.c
@@ -763,6 +763,7 @@ static void mhi_deassert_dev_wake(struct mhi_controller *mhi_cntrl,
 
 int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
 {
+	enum mhi_state state;
 	enum mhi_ee_type current_ee;
 	enum dev_st_transition next_state;
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
@@ -832,6 +833,32 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
 		goto error_bhi_offset;
 	}
 
+	state = mhi_get_mhi_state(mhi_cntrl);
+	if (state == MHI_STATE_SYS_ERR) {
+		mhi_set_mhi_state(mhi_cntrl, MHI_STATE_RESET);
+		ret = wait_event_timeout(mhi_cntrl->state_event,
+				MHI_PM_IN_FATAL_STATE(mhi_cntrl->pm_state) ||
+					mhi_read_reg_field(mhi_cntrl,
+							   mhi_cntrl->regs,
+							   MHICTRL,
+							   MHICTRL_RESET_MASK,
+							   MHICTRL_RESET_SHIFT,
+							   &val) ||
+					!val,
+				msecs_to_jiffies(mhi_cntrl->timeout_ms));
+		if (ret) {
+			ret = -EIO;
+			dev_info(dev, "Failed to reset MHI due to syserr state\n");
+			goto error_bhi_offset;
+		}
+
+		/*
+		 * device cleares INTVEC as part of RESET processing,
+		 * re-program it
+		 */
+		mhi_write_reg(mhi_cntrl, mhi_cntrl->bhi, BHI_INTVEC, 0);
+	}
+
 	/* Transition to next state */
 	next_state = MHI_IN_PBL(current_ee) ?
 		DEV_ST_TRANSITION_PBL : DEV_ST_TRANSITION_READY;
-- 
2.26.GIT

