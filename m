Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6DCEBB05A5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2019 00:33:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728943AbfIKWc7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Sep 2019 18:32:59 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:39991 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728380AbfIKWc7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Sep 2019 18:32:59 -0400
Received: by mail-pg1-f193.google.com with SMTP id w10so12277358pgj.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Sep 2019 15:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=eHfwVmwRPrvBBQCHCMtELR2XIT6WK3JZDo6MrEMP+JI=;
        b=iIqmRKYbvavAa/xuuU8kPkn7fxW5tBdl+m37NywaOZtqPeAc9v+0vQMv1An+TbS/lq
         h2h/lvNN7VuQCP5dJHAqjPqeE84W7DrbhAXAPa7fOnwH4R9zJCBhJcpU2a7J9weR7se0
         hEZVIg+idKp6P3t3UXVpLxNPkhdMK61ihXOBWZUTZew9Bbo4OYl6lYRkaVfAPVTutAxH
         eQZS0sGdSY+f2lYxtZWKCQt0ptOk112EhKPbLjHY0UUgyM4Dab/lcE2Ye51VrQVmmeUv
         ehGxPIHQpkPl2H0jFp3cQpp0pCy3SJodRf64SQUKKyI6xZ8y/JLjVXSIV7XDFh9HHj2Y
         QQ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=eHfwVmwRPrvBBQCHCMtELR2XIT6WK3JZDo6MrEMP+JI=;
        b=idHUVFMIHWRPN7xpKm6c7hpRRRHBr7TTI8aJroxGXJt9+5Ga4cjjdduCibqqzxuVOs
         E5S5xk3Amg69X5+J9ennD9FbCxx5WFP3ezP14rBI+xURllCMXZWiJBfmkvr+uQW1gZes
         OtrPKK7V7X2n/5Yd5HC/XlwM4x5nrqgS7AGt06fhxrk1FkP6oVPhvd2raped1uI83oL4
         G+6K4YqSLCmSFl5t9qDtTZKC4u6bwvpbSCpyqaS1OU1bRl66OThPv1bmBFassprvI1+P
         pTi1AeeZGGB/s+jzWp20Ez5WFjaMY4mTsrFKXdEtZ7d4LPSJeC/9vAo5MWyk00L0Hvms
         9D+g==
X-Gm-Message-State: APjAAAX2DFmEY9TUvhqCFgSVyEz8lY0htyrCxABsfMmY48TbzuI42+rI
        48usCo1/rclHw+nhtv20HRm8UA==
X-Google-Smtp-Source: APXvYqwXpm2pHm8jH8I/tTmio2/EH4EjPAWMxPZdHsmxvodKvWV4WrJTmQONqaYs2sPtqqMgcPT8dw==
X-Received: by 2002:a17:90a:af8d:: with SMTP id w13mr5333319pjq.141.1568241178117;
        Wed, 11 Sep 2019 15:32:58 -0700 (PDT)
Received: from localhost ([49.248.179.160])
        by smtp.gmail.com with ESMTPSA id t8sm3431343pjq.30.2019.09.11.15.32.57
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Sep 2019 15:32:57 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, edubezval@gmail.com, agross@kernel.org,
        tdas@codeaurora.org, swboyd@chromium.org, ilina@codeaurora.org,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     linux-pm@vger.kernel.org
Subject: [PATCH 5/5] cpufreq: qcom-hw: Move driver initialisation earlier
Date:   Thu, 12 Sep 2019 04:02:34 +0530
Message-Id: <b731b713d8738239c26361ece7f5cadea035b353.1568240476.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1568240476.git.amit.kucheria@linaro.org>
References: <cover.1568240476.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1568240476.git.amit.kucheria@linaro.org>
References: <cover.1568240476.git.amit.kucheria@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Allow qcom-hw driver to initialise right after the cpufreq and thermal
subsystems are initialised in core_initcall so we get earlier access to
thermal mitigation.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 drivers/cpufreq/qcom-cpufreq-hw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpufreq/qcom-cpufreq-hw.c b/drivers/cpufreq/qcom-cpufreq-hw.c
index 4b0b50403901..04676cc82ba6 100644
--- a/drivers/cpufreq/qcom-cpufreq-hw.c
+++ b/drivers/cpufreq/qcom-cpufreq-hw.c
@@ -327,7 +327,7 @@ static int __init qcom_cpufreq_hw_init(void)
 {
 	return platform_driver_register(&qcom_cpufreq_hw_driver);
 }
-device_initcall(qcom_cpufreq_hw_init);
+postcore_initcall(qcom_cpufreq_hw_init);
 
 static void __exit qcom_cpufreq_hw_exit(void)
 {
-- 
2.17.1

