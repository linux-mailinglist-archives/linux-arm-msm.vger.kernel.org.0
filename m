Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D33001DD3CF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2020 19:04:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730228AbgEURDq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 May 2020 13:03:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729988AbgEURDp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 May 2020 13:03:45 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4D72C061A0E
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2020 10:03:45 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id n18so3607707pfa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2020 10:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=HJdUtFskJTJX9hH5IqG0JWO7Sknuz1pUAhyTdOQmOSs=;
        b=yE2F3eqU2dXuCxAO8X3zL1DuhcawU48juSAfsfYH1wgB9zqgXwzU0anzBUe2gwqCvN
         MSy8eCEy39vC1RhBLUgVHsoVNtOOdcIheysyZoYLHoSBMRw84pLm3dIAOd1WA7RJ0ZCS
         wCcM3Tdy1+4FfxQ+oBt1KFcFOKP0A2zYlB8mQbHv+nuesOHE2KOQCDYYb9WC7wTfxpwd
         TN9mP024MK5zP/ceU2ks8YKgpb5QRMULKfN4gJ9cixRX3SxonNz6kkebytlQwfgYVluz
         EjY8EAU64IpJRmuUxeQzeDU3yX9zrNISHCkaCv+4frMMnxzkv9P0m1kaxFFu6gnyDnMN
         GPcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=HJdUtFskJTJX9hH5IqG0JWO7Sknuz1pUAhyTdOQmOSs=;
        b=Hfk3lxpihgH/W+GkZxmBb41UYUJHYXGNcyl8mRpWzCo+Yh3tj3XBfayTNsSuT9va1w
         TlAHxu7kHNb7rCSXFWE2SPxgvhphu4eswE7hOxe2MFtes8AA++Xv7nLV2m5inu0VUE8F
         nkXf8MsWd07NH9RwNX+5ohLQtT+TuXa6hzl4//CaN2NuiHNzvwO81FF+u4nBy0WOWWFe
         N6rtmha5E+D84s2tpL+F50UZAdlhMkU5mnj0/Y1pt4kC65JO+hcZgRm1fnhAcVEiQW55
         17o9vJULsSr3DGTvMVqUMx2b33Y7HA2jH3wOLnseW2Q4n9IDc4TZ/JyJbZ3NQkNlU9gO
         I93g==
X-Gm-Message-State: AOAM531KFA60dTusCoGcRAyVY2AA5YZIC9KuRMq3GhDOkAIIZPXVTDIU
        ptE0arKzZRSlxvePbLvlA3/W
X-Google-Smtp-Source: ABdhPJxsrfOklYSPQDiDPdFTwuCEkiUARZXOFTMu1gxUQM0Oee13qxGfDle3g0oTQPnCyenyjvQ9vQ==
X-Received: by 2002:a62:b503:: with SMTP id y3mr6816452pfe.3.1590080625223;
        Thu, 21 May 2020 10:03:45 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:69f:45f2:3d8d:3719:f568:7ee9])
        by smtp.gmail.com with ESMTPSA id e26sm4874693pff.137.2020.05.21.10.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 10:03:44 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, jhugo@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [RESEND PATCH 10/14] bus: mhi: core: Handle disable transitions in state worker
Date:   Thu, 21 May 2020 22:32:45 +0530
Message-Id: <20200521170249.21795-11-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200521170249.21795-1-manivannan.sadhasivam@linaro.org>
References: <20200521170249.21795-1-manivannan.sadhasivam@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Hemant Kumar <hemantk@codeaurora.org>

Mission mode transition is handled by state worker thread but
power off is not. There is a possibility while mission mode
transition is in progress which calls MHI client driver probe,
power off is issued by MHI controller. This results into client
driver probe and remove running in parallel and causes use after
free situation. By queuing disable transition work when mission
mode is in progress prevents the race condition.

Signed-off-by: Hemant Kumar <hemantk@codeaurora.org>
Reviewed-by: Jeffrey Hugo <jhugo@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/init.c     |  1 +
 drivers/bus/mhi/core/internal.h |  1 +
 drivers/bus/mhi/core/pm.c       | 11 ++++++++++-
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index 3a853c5d2103..12207cc438aa 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -35,6 +35,7 @@ const char * const dev_state_tran_str[DEV_ST_TRANSITION_MAX] = {
 	[DEV_ST_TRANSITION_SBL] = "SBL",
 	[DEV_ST_TRANSITION_MISSION_MODE] = "MISSION_MODE",
 	[DEV_ST_TRANSITION_SYS_ERR] = "SYS_ERR",
+	[DEV_ST_TRANSITION_DISABLE] = "DISABLE",
 };
 
 const char * const mhi_state_str[MHI_STATE_MAX] = {
diff --git a/drivers/bus/mhi/core/internal.h b/drivers/bus/mhi/core/internal.h
index f01283b8a451..b1f640b75a94 100644
--- a/drivers/bus/mhi/core/internal.h
+++ b/drivers/bus/mhi/core/internal.h
@@ -387,6 +387,7 @@ enum dev_st_transition {
 	DEV_ST_TRANSITION_SBL,
 	DEV_ST_TRANSITION_MISSION_MODE,
 	DEV_ST_TRANSITION_SYS_ERR,
+	DEV_ST_TRANSITION_DISABLE,
 	DEV_ST_TRANSITION_MAX,
 };
 
diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
index 743b3207c390..a5d9973059c8 100644
--- a/drivers/bus/mhi/core/pm.c
+++ b/drivers/bus/mhi/core/pm.c
@@ -657,6 +657,10 @@ void mhi_pm_st_worker(struct work_struct *work)
 			mhi_pm_disable_transition
 				(mhi_cntrl, MHI_PM_SYS_ERR_PROCESS);
 			break;
+		case DEV_ST_TRANSITION_DISABLE:
+			mhi_pm_disable_transition
+				(mhi_cntrl, MHI_PM_SHUTDOWN_PROCESS);
+			break;
 		default:
 			break;
 		}
@@ -868,7 +872,12 @@ void mhi_power_down(struct mhi_controller *mhi_cntrl, bool graceful)
 				to_mhi_pm_state_str(MHI_PM_LD_ERR_FATAL_DETECT),
 				to_mhi_pm_state_str(mhi_cntrl->pm_state));
 	}
-	mhi_pm_disable_transition(mhi_cntrl, MHI_PM_SHUTDOWN_PROCESS);
+
+	mhi_queue_state_transition(mhi_cntrl, DEV_ST_TRANSITION_DISABLE);
+
+	/* Wait for shutdown to complete */
+	flush_work(&mhi_cntrl->st_worker);
+
 	mhi_deinit_free_irq(mhi_cntrl);
 
 	if (!mhi_cntrl->pre_init) {
-- 
2.17.1

