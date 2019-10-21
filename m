Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B431DEBDF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2019 14:15:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728683AbfJUMPh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Oct 2019 08:15:37 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:36799 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728667AbfJUMPg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Oct 2019 08:15:36 -0400
Received: by mail-pg1-f193.google.com with SMTP id 23so7722794pgk.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2019 05:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=xR7W1GwN0go/X8fLSEXaPJYIpihUkOKlEqRzolNBmOs=;
        b=h+Y0coRGMly4KE+nb6Ra2tV4nrilADDUYPnv33sAaGK1eugmzVW/FzZHN5W0m3X4o3
         UTml0Vzf8Z3tWGUifXS6P2VyXfqj1WfCsp9tnanGN2S3CDux8EIriXWqHoWKvE5bIP8k
         f2GOQYC4fQaP1Og3jqa7m5W1neAhuF1Ud7Hs8VgcazP+JFZ9rfw0RNxK2EjI6iOoQJs4
         aQqyFEG0Zro+ajeqx3snZUlUr9CJNTzzsNyDHBF+XKqwtamsA+aHldGw395f1V9akZCl
         wGLZ+eqPPvlIss2oVUQXfASrOgnarubvZ+rVKlVANfx9SBRLyjxjVo1DkCdv+TuQJn3z
         k7cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=xR7W1GwN0go/X8fLSEXaPJYIpihUkOKlEqRzolNBmOs=;
        b=KofEbBUSi6wA98I+NysOWguCFPP2AfVxjOLuy6JJb7PoEK2iVoitD1MYOtgkZAqxoZ
         HShruOSFBMpP0uvi0eSomWx+68lQqx0/WhP+eE15PtmkLAgt425Uk7445NdO2cAg0Ddx
         XP05t+rwbjnW5VXrkg/JFeHKCbXq5sxl0K/yIWzjo4rp8TpcKT/uEJYEoTlP0lzTPL10
         ep0uqRuZ8XZ+4Ej4L3xARjI3nfJ/nPWs6t39SB+/4JmFM+6SMp4nvJ9JnTfCuNJ+egqr
         8IMGMRgGQ0oWz7gjrb6IeNMlwM1S8g+ucjrc6IPxKqN8Pd9Nacw5tymi/6/O5t0gUGNv
         WIOA==
X-Gm-Message-State: APjAAAW9/Lh/Edg17T3Fyf6FJbuNzUoYJT1qti19nle9MJoXAmdFj3xl
        DtDNZ5WqgNU7RTIcKjSVjVotfg==
X-Google-Smtp-Source: APXvYqwuE5ibzoeEar2RmNJatw8fKmT/CcJL8qyHAbJNydyMBKY12CDuW0bKMW/3gv35irjm6Xl82w==
X-Received: by 2002:a62:1646:: with SMTP id 67mr22946275pfw.128.1571660135774;
        Mon, 21 Oct 2019 05:15:35 -0700 (PDT)
Received: from localhost ([49.248.62.222])
        by smtp.gmail.com with ESMTPSA id x10sm13800801pgl.53.2019.10.21.05.15.34
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2019 05:15:35 -0700 (PDT)
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
Subject: [PATCH v5 4/6] cpufreq: Initialize cpufreq-dt driver earlier
Date:   Mon, 21 Oct 2019 17:45:13 +0530
Message-Id: <353c745d4ca1feff600bd44154c01c013f185ca4.1571656015.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1571656014.git.amit.kucheria@linaro.org>
References: <cover.1571656014.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1571656014.git.amit.kucheria@linaro.org>
References: <cover.1571656014.git.amit.kucheria@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This allows HW drivers that depend on cpufreq-dt to initialize earlier.

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

