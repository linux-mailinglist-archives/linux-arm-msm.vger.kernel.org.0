Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68B4645530B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Nov 2021 04:04:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242397AbhKRDG6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Nov 2021 22:06:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241265AbhKRDG5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Nov 2021 22:06:57 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38B42C061570;
        Wed, 17 Nov 2021 19:03:58 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id 137so433454wma.1;
        Wed, 17 Nov 2021 19:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=1Qz+V3K3Jksfqej8nEpPEPFrzfzFj9JiT2S5nQ8uNbc=;
        b=UZOWTMfuyZhOBCehUvrAeCiyBw2Azdvn8DQZqXnC4HLO0IYN8ugoU+HiDV2VV/7kaM
         8U3YFHVvIYFEehBnBww+q31XlwnE5XDL0u6M8Fk8UOPOJeueFp0sstpRyE0LmQ750mYr
         RK9S3AWVPUqjRLxvOEV2IDyomjasQgp2OaxsgGq4pul1G/xKJH1l8LYKLEdinv+t1HVp
         6X0g4zp+du0aLo8//OlvCLSMYAL+yFxNYTXs/m/bQMZ3Q2rMLIdUqK6UMEsp8yni+tZ7
         5HJXzEaYCYUOzGD5nfoRRH8wfSFvnTgt5G0MNWZF5TykY0zIxFH/77IxqIWNxthmTWPl
         ZjGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=1Qz+V3K3Jksfqej8nEpPEPFrzfzFj9JiT2S5nQ8uNbc=;
        b=ziQJs8fRcWVj6+vDgPqsWfVJCclb/WjOfiuLdh3gwEivmD4+DMYkfD0eRsNXHYvuq3
         iyVLB4Rpvr60XcoCzrRScJaLAk0smCClm9Ms9fkwFLCDFyrUMsDpHpwvjbpRuy+8w0aY
         t55iLElbEr0YwGLJZIYRwnYSiIgPwYKN3oGQYK4GplZ0K+wnP5kv6BmVAOLenHi8lhPo
         JQ/ZcAv7UFr8UGxHDQnlwLGna1E4BR+SBDX4winLWuAsKAPyTwN3GN+OaeFhZohpzCN8
         YVYItI4zN8H14mFEUqv5qprp6nQCs0svhGH+klIwdnmudmtIFu75bpDBsfL2aoMrKsyf
         np5Q==
X-Gm-Message-State: AOAM530B2ylBa8hiuArch5gy/Eo19HdJw5qaXx7APl1byZTPES0Y6Wb0
        uIJGSo2BCUm+FfjNpkjGBApN2ZsbGg+ny6CCOhZiS609
X-Google-Smtp-Source: ABdhPJx8Xlp6S7AiTuL2eIdl+8AZ99KWbfNyE3RkFuMg/d8USbutdueU46HvWo0rcK6JNYZnSs79Onz15otq7Iumzac=
X-Received: by 2002:a1c:790d:: with SMTP id l13mr5960771wme.101.1637204636805;
 Wed, 17 Nov 2021 19:03:56 -0800 (PST)
MIME-Version: 1.0
References: <20211116155545.473311-1-robdclark@gmail.com> <CAMi1Hd0qzu1t6QeZCNgSoTrScZL0_XQnZUPkQ5y7D+oV49GREw@mail.gmail.com>
 <c7741be3-43ec-307b-f5bd-3d19725df76c@amd.com> <0336e09d-59c4-3155-434a-0b04fda15bb6@kali.org>
In-Reply-To: <0336e09d-59c4-3155-434a-0b04fda15bb6@kali.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 17 Nov 2021 19:09:00 -0800
Message-ID: <CAF6AEGs1hmS7hNC+OOvy=eHjvYhk=GLFX5T9iHWO=PUvGxNyDg@mail.gmail.com>
Subject: Re: [PATCH] drm/scheduler: fix drm_sched_job_add_implicit_dependencies
 harder
To:     Steev Klimaszewski <steev@kali.org>
Cc:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Amit Pundir <amit.pundir@linaro.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Rob Clark <robdclark@chromium.org>,
        Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
        David Airlie <airlied@linux.ie>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Nov 17, 2021 at 5:23 PM Steev Klimaszewski <steev@kali.org> wrote:
>
>
> On 11/17/21 1:27 AM, Christian K=C3=B6nig wrote:
> > Am 16.11.21 um 19:30 schrieb Amit Pundir:
> >> On Tue, 16 Nov 2021 at 21:21, Rob Clark <robdclark@gmail.com> wrote:
> >>> From: Rob Clark <robdclark@chromium.org>
> >>>
> >>> drm_sched_job_add_dependency() could drop the last ref, so we need
> >>> to do
> >>> the dma_fence_get() first.
> >>>
> >> It fixed the splats I saw on RB5 (sm8250 | A650). Thanks.
> >>
> >> Tested-by: Amit Pundir <amit.pundir@linaro.org>
> >
> > I've added my rb, pushed this with the original fix to drm-misc-fixes
> > and cleaned up the obvious fallout between drm-misc-fixes and
> > drm-misc-next in drm-tip.
> >
> > Thanks for the help and sorry for the noise,
> > Christian.
> >
> I've run into this splat on the Lenovo Yoga C630 on 5.16-rc1 - are these
> 2 patches (which fix it) going to be heading to 5.16 or were they
> targeted at 5.17?

these should be for v5.16

BR,
-R
