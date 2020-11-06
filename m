Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C061F2A8FE9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Nov 2020 08:06:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726491AbgKFHF3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Nov 2020 02:05:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726440AbgKFHF2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Nov 2020 02:05:28 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AB68C0613D2
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2020 23:05:28 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id r10so218595pgb.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2020 23:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vW0y5O6fj/dSbiX5076IJWx7fOAGTl35MulHK3/J9GA=;
        b=D6uqniTZDu/c8/5235+16Xko0zTWnNMMIAtUtOM/sIJ+qQZOdNWM4FVZCl/cPCrdQg
         GS8zHO8HsGGyUo9BciWRYPrv/1X0XAp+BnDL8B4nWCIzrKziQFfnxKh3gi4tjacAivfv
         iqjrHV3iRylbs5Q/gJcy3jIWkjyrw2Z28qDrHGN0d2nTb0DQ1/gxSTICRpsMqc9iGe4B
         ++aCDQ+oKHncRAq/O8yFa3OcqIvIzIp3pK9ZG196VoI4Fw8oLQ2/Nwd9wFkncXTr/OMI
         Ezp0rP0wh+Jsy+wjZolrQavV3CNbhP10hcz+etvW45EyNSGa/0yK0Ye/m+eL+TW0Xph2
         t6Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vW0y5O6fj/dSbiX5076IJWx7fOAGTl35MulHK3/J9GA=;
        b=WoZyQWIwlMh8R/0tFyBHVWU2NTMo7kgVxmqf++W00SJGlfsB0goiK6WYbn5StJzurr
         YygCuXzsRePxADq73nspWAcL8KYFJ9GgWTQrENIAtrfD/X7ttW3/mzinc01COaSVj70E
         3JKHPcB+Noo3R8m20F6Ugd1UH9FAGuA7FpZv6jN3MGfkfgllDoGib1apVgS14yAMcxNg
         7epf1+kZ6obFwcWgX8o9CtKABIRXDPYc2Um1wIknVeLzckcaWl31d0XR5uQUgeey1eCd
         3PUFNB9zQnU1De5cArfxPz3dESRQnOQqfzj6sMGl/lvWsejBEglFkCvqcGQcZviFVB90
         pIzA==
X-Gm-Message-State: AOAM533WaobQfg2P3aa4TcmqpZmyvLMF2hwuVeyp4rU9n7SE5jrP9493
        GhKfIF7/ayfXMhbIjXEILvhLQw==
X-Google-Smtp-Source: ABdhPJx3V38k9UrFwXlITLr5bocrlJEnw2LA5dsBmBudBHawZuIukyiRESfoiDC7L1A0LcURRLsUwA==
X-Received: by 2002:a17:90a:fa8d:: with SMTP id cu13mr926275pjb.161.1604646328060;
        Thu, 05 Nov 2020 23:05:28 -0800 (PST)
Received: from localhost ([122.172.12.172])
        by smtp.gmail.com with ESMTPSA id x15sm978047pjh.21.2020.11.05.23.05.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Nov 2020 23:05:27 -0800 (PST)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Ilia Lin <ilia.lin@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-pm@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, Nishanth Menon <nm@ti.com>,
        digetx@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/7] cpufreq: qcom-cpufreq-nvmem: dev_pm_opp_put_*() accepts NULL argument
Date:   Fri,  6 Nov 2020 12:33:23 +0530
Message-Id: <86e6dfb0b929e525b568d80e5e852f14487d9b94.1604646059.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1604646059.git.viresh.kumar@linaro.org>
References: <cover.1604646059.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The dev_pm_opp_put_*() APIs now accepts a NULL opp_table pointer and so
there is no need for us to carry the extra checks. Drop them.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/cpufreq/qcom-cpufreq-nvmem.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/cpufreq/qcom-cpufreq-nvmem.c b/drivers/cpufreq/qcom-cpufreq-nvmem.c
index d06b37822c3d..747d602f221e 100644
--- a/drivers/cpufreq/qcom-cpufreq-nvmem.c
+++ b/drivers/cpufreq/qcom-cpufreq-nvmem.c
@@ -397,19 +397,19 @@ static int qcom_cpufreq_probe(struct platform_device *pdev)
 
 free_genpd_opp:
 	for_each_possible_cpu(cpu) {
-		if (IS_ERR_OR_NULL(drv->genpd_opp_tables[cpu]))
+		if (IS_ERR(drv->genpd_opp_tables[cpu]))
 			break;
 		dev_pm_opp_detach_genpd(drv->genpd_opp_tables[cpu]);
 	}
 	kfree(drv->genpd_opp_tables);
 free_opp:
 	for_each_possible_cpu(cpu) {
-		if (IS_ERR_OR_NULL(drv->names_opp_tables[cpu]))
+		if (IS_ERR(drv->names_opp_tables[cpu]))
 			break;
 		dev_pm_opp_put_prop_name(drv->names_opp_tables[cpu]);
 	}
 	for_each_possible_cpu(cpu) {
-		if (IS_ERR_OR_NULL(drv->hw_opp_tables[cpu]))
+		if (IS_ERR(drv->hw_opp_tables[cpu]))
 			break;
 		dev_pm_opp_put_supported_hw(drv->hw_opp_tables[cpu]);
 	}
@@ -430,12 +430,9 @@ static int qcom_cpufreq_remove(struct platform_device *pdev)
 	platform_device_unregister(cpufreq_dt_pdev);
 
 	for_each_possible_cpu(cpu) {
-		if (drv->names_opp_tables[cpu])
-			dev_pm_opp_put_supported_hw(drv->names_opp_tables[cpu]);
-		if (drv->hw_opp_tables[cpu])
-			dev_pm_opp_put_supported_hw(drv->hw_opp_tables[cpu]);
-		if (drv->genpd_opp_tables[cpu])
-			dev_pm_opp_detach_genpd(drv->genpd_opp_tables[cpu]);
+		dev_pm_opp_put_supported_hw(drv->names_opp_tables[cpu]);
+		dev_pm_opp_put_supported_hw(drv->hw_opp_tables[cpu]);
+		dev_pm_opp_detach_genpd(drv->genpd_opp_tables[cpu]);
 	}
 
 	kfree(drv->names_opp_tables);
-- 
2.25.0.rc1.19.g042ed3e048af

