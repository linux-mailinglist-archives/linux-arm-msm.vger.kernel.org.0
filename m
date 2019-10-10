Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7786D281B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2019 13:40:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727391AbfJJLkL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Oct 2019 07:40:11 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:33267 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727737AbfJJLkL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Oct 2019 07:40:11 -0400
Received: by mail-lj1-f194.google.com with SMTP id a22so5881573ljd.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2019 04:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=v88JQU6vGgb8ri6uCDKoMwVq9Ia/h8wuaSmlcufCmYU=;
        b=jt87ZF+5/DHtUlBRJ5BstY8Vh6NbAEk5UF5D0u9HLT6presiea5l2x37EGTavAgCM2
         H6B9YduMYxyPWcZQ4LDD0neKrxzMhr4DDLJH8oBvjt+ks9l3QnWRR5PubXNd4vzUEa3V
         fgBE1oE+WU63PB9MXoMoWyvRweYDa/KA+enceW5fZYXZHR2ZMUhprzxuPtzW7IdBbqZ/
         kGJTTsnM0FhDhek77frZusCt3Srayy/AEUjcMSLtjZYglG2TVmus+yHd4KOQekmMb080
         WIB28o60K0vFD9ulrOuL9R6XqTAkOFwHwsw7PULu7sOOm3lOtCBUtvXHBX7li4uUnl0I
         C04Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=v88JQU6vGgb8ri6uCDKoMwVq9Ia/h8wuaSmlcufCmYU=;
        b=TwFUxtKGmIVwfaG2Z4cAcGqmQzS+DhhQ4mppyyZg7j3xG0GrL58iSuImU8dTSZ0L41
         0aRGrjeA3IN+GQENOTYqRhzTZMwNNsSX28xJUqXP+qYojhgPup0XQO8xdSTCeCYjS5Wc
         ADeWxeFBmmVgAaELvS3v+KqaycQ1JvadZD9VxH91jhs7O3LHB5A/JJoNPz8K/rfMBv4N
         yirkq/Wb3MAVhWWAHI2GhmbHeZBBNrou3nUY7bGXkSRT3qaV711b12/WLJ6qzJn3SCi/
         kTFq81p/31opGzDmxJd5eQLsUUBEOwOc8yl+FdEvE3wB3gNIsnsjtJ0KmwX13FCIwvyK
         GtkA==
X-Gm-Message-State: APjAAAXZ+Ic5Sa4kSa1p0hhay89fwy2Wkc1YPjNgU5wYYu1VkFJnvpc+
        s92/TV10vfqROdEpHsnWf8952w==
X-Google-Smtp-Source: APXvYqyCKks0JZZNViLz2Kmfcp+HjHLDr3UWaZTScndbtx975mvyfpGsTCg1ZMWYx/C2hWBuMccseA==
X-Received: by 2002:a2e:9b8a:: with SMTP id z10mr6104674lji.80.1570707609559;
        Thu, 10 Oct 2019 04:40:09 -0700 (PDT)
Received: from localhost.localdomain (h-158-174-22-210.NA.cust.bahnhof.se. [158.174.22.210])
        by smtp.gmail.com with ESMTPSA id p3sm1168937ljn.78.2019.10.10.04.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2019 04:40:08 -0700 (PDT)
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
Subject: [PATCH 03/13] firmware: psci: Export functions to manage the OSI mode
Date:   Thu, 10 Oct 2019 13:39:27 +0200
Message-Id: <20191010113937.15962-4-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191010113937.15962-1-ulf.hansson@linaro.org>
References: <20191010113937.15962-1-ulf.hansson@linaro.org>
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

