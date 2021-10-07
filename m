Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31943424E98
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Oct 2021 10:07:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240473AbhJGIJg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Oct 2021 04:09:36 -0400
Received: from foss.arm.com ([217.140.110.172]:35496 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236997AbhJGIJg (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Oct 2021 04:09:36 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A97851FB;
        Thu,  7 Oct 2021 01:07:42 -0700 (PDT)
Received: from e123648.arm.com (unknown [10.57.18.236])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B94D73F766;
        Thu,  7 Oct 2021 01:07:39 -0700 (PDT)
From:   Lukasz Luba <lukasz.luba@arm.com>
To:     linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, lukasz.luba@arm.com,
        sudeep.holla@arm.com, will@kernel.org, catalin.marinas@arm.com,
        linux@armlinux.org.uk, gregkh@linuxfoundation.org,
        rafael@kernel.org, viresh.kumar@linaro.org, amitk@kernel.org,
        daniel.lezcano@linaro.org, amit.kachhap@gmail.com,
        thara.gopinath@linaro.org, bjorn.andersson@linaro.org,
        agross@kernel.org
Subject: [PATCH 0/5] Refactor thermal pressure update to avoid code duplication
Date:   Thu,  7 Oct 2021 09:07:24 +0100
Message-Id: <20211007080729.8262-1-lukasz.luba@arm.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi all,

This patch set aims to refactor the thermal pressure update
code. There are already two clients which do similar thing:
convert the capped frequency value into the capacity of
affected CPU and call the 'set' function to store the
reduced capacity into the per-cpu variable.
There might be more than two of these users. In near future
it will be scmi-cpufreq driver, which receives notification
from FW about reduced frequency due to thermal. Other vendors
might follow. Let's avoid code duplication and potential
conversion bugs. Move the conversion code into the arch_topology.c
where the capacity calculation setup code and thermal pressure sit.

Apart from that $subject patches, there is one patch (3/5) which fixes
issue in qcom-cpufreq-hw.c when the thermal pressure is not
updated for offline CPUs. It's similar fix that has been merged
recently for cpufreq_cooling.c:
2ad8ccc17d1e4270cf65a3f2

Regards,
Lukasz Luba

Lukasz Luba (5):
  arch_topology: Introduce thermal pressure update function
  thermal: cpufreq_cooling: Use new thermal pressure update function
  cpufreq: qcom-cpufreq-hw: Update offline CPUs per-cpu thermal pressure
  cpufreq: qcom-cpufreq-hw: Use new thermal pressure update function
  arch_topology: Remove unused topology_set_thermal_pressure() and
    related

 arch/arm/include/asm/topology.h   |  2 +-
 arch/arm64/include/asm/topology.h |  2 +-
 drivers/base/arch_topology.c      | 35 +++++++++++++++++++++++++++----
 drivers/cpufreq/qcom-cpufreq-hw.c | 14 +++++--------
 drivers/thermal/cpufreq_cooling.c |  6 +-----
 include/linux/arch_topology.h     |  4 ++--
 include/linux/sched/topology.h    |  6 +++---
 init/Kconfig                      |  2 +-
 8 files changed, 45 insertions(+), 26 deletions(-)

-- 
2.17.1

