Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E59E3DAC2D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2019 14:28:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393750AbfJQM2M (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Oct 2019 08:28:12 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:32806 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393817AbfJQM2I (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Oct 2019 08:28:08 -0400
Received: by mail-pg1-f196.google.com with SMTP id i76so1296576pgc.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2019 05:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=smRwPgvncTjnAR1YtPvLb1bA4/kxUscSlcxDGMtB+pk=;
        b=CXTEhQJBPSdCMw+IoywZVcKHtNxz/LdSoAfySQJBtoF3why8XyOtLveH0F98ftlzbg
         lGN1tXAB5pOEi228FfTu3mTnbXXgzEL8jxCzcBQNqxu2Z8iqUYLRzTfa20NlNC2uWZ1A
         csJXKyMDgWRqHhEHI3FWP4EE7cwtkQ6TyPV0ntYhcX+uT1/ULigN1FbKODf9k4HqW+nx
         s1fLpu7h7BX13D552cMBe2TzriGx4y8IjiEFvEIpuM9W2e9wMrAOZlCFxB7Z3qrlIFgN
         NsDhWCfxagZcFmKo4ORUuv9OA75QRv2XeYORTsFjVx57Kj0GcbMHNK+j7izjMyYer3UC
         Hb2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=smRwPgvncTjnAR1YtPvLb1bA4/kxUscSlcxDGMtB+pk=;
        b=QwbnS+pvTUi97uUnPQFNRKIVfKUKEG/m0CygWGmCG+r+p7eLRwat7tLcuIldFv+mwS
         YKpIW5Vr2oqNaOZF++qX972fqXJeIGdmRRA0Zyr1O561r8FmgwxMBuzS7NPnphroiAy2
         b1ChJD0ktO8sz1/tV2XvV+/ZhotX1PSdzEaMB9aq5usZBAmHwqqPITuoXaufsyOnwpz+
         IbYpJVvidBDDXnAcHhhEdKLHOL6qkLxXG6pBz3WB3CG8XSbVKfYpycdRhPkdRItpEgZN
         QNUp8r56FT6kBl/8e0sQ9EYOE8VOhdn+i7qDq0En7omR1ODTtdh/9svqPg3VxNwZy5on
         F0xg==
X-Gm-Message-State: APjAAAWXS5x2LNIqYj97H1UfBbgy67FOn7W1Qe5GoF6b7QseWdXyqEWS
        x8y6j6Pk/Qz2dXPZaAO+iCUzCg==
X-Google-Smtp-Source: APXvYqwv1uq5A9qIqW0buX8pAXgbhIdbQCV4Xyis8lzdNFPlH5cGLHz39J+R4PxT0WHConQkAoKbvg==
X-Received: by 2002:a62:7643:: with SMTP id r64mr3573835pfc.106.1571315286536;
        Thu, 17 Oct 2019 05:28:06 -0700 (PDT)
Received: from localhost ([49.248.54.231])
        by smtp.gmail.com with ESMTPSA id c128sm2897104pfc.166.2019.10.17.05.28.05
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2019 05:28:05 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        daniel.lezcano@linaro.org, viresh.kumar@linaro.org,
        sudeep.holla@arm.com, bjorn.andersson@linaro.org,
        edubezval@gmail.com, agross@kernel.org, tdas@codeaurora.org,
        swboyd@chromium.org, ilina@codeaurora.org,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     linux-pm@vger.kernel.org
Subject: [PATCH v3 6/6] cpufreq: qcom-hw: Move driver initialisation earlier
Date:   Thu, 17 Oct 2019 17:57:38 +0530
Message-Id: <3468b8cf9c764ea139296ee149d33cd7a9d79e3e.1571314830.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1571314830.git.amit.kucheria@linaro.org>
References: <cover.1571314830.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1571314830.git.amit.kucheria@linaro.org>
References: <cover.1571314830.git.amit.kucheria@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Allow qcom-hw driver to initialise right after the cpufreq and thermal
subsystems are initialised in core_initcall so we get earlier access to
thermal mitigation.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/cpufreq/qcom-cpufreq-hw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpufreq/qcom-cpufreq-hw.c b/drivers/cpufreq/qcom-cpufreq-hw.c
index a9ae2f84a4ef..fc92a8842e25 100644
--- a/drivers/cpufreq/qcom-cpufreq-hw.c
+++ b/drivers/cpufreq/qcom-cpufreq-hw.c
@@ -334,7 +334,7 @@ static int __init qcom_cpufreq_hw_init(void)
 {
 	return platform_driver_register(&qcom_cpufreq_hw_driver);
 }
-device_initcall(qcom_cpufreq_hw_init);
+postcore_initcall(qcom_cpufreq_hw_init);
 
 static void __exit qcom_cpufreq_hw_exit(void)
 {
-- 
2.17.1

