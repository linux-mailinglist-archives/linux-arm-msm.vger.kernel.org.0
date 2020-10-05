Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A13328376E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Oct 2020 16:15:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726335AbgJEOPW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Oct 2020 10:15:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725903AbgJEOPV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Oct 2020 10:15:21 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F968C0613CE
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Oct 2020 07:15:19 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id k10so9765301wru.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2020 07:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=ay+jguy7+ZagQFNHjl5GTP/H4mWDtPa/uMEIRbiAg44=;
        b=TUfuW3LEj4Jbt06xzl/C9DDE2dczlfGBnmMDqwKliD9z+kW6GeTjLeuOD3FG8BUifv
         bFbgSKBcOb6jdeyddahIGGTVZfrQmeLt2kzz9tPPMCTu2SyQjX9s93bfO024IIE2cy8X
         +z+7ue/M+q8mWk0tzVlk68kbXKO2UWOr/Hago=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=ay+jguy7+ZagQFNHjl5GTP/H4mWDtPa/uMEIRbiAg44=;
        b=ber6pOjdIYaQFYO+J2e/OtkEB4Ea5hh23cH3k2vI2xA+stDrYTqGeT4ryVoZsDjWkX
         AA2MQwCk9iUHKI/WThEbcfF5+O3iKH0/mDTM29gFt/RLNyOp5iWb6ZDnIwUIZb8oW7Yh
         VnOAO8v2oqcwWQK7mYfs/SJV6NoZVAM7RNHYNS7uadwV5xuJwLlxtL1OQWP4xNA8R/AX
         ZUSTEwsLCdQ3i9Qd6wvFWUYGEusLcxuu0pJ4VPbeQi8Ihta/GDs8mr0Glz69kTWzgVFd
         YbSsT69KeSCXkMDx75OYNHRUwyRCQ2/RySDa0ZRw08rqCtHiKPhgRkCm6ab/yJV5ZrxA
         cAcg==
X-Gm-Message-State: AOAM530T0Dfh5XXI/KZkYx4q141aEaeLdsibmBIeCtAx5nb+/SRInTNR
        Fh7/0QHe/JaAyt3RtGFScPDXvg==
X-Google-Smtp-Source: ABdhPJxmD1fDmEssDSGpgHi4KujkFHaEw8jJimiPz4B2ht0xsrsZblg4qEEFvc3rY2cNmbwL/R79Wg==
X-Received: by 2002:adf:e304:: with SMTP id b4mr17324797wrj.141.1601907318047;
        Mon, 05 Oct 2020 07:15:18 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id q18sm84677wre.78.2020.10.05.07.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 07:15:17 -0700 (PDT)
Date:   Mon, 5 Oct 2020 16:15:15 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc:     Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Tim Murray <timmurray@google.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Tejun Heo <tj@kernel.org>, Qais Yousef <qais.yousef@arm.com>
Subject: Re: [PATCH v2 0/3] drm: commit_work scheduling
Message-ID: <20201005141515.GV438822@phenom.ffwll.local>
Mail-Followup-To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
        Rob Clark <robdclark@gmail.com>, Rob Clark <robdclark@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Tim Murray <timmurray@google.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Tejun Heo <tj@kernel.org>, Qais Yousef <qais.yousef@arm.com>
References: <20200930211723.3028059-1-robdclark@gmail.com>
 <CAKMK7uHHPWE3h7ssG-dpb3czwbP5VtZYztMA=CpvQ4HV4LQTXA@mail.gmail.com>
 <CAF6AEGszF60dWn37m63wujjtuObqkz2ZqEN3LHaPhCkKa1cdmA@mail.gmail.com>
 <CAKMK7uEd853irzdBMCcaNEMAeOZKVFcFpgNtcYrgQkmHxdT3-w@mail.gmail.com>
 <20201002105256.GA6112@intel.com>
 <20201002110544.GB6112@intel.com>
 <CAF6AEGv+UnZJoBj_ELRVr4sQeMs52vAgyw2g+wtabLPBrYDKvw@mail.gmail.com>
 <20201005121524.GI6112@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201005121524.GI6112@intel.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 05, 2020 at 03:15:24PM +0300, Ville Syrjälä wrote:
> On Fri, Oct 02, 2020 at 10:55:52AM -0700, Rob Clark wrote:
> > On Fri, Oct 2, 2020 at 4:05 AM Ville Syrjälä
> > <ville.syrjala@linux.intel.com> wrote:
> > >
> > > On Fri, Oct 02, 2020 at 01:52:56PM +0300, Ville Syrjälä wrote:
> > > > On Thu, Oct 01, 2020 at 05:25:55PM +0200, Daniel Vetter wrote:
> > > > > On Thu, Oct 1, 2020 at 5:15 PM Rob Clark <robdclark@gmail.com> wrote:
> > > > > >
> > > > > > On Thu, Oct 1, 2020 at 12:25 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > > > >
> > > > > > > On Wed, Sep 30, 2020 at 11:16 PM Rob Clark <robdclark@gmail.com> wrote:
> > > > > > > >
> > > > > > > > From: Rob Clark <robdclark@chromium.org>
> > > > > > > >
> > > > > > > > The android userspace treats the display pipeline as a realtime problem.
> > > > > > > > And arguably, if your goal is to not miss frame deadlines (ie. vblank),
> > > > > > > > it is.  (See https://lwn.net/Articles/809545/ for the best explaination
> > > > > > > > that I found.)
> > > > > > > >
> > > > > > > > But this presents a problem with using workqueues for non-blocking
> > > > > > > > atomic commit_work(), because the SCHED_FIFO userspace thread(s) can
> > > > > > > > preempt the worker.  Which is not really the outcome you want.. once
> > > > > > > > the required fences are scheduled, you want to push the atomic commit
> > > > > > > > down to hw ASAP.
> > > > > > > >
> > > > > > > > But the decision of whether commit_work should be RT or not really
> > > > > > > > depends on what userspace is doing.  For a pure CFS userspace display
> > > > > > > > pipeline, commit_work() should remain SCHED_NORMAL.
> > > > > > > >
> > > > > > > > To handle this, convert non-blocking commit_work() to use per-CRTC
> > > > > > > > kthread workers, instead of system_unbound_wq.  Per-CRTC workers are
> > > > > > > > used to avoid serializing commits when userspace is using a per-CRTC
> > > > > > > > update loop.  And the last patch exposes the task id to userspace as
> > > > > > > > a CRTC property, so that userspace can adjust the priority and sched
> > > > > > > > policy to fit it's needs.
> > > > > > > >
> > > > > > > >
> > > > > > > > v2: Drop client cap and in-kernel setting of priority/policy in
> > > > > > > >     favor of exposing the kworker tid to userspace so that user-
> > > > > > > >     space can set priority/policy.
> > > > > > >
> > > > > > > Yeah I think this looks more reasonable. Still a bit irky interface,
> > > > > > > so I'd like to get some kworker/rt ack on this. Other opens:
> > > > > > > - needs userspace, the usual drill
> > > > > >
> > > > > > fwiw, right now the userspace is "modetest + chrt".. *probably* the
> > > > > > userspace will become a standalone helper or daemon, mostly because
> > > > > > the chrome gpu-process sandbox does not allow setting SCHED_FIFO.  I'm
> > > > > > still entertaining the possibility of switching between rt and cfs
> > > > > > depending on what is in the foreground (ie. only do rt for android
> > > > > > apps).
> > > > > >
> > > > > > > - we need this also for vblank workers, otherwise this wont work for
> > > > > > > drivers needing those because of another priority inversion.
> > > > > >
> > > > > > I have a thought on that, see below..
> > > > >
> > > > > Hm, not seeing anything about vblank worker below?
> > > > >
> > > > > > > - we probably want some indication of whether this actually does
> > > > > > > something useful, not all drivers use atomic commit helpers. Not sure
> > > > > > > how to do that.
> > > > > >
> > > > > > I'm leaning towards converting the other drivers over to use the
> > > > > > per-crtc kwork, and then dropping the 'commit_work` from atomic state.
> > > > > > I can add a patch to that, but figured I could postpone that churn
> > > > > > until there is some by-in on this whole idea.
> > > > >
> > > > > i915 has its own commit code, it's not even using the current commit
> > > > > helpers (nor the commit_work). Not sure how much other fun there is.
> > > >
> > > > I don't think we want per-crtc threads for this in i915. Seems
> > > > to me easier to guarantee atomicity across multiple crtcs if
> > > > we just commit them from the same thread.
> > >
> > > Oh, and we may have to commit things in a very specific order
> > > to guarantee the hw doesn't fall over, so yeah definitely per-crtc
> > > thread is a no go.
> > 
> > If I'm understanding the i915 code, this is only the case for modeset
> > commits?  I suppose we could achieve the same result by just deciding
> > to pick the kthread of the first CRTC for modeset commits.  I'm not
> > really so much concerned about parallelism for modeset.
> 
> I'm not entirely happy about the random differences between modesets
> and other commits. Ideally we wouldn't need any.
> 
> Anyways, even if we ignore modesets we still have the issue with
> atomicity guarantees across multiple crtcs. So I think we still
> don't want per-crtc threads, rather it should be thread for each 
> commit.
> 
> Well, if the crtcs aren't running in lockstep then maybe we could
> shove them off to separate threads, but that'll just complicate things
> needlessly I think since we'd need yet another way to iterate
> the crtcs in each thread. With the thread-per-commit apporach we
> can just use the normal atomic iterators.
> 
> > 
> > > I don't even understand the serialization argument. If the commits
> > > are truly independent then why isn't the unbound wq enough to avoid
> > > the serialization? It should just spin up a new thread for each commit
> > > no?
> > 
> > The problem with wq is prioritization and SCHED_FIFO userspace
> > components stomping on the feet of commit_work. That is the entire
> > motivation of this series in the first place, so no we cannot use
> > unbound wq.
> 
> This is a bit dejavu of the vblank worker discussion, where I actually
> did want a per-crtc RT kthread but people weren't convinced they
> actually help. The difference is that for vblank workers we actually
> tried to get some numbers, here I've not seen any.

The problem here is priority inversion, not latency: Android runs
surface-flinger as SCHED_FIFO, so when surfaceflinger does something it
can preempt the kernel's commit work, and we miss a frame. Apparently
otherwise the soft-rt of just having a normal worker (with maybe elevated
niceness) seems nice enough.

Aside: I just double-checked, and vblank work has a per-crtc kthread.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
