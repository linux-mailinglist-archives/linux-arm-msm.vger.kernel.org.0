Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05E01DC045
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2019 10:52:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2442223AbfJRIwL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Oct 2019 04:52:11 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:45389 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726949AbfJRIwL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Oct 2019 04:52:11 -0400
Received: by mail-pg1-f195.google.com with SMTP id r1so2975488pgj.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Oct 2019 01:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=8Twp36GSbpZi8uCaMU+5CBUJfogrOLDIK7KeRjSvPeo=;
        b=i0VuWL93/QAsy39njpz8hRgcLisEdpr+3KDPnSKzQ/awFW4pHcUg0UjlGu+xlAklGX
         //w7RDxTTEbHiCZlDWhV8fb2xW0/nKfpvZFQEz4XoqB3WFvF2FB6oUjasGQAbwH6uuC7
         wfiPJkAgPr3nTCPj0QhLnvy1e5YyA5e5r8alBv0c8CFRU3tb4JYL9W1sSMGL3gKa5tto
         M+9LCFG2NwFaMw4SZt7mfiJZbqHXDmvybREgVDtVUsQMo1py7X4RVn9D4AgVNnfCuo42
         KCPQ7glVcGEcJRD3uZfsOtnkXZR+Z8o3tP9Y2D6jmwnX9QJMpc28t0Pi8FdyhfamqMzl
         zNFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=8Twp36GSbpZi8uCaMU+5CBUJfogrOLDIK7KeRjSvPeo=;
        b=I/ZLv+Fc8iWj1oS5KFExORdCwvJspEbUldywvXgXk66HAmd2GXPFJZ2wVxKKEdvACL
         9fvA5jrrVRp/Zdtb4EHBKn+56kDwpy7QTr3Q0zDIcc7XQH6HlEfl4g1npbNtQQrAmpg4
         Qcvvp59zny7rRll5ZhG384kIxoHZ/Ak4c4LE2MfuzCuOpJzCyLz5dv0WMao1w3w2tId4
         /RBYbONiEAmDPDp4Jlxmz00zCKgjyBPSM9V1F461tLRuEZKbu5bS4vbdg4i7zCLFdFgf
         8c+Kug4ia9bxMp6iXgcF7T9HL0yZ9c4RkYxs1ZTKih+2V8R4y1H5+iB61A6nIbE9p5rQ
         7BpQ==
X-Gm-Message-State: APjAAAUD6B8h4jblOpeb2PBW71n6+WEewiqXts3mmWUXmfonc9ID8Twn
        jmXLqHkC52uOt/8j8SYtOZs9nQ==
X-Google-Smtp-Source: APXvYqwdiN3EAKBoUU6BThGO5LVz4hi1jwIiB7pRL30zoDY6vs7gW8L2LmbVKtj6UUm9OUN0OCFjsg==
X-Received: by 2002:aa7:86c2:: with SMTP id h2mr5445157pfo.0.1571388730332;
        Fri, 18 Oct 2019 01:52:10 -0700 (PDT)
Received: from localhost ([49.248.178.134])
        by smtp.gmail.com with ESMTPSA id y7sm5886971pfn.142.2019.10.18.01.52.09
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Oct 2019 01:52:09 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        daniel.lezcano@linaro.org, viresh.kumar@linaro.org,
        sudeep.holla@arm.com, bjorn.andersson@linaro.org,
        edubezval@gmail.com, agross@kernel.org, tdas@codeaurora.org,
        swboyd@chromium.org, ilina@codeaurora.org,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Ben Segall <bsegall@google.com>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Ingo Molnar <mingo@redhat.com>,
        Juri Lelli <juri.lelli@redhat.com>,
        Mel Gorman <mgorman@suse.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     linux-clk@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: [PATCH v4 0/6] Initialise thermal framework and cpufreq earlier during boot
Date:   Fri, 18 Oct 2019 14:21:57 +0530
Message-Id: <cover.1571387352.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Changes since v3:
- Init schedutil governor earlier too
- Simplified changes to thermal_init() error path
- Collects Acks

Changes since v2:
- Missed one patch when posting v2. Respinning.

Changes since v1:
- Completely get rid of netlink support in the thermal framework.
- This changes the early init patch to a single line - change to
  core_initcall. Changed authorship of patch since it is nothing like the
  original. Lina, let me know if you feel otherwise.
- I've tested to make sure that the qcom-cpufreq-hw driver continues to
  work correctly as a module so this won't impact Android's GKI plans.
- Collected Acks

Device boot needs to be as fast as possible while keeping under the thermal
envelope. Now that thermal framework is built-in to the kernel, we can
initialize it earlier to enable thermal mitigation during boot.

We also need the cpufreq HW drivers to be initialised earlier to act as the
cooling devices. This series only converts over the qcom-hw driver to
initialize earlier but can be extended to other platforms as well.

Amit Kucheria (6):
  thermal: Remove netlink support
  thermal: Initialize thermal subsystem earlier
  cpufreq: Initialise the governors in core_initcall
  cpufreq: Initialize cpufreq-dt driver earlier
  clk: qcom: Initialise clock drivers earlier
  cpufreq: qcom-hw: Move driver initialisation earlier

 .../driver-api/thermal/sysfs-api.rst          |  26 +----
 drivers/clk/qcom/clk-rpmh.c                   |   2 +-
 drivers/clk/qcom/gcc-qcs404.c                 |   2 +-
 drivers/clk/qcom/gcc-sdm845.c                 |   2 +-
 drivers/cpufreq/cpufreq-dt-platdev.c          |   2 +-
 drivers/cpufreq/cpufreq_conservative.c        |   2 +-
 drivers/cpufreq/cpufreq_ondemand.c            |   2 +-
 drivers/cpufreq/cpufreq_performance.c         |   2 +-
 drivers/cpufreq/cpufreq_powersave.c           |   2 +-
 drivers/cpufreq/cpufreq_userspace.c           |   2 +-
 drivers/cpufreq/qcom-cpufreq-hw.c             |   2 +-
 drivers/thermal/thermal_core.c                | 103 +-----------------
 include/linux/thermal.h                       |  11 --
 kernel/sched/cpufreq_schedutil.c              |   2 +-
 14 files changed, 19 insertions(+), 143 deletions(-)

-- 
2.17.1

