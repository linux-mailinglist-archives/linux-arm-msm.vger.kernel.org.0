Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 576013E9020
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Aug 2021 14:07:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237563AbhHKMHK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Aug 2021 08:07:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237589AbhHKMG6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Aug 2021 08:06:58 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AEEBC0617A4
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Aug 2021 05:06:34 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id m24-20020a17090a7f98b0290178b1a81700so4407916pjl.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Aug 2021 05:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8F5SodJNfZE6KLwiwfoFbQqrxkGaRIBPPPD9UGRC3ww=;
        b=XLmt0RwRxkY54+csl1bEURnOu6nSVNo0HexFPjRrACsqp5nUdMT5GiaXwHYYKHumcO
         eDri9hdGrhQbXSSCeCwDMBbqiXNTzj4F5EK5Fpfu49Lv/yw3ZRSkPCWBKFxSugE0gARd
         CuRia5Bn4kQUmAvW9QBWw2FXYdHqb7z1hcn3ZR0q3r+hiXUbkBtZ7AlS/v9NOW+d8V5y
         12d1YPLHJsv5wdvuf1hA0HWL31k38hWirLw7RcCtOVaQFxyHlSuoDyc4n6ayTDoUKYbU
         /ZwlVgyOqZCLeVtXMXToZX9hm1b+TGsGiKsBWwQrrf/DsqCHPz5darnPw/crM8CRERum
         9ZXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8F5SodJNfZE6KLwiwfoFbQqrxkGaRIBPPPD9UGRC3ww=;
        b=ilM5BpgcmaadzJXmT4JbMPQ/UZdzUQL2QxYDiApdmD07swZAfuf0wi1z2zun/TPma6
         RyTcplxQ9rtbQSEWO5rq1cmwuV/19hA6kmLj92TX9OTWJGXmH1stZyTpZS6Eb1PzjbmQ
         6VF0QT+XePZn4Y3n7uYGQdCcymUuJbFVWva8d9URLoKe91aqrt8HxompipP/wFkA3Xvl
         sAorkRj0BbLbtxJOLTS/F1wu/6AgrgpOfaDAUtCSVMqEbKP9KDoXZV2Ump3MAoNFCNUR
         58CzgkaprSdDxEp8E6W7RSY8v+2cgIZw75OLzAVuZIuwjsLKu8CD27MHuNhQ2JkVHMar
         MLcw==
X-Gm-Message-State: AOAM532JaeBDmXS9o4T0iDx9Y92IGF7KZGgt6K+mFfxbLCIITY6D1Awr
        TYZM27QRvy1tnayS6NtEe0lqIA==
X-Google-Smtp-Source: ABdhPJyyrLqmNEXs7dWJno2o5R6jsUJAX3OwRMSbvWYslCG+rvMw8eOX4ntT8HvmtZWFX7DGRdBirg==
X-Received: by 2002:a17:90a:2fc2:: with SMTP id n2mr35205665pjm.112.1628683593885;
        Wed, 11 Aug 2021 05:06:33 -0700 (PDT)
Received: from localhost ([122.172.201.85])
        by smtp.gmail.com with ESMTPSA id 186sm28642393pfg.11.2021.08.11.05.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Aug 2021 05:06:33 -0700 (PDT)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Rafael Wysocki <rjw@rjwysocki.net>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-pm@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Lukasz Luba <lukasz.luba@arm.com>,
        Quentin Perret <qperret@google.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH V2 6/9] cpufreq: qcom-cpufreq-hw: Use auto-registration for energy model
Date:   Wed, 11 Aug 2021 17:28:44 +0530
Message-Id: <701477f4b76a7c055b6df33f74668293b8205a96.1628682874.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1628682874.git.viresh.kumar@linaro.org>
References: <cover.1628682874.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Set the newly added .register_em() callback with
cpufreq_register_em_with_opp() to automatically register with the EM
core.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/cpufreq/qcom-cpufreq-hw.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/cpufreq/qcom-cpufreq-hw.c b/drivers/cpufreq/qcom-cpufreq-hw.c
index f86859bf76f1..c2e71c430fbf 100644
--- a/drivers/cpufreq/qcom-cpufreq-hw.c
+++ b/drivers/cpufreq/qcom-cpufreq-hw.c
@@ -362,8 +362,6 @@ static int qcom_cpufreq_hw_cpu_init(struct cpufreq_policy *policy)
 		goto error;
 	}
 
-	dev_pm_opp_of_register_em(cpu_dev, policy->cpus);
-
 	if (policy_has_boost_freq(policy)) {
 		ret = cpufreq_enable_boost_support();
 		if (ret)
@@ -412,6 +410,7 @@ static struct cpufreq_driver cpufreq_qcom_hw_driver = {
 	.get		= qcom_cpufreq_hw_get,
 	.init		= qcom_cpufreq_hw_cpu_init,
 	.exit		= qcom_cpufreq_hw_cpu_exit,
+	.register_em	= cpufreq_register_em_with_opp,
 	.fast_switch    = qcom_cpufreq_hw_fast_switch,
 	.name		= "qcom-cpufreq-hw",
 	.attr		= qcom_cpufreq_hw_attr,
-- 
2.31.1.272.g89b43f80a514

