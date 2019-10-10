Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 950B5D282C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2019 13:40:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732923AbfJJLkY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Oct 2019 07:40:24 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:37565 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732792AbfJJLkY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Oct 2019 07:40:24 -0400
Received: by mail-lf1-f67.google.com with SMTP id w67so4125886lff.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2019 04:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=9/8dxTtZBh9YfBGYNaIy85l3qLceeSKusYT56QpkuBo=;
        b=yCBQoiMdVpg14N7nhofiE56fggpEHFr0HVoi4xdC8JzFHPbNJMS/F2y1VVTJBKZuTC
         aNn5dzzSU5wNfqOvEqKvJgULqbetSKXMz6OHhmqNm8eKPLJ9uhwrVNgwi3vZf8PeSsQD
         4NAC2kJpAIw0djJbv+iRnckigLk6Gs+BL0XLj8AYMISeX4o2bCaJYTwmQ06ERfvFqxaj
         fpk1JLapasYW+8jrvPic5xbqbmZNFrwXSCRsp7aXuFdcocTPj/IHe+KDL5Wg8dtiGUzC
         BZgFLnw7x4uFHX7nt6HwREijg76i/aQswB1SM3165mfcQ95JTCj9nWDZCPGlYVEywnzd
         Fkmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=9/8dxTtZBh9YfBGYNaIy85l3qLceeSKusYT56QpkuBo=;
        b=E2F+FiGcyxUj4KNv/FV9WtPf83A42YgYCI+niI9szm2nJFt5hwdDGuTm31MCl4TfcR
         XNj/k4u1lloxX9xL8eqmDAoGSKkidCeFxUc1Yi5ZRslRT19UZ769nM9WfoNY8ZB4fpVE
         9hXJIEP5BRPzZjG7TaBRorTzEAqbQ28VUfSmQ7fMRidLblC4Bb+MKTG1RJHEQl5clOx/
         C/BN2mgm4WVpVICR4qyInRVenmGsUxzJC0kgRQPl9LJFwuphskpW3/U2kCwFhIhJMGCz
         5vJrY6pZwTD3BBh2nw03v0jyLysc+xp1Wwttu+fRhHI4i0noFpI/NyQ18Kwc+3qigMwV
         duLg==
X-Gm-Message-State: APjAAAWU6d0QGGOjJtFSopm27QF77ldbqyJELFNLkQ1Wv1Yy9dMhDjYG
        tv76bNHxva+nKq5lSX7GQIlDfA==
X-Google-Smtp-Source: APXvYqwBURUiaefQaEsTZzx0SIkFbzLdJWKemCCeeCEH1PQrpCLnZQiGZWhUoIwrmftKy94I18IgPw==
X-Received: by 2002:ac2:47f1:: with SMTP id b17mr5257943lfp.31.1570707621209;
        Thu, 10 Oct 2019 04:40:21 -0700 (PDT)
Received: from localhost.localdomain (h-158-174-22-210.NA.cust.bahnhof.se. [158.174.22.210])
        by smtp.gmail.com with ESMTPSA id p3sm1168937ljn.78.2019.10.10.04.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2019 04:40:20 -0700 (PDT)
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
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kevin Hilman <khilman@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH 10/13] cpuidle: psci: Add a helper to attach a CPU to its PM domain
Date:   Thu, 10 Oct 2019 13:39:34 +0200
Message-Id: <20191010113937.15962-11-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191010113937.15962-1-ulf.hansson@linaro.org>
References: <20191010113937.15962-1-ulf.hansson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Introduce a PSCI DT helper function, psci_dt_attach_cpu(), which takes a
CPU number as an in-parameter and tries to attach the CPU's struct device
to its corresponding PM domain.

Let's makes use of dev_pm_domain_attach_by_name(), as it allows us to
specify "psci" as the "name" of the PM domain to attach to. Additionally,
let's also prepare the attached device to be power managed via runtime PM.

Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/cpuidle/cpuidle-psci-domain.c | 21 +++++++++++++++++++++
 drivers/cpuidle/cpuidle-psci.h        |  6 ++++++
 2 files changed, 27 insertions(+)

diff --git a/drivers/cpuidle/cpuidle-psci-domain.c b/drivers/cpuidle/cpuidle-psci-domain.c
index 3f5143ccc3e0..7429fd7626a1 100644
--- a/drivers/cpuidle/cpuidle-psci-domain.c
+++ b/drivers/cpuidle/cpuidle-psci-domain.c
@@ -9,9 +9,11 @@
 
 #define pr_fmt(fmt) "CPUidle PSCI: " fmt
 
+#include <linux/cpu.h>
 #include <linux/device.h>
 #include <linux/kernel.h>
 #include <linux/pm_domain.h>
+#include <linux/pm_runtime.h>
 #include <linux/psci.h>
 #include <linux/slab.h>
 #include <linux/string.h>
@@ -279,3 +281,22 @@ static int __init psci_idle_init_domains(void)
 	return ret;
 }
 subsys_initcall(psci_idle_init_domains);
+
+struct device *psci_dt_attach_cpu(int cpu)
+{
+	struct device *dev;
+
+	/* Currently limit the hierarchical topology to be used in OSI mode. */
+	if (!psci_has_osi_support())
+		return NULL;
+
+	dev = dev_pm_domain_attach_by_name(get_cpu_device(cpu), "psci");
+	if (IS_ERR_OR_NULL(dev))
+		return dev;
+
+	pm_runtime_irq_safe(dev);
+	if (cpu_online(cpu))
+		pm_runtime_get_sync(dev);
+
+	return dev;
+}
diff --git a/drivers/cpuidle/cpuidle-psci.h b/drivers/cpuidle/cpuidle-psci.h
index e593de1784c3..d2e55cad9ac6 100644
--- a/drivers/cpuidle/cpuidle-psci.h
+++ b/drivers/cpuidle/cpuidle-psci.h
@@ -8,4 +8,10 @@ struct device_node;
 void psci_set_domain_state(u32 state);
 int __init psci_dt_parse_state_node(struct device_node *np, u32 *state);
 
+#ifdef CONFIG_PM_GENERIC_DOMAINS_OF
+struct device *psci_dt_attach_cpu(int cpu);
+#else
+static inline struct device *psci_dt_attach_cpu(int cpu) { return NULL; }
+#endif
+
 #endif /* __CPUIDLE_PSCI_H */
-- 
2.17.1

