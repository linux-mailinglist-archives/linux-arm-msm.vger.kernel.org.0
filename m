Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8965645C770
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Nov 2021 15:32:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350704AbhKXOfv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Nov 2021 09:35:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355793AbhKXOfo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Nov 2021 09:35:44 -0500
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59AD3C1A26AE
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Nov 2021 05:22:41 -0800 (PST)
Received: by mail-pf1-x42d.google.com with SMTP id u80so2595128pfc.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Nov 2021 05:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/r7Wr2d64SPcG4y5LNy2d5LgRst/3wJMx3Q73ZCHyWw=;
        b=blRLAAuRqYS4RDVXHvKkriOBmlYrP/SoxfRBWfP9dD4OjOrurqTgLqxfJAsSKhdskt
         dC5T1kZtPQvKphjznURE1JMg84N4xrfxU5jQ4rBmeAol9+enhBHdkfnSruPHFsvYI4gg
         Kh6dHRF0JDxXW7BHBQoq2OFoXEp5K+jOFizigX13Gh2MKlvxn0QhtXNdn3sm7i1GKlOv
         5bgdTwUJPHuyy8+zYNXRZhYMc8qJm6gxjPFZSgGr7t1SAMC3HzO7jbhRLa3T8dwXqTCL
         17fvaf1z3fJUwG9Vjc++3gp+HcWzqbVjsSk8JwFYezODWt2AOu/qHHlgJAICIXSbYnBE
         Udmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/r7Wr2d64SPcG4y5LNy2d5LgRst/3wJMx3Q73ZCHyWw=;
        b=eUXkjiRWb+S2+5zgMgqyvZwslzjTazpS3iMkJgXv7LXZSrcJ6JuZkmlDnygtD1iJ4f
         EDpdt+50AIOQK6p0m4N6LTRetArZwTj7J6U1Few/Dtqje630QQAGxT08A7nfoPR2msbr
         cpXadnBJdatfyyNHFCXJGqDkORjMBYwDlAJdNrhaXWjf0t2WLNVqIkW7B4lDUkpI6Vqm
         JxwxwUoy+l4h7cIh/5Vw4VzAbAFWvzfieryUo0GDf0Ee9SerfGFNQg1e2+F5ANGX7oKE
         Ie2UU1kEqLTtsG9/cXu4B5Ml4dTxX02NW91w3mGVhmTFrSss1Ry3ToOJJhanydnqq3kA
         7H8w==
X-Gm-Message-State: AOAM530oA41s00lhcQqCYqihcSXHq9/VdYL8e619iaDXGfRq0Yyn2uAk
        viYCoi3LbTg7ej2IOe4IzPCW
X-Google-Smtp-Source: ABdhPJwUutZQutwiGkGqFlxxVxBdlTcubvssMfvmU54yrk3BYVaYqbLF8WICHZ7lgLAIk6nF8q3XbA==
X-Received: by 2002:aa7:9ddb:0:b0:4a4:f597:a4ca with SMTP id g27-20020aa79ddb000000b004a4f597a4camr5696052pfq.57.1637760159750;
        Wed, 24 Nov 2021 05:22:39 -0800 (PST)
Received: from localhost.localdomain ([2409:4072:6d01:b1fa:45f8:8977:6ea4:8b04])
        by smtp.gmail.com with ESMTPSA id lr6sm5300816pjb.0.2021.11.24.05.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 05:22:38 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mhi@lists.linux.dev
Cc:     aleksander@aleksander.es, loic.poulain@linaro.org,
        thomas.perrot@bootlin.com, hemantk@codeaurora.org,
        bbhatt@codeaurora.org, quic_jhugo@quicinc.com,
        linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        stable@vger.kernel.org
Subject: [PATCH v4] bus: mhi: Fix race while handling SYS_ERR at power up
Date:   Wed, 24 Nov 2021 18:52:21 +0530
Message-Id: <20211124132221.44915-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some devices tend to trigger SYS_ERR interrupt while the host handling
SYS_ERR state of the device during power up. This creates a race
condition and causes a failure in booting up the device.

The issue is seen on the Sierra Wireless EM9191 modem during SYS_ERR
handling in mhi_async_power_up(). Once the host detects that the device
is in SYS_ERR state, it issues MHI_RESET and waits for the device to
process the reset request. During this time, the device triggers SYS_ERR
interrupt to the host and host starts handling SYS_ERR execution.

So by the time the device has completed reset, host starts SYS_ERR
handling. This causes the race condition and the modem fails to boot.

Hence, register the IRQ handler only after handling the SYS_ERR check
to avoid getting spurious IRQs from the device.

Cc: stable@vger.kernel.org
Fixes: e18d4e9fa79b ("bus: mhi: core: Handle syserr during power_up")
Reported-by: Aleksander Morgado <aleksander@aleksander.es>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---

Changes in v4:

* Reverted the change that moved BHI_INTVEC as that was causing issue as
  reported by Aleksander.

Changes in v3:

* Moved BHI_INTVEC setup after irq setup
* Used interval_us as the delay for the polling API

Changes in v2:

* Switched to "mhi_poll_reg_field" for detecting MHI reset in device.

 drivers/bus/mhi/core/pm.c | 33 +++++++++++----------------------
 1 file changed, 11 insertions(+), 22 deletions(-)

diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
index fb99e3727155..21484a61bbed 100644
--- a/drivers/bus/mhi/core/pm.c
+++ b/drivers/bus/mhi/core/pm.c
@@ -1038,7 +1038,7 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
 	enum mhi_ee_type current_ee;
 	enum dev_st_transition next_state;
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
-	u32 val;
+	u32 interval_us = 25000; /* poll register field every 25 milliseconds */
 	int ret;
 
 	dev_info(dev, "Requested to power ON\n");
@@ -1055,10 +1055,6 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
 	mutex_lock(&mhi_cntrl->pm_mutex);
 	mhi_cntrl->pm_state = MHI_PM_DISABLE;
 
-	ret = mhi_init_irq_setup(mhi_cntrl);
-	if (ret)
-		goto error_setup_irq;
-
 	/* Setup BHI INTVEC */
 	write_lock_irq(&mhi_cntrl->pm_lock);
 	mhi_write_reg(mhi_cntrl, mhi_cntrl->bhi, BHI_INTVEC, 0);
@@ -1072,7 +1068,7 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
 		dev_err(dev, "%s is not a valid EE for power on\n",
 			TO_MHI_EXEC_STR(current_ee));
 		ret = -EIO;
-		goto error_async_power_up;
+		goto error_setup_irq;
 	}
 
 	state = mhi_get_mhi_state(mhi_cntrl);
@@ -1081,20 +1077,12 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
 
 	if (state == MHI_STATE_SYS_ERR) {
 		mhi_set_mhi_state(mhi_cntrl, MHI_STATE_RESET);
-		ret = wait_event_timeout(mhi_cntrl->state_event,
-				MHI_PM_IN_FATAL_STATE(mhi_cntrl->pm_state) ||
-					mhi_read_reg_field(mhi_cntrl,
-							   mhi_cntrl->regs,
-							   MHICTRL,
-							   MHICTRL_RESET_MASK,
-							   MHICTRL_RESET_SHIFT,
-							   &val) ||
-					!val,
-				msecs_to_jiffies(mhi_cntrl->timeout_ms));
-		if (!ret) {
-			ret = -EIO;
+		ret = mhi_poll_reg_field(mhi_cntrl, mhi_cntrl->regs, MHICTRL,
+				 MHICTRL_RESET_MASK, MHICTRL_RESET_SHIFT, 0,
+				 interval_us);
+		if (ret) {
 			dev_info(dev, "Failed to reset MHI due to syserr state\n");
-			goto error_async_power_up;
+			goto error_setup_irq;
 		}
 
 		/*
@@ -1104,6 +1092,10 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
 		mhi_write_reg(mhi_cntrl, mhi_cntrl->bhi, BHI_INTVEC, 0);
 	}
 
+	ret = mhi_init_irq_setup(mhi_cntrl);
+	if (ret)
+		goto error_setup_irq;
+
 	/* Transition to next state */
 	next_state = MHI_IN_PBL(current_ee) ?
 		DEV_ST_TRANSITION_PBL : DEV_ST_TRANSITION_READY;
@@ -1116,9 +1108,6 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
 
 	return 0;
 
-error_async_power_up:
-	mhi_deinit_free_irq(mhi_cntrl);
-
 error_setup_irq:
 	mhi_cntrl->pm_state = MHI_PM_DISABLE;
 	mutex_unlock(&mhi_cntrl->pm_mutex);
-- 
2.25.1

