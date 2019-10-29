Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1171DE8CFB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2019 17:44:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390556AbfJ2Qor (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Oct 2019 12:44:47 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:44627 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390619AbfJ2Qor (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Oct 2019 12:44:47 -0400
Received: by mail-lj1-f193.google.com with SMTP id c4so16008301lja.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Oct 2019 09:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=Unqe7dpPmCPH71nTnrspbuD4zxyZhoMYgNbcCppl/RY=;
        b=Pdyqe8cpM612bo95zzr1d4VSW7A4kUkPwaBnUwtvdWBMcue4QEMMHDDVfx3lwZRejk
         0xM4R+ikkhWn2SKT/h7IblcBuBRanHw7Z2kT+tiGBS16gPpIg5R5X0u+YTfIUAamtXlV
         pwzGwqvSiQ6z5kOTfKI6lVoCe9YTEqfKmqsWtFFh01aIQpjSevuliSHcUimYdhIOk1vZ
         iFVq8cu11b8ylN/L0a39H8fTKvRonbLP9xAFJcZQin9BypNXTpXtClilLpXUhI/FirBw
         VVIXLPky36zIloMScavckjBEoBJ75A9+4DZTZcPE/DQKm+uNfTdHJKlCg0/9klFkkxne
         A87A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Unqe7dpPmCPH71nTnrspbuD4zxyZhoMYgNbcCppl/RY=;
        b=nP2aCc+5AailvFCMy+MpLS/YUVUpaz15IuYu/zGUUYjizyREWhdTY3bPk+99QYngEf
         IAgh9I072hwiVc2zgg3VGeiXYk4hdcFJsKfHHm3A1Zn0HfTUexru5j0wdh36XkK4BN6q
         2Ip5R8Djp5jDg2saKW/AZCByPPVXeBnyYtJsDpsDHwsABAa613Mmz2/PBzxHiNRz7+tH
         P2m0zHqIjJlhCqtD+sUoy0KWxyqj+AzOU6frm8G5MA4pvBAB68plOf/LA7ABDGSBtTVS
         Vymwfzd9t2rcthii3Amrtg1Nnp+douRkObfgLVlyyKYqgJMz00TEU0EKN/HTXwt1sQtQ
         //bw==
X-Gm-Message-State: APjAAAXxoEj+Eq8290KQic3D3hvShNwPmxDedFdJFnN6LGBdp1CLG2HO
        3l55OYcCkhv8aYCcdMQwLDPqsQ==
X-Google-Smtp-Source: APXvYqwBxgSodXhX9B5DgAsU63uCOB1U9YSsUdnkSaeJF7HoObW4xTS+gVrZ4U3iqF/OOCr575N/jg==
X-Received: by 2002:a2e:a0c9:: with SMTP id f9mr3427023ljm.77.1572367483719;
        Tue, 29 Oct 2019 09:44:43 -0700 (PDT)
Received: from localhost.localdomain (h-158-174-22-210.NA.cust.bahnhof.se. [158.174.22.210])
        by smtp.gmail.com with ESMTPSA id f28sm2048161lfh.35.2019.10.29.09.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 09:44:43 -0700 (PDT)
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
Subject: [PATCH v2 00/13] cpuidle: psci: Support hierarchical CPU arrangement
Date:   Tue, 29 Oct 2019 17:44:25 +0100
Message-Id: <20191029164438.17012-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Changes in v2:
	- Avoid to affect the non-OSI path with specific changes for OSI. This
	forced me to re-order the series and a caused more or less minor changes
	to most of the patches.
	- Updated the DT bindings for PSCI to clarify and to include the "psci"
	name of the PM domain to attach to.
	- Replaced patch1 with another patch from Sudeep, solving the same
	problem, but in a different way.

This is the same coverletter as in v1:

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

Sudeep Holla (1):
  cpuidle: psci: Align psci_power_state count with idle state count

Ulf Hansson (11):
  dt: psci: Update DT bindings to support hierarchical PSCI states
  firmware: psci: Export functions to manage the OSI mode
  of: base: Add of_get_cpu_state_node() to get idle states for a CPU
    node
  cpuidle: psci: Simplify OF parsing of CPU idle state nodes
  cpuidle: psci: Support hierarchical CPU idle states
  cpuidle: psci: Add a helper to attach a CPU to its PM domain
  cpuidle: psci: Attach CPU devices to their PM domains
  cpuidle: psci: Prepare to use OS initiated suspend mode via PM domains
  cpuidle: psci: Manage runtime PM in the idle path
  cpuidle: psci: Add support for PM domains by using genpd
  arm64: dts: Convert to the hierarchical CPU topology layout for
    MSM8916

 .../devicetree/bindings/arm/cpus.yaml         |  15 +
 .../devicetree/bindings/arm/psci.yaml         | 102 ++++++
 arch/arm64/boot/dts/qcom/msm8916.dtsi         |  57 +++-
 drivers/cpuidle/Makefile                      |   4 +-
 drivers/cpuidle/cpuidle-psci-domain.c         | 302 ++++++++++++++++++
 drivers/cpuidle/cpuidle-psci.c                | 123 +++++--
 drivers/cpuidle/cpuidle-psci.h                |  17 +
 drivers/cpuidle/dt_idle_states.c              |   5 +-
 drivers/firmware/psci/psci.c                  |  18 +-
 drivers/of/base.c                             |  36 +++
 include/linux/of.h                            |   8 +
 include/linux/psci.h                          |   2 +
 12 files changed, 654 insertions(+), 35 deletions(-)
 create mode 100644 drivers/cpuidle/cpuidle-psci-domain.c
 create mode 100644 drivers/cpuidle/cpuidle-psci.h

-- 
2.17.1

