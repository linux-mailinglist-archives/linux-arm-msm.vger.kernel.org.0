Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF9E7354F56
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Apr 2021 11:03:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240584AbhDFJD0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Apr 2021 05:03:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240559AbhDFJD0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Apr 2021 05:03:26 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61AC5C06174A
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Apr 2021 02:03:17 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id o6so4021805wmq.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Apr 2021 02:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=2mu2HOwUtFaOtvfYjnCHwk+0pWgHjq01yFoIZqmWRuA=;
        b=CJEeSsz7VndEgvx76HxdN9wu727/9fWXtZhtE66+pS2uQ63QLfKQtZORbq6G74NDph
         w9xoqbGUlCPneWecBTjTDFwbHHkzD/Q21DnD8GYoFyGr5anmjKk99l6CQwTI2z1JNR0u
         yU3flZXYhlxmMzgSZpa+EOuD8mO7bGTHmtjJgrCnZZ7VuFzUmhLLYgm+5M9XMjW6z+Lf
         q1KwQPHSw6xW4+9T2/AP7cN45LfCzbJmV6//puQ0rxCM0tY6FFyTXw3n2kE1rJCe1tOb
         nHNOnebTuOYxlaj+lyopwZ+TerIgzj6WO/KoEIxGqLouqSb4aPmLCbT4Hvq8lc9FHO9T
         23iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=2mu2HOwUtFaOtvfYjnCHwk+0pWgHjq01yFoIZqmWRuA=;
        b=beoFYYrvsSCxoDuEEFCcWMZVFezkSmprxuxwHOfWM936zQCFl6yg8/xkhhEc8+5xl5
         h3T+hTs14x3WoVHDXyNVwa7AopW4QpGEn8XfPMXCwphIhQXrNNB8qrTPBjM2QZStb+QT
         0ySS17LTmasXFvsw3lkfxI8hIayj3Jg21IHsHZjbCQ38j4fGiYQjEFHZU+GtVLeQZP06
         4gyPY+er7RluSfzHPe21xUJmFbhx9b90kwQ+XOvausglCMdtwN0g969upH3pXbAAYyix
         hgb71no7m1A/S5y1njqco3f/NAX3jA5HGZktlPiBlJ4xuBPfy9FEG7z7ql+cMjJ8sv6d
         UEPA==
X-Gm-Message-State: AOAM532jXl8NgiKvs6mLlGv8kLrkqeAKIXI3+e7jUTzSoBfuEc1HswU6
        gNHvEfCAQUWZrwV10bv7e+mANeY8meW7gEgt
X-Google-Smtp-Source: ABdhPJwVskAcX2M8Jtx0h+V8pnk9HAD56HZO8gilJUrj9XeLWwAuW9hQU7zTsuH3dM+rpBsswj4VDw==
X-Received: by 2002:a05:600c:3594:: with SMTP id p20mr2977822wmq.173.1617699796083;
        Tue, 06 Apr 2021 02:03:16 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:82c:5f0:49e5:d54d:f006:441f])
        by smtp.gmail.com with ESMTPSA id r1sm38266233wrj.63.2021.04.06.02.03.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 06 Apr 2021 02:03:15 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     bbhatt@codeaurora.org, linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v2 2/2] bus: mhi: pm: reduce PM state change verbosity
Date:   Tue,  6 Apr 2021 11:11:55 +0200
Message-Id: <1617700315-12492-2-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617700315-12492-1-git-send-email-loic.poulain@linaro.org>
References: <1617700315-12492-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Since M3 can be entered/exited quite a lot when used for runtime PM,
keep the mhi suspend/resume transitions quiet.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
Reviewed-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
---
 v2: Coding style, adjust alignment of dev_dbg params

 drivers/bus/mhi/core/pm.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
index edd7794..6cbac21 100644
--- a/drivers/bus/mhi/core/pm.c
+++ b/drivers/bus/mhi/core/pm.c
@@ -858,7 +858,7 @@ int mhi_pm_suspend(struct mhi_controller *mhi_cntrl)
 		return -EBUSY;
 	}
 
-	dev_info(dev, "Allowing M3 transition\n");
+	dev_dbg(dev, "Allowing M3 transition\n");
 	new_state = mhi_tryset_pm_state(mhi_cntrl, MHI_PM_M3_ENTER);
 	if (new_state != MHI_PM_M3_ENTER) {
 		write_unlock_irq(&mhi_cntrl->pm_lock);
@@ -872,7 +872,7 @@ int mhi_pm_suspend(struct mhi_controller *mhi_cntrl)
 	/* Set MHI to M3 and wait for completion */
 	mhi_set_mhi_state(mhi_cntrl, MHI_STATE_M3);
 	write_unlock_irq(&mhi_cntrl->pm_lock);
-	dev_info(dev, "Wait for M3 completion\n");
+	dev_dbg(dev, "Wait for M3 completion\n");
 
 	ret = wait_event_timeout(mhi_cntrl->state_event,
 				 mhi_cntrl->dev_state == MHI_STATE_M3 ||
@@ -906,9 +906,9 @@ int mhi_pm_resume(struct mhi_controller *mhi_cntrl)
 	enum mhi_pm_state cur_state;
 	int ret;
 
-	dev_info(dev, "Entered with PM state: %s, MHI state: %s\n",
-		 to_mhi_pm_state_str(mhi_cntrl->pm_state),
-		 TO_MHI_STATE_STR(mhi_cntrl->dev_state));
+	dev_dbg(dev, "Entered with PM state: %s, MHI state: %s\n",
+		to_mhi_pm_state_str(mhi_cntrl->pm_state),
+		TO_MHI_STATE_STR(mhi_cntrl->dev_state));
 
 	if (mhi_cntrl->pm_state == MHI_PM_DISABLE)
 		return 0;
-- 
2.7.4

