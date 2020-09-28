Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A481427A62F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Sep 2020 06:11:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726705AbgI1ELF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Sep 2020 00:11:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726702AbgI1ELD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Sep 2020 00:11:03 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CE45C0613CF
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2020 21:11:03 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id o20so8132224pfp.11
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2020 21:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=JMSzjnZoFPF6UWbIK88WIGtNwMDAVVwPEVBN0nLk6ZA=;
        b=m+tEeKFm0efkXSSMp4n1PbZzLbUsxFZzLuYHss7vX5TFP1/24DQszkvbNvNpi9XeHm
         oMo+94cNk1lPBpfaMlhbj1tUdwo28Tv4IUqa2Sgs7MENTrB0hAcRupdgDKrDKSkH/Lqq
         qLx3Q//EkqABDc+M6qoBw3msFhpy/VLo96X5WGHSKxygRrvFzCHleYpV4ekxQ/FaIc+r
         JlOIwt88P75Gn0OeodlPfAfBRt/D1pTggN3Ac3iXAzdvqQVMaCr/4E3fOzav8mTZC3nR
         Kn95D4tynpTuA+iYfkyCF+97YXlQ+ETkFw29fId4USazidqv84Z+ETRNqgLUDhuCNZPi
         1brg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=JMSzjnZoFPF6UWbIK88WIGtNwMDAVVwPEVBN0nLk6ZA=;
        b=XYga3QQzgaJE0DhXnqGtfmCAcCUJR7oasT4EkKN5pjObxO3toa53hkhcgHIzFEjxIh
         9+iPjbRjcTjoBJJv7SL4D6rUZ5YZB3XWSKXhvbEH4/vgG2O+v0zApIsbj4v15PqsL2+C
         EaeMZlJANeHIiAwwS379rEkSI09Qx+970kB0heTziyQ9G2wMdr2f93cQRe/WQR/kGrDo
         ju02ofdluTCmUR4t19HpoTFbpfnr8LVgs6TlrQbaVxEAz2rVwRZwnJ2vzERUA/0MEEKX
         6ezHYzdWn21uHuWn1QLpe7zz92cfGOUAwNVsOMImKHnQcJI/pgrWHnq21Ak6JpoZ0Vry
         RIAA==
X-Gm-Message-State: AOAM531xhTTo7KvbZgoq+AaLzXzCts1PMh04FDo9AyFo5Tam+TymXY6E
        EhDdg1tTTWQtquLIbmBUcAU0
X-Google-Smtp-Source: ABdhPJwwKqwrVPktFn60oMw4LFMpJij3yFG0pFb+NIUkdFoTAa7Db/LFR7YwhBxxZIAt6CDtoQoPJQ==
X-Received: by 2002:a17:902:146:b029:d2:5615:5700 with SMTP id 64-20020a1709020146b02900d256155700mr9286113plb.84.1601266262719;
        Sun, 27 Sep 2020 21:11:02 -0700 (PDT)
Received: from Mani-XPS-13-9360.localdomain ([2409:4072:6003:40df:7c40:5a87:eb86:87b0])
        by smtp.gmail.com with ESMTPSA id n21sm8306322pgl.7.2020.09.27.21.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2020 21:11:02 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 08/21] bus: mhi: core: Introduce counters to track MHI device state transitions
Date:   Mon, 28 Sep 2020 09:39:38 +0530
Message-Id: <20200928040951.18207-9-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200928040951.18207-1-manivannan.sadhasivam@linaro.org>
References: <20200928040951.18207-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bhaumik Bhatt <bbhatt@codeaurora.org>

Use counters to track MHI device state transitions such as those
to M0, M2, or M3 states. This can help in better debug, allowing
the user to see the number of transitions to a certain MHI state
when queried using debugfs entries or via other mechanisms.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/pm.c | 4 ++++
 include/linux/mhi.h       | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
index 27bb471c8f4e..ce4d969818b4 100644
--- a/drivers/bus/mhi/core/pm.c
+++ b/drivers/bus/mhi/core/pm.c
@@ -256,6 +256,7 @@ int mhi_pm_m0_transition(struct mhi_controller *mhi_cntrl)
 		dev_err(dev, "Unable to transition to M0 state\n");
 		return -EIO;
 	}
+	mhi_cntrl->M0++;
 
 	/* Wake up the device */
 	read_lock_bh(&mhi_cntrl->pm_lock);
@@ -326,6 +327,8 @@ void mhi_pm_m1_transition(struct mhi_controller *mhi_cntrl)
 		mhi_cntrl->dev_state = MHI_STATE_M2;
 
 		write_unlock_irq(&mhi_cntrl->pm_lock);
+
+		mhi_cntrl->M2++;
 		wake_up_all(&mhi_cntrl->state_event);
 
 		/* If there are any pending resources, exit M2 immediately */
@@ -362,6 +365,7 @@ int mhi_pm_m3_transition(struct mhi_controller *mhi_cntrl)
 		return -EIO;
 	}
 
+	mhi_cntrl->M3++;
 	wake_up_all(&mhi_cntrl->state_event);
 
 	return 0;
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index bb337d163dda..c56b4447a4e9 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -328,6 +328,7 @@ struct mhi_controller_config {
  * @dev_state: MHI device state
  * @dev_wake: Device wakeup count
  * @pending_pkts: Pending packets for the controller
+ * @M0, M2, M3: Counters to track number of device MHI state changes
  * @transition_list: List of MHI state transitions
  * @transition_lock: Lock for protecting MHI state transition list
  * @wlock: Lock for protecting device wakeup
@@ -407,6 +408,7 @@ struct mhi_controller {
 	enum mhi_state dev_state;
 	atomic_t dev_wake;
 	atomic_t pending_pkts;
+	u32 M0, M2, M3;
 	struct list_head transition_list;
 	spinlock_t transition_lock;
 	spinlock_t wlock;
-- 
2.17.1

