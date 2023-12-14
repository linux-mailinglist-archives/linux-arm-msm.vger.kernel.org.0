Return-Path: <linux-arm-msm+bounces-4739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4A3812E1A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 12:06:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C4A7281F70
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 11:06:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAFD23E48A;
	Thu, 14 Dec 2023 11:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DBL1zKoG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EE70128
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Dec 2023 03:06:35 -0800 (PST)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6cebcf8a48aso6757608b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Dec 2023 03:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702551995; x=1703156795; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FkFcM58ORD2DTnC5dDqDGqkLUNpEfcQ7GjcBvDad/9k=;
        b=DBL1zKoGQAAJUU8LkqPk3CmA5Izw/fZZxJEmeDoNPHE48FeSZ8KsFewNCS6sk2GPqK
         NOZ6U34jepYTaT7MY5F2VjA6DSMOA36bro2mbZZ2xylUSU9HKZy0IDV0N4uUOAEmFmZK
         P7gfsPrAi5ffogereHikFjh8JErqRGrEMkNzkNkbfEQiTI0txN8OWVThAd/L/wroszJG
         z+CwVBLXNGK9riPo5oMOgV16uTK5Hzgwmnhond+WUukuKjk8qehXXlndczDBxHYEcsWd
         ME8SnhLf4B9VCJrsL0q4xisYZzacVpoxOu0FaZVBukZZR41n0P9X8M6iC9IPTikR/HJa
         YgUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702551995; x=1703156795;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FkFcM58ORD2DTnC5dDqDGqkLUNpEfcQ7GjcBvDad/9k=;
        b=jkyV/C27uqCaBghkC3TYBhAaUfeHXO7x6THrhx3pMZFHG+VZ+Fk+WJKuXV31/cMmrC
         jIwKejM++C5Iqv8ROy/Uxg0LQa9pDlRcONPsjwHHCCjLEUKfZx1Hvy7q8bLykYLB4MJS
         V3PlI6YEcrxjtGeHk+Yak2u/WABJuk9fN647jesOLIgu1ZI8II9vy3Ykt90h9UfQFBAD
         L/95LmejjKG7ypJIureaoDaHRNnA+KjB3J6UmWEDMCu+Qz0obffy74annl00BmxJob1N
         Ky9Z3SkUyhP4SxnCdVmHTHDTmzvGF3emAqJzS3snGZDmJOpLpTEFhRwSgHOc/ZJZqb17
         YJ5Q==
X-Gm-Message-State: AOJu0YztNQk4vIHC/i7lListHLFd/GljeMDayPstAwmmWdrFgo4EaeA+
	5nw7cQ63geZvpbX/qeBXEHqRCjTcPPRstcBhFSZeAg==
X-Google-Smtp-Source: AGHT+IGybyxiB7nTBs9dM8tY5oppuZjVzJ6FLWefF8o/CeO7/SBsLNR8gOeQrxQdYOWN3qivMYDL4ZJHrfh5hqtPofo=
X-Received: by 2002:a05:6a00:10c1:b0:6cb:a1fe:5217 with SMTP id
 d1-20020a056a0010c100b006cba1fe5217mr10062758pfu.16.1702551994935; Thu, 14
 Dec 2023 03:06:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231212142730.998913-1-vincent.guittot@linaro.org>
 <20231212142730.998913-2-vincent.guittot@linaro.org> <af7b67d1-c4a3-44e3-a632-5f0a4ea6eb25@arm.com>
In-Reply-To: <af7b67d1-c4a3-44e3-a632-5f0a4ea6eb25@arm.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 14 Dec 2023 12:06:23 +0100
Message-ID: <CAKfTPtApsWeEbbV03sx8vQTGc3i+oFsAWRNsLnyHjYCSrRMqhg@mail.gmail.com>
Subject: Re: [PATCH 1/4] cpufreq: Add a cpufreq pressure feedback for the scheduler
To: Lukasz Luba <lukasz.luba@arm.com>
Cc: catalin.marinas@arm.com, will@kernel.org, daniel.lezcano@linaro.org, 
	mhiramat@kernel.org, rui.zhang@intel.com, vschneid@redhat.com, 
	bristot@redhat.com, bsegall@google.com, dietmar.eggemann@arm.com, 
	juri.lelli@redhat.com, peterz@infradead.org, mingo@redhat.com, 
	linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, agross@kernel.org, 
	konrad.dybcio@linaro.org, andersson@kernel.org, viresh.kumar@linaro.org, 
	sudeep.holla@arm.com, rafael@kernel.org, rostedt@goodmis.org, mgorman@suse.de, 
	amit.kachhap@gmail.com, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 14 Dec 2023 at 10:20, Lukasz Luba <lukasz.luba@arm.com> wrote:
>
>
>
> On 12/12/23 14:27, Vincent Guittot wrote:
> > Provide to the scheduler a feedback about the temporary max available
> > capacity. Unlike arch_update_thermal_pressure, this doesn't need to be
> > filtered as the pressure will happen for dozens ms or more.
> >
> > Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> > ---
> >   drivers/cpufreq/cpufreq.c | 48 +++++++++++++++++++++++++++++++++++++++
> >   include/linux/cpufreq.h   | 10 ++++++++
> >   2 files changed, 58 insertions(+)
> >
> > diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> > index 44db4f59c4cc..7d5f71be8d29 100644
> > --- a/drivers/cpufreq/cpufreq.c
> > +++ b/drivers/cpufreq/cpufreq.c
> > @@ -2563,6 +2563,50 @@ int cpufreq_get_policy(struct cpufreq_policy *policy, unsigned int cpu)
> >   }
> >   EXPORT_SYMBOL(cpufreq_get_policy);
> >
> > +DEFINE_PER_CPU(unsigned long, cpufreq_pressure);
> > +EXPORT_PER_CPU_SYMBOL_GPL(cpufreq_pressure);
>
> Why do we export this variable when we have get/update functions?
> Do we expect modules would manipulate those per-cpu variables
> independently and not like we do per-cpumask in the update func.?

No, I will remove the EXPORT_PER_CPU_SYMBOL_GPL

