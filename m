Return-Path: <linux-arm-msm+bounces-6765-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F36CE828822
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jan 2024 15:31:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 822A0B23FDF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jan 2024 14:31:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8B723608F;
	Tue,  9 Jan 2024 14:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uNCafcL3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69CC72EB07
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jan 2024 14:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-517ab9a4a13so2283784a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jan 2024 06:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704810663; x=1705415463; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=d3HXRcKDVxJPTXyXJSN6jduIbifNRx9OK443HIjFR3c=;
        b=uNCafcL3BbzriyQNRDfLPsysHiWA0xiGo1soCwY9H5k4/YXABvsNn+ch3oLKdxHBgK
         0xBcwdCI6eDD283MK41rFiTEHJXGzx5f+8jTrBWF8PkvC1Y+SL9a6W9+ZNQ1qOqXtdrW
         zNdDa80CyA5jrt/2AGxZuKQKaX5RemiAcBm94SpDGmhRCws7DsPislkMFGy5FHBAGs8P
         EUa/k6CDUM8trkRKY5Yl7aqeGH9R4185NUbQeBNDOWFCGKl5ixOdukYr1d4IpITzZI/c
         +4hqgqluZEoRKpWh21xf8eW7r9gz+ECGdIpG9hDOoIhbM/YElNbORxQKTC9mH4Wh7rAo
         8Dbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704810663; x=1705415463;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d3HXRcKDVxJPTXyXJSN6jduIbifNRx9OK443HIjFR3c=;
        b=qrtAscTHdrwSRYW/kRcoLELEHuNVpmDOR30Qf18DtX8k7VyOsC4NvQtTYdRypjvEle
         Pxb7GMeSxaSut6kTFq5xsidfYqQ0KqyRfKYIzoAppGcfU8lPZgfKhhHSjt464C2Xg/Zi
         E2FjOMpq8RxeOX4wB/TaFvc9YwDUxqXuFnUPzyh2kQtYUApehRQpN2WkR9m2bN8a/Sdq
         IN2CEAXRz6fxT+j6McXyP3NOvYaKfB0tgjQ5lH6iILrUdQqKAINtaRCaaFUUqutCbuTt
         c8c0NlI8oeKGdSGKwSt5mb7QtFja3Xtn/DPmtFxReMGq+LH/dasFb3gtmyLRuzcT87kN
         gJzQ==
X-Gm-Message-State: AOJu0Yw7AMqyR/Xb6kZC1nedbiiA5d29j+Cd3s8etCl8KiDlrObj9Th4
	5bhA8+RlqRnB9rHnpLXPf5yNk10jiextRvXMUEHMraw2ZLETDA==
X-Google-Smtp-Source: AGHT+IGCrRv2Xox8IoTKAK1tK0lI+F5UQ2lc3D09T7sRQDvvxo2IzFqkGcHCcK2S942TMjaLqrnQP9OX3vcm21L/yJk=
X-Received: by 2002:a17:90a:ea83:b0:28c:8ec9:6330 with SMTP id
 h3-20020a17090aea8300b0028c8ec96330mr3145262pjz.15.1704810662738; Tue, 09 Jan
 2024 06:31:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240108134843.429769-1-vincent.guittot@linaro.org>
 <20240108134843.429769-3-vincent.guittot@linaro.org> <fb25afab-9586-455a-b8c1-47949035c95a@arm.com>
In-Reply-To: <fb25afab-9586-455a-b8c1-47949035c95a@arm.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Tue, 9 Jan 2024 15:30:51 +0100
Message-ID: <CAKfTPtDEKzup63H0iwHkTQCZOdQLUurACCYfEB-MpW+v7JEfag@mail.gmail.com>
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

On Tue, 9 Jan 2024 at 12:22, Dietmar Eggemann <dietmar.eggemann@arm.com> wrote:
>
> On 08/01/2024 14:48, Vincent Guittot wrote:
> > Aggregate the different pressures applied on the capacity of CPUs and
> > create a new function that returns the actual capacity of the CPU:
> >   get_actual_cpu_capacity()
>
>    function name                scaling
>
> (1) arch_scale_cpu_capacity() - uarch
>
> (2) get_actual_cpu_capacity() - hw + cpufreq/thermal of (1)
>
> (3) capacity_of()             - rt (rt/dl/irq) of (2) (used by fair)
>
> Although (1) - (3) are very close to each other from the functional

I don't get your point as name of (1) and (3) have not been changed by the patch

> standpoint, their names are not very coherent.
>
> I assume this makes it hard to understand all of this when reading the
> code w/o knowing these patches before.
>
> Why is (2) tagged with 'actual'?

This is the actual max compute capacity of the cpu at now  i.e.
possibly reduced because of temporary frequency capping

So (2) equals (1) minus temporary performance capping and (3)
additionally subtracts the time used by other class to (2)


>
> This is especially visible in feec() where local variable cpu_cap
> relates to (3) whereas cpu_actual_cap related to (2).
>
> [...]
>

