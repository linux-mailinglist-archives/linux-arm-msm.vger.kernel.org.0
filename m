Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 584952CB971
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Dec 2020 10:45:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388374AbgLBJo0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Dec 2020 04:44:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728701AbgLBJoZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Dec 2020 04:44:25 -0500
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5F0AC09424A
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Dec 2020 01:43:45 -0800 (PST)
Received: by mail-pj1-x1044.google.com with SMTP id v1so704127pjr.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Dec 2020 01:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aCsmJ1k49Ua8PjKSNyR1qR4vjZ+Bg7VpSSpGmvdAxP4=;
        b=iURQzayB6DZcAa6cIYUASPN9FTCA/rrz22OrT9v/7F9lTCleMF4QmpQWCJKUdxeYb6
         VZVXrz/e0pPSGKvrnswS0l3+fv9vvB/kLMUK4IekhjY9lNBv3o5dHs76bIXg4bZ6S348
         l5Dq0b2z4bRJ6UigcPOdRLyow/h4T9Q4nLJOfaFNYiGp6gmYAKN9ukGjhQYimcsJE4WM
         TGU5Gmda75k6nJgeQ9PBfFweTYEBGbnWMls4tQ5Vvy5+ybAZ/lUB/Sw5Ioj7hmfKxbhX
         TPYpWhKWBlmn7MOZ0KwIPSDVummw0SjctlVWN73UojBkgVsCNdmUJxFV3wvS8bAPowx+
         zp0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aCsmJ1k49Ua8PjKSNyR1qR4vjZ+Bg7VpSSpGmvdAxP4=;
        b=T0MyeIM2W4swkoajy1r0PQKTwv2ZiONMkDvA8bmbh8iRIvuMLJZcPkq4tcg7GCciyD
         bUYe/NOpf/71slpFrsNUdpU7MrUMaJAHkBh8Zur+4lbJshLGCDig/2cI13NWmVNfUx5P
         M+JliYWleaCjrSSn1B/7oMAsufbr4IAkaxUMLjAfCk8eG7wm+Pc7Pm4ojCEqwiWrGMw9
         eVzI7AWgwJTt/rvdDQFyLEmBp6VuGRS6fyYE4hJK2PD/OvTQlff4Dw4n6RYO70E2KWDR
         lTHnDPRi1qDWLRvsldelzumMIxEvDzIiSTQTl5CiF/Ilph+MnvbANSLr+sXev4JKnGGI
         +NOg==
X-Gm-Message-State: AOAM531Z7ppzhaeCdcSf50JezrRdFZ0JHjWrCKSFZBoB5xYPWIPbWwvw
        pdVDkRu7dBy3tmeNU7TQ5o7v
X-Google-Smtp-Source: ABdhPJyNpOygX8eW+/DYizhm4A7Zc6qNs9dxEOdUDzXeLw9H4ncoSp6qvX5OPpnzTZDEY2TcPMxEvg==
X-Received: by 2002:a17:90a:7d0c:: with SMTP id g12mr1588052pjl.77.1606902225327;
        Wed, 02 Dec 2020 01:43:45 -0800 (PST)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id bg8sm1393990pjb.52.2020.12.02.01.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Dec 2020 01:43:44 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org, loic.poulain@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 20/29] bus: mhi: core: Move to an error state on mission mode failure
Date:   Wed,  2 Dec 2020 15:11:50 +0530
Message-Id: <20201202094159.107075-21-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201202094159.107075-1-manivannan.sadhasivam@linaro.org>
References: <20201202094159.107075-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bhaumik Bhatt <bbhatt@codeaurora.org>

If the host receives a mission mode event and by the time it can get
to processing it, the register accesses fail implying a connectivity
error, MHI should move to an error state. This helps avoid longer wait
times from a synchronous power up perspective and accurately reflects
the MHI execution environment and power management states.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/pm.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
index 029919647002..06adea2580d2 100644
--- a/drivers/bus/mhi/core/pm.c
+++ b/drivers/bus/mhi/core/pm.c
@@ -383,10 +383,14 @@ static int mhi_pm_mission_mode_transition(struct mhi_controller *mhi_cntrl)
 	write_lock_irq(&mhi_cntrl->pm_lock);
 	if (MHI_REG_ACCESS_VALID(mhi_cntrl->pm_state))
 		mhi_cntrl->ee = mhi_get_exec_env(mhi_cntrl);
-	write_unlock_irq(&mhi_cntrl->pm_lock);
 
-	if (!MHI_IN_MISSION_MODE(mhi_cntrl->ee))
+	if (!MHI_IN_MISSION_MODE(mhi_cntrl->ee)) {
+		mhi_cntrl->pm_state = MHI_PM_LD_ERR_FATAL_DETECT;
+		write_unlock_irq(&mhi_cntrl->pm_lock);
+		wake_up_all(&mhi_cntrl->state_event);
 		return -EIO;
+	}
+	write_unlock_irq(&mhi_cntrl->pm_lock);
 
 	wake_up_all(&mhi_cntrl->state_event);
 
-- 
2.25.1

