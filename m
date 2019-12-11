Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6193A11B3C9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2019 16:44:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388417AbfLKPoN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Dec 2019 10:44:13 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:33555 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387474AbfLKPoM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Dec 2019 10:44:12 -0500
Received: by mail-lf1-f66.google.com with SMTP id n25so17120978lfl.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2019 07:44:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=r0T/EqYWBtflCGTq6mIMCsH8miOWB9TkKYLC0qt4riw=;
        b=csmtam/SiKcgswiwzehs2UqYPsYUd6V90h51/HbH4XWJjcqs1r1E/s1eSNFY7TV2QF
         VuLfcccAUO5CLeDup/dWo/mK3qDtyOYfqw8v36X2BZVRhAWoGzA01YLphklYA/xd8wIY
         +yvsBmjuXVPeLG3Tp5sP8TVqWVDA0xmJ17VP0KWwDdL/gydysGuwPc1ytoolSALiPmN8
         F7ENETnujKlFDv9J8XyMAGYsOc79CQfgaVpcX8Dj8e5WaoF1O5pz7ZTu+63xruymwcbS
         QBNG4HCIgPqfklO2UJIhOQ08uM29v0Re0uU9c6byBZYV+FQEzX5JddcEC1YgiYcHRx8s
         1Jrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=r0T/EqYWBtflCGTq6mIMCsH8miOWB9TkKYLC0qt4riw=;
        b=F2ooSbpr9FaFqZ8V39Z1MXicFnkBpt5pgkgwM2k77aPcomrxfmR5r4ipvubWJJM02e
         00gVUklyANeYkhcf7s7Y7Au9NM3h71l252DSPxSTuCDGsVsrHwMdPvnISKikxlXtPMIp
         7s+ZHBAHrAFF5CrHALn2YxqYburZFGxlvEn5eAXyx4Aqa789FoYtAwnyUnkQCNuLegRd
         vNvsLTl/BMctGg5l2I1M7xQeScNDyuZRZyiqEM/+MgWrqXSX+WOqGzDPTfRXRIUUdXRZ
         AbM24fUh6eKRDkUwR/ChnQC3XBUm4NfIRFHFSVW127CDznzosJagpd44OCfa/NpT3nFD
         W2Dw==
X-Gm-Message-State: APjAAAXEnsBt1R/APuu7CN4ExpShPxugT3V1EfKrPE44qwZ1g/0k2v3o
        aw+mie9PuDiOAx0O98F1prWslg==
X-Google-Smtp-Source: APXvYqyBEgNF0WObWqvyW+J7XheyUS0OXyRvFlpGDNDdlCNidFPXAXaRC5O0SSZLYoCPCgEzSPKJyA==
X-Received: by 2002:a19:c0b:: with SMTP id 11mr2684337lfm.135.1576079050137;
        Wed, 11 Dec 2019 07:44:10 -0800 (PST)
Received: from localhost.localdomain (h-158-174-22-210.NA.cust.bahnhof.se. [158.174.22.210])
        by smtp.gmail.com with ESMTPSA id b14sm1389608lff.68.2019.12.11.07.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2019 07:44:09 -0800 (PST)
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
Subject: [PATCH v4 11/14] cpuidle: psci: Manage runtime PM in the idle path
Date:   Wed, 11 Dec 2019 16:43:40 +0100
Message-Id: <20191211154343.29765-12-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191211154343.29765-1-ulf.hansson@linaro.org>
References: <20191211154343.29765-1-ulf.hansson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In case we have succeeded to attach a CPU to its PM domain, let's deploy
runtime PM support for the corresponding attached device, to allow the CPU
to be powered-managed accordingly.

The triggering point for when runtime PM reference counting should be done,
has been selected to the deepest idle state for the CPU. However, from the
hierarchical point view, there may be good reasons to do runtime PM
reference counting even on shallower idle states, but at this point this
isn't supported, mainly due to limitations set by the generic PM domain.

Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---

Changes in v4:
	- None.

---
 drivers/cpuidle/cpuidle-psci.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/cpuidle/cpuidle-psci.c b/drivers/cpuidle/cpuidle-psci.c
index 9600fe674a89..6e7804e697ed 100644
--- a/drivers/cpuidle/cpuidle-psci.c
+++ b/drivers/cpuidle/cpuidle-psci.c
@@ -16,6 +16,7 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/psci.h>
+#include <linux/pm_runtime.h>
 #include <linux/slab.h>
 
 #include <asm/cpuidle.h>
@@ -51,14 +52,21 @@ static int psci_enter_domain_idle_state(struct cpuidle_device *dev,
 {
 	struct psci_cpuidle_data *data = this_cpu_ptr(&psci_cpuidle_data);
 	u32 *states = data->psci_states;
-	u32 state = psci_get_domain_state();
+	struct device *pd_dev = data->dev;
+	u32 state;
 	int ret;
 
+	/* Do runtime PM to manage a hierarchical CPU toplogy. */
+	pm_runtime_put_sync_suspend(pd_dev);
+
+	state = psci_get_domain_state();
 	if (!state)
 		state = states[idx];
 
 	ret = psci_enter_state(idx, state);
 
+	pm_runtime_get_sync(pd_dev);
+
 	/* Clear the domain state to start fresh when back from idle. */
 	psci_set_domain_state(0);
 	return ret;
-- 
2.17.1

