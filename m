Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FFF94C1358
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Feb 2022 13:57:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240677AbiBWM5m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Feb 2022 07:57:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240671AbiBWM5m (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Feb 2022 07:57:42 -0500
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E59AA9FFD
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Feb 2022 04:57:13 -0800 (PST)
Received: by mail-pg1-x536.google.com with SMTP id w37so13451848pga.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Feb 2022 04:57:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9zjHo6BnE+LkvSb3drhMyymhfgiGeZ2qxQyNQtjreqM=;
        b=CNsXNq6GX/7wV0tQQjbzBvUkFpuR3GUyUnpFx34jzgdd5Fca/MULlkHlNnop9BE1H7
         UzYtJoh0fjmwrJ7nPJWqTsMnuA09heFJZcOadyMiQnz0YGRZ/cBWaupEglqNi+YebIfG
         bOd1OHuu0t0wZKKTgcbhFCjlTiEy7o0wednqgj1ST/w7M17cUKSSQXfRpvdVVuqub/Sb
         ulNUDwC7lxJ4ocr5GGvujco3nau+SVz1RFQkaiugxQQbQchtOTC8nzH541e/vEwwKtGS
         vxVgnoH3bg3IHWaZTegO5vsd79ctl9MSUb4ZNp5ritfSZ0gc+b4dzihzzT3qXH53GrdP
         zrzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9zjHo6BnE+LkvSb3drhMyymhfgiGeZ2qxQyNQtjreqM=;
        b=SkvaQIbOD9ePda3UO8WSk87gSylMpZ1N6umoTbNTfHd36DGZ/Cg+bIYwnAXu3M75jl
         UlpZiJnLGfhwyI/bM8QbbvXD0rNxDGals6oCc6WFFAcRxFFxEJ/5PP02IMIfEAatLjWN
         3G02J7uxEvFz8nHiWtF82Fu97QXITyWgFtfxXQk0Ifp8S/YZirBIRzUn8VlxVg51yfnU
         tAd8MHahFpnyo7ibbuPzha9B6ehFgSqXYhvt8kbAHEPYVAJrLjv80CdbLeXqpQG/MuG1
         1GfSD/+R48I+AYXL4cHIu8sZyots284UDXJI9diE/q0l56E0+104aHoGn0GmmazFdU6J
         zygQ==
X-Gm-Message-State: AOAM530mCUipQcyJ3H+rlKtUYpfE2DQduRifTzPeHhxxKyq1TOHyegJP
        JwH9rQb9+QXlkGDv5icUcsu/3w==
X-Google-Smtp-Source: ABdhPJyfMBO4QcCVfia/BemnU75mzGDNEqqptHIs/x1P4e0kISqh/l1AoaX/wM3QNabCIVs7Kj+0QQ==
X-Received: by 2002:a63:531d:0:b0:365:5f0c:7cbb with SMTP id h29-20020a63531d000000b003655f0c7cbbmr23503993pgb.150.1645621033463;
        Wed, 23 Feb 2022 04:57:13 -0800 (PST)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id z23sm22136243pfj.87.2022.02.23.04.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 04:57:12 -0800 (PST)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Marc Zyngier <maz@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>
Cc:     Valentin Schneider <valentin.schneider@arm.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Maulik Shah <quic_mkshah@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH v6 1/3] PM: cpu: Add CPU_LAST_PM_ENTER and CPU_FIRST_PM_EXIT support
Date:   Wed, 23 Feb 2022 20:55:34 +0800
Message-Id: <20220223125536.230224-2-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220223125536.230224-1-shawn.guo@linaro.org>
References: <20220223125536.230224-1-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

It becomes a common situation on some platforms that certain hardware
setup needs to be done on the last standing cpu, and rpmh-rsc[1] is such
an existing example.  As figuring out the last standing cpu is really
something generic, it adds CPU_LAST_PM_ENTER (and CPU_FIRST_PM_EXIT)
event support to cpu_pm helper, so that individual driver can be
notified when the last standing cpu is about to enter low power state.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/soc/qcom/rpmh-rsc.c?id=v5.16#n773

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 include/linux/cpu_pm.h | 15 +++++++++++++++
 kernel/cpu_pm.c        | 33 +++++++++++++++++++++++++++++++--
 2 files changed, 46 insertions(+), 2 deletions(-)

diff --git a/include/linux/cpu_pm.h b/include/linux/cpu_pm.h
index 552b8f9ea05e..153344307b7c 100644
--- a/include/linux/cpu_pm.h
+++ b/include/linux/cpu_pm.h
@@ -55,6 +55,21 @@ enum cpu_pm_event {
 
 	/* A cpu power domain is exiting a low power state */
 	CPU_CLUSTER_PM_EXIT,
+
+	/*
+	 * A cpu is entering a low power state after all other cpus
+	 * in the system have entered the lower power state.
+	 */
+	CPU_LAST_PM_ENTER,
+
+	/* The last cpu failed to enter a low power state */
+	CPU_LAST_PM_ENTER_FAILED,
+
+	/*
+	 * A cpu is exiting a low power state before any other cpus
+	 * in the system exits the low power state.
+	 */
+	CPU_FIRST_PM_EXIT,
 };
 
 #ifdef CONFIG_CPU_PM
diff --git a/kernel/cpu_pm.c b/kernel/cpu_pm.c
index 246efc74e3f3..7c104446e1e9 100644
--- a/kernel/cpu_pm.c
+++ b/kernel/cpu_pm.c
@@ -26,6 +26,8 @@ static struct {
 	.lock  = __RAW_SPIN_LOCK_UNLOCKED(cpu_pm_notifier.lock),
 };
 
+static atomic_t cpus_in_pm;
+
 static int cpu_pm_notify(enum cpu_pm_event event)
 {
 	int ret;
@@ -116,7 +118,20 @@ EXPORT_SYMBOL_GPL(cpu_pm_unregister_notifier);
  */
 int cpu_pm_enter(void)
 {
-	return cpu_pm_notify_robust(CPU_PM_ENTER, CPU_PM_ENTER_FAILED);
+	int ret;
+
+	ret = cpu_pm_notify_robust(CPU_PM_ENTER, CPU_PM_ENTER_FAILED);
+	if (ret)
+		return ret;
+
+	if (atomic_inc_return(&cpus_in_pm) == num_online_cpus()) {
+		ret = cpu_pm_notify_robust(CPU_LAST_PM_ENTER,
+					   CPU_LAST_PM_ENTER_FAILED);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
 }
 EXPORT_SYMBOL_GPL(cpu_pm_enter);
 
@@ -134,7 +149,21 @@ EXPORT_SYMBOL_GPL(cpu_pm_enter);
  */
 int cpu_pm_exit(void)
 {
-	return cpu_pm_notify(CPU_PM_EXIT);
+	int ret;
+
+	ret = cpu_pm_notify(CPU_PM_EXIT);
+	if (ret)
+		return ret;
+
+	if (atomic_read(&cpus_in_pm) == num_online_cpus()) {
+		ret = cpu_pm_notify(CPU_FIRST_PM_EXIT);
+		if (ret)
+			return ret;
+	}
+
+	atomic_dec(&cpus_in_pm);
+
+	return 0;
 }
 EXPORT_SYMBOL_GPL(cpu_pm_exit);
 
-- 
2.25.1

