Return-Path: <linux-arm-msm+bounces-4417-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A58D80EEB2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 15:27:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB5AB1C20AA8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 14:27:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACF5373188;
	Tue, 12 Dec 2023 14:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="md5jkMNp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F123B8F
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Dec 2023 06:27:37 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-50bf4f97752so7375518e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Dec 2023 06:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702391256; x=1702996056; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oi89GvlAHEHZg03UHqAC2QcBZtFXzQljGaUkYEpdYRQ=;
        b=md5jkMNpMSFt0c3//Hc+vHwemgL/u0RoKjbdEOW9c9g9HkXXfDVf25KBq1h9ZttbHI
         vkDq6Z+nLffOYg3cJj5Kb7hCDiXC1H32oLVT482XNQy93E85ylok1FNSfdrDRQlUff95
         rlKB5XLlIDlpuQ9LnW0Hnu0P75HO0LNid3m3AN+TF2EWuIHZeHu/IyX9ic/00lumnlVf
         VHencOhvLRD5KDGeDhrpsSRQH7zbvRBUsD+9Wdy344RnqhCZpv0ZV4W2PTnelSheSTHw
         irCQVNW+61s7TyEIesbvHcSZQyE6I4m7Pv/Hnz441BTHUhOkjKHMLdiI3o5YQ96uaAed
         OFSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702391256; x=1702996056;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oi89GvlAHEHZg03UHqAC2QcBZtFXzQljGaUkYEpdYRQ=;
        b=ZHYnMoUi6yStzrIoDsRWmKaschfdLQQ73tKJ1JaKvz+GfAGAzitpv7vRCVmIiccItq
         701kevQRvLBx+amYv43BNdLTJsLFFHDSC9uxGzV3Plj4hH//KNQ5+6iV3bQJLzx4b3c1
         JMKUKz9BKARrljWGzvEtSg8pKTCv8+KlJ8SDYCXQPt61Vw2DmsuaBixs8wMOd3B1MFIm
         hvU5sogCOiBa1jLh2zBFQixr3jShdqmWIo2flXZfFJ1Pi6hvEb+h9vN0qV9svy00sFe3
         k1GjZt3NVyGPl4l9r5U9W2cu5mpQgCo83tdHCQRsm8VXQUKZgsx1PayIFvTtQY6O0DdB
         KwtA==
X-Gm-Message-State: AOJu0Yxi6ZJlpcniO+aMsuBLpNMktpC//mQj92+CfunTikzRz6VGFITb
	Pb6bEJYBZc+CswlcPLa8cb0gRg==
X-Google-Smtp-Source: AGHT+IHyo1axms+ckhodl2KbZ/1My7NcqxxzmO0EEcz3ZK+X3IOJxW78U3l56AhQYBvpEUAbefnwcQ==
X-Received: by 2002:a05:6512:a8c:b0:50b:f84b:9b0f with SMTP id m12-20020a0565120a8c00b0050bf84b9b0fmr4113837lfu.25.1702391256066;
        Tue, 12 Dec 2023 06:27:36 -0800 (PST)
Received: from vingu-book.. ([2a01:e0a:f:6020:a004:6e24:43ee:dd81])
        by smtp.gmail.com with ESMTPSA id fc7-20020a05600c524700b0040c44cb251dsm9078291wmb.46.2023.12.12.06.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 06:27:35 -0800 (PST)
From: Vincent Guittot <vincent.guittot@linaro.org>
To: catalin.marinas@arm.com,
	will@kernel.org,
	sudeep.holla@arm.com,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	agross@kernel.org,
	andersson@kernel.org,
	konrad.dybcio@linaro.org,
	mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	bristot@redhat.com,
	vschneid@redhat.com,
	lukasz.luba@arm.com,
	rui.zhang@intel.com,
	mhiramat@kernel.org,
	daniel.lezcano@linaro.org,
	amit.kachhap@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Cc: Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH 0/5] Rework system pressure interface to the scheduler
Date: Tue, 12 Dec 2023 15:27:26 +0100
Message-Id: <20231212142730.998913-1-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Following the consolidation and cleanup of CPU capacity in [1], this serie
reworks how the scheduler gets the pressures on CPUs. We need to take into
account all pressures applied by cpufreq on the compute capacity of a CPU
for dozens of ms or more and not only cpufreq cooling device or HW
mitigiations. we split the pressure applied on CPU's capacity in 2 parts:
- one from cpufreq and freq_qos
- one from HW high freq mitigiation.

The next step will be to add a dedicated interface for long standing
capping of the CPU capacity (i.e. for seconds or more) like the
scaling_max_freq of cpufreq sysfs. The latter is already taken into
account by this serie but as a temporary pressure which is not always the
best choice when we know that it will happen for seconds or more.

[1] https://lore.kernel.org/lkml/20231211104855.558096-1-vincent.guittot@linaro.org/

Vincent Guittot (4):
  cpufreq: Add a cpufreq pressure feedback for the scheduler
  sched: Take cpufreq feedback into account
  thermal/cpufreq: Remove arch_update_thermal_pressure()
  sched: Rename arch_update_thermal_pressure into
    arch_update_hw_pressure

 arch/arm/include/asm/topology.h               |  6 +--
 arch/arm64/include/asm/topology.h             |  6 +--
 drivers/base/arch_topology.c                  | 26 ++++-----
 drivers/cpufreq/cpufreq.c                     | 48 +++++++++++++++++
 drivers/cpufreq/qcom-cpufreq-hw.c             |  4 +-
 drivers/thermal/cpufreq_cooling.c             |  3 --
 include/linux/arch_topology.h                 |  8 +--
 include/linux/cpufreq.h                       | 10 ++++
 include/linux/sched/topology.h                |  8 +--
 .../{thermal_pressure.h => hw_pressure.h}     | 14 ++---
 include/trace/events/sched.h                  |  2 +-
 init/Kconfig                                  | 12 ++---
 kernel/sched/core.c                           |  8 +--
 kernel/sched/fair.c                           | 53 ++++++++++---------
 kernel/sched/pelt.c                           | 18 +++----
 kernel/sched/pelt.h                           | 16 +++---
 kernel/sched/sched.h                          |  4 +-
 17 files changed, 152 insertions(+), 94 deletions(-)
 rename include/trace/events/{thermal_pressure.h => hw_pressure.h} (55%)

-- 
2.34.1
 

