Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72F7F2FD8CC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Jan 2021 19:50:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392076AbhATSuW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Jan 2021 13:50:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392047AbhATSt3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Jan 2021 13:49:29 -0500
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B450AC061757
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jan 2021 10:48:42 -0800 (PST)
Received: by mail-pf1-x42d.google.com with SMTP id f63so7248659pfa.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jan 2021 10:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/5Cv4pHDEwpFya1ca/ZpRFyUHE65qa5G41oFQpNl5GM=;
        b=jdVSJVKMHHUgt8ZELkdJI4HkFNZQ6l+Q0tIo6UhH7DGbLLRcbPKjW/hUUhWO0vL2oe
         kUj4kbV0jJXfbI0ebRY83BT5r1o7FthIIkRHB0vj44nEKpGdQmZIU3Ee1bQRl+AAH7vI
         5O1++uzkiWCST2JS0lLeFaRNNC21lxtdCKRP2mzI/m7Smugcka75qzj1s46llPrj3J87
         SyoMVfxFz96KMbtiWCCJ1HHTJ5Dln8KOckWKDoyD1tUd1kJ6uy3iJit3n7+6WpbWSGpJ
         QHk2CIBqqW1zSGTBUvbb5UNpsd6CrMp83lr70O//4e2AOXUJNw8F1qmiEnnwZ7aYjmOg
         CQWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/5Cv4pHDEwpFya1ca/ZpRFyUHE65qa5G41oFQpNl5GM=;
        b=m5Fhc3C3fHWNVb68KPyo26nf6foxgrby+oGiBmzUayI7C0QadTykcx4vT1siiDOawt
         2bwG+swLyV2oPeazG1GceCoOGby6psKKQarXzMpqcr0UOpBcFSkvKKr5ooaTkHk2zUUf
         tWYVRKVfiq8/VEL/+CL2n0GZdkm/zwDIX02ROBodWPVxSHQKZ5zoZxTX1db35dGoPXwC
         ds6moLb+JqH2VXiPM2pVYOaOldFaXrPhvDjI4XIV0ATY079PCr0wYudM/pj/v9Fu+mX2
         Taociom+ypNdgdVDIZ5xgq23VINFxewD7sO8RP3k1yMYk4AY8u2Rsf6/ai782qGWpLSv
         S37A==
X-Gm-Message-State: AOAM533kRvY3qH90VFd25SOO+vIiC9qxEvn5mnuxMjBNl80O0i6noij+
        l0VanmUnXGz22e57KWoGK//t0Q==
X-Google-Smtp-Source: ABdhPJyEQ2ymKJwR0ANDgbelj0tESM662YjzuAKu99FKpAtwQK1t8zooyZ5dMArZCGIWt8TxlBoR4g==
X-Received: by 2002:a05:6a00:1393:b029:1b4:7938:ff1d with SMTP id t19-20020a056a001393b02901b47938ff1dmr10494530pfg.31.1611168522092;
        Wed, 20 Jan 2021 10:48:42 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id x23sm3195933pgk.14.2021.01.20.10.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 10:48:41 -0800 (PST)
Date:   Wed, 20 Jan 2021 11:48:39 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Al Grant <Al.Grant@arm.com>
Cc:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Suzuki Poulose <Suzuki.Poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        "coresight@lists.linaro.org" <coresight@lists.linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Denis Nikitin <denik@chromium.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "leo.yan@linaro.org" <leo.yan@linaro.org>,
        "mnissler@google.com" <mnissler@google.com>
Subject: Re: [PATCH] coresight: etm4x: Add config to exclude kernel mode
 tracing
Message-ID: <20210120184839.GB708905@xps15>
References: <20201015124522.1876-1-saiprakash.ranjan@codeaurora.org>
 <20201015160257.GA1450102@xps15>
 <dd400fd7017a5d92b55880cf28378267@codeaurora.org>
 <20210118202354.GC464579@xps15>
 <32216e9fa5c9ffb9df1123792d40eafb@codeaurora.org>
 <DB7PR08MB3355E85C72492D4766F0BEFC86A30@DB7PR08MB3355.eurprd08.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB7PR08MB3355E85C72492D4766F0BEFC86A30@DB7PR08MB3355.eurprd08.prod.outlook.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jan 19, 2021 at 08:36:22AM +0000, Al Grant wrote:
> Hi Sai,
> 
> > From: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
> > Hi Mathieu,
> > 
> > On 2021-01-19 01:53, Mathieu Poirier wrote:
> > > On Fri, Jan 15, 2021 at 11:16:24AM +0530, Sai Prakash Ranjan wrote:
> > >> Hello Mathieu, Suzuki
> > >>
> > >> On 2020-10-15 21:32, Mathieu Poirier wrote:
> > >> > On Thu, Oct 15, 2020 at 06:15:22PM +0530, Sai Prakash Ranjan wrote:
> > >> > > On production systems with ETMs enabled, it is preferred to
> > >> > > exclude kernel mode(NS EL1) tracing for security concerns and
> > >> > > support only userspace(NS EL0) tracing. So provide an option via
> > >> > > kconfig to exclude kernel mode tracing if it is required.
> > >> > > This config is disabled by default and would not affect the
> > >> > > current configuration which has both kernel and userspace tracing
> > >> > > enabled by default.
> > >> > >
> > >> >
> > >> > One requires root access (or be part of a special trace group) to
> > >> > be able to use the cs_etm PMU.  With this kind of elevated access
> > >> > restricting tracing at EL1 provides little in terms of security.
> > >> >
> > >>
> > >> Apart from the VM usecase discussed, I am told there are other
> > >> security concerns here regarding need to exclude kernel mode tracing
> > >> even for the privileged users/root. One such case being the ability
> > >> to analyze cryptographic code execution since ETMs can record all
> > >> branch instructions including timestamps in the kernel and there may
> > >> be other cases as well which I may not be aware of and hence have
> > >> added Denis and Mattias. Please let us know if you have any questions
> > >> further regarding this not being a security concern.
> > >
> > > Even if we were to apply this patch there are many ways to compromise
> > > a system or get the kernel to reveal important information using the
> > > perf subsystem.  I would perfer to tackle the problem at that level
> > > rather than concentrating on coresight.
> > >
> > 
> > Sorry but I did not understand your point. We are talking about the capabilities
> > of coresight etm tracing which has the instruction level tracing and a lot more.
> > Perf subsystem is just the framework used for it.
> > In other words, its not the perf subsystem which does instruction level tracing,
> > its the coresight etm. Why the perf subsystem should be modified to lockdown
> > kernel mode? If we were to let perf handle all the trace filtering for different
> > exception levels, then why do we need the register settings in coresight etm
> > driver to filter out NS EL* tracing? And more importantly, how do you suppose
> > we handle sysfs mode of coresight tracing with perf subsystem?
> 
> You both have good points. Mathieu is right that this is not a CoreSight
> issue specifically, it is a matter of kernel security policy, and other hardware
> tracing mechanisms ought to be within its scope. There should be a general
> "anti kernel exfiltration" config that applies to all mechanisms within
> its scope, and we'd definitely expect that to include Intel PT as well as ETM.
> 
> A kernel config that forced exclude_kernel on all perf events would deal with
> ETM and PT in one place, but miss the sysfs interface to ETM.
> 
> On the other hand, doing it in the ETM drivers would cover the perf and sysfs
> interfaces to ETM, but would miss Intel PT.
> 
> So I think what is needed is a general config option that is both implemented
> in perf (excluding all kernel tracing events) and by any drivers that provide
> an alternative interface to hardware tracing events.
>

I also think this is the right solution.

Thanks,
Mathieu
 
> Al
> 
> 
> > 
> > Thanks,
> > Sai
> > 
> > --
> > QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> > of Code Aurora Forum, hosted by The Linux Foundation
