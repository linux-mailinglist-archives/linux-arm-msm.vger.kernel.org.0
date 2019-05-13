Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 478C91BDF2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 May 2019 21:30:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727211AbfEMTaH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 May 2019 15:30:07 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:33594 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727167AbfEMTaH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 May 2019 15:30:07 -0400
Received: by mail-lf1-f65.google.com with SMTP id x132so9972065lfd.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 May 2019 12:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=XTy06JPjF+Flbr9WT5p68Fa18r9/HEAcUQNjh0fiSxI=;
        b=xNwX3XNe/fEpvPHbUQrZ5x+LqEpdA/RH0mdOzfdRzVQASPFEcNy/mFD0OfHWCToaZ0
         PrLL4rnH27RSud7LIy378Wj4Wj8Hh9/Xt0I8VfOlVZRAh/O3hbwv62GHEi7+LF8SOLO2
         tt3BCSJoO1lX0RHEpuYlTM6SspGottirXeynSYFliz9YP8Y+Zzt7m+A613Qa7wbd7vf9
         9Bq4pR31rg1WKJVhfAuJ5QPRwmYRPdi4ueAQ4ADAi0B9GO8o48sWaERmDbLHwHzGEjEy
         1VAPQLLEoIZKP/kHIeO1MNUF7XhwAH5ChUeHgtbVhjw8ggkBEECcBqw/N9bFX+WErUR/
         8B/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=XTy06JPjF+Flbr9WT5p68Fa18r9/HEAcUQNjh0fiSxI=;
        b=f5QvPpY7PLoIfKDzkqPxjAoi19YOC/Q1s/YTOf0kUBD6tLRok3NhDhS5l6OxAZj7X0
         UOtGGqehueorf4A1OPZLMyvyx9P2VPr+Q+MUhaiUjC4gM5u9rHF+/eqkhsHKh2E59rQW
         PbHpnyLYec3I/LLomDZ39GBnqNx1Zf3DopzlQGQwDF77/+1UROVqwTEoY587q3WqJjRo
         sPESMsJr8xygujUF8Az+LxvfKdgJv2R1ibWpCZHf/Efg/8CYc4WEbY3GuVRVaZAMcbtl
         xiGWSoWZpARcWJVGRYfQPwRhbSjRbIiRwfFrNxjy53oC3OVh5ClX4KRFE07J9OSNYraI
         nAkw==
X-Gm-Message-State: APjAAAVj/MxPGfueKlMuLzuCLEp1z0EOGRCs1Wr96iA3Fk+qYPsklBWv
        zsx2HvdiiwE5Drqg9YhTWL8oVw==
X-Google-Smtp-Source: APXvYqy6lylq/7RbTmCodW9mEbVCUkckcxopczjrEblxG06MxFPhpTcYSizZjnHDtDbPl63l4lZbOw==
X-Received: by 2002:ac2:410e:: with SMTP id b14mr7738149lfi.100.1557775406156;
        Mon, 13 May 2019 12:23:26 -0700 (PDT)
Received: from localhost.localdomain (h-158-174-22-210.NA.cust.bahnhof.se. [158.174.22.210])
        by smtp.gmail.com with ESMTPSA id q21sm3449365lfa.84.2019.05.13.12.23.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 May 2019 12:23:25 -0700 (PDT)
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
        linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
        Lina Iyer <lina.iyer@linaro.org>
Subject: [PATCH 11/18] drivers: firmware: psci: Introduce psci_dt_topology_init()
Date:   Mon, 13 May 2019 21:22:53 +0200
Message-Id: <20190513192300.653-12-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190513192300.653-1-ulf.hansson@linaro.org>
References: <20190513192300.653-1-ulf.hansson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

To be able to initiate the PM domain data structures for PSCI at a specific
point during boot, let's export a new init function,
psci_dt_topology_init(). If CONFIG_CPU_IDLE is set, it calls
psci_dt_init_pm_domains(), which performs the actual initialization.

Note that, it may seem like feasible idea to hook into the existing
psci_dt_init() function, rather than adding a new separate init function.
However, this doesn't work because psci_dt_init() is called early in the
boot sequence, when allocating dynamic data structures isn't yet possible.

Subsequent changes calls this new init function.

Finally, following changes on top needs to know whether the hierarchical PM
domain topology is used or not. Therefore, let's store this information in
an internal PSCI flag.

Co-developed-by: Lina Iyer <lina.iyer@linaro.org>
Signed-off-by: Lina Iyer <lina.iyer@linaro.org>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---

Changes:
	- Moved some code inside "#ifdef CONFIG_CPU_IDLE".
	- Updated changelog.

---
 drivers/firmware/psci/psci.c | 30 ++++++++++++++++++++++++++++++
 include/linux/psci.h         |  2 ++
 2 files changed, 32 insertions(+)

diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
index bfef300b7ebe..28745234b53f 100644
--- a/drivers/firmware/psci/psci.c
+++ b/drivers/firmware/psci/psci.c
@@ -297,6 +297,7 @@ static int __init psci_features(u32 psci_func_id)
 #ifdef CONFIG_CPU_IDLE
 static DEFINE_PER_CPU_READ_MOSTLY(u32 *, psci_power_state);
 static DEFINE_PER_CPU(u32, domain_state);
+static bool psci_dt_topology;
 
 static inline u32 psci_get_domain_state(void)
 {
@@ -480,6 +481,19 @@ static const struct cpuidle_ops psci_cpuidle_ops __initconst = {
 
 CPUIDLE_METHOD_OF_DECLARE(psci, "psci", &psci_cpuidle_ops);
 #endif
+
+static int __init _psci_dt_topology_init(struct device_node *np)
+{
+	int ret;
+
+	/* Initialize the CPU PM domains based on topology described in DT. */
+	ret = psci_dt_init_pm_domains(np);
+	psci_dt_topology = ret > 0;
+
+	return ret;
+}
+#else
+static inline int _psci_dt_topology_init(struct device_node *np) { return 0; }
 #endif
 
 static int psci_system_suspend(unsigned long unused)
@@ -758,6 +772,22 @@ int __init psci_dt_init(void)
 	return ret;
 }
 
+int __init psci_dt_topology_init(void)
+{
+	struct device_node *np;
+	int ret;
+
+	np = of_find_matching_node_and_match(NULL, psci_of_match, NULL);
+	if (!np)
+		return -ENODEV;
+
+	/* Initialize the topology described in DT. */
+	ret = _psci_dt_topology_init(np);
+
+	of_node_put(np);
+	return ret;
+}
+
 #ifdef CONFIG_ACPI
 /*
  * We use PSCI 0.2+ when ACPI is deployed on ARM64 and it's
diff --git a/include/linux/psci.h b/include/linux/psci.h
index 4f29a3bff379..16beccccbbcc 100644
--- a/include/linux/psci.h
+++ b/include/linux/psci.h
@@ -55,8 +55,10 @@ extern struct psci_operations psci_ops;
 
 #if defined(CONFIG_ARM_PSCI_FW)
 int __init psci_dt_init(void);
+int __init psci_dt_topology_init(void);
 #else
 static inline int psci_dt_init(void) { return 0; }
+static inline int psci_dt_topology_init(void) { return 0; }
 #endif
 
 #if defined(CONFIG_ARM_PSCI_FW) && defined(CONFIG_ACPI)
-- 
2.17.1

