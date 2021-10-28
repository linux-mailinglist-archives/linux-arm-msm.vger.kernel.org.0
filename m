Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3579F43F353
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Oct 2021 01:10:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231393AbhJ1XNF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Oct 2021 19:13:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230455AbhJ1XNF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Oct 2021 19:13:05 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C9B9C061570
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Oct 2021 16:10:37 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id l16-20020a9d6a90000000b0054e7ab56f27so10865595otq.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Oct 2021 16:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BFSAzS7o9HlqBi5yBxBAasptrHGEYLBBAIVppOSx0zE=;
        b=Ldz/2tMA9mEjSAT6YZFX6bVE8+AFjFwUdG/VRMnEffC1hkPWdXqY0OO0JUyhqrmuFD
         y2c6vMgpQZk5OcL7FYhXrmOW6PzacNCev+jtjVEWcT5o6NtHLweTPTXIxj561R3KoW7g
         m9l/57Ob8auaZ/Jr9HeY7YVoQXSqORo4aovRQaXx1PpfQ1etJiTQgVvWCI+1CM7DW3Q0
         byw0z+xKukDVtb788ytfmBl7Y07wBqBUOVYbAo9dzrcpFQau8FYrL8thuM51QQmy1ixa
         +bhnIknd8vOHMdzt8PFUBhDjDrIieYndwmARS+taUxMcrFfduXE0+TJjs1HrueGtvH9j
         p2+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BFSAzS7o9HlqBi5yBxBAasptrHGEYLBBAIVppOSx0zE=;
        b=D6sXCQ68RpKC8H4pex8Zl2O0v22wFsHudfp+ngc6qAuKk+EsGYXGU68TS8OjrkGd0T
         gFSeptD5ZElvFXjchSS1VDQyuWgP7gIwM+mXEqnHVCgwoDUGNXP+Gxp4g5UaStC/fSAn
         vTBXpf3vKS8jTU0plWwx2aKCYJ8JyFye2bS65ynBU5OuZPoRrXLVryZlVtPhpcXsiTZP
         55gjHUw4ToOMcAuz+CSXqAjDA3OYtX3xl4u/KdRj1OkT1pStqUAGdherTCnxpwvGx4Wc
         Gu5g4SoerlFNZmDcF/GL80ICcM2VJwe+KgGeWcgWCkrdlAzbNlnhb07FxyKOXKg4rdHF
         SQcQ==
X-Gm-Message-State: AOAM530fn9YpnkA8m/psIXZUnnMgcHTDTp175kXzt/aXU+ShGtvKWVDh
        Fd8CZqJILmvEyYXz1wewmVDFXSef1Y97UjGn
X-Google-Smtp-Source: ABdhPJxuje1Z/hxzHYMVytECAJruwdjHNvR78MomsEqPj3n+UziSgWFIiXTDZuFc9NuZmH7OuJAq0Q==
X-Received: by 2002:a05:6830:23a6:: with SMTP id m6mr5703798ots.38.1635462636964;
        Thu, 28 Oct 2021 16:10:36 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id v9sm1467851oth.62.2021.10.28.16.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 16:10:36 -0700 (PDT)
Date:   Thu, 28 Oct 2021 16:12:27 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Lukasz Luba <lukasz.luba@arm.com>
Cc:     linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, sudeep.holla@arm.com,
        will@kernel.org, catalin.marinas@arm.com, linux@armlinux.org.uk,
        gregkh@linuxfoundation.org, rafael@kernel.org,
        viresh.kumar@linaro.org, amitk@kernel.org,
        daniel.lezcano@linaro.org, amit.kachhap@gmail.com,
        thara.gopinath@linaro.org, agross@kernel.org
Subject: Re: [PATCH v2 1/5] arch_topology: Introduce thermal pressure update
 function
Message-ID: <YXsuW+wOWoJzgMAA@ripper>
References: <20211015144550.23719-1-lukasz.luba@arm.com>
 <20211015144550.23719-2-lukasz.luba@arm.com>
 <YXmdyeOmNS2x3K0W@ripper>
 <a75b08d9-cf0f-b132-b07e-878b10d133a2@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a75b08d9-cf0f-b132-b07e-878b10d133a2@arm.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 28 Oct 00:16 PDT 2021, Lukasz Luba wrote:

> 
> 
> On 10/27/21 7:43 PM, Bjorn Andersson wrote:
> > On Fri 15 Oct 07:45 PDT 2021, Lukasz Luba wrote:
> > > diff --git a/arch/arm64/include/asm/topology.h b/arch/arm64/include/asm/topology.h
> > [..]
> > > +/**
> > > + * topology_thermal_pressure_update() - Update thermal pressure for CPUs
> > > + * @cpus	: The related CPUs for which capacity has been reduced
> > > + * @capped_freq	: The maximum allowed frequency that CPUs can run at
> > 
> > I know this matches what I see in e.g. the Qualcomm cpufreq hw driver,
> > but in what cases will @capped_freq differ from
> > cpufreq_get_hw_max_freq(cpumask_first(cpus))?
> 
> The @capped_freq is the maximum allowed frequency value due to
> thermal reasons, which will always be lower or equal to the value
> returned by cpufreq_get_hw_max_freq()
> (effectively: 'policy->cpuinfo.max_freq').
> 

Read patch 3 and 4 again and now this makes sense to me.

Thanks,
Bjorn

> We limit the frequency (and voltage) of CPU to reduce power (and heat)
> in the passive cooling system. That information is important to us,
> because scheduler needs to know how fast the CPU can go. It cannot
> assume that the speed is always 'policy->cpuinfo.max_freq'. Often
> it's less then that at heavy load or GPU heavy load (the same SoC).
> 
> Regards,
> Lukasz
