Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37C6C36D3D2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Apr 2021 10:20:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237012AbhD1IVL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Apr 2021 04:21:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230456AbhD1IVL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Apr 2021 04:21:11 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7106C061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Apr 2021 01:20:26 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id i129so6263756wma.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Apr 2021 01:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=rFGmTWHobTm2hcMwxp0CTCTtxwmB43M+KXe0/JZktMI=;
        b=cX/f8h6aHqxIW1mMzlz+ZER6Vinryp+oUw2EUr8q1MW1tYDPz/a2Gsa56bWjKMYAZN
         tjO7xrgzhfS+XKXTbwra8AfCRlomnHg1CkJWxou8ea5KCnlutsQGBrOOSC5YXKcHiV5E
         CynOJknAgrRPmrX0XpwC+HXBgOviztdfESSuaBeJm8aTB0PkSKqAQNT3Q+G52Z9zQFAN
         bPk9ffb/raRmuFpPmisGOtH2LB6o4WLufe81s8kP3QSEN3ovG3AxKXv1dB8mKs5Df3vJ
         UD/b6fqkPhaRyB6p7pMgLOA+Vzy+VLWtd7ESvoYwh441F564AgtNV/wViPmGNclQXEUL
         6/Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=rFGmTWHobTm2hcMwxp0CTCTtxwmB43M+KXe0/JZktMI=;
        b=K/aND/08xHZxIO1TdAUbApvSCHRsA2itLLFVNHDs15ZJYPzX8dC4OKF3yaqUIqqXD4
         hcBZZ4mVZS2qMYHQhvG36c5NbxQgocqpZlouEIOm21Rg6oAhwxTWMZgt3m86iZDf8ag/
         Rv+6vGRzVGwkXQzEo8wNXZJtPHtD9xBkvMzoj/QY30leDmW1QdEX3cmuzDRjbPsNoELv
         0m5ERyAPi4a6kBPe3Uhn8Y9PiIO+SumLBfiqQGM91Q6a0XfQDe3RO2UTSwX381zlgli1
         VFNQl4rC4AanmSF/DsinqUpgvU+aT4R/VAiZT7Hvx55pNDdVxHL2PWyzNhEvgdUqGWbh
         HraA==
X-Gm-Message-State: AOAM532QTsgpBPyu6NMjK+a81Otwmhivj1fEzHRly+McE8JeDDHTWOgX
        lOjs8nYSlJFp5PpXYp8mWfac+aD8JVoLfCk1
X-Google-Smtp-Source: ABdhPJxelUuz8zspVI6ABymXFf2SyLrLUfh7nmIU80ol3TkDYzoi4qULsqDRT8iE9XA5PXMZgISbHQ==
X-Received: by 2002:a1c:1b49:: with SMTP id b70mr1746038wmb.147.1619598025327;
        Wed, 28 Apr 2021 01:20:25 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:82c:5f0:9131:9ffb:166f:8839])
        by smtp.gmail.com with ESMTPSA id b14sm7577279wrf.75.2021.04.28.01.20.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Apr 2021 01:20:24 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     mani@kernel.org, hemantk@codeaurora.org
Cc:     bbhatt@codeaurora.org, linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH] bus: mhi: core: Fix power down latency
Date:   Wed, 28 Apr 2021 10:29:34 +0200
Message-Id: <1619598574-11928-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On gracefull power-down/disable transition, a MHI reset is performed,
the MHI device then looses its context, including interrupt config.
However the current implementation is waiting for event(irq) driven
state change to confirm reset has been completed, which never happens,
and causes reset timeout, leading to unexpected high latency of the
mhi_power_down procedure.

Fix that by moving to the recently introduced poll_reg_field method,
waiting for the reset bit to be cleared, in the same way as the
power_on procedure.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/bus/mhi/core/pm.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
index e2e59a3..9c61d3f 100644
--- a/drivers/bus/mhi/core/pm.c
+++ b/drivers/bus/mhi/core/pm.c
@@ -3,7 +3,6 @@
  * Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.
  *
  */
-
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/dma-direction.h>
@@ -471,17 +470,11 @@ static void mhi_pm_disable_transition(struct mhi_controller *mhi_cntrl)
 		dev_dbg(dev, "Triggering MHI Reset in device\n");
 		mhi_set_mhi_state(mhi_cntrl, MHI_STATE_RESET);
 
-		/* Wait for the reset bit to be cleared by the device */
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

