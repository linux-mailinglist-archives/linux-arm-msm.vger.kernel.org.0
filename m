Return-Path: <linux-arm-msm+bounces-8929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA11841790
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jan 2024 01:37:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D7C612863EC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jan 2024 00:37:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D395114F68;
	Tue, 30 Jan 2024 00:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=layalina-io.20230601.gappssmtp.com header.i=@layalina-io.20230601.gappssmtp.com header.b="anqXGWUU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684A31E484
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jan 2024 00:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706575001; cv=none; b=LgjAMhv5li1/9CN1y73xJZ62EMkr1uqfDVP2mamgfoJuogLjuy836rZAEO0BB1+d/7ib6SHzJZlhNUR95ogYANKlWz7WsrNVf//dvDrPuwdKe54PO465286MAtvl6ERhbRFEIDtZRM20MLsHJO2eyp//pYGFtOJv/v9J1DhZBIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706575001; c=relaxed/simple;
	bh=TqR2eUglEQwdjXW91rVEcJp8ImbPKiEAgBGAh46CadI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CuHB+F95OjiTRQa8NzTR0GSF/7iMbdP3ZVz9d8BFS/TpSFxQizYiD48KyRQZXtdpLot/xN8obmm+dtI32/FY4EaG8jTy7lrE4poaqfuQh416zxHipkd/WSazS3Th8bsaTbBBEFW2Qfzjck9iMXZ4Lue47lOEmPT6SCIEesxrIKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io; spf=pass smtp.mailfrom=layalina.io; dkim=pass (2048-bit key) header.d=layalina-io.20230601.gappssmtp.com header.i=@layalina-io.20230601.gappssmtp.com header.b=anqXGWUU; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=layalina.io
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40ef75adf44so12724055e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jan 2024 16:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=layalina-io.20230601.gappssmtp.com; s=20230601; t=1706574998; x=1707179798; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bqKM6STmm52HJ2nwWL/mUa9wVvNf8Up7PtiKbmg/qtQ=;
        b=anqXGWUUeLiRCQzPE7pl3Adlb0q9Bg3sXa+FVL4SKsj/7s1FJLAW4R8IrAmUCaVx7c
         BpxwFhQwaE5rgw8Jw63BNrYi+B3tCaukASUS4NJCNDrX+PBY1fxBDNITamRaoywZ8aOI
         B6axdZ4EjtROeQM7/YpDlgj43ePMxHfM41XiidtxdzdLm0RktCZpn7ahXdFejpMkpoka
         JYnsT57KK3NkvGzTxO5I+TREkM0t1miGwphtVOCcUCPEjP4yGsz24n/pNVHkV379s9eB
         6vnYteOugHyiuHSV5VWLZBiCPdWR4xnNtvpgrjf6TgSup0ngfIuI44PdXII17ZyaX68P
         mD4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706574998; x=1707179798;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bqKM6STmm52HJ2nwWL/mUa9wVvNf8Up7PtiKbmg/qtQ=;
        b=es1ehPUVbjwEf6a2p36M3gfMo/gVdggks0cBf6Y2KH0vNMCi0CfGDdhRf0fhr+3ppf
         vHMoa5WY/MsAhD8A4oU9sDxb0zdqfmgpTA2ISGvGOqKWKCybHiGRSmus3WR+szkU8Luj
         d807y7VHK8BR0HoAd15m/gvjhRqydsT89aj1rKF7kQUJoYrz8yNrGDl3cQVNU9kbZNpC
         kGQG+Xt5+I0b6MlmSMoB8bk+jJQELdk+5l5NjSFAIwKyxfKhW3MoIRmvByWM1yeKJHTJ
         g0A6lNcgvfeobQlSXuZYjXVD2ox+HGVTdgpZmxAKMJWWcQKongM8yCLOLXzls/s4i8mH
         SvzA==
X-Gm-Message-State: AOJu0Yx9f+laGLg3mvhfcMv3OgaYO9Htxo+jDCuHcWPyh+MFmALFurdx
	zGh0Eu30sKAH1zdzJFVEm2DOnHECLTRTBLNyiUS/rSNLniSOR/b2ZXRF8Eg1Xlg=
X-Google-Smtp-Source: AGHT+IHFRGkHKlZdVXlzOHtFexmDPQmMqF+AK8Fq0HHOoKcjqOrnWynGemLhYlr7ZVzURH6Al81GBw==
X-Received: by 2002:a05:6000:930:b0:337:c872:7153 with SMTP id cx16-20020a056000093000b00337c8727153mr5001577wrb.46.1706574997649;
        Mon, 29 Jan 2024 16:36:37 -0800 (PST)
Received: from airbuntu ([213.122.231.14])
        by smtp.gmail.com with ESMTPSA id d5-20020adffbc5000000b0033aedaea1b2sm3763339wrs.30.2024.01.29.16.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 16:36:37 -0800 (PST)
Date: Tue, 30 Jan 2024 00:36:35 +0000
From: Qais Yousef <qyousef@layalina.io>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
	sudeep.holla@arm.com, rafael@kernel.org, viresh.kumar@linaro.org,
	agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
	mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, bristot@redhat.com, vschneid@redhat.com,
	lukasz.luba@arm.com, rui.zhang@intel.com, mhiramat@kernel.org,
	daniel.lezcano@linaro.org, amit.kachhap@gmail.com, corbet@lwn.net,
	gregkh@linuxfoundation.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 5/5] sched/pelt: Remove shift of thermal clock
Message-ID: <20240130003635.anipjhfdfld3xcil@airbuntu>
References: <20240109164655.626085-1-vincent.guittot@linaro.org>
 <20240109164655.626085-6-vincent.guittot@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240109164655.626085-6-vincent.guittot@linaro.org>

On 01/09/24 17:46, Vincent Guittot wrote:
> The optional shift of the clock used by thermal/hw load avg has been
> introduced to handle case where the signal was not always a high frequency
> hw signal. Now that cpufreq provides a signal for firmware and
> SW pressure, we can remove this exception and always keep this PELT signal
> aligned with other signals.
> Mark sysctl_sched_migration_cost boot parameter as deprecated
> 
> Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> ---

Better without it, yes.

Reviewed-by: Qais Yousef <qyousef@layalina.io>

>  .../admin-guide/kernel-parameters.txt          |  1 +
>  kernel/sched/core.c                            |  2 +-
>  kernel/sched/fair.c                            | 10 ++--------
>  kernel/sched/sched.h                           | 18 ------------------
>  4 files changed, 4 insertions(+), 27 deletions(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 65731b060e3f..2ee15522b15d 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -5722,6 +5722,7 @@
>  			but is useful for debugging and performance tuning.
>  
>  	sched_thermal_decay_shift=
> +			[Deprecated]
>  			[KNL, SMP] Set a decay shift for scheduler thermal
>  			pressure signal. Thermal pressure signal follows the
>  			default decay period of other scheduler pelt
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index a6f084bdf1c5..c68e47bfd5ae 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -5670,7 +5670,7 @@ void scheduler_tick(void)
>  
>  	update_rq_clock(rq);
>  	hw_pressure = arch_scale_hw_pressure(cpu_of(rq));
> -	update_hw_load_avg(rq_clock_hw(rq), rq, hw_pressure);
> +	update_hw_load_avg(rq_clock_task(rq), rq, hw_pressure);
>  	curr->sched_class->task_tick(rq, curr, 0);
>  	if (sched_feat(LATENCY_WARN))
>  		resched_latency = cpu_resched_latency(rq);
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index f1c3d600d6d6..d5ba6cdb141c 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -78,15 +78,9 @@ static unsigned int normalized_sysctl_sched_base_slice	= 750000ULL;
>  
>  const_debug unsigned int sysctl_sched_migration_cost	= 500000UL;
>  
> -int sched_hw_decay_shift;
>  static int __init setup_sched_thermal_decay_shift(char *str)
>  {
> -	int _shift = 0;
> -
> -	if (kstrtoint(str, 0, &_shift))
> -		pr_warn("Unable to set scheduler thermal pressure decay shift parameter\n");
> -
> -	sched_hw_decay_shift = clamp(_shift, 0, 10);
> +	pr_warn("Ignoring the deprecated sched_thermal_decay_shift= option\n");
>  	return 1;
>  }
>  __setup("sched_thermal_decay_shift=", setup_sched_thermal_decay_shift);
> @@ -9247,7 +9241,7 @@ static bool __update_blocked_others(struct rq *rq, bool *done)
>  
>  	decayed = update_rt_rq_load_avg(now, rq, curr_class == &rt_sched_class) |
>  		  update_dl_rq_load_avg(now, rq, curr_class == &dl_sched_class) |
> -		  update_hw_load_avg(rq_clock_hw(rq), rq, hw_pressure) |
> +		  update_hw_load_avg(now, rq, hw_pressure) |
>  		  update_irq_load_avg(rq, 0);
>  
>  	if (others_have_blocked(rq))
> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> index 677d24202eec..6fc6718a1060 100644
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -1520,24 +1520,6 @@ static inline u64 rq_clock_task(struct rq *rq)
>  	return rq->clock_task;
>  }
>  
> -/**
> - * By default the decay is the default pelt decay period.
> - * The decay shift can change the decay period in
> - * multiples of 32.
> - *  Decay shift		Decay period(ms)
> - *	0			32
> - *	1			64
> - *	2			128
> - *	3			256
> - *	4			512
> - */
> -extern int sched_hw_decay_shift;
> -
> -static inline u64 rq_clock_hw(struct rq *rq)
> -{
> -	return rq_clock_task(rq) >> sched_hw_decay_shift;
> -}
> -
>  static inline void rq_clock_skip_update(struct rq *rq)
>  {
>  	lockdep_assert_rq_held(rq);
> -- 
> 2.34.1
> 

