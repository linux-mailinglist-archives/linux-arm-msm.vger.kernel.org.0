Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0C9A272B1E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Sep 2020 18:10:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728072AbgIUQKZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Sep 2020 12:10:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728070AbgIUQKY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Sep 2020 12:10:24 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50654C0613CF
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2020 09:10:24 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id k14so9439300pgi.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2020 09:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=JMSzjnZoFPF6UWbIK88WIGtNwMDAVVwPEVBN0nLk6ZA=;
        b=EeEywDoSwGRzEUC249BrXsO5YAVjp38NLGC9vWyy3umokPXd3Is7NYC8/85/SF80/C
         HDkNINxRHcD4oV8LPG4mb55REayGb15zbOl61ujEbvl7EHKnioi/uNv/hQuFIMKIyAW3
         8qTrng4DySI7pfguYgUvIac1V8HmwzFu0ygTS7KU2veioftcrdVSZwvz1qYIn8hR6w1U
         Hs2mXqISkfBc2Mlp4NDygoHNOjLfRJMsrZEzTcQBDHZezgybVCXuqsN6qn2V7sq25/7I
         KKBMijlHO1nyQjj+tegMX02PWvcDePL+avczuD0oDx/5uXzcq2bw9UpgIl0q1UaToBPY
         Hkxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=JMSzjnZoFPF6UWbIK88WIGtNwMDAVVwPEVBN0nLk6ZA=;
        b=VsK29i4Yk0TNGCq2forYPQwvMmOZsoFXa6vBzbVXsJti3S37H5hFLroFzdfw8KdHQW
         79iXu4j1fxBmuUFEwZ/BDppq7vrAwNLMJG5knsw2b4vZgGSTVPiRFgJzj3eR6Yyty0ik
         l13EfDLX96dNSn4GHpiHlgkM1lMbXfeXsmW9PPtN6DQuhEPaVKoCBAY3nJ4MuZJPExx9
         FUHWPh0H/9uuLvpoPTRIbX5vEcnOYMI79yrth722F2aHN/SU0xB4Lm1rQqfk2VXir47x
         cf23izDYHELcLK8QnQe13xADLnR/sQt42qvNOpKOMbGIlJsapb4lDzex7GbSTmCxmsQJ
         ihvA==
X-Gm-Message-State: AOAM533nyhToAP+zxO7uuoLCsB5KXIJjt8swq+JgonAuQC5ew4140M/M
        +QVfCj289t5eCS4oE9fbd8mR
X-Google-Smtp-Source: ABdhPJxr/hw/GlBiopC8cgyuObHmQpvPXB3uTO3S0LGg+QQxmAWO/dPgId9Ub/y/HEjLAuhmH+Hgcw==
X-Received: by 2002:a17:902:8682:b029:d1:e5e7:be5b with SMTP id g2-20020a1709028682b02900d1e5e7be5bmr550986plo.53.1600704623762;
        Mon, 21 Sep 2020 09:10:23 -0700 (PDT)
Received: from Mani-XPS-13-9360.localdomain ([2409:4072:6d03:bd12:1004:2ccf:6900:b97])
        by smtp.gmail.com with ESMTPSA id f4sm9204577pgr.68.2020.09.21.09.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 09:10:23 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, jhugo@codeaurora.org,
        bbhatt@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 08/18] bus: mhi: core: Introduce counters to track MHI device state transitions
Date:   Mon, 21 Sep 2020 21:38:05 +0530
Message-Id: <20200921160815.28071-10-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200921160815.28071-1-manivannan.sadhasivam@linaro.org>
References: <20200921160815.28071-1-manivannan.sadhasivam@linaro.org>
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

