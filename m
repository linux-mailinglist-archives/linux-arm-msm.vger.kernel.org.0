Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C7A0E8CFA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2019 17:44:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390544AbfJ2Qor (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Oct 2019 12:44:47 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:34838 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390556AbfJ2Qoq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Oct 2019 12:44:46 -0400
Received: by mail-lj1-f193.google.com with SMTP id m7so16040249lji.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Oct 2019 09:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=bWmI0Xiuvq89sgTizuBFylB3C9/WTB7ILCq148rwhZk=;
        b=nGhuDYkfvkQnrZTY/TN3SJPYAaq6N0hugnaQQTvYzRjyoPirGxoPyytewdnMuFCFij
         DaKmL0IiI3Qljq5CIImb9zhUYVW5VW+op923nnammGE5rv2FOHsLNPRmSR5VSjEBxWTZ
         +oyoY/dWhez06dxKGThbrMguGRiBM7sr5gIaMs4iiiLuPwmPqMDG6CWDzEBWGB0x0Ha1
         In+/km5T6X+Vcwoxcv0M++rn5YHmiXagng2jm6Cu5K0cpWPMP5hz4j2QblIRc92btI15
         4916IppXqRFSp/7tSoPmztteLkZaZyI8t2KNAKLsXA/ULl2xQ7yG8pW90jbbx1HmvIqH
         BLRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=bWmI0Xiuvq89sgTizuBFylB3C9/WTB7ILCq148rwhZk=;
        b=o0PzIX+fIYesfUwmdKnH4XbnDKJdwMfXOyxQCWwYRt5bYVk9oRdx9G4W87ggsygXal
         iF6mkSiy2Prpz6bhDJtjCfmCNmUwRlIfEawOWmdu5odCUTz/X94qBOEoNN7aSeGru8S8
         iM4HX5IvILversHUYx5uy4YwuDfgiqJQvDdC25WBUV8KYbpKNlHYgLVx53Cex8zCK7eF
         +Y913/WmDpkV2+wEo1ZJu//7uBUABoYkYZZKqe3E56uvmybCHud8y0mtNnCvphvoBlqX
         UCHb/xY7XZbbIjWG7a2EvNM7ckDiGFi5vHn/bKijTn3Vl95QT4r7FFQZu+ccB1oT0C+Z
         rv1A==
X-Gm-Message-State: APjAAAVSui83zNlq5yaKNzNscrzed34BwbA2SoP7mRrcVsNrb4239hzO
        sqgdTwPgZKWWuxQ+FqlpZM4qww==
X-Google-Smtp-Source: APXvYqxiw4yXF19S009oKLq+GuUCc8WXW014siinCqLOYELILmRXWbsHObr2NPT+v/kN830ot6hPPw==
X-Received: by 2002:a2e:9a9a:: with SMTP id p26mr3283051lji.164.1572367485207;
        Tue, 29 Oct 2019 09:44:45 -0700 (PDT)
Received: from localhost.localdomain (h-158-174-22-210.NA.cust.bahnhof.se. [158.174.22.210])
        by smtp.gmail.com with ESMTPSA id f28sm2048161lfh.35.2019.10.29.09.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 09:44:44 -0700 (PDT)
From:   Ulf Hansson <ulf.hansson@linaro.org>
To:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lina Iyer <ilina@codeaurora.org>, linux-pm@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kevin Hilman <khilman@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 01/13] cpuidle: psci: Align psci_power_state count with idle state count
Date:   Tue, 29 Oct 2019 17:44:26 +0100
Message-Id: <20191029164438.17012-2-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191029164438.17012-1-ulf.hansson@linaro.org>
References: <20191029164438.17012-1-ulf.hansson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Sudeep Holla <sudeep.holla@arm.com>

Instead of allocating 'n-1' states in psci_power_state to manage 'n'
idle states which include "ARM WFI" state, it would be simpler to have
1:1 mapping between psci_power_state and cpuidle driver states.

ARM WFI state(i.e. idx == 0) is handled specially in the generic macro
CPU_PM_CPU_IDLE_ENTER_PARAM and hence state[-1] is not possible. However
for sake of code readability, it is better to have 1:1 mapping and not
use [idx - 1] to access psci_power_state corresponding to driver cpuidle
state for idx.

psci_power_state[0] is default initialised to 0 and is never accessed
while entering WFI state.

Reported-by: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
---

Changes in v2:
	- Added tags.

---
 drivers/cpuidle/cpuidle-psci.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/cpuidle/cpuidle-psci.c b/drivers/cpuidle/cpuidle-psci.c
index f3c1a2396f98..361985f52ddd 100644
--- a/drivers/cpuidle/cpuidle-psci.c
+++ b/drivers/cpuidle/cpuidle-psci.c
@@ -30,7 +30,7 @@ static int psci_enter_idle_state(struct cpuidle_device *dev,
 	u32 *state = __this_cpu_read(psci_power_state);
 
 	return CPU_PM_CPU_IDLE_ENTER_PARAM(psci_cpu_suspend_enter,
-					   idx, state[idx - 1]);
+					   idx, state[idx]);
 }
 
 static struct cpuidle_driver psci_idle_driver __initdata = {
@@ -89,12 +89,14 @@ static int __init psci_dt_cpu_init_idle(struct device_node *cpu_node, int cpu)
 	if (!count)
 		return -ENODEV;
 
+	count++; /* Add WFI state too */
 	psci_states = kcalloc(count, sizeof(*psci_states), GFP_KERNEL);
 	if (!psci_states)
 		return -ENOMEM;
 
-	for (i = 0; i < count; i++) {
-		state_node = of_parse_phandle(cpu_node, "cpu-idle-states", i);
+	for (i = 1; i < count; i++) {
+		state_node = of_parse_phandle(cpu_node, "cpu-idle-states",
+					      i - 1);
 		ret = psci_dt_parse_state_node(state_node, &psci_states[i]);
 		of_node_put(state_node);
 
-- 
2.17.1

