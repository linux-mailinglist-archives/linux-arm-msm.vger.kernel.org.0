Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 621A512E86B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jan 2020 17:08:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728759AbgABQIZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Jan 2020 11:08:25 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:36844 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728744AbgABQIY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Jan 2020 11:08:24 -0500
Received: by mail-lj1-f194.google.com with SMTP id r19so41182009ljg.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jan 2020 08:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=VAhfEde+SAbFW5iLC5LHy9bClcSBdjHBTW1GKNdApwM=;
        b=OlU6t8fcBKQbMw/uu5n3nHGccxYInVKRi6Vwq1anfKdZeIwjfVamfYUK/890GQ9m/G
         EhY6crqBUaIPbA3Y97BFRJnjF6B4BMrdUrKcnDeJvE50Qq4nrZM9BIND8AIZvN6jFtWE
         RL8eSmUqQNrjjid2DH5X8CE6credCD+kiEVRnHlitSaRPrOPUDxIlNdDqijzedF5Oczn
         b56HjESeUPek2ja1K7TnljI/hyf+qzRB3Omio6iljZTG6cbXmdrOccn6ls8nb3DC4GKN
         GigtnAQ5xMajjMKskPzI27bAs5mSDcgivuN55xiT4FEAlA5F1hjs2FuAf9dVCx50W/5v
         VR4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=VAhfEde+SAbFW5iLC5LHy9bClcSBdjHBTW1GKNdApwM=;
        b=SweOwvOJQIq96fKOST64aoaZxK754n3pRvdcI/p4QlGDzk+6fgjJqSRV0qYfryyJlN
         PO66gkmd+ulGM8/dgh1JY74eXwno7ECvu6+8CIS4z27xCT6Gr+o4r76R3ucnHHhAkwK+
         gC6gffkpwuyWbG1/OZYg/LdaB9nGBPEbSYAFzMEOylN1xx9M7ZReJI6awHd6zf/U464C
         qGfztPP5xzIzZSdCZ3LB7Ob6mdohO4/EeSA4s+IDH9e9+afTHKoSb9OGSYawUAqStCbx
         hmsyA2jjlygDJoDz6vhy6dOUmJtdGAFuL2aekIf1IaVPiDN9j7sPzisU2WwCr2uszASp
         ncIQ==
X-Gm-Message-State: APjAAAUFwtCkjoP2h6owW/Bzv6vbH75Ev6yBVqayoohwWL8aV3mro6mx
        mO7PnNnHu0XUUGbwdOQAii2qht9Ad24=
X-Google-Smtp-Source: APXvYqxpuLmLhv6JkG6FkQ02uFQLUMKN0SFHEatYF5ZKIOBYVhHCVtmDGprRi3auVS1xmWEmpcBpZA==
X-Received: by 2002:a2e:3608:: with SMTP id d8mr48249090lja.152.1577981302762;
        Thu, 02 Jan 2020 08:08:22 -0800 (PST)
Received: from localhost.localdomain (h-158-174-22-210.NA.cust.bahnhof.se. [158.174.22.210])
        by smtp.gmail.com with ESMTPSA id u13sm23198924lfq.19.2020.01.02.08.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2020 08:08:21 -0800 (PST)
From:   Ulf Hansson <ulf.hansson@linaro.org>
To:     arm@kernel.org, soc@kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        Kevin Hilman <khilman@kernel.org>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-arm-msm@vger.kernel.org
Subject: [GIT PULL] cpuidle/psci updates for v5.6
Date:   Thu,  2 Jan 2020 17:08:20 +0100
Message-Id: <20200102160820.3572-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi SoC maintainers,

Here's a PR with updates for v5.6 for cpuidle/psci for ARM/ARM64.

The changes are somewhat sprinkled over a couple of different directories and
there is also dts update for MSM8916. The main changes are in drivers/cpuidle/,
which have been acked-by Rafael [1] and Sudeep.

If you have any further questions, please just tell.

Please pull this in!

Kind regards
Ulf Hansson

[1]
https://lore.kernel.org/linux-arm-msm/CAJZ5v0gSY_Zg+sbBEfTaeBCiOf_L6JP4_-4tdpeFU0iCGJu3Nw@mail.gmail.com/


The following changes since commit fd6988496e79a6a4bdb514a4655d2920209eb85d:

  Linux 5.5-rc4 (2019-12-29 15:29:16 -0800)

are available in the Git repository at:

  git://git.linaro.org/people/ulf.hansson/linux-pm.git tags/cpuidle_psci-v5.5-rc4

for you to fetch changes up to e37131556801dd76880914f0930fe0cbd1fd3223:

  arm64: dts: Convert to the hierarchical CPU topology layout for MSM8916 (2020-01-02 16:53:10 +0100)

----------------------------------------------------------------
Initial support for hierarchical CPU arrangement, managed by PSCI and its
corresponding cpuidle driver. This support is based upon using the generic
PM domain, which already supports devices belonging to CPUs.

Finally, these is a DTS patch that enables the hierarchical topology to be
used for the Qcom 410c Dragonboard, which supports the PSCI OS-initiated
mode.

----------------------------------------------------------------
Lina Iyer (1):
      cpuidle: dt: Support hierarchical CPU idle states

Sudeep Holla (1):
      cpuidle: psci: Align psci_power_state count with idle state count

Ulf Hansson (13):
      dt: psci: Update DT bindings to support hierarchical PSCI states
      firmware: psci: Export functions to manage the OSI mode
      of: base: Add of_get_cpu_state_node() to get idle states for a CPU node
      cpuidle: psci: Simplify OF parsing of CPU idle state nodes
      cpuidle: psci: Support hierarchical CPU idle states
      cpuidle: psci: Add a helper to attach a CPU to its PM domain
      cpuidle: psci: Attach CPU devices to their PM domains
      cpuidle: psci: Prepare to use OS initiated suspend mode via PM domains
      cpuidle: psci: Manage runtime PM in the idle path
      cpuidle: psci: Support CPU hotplug for the hierarchical model
      PM / Domains: Introduce a genpd OF helper that removes a subdomain
      cpuidle: psci: Add support for PM domains by using genpd
      arm64: dts: Convert to the hierarchical CPU topology layout for MSM8916

 Documentation/devicetree/bindings/arm/cpus.yaml |  15 ++
 Documentation/devicetree/bindings/arm/psci.yaml | 104 ++++++++
 arch/arm64/boot/dts/qcom/msm8916.dtsi           |  57 ++++-
 drivers/base/power/domain.c                     |  38 +++
 drivers/cpuidle/Makefile                        |   4 +-
 drivers/cpuidle/cpuidle-psci-domain.c           | 308 ++++++++++++++++++++++++
 drivers/cpuidle/cpuidle-psci.c                  | 161 +++++++++++--
 drivers/cpuidle/cpuidle-psci.h                  |  17 ++
 drivers/cpuidle/dt_idle_states.c                |   5 +-
 drivers/firmware/psci/psci.c                    |  18 +-
 drivers/of/base.c                               |  36 +++
 include/linux/cpuhotplug.h                      |   1 +
 include/linux/of.h                              |   8 +
 include/linux/pm_domain.h                       |   8 +
 include/linux/psci.h                            |   2 +
 15 files changed, 747 insertions(+), 35 deletions(-)
 create mode 100644 drivers/cpuidle/cpuidle-psci-domain.c
 create mode 100644 drivers/cpuidle/cpuidle-psci.h
