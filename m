Return-Path: <linux-arm-msm+bounces-15139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE0188BD6C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Mar 2024 10:16:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 71A172E61F4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Mar 2024 09:16:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29A2344393;
	Tue, 26 Mar 2024 09:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FToa3iYj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B4A5103D
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Mar 2024 09:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711444583; cv=none; b=Bl/lZTm9NsZSlhb4cF/Q1QUcuoutQJ48JOKV53u7i9W0884CYlCy22Keowv+9vW23d58iV+GtmQL048B/ZwOozXqat6F3apQtXGKHrne5Yt4IFiMGENh73IpG+FnUiQiQAP6OpC7Xvy1m1iP++E08Rcmjk5/ir8Jx4QH4u0sDnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711444583; c=relaxed/simple;
	bh=MK7HHUtMiaa9A53g7A9QIOnjiYLOXvRotsPfgJa1LLs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UzaPM3xK08XQkg1T5VurrtaYW9wy6mfjF0UMubLVarOaPoGM08ikHNnfOCIKHbvjRZAH1Z+VTrtoeq28fbmqOzD82ruGzrCP+8N9YJ/pe9lYUC4/A/zUZlKOxxGn7SBXJ2KAbp4TLVx2cNq5XokP42MZwviUhwuC874lgLhi1OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FToa3iYj; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4148c73255eso6398085e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Mar 2024 02:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711444580; x=1712049380; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QcCk2kfNGvdaBITkM75nEhX5qGXp7x44gB568VCUt38=;
        b=FToa3iYj8JRQTmy1rpESbBA7faZXvO04UFhRCPB/VRuCcNHsSbZXfVj+77rghPv6jV
         qUEjI3W8Ea9exwRmtaXZSBnxsPZt5QmGSslG0XVOZmf08BnNrvuD46cl9jbtRYV0eJdk
         lnzPQoPYJiQ9xYZ4OJQLrzdTaqgLZ+n9jGiV6+QT6xxrZ9X0TMJb/8fICqn/MGzAHd7u
         E5di2fyrCFSdEqRNOTdTKz6P2+gh1Ao0PTpBTr5lhCKmca+n1GAUS5JRKeQZMHhLpP1+
         3IDiAOKPo+kbD2H3oqFOrXNidlZzhQiqibvLkfsG1qsg8RAP9nkyp7R+Tsf/432IJb06
         J+ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711444580; x=1712049380;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QcCk2kfNGvdaBITkM75nEhX5qGXp7x44gB568VCUt38=;
        b=Ckv+nsVt6ZpJvxlumKHv3mdtGi//3Ngh1/RE9o18CHHIICFAaQGktIXmSRRHOI+KZl
         j9zQESzntzhrT3rJgAqwq/wvNtIxpz3a8Lze67CvtEjHrhpJIYHM4FxHsUUYeWrFLEQq
         XnqDFTkQcVDYNPv2n8KDsuWKKrTyGqRSAyyBqzllSm6fDuVAVfv5f05rUv6Kfumm356Z
         BXcWGgu6CsHU2i4VoZ1yEyEMc5I2exRv63IFu1eXDCuCPTkufubcZxPBOcFioSrGkMjz
         cvFkSPcVVBAM8Zizsy2xAn3dlKEQnBnkj/Slu5Fbz+IkjG+HGLw8Xf3eRxa8ySQKRXef
         zWWg==
X-Forwarded-Encrypted: i=1; AJvYcCUEidqgB7beZQjP9Ifq+M8UtcYZKeJafgLMU4Kk5tBKomLJcrFlH9LzPYelbIS8efd8tzYDfqi5hq+GUqFLS7LuZpZuQ6zwcf8HqhuJaA==
X-Gm-Message-State: AOJu0YxVMpLkjcqORCNzJtHruJcYLZ2C/6ucXjzww+1e8Hx1EPRbq7Lr
	kat5JWzEc2SAWygkqNv38HBdJwnrZPI3jao1NCKRH+FPXIhef1MK78fIzhDcTvQ=
X-Google-Smtp-Source: AGHT+IHPIOfByqNHi3u6ysUFuyRgD6rr0wqWolqBcmXXpi2X6rqRrQrQay0Z+FRtQsOrVs94hogLgg==
X-Received: by 2002:adf:f3c9:0:b0:33e:7f51:c2fa with SMTP id g9-20020adff3c9000000b0033e7f51c2famr6482511wrp.47.1711444580402;
        Tue, 26 Mar 2024 02:16:20 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:f:6020:e6b6:c92e:43ff:71d7])
        by smtp.gmail.com with ESMTPSA id m15-20020adffe4f000000b0033e5c54d0d9sm11647606wrs.38.2024.03.26.02.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 02:16:19 -0700 (PDT)
From: Vincent Guittot <vincent.guittot@linaro.org>
To: linux@armlinux.org.uk,
	catalin.marinas@arm.com,
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
	corbet@lwn.net,
	gregkh@linuxfoundation.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH v6 0/5] Rework system pressure interface to the scheduler
Date: Tue, 26 Mar 2024 10:16:11 +0100
Message-Id: <20240326091616.3696851-1-vincent.guittot@linaro.org>
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
mitigiations. We split the pressure applied on CPU's capacity in 2 parts:
- one from cpufreq and freq_qos
- one from HW high freq mitigiation.

The next step will be to add a dedicated interface for long standing
capping of the CPU capacity (i.e. for seconds or more) like the
scaling_max_freq of cpufreq sysfs. The latter is already taken into
account by this serie but as a temporary pressure which is not always the
best choice when we know that it will happen for seconds or more.

[1] https://lore.kernel.org/lkml/20231211104855.558096-1-vincent.guittot@linaro.org/

Change since v5:
- Rebase to fix a conflict in include/linux/cpufreq.h
- Add few more tested and reviewed tags

Change since v4:
- Add READ_ONCE() in cpufreq_get_pressure()
- Add ack and reviewed tags

Change since v3:
- Fix uninitialized variables in cpufreq_update_pressure()

Change since v2:
- Rework cpufreq_update_pressure()

Change since v1:
- Use struct cpufreq_policy as parameter of cpufreq_update_pressure()
- Fix typos and comments
- Make sched_thermal_decay_shift boot param as deprecated

Vincent Guittot (5):
  cpufreq: Add a cpufreq pressure feedback for the scheduler
  sched: Take cpufreq feedback into account
  thermal/cpufreq: Remove arch_update_thermal_pressure()
  sched: Rename arch_update_thermal_pressure into
    arch_update_hw_pressure
  sched/pelt: Remove shift of thermal clock

 .../admin-guide/kernel-parameters.txt         |  1 +
 arch/arm/include/asm/topology.h               |  6 +-
 arch/arm64/include/asm/topology.h             |  6 +-
 drivers/base/arch_topology.c                  | 26 ++++----
 drivers/cpufreq/cpufreq.c                     | 36 +++++++++++
 drivers/cpufreq/qcom-cpufreq-hw.c             |  4 +-
 drivers/thermal/cpufreq_cooling.c             |  3 -
 include/linux/arch_topology.h                 |  8 +--
 include/linux/cpufreq.h                       | 10 +++
 include/linux/sched/topology.h                |  8 +--
 .../{thermal_pressure.h => hw_pressure.h}     | 14 ++---
 include/trace/events/sched.h                  |  2 +-
 init/Kconfig                                  | 12 ++--
 kernel/sched/core.c                           |  8 +--
 kernel/sched/fair.c                           | 63 +++++++++----------
 kernel/sched/pelt.c                           | 18 +++---
 kernel/sched/pelt.h                           | 16 ++---
 kernel/sched/sched.h                          | 22 +------
 18 files changed, 144 insertions(+), 119 deletions(-)
 rename include/trace/events/{thermal_pressure.h => hw_pressure.h} (55%)

-- 
2.34.1


