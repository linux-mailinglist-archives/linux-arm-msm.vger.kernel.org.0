Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89918E8CFE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2019 17:44:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390632AbfJ2Qov (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Oct 2019 12:44:51 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:34852 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390622AbfJ2Qou (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Oct 2019 12:44:50 -0400
Received: by mail-lj1-f196.google.com with SMTP id m7so16040459lji.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Oct 2019 09:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=pxj7KLSW5R2axCiapc3eou/vjW6LvEtO3EFuHvUy+4g=;
        b=YplOBV9MJp6EqG3mBNIF6X+EXkSFeG7T2VIHeODHEiXdaWz4zntnkKVjKaEGbI0f7R
         G1A3ZryFYT2UlYqsMdN/gzyqvvBDLriCWS/mNDFxaZwYrOCO8d6H6+BjlQyw+EnzsiWW
         u+Ypmf3mJBfP68rmHWB+MHCs+KuSiKH0I1wHy/mK+sLeXog+tuKsTV2PQoDIY/2AnrO5
         B2PRaJLBliCJARdr2V0NbAM0At2TTYQL3cAjEAOv3MHVMQNlBsqKv8UE+wFZQWsnqRyk
         +O8j5iezP2XmZtk9vE+QNwVVh83h+umuALjKvcTgvqsVMruxhWmQ07eIhO0QU2DJaODO
         sU7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=pxj7KLSW5R2axCiapc3eou/vjW6LvEtO3EFuHvUy+4g=;
        b=aFYeaDoUOzchn5vOZpNHfTlOYHZNfNYoXRnz/SENqobFOnLkKGEvNzMhjwqQ1jFs7N
         rlRHoz71XKVF4BaQC+GwbvgDLCSQkUQrQ8X25bSSNo3JWI3X8Tt/4ekfIHr7GcnRDFIO
         rNoz9rE0LwYrhOZ+NdV7CdclYFAouwm/d2AvTBla1hiw3Hyvc6luhPc1ury/SpLWMGTL
         gSYkRL/paAc+18pzG1cMF66V1W9C8oqQVfSzLN44GDviCnzCZ2WB27vNi9A2tGYYWEsm
         OEzrQRdqJVu0T0xjrrXLnEmUE/iS9MaOhLpVSh6E7tC5M9xU2jv9vQk2NVLw9mP/uASR
         ze5Q==
X-Gm-Message-State: APjAAAXzvYfHaoY3nP1qAfYsT7+1O2VQ96mvC0sxdTY9OOG/7BpLVpVM
        ICKFrSWPASwjDIJ/XrGyjVqvmw==
X-Google-Smtp-Source: APXvYqxTjxZNGQL/LqFi3IPfYCjxpsMyLxV8MH634j47PS/Jjpjo1p7lcpDprbECJDfAoIIUSpu45A==
X-Received: by 2002:a2e:9d06:: with SMTP id t6mr3391781lji.253.1572367488497;
        Tue, 29 Oct 2019 09:44:48 -0700 (PDT)
Received: from localhost.localdomain (h-158-174-22-210.NA.cust.bahnhof.se. [158.174.22.210])
        by smtp.gmail.com with ESMTPSA id f28sm2048161lfh.35.2019.10.29.09.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 09:44:47 -0700 (PDT)
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
Subject: [PATCH v2 03/13] firmware: psci: Export functions to manage the OSI mode
Date:   Tue, 29 Oct 2019 17:44:28 +0100
Message-Id: <20191029164438.17012-4-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191029164438.17012-1-ulf.hansson@linaro.org>
References: <20191029164438.17012-1-ulf.hansson@linaro.org>
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

Changes in v2:
	- Added tags.
---
 drivers/firmware/psci/psci.c | 18 ++++++++++++++++--
 include/linux/psci.h         |  2 ++
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
index 84f4ff351c62..76f3a991d4d7 100644
--- a/drivers/firmware/psci/psci.c
+++ b/drivers/firmware/psci/psci.c
@@ -89,7 +89,7 @@ static inline bool psci_has_ext_power_state(void)
 				PSCI_1_0_FEATURES_CPU_SUSPEND_PF_MASK;
 }
 
-static inline bool psci_has_osi_support(void)
+bool psci_has_osi_support(void)
 {
 	return psci_cpu_suspend_feature & PSCI_1_0_OS_INITIATED;
 }
@@ -154,6 +154,15 @@ static u32 psci_get_version(void)
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
@@ -536,9 +545,14 @@ static int __init psci_1_0_init(struct device_node *np)
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
index e2bacc6fd2f2..f76b45341adf 100644
--- a/include/linux/psci.h
+++ b/include/linux/psci.h
@@ -17,6 +17,8 @@ bool psci_tos_resident_on(int cpu);
 
 int psci_cpu_suspend_enter(u32 state);
 bool psci_power_state_is_valid(u32 state);
+int psci_set_osi_mode(void);
+bool psci_has_osi_support(void);
 
 enum psci_conduit {
 	PSCI_CONDUIT_NONE,
-- 
2.17.1

