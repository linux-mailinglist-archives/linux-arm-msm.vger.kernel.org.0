Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B37BE293A32
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Oct 2020 13:42:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393623AbgJTLmp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Oct 2020 07:42:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393553AbgJTLmp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Oct 2020 07:42:45 -0400
Received: from mail-oo1-xc41.google.com (mail-oo1-xc41.google.com [IPv6:2607:f8b0:4864:20::c41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F30FC061755
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2020 04:42:45 -0700 (PDT)
Received: by mail-oo1-xc41.google.com with SMTP id c25so355124ooe.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2020 04:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=R+o8387W9/ZCn4LvR5U6YDN3Hh+8V5WW6tTBimBSuj0=;
        b=H4if/7cPRAnox8YksApTgg0t73vJQHSJOOVU5OQ9YHMpaBkWSqFKfMKJIuEozOz6Iw
         EA784/M765Tisiz8tfO+LZAFAgoIf/Qj060xxXjk1c7gM+UjG2ajoZ9BOsz3gtn/dm+f
         F9tIxwT4zJSGligcusWCJUFCe68BT/mXcn8Wk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R+o8387W9/ZCn4LvR5U6YDN3Hh+8V5WW6tTBimBSuj0=;
        b=RQPQs2Z4twEYJhFStyyJPEB8NhhHH8de7mc7WerMNk6u9r/Be+SqWjjmiJo7APxDvd
         6fBfTFvw2iTsesNeEbDHkVsAyE4u5i5LEoedC/yf5iZ1XyQRvC+vCdF7fU9oVz1v9K57
         0RyS6uRFtvRvEk2avtTqhNdFwaopdVkqUt4JFcdt49h/jcsAEJvZHTpnO4RRyJe1BCFi
         eDyiCIFSsF7FulnqYdOHHLfCixI7rxcJeb5UrkGveAh/P6nj9mvp8H93qKjbDml12oSG
         MfDS1IL4WrVHwMsFfwOSgcu4mHiU6gqXDYI/q72chno5RLimfcvjcrfl++RXWgYaJmki
         lG3g==
X-Gm-Message-State: AOAM533b+4UCwVPLU57nNzIas6Jr5YUppFWKj8mL4zv1f/n6KLONu34J
        rm/D3jfiQcANYawhZrGrRAI1THrEAvTzQ27JynpRPQ==
X-Google-Smtp-Source: ABdhPJz5jqm21tJbsKMZknC7WQ/UHndcHNg9KDxpoJgyyMcRMTewgrvULjlJHVJu7koXNwvWpY6/fG5Eck9+CfXJUFA=
X-Received: by 2002:a4a:b503:: with SMTP id r3mr1486690ooo.28.1603194164455;
 Tue, 20 Oct 2020 04:42:44 -0700 (PDT)
MIME-Version: 1.0
References: <20201012020958.229288-1-robdclark@gmail.com> <20201012020958.229288-8-robdclark@gmail.com>
 <20201012143555.GA438822@phenom.ffwll.local> <CAF6AEGstGtBswUUiyHxT2cCm8NwZekDnMzD0J_pQH37GwS=LiA@mail.gmail.com>
 <20201020090729.qgqish5kqamhvatj@vireshk-i7> <CAKMK7uHAgVUPHOPxDdt3LeAWqokxfuzqjZj4qqFkoKxFbRbRrg@mail.gmail.com>
 <20201020112413.xbk2vow2kgjky3pb@vireshk-i7>
In-Reply-To: <20201020112413.xbk2vow2kgjky3pb@vireshk-i7>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Tue, 20 Oct 2020 13:42:33 +0200
Message-ID: <CAKMK7uHYBCoBvTGyMHGMrt2YRrB7RFt+maWNRjApgz621hu8JA@mail.gmail.com>
Subject: Re: [PATCH v2 07/22] drm/msm: Do rpm get sooner in the submit path
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>,
        "Menon, Nishanth" <nm@ti.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Oct 20, 2020 at 1:24 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 20-10-20, 12:56, Daniel Vetter wrote:
> > Yeah that's bad practice. Generally you shouldn't need to hold locks
> > in setup/teardown code, since there's no other thread which can
> > possible hold a reference to anything your touching anymore. Ofc
> > excluding quickly grabbing/dropping a lock to insert/remove objects
> > into lists and stuff.
> >
> > The other reason is that especially with anything related to sysfs or
> > debugfs, the locking dependencies you're pulling in are enormous: vfs
> > locks pull in mm locks (due to mmap) and at that point there's pretty
> > much nothing left you're allowed to hold while acquiring such a lock.
> > For simple drivers this is no issue, but for fancy drivers (like gpu
> > drivers) which need to interact with core mm) this means your
> > subsystem is a major pain to use.
> >
> > Usually the correct fix is to only hold your subsystem locks in
> > setup/teardown when absolutely required, and fix any data
> > inconsistency issues by reordering your setup/teardown code: When you
> > register as the last step and unregister as the first step, there's no
> > need for any additional locking. And hence no need to call debugfs
> > functions while holding your subsystem locks.
> >
> > The catch phrase I use for this is "don't solve object lifetime issues
> > with locking". Instead use refcounting and careful ordering in
> > setup/teardown code.
>
> This is exactly what I have done in the OPP core, the locks were taken
> only when really necessary, though as we have seen now I have missed
> that at a single place and that should be fixed as well. Will do that,
> thanks.

Excellent. If the fix is small enough can you push it into 5.10? That
way drm/msm doesn't have to carry the temporary solution for 5.11 (the
issue only pops up with the locking rework, which teaches lockdep a
few more things about what's going on as a side effect).
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
