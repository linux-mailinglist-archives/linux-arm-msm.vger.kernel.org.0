Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F6D31A439F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2020 10:42:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725912AbgDJIm3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Apr 2020 04:42:29 -0400
Received: from foss.arm.com ([217.140.110.172]:58752 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725858AbgDJIm3 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Apr 2020 04:42:29 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8BDA131B;
        Fri, 10 Apr 2020 01:42:28 -0700 (PDT)
Received: from e123648.arm.com (unknown [10.37.12.30])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4884D3F68F;
        Fri, 10 Apr 2020 01:42:18 -0700 (PDT)
From:   Lukasz Luba <lukasz.luba@arm.com>
To:     linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-imx@nxp.com
Cc:     Dietmar.Eggemann@arm.com, cw00.choi@samsung.com,
        b.zolnierkie@samsung.com, rjw@rjwysocki.net, sudeep.holla@arm.com,
        viresh.kumar@linaro.org, nm@ti.com, sboyd@kernel.org,
        rui.zhang@intel.com, amit.kucheria@verdurent.com,
        daniel.lezcano@linaro.org, mingo@redhat.com, peterz@infradead.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org,
        rostedt@goodmis.org, qperret@google.com, bsegall@google.com,
        mgorman@suse.de, shawnguo@kernel.org, s.hauer@pengutronix.de,
        festevam@gmail.com, kernel@pengutronix.de, khilman@kernel.org,
        agross@kernel.org, bjorn.andersson@linaro.org, robh@kernel.org,
        matthias.bgg@gmail.com, steven.price@arm.com,
        tomeu.vizoso@collabora.com, alyssa.rosenzweig@collabora.com,
        airlied@linux.ie, daniel@ffwll.ch, liviu.dudau@arm.com,
        lorenzo.pieralisi@arm.com, lukasz.luba@arm.com,
        patrick.bellasi@matbug.net, orjan.eide@arm.com,
        rdunlap@infradead.org, mka@chromium.org
Subject: [PATCH v6 00/10] Add support for devices in the Energy Model
Date:   Fri, 10 Apr 2020 09:42:00 +0100
Message-Id: <20200410084210.24932-1-lukasz.luba@arm.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi all,

This patch set introduces support for devices in the Energy Model (EM)
framework. It will unify the power model for thermal subsystem. It will
make simpler to add support for new devices willing to use more
advanced features (like Intelligent Power Allocation). Now it should
require less knowledge and effort for driver developer to add e.g.
GPU driver with simple energy model. A more sophisticated energy model
in the thermal framework is also possible, driver needs to provide
a dedicated callback function. More information can be found in the
updated documentation file.

First 7 patches are refactoring Energy Model framework to add support
of other devices that CPUs. They change:
- naming convention from 'capacity' to 'performance' state,
- API arguments adding device pointer and not rely only on cpumask,
- change naming when 'cpu' was used, now it's a 'device'
- internal structure to maintain registered devices
- update users to the new API
Patch 8 updates OPP framework helper function to be more generic, not
CPU specific.
Patch 9 changes devfreq cooling, dropping part of old power model and
adding registration with Energy Model via exported GPL function. It uses
as a base the new PM QoS mechanism which is now in thermal-next.
Patch 10 is a simple change for Panfrost GPU driver.

The patch set is based on linux-next tag next-20200409.

Changes:
v6:
- split patch 1/5 from v5 into smaller patches as requested by Daniel
  and dropped ACK from Quentin which was in the old there
- added function em_dev_register_perf_domain as suggested by Daniel, which
  would help transition into the new API
- changed 'cs' (capacity state) in different places into 'ps' (performance state),
  since now there are many smaller patches (previously skipped because
  of too big size of the patch with main features and left to do later)
- changed cpumask_equal() to cpumask_intersects() when checking if 'cpus' coming
  as an argument to registration function might overlap with already known;
  this shouldn't be an issue when cpufreq policy is OK, but a check doesn't harm
- added Reviewed-by from Alyssa into Panfrost related patch
- dropped Matthias patch with PM QoS from the series since it's in the next now
v5 [5]:
- devfreq cooling: rebased on top of pending patch introducing PM QoS limits
- devfreq cooling: added Matthias's patch to make this series build check pass
- devfreq cooling: removed OPP disable code and switched to PM QoS
- devfreq cooling: since thermal code always used a pointer to devfreq_dev_status,
  switched to work on a local copy and avoid potential race when either busy_time or
  total_time could change in the background
- devfreq cooling: added _normalize_load() and handle all scenarios when
  busy_time and total_time could have odd values (even raw counters)
- Energy Model patch 2/4: removed prints from cpufreq drivers and added print inside
  dev_pm_opp_of_register_em()
- update patch 2/4 description to better reflect upcoming changes
- collected ACK from Quentin for patch 1/4 and Reviewed-by from Steven for 4/4
v4 [4]:
- devfreq cooling: added two new registration functions, which will take care
  of registering EM for the device and simplify drivers code
  (suggested by Robin and Rob)
- Energy Model: changed unregistering code, added kref to track usage, added
  code freeing tables, added helper function
- added return value to function dev_pm_opp_of_register_em() and updated
  CPUFreq drivers code, added debug prints in case of failure
- updated comments in devfreq cooling removing statement that only
  simple_ondemand devfreq governor is supported to work with power extentions
- fixed spelling in the documentation (reported by Randy)
v3 [3]:
- added back the cpumask 'cpus' in the em_perf_domain due potential cache misses
- removed _is_cpu_em() since there is no need for it
- changed function name from em_pd_energy() to em_cpu_energy(), which is
  optimized for usage from the scheduler making some assumptions and not
  validating arguments to speed-up, there is a comment stressing that it should
  be used only for CPUs em_perf_domain
- changed em_get_pd() to em_pd_get() which is now aligned with em_cpu_get()
  naming
- Energy Model: add code which checks if the EM is already registered for the
  devfreq device
- extended comment in em_cpu_get() describing the need for this function
- fixed build warning reported on x86 by kbuild test robot in devfreq_cooling.c
- updated documentation in the energy-model.rst
- changed print messages from 'energy_model' to 'EM'
- changed dev_warn to dev_dbg, should calm down test scripts in case the
  platform has OPPs less efficient in the OPP table (some of them are there for
  cooling reasons, we shouldn't warn in this case, debug info is enough)
v2 [2]:
- changed EM API em_register_perf_domain() adding cpumask_t pointer
  as last argument (which was discussed with Dietmar and Quentin)
- removed dependency on PM_OPP, thanks to the cpumask_t argument
- removed enum em_type and em->type dependent code
- em_get_pd() can handle CPU device as well as devfreq device
- updated EM documentation
- in devfreq cooling added code which prevents from race condition with
  devfreq governors which are trying to use OPPs while thermal is in the middle
  of disabling them.
- in devfreq cooling added code which updates state of the devfreq device to
  avoid working on stale data when governor has not updated it for a long time
- in devfreq cooling added backward compatibility frequency table for drivers
  which did not provide EM
- added Steven's Reviewed-by to trace code in thermal
- added another CPUFreq driver which needs to be updated to the new API

The v1 can be found here [1].

Regards,
Lukasz Luba

[1] https://lkml.org/lkml/2020/1/16/619
[2] https://lkml.org/lkml/2020/2/6/377
[3] https://lkml.org/lkml/2020/2/21/1910
[4] https://lkml.org/lkml/2020/3/9/471
[5] https://lkml.org/lkml/2020/3/18/351

Lukasz Luba (10):
  PM / EM: change naming convention from 'capacity' to 'performance'
  PM / EM: introduce em_dev_register_perf_domain function
  PM / EM: update callback structure and add device pointer
  PM / EM: add support for other devices than CPUs in Energy Model
  PM / EM: remove em_register_perf_domain
  PM / EM: change name of em_pd_energy to em_cpu_energy
  Documentation: power: update Energy Model description
  OPP: refactor dev_pm_opp_of_register_em() and update related drivers
  thermal: devfreq_cooling: Refactor code and switch to use Energy Model
  drm/panfrost: Register devfreq cooling and attempt to add Energy Model

 Documentation/power/energy-model.rst        | 135 +++---
 drivers/cpufreq/cpufreq-dt.c                |   2 +-
 drivers/cpufreq/imx6q-cpufreq.c             |   2 +-
 drivers/cpufreq/mediatek-cpufreq.c          |   2 +-
 drivers/cpufreq/omap-cpufreq.c              |   2 +-
 drivers/cpufreq/qcom-cpufreq-hw.c           |   2 +-
 drivers/cpufreq/scmi-cpufreq.c              |  11 +-
 drivers/cpufreq/scpi-cpufreq.c              |   2 +-
 drivers/cpufreq/vexpress-spc-cpufreq.c      |   2 +-
 drivers/gpu/drm/panfrost/panfrost_devfreq.c |   2 +-
 drivers/opp/of.c                            |  76 ++--
 drivers/thermal/cpufreq_cooling.c           |  12 +-
 drivers/thermal/devfreq_cooling.c           | 474 +++++++++----------
 include/linux/devfreq_cooling.h             |  39 +-
 include/linux/energy_model.h                | 152 ++++---
 include/linux/pm_opp.h                      |  15 +-
 include/trace/events/thermal.h              |  19 +-
 kernel/power/energy_model.c                 | 477 ++++++++++++++++----
 kernel/sched/fair.c                         |   2 +-
 kernel/sched/topology.c                     |  20 +-
 20 files changed, 918 insertions(+), 530 deletions(-)

-- 
2.17.1

