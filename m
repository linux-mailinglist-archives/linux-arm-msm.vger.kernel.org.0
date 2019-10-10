Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB1DFD2820
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2019 13:40:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731230AbfJJLkP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Oct 2019 07:40:15 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:43879 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731916AbfJJLkP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Oct 2019 07:40:15 -0400
Received: by mail-lj1-f196.google.com with SMTP id n14so5809932ljj.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2019 04:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=uPQQL2LvieO3hRSdVOoT+soulZMhG9ActuEg4qQLyaA=;
        b=T0nFsd0F5yhLoTBaFcw7y7TSJ7swFLFrCm0iZ9fxXkpwH6LgoqyNcmtnY+mHnZ7wqA
         tzclaFDIjVJeRj4TRzdNHxas/7Vc8CSCkhEVswvN1U/GYZXItT1Dooz0x75Gut6BZJwe
         4S12SRko6dhQUiVAR7mIGBsqkpltXwc+NMvmdHK8upCiNxXR8JCoLhsHRJqg1TNG15Iv
         a8dMDov2BYDB7gaiCVsBOvN3bHHR40LV7UsV9TRjpeuPT4Ri5Tw3COGyo494xPZWl7xQ
         Q9jZ1l0HBJVKHFxRnUwvZuXn9e9UCxKzqe6oBIidHY+cpmTeJzdcMO6Goptv3Oz/YpEU
         VJHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=uPQQL2LvieO3hRSdVOoT+soulZMhG9ActuEg4qQLyaA=;
        b=D+POr1ecRLAUScrKdX5RkbadKHMdI/G2iLTB+aNF+DwMx4gpSFMQ/22dlYA8MbgGcD
         DkN6d3tak2w8k4hrvCEFJmwmDlFfK7vH+2jAFMugSZ1+hC8zHRdhDPS1Ih29MEy0BcJm
         AiUg3tbi+PXi/ViakPc9QPhuyCroNYk7HbJ9QAeNwBjEfeIZ/TGKdd40MNS+szLIvXto
         XV2yKZEpQS50PG5wEBSDhPmtzX4GlqXW2Y7Dn1SoFEOAnMQ7zfduMexRKF8ZA0teTo7+
         RCdmxJZSGImSCsKNqJkaZ/7y/hGxGoSf+prv8qKMjvQi26g7pxWOK2lGm+zk2PMQ0pkr
         IDjQ==
X-Gm-Message-State: APjAAAVG68VJimT+BQNqltQAnEhRGus9RptmsNMEHwIII0BZpai7eP7E
        QWDBxjmMHAlsOTJ9MQyRNfq09A==
X-Google-Smtp-Source: APXvYqwd9hZQk2PNNSWawnj+vwKKoXgMm6PDK8dcNZdYDc7Bp/XO4FPg5jdpJ5ioW9H9llCi9Uk6EQ==
X-Received: by 2002:a2e:6f0f:: with SMTP id k15mr6301625ljc.12.1570707613211;
        Thu, 10 Oct 2019 04:40:13 -0700 (PDT)
Received: from localhost.localdomain (h-158-174-22-210.NA.cust.bahnhof.se. [158.174.22.210])
        by smtp.gmail.com with ESMTPSA id p3sm1168937ljn.78.2019.10.10.04.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2019 04:40:12 -0700 (PDT)
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
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, Lina Iyer <lina.iyer@linaro.org>
Subject: [PATCH 05/13] cpuidle: dt: Support hierarchical CPU idle states
Date:   Thu, 10 Oct 2019 13:39:29 +0200
Message-Id: <20191010113937.15962-6-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191010113937.15962-1-ulf.hansson@linaro.org>
References: <20191010113937.15962-1-ulf.hansson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Lina Iyer <lina.iyer@linaro.org>

Currently CPU's idle states are represented using the flattened model.
Let's add support for the hierarchical layout, via converting to use
of_get_cpu_state_node().

Suggested-by: Sudeep Holla <sudeep.holla@arm.com>
Signed-off-by: Lina Iyer <lina.iyer@linaro.org>
Reviewed-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Co-developed-by: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/cpuidle/dt_idle_states.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/cpuidle/dt_idle_states.c b/drivers/cpuidle/dt_idle_states.c
index d06d21a9525d..252f2a9686a6 100644
--- a/drivers/cpuidle/dt_idle_states.c
+++ b/drivers/cpuidle/dt_idle_states.c
@@ -111,8 +111,7 @@ static bool idle_state_valid(struct device_node *state_node, unsigned int idx,
 	for (cpu = cpumask_next(cpumask_first(cpumask), cpumask);
 	     cpu < nr_cpu_ids; cpu = cpumask_next(cpu, cpumask)) {
 		cpu_node = of_cpu_device_node_get(cpu);
-		curr_state_node = of_parse_phandle(cpu_node, "cpu-idle-states",
-						   idx);
+		curr_state_node = of_get_cpu_state_node(cpu_node, idx);
 		if (state_node != curr_state_node)
 			valid = false;
 
@@ -170,7 +169,7 @@ int dt_init_idle_driver(struct cpuidle_driver *drv,
 	cpu_node = of_cpu_device_node_get(cpumask_first(cpumask));
 
 	for (i = 0; ; i++) {
-		state_node = of_parse_phandle(cpu_node, "cpu-idle-states", i);
+		state_node = of_get_cpu_state_node(cpu_node, i);
 		if (!state_node)
 			break;
 
-- 
2.17.1

