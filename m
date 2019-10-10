Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 81C51D2816
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2019 13:40:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726478AbfJJLkG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Oct 2019 07:40:06 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:42612 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726237AbfJJLkG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Oct 2019 07:40:06 -0400
Received: by mail-lj1-f196.google.com with SMTP id y23so5812628lje.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2019 04:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=2IJCjxfMEpSRJkS++DhjtARW+QNPbTjOBtr+8H3u40A=;
        b=uYRdsI8te0eaDiHtkdh5R/+OqlHAVSLkJADtZJTeFydF4Y47RT8kzwre6xDI4j34zl
         5HdWus2lQAcfjCbqzA71PLvMUI4AYSLWiGgnnZqbibnE62hQ8JnUzXgn/rNxo6+zo6iw
         jH/WkAqyIFtaq1HQNOxSYIrHxWjmHDKbl+WLr/QN7nMcYTJy2KeLDkee8hDbdKsI2c5j
         a2tnpwEyTOk3T7hb9nG8eEJ3MnvNNy1cPuO5XbOWSoEggnlYpeVSWElDz5deVQphhAyR
         8AyvY9N8sSWnidCRIVsMkEy+ojIPLYkB3CvUJJXGtHXVFQk9gOpakS3USZiLR4i9KtsC
         5vFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=2IJCjxfMEpSRJkS++DhjtARW+QNPbTjOBtr+8H3u40A=;
        b=kLKmee2K/ki1HdfQzKO0DAKOMp3ykiRN2F2nJDbnCuevavAr+UnAnd5FCdJfDPUbA/
         tjd6xTDwLf8n0aV7YkJyUrFSrDyMv5Q15nwBPYhKjvrj70mABxXal/G6IO1ISkRy2Eur
         vW/0tDU7IaiCJKYlvn/sEBsHQQEMvuPMRV6hTbiB6tNi4llE5+7SwFUNnxr8sDZebl3V
         +xGt2USPIi99e0oG6JOR1ymUPzcpGXIvhyh07Fq4HE1j6aCS1/PGD4iHVNzknEx5wJPA
         X9EsNOpba2raLqPOeoQlXkhJuwMV+gXWue+hqbqxQB8hVIpl0jRl/6t32hqtnOfzUslE
         iTHA==
X-Gm-Message-State: APjAAAVV4/UofJIMiU+qkjbbrbdVlX7gDnN2eQOSbfRVwMqEYcWbMxPP
        e3Dx7b7bofl1DdGV4IEJ5Ol4mw==
X-Google-Smtp-Source: APXvYqyHTS+mn7MuuwFxGUfhX8Q5zKTf6UWlXj64K9gUalKuMXGaZnYWVktevenm33lDHwfKhHe5vg==
X-Received: by 2002:a2e:2bc8:: with SMTP id r69mr6210726ljr.147.1570707604133;
        Thu, 10 Oct 2019 04:40:04 -0700 (PDT)
Received: from localhost.localdomain (h-158-174-22-210.NA.cust.bahnhof.se. [158.174.22.210])
        by smtp.gmail.com with ESMTPSA id p3sm1168937ljn.78.2019.10.10.04.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2019 04:40:03 -0700 (PDT)
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
Subject: [PATCH 00/13] cpuidle: psci: Support hierarchical CPU arrangement
Date:   Thu, 10 Oct 2019 13:39:24 +0200
Message-Id: <20191010113937.15962-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series enables initial support for hierarchical CPU arrangement, managed
by PSCI and its corresponding cpuidle driver. It's based on using the generic
PM domain (genpd), which nowadays also supports devices belonging to CPUs.

The last DTS patch enables the hierarchical topology to be used for the Qcom
410c Dragonboard, which supports the PSCI OS-initiated mode.

Do note, most of the code in this series have been posted earlier, but from the
latest version being reviewed, we agreed on that it was better to re-work the
PSCI backend driver as a first step, simply to get a clean interface towards the
cpuidle driver.

Summary of the main-changes since the last submission [1]:

 - Moved implementation from the psci FW dricer into cpuidle-psci.

 - Re-requesting review of the DT bindings, as we have moved to yaml. No
   changes as such, but tried to clarify a few things in the text.

 - Drop the patch enabling support for CPU hotplug, postponing that to the next
   step.

 - Respect the hierarchical topology in DT only when OSI mode is supported.
   This is to start simple and we can always extend the support on top.

The series is also available at:
git.linaro.org/people/ulf.hansson/linux-pm.git next

Kind regards
Ulf Hansson

[1]
https://lwn.net/Articles/788306/


Lina Iyer (1):
  cpuidle: dt: Support hierarchical CPU idle states

Ulf Hansson (12):
  cpuidle: psci: Fix potential access to unmapped memory
  dt: psci: Update DT bindings to support hierarchical PSCI states
  firmware: psci: Export functions to manage the OSI mode
  of: base: Add of_get_cpu_state_node() to get idle states for a CPU
    node
  cpuidle: psci: Simplify OF parsing of CPU idle state nodes
  cpuidle: psci: Support hierarchical CPU idle states
  cpuidle: psci: Prepare to use OS initiated suspend mode via PM domains
  cpuidle: psci: Add support for PM domains by using genpd
  cpuidle: psci: Add a helper to attach a CPU to its PM domain
  cpuidle: psci: Attach CPU devices to their PM domains
  cpuidle: psci: Manage runtime PM in the idle path
  arm64: dts: Convert to the hierarchical CPU topology layout for
    MSM8916

 .../devicetree/bindings/arm/psci.yaml         | 153 +++++++++
 arch/arm64/boot/dts/qcom/msm8916.dtsi         |  57 +++-
 drivers/cpuidle/Makefile                      |   4 +-
 drivers/cpuidle/cpuidle-psci-domain.c         | 302 ++++++++++++++++++
 drivers/cpuidle/cpuidle-psci.c                | 106 ++++--
 drivers/cpuidle/cpuidle-psci.h                |  17 +
 drivers/cpuidle/dt_idle_states.c              |   5 +-
 drivers/firmware/psci/psci.c                  |  18 +-
 drivers/of/base.c                             |  36 +++
 include/linux/of.h                            |   8 +
 include/linux/psci.h                          |   2 +
 11 files changed, 673 insertions(+), 35 deletions(-)
 create mode 100644 drivers/cpuidle/cpuidle-psci-domain.c
 create mode 100644 drivers/cpuidle/cpuidle-psci.h

-- 
2.17.1

