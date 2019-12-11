Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F9F311B3A7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2019 16:44:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733163AbfLKPoA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Dec 2019 10:44:00 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:35866 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388764AbfLKPn5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Dec 2019 10:43:57 -0500
Received: by mail-lj1-f195.google.com with SMTP id r19so24632853ljg.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2019 07:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=rTyFfehsHZ4NrOw6RaeXcNkMIHnoS8zNHPnwBdHCVW4=;
        b=p5CrlKDt3mkO5z+JaPTIxWFp1zu66so+e8FkAUrFkoA8GpcVCIRnRFbgMKzLoaHzlW
         HCv+6p5dqkThhU/6+gENScBRN2Ij182cE77XbziWSrktZRYLrulaWpBFRO4l1Fr/ITes
         XMrApT04irJm6q/vvKyw0CjHNrtvRz3jxX/ux2yCHAbH4j8a7VSuUN91m7v6KQevqpWh
         5rwME1geedwsSxeTd32eFCIwPYPb4gns9rdDMoY7+L46ViaYCQfjBTlJ8omHwMW+vMl9
         Yuel0R2OWPSUCRoJTIy9gsQF8SUuIS6aAYxo8lNs+lJ8yiQsqFiaDuKhBwv2/9lre3TK
         1qUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=rTyFfehsHZ4NrOw6RaeXcNkMIHnoS8zNHPnwBdHCVW4=;
        b=GyZKYw3Ajel8H6w/yMDWiAl6ObQTx43gIzWESzNFjLzHJwfcLEsoE7fOdWPfutVyF/
         n1lLb9gJU8zKFec+Q+dL96rq1mU9FMyEjSmXc2ielH6mnvlz7MApvWaqS1n0po80qspa
         uG7z7U+m9fe8Qroy/Sx+N44xEq97eAzBAndSsaOEQavJUCDq0iYELL7TSaDjRZx0yqTj
         i0sL1CAdZK1Tim6Oam+aWuY++tZjza9ACFmDG5SidEczh1qptgqX6l6zdK8uzBRnDiUp
         bdyXaabTg60N33+Y7ITGVq+iz1LfFeXCS6bLAv/g4+gIerxWFymSIO4MNgsZq+HyMolH
         3gpg==
X-Gm-Message-State: APjAAAW5YqtarltuGpL1gDxN8KY0p2kbYj+Fc9Gyr0ABuOIA40tYEld0
        X9hwB/SVWDptRopfwdaPmSqPHw==
X-Google-Smtp-Source: APXvYqyuPt21/xnIK8FG2LgE0sYaNL0lj+qHjE9ysH3DMI2EmfAOl/ZGGEJEhFZhyeNFNpE1jzEoxQ==
X-Received: by 2002:a2e:9a51:: with SMTP id k17mr2389984ljj.206.1576079035828;
        Wed, 11 Dec 2019 07:43:55 -0800 (PST)
Received: from localhost.localdomain (h-158-174-22-210.NA.cust.bahnhof.se. [158.174.22.210])
        by smtp.gmail.com with ESMTPSA id b14sm1389608lff.68.2019.12.11.07.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2019 07:43:55 -0800 (PST)
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
Subject: [PATCH v4 03/14] firmware: psci: Export functions to manage the OSI mode
Date:   Wed, 11 Dec 2019 16:43:32 +0100
Message-Id: <20191211154343.29765-4-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191211154343.29765-1-ulf.hansson@linaro.org>
References: <20191211154343.29765-1-ulf.hansson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

To allow subsequent changes to implement support for OSI mode through the
cpuidle-psci driver, export the existing psci_has_osi_support(). Export
also a new function, psci_set_osi_mode(), that allows its caller to enable
the OS-initiated CPU-suspend mode in the PSCI FW.

To deal with backwards compatibility for a kernel started through a kexec
call, default to set the CPU-suspend mode to the Platform Coordinated mode
during boot.

Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
---

Changes in v4:
	- None.

---
 drivers/firmware/psci/psci.c | 18 ++++++++++++++++--
 include/linux/psci.h         |  2 ++
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
index b3b6c15e7b36..2937d44b5df4 100644
--- a/drivers/firmware/psci/psci.c
+++ b/drivers/firmware/psci/psci.c
@@ -97,7 +97,7 @@ static inline bool psci_has_ext_power_state(void)
 				PSCI_1_0_FEATURES_CPU_SUSPEND_PF_MASK;
 }
 
-static inline bool psci_has_osi_support(void)
+bool psci_has_osi_support(void)
 {
 	return psci_cpu_suspend_feature & PSCI_1_0_OS_INITIATED;
 }
@@ -162,6 +162,15 @@ static u32 psci_get_version(void)
 	return invoke_psci_fn(PSCI_0_2_FN_PSCI_VERSION, 0, 0, 0);
 }
 
+int psci_set_osi_mode(void)
+{
+	int err;
+
+	err = invoke_psci_fn(PSCI_1_0_FN_SET_SUSPEND_MODE,
+			     PSCI_1_0_SUSPEND_MODE_OSI, 0, 0);
+	return psci_to_linux_errno(err);
+}
+
 static int psci_cpu_suspend(u32 state, unsigned long entry_point)
 {
 	int err;
@@ -544,9 +553,14 @@ static int __init psci_1_0_init(struct device_node *np)
 	if (err)
 		return err;
 
-	if (psci_has_osi_support())
+	if (psci_has_osi_support()) {
 		pr_info("OSI mode supported.\n");
 
+		/* Default to PC mode. */
+		invoke_psci_fn(PSCI_1_0_FN_SET_SUSPEND_MODE,
+			       PSCI_1_0_SUSPEND_MODE_PC, 0, 0);
+	}
+
 	return 0;
 }
 
diff --git a/include/linux/psci.h b/include/linux/psci.h
index ebe0a881d13d..a67712b73b6c 100644
--- a/include/linux/psci.h
+++ b/include/linux/psci.h
@@ -18,6 +18,8 @@ bool psci_tos_resident_on(int cpu);
 
 int psci_cpu_suspend_enter(u32 state);
 bool psci_power_state_is_valid(u32 state);
+int psci_set_osi_mode(void);
+bool psci_has_osi_support(void);
 
 enum smccc_version {
 	SMCCC_VERSION_1_0,
-- 
2.17.1

