Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A4E227D506
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Sep 2020 19:52:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727936AbgI2Rwz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Sep 2020 13:52:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728020AbgI2Rwv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Sep 2020 13:52:51 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 975C2C061755
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2020 10:52:51 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id d9so5328432pfd.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2020 10:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=mLM1ooiBRvHKnVHboD9nW5AfyUuBhafQkkCUD3MREGQ=;
        b=qMR468WZbOAjo7zHG2aH9sUuHVlzp0rlzLxGllyORpGs5bHkWQreaKMAwYujLq3+mw
         fZCTBqaOPxVc7JNUjkq6874llC/dlFjQyiv+jg+VFknFOBzTb+I/Dkl3m3kpoaegDjrW
         0H0dUAZXrY2yiI00td19qs2mAs4+zlqRLOFVJV6E7w9FMZb6aep8rYPSN7wdzrYmoqP8
         8ByiNKL1hQbWpmdQyGfIwkpGCST2Y4CL73x3/9OVg1ZEiDqJbHhi62cppFhX8k4np8H0
         WsDlMcDjPPIo7heKG29BQVeazNalbguR8GUZjbUZOrSUMUpdYdCPIPvp5o5BD2EJ8F5z
         Nvvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=mLM1ooiBRvHKnVHboD9nW5AfyUuBhafQkkCUD3MREGQ=;
        b=eM7q/9Lx4JEwUzIem/1gNyc0lvY1Z6VGDKuV3HHC6JwQK8KYtetOOWLKbwLBGdkIBb
         fo31Oag+52UfSHh6CPrUK25gLhpszGTuWg22BkdzTtqt7gRMR5pMQJfJ+zZEfDUmzTqh
         5PQVqPnfYpl5dm5XrEfp2/wyIl0Z1NBRQlfsf+4pgCkFeqlnzgfciRLv8uZTYCkwI+nS
         WGtPPska/Z1ah8FKMjIIxT8J82m9qSY3tKVfOYGE8g7EnryXkG5daGC+xbZR0Lxbn6rl
         /1Xc70uhRjVWFbdt5RCQw8PsEm6qyqeb+dKtLmm2xu0HEEEmnFEMDTXjjR0O8eBu3R4s
         QUKA==
X-Gm-Message-State: AOAM530JM2pl0kqKv6C1TWqC6I6CDBL2fR89n622hYlIBdF0Po/vdB8S
        +QusXHbVbKQNzU3EKhMag1my
X-Google-Smtp-Source: ABdhPJxCqpIxlMVjTvyMq79uKt7Qm0iPci+xymbV4P64uZJnQN5NYNzfW4rnWAADl5m8YDK2I95SRw==
X-Received: by 2002:a63:4c4e:: with SMTP id m14mr3876393pgl.199.1601401971037;
        Tue, 29 Sep 2020 10:52:51 -0700 (PDT)
Received: from Mani-XPS-13-9360.localdomain ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id r188sm6271046pfc.67.2020.09.29.10.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 10:52:50 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 05/19] bus: mhi: core: Trigger host resume if suspended during mhi_device_get()
Date:   Tue, 29 Sep 2020 23:22:04 +0530
Message-Id: <20200929175218.8178-6-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200929175218.8178-1-manivannan.sadhasivam@linaro.org>
References: <20200929175218.8178-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bhaumik Bhatt <bbhatt@codeaurora.org>

It is possible that the host may be suspending or suspended and may
not allow an outgoing device wake assert immediately if a client has
requested for it. Ensure that the host wakes up and allows for it so
the client does not have to wait for an external trigger or an
outgoing packet to be queued for the host resume to occur.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/pm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
index b227d415e937..27bb471c8f4e 100644
--- a/drivers/bus/mhi/core/pm.c
+++ b/drivers/bus/mhi/core/pm.c
@@ -1112,6 +1112,9 @@ void mhi_device_get(struct mhi_device *mhi_dev)
 
 	mhi_dev->dev_wake++;
 	read_lock_bh(&mhi_cntrl->pm_lock);
+	if (MHI_PM_IN_SUSPEND_STATE(mhi_cntrl->pm_state))
+		mhi_trigger_resume(mhi_cntrl);
+
 	mhi_cntrl->wake_get(mhi_cntrl, true);
 	read_unlock_bh(&mhi_cntrl->pm_lock);
 }
-- 
2.17.1

