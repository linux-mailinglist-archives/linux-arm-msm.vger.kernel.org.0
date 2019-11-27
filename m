Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 013B410AD99
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2019 11:29:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727109AbfK0K3V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Nov 2019 05:29:21 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:33019 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726559AbfK0K3U (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Nov 2019 05:29:20 -0500
Received: by mail-lj1-f193.google.com with SMTP id t5so23877876ljk.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Nov 2019 02:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=75TMc1cT7FH1sabSgSiOxKjblChN2q0Nv5wC1JCjNcA=;
        b=yfkFQHGSTi+m76i8sYvYqdEiuggix6PnBHJpJpmRd1TB3+HBk28IT3r3QivTmsosW3
         P5rPoeO+FgUBK3MOmVvO1JUHb3eLFY79MhHRnE+icFW+jjT2WL7HFRR4tp1G8qN/A2sn
         IIk4sfepSYFdvVBdNHNiNtnCUlt8z8lm4+AI1Ls/4Cvp4dN4v5vpvGLeGmY3v9m51pCV
         1RtoYLhYErI+uFTBrPbHuDMbEngyxAmo7PHnH4UB7Eu/VvccG3FfcCkbWvfKNP5FdLhC
         1DlAD7Zg1BdRyBzmBv/jdXinAsrYRjK3KNI+WtKDTJtemO4A9AWbEjfPE5iReHNipErB
         ByLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=75TMc1cT7FH1sabSgSiOxKjblChN2q0Nv5wC1JCjNcA=;
        b=X8v3F0ZhnSKI6HwHVtj87QYg9bZfWo95t5WJyKbhMeOVkOKRub0xWf+BcqdIUCU/0C
         YR6s2gyh7CYYTfhTsJ0zHkSUSsik4lN05MMPNHEQuzAdzJckosPuPyQuLrtdFoYQ7kPq
         i2NgdvVRKA4vKVa+ylXmlPrU7Va3iGW2YXAZDt68uJnpqKAwjhwlUqwGiUyosHRIYLU3
         xwB/fucRadms75yCOY/u/Ib1VaM4VF2GJBEa2ey7TTJV47tjZFjg3AssMvwwAGJYAYfJ
         9FGqhkt6Eb3bfE1ICzT1bAuOPQaaNpkS3KR1+VIYd8vwh4mJ9DuzslZvxYHTTT3O2R8i
         a11w==
X-Gm-Message-State: APjAAAWH57Du7KE8HMJw1K1ppD4pFyp3T6lu8To05+4YNi/564Tcjela
        lKCAg13LNzHdGthjhjGPLUtXFQ==
X-Google-Smtp-Source: APXvYqyU1IApp4NI9wl22/OIUXj5aD2EpYZqlLflyJ4cORj4qNdhYEZOz8nnWtIV00rgXD1rv0nt9g==
X-Received: by 2002:a2e:b818:: with SMTP id u24mr15059006ljo.33.1574850558878;
        Wed, 27 Nov 2019 02:29:18 -0800 (PST)
Received: from uffe-XPS-13-9360.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id t9sm6868260ljj.19.2019.11.27.02.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2019 02:29:18 -0800 (PST)
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
Subject: [PATCH v3 01/13] cpuidle: psci: Align psci_power_state count with idle state count
Date:   Wed, 27 Nov 2019 11:29:02 +0100
Message-Id: <20191127102914.18729-2-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191127102914.18729-1-ulf.hansson@linaro.org>
References: <20191127102914.18729-1-ulf.hansson@linaro.org>
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

Changes in v3:
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

