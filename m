Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE84DDC054
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2019 10:52:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2632963AbfJRIw2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Oct 2019 04:52:28 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:47034 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394154AbfJRIw2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Oct 2019 04:52:28 -0400
Received: by mail-pf1-f196.google.com with SMTP id q5so3434075pfg.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Oct 2019 01:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=tSzJEpJmDmeHOSEU0I3AfQXPKpO46HQzH7+Mdke63aU=;
        b=npNq6UNtXYpoaXJ3I7t2IdXdGe06e+rEdJhFxtv6H/2c3gYxsM311WsUfYe2YPeLXv
         768UOT5TJugLFh5EWKwXxgf4gtmYK6e7eIRLahWH2yT1KURVAnfccBCO2XbYoIymgvLe
         oZst0d+algxp9nI8DMjO10QY+hsuBXYeJ6RYVcE51TeViEB0PkvV9xzBvleJJJZps71V
         lsDlm3yKkeYTjOg9cL7X6UdsU62Tc0D0PP1k+7cqUcXlI4ONOObK0fbVD9B6cNngIhZ0
         kSh+IrH7TnmolNGlzhyO0VOTLYEfDqPxcS8iRqahIyPJVRFKb6+MQ/gJ++/MrcAHG6sG
         aDNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=tSzJEpJmDmeHOSEU0I3AfQXPKpO46HQzH7+Mdke63aU=;
        b=FugD+gXBB8wKkGrqO/UjOljUa8ZPzqArGBwRTpviX0eeEgMwpatuv1V7UnXG2lFvKM
         u0hBSfZo27Fvxpy5JEPgAlrbFF5ckhKk2CZXtB2AU5RlDBByVTwSWfAdghB78y6Suyyl
         TjumaBF0Cz62w/diTK3iDksOPZLV6N9Wa6DoqJKVv7h5sc8EFwTI2zg4hW4Hbb9Co0sb
         QKf/OzWO/uO+C9ODW7p4MAZYTbOhA31ZakMsWSeldByXs05lm9feALQgqAAtpH6qTlAd
         gbJ5pay+RPjANll86HHSdTrgW2nyq8a0fA6yeqUlMI8+f1fR9e4yC3QEXsmRn3pGY1Qz
         KOJw==
X-Gm-Message-State: APjAAAX/B1xh+fkycUuBXDfxGVN9oZNVs4ybBd7OaC1dULomVkmCgx5L
        82JjcnrYhiYtCDfDFcH4SbJpWw==
X-Google-Smtp-Source: APXvYqwZ9DcorsT0otODsjVhMRV+5vmVK01y/h76Hpz5XctIkGGXzAYAJLgHoIMc38KZoHfdcV+AJw==
X-Received: by 2002:a63:6b0a:: with SMTP id g10mr8500894pgc.296.1571388747372;
        Fri, 18 Oct 2019 01:52:27 -0700 (PDT)
Received: from localhost ([49.248.178.134])
        by smtp.gmail.com with ESMTPSA id x19sm8025248pgc.59.2019.10.18.01.52.26
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Oct 2019 01:52:26 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        daniel.lezcano@linaro.org, viresh.kumar@linaro.org,
        sudeep.holla@arm.com, bjorn.andersson@linaro.org,
        edubezval@gmail.com, agross@kernel.org, tdas@codeaurora.org,
        swboyd@chromium.org, ilina@codeaurora.org,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Ben Segall <bsegall@google.com>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Ingo Molnar <mingo@redhat.com>,
        Juri Lelli <juri.lelli@redhat.com>,
        Mel Gorman <mgorman@suse.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     linux-pm@vger.kernel.org
Subject: [PATCH v4 4/6] cpufreq: Initialize cpufreq-dt driver earlier
Date:   Fri, 18 Oct 2019 14:22:01 +0530
Message-Id: <66d8ae593ce7936a5f492d0c6855c1ac225b64ee.1571387352.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1571387352.git.amit.kucheria@linaro.org>
References: <cover.1571387352.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1571387352.git.amit.kucheria@linaro.org>
References: <cover.1571387352.git.amit.kucheria@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This allows HW drivers that depend on cpufreq-dt to initialise earlier.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/cpufreq/cpufreq-dt-platdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
index bca8d1f47fd2c..3282defe14d41 100644
--- a/drivers/cpufreq/cpufreq-dt-platdev.c
+++ b/drivers/cpufreq/cpufreq-dt-platdev.c
@@ -180,4 +180,4 @@ static int __init cpufreq_dt_platdev_init(void)
 			       -1, data,
 			       sizeof(struct cpufreq_dt_platform_data)));
 }
-device_initcall(cpufreq_dt_platdev_init);
+core_initcall(cpufreq_dt_platdev_init);
-- 
2.17.1

