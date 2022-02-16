Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4A2F4B89E9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Feb 2022 14:28:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234245AbiBPN3A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Feb 2022 08:29:00 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:40902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234267AbiBPN27 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Feb 2022 08:28:59 -0500
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 116151617F9
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Feb 2022 05:28:48 -0800 (PST)
Received: by mail-pg1-x52e.google.com with SMTP id 139so2178121pge.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Feb 2022 05:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=tARKrBf1+k+dk/y0+eGi6r+ZGZ/s9sGusak1bxU9rx0=;
        b=oRw5uoFIqszci3wJHVQoWSoHtxxhw/jfozwwgNBoAf3OTNakOtzqcGrCGDVTHnUgkM
         N9Ndz4eyrd6HVSaYr6A2ACuAEE3gfehc94fg9N61NXaX+mY6/x/pAAHqsKxTkP1vRr/B
         uMCluwzs38WJ4CfvRxF/Ee7iwMKVgHRmo4/JZf1LXcrnlVJLjqAgO4xTAcxymbRbFZtX
         abE7w6tzpHrvIjDIypQ8F1vcs3bIIF6+rsQdGbEh/vHUXNwv+JwRH3JQwG+MvVpP4/2h
         oJpU9kuF24noUO3pz8X/w7wfP2ryEHQW2g6PzD3y4n1Im7/4ihhhFQl8dLSDnpbNv3R6
         QdHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=tARKrBf1+k+dk/y0+eGi6r+ZGZ/s9sGusak1bxU9rx0=;
        b=gdzll2OQjgt9BScgnvNNDSVbD1hNl9Gzt++PmS0+sOTmamoiLsMatTPlidteFYtAYs
         vUNFWFS9H/Lpc8q/DbJ54MAA1hde8m5n6RJ6yKPBuQ8zkWjn3gYDbJDQj5kyaPxWMi/3
         vVxiFdNugXQveUclJVjif0Cfu2kAv6mLUgttxK9vsv2moTVU9Nm/je3DMcYvH4qOiCke
         JMJUyG7ndlU3pMdN+QaUP2clMh4NPj1F8NCGPrU+42NcufyRH6+n9N/ZwrBScRF+9h4a
         1Iqh+t1UbVIrCftulUVeHOy9tdcax7J4su9z9iOjwcQMzmCTvQdH7JApQz0PnE3tTsNe
         8T+g==
X-Gm-Message-State: AOAM531+ptDTBtyRqcpIfU4aPiVgXdRz7sJXDVTEamqUF6KtImPq5VOG
        dZznla/Gy3cXc8h2ob6563zDXA==
X-Google-Smtp-Source: ABdhPJyUj+cZ79J/hrnelkzMVbiRfVIKVORSOhLePrdr/bNGnZcJycwgs1WIkvH0TS5BMaRztDoeWA==
X-Received: by 2002:a63:215a:0:b0:372:9d20:5146 with SMTP id s26-20020a63215a000000b003729d205146mr2275147pgm.419.1645018127625;
        Wed, 16 Feb 2022 05:28:47 -0800 (PST)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id c68sm5431002pga.1.2022.02.16.05.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Feb 2022 05:28:47 -0800 (PST)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>
Cc:     Maulik Shah <quic_mkshah@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH v5 1/3] cpuidle: psci: Call cpu_cluster_pm_enter() on the last CPU
Date:   Wed, 16 Feb 2022 21:28:28 +0800
Message-Id: <20220216132830.32490-2-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220216132830.32490-1-shawn.guo@linaro.org>
References: <20220216132830.32490-1-shawn.guo@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Make a call to cpu_cluster_pm_enter() on the last CPU going to low power
state (and cpu_cluster_pm_exit() on the firt CPU coming back), so that
platforms can be notified to set up hardware for getting into the cluster
low power state.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/cpuidle/cpuidle-psci.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/cpuidle/cpuidle-psci.c b/drivers/cpuidle/cpuidle-psci.c
index b51b5df08450..c748c1a7d7b1 100644
--- a/drivers/cpuidle/cpuidle-psci.c
+++ b/drivers/cpuidle/cpuidle-psci.c
@@ -37,6 +37,7 @@ struct psci_cpuidle_data {
 static DEFINE_PER_CPU_READ_MOSTLY(struct psci_cpuidle_data, psci_cpuidle_data);
 static DEFINE_PER_CPU(u32, domain_state);
 static bool psci_cpuidle_use_cpuhp;
+static atomic_t cpus_in_idle;
 
 void psci_set_domain_state(u32 state)
 {
@@ -67,6 +68,14 @@ static int __psci_enter_domain_idle_state(struct cpuidle_device *dev,
 	if (ret)
 		return -1;
 
+	if (atomic_inc_return(&cpus_in_idle) == num_online_cpus()) {
+		ret = cpu_cluster_pm_enter();
+		if (ret) {
+			ret = -1;
+			goto dec_atomic;
+		}
+	}
+
 	/* Do runtime PM to manage a hierarchical CPU toplogy. */
 	rcu_irq_enter_irqson();
 	if (s2idle)
@@ -88,6 +97,10 @@ static int __psci_enter_domain_idle_state(struct cpuidle_device *dev,
 		pm_runtime_get_sync(pd_dev);
 	rcu_irq_exit_irqson();
 
+	if (atomic_read(&cpus_in_idle) == num_online_cpus())
+		cpu_cluster_pm_exit();
+dec_atomic:
+	atomic_dec(&cpus_in_idle);
 	cpu_pm_exit();
 
 	/* Clear the domain state to start fresh when back from idle. */
-- 
2.17.1

