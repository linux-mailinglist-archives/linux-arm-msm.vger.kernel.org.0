Return-Path: <linux-arm-msm+bounces-6760-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA33828716
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jan 2024 14:29:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E5C31C20C48
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jan 2024 13:29:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5E8839843;
	Tue,  9 Jan 2024 13:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MRs/bEWq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F143938F83
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jan 2024 13:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-28cf491b197so1483593a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jan 2024 05:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704806982; x=1705411782; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pyLic9iO2i6kaJfam6/jRmyNsV6AuxuUVqN/iIKWdX0=;
        b=MRs/bEWqCeNYQcFzZWjUBYDieSYSCVIVqyrXsBfD9AicV+JHblOI1PAfdJ8dvL5M4w
         rpX7/5KOQWTnw3f6t9UUbU5ZLu8vgTnIGxu+cyUI+msMtxppX2HLWi9eXqO45inqc1VG
         1aftg+lU9EXJOm6IcvTHKZwfbQd2JkCVtDLDHlFrI+YejvRf89FdtziRNim5pKs1+NjQ
         ofXuvZQH3eQElAaVlLe7/4vbMv3qQ6nr7LsdJvb6mACSsu6MrDqx8c4PYOZV7AwlVnM8
         ZT7vbx2f92uqtGrXcu2cKWvJxP2HaTYu2iQyI4r3hcainYDgGypheJRSMu9LVHeabfDT
         0a3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704806982; x=1705411782;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pyLic9iO2i6kaJfam6/jRmyNsV6AuxuUVqN/iIKWdX0=;
        b=pDXZ9570nRHp3PJc6FqIBzdcNhuQoP/FUdrz9VvITH6Vl3/eNkbc5STbIYorc9D0xU
         tlYeFODbNJWHRQBCU5lXtJqJQkViyLNZTn6JineSiEYg9Sd9JppqRYvGAwhsyJpOdiI6
         1vSU0syp53/7cSdVIAau4Y9+jQeTbRyQgJpKdM3OGxK86WtiHVm5OlTYrwCMIoE+F70J
         /U4kof8SQjZD2yxUtMoWFDhcDQPHQqdCgTfG33Cbyo5oR0RbAX88qHz8QM4Z6+TFR3De
         0qIqlZAGbzHj6D21ikO97rVX5u+i6+iN/MPhqgYYgkqSPxykJraVOkwWP+Y++rm3oOsB
         bshg==
X-Gm-Message-State: AOJu0YxlBTUFP04QPf7oxxlnDDDwD0/FqKYP7P/4ZM7QWMbqMu4EbJ72
	l4gx+5QmwM3hMVp3GViVshaJNbaC3LdReUydXiQ9ADMr9FfPuQ==
X-Google-Smtp-Source: AGHT+IHTyoiQC3WFdFRPjSJCoNhZ5A2+02943Z/lNMhVjhkOgqY37/nGB5ElSTBSubouYNO/eWSGYi/j7r77wcYAjoc=
X-Received: by 2002:a17:90a:4701:b0:28c:3758:f38a with SMTP id
 h1-20020a17090a470100b0028c3758f38amr2341460pjg.5.1704806982158; Tue, 09 Jan
 2024 05:29:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240108134843.429769-1-vincent.guittot@linaro.org> <d37e3d06-d9fc-4fc3-ad92-e7031489660a@arm.com>
In-Reply-To: <d37e3d06-d9fc-4fc3-ad92-e7031489660a@arm.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Tue, 9 Jan 2024 14:29:31 +0100
Message-ID: <CAKfTPtAOSgnStDSao1QarHuUW9BTfk1o7r6NO4LhwEJMhq1drg@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] Rework system pressure interface to the scheduler
To: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org, 
	sudeep.holla@arm.com, rafael@kernel.org, viresh.kumar@linaro.org, 
	agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org, 
	mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, bristot@redhat.com, 
	vschneid@redhat.com, lukasz.luba@arm.com, rui.zhang@intel.com, 
	mhiramat@kernel.org, daniel.lezcano@linaro.org, amit.kachhap@gmail.com, 
	corbet@lwn.net, gregkh@linuxfoundation.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	qyousef@layalina.io
Content-Type: text/plain; charset="UTF-8"

On Tue, 9 Jan 2024 at 12:34, Dietmar Eggemann <dietmar.eggemann@arm.com> wrote:
>
> On 08/01/2024 14:48, Vincent Guittot wrote:
> > Following the consolidation and cleanup of CPU capacity in [1], this serie
> > reworks how the scheduler gets the pressures on CPUs. We need to take into
> > account all pressures applied by cpufreq on the compute capacity of a CPU
> > for dozens of ms or more and not only cpufreq cooling device or HW
> > mitigiations. we split the pressure applied on CPU's capacity in 2 parts:
> > - one from cpufreq and freq_qos
> > - one from HW high freq mitigiation.
> >
> > The next step will be to add a dedicated interface for long standing
> > capping of the CPU capacity (i.e. for seconds or more) like the
> > scaling_max_freq of cpufreq sysfs. The latter is already taken into
> > account by this serie but as a temporary pressure which is not always the
> > best choice when we know that it will happen for seconds or more.
>
> I guess this is related to the 'user space system pressure' (*) slide of
> your OSPM '23 talk.

yes

>
> Where do you draw the line when it comes to time between (*) and the
> 'medium pace system pressure' (e.g. thermal and FREQ_QOS).

My goal is to consider the /sys/../scaling_max_freq as the 'user space
system pressure'

>
> IIRC, with (*) you want to rebuild the sched domains etc.

The easiest way would be to rebuild the sched_domain but the cost is
not small so I would prefer to skip the rebuild and add a new signal
that keep track on this capped capacity

>
> >
> > [1] https://lore.kernel.org/lkml/20231211104855.558096-1-vincent.guittot@linaro.org/
> >
> > Change since v1:
> > - Rework cpufreq_update_pressure()
> >
> > Change since v1:
> > - Use struct cpufreq_policy as parameter of cpufreq_update_pressure()
> > - Fix typos and comments
> > - Make sched_thermal_decay_shift boot param as deprecated
> >
> > Vincent Guittot (5):
> >   cpufreq: Add a cpufreq pressure feedback for the scheduler
> >   sched: Take cpufreq feedback into account
> >   thermal/cpufreq: Remove arch_update_thermal_pressure()
> >   sched: Rename arch_update_thermal_pressure into
> >     arch_update_hw_pressure
> >   sched/pelt: Remove shift of thermal clock
> >
> >  .../admin-guide/kernel-parameters.txt         |  1 +
> >  arch/arm/include/asm/topology.h               |  6 +-
> >  arch/arm64/include/asm/topology.h             |  6 +-
> >  drivers/base/arch_topology.c                  | 26 ++++----
> >  drivers/cpufreq/cpufreq.c                     | 36 +++++++++++
> >  drivers/cpufreq/qcom-cpufreq-hw.c             |  4 +-
> >  drivers/thermal/cpufreq_cooling.c             |  3 -
> >  include/linux/arch_topology.h                 |  8 +--
> >  include/linux/cpufreq.h                       | 10 +++
> >  include/linux/sched/topology.h                |  8 +--
> >  .../{thermal_pressure.h => hw_pressure.h}     | 14 ++---
> >  include/trace/events/sched.h                  |  2 +-
> >  init/Kconfig                                  | 12 ++--
> >  kernel/sched/core.c                           |  8 +--
> >  kernel/sched/fair.c                           | 63 +++++++++----------
> >  kernel/sched/pelt.c                           | 18 +++---
> >  kernel/sched/pelt.h                           | 16 ++---
> >  kernel/sched/sched.h                          | 22 +------
> >  18 files changed, 144 insertions(+), 119 deletions(-)
> >  rename include/trace/events/{thermal_pressure.h => hw_pressure.h} (55%)
>

