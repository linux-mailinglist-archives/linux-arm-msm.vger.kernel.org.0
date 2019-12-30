Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7B5912D0F7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2019 15:44:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727591AbfL3OoS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Dec 2019 09:44:18 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:37534 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727569AbfL3OoS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Dec 2019 09:44:18 -0500
Received: by mail-lf1-f66.google.com with SMTP id b15so25292606lfc.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2019 06:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=owx+SloUf8pds6VPSlJapJq+5ymBBPQ7iA/SKJJgwjU=;
        b=jOMMern6T7wiWE4/ufEPrcYPooLKd4g26VuETKc7rFkMRNBi7vRvt8RFhBr0UOWAnN
         wp11vcK5R9zGy6To03gCj2b0edl6KenBOw1Y+Jb4/Xv8ZSsYJBbEM/iOOcAndEOhUKDf
         t5WQq15GFK32RuJCD0MERQBiYIJz4eWhazo3dx3TlfMiVG41xKuXddbILMfHTxh9gzpj
         MQ64gwbw5YmhfRQDHZIZQzHQm7Gx93y0GfcirJquGCLKb31azdub1BUAwNDJhfvmnPwQ
         y1TQ1/1HmlOhpvbbHmNj8AVinJ+THuhmX6qe2QprHuwKGNVBuuPFIbtj7RLGpelLTurU
         VQIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=owx+SloUf8pds6VPSlJapJq+5ymBBPQ7iA/SKJJgwjU=;
        b=rbR2gOneu8rKRHfitVgZwsQm1f6l3WJ+Zs/eeYDYsQz6oFMaqRWfw/dRQrDYFouaao
         x2Cj/cFoL9hr6+er3ehtZQ0JmfrAZi5PgE7DkNXHo26P1xg6tE51+rBQkmpcsqRR0SyP
         W9fDB4Lwlun63P3mEDwn7rJyG+4qDVet/b+iGhvIauJr9tprNZ1XnsZehf2NK3s/kVm2
         NjIH3BO0F0dmhuuAu7avpfQGRDrwjUiEpZB3NE1eGE4f+weoqqrB9U244ZC46oNv+1ib
         Ek+nhGy8FFExMQSYMh/rRhTd0b7nlyfAnvD5Xaq7On7VwQ61CqV9p789cfvVyZ3gJwPB
         zWyg==
X-Gm-Message-State: APjAAAVAgoBK7M5oKpC/NfzANTMslq5G61gVoWpWZgZ/Pc5S2gX75BUl
        SCbMt71rr+Lxcxw8u80qmeRZrg==
X-Google-Smtp-Source: APXvYqxp/iitD6O/NdUA06r9/yZSgghJqfhQcVQLOvvXc32vodyNVAkq4131RInkIiKGlrJereqGvg==
X-Received: by 2002:a19:f006:: with SMTP id p6mr37770832lfc.94.1577717056795;
        Mon, 30 Dec 2019 06:44:16 -0800 (PST)
Received: from localhost.localdomain (h-158-174-22-210.NA.cust.bahnhof.se. [158.174.22.210])
        by smtp.gmail.com with ESMTPSA id a21sm18744931lfg.44.2019.12.30.06.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2019 06:44:16 -0800 (PST)
From:   Ulf Hansson <ulf.hansson@linaro.org>
To:     Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>,
        Rob Herring <robh+dt@kernel.org>, linux-pm@vger.kernel.org
Cc:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lina Iyer <ilina@codeaurora.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kevin Hilman <khilman@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, Lina Iyer <lina.iyer@linaro.org>
Subject: [PATCH v5 05/15] cpuidle: dt: Support hierarchical CPU idle states
Date:   Mon, 30 Dec 2019 15:43:52 +0100
Message-Id: <20191230144402.30195-6-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191230144402.30195-1-ulf.hansson@linaro.org>
References: <20191230144402.30195-1-ulf.hansson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Lina Iyer <lina.iyer@linaro.org>

Currently CPU's idle states are represented using the flattened model.
Let's add support for the hierarchical layout, via converting to use
of_get_cpu_state_node().

Suggested-by: Sudeep Holla <sudeep.holla@arm.com>
Signed-off-by: Lina Iyer <lina.iyer@linaro.org>
Reviewed-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Co-developed-by: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
---

Changes in v5:
	- None.

---
 drivers/cpuidle/dt_idle_states.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/cpuidle/dt_idle_states.c b/drivers/cpuidle/dt_idle_states.c
index d06d21a9525d..252f2a9686a6 100644
--- a/drivers/cpuidle/dt_idle_states.c
+++ b/drivers/cpuidle/dt_idle_states.c
@@ -111,8 +111,7 @@ static bool idle_state_valid(struct device_node *state_node, unsigned int idx,
 	for (cpu = cpumask_next(cpumask_first(cpumask), cpumask);
 	     cpu < nr_cpu_ids; cpu = cpumask_next(cpu, cpumask)) {
 		cpu_node = of_cpu_device_node_get(cpu);
-		curr_state_node = of_parse_phandle(cpu_node, "cpu-idle-states",
-						   idx);
+		curr_state_node = of_get_cpu_state_node(cpu_node, idx);
 		if (state_node != curr_state_node)
 			valid = false;
 
@@ -170,7 +169,7 @@ int dt_init_idle_driver(struct cpuidle_driver *drv,
 	cpu_node = of_cpu_device_node_get(cpumask_first(cpumask));
 
 	for (i = 0; ; i++) {
-		state_node = of_parse_phandle(cpu_node, "cpu-idle-states", i);
+		state_node = of_get_cpu_state_node(cpu_node, i);
 		if (!state_node)
 			break;
 
-- 
2.17.1

