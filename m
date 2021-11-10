Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28AB544C45D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Nov 2021 16:28:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232298AbhKJPau (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Nov 2021 10:30:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231408AbhKJPat (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Nov 2021 10:30:49 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98773C061764
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Nov 2021 07:28:01 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id u25so3320802ljo.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Nov 2021 07:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4zOFv67asxS9RuGrXo7jh6CFnEXTC8og6vVoKY4LjdA=;
        b=dKTZDxZnFyfZnDF/7+FDyAbpLabV2C6beYNKQm3aXgkmOR7HDZfaGzu0GF4z3qpGAZ
         53qdCkyDwlvh0li7TMxwTms3AMA6oquwp7CoZwrZMAn9ilaWtl1o0j3yb88ek29IJSO6
         TBAGRMLmC3xNLjH7K7er+di62JCpvZYFwdModQ3SXuxLBC1cWfVC94Gj8TwBn2n85qL+
         C6DJtebzshRUyJzhCi0u3cC8/7zgHO4aljzWcezKys0xsFDcgCFVld6br+Z8Jgg1a80V
         Tjp65MxyzaAiohAZjk30mcFF7HKnp5mCJZtqbOwAV2GCIH8BiaHNZpVxkeVfU0chygUW
         iqLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4zOFv67asxS9RuGrXo7jh6CFnEXTC8og6vVoKY4LjdA=;
        b=UL4RQ2H/HgHJXiAYlKIwn27SyCdq8swpwZsf5a/fukEWVL21AyZZFy54hsgajkz4Sl
         kcPgjxuVvntkUQc2XWArWyAYlwv0u1heuFW3NJkBlUFSnfciGNx0giAwme9zEbqNbJbq
         uQe3gpt8Wqz9TpM7OdmjMHqxmYB4UdJCd/m1i69iYEhIQzrOkaaWEGRAGbtp9GvTeiFj
         FDIlNeQqubmLb/oWaI0KeRukaDO+WUBOjxo1Wt8xeZJdydhqiY5okPlhlnHzVcAOh3Fs
         kHhBkjnW+n+hFxb0P2rjR0wIPsvxl7OzJy2tBUTvD75InjfobrwYGPN14wIVb2XTifGT
         n1qA==
X-Gm-Message-State: AOAM530U3MOaclqopH1nehphjZBQFKERIQt6CFvKMHZ64eppFFEWBiOs
        H1LBHMxVOLnRvFyqabp29eOpgB4/+fZFuzqy
X-Google-Smtp-Source: ABdhPJyEEIG44DO6Su4GKYp/9Ov/1Tg8r601opZEDDnP8i/Bc4qEX3Mea4xmbxRrX/0WgOY5cm/62g==
X-Received: by 2002:a2e:a30f:: with SMTP id l15mr236249lje.135.1636558079985;
        Wed, 10 Nov 2021 07:27:59 -0800 (PST)
Received: from localhost.localdomain (62-248-207-242.elisa-laajakaista.fi. [62.248.207.242])
        by smtp.gmail.com with ESMTPSA id z2sm19367lfu.94.2021.11.10.07.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 07:27:59 -0800 (PST)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Viresh Kumar <viresh.kumar@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Thara Gopinath <thara.gopinath@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org
Subject: [PATCH] cpufreq: qcom-hw: Fix exposed stack contents
Date:   Wed, 10 Nov 2021 17:27:45 +0200
Message-Id: <20211110152745.1868099-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On irq request it is improper to pass its designated name, which is
allocated on stack, because the irq name string is not copied, thus
there is a risk of leaking partial stack contents to userspace.

Fixes: 275157b367f4 ("cpufreq: qcom-cpufreq-hw: Add dcvs interrupt support")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/cpufreq/qcom-cpufreq-hw.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/cpufreq/qcom-cpufreq-hw.c b/drivers/cpufreq/qcom-cpufreq-hw.c
index a2be0df7e174..b772d8ed9a77 100644
--- a/drivers/cpufreq/qcom-cpufreq-hw.c
+++ b/drivers/cpufreq/qcom-cpufreq-hw.c
@@ -375,7 +375,7 @@ static int qcom_cpufreq_hw_lmh_init(struct cpufreq_policy *policy, int index)
 {
 	struct qcom_cpufreq_data *data = policy->driver_data;
 	struct platform_device *pdev = cpufreq_get_driver_data();
-	char irq_name[15];
+	char *irq_name;
 	int ret;
 
 	/*
@@ -392,9 +392,11 @@ static int qcom_cpufreq_hw_lmh_init(struct cpufreq_policy *policy, int index)
 	mutex_init(&data->throttle_lock);
 	INIT_DEFERRABLE_WORK(&data->throttle_work, qcom_lmh_dcvs_poll);
 
-	snprintf(irq_name, sizeof(irq_name), "dcvsh-irq-%u", policy->cpu);
-	ret = request_threaded_irq(data->throttle_irq, NULL, qcom_lmh_dcvs_handle_irq,
-				   IRQF_ONESHOT, irq_name, data);
+	irq_name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "dcvsh-irq-%u",
+				  policy->cpu);
+	ret = devm_request_threaded_irq(&pdev->dev, data->throttle_irq, NULL,
+					qcom_lmh_dcvs_handle_irq, IRQF_ONESHOT,
+					irq_name, data);
 	if (ret) {
 		dev_err(&pdev->dev, "Error registering %s: %d\n", irq_name, ret);
 		return 0;
-- 
2.32.0

