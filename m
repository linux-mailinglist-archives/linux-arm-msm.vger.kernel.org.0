Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3310528713F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Oct 2020 11:10:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725802AbgJHJKY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Oct 2020 05:10:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728701AbgJHJKX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Oct 2020 05:10:23 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6ED4C061755
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2020 02:10:22 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id n18so5723316wrs.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2020 02:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=NmvuDeQQ68fAr0cZvkw5ZZnQ3bYV0o7ikQbQcMSffHA=;
        b=IoMP30tFPiiyY7f7IUPEUA40EfgfRPZaLhIqfx2wcIEygd6oOg7riHRTfX2TaCutXo
         pnRZ1GaAndBxRFh5A7RAD/v+lZngkZEC74SMRcjicdjX3dZg97AVZATnbe4owIY7Z+CZ
         czqp49LbLEPYEjMUzLhFgZj+Of8R52buKekio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=NmvuDeQQ68fAr0cZvkw5ZZnQ3bYV0o7ikQbQcMSffHA=;
        b=QW6rUX7k0Rfcm9YP7YeWqk9+07n/yn8KEIv+0mGIs1/prZsidlPV6DJWFiByEBo1eg
         IBvBpImS1Ysw7ElLlQ0xC/F678jcFeUZLcpckMzrEwiY+knHS2ydSbzewm4qEhRn4+r9
         2eNWcpr0eLSkE6WVgzh0Xy1RYlZePmMoQx/cfjk4jgJJv0ssGhZWrNUfgv17G3D21X6g
         c7WiAdnWe5sNoPOuXzNVD0nic2TNuSwI9dyYWc1OfFKNK53SeGcaJo4yzyJRwMVP5A6k
         sKfUHU245TJqSagRN+EWPFgokUQuRF7v28Aud92L4FtCL3Jl7v06MPtphRU1YlguSwbk
         MK8Q==
X-Gm-Message-State: AOAM530P24wiMlop0CoBPZzIgtL1/3LroTLTDmqYmHfYj3CHC4bfkLbS
        DhpAZSDfyK1+1G4zNYeejDT4Xw==
X-Google-Smtp-Source: ABdhPJxavnqU27cCyEwcnlUtPCpLyPk7lCEdLgWu69HmsqTzMqtdt3s1KzZQcfTNVvPj6zLjH4WxkA==
X-Received: by 2002:adf:de11:: with SMTP id b17mr8040287wrm.82.1602148221365;
        Thu, 08 Oct 2020 02:10:21 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id y14sm5713916wma.48.2020.10.08.02.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2020 02:10:20 -0700 (PDT)
Date:   Thu, 8 Oct 2020 11:10:17 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Qais Yousef <qais.yousef@arm.com>
Cc:     Rob Clark <robdclark@gmail.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Tejun Heo <tj@kernel.org>, Tim Murray <timmurray@google.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@chromium.org>,
        open list <linux-kernel@vger.kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>
Subject: Re: [PATCH v2 0/3] drm: commit_work scheduling
Message-ID: <20201008091017.GD438822@phenom.ffwll.local>
Mail-Followup-To: Qais Yousef <qais.yousef@arm.com>,
        Rob Clark <robdclark@gmail.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Tejun Heo <tj@kernel.org>, Tim Murray <timmurray@google.com>,
        Rob Clark <robdclark@chromium.org>,
        open list <linux-kernel@vger.kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>
References: <20200930211723.3028059-1-robdclark@gmail.com>
 <20201002110105.e56qrvzoqfioi4hs@e107158-lin.cambridge.arm.com>
 <CAF6AEGvWMvZuy7CcGhzUSbwGtEkrNkzWHu_BN1cbdBJdZtvevA@mail.gmail.com>
 <20201005150024.mchfdtd62rlkuh4s@e107158-lin.cambridge.arm.com>
 <CAF6AEGs7NmCPyLdg+gg5jTTe-wgi2myRQ80tum6odv6tLLQ0DQ@mail.gmail.com>
 <20201006105918.v3xspb6xasjyy5ky@e107158-lin.cambridge.arm.com>
 <CAF6AEGu_V_EGcPQ+F_Z73cMCAcFPoM-GuiGWUPr+=6GD4Om=zg@mail.gmail.com>
 <20201007103653.qjohhta7douhlb22@e107158-lin.cambridge.arm.com>
 <CAF6AEGsA_enFOUkV4Rw=Sxyjf=_oFLjwbz-Y4jTO=TUraOCzVQ@mail.gmail.com>
 <20201007163010.bfgst6xfvkn2lzrk@e107158-lin.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201007163010.bfgst6xfvkn2lzrk@e107158-lin.cambridge.arm.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Oct 07, 2020 at 05:30:10PM +0100, Qais Yousef wrote:
> On 10/07/20 08:57, Rob Clark wrote:
> > Yeah, I think we will end up making some use of uclamp.. there is
> > someone else working on that angle
> > 
> > But without it, this is a case that exposes legit prioritization
> > problems with commit_work which we should fix ;-)
> 
> I wasn't suggesting this as an alternative to fixing the other problem. But it
> seemed you had a different problem here that I thought I could help with :-)
> 
> I did give my opinion about how to handle that priority issue. If the 2 threads
> are kernel threads and by design they need relative priorities IMO the kernel
> need to be taught to set this relative priority. It seemed the vblank worker
> could run as SCHED_DEADLINE. If this works, then the priority problem for
> commit_work disappears as SCHED_DEADLINE will preempt RT. If commit_work uses
> sched_set_fifo(), its priority will be 50, hence your SF threads can no longer
> preempt it. And you can manage the SF threads to be any value you want relative
> to 50 anyway without having to manage commit_work itself.
> 
> I'm not sure if you have problems with RT tasks preempting important CFS
> tasks. My brain registered two conflicting statements.

I think the problem is there's two modes cros runs in: Normal cros mode,
which mostly works like a linux desktop. CFS commit work seems fine.

Other mode is android emulation, where we have the surface flinger thread
running at SCHED_FIFO. I think Rob's plan is to runtime switch priorities
to match each use case.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
