Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7753510ADA3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2019 11:29:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727117AbfK0K32 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Nov 2019 05:29:28 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:40581 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727118AbfK0K32 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Nov 2019 05:29:28 -0500
Received: by mail-lj1-f196.google.com with SMTP id s22so4839032ljs.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Nov 2019 02:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=r6EEdyR4M7hIjNiPTtCqyqL+HPCjuTmwEmLVgwUWsTU=;
        b=Aip1jwmEw77XvaXpoL0a2PBc9sDNiZm0UnDB/ADxUDwNIdVBCF2fbWHwfRbLBh+J/f
         rNrtGsubiNSfVnOXDIWZxJI5cIfoHXYOsf2tU/Jp6JogK4w14ZwKmJrcTOT3i2RGsDsV
         M1la93McdDg0aO5+NKv0TLCjde3s6HRBOmsOITA8BHF5EtqF1v3yWPqU/ti7tNNznW0P
         /LUD/N322Ey8nbLpdeNyUCiu9IzUItBdR1Xq6E/MlfJ1NJIcymH8YguzuU7RhtgFoB7c
         kjswnEdVZx8pNx1lGAECS7NzZOznr2GSXxds6fBP0oSdXyQ6S8vb+mSpSTKtsJPQH0bZ
         MK/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=r6EEdyR4M7hIjNiPTtCqyqL+HPCjuTmwEmLVgwUWsTU=;
        b=qKBOG3nMi+myNmb9ubInzdTR67Am6XqvwkFpAL5TSJqtCr20rkykBDjJYwvSUJCA+W
         iGOwb54KXySUSQY3QPbpNxwP53ovOEh/NJndJskDhJPEPzhFh53A/3bnYPAhgIJbx4Gs
         qTwJfSIKjgRTZGJNMNwh9OBhvYAzOrKPVeQCv5Sy/QqlV2H0ialrxkt2QaPEqzorgKJz
         y7vk85MHSpK6SdoJvUVKwWTbD/1sSb2j6oxMPRkZ6pEAzVZ01zbzZ/pqr7qphmTWUhsz
         Sg9Xv00GGorgxaUnl4PTEKq1F7IIhLjlt5kXDV3UEGvshaiuN2A021c7ERReSYxfD8Q9
         VmqA==
X-Gm-Message-State: APjAAAW7SC65Z5GQ8NE5sRp4OuxG0s/8y2KcM57RJJPkPurMrJ1+dnZh
        ijung1SAXyM8b/OErpZ/urEkKW4d9jM=
X-Google-Smtp-Source: APXvYqzCB5mK0gCYxggjgGr+3n9bZ+VzvPOeku9C2LwcLQa6guBCbcbLJIYW85F2FDNRI3OD3tIEZg==
X-Received: by 2002:a05:651c:c4:: with SMTP id 4mr1316779ljr.171.1574850565883;
        Wed, 27 Nov 2019 02:29:25 -0800 (PST)
Received: from uffe-XPS-13-9360.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id t9sm6868260ljj.19.2019.11.27.02.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2019 02:29:25 -0800 (PST)
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
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, Lina Iyer <lina.iyer@linaro.org>
Subject: [PATCH v3 05/13] cpuidle: dt: Support hierarchical CPU idle states
Date:   Wed, 27 Nov 2019 11:29:06 +0100
Message-Id: <20191127102914.18729-6-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191127102914.18729-1-ulf.hansson@linaro.org>
References: <20191127102914.18729-1-ulf.hansson@linaro.org>
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
Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
---

Changes in v3:
	- None.

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

