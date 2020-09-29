Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E62A27D50E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Sep 2020 19:53:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728058AbgI2RxH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Sep 2020 13:53:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728166AbgI2RxD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Sep 2020 13:53:03 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8981C061755
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2020 10:53:03 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id 7so4449448pgm.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2020 10:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=JMSzjnZoFPF6UWbIK88WIGtNwMDAVVwPEVBN0nLk6ZA=;
        b=kb8Dglyz0c90un0H+tM53KPlqGyODKsr85qGzPy0tOBCsO8WT/URuluK/40CNWMQ8z
         M811HQjc0VhEjs2RedC6CJPBEBKvIdFUAA3lPj8j/W6+rMsrmMBbh9lzYNVsVF82nMu3
         VgUnzeXbCUq00P3ko3E1mqK+4NK48woHMC50q6gilbQNTTo+RgjABOiNRy1jRbgFiOsr
         04BrIJSBEeGpt5P2/VdrIBDhAUzJ2ghgbnLiHJ2SIWm2uD8WSD/rsSb0FibnCOCCtnhF
         QoHFsQFIuibBiujGR904OjIjwQAn7ZPh4RcHy1vFI0BowOlGpsT/xrKwopLTFvJNNqIG
         CV7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=JMSzjnZoFPF6UWbIK88WIGtNwMDAVVwPEVBN0nLk6ZA=;
        b=NEykJ+lfd4+n+bG5TViNlJJw++GnQNc8r0EDvpjIgkA74q/vUIkGrf+/fGy4SWsotf
         qHrdWLR+WGN9+YKuAuleiw/7lEeparRndzj5vjnYEfMW7kT9p4MsSSJWjd8gT84HkkQ/
         RFJrKQC/oepJRt5t6+3YCBif15Yy/6MjghO5Nx735tBqMt9tsYAHy06LTG1YaFI1zeCz
         7rpWbKGZjWV43Gz4A4y9nhWYu/1Q4RRS1tn6+8ZCaUyWTDjYku80d7WMOP7k8ZB9Qs9W
         Dcnopn6Abv1qvvlB97Rxf6OhG1NRHYKi6KEqubsAbe+LJP0TSaIOXRAb2LIC0bZUz7gk
         PrCA==
X-Gm-Message-State: AOAM533C7k82rJUneObNkbjWXyFdoQcp8DeoO0beRt0YeYojfH3yUqN3
        HcI3yMde5XCy/ilw5lKs93fC
X-Google-Smtp-Source: ABdhPJxSRajMbPNGYzU/2wn1LjkBbTcz4igHUir2ZhrlxBVIAv/5MHMFg84W1Mafwmg+XacUnt9XyA==
X-Received: by 2002:a17:902:b587:b029:d2:80bd:2f0c with SMTP id a7-20020a170902b587b02900d280bd2f0cmr5763232pls.60.1601401983175;
        Tue, 29 Sep 2020 10:53:03 -0700 (PDT)
Received: from Mani-XPS-13-9360.localdomain ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id r188sm6271046pfc.67.2020.09.29.10.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 10:53:02 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 08/19] bus: mhi: core: Introduce counters to track MHI device state transitions
Date:   Tue, 29 Sep 2020 23:22:07 +0530
Message-Id: <20200929175218.8178-9-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200929175218.8178-1-manivannan.sadhasivam@linaro.org>
References: <20200929175218.8178-1-manivannan.sadhasivam@linaro.org>
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

