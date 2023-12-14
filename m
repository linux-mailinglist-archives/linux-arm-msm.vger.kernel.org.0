Return-Path: <linux-arm-msm+bounces-4683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3918129D5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 08:57:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0D4AFB21254
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 07:57:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 654571401A;
	Thu, 14 Dec 2023 07:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pLRY7/iP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97FF0113
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Dec 2023 23:57:26 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-6ce33234fd7so4284306b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Dec 2023 23:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702540646; x=1703145446; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0d8h/X+8AJFqMWZqP9wn96fliaxprL1waPmEflLUD64=;
        b=pLRY7/iPobQt8nc/XA/Lr3Uj3wYFQMDpqZMrDv9trjYqrFRNT0Qvx8xpOSwywYqmoM
         TiDc0cqFx06eUlQRG38RgSix7R4SGPrJwwuq4sJRFRBb6XOX1CwX4mXgaFHlzkFFIqV2
         jSroyziipH+xBENtpTH2Qq1/JlbHGlriL92QeWbhFeQ0fE0FH5S5Ri5NONCcmvgtU2R8
         Kw4EMwXYaSpfgyPN4qE5uw9dKjofIzbOV0kNRuvHo5Ib9qdwPb+b6uexzVTbsFSrZHpO
         DO3lxPEy+gjPu005kUYaIsk0XnroXVUM48AgoTUan0kNaRIoJMQBx4QTnn480HXAfQ67
         Z2Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702540646; x=1703145446;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0d8h/X+8AJFqMWZqP9wn96fliaxprL1waPmEflLUD64=;
        b=lz5z3AzLRTcm9+O4KX//21yD3LE2Q9K0TvzR5cgbYOP8iJ/rCTtvM+uR9We9D7jH+1
         pW0ojs/2ZGi1U6XxsrMMZmMIN+TYwbbvaCT8f/1RJe9wz0oaY+tfSsRGD/oVEfDyZlSN
         5cdivdrJB9fR0WT4loAzGI4Xw22Tk9VdubpMdOlvlHYArnUvgQWTkSE2uuYUfrShqJ/N
         xxxAMNUE9wbb8isyk/jHq/W+hDCRpPPgLXBUqBD/V5B0M4eotyALPUAbNPHKUPPBQRcE
         CLt1GfabnAiVPppChaLi3Rv0kF+BE0gC8gPGTDD4yYCimoKscAoLmAURyq/X0nPp9omS
         FL1Q==
X-Gm-Message-State: AOJu0Yy9MfixDcE9VgXBjiocNsH8PmEzCY8gIPuXjj9iLN+84D2ErPyN
	T83RnwBCy24cDezrebo2FFQa5BleuGzklSQksbhfNQ==
X-Google-Smtp-Source: AGHT+IH5msB4lU5jvSKJG7KJS2c617v2cRX1YY8AQGHuGj64nDRHWqiH3MAFEuK6zjh/HPsVVTafJEwFkKzRP1G3l/M=
X-Received: by 2002:a05:6a00:b8e:b0:6ce:751c:c943 with SMTP id
 g14-20020a056a000b8e00b006ce751cc943mr4858088pfj.7.1702540645901; Wed, 13 Dec
 2023 23:57:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231212142730.998913-1-vincent.guittot@linaro.org>
 <20231212142730.998913-2-vincent.guittot@linaro.org> <20231214054307.axl33gagxacidjbn@vireshk-i7>
In-Reply-To: <20231214054307.axl33gagxacidjbn@vireshk-i7>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 14 Dec 2023 08:57:14 +0100
Message-ID: <CAKfTPtDam5eQO1DHxALsCaU53Rtawbfrvswy+z2unnV_eXeVLA@mail.gmail.com>
Subject: Re: [PATCH 1/4] cpufreq: Add a cpufreq pressure feedback for the scheduler
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: catalin.marinas@arm.com, will@kernel.org, sudeep.holla@arm.com, 
	rafael@kernel.org, agross@kernel.org, andersson@kernel.org, 
	konrad.dybcio@linaro.org, mingo@redhat.com, peterz@infradead.org, 
	juri.lelli@redhat.com, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, bristot@redhat.com, vschneid@redhat.com, 
	lukasz.luba@arm.com, rui.zhang@intel.com, mhiramat@kernel.org, 
	daniel.lezcano@linaro.org, amit.kachhap@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 14 Dec 2023 at 06:43, Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 12-12-23, 15:27, Vincent Guittot wrote:
> > @@ -2618,6 +2663,9 @@ static int cpufreq_set_policy(struct cpufreq_policy *policy,
> >       policy->max = __resolve_freq(policy, policy->max, CPUFREQ_RELATION_H);
> >       trace_cpu_frequency_limits(policy);
> >
> > +     cpus = policy->related_cpus;
> > +     cpufreq_update_pressure(cpus, policy->max);
> > +
> >       policy->cached_target_freq = UINT_MAX;
>
> One more question, why are you doing this from cpufreq_set_policy ? If
> due to cpufreq cooling or from userspace, we end up limiting the
> maximum possible frequency, will this routine always get called ?

Yes, any update of a FREQ_QOS_MAX ends up calling cpufreq_set_policy()
to update the policy->max


>
> --
> viresh

