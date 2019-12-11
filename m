Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0182611B3B6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2019 16:44:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388561AbfLKPoG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Dec 2019 10:44:06 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:45990 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387925AbfLKPoF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Dec 2019 10:44:05 -0500
Received: by mail-lf1-f67.google.com with SMTP id 203so17016437lfa.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2019 07:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=1AOYaDETC7AoWHNfeWM9scObxF5giaIQjN7hMSflMOY=;
        b=uR/XWlqUnPKu+Zx9llz6VPEhdC+0Ouhey5oNG2GzZgGnm31i1Vd1IIbsFKhFtCta8t
         9QSjI6I4BJPwsTRfIjNun5q1ClONIbt7jwT8+y0zmljSeqHba49V34wAZ4dewSrp755R
         K1a9Physk4djE0T7CDFSLP94QpLDX132rohpm5+lH0pAsZzi6k207O4lN7c8SNyOHoKk
         L/5ANPqTI5XNEEO/ZlsMiUMuUCs40jZPYIkOFWJdE4g+E6k5o1IcqGDLbddYcYgsDHx9
         IrFpiLyPn3DPyZmqjcXgmerkJRvkuPoXJKPzdYB9F/FX9tDe7qvl6p+jXhIOTm9g0BHH
         dWxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=1AOYaDETC7AoWHNfeWM9scObxF5giaIQjN7hMSflMOY=;
        b=a00u/4MtDDPW1/Wn6KrgmIfkGODuElnQYsMrFuMArEz1VXfhpFDlXGvT25pwCs4kCo
         f+LJjX3BvJjKAOFXaN8IjwLZZy10mgP3JvAGaVIgvr2gbce/LnVI5cWYds6KfgYn1Ua1
         LEqWM2oITPp9dwJa5wKqM83cGl/1fqf5Owiqr/y0DW/rh35MaDSZZJ+gXWmP/0/BcUbv
         zEPgxhF+Bdmz5wm/5I2zry+tqPS+rfpm1gOFE838fEREWA+pLwcXNvA+Sw8QwG1T/UjC
         bHSoIw4qj/jLojNkycHew0Tcsi4Hg7+ol2PROXSgfGII4EwRbtPUaA7qyDgo/J7QUbMD
         0hbg==
X-Gm-Message-State: APjAAAXnFjFJ0ouvkGb9AJjkY4AY2/9wkQsoL1PdgKfoJhiztPH0g3xv
        zMzhGuaJI2N2B21CL/sllLQ5Uw==
X-Google-Smtp-Source: APXvYqw+4mzcRtBlHxe36UISiT+M6wE3tUk1CvI9Gl+QZpzzGHQxkKwO2cVnLAiFq4qHqteUcVj3fQ==
X-Received: by 2002:a19:a408:: with SMTP id q8mr2560939lfc.174.1576079043410;
        Wed, 11 Dec 2019 07:44:03 -0800 (PST)
Received: from localhost.localdomain (h-158-174-22-210.NA.cust.bahnhof.se. [158.174.22.210])
        by smtp.gmail.com with ESMTPSA id b14sm1389608lff.68.2019.12.11.07.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2019 07:44:02 -0800 (PST)
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
Subject: [PATCH v4 07/14] cpuidle: psci: Support hierarchical CPU idle states
Date:   Wed, 11 Dec 2019 16:43:36 +0100
Message-Id: <20191211154343.29765-8-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191211154343.29765-1-ulf.hansson@linaro.org>
References: <20191211154343.29765-1-ulf.hansson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Currently CPU's idle states are represented using the flattened model.
Let's add support for the hierarchical layout, via converting to use
of_get_cpu_state_node().

Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
---

Changes in v4:
	- None.

---
 drivers/cpuidle/cpuidle-psci.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/cpuidle/cpuidle-psci.c b/drivers/cpuidle/cpuidle-psci.c
index 761359be50f2..830995b8a56f 100644
--- a/drivers/cpuidle/cpuidle-psci.c
+++ b/drivers/cpuidle/cpuidle-psci.c
@@ -86,8 +86,7 @@ static int __init psci_dt_cpu_init_idle(struct device_node *cpu_node,
 		return -ENOMEM;
 
 	for (i = 1; i < state_count; i++) {
-		state_node = of_parse_phandle(cpu_node, "cpu-idle-states",
-					      i - 1);
+		state_node = of_get_cpu_state_node(cpu_node, i - 1);
 		if (!state_node)
 			break;
 
-- 
2.17.1

