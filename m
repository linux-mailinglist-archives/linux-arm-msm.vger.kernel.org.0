Return-Path: <linux-arm-msm+bounces-6968-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DD10E829F1B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jan 2024 18:26:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8DFD41F28098
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jan 2024 17:26:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D66D44D113;
	Wed, 10 Jan 2024 17:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w+5XwlqQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502FB4D106
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jan 2024 17:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-783182d4a09so452154785a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jan 2024 09:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704907527; x=1705512327; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Quxkd2kOtosd0xhGtW1MMtr97HwHYuSGHPI/EcetRCs=;
        b=w+5XwlqQUyXYj8g2im0Pvn7grMhFHaJuYl2lDW30WjvLDoDv6GKpqBCwdb/Q6rko6g
         tpnM3ip31+jO5eTXCXfkFy4qxdx4/ileYONHc1zedL/xk/is3on/mqydJpx4GwaOcSOR
         gLPXo181lVYsfK8BlUXFS2y4FZoQiwEjGdculNHyohn7eake/rlseXEA7YsFi+6Cd3dg
         QGvF57QQNAZr422fYYfNe/ZlCitQ1kiDrEQjiqKKwElocmPmRzbu8CcwGBn/eKEZkamy
         gJsYkdxDknNBh8wzs32i6YR65qczVtKeaSKwMsMkDjrqCGHDdguo+ECaZ7A8iAIYaCbd
         WorQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704907527; x=1705512327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Quxkd2kOtosd0xhGtW1MMtr97HwHYuSGHPI/EcetRCs=;
        b=lB3lqhqnCy2X38fy855/fdi9pbdME+8DXWu9lPy1hnHcdQ97zq0nTQCFfuL3XBpLb5
         qkl3jvKm6QabaDkX8oNpvYN2nFnL2YRW0bQgz2Ybb3fvq+cxjaztr9JHL+96ca1SZhiH
         uq3npePOA4ktL5YRHAEiL2b89YYAO3S/qKYcy59noTn1RhL/IalhdnFU3EOE48+JqIvF
         4TnN5vOsxMvPp8iFA9zH2V6iExYWpu4keAscOwkx+R2IBXTUK2MUHRC04tcnQdPlwwIS
         f6+FacNENPorT8AYz2DO+I3CGOe+E94MvgGAviIjcYEItKK8Mem7tcUVT/2sgVheyXI8
         WTKA==
X-Gm-Message-State: AOJu0Yz5WutWmhYd7WRdb4rSTzwetQA/umrcsqIe2zlXWsM6z7401ojH
	PYOMWWKLMTCg4LANa7ZKQ+mHUSaikFoocXLY3heYBwJq/YdB0g==
X-Google-Smtp-Source: AGHT+IE33eYzPxNj50mHq4ToCDSp6OSKaqrAqY1BJvDZ+yYXMeLMBCiBrvgPGHdUZ5z6ObmpRUl+dxy3YNhpTLcXkW8=
X-Received: by 2002:a05:6214:c8b:b0:67f:7b95:a0f7 with SMTP id
 r11-20020a0562140c8b00b0067f7b95a0f7mr1704090qvr.91.1704907526838; Wed, 10
 Jan 2024 09:25:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240108134843.429769-1-vincent.guittot@linaro.org>
 <20240108134843.429769-3-vincent.guittot@linaro.org> <fb25afab-9586-455a-b8c1-47949035c95a@arm.com>
 <CAKfTPtDEKzup63H0iwHkTQCZOdQLUurACCYfEB-MpW+v7JEfag@mail.gmail.com> <92d1b906-6d76-4e96-a688-3a06a0a88508@arm.com>
In-Reply-To: <92d1b906-6d76-4e96-a688-3a06a0a88508@arm.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Wed, 10 Jan 2024 18:25:15 +0100
Message-ID: <CAKfTPtBh-Fc-bN3GMZSR7Dv1VCuck6xL_EQuFLBMkfSLGXSs_g@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] sched: Take cpufreq feedback into account
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

On Wed, 10 Jan 2024 at 14:51, Dietmar Eggemann <dietmar.eggemann@arm.com> wrote:
>
> On 09/01/2024 15:30, Vincent Guittot wrote:
> > On Tue, 9 Jan 2024 at 12:22, Dietmar Eggemann <dietmar.eggemann@arm.com> wrote:
> >>
> >> On 08/01/2024 14:48, Vincent Guittot wrote:
> >>> Aggregate the different pressures applied on the capacity of CPUs and
> >>> create a new function that returns the actual capacity of the CPU:
> >>>   get_actual_cpu_capacity()
> >>
> >>    function name                scaling
> >>
> >> (1) arch_scale_cpu_capacity() - uarch
> >>
> >> (2) get_actual_cpu_capacity() - hw + cpufreq/thermal of (1)
> >>
> >> (3) capacity_of()             - rt (rt/dl/irq) of (2) (used by fair)
> >>
> >> Although (1) - (3) are very close to each other from the functional
> >
> > I don't get your point as name of (1) and (3) have not been changed by the patch
>
> That's true. But with capacity_orig_of() for (1), we had some coherence
> in the naming scheme of those cpu_capacity related functions (1) - (3).
> which helps when trying to understand the code.
>
> I can see that actual_capacity_of() (2) sounds awful though.
>
> >> standpoint, their names are not very coherent.
> >>
> >> I assume this makes it hard to understand all of this when reading the
> >> code w/o knowing these patches before.
> >>
> >> Why is (2) tagged with 'actual'?
> >
> > This is the actual max compute capacity of the cpu at now  i.e.
> > possibly reduced because of temporary frequency capping
>
> Will the actual max compute capacity also depend on 'user space system
> pressure' later, i.e. on 'permanent' frequency capping?

yes it will


>
> > So (2) equals (1) minus temporary performance capping and (3)
> > additionally subtracts the time used by other class to (2)
>
> OK.
>
> A coherent set of those tags even reflected in those getters would help
> but can be done later too.

