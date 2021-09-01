Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 439443FD5DD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Sep 2021 10:47:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241819AbhIAIso (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Sep 2021 04:48:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:41206 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237776AbhIAIsn (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Sep 2021 04:48:43 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3241360C3E;
        Wed,  1 Sep 2021 08:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630486067;
        bh=hjee9ZpGoWPOZKrOYPxylcSqrwnR6DCr+65oiCiWKxk=;
        h=From:To:Cc:Subject:Date:From;
        b=AG9epuMgTczoC9rKJNkEVF2m1JBwRoOcHa/wrlM/KNNeS9sjrt6OWdLG2aYJieMRQ
         xT19VkF8XU8Ji/sZUKIBO25P4YG7E+P1r8qS4jWJ8BWynMn9yh2An6kH/t0mLzrdrg
         aznFn8UU0KKul6xrHaFF4ZkHjXkYqCA1nb0nnThj4YuPkAavob6FyBPragun7w9Xo0
         U6OjYL27AACfAp53p5+XYQAwfp2qOypB/cKQl0mduyLwN5NJqNDx76R5FDq7EaifHR
         w5mVSCYRF0BwfMXIASQl1Il6jSKXwM6SsNBKXxZHKROLphw8gKb+RivL10oPm3obkF
         RMIQ/ng6olQaw==
From:   Ard Biesheuvel <ardb@kernel.org>
To:     linux-arm-kernel@lists.infradead.org
Cc:     Ard Biesheuvel <ardb@kernel.org>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org
Subject: [PATCH] cpufreq: qcom-cpufreq-hw: Avoid stack buffer for IRQ name
Date:   Wed,  1 Sep 2021 10:47:32 +0200
Message-Id: <20210901084732.943248-1-ardb@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Registering an IRQ requires the string buffer containing the name to
remain allocated, as the name is not copied into another buffer.

So let's add a irq_name field to the data struct instead, which is
guaranteed to have the appropriate lifetime.

Cc: Thara Gopinath <thara.gopinath@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <agross@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
I'm not following msm development closely, so apologies if this was
already fixed, or if this is not based on the right tree.

This fixes a crash on my Yoga C630 when reading /proc/interrupts.

 drivers/cpufreq/qcom-cpufreq-hw.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/cpufreq/qcom-cpufreq-hw.c b/drivers/cpufreq/qcom-cpufreq-hw.c
index 3cc27d9e2ed1..6613228fe68c 100644
--- a/drivers/cpufreq/qcom-cpufreq-hw.c
+++ b/drivers/cpufreq/qcom-cpufreq-hw.c
@@ -44,6 +44,7 @@ struct qcom_cpufreq_data {
 	/* Lock to synchronize between de-init sequence and re-starting LMh polling/interrupts */
 	spinlock_t throttle_lock;
 	int throttle_irq;
+	char irq_name[15];
 	bool cancel_throttle;
 };
 
@@ -371,7 +372,6 @@ static int qcom_cpufreq_hw_lmh_init(struct cpufreq_policy *policy, int index)
 {
 	struct qcom_cpufreq_data *data = policy->driver_data;
 	struct platform_device *pdev = cpufreq_get_driver_data();
-	char irq_name[15];
 	int ret;
 
 	/*
@@ -388,11 +388,11 @@ static int qcom_cpufreq_hw_lmh_init(struct cpufreq_policy *policy, int index)
 	spin_lock_init(&data->throttle_lock);
 	INIT_DEFERRABLE_WORK(&data->throttle_work, qcom_lmh_dcvs_poll);
 
-	snprintf(irq_name, sizeof(irq_name), "dcvsh-irq-%u", policy->cpu);
+	snprintf(data->irq_name, sizeof(data->irq_name), "dcvsh-irq-%u", policy->cpu);
 	ret = request_threaded_irq(data->throttle_irq, NULL, qcom_lmh_dcvs_handle_irq,
-				   IRQF_ONESHOT, irq_name, data);
+				   IRQF_ONESHOT, data->irq_name, data);
 	if (ret) {
-		dev_err(&pdev->dev, "Error registering %s: %d\n", irq_name, ret);
+		dev_err(&pdev->dev, "Error registering %s: %d\n", data->irq_name, ret);
 		return 0;
 	}
 
-- 
2.30.2

