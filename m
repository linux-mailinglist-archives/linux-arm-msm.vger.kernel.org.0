Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAEA237122B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 May 2021 09:55:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232934AbhECH4g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 May 2021 03:56:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229817AbhECH4g (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 May 2021 03:56:36 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4FEDC06174A
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 May 2021 00:55:42 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id g65so2753685wmg.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 May 2021 00:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=9c1vU42PXOKoi1onRH189u9kyJBkAu3AMbD1DjdzjnY=;
        b=Hzvo/13DlxP/J888HyPVzcNw5NN3gcUr8sRZwTtnCn9krrjG7izJdQ4dYfMOH1mLT3
         h+URNXyj0is27RNj/ai994UuXjgT9ERuuKbDKJ8DjJkydP51yTLJRyRyoM1fVRj8P0ZQ
         3GuKTnUa5u2MQtOfCndSryFS6p73yewVB3/e+HpliTVmwPi5S/HrbPbH8oBzUt+PTpOx
         wBZ41yRp05jfYrIgtxk433Iy0YpQ0N4CJXiwVI9IZVxS1OmERF+0DvLPE7AgCsIk4dYb
         NzlvI7xCwZAO2kl5jkTP/CQkV9B+kAdeeAtguzEmgGg8mX4CDBS2gzQ5ZKWnUCbgnqrr
         RtBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=9c1vU42PXOKoi1onRH189u9kyJBkAu3AMbD1DjdzjnY=;
        b=H/6dIqecrgIkCKwoGD8WURDWq/PMPWj2S8XjN10tt/w1c+IRmEIcZ82iKucr4EBG5w
         W8FjpVJZ8lSIaFe73S3x7hKG3y3dwPfBLzpbEZBgzHbnxPxr9G2Tm3ei5/K0Gxuajsza
         YJL/Jssfu5HtGOEhThHUik7AMGr4oc5nxJOjyolnPV6iBadeIgEFvna+/fxK3ldKOpp5
         C+VVq0iEEvzF2EAaM8uR2XaSzKFYyWNB6MuU+ucZlLD/zwOhV10mAUu6YDhzsGxra0pi
         jul6e9VhOCpEbjZrCAWvRoZOHJ0pp3y6a3uipMtpTZNPZDH23MxvbGtYrr9Frq0eX0Yx
         2JmA==
X-Gm-Message-State: AOAM530dpSlCaZxSi+tuTUJhpoFo4p0BFNCO0k9b/j2U0TEnYWoT3Lm6
        mpfEWcUmE3y3OcbxSZvaAHKbAErqmFX+f15l
X-Google-Smtp-Source: ABdhPJw3ZY/+rvQDNtZgSDv3r7hvL8PIEY8Ysy5Vg97c59fkVp8BW7yuoDPnR2SHzXoa/r+R/MLPEQ==
X-Received: by 2002:a1c:c28a:: with SMTP id s132mr1441920wmf.145.1620028541458;
        Mon, 03 May 2021 00:55:41 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:82c:5f0:74ec:d21f:f616:f47c])
        by smtp.gmail.com with ESMTPSA id d6sm11237967wrr.77.2021.05.03.00.55.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 May 2021 00:55:40 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     mani@kernel.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, bbhatt@codeaurora.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v2] bus: mhi: core: Fix power down latency
Date:   Mon,  3 May 2021 10:04:50 +0200
Message-Id: <1620029090-8975-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On graceful power-down/disable transition, when an MHI reset is
performed, the MHI device loses its context, including interrupt
configuration. However, the current implementation is waiting for
event(irq) driven state change to confirm reset has been completed,
which never happens, and causes reset timeout, leading to unexpected
high latency of the mhi_power_down procedure (up to 45 seconds).

Fix that by moving to the recently introduced poll_reg_field method,
waiting for the reset bit to be cleared, in the same way as the
power_on procedure.

Fixes: a6e2e3522f29 ("bus: mhi: core: Add support for PM state transitions")
Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/bus/mhi/core/pm.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
index e2e59a3..704a5e2 100644
--- a/drivers/bus/mhi/core/pm.c
+++ b/drivers/bus/mhi/core/pm.c
@@ -465,23 +465,15 @@ static void mhi_pm_disable_transition(struct mhi_controller *mhi_cntrl)
 
 	/* Trigger MHI RESET so that the device will not access host memory */
 	if (!MHI_PM_IN_FATAL_STATE(mhi_cntrl->pm_state)) {
-		u32 in_reset = -1;
-		unsigned long timeout = msecs_to_jiffies(mhi_cntrl->timeout_ms);
-
 		dev_dbg(dev, "Triggering MHI Reset in device\n");
 		mhi_set_mhi_state(mhi_cntrl, MHI_STATE_RESET);
 
 		/* Wait for the reset bit to be cleared by the device */
-		ret = wait_event_timeout(mhi_cntrl->state_event,
-					 mhi_read_reg_field(mhi_cntrl,
-							    mhi_cntrl->regs,
-							    MHICTRL,
-							    MHICTRL_RESET_MASK,
-							    MHICTRL_RESET_SHIFT,
-							    &in_reset) ||
-					!in_reset, timeout);
-		if (!ret || in_reset)
-			dev_err(dev, "Device failed to exit MHI Reset state\n");
+		ret = mhi_poll_reg_field(mhi_cntrl, mhi_cntrl->regs, MHICTRL,
+				 MHICTRL_RESET_MASK, MHICTRL_RESET_SHIFT, 0,
+				 25000);
+		if (ret)
+			dev_err(dev, "Device failed to clear MHI Reset\n");
 
 		/*
 		 * Device will clear BHI_INTVEC as a part of RESET processing,
-- 
2.7.4

