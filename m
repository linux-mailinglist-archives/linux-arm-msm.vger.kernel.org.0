Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2EB01BDD8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 May 2019 21:25:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726927AbfEMTZk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 May 2019 15:25:40 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:38896 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729509AbfEMTXN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 May 2019 15:23:13 -0400
Received: by mail-lj1-f194.google.com with SMTP id 14so12078037ljj.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 May 2019 12:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=F5AEltUKfed5w7dHNisHSX8S1wBzU63rf2dZ2cHwfSs=;
        b=ihwtaKGHm5HWQDkvQkty6/m7be/aDE2Ue2EF8h2aUL7J5q3dbOjBQl/7riCd7391Bk
         6mt4yavZncehbr1dqBkKzd5+XE6F5UVYInUI/aMbhArbPszaqyttf3MVOOEailuYdP3R
         fucpydZkU9Xe7taVXR0KfQZCmk+WPepu9Fz5czOMEkZzxq0cyv/O9xzdwPbelTwhxiAt
         AgLFcBQz4OuHsSIHPRYM79Mx2eXRaijBK738WDXPRnaM8wcxzwaXGNHAtjVqh3N6NVfn
         PALPweQK2a7Hw+qtF1599CtdwmhaZJP3Loxm6jMlG87c2/LPW1b4sxzN22fBdrGhOVkv
         xgGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=F5AEltUKfed5w7dHNisHSX8S1wBzU63rf2dZ2cHwfSs=;
        b=mCar/84WtjNzxBK7ute2UTd2W6O1TFXfm5obhxRMRYvORjMoly3GZMDe0I0ZINfodv
         cEzaSbpGvdvrezxX46CxP/XDqICg2lNdRzuJ90ahpJ0xclfiBFP8IjkGD2wJbxHIYnVX
         zGTFvU2cHJfrvxyIVprehY0MCVH4AXhztlCXV2Jyf7bl5ffza+DLY/Z5pD0xe/1WbcHV
         y2m3t1xRaChkQznSzUxARxcXWLan94O47x8WiJMdKknqGdVEHOMl1IwlmJPkqp1C3+mD
         3HUE5xAnvgVe90kvQiY6sQ/6zzz7IgfH8Ohnn+ftIeTO68Q7Dt/Pfady07o3DYlKVQqI
         7nPQ==
X-Gm-Message-State: APjAAAXnWtbD1HypD0OsXP+vkcg/eKxSDKHT0Ct/5G0KZyx4bJLZmJOl
        C6gKty6Fcy07zX8WsmL+qzjNjA==
X-Google-Smtp-Source: APXvYqxS293Cibnm8BvM4OA/7mePaZMMHGVjPn5T9aLCXEe34R5mqSI/nCjgK/Ib9ssZWuTZNP1Trw==
X-Received: by 2002:a2e:c41:: with SMTP id o1mr8693546ljd.23.1557775391156;
        Mon, 13 May 2019 12:23:11 -0700 (PDT)
Received: from localhost.localdomain (h-158-174-22-210.NA.cust.bahnhof.se. [158.174.22.210])
        by smtp.gmail.com with ESMTPSA id q21sm3449365lfa.84.2019.05.13.12.23.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 May 2019 12:23:10 -0700 (PDT)
From:   Ulf Hansson <ulf.hansson@linaro.org>
To:     Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org
Cc:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        "Raju P . L . S . S . S . N" <rplsssn@codeaurora.org>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Niklas Cassel <niklas.cassel@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Kevin Hilman <khilman@kernel.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Souvik Chakravarty <souvik.chakravarty@arm.com>,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Lina Iyer <lina.iyer@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH 03/18] cpuidle: dt: Support hierarchical CPU idle states
Date:   Mon, 13 May 2019 21:22:45 +0200
Message-Id: <20190513192300.653-4-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190513192300.653-1-ulf.hansson@linaro.org>
References: <20190513192300.653-1-ulf.hansson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Lina Iyer <lina.iyer@linaro.org>

Currently CPU's idle states are represented in a flattened model, via the
"cpu-idle-states" binding from within the CPU's device nodes.

Support the hierarchical layout during parsing and validating of the CPU's
idle states. This is simply done by calling the new OF helper,
of_get_cpu_state_node().

Suggested-by: Sudeep Holla <sudeep.holla@arm.com>
Signed-off-by: Lina Iyer <lina.iyer@linaro.org>
Reviewed-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Co-developed-by: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---

Changes:
	- None.

---
 drivers/cpuidle/dt_idle_states.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/cpuidle/dt_idle_states.c b/drivers/cpuidle/dt_idle_states.c
index add9569636b5..97ad25399ca8 100644
--- a/drivers/cpuidle/dt_idle_states.c
+++ b/drivers/cpuidle/dt_idle_states.c
@@ -114,8 +114,7 @@ static bool idle_state_valid(struct device_node *state_node, unsigned int idx,
 	for (cpu = cpumask_next(cpumask_first(cpumask), cpumask);
 	     cpu < nr_cpu_ids; cpu = cpumask_next(cpu, cpumask)) {
 		cpu_node = of_cpu_device_node_get(cpu);
-		curr_state_node = of_parse_phandle(cpu_node, "cpu-idle-states",
-						   idx);
+		curr_state_node = of_get_cpu_state_node(cpu_node, idx);
 		if (state_node != curr_state_node)
 			valid = false;
 
@@ -173,7 +172,7 @@ int dt_init_idle_driver(struct cpuidle_driver *drv,
 	cpu_node = of_cpu_device_node_get(cpumask_first(cpumask));
 
 	for (i = 0; ; i++) {
-		state_node = of_parse_phandle(cpu_node, "cpu-idle-states", i);
+		state_node = of_get_cpu_state_node(cpu_node, i);
 		if (!state_node)
 			break;
 
-- 
2.17.1

