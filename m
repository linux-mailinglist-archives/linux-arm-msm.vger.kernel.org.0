Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC0B911B3AA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2019 16:44:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388758AbfLKPnz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Dec 2019 10:43:55 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:44902 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388473AbfLKPny (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Dec 2019 10:43:54 -0500
Received: by mail-lj1-f194.google.com with SMTP id c19so24512601lji.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2019 07:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=46fQcaYRZVJGONWzkSKPwKhP/wuZIGStJprSOcfe334=;
        b=zcVsfgmbomRQuy8rc/lQGcTMLcfThl+n7UWlp4kXd00250zpeWcVglLPs5vVtxbHiA
         MStdCliToDc21B16LC3rUFLv9V4D2lPn2NiGHf51l8fuBArM9o3WbINapyKCElF4lLrz
         qY+SsGpOx7kmMLn4AJLHq52jc2Zvz5F9naiyeNkU0AjWzJ3IQ048sI8oHf++ia88BoOd
         f8YyxpzoGt/jfKR61R9Lg9T5Jh3zIUmgPnBwGUwCCUzWHmeP+786WMwqcKvNL2813ApA
         bHz14WRPnG8bkLdQ71opOq2TPJAs/3SfQaLV3Z80xNJMf99BU8GpsZ8m0CHOBXp05Ngk
         AOmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=46fQcaYRZVJGONWzkSKPwKhP/wuZIGStJprSOcfe334=;
        b=i0/nnFJCJMz5TWlDUEGHVTtjY9F7elbB9jjMoxHs/wm6iM9ARNkoA9KKxpZ2tJzCTm
         9Xf21JNAe99E1rcn/TyI83ldgGtVBB8XV0BtSm+PkMBCEkb3rWEiHpH0ji4Kku8XHe4j
         qlz3JrcYcrNawC18Qo6+o2AfdZBrbHtbK9AU4121lH7qAY9/Ipfjx1LMWwpHYN8P2ZA2
         p3QAPHBttJxIOU41q7S7WWscWnMI4RbfY5skHypupys/ZHl2bO405AOYclLkKuKLCYxf
         avnI8LE8RcSQaEmkBg25HINOJ1s8+yXJR2pgZx9Qtf8fD4ezS2npQQcTdvGKQROg17u9
         lXkw==
X-Gm-Message-State: APjAAAVSXfHeX9lOG+nObF1bFpLFPiEQ1CB04aUNg7gB+lLHya2cE/lC
        zWd2/xgQTmM34XFGLI3ID/PRog==
X-Google-Smtp-Source: APXvYqyBnDelMMLa2yqKqTKQABkrz/d0cAklTqaTVvb1gl+L1svnMBI59J/g1AHwehWqOsVxBQl8ww==
X-Received: by 2002:a2e:8eda:: with SMTP id e26mr2480158ljl.65.1576079032149;
        Wed, 11 Dec 2019 07:43:52 -0800 (PST)
Received: from localhost.localdomain (h-158-174-22-210.NA.cust.bahnhof.se. [158.174.22.210])
        by smtp.gmail.com with ESMTPSA id b14sm1389608lff.68.2019.12.11.07.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2019 07:43:51 -0800 (PST)
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
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v4 01/14] cpuidle: psci: Align psci_power_state count with idle state count
Date:   Wed, 11 Dec 2019 16:43:30 +0100
Message-Id: <20191211154343.29765-2-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191211154343.29765-1-ulf.hansson@linaro.org>
References: <20191211154343.29765-1-ulf.hansson@linaro.org>
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

Changes in v4:
	- None.

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

