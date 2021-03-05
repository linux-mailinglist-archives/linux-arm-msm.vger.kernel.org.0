Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FC6932F06B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Mar 2021 17:54:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229848AbhCEQyX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Mar 2021 11:54:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229813AbhCEQx7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Mar 2021 11:53:59 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1273AC061756
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Mar 2021 08:53:58 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id d11so2818058wrj.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Mar 2021 08:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=O4/mkTL6M9iIF5bbEVObqOvdJSPyd1/G7aJHXSgDKpw=;
        b=P6zc3Aqk8xXVDHk4SOmN0kixRtIq1PQqeb40LJzZjjPKp9p8kQkIuuyrX+R7VJj+qq
         JRhXNI2Zq3NLkluzxqWB6jygvesEqJV+wpIVP1a6TD2f0BoZDWsKkbmsP39GIWIafSt5
         c9MJTkYukxlYiu2QSP6Ni9E91pflM2k15p2OauY5YgsBB84L3oMbvRHD98namkZ1svJS
         pAV9qDzIoAdj5rt6yq5bvUyJflX4+gIlhkYEY3AP6pmBbXptMe/t1/WRghxAMHZA7HHp
         xlf5cMBMkQzL0Fc41WrLD8vtbaBa3IvUQt7nXTZUjWMXnDDSHmncmVK2NaaXIG9+Hy9U
         gzxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=O4/mkTL6M9iIF5bbEVObqOvdJSPyd1/G7aJHXSgDKpw=;
        b=Pt1dZe4CdcfOetUqlhZYpughnVR0yf5WsNIak66RoQwx3iiVgkz5zhheJlyW5GEhxn
         aa9Rydx2Y0sLl0NwHzy9lrQu0gHkxM6q7FOooXRZhKIzp8R2CqY/BahJ9pc3R6HsGOs5
         aqt/p2s1eOfkpzTiMuFNKvL9TeAgYePYmt0WQL6n6psQi6idAagcIYTdPLQcDmP7yPuI
         wm75Dd+yZMAHjYTTHABjWZgzngFszx9NXrRXH9OLGXF9pGYJhKVWkETKPtHbx7M5RORv
         ktFA4gtdWgJ98lHUtWpsyjuX9CCK4dg4SEQQaUHQscw2XyLQ1l2rgWgfQ7OOmJsCxkXm
         h4/Q==
X-Gm-Message-State: AOAM530EmYzAWA9IE44CE8m3H8XqZUjxZ/yUwDtJLNgIhdr3cuxbPSti
        4ShU6xo3i/aCg6fQ/E9aTqxlYg==
X-Google-Smtp-Source: ABdhPJwEC8SQvb3vJ3+exHaXbS0PLR2PQzQ6V/D3Ngcqh6a+Ik3eZhUvWhkMbT3JFyBNQntryfAdTg==
X-Received: by 2002:adf:d217:: with SMTP id j23mr10576262wrh.113.1614963236815;
        Fri, 05 Mar 2021 08:53:56 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:82c:5f0:55da:a740:2edb:1c7e])
        by smtp.gmail.com with ESMTPSA id c35sm4850414wmp.3.2021.03.05.08.53.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Mar 2021 08:53:56 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH 2/2] bus: mhi: pm: reduce PM state change verbosity
Date:   Fri,  5 Mar 2021 18:02:24 +0100
Message-Id: <1614963744-25962-2-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614963744-25962-1-git-send-email-loic.poulain@linaro.org>
References: <1614963744-25962-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Since M3 can be entered/exited quite a lot when used for runtime PM,
keep the mhi suspend/resume transitions quiet.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/bus/mhi/core/pm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
index edd7794..0cd6445 100644
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
@@ -906,7 +906,7 @@ int mhi_pm_resume(struct mhi_controller *mhi_cntrl)
 	enum mhi_pm_state cur_state;
 	int ret;
 
-	dev_info(dev, "Entered with PM state: %s, MHI state: %s\n",
+	dev_dbg(dev, "Entered with PM state: %s, MHI state: %s\n",
 		 to_mhi_pm_state_str(mhi_cntrl->pm_state),
 		 TO_MHI_STATE_STR(mhi_cntrl->dev_state));
 
-- 
2.7.4

