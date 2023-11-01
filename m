Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A09287DDB12
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Nov 2023 03:40:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344604AbjKAChf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 Oct 2023 22:37:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344638AbjKAChe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 Oct 2023 22:37:34 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36F1AC2
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Oct 2023 19:37:32 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-507c78d258fso9121692e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Oct 2023 19:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698806250; x=1699411050; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RhToUgDGewUPgf6OgyTbPtKvOyKo7IWG8IUQAlqOJOY=;
        b=m+XUEFGpeVIe2QrxQGFsFsLQ7UsDiRCFDQEdb8G7E1oneV7fSRivqOCqf7zCiaqVjz
         z2W5Xk3t+xMWOTSd2P1Lo5gfSJabgSOsxfnt1xYxjF/vSCq0vOTEMwooU1PSS0q0hDmq
         MmKwBtP0hokMsvnLOiNsZFfl+X6tK9KFYiE/kaJCm7Awn5qIfPbbN2ytdZJ6GH5Sn1Y1
         EbW+ENLuXOYcs2pEE4iDw79VhmXan+0JXOoUxUmQ9wVn1xC3ru3GyT1SXEN1oKurkKtt
         yuX0Q9fe67drzz/qUcA3uIjlC/iktP8a8/PtyvIY/sTRQMnU4jDYr+VJ9Ee2Hkf3yi4V
         PhPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698806250; x=1699411050;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RhToUgDGewUPgf6OgyTbPtKvOyKo7IWG8IUQAlqOJOY=;
        b=c6k89/wyfWLbm7xI44DazhjvGrslNjLAhMQNzUNaFbfDRgl2aCOmxOFI9O0GPJulmo
         JObf0jS4tSOFk9x+eyypyC7C4Y1rDUBlPJrWc3bZbwqQm9izJQQNdJdTzS3BE37vk2N9
         B42GVHN5Bgum5KVfQePihpUvHwK3Xwrs3sc9SOaD0/YMuKxg7Ck8bCkSiKpXNWVBqS5I
         2nDbJeAxOMZk3N9DqJebftHfVkedXuq2QvolpOPsN9iMgV2iwDD+aaYtorX79M3+5ZI6
         SomMXPfiwy0D9oct1w0MlGcoCwJQqn1gR7rXpGJ+w58fVn3ztcn9Fbs9KC5a3iZE5VXn
         +DUQ==
X-Gm-Message-State: AOJu0YxKyvLTOyyXKasTKUBr0RdW1aPlUhMGnG5N5Ro0eUGotW5M79dY
        zYxBpN45g30Gigf7Es5mXsoDpsmn5ehVP4afuqQ=
X-Google-Smtp-Source: AGHT+IFeh9ikxIDnkDlTHkH1PXpR/kgi5gze/lZYbODyZgaDnbprmcGirGJlGwiGQ95RhKrHlfaYPFytDVNE91zQ2Q8=
X-Received: by 2002:a05:6512:4845:b0:500:acf1:b432 with SMTP id
 ep5-20020a056512484500b00500acf1b432mr11708881lfb.63.1698806250074; Tue, 31
 Oct 2023 19:37:30 -0700 (PDT)
MIME-Version: 1.0
References: <20231023032251.164775-1-luben.tuikov@amd.com> <8f53f7ef-7621-4f0b-bdef-d8d20bc497ff@redhat.com>
 <6f3e9b93-2be5-46b2-bbd9-d61d2603c14a@gmail.com> <c57c7217-bfb9-4770-b17e-587f3b8a038c@redhat.com>
 <bef15942-9543-4118-89c9-62c63c6215d4@gmail.com>
In-Reply-To: <bef15942-9543-4118-89c9-62c63c6215d4@gmail.com>
From:   Dave Airlie <airlied@gmail.com>
Date:   Wed, 1 Nov 2023 12:37:18 +1000
Message-ID: <CAPM=9ty3X6ods9e9g47PNEZO0Kr35a36ffq+o4b0wNg6B+zsyQ@mail.gmail.com>
Subject: Re: [PATCH] drm/sched: Convert the GPU scheduler to variable number
 of run-queues
To:     Luben Tuikov <ltuikov89@gmail.com>
Cc:     Danilo Krummrich <dakr@redhat.com>,
        Luben Tuikov <luben.tuikov@amd.com>,
        Direct Rendering Infrastructure - Development 
        <dri-devel@lists.freedesktop.org>,
        Matthew Brost <matthew.brost@intel.com>,
        lima@lists.freedesktop.org, Emma Anholt <emma@anholt.net>,
        nouveau@lists.freedesktop.org,
        Russell King <linux+etnaviv@armlinux.org.uk>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        etnaviv@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Qiang Yu <yuq825@gmail.com>, linux-arm-msm@vger.kernel.org,
        Alex Deucher <alexander.deucher@amd.com>,
        freedreno@lists.freedesktop.org,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 1 Nov 2023 at 11:46, Luben Tuikov <ltuikov89@gmail.com> wrote:
>
> On 2023-10-31 09:33, Danilo Krummrich wrote:
> >
> > On 10/26/23 19:25, Luben Tuikov wrote:
> >> On 2023-10-26 12:39, Danilo Krummrich wrote:
> >>> On 10/23/23 05:22, Luben Tuikov wrote:
> >>>> The GPU scheduler has now a variable number of run-queues, which are set up at
> >>>> drm_sched_init() time. This way, each driver announces how many run-queues it
> >>>> requires (supports) per each GPU scheduler it creates. Note, that run-queues
> >>>> correspond to scheduler "priorities", thus if the number of run-queues is set
> >>>> to 1 at drm_sched_init(), then that scheduler supports a single run-queue,
> >>>> i.e. single "priority". If a driver further sets a single entity per
> >>>> run-queue, then this creates a 1-to-1 correspondence between a scheduler and
> >>>> a scheduled entity.
> >>>
> >>> Generally, I'm fine with this patch and how it replaces / generalizes the single
> >>> entity approach.
> >>
> >> Great!
> >>
> >>> However, I'm not quite sure how to properly use this. What is a driver supposed to
> >>> do, which previously took advantage of DRM_SCHED_POLICY_SINGLE_ENTITY?
> >>>
> >>> Is it supposed to call drm_sched_init() with num_rqs=1? If so, what's the correct way
> >>
> >> Yes, you call drm_sched_init() with num_rqs set to 1.
> >>
> >>> to initialize the drm_sched_entity then? Calling drm_sched_entity_init() with priority=0?
> >>
> >> Yes, with priority set to 0.
> >>
> >> One unfortunate fact I noticed when doing this patch is that the numerical values
> >> assigned to enum drm_sched_priority is that the names to values are upside down.
> >> Instead of min being 0, normal:1, high:2, kernel:3, it should've been kernel:0 (highest),
> >> high:1, normal:2, low:4, and so on.
> >>
> >> The reason for this is absolutely clear: if you had a single priority, it would be
> >> 0, the kernel, one, highest one. This is similar to how lanes in a highway are counted:
> >> you always have lane 1. Similarly to nice(1) and kernel priorities...
> >>
> >>> Any other priority consequently faults in drm_sched_job_arm().
> >>
> >> drm_sched_job_arm() faults on !ENTITY, but the "priority" is just
> >> assigned to s_priority:
> >>      job->s_priority = entity->priority;
> >>
> >>
> >>> While I might sound like a broken record (sorry for that), I really think everything
> >>> related to Matt's series needs documentation, as in:
> >>
> >> Yes, I agree.
> >
> > Great! Do you plan to send a subsequent patch adding some documentation for this one? I
> > think it'd be good to get all the above documented.
>
> A lot of this would be the magic sauce of drivers and hardware--as we've seen with Xe,
> and it would be presumptuous of me to write down to the detail of what and how this
> and that should be used.

Nope it wouldn't be. Please feel free to persume how drivers might
work in the form of documentation.

At some point the scheduler needs to be documented and so far two
maintainers have avoided doing so, and it's causing no end of
problems.

Write documentation, this goes for Xe scheduler patches, Danilo's work.

When someone asks you for docs, consider it a blocker on getting stuff
merged, because this stuff isn't obvious.

Dave.
