Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9628C23A0AA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Aug 2020 10:08:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725948AbgHCIIm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Aug 2020 04:08:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725933AbgHCIIl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Aug 2020 04:08:41 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7D23C06174A
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Aug 2020 01:08:41 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id p3so19433055pgh.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2020 01:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=PkmepxYYZt/gqn/wBw6S8aNdATAO4cXfwYhCsxDd/Ng=;
        b=a8TS8r5mQuMldgAH/R3NmPcGGy9ukPw0/rhTRH7cOtb2vPUdd8obl4siT0oAArbwmN
         kAuEqDRC24QX2Cp8DmgkfIy+K7FDQ2jz2lkV3DKVSZ+Gcv5flRNHqrrlSXu97E3cmeOS
         I52aNv7nFo9wltaDnUuCS5AVNdaQeckYIMJkI+mW5Mhw4krNS37BYv6fAgyg6gWdXe7t
         gIc8srHkvwg9RGR7HULvDrnxt8uv5sCzrvaHTtU5Zbr5Dk4KDeM0KvWJmliq8bHvqJQg
         WSo4LxwSQsY2uOcH/CWrxg1t+Oc1xj/p8DLvHfRbK59YGY3XdhrYtzZaDVvKCtPe6NCb
         f6jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=PkmepxYYZt/gqn/wBw6S8aNdATAO4cXfwYhCsxDd/Ng=;
        b=lVYLTbAvZ6SBLYF5DNTVZkSEc5OAcQS9OXGoXJyDboJtSl4n+BTd6zsDyXsOr3t5xi
         D9k22PsX/AcmBPU9pMB4dnt86JspCHVf7Uw111cQShuzeNeNzLvQEev+xUSB8YvNvSWu
         2CSAz78xDkje7CPYbaXEMk/8ngVHHC3RH/N6xsI/p6kLMJ97MWY4aN4kRJ+q0VJLsnrq
         IqUjKytyrM3ip8h9i/qphz0AIHRNngDcwwcOoB3KV4V0X6wnNLs6jjx7eRE72lghpERv
         50kgKUjjBKCjrbWckFAZJZxHzbuHfMBJpojZ5tF4EGK5/aWHi8aMRwa8WE7kulRDTYzp
         WB/A==
X-Gm-Message-State: AOAM530+a3hlXrqzXKUwJWtTbE8VQby6ghzNzgAjRkwOevtpDa6EMaA4
        ZKliBoe9ZPU7kOwYEoqqD8K23Q==
X-Google-Smtp-Source: ABdhPJzUXgJNCtWqsgjWMPHtkAVu5jZs/8pYf/KbIST56Ur1am3XBMFdL2PaUaOj2bijUvrdbFWD5A==
X-Received: by 2002:a65:6554:: with SMTP id a20mr12439078pgw.301.1596442121516;
        Mon, 03 Aug 2020 01:08:41 -0700 (PDT)
Received: from localhost.localdomain (li519-153.members.linode.com. [66.175.222.153])
        by smtp.gmail.com with ESMTPSA id y23sm18609226pfb.66.2020.08.03.01.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2020 01:08:40 -0700 (PDT)
From:   Jun Nie <jun.nie@linaro.org>
To:     shawn.guo@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org
Cc:     Jun Nie <jun.nie@linaro.org>
Subject: [PATCH] i2c: qup: use pm runtime func to manage clk
Date:   Mon,  3 Aug 2020 16:08:08 +0800
Message-Id: <20200803080808.28134-1-jun.nie@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use pm runtime callback to manage clock. Otherwise, clock is
enabled in resume without notifying pm rumetime core and result
no gating in next suspend.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/i2c/busses/i2c-qup.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qup.c b/drivers/i2c/busses/i2c-qup.c
index fbc04b60cfd1..b447fcbaa3f0 100644
--- a/drivers/i2c/busses/i2c-qup.c
+++ b/drivers/i2c/busses/i2c-qup.c
@@ -1943,15 +1943,13 @@ static int qup_i2c_pm_resume_runtime(struct device *device)
 #ifdef CONFIG_PM_SLEEP
 static int qup_i2c_suspend(struct device *device)
 {
-	if (!pm_runtime_suspended(device))
-		return qup_i2c_pm_suspend_runtime(device);
+	pm_runtime_force_suspend(device);
 	return 0;
 }
 
 static int qup_i2c_resume(struct device *device)
 {
-	qup_i2c_pm_resume_runtime(device);
-	pm_runtime_mark_last_busy(device);
+	pm_runtime_force_resume(device);
 	pm_request_autosuspend(device);
 	return 0;
 }
-- 
2.17.1

