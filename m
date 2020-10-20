Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 769AD293E5E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Oct 2020 16:13:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407888AbgJTONb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Oct 2020 10:13:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407885AbgJTONb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Oct 2020 10:13:31 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08F04C061755;
        Tue, 20 Oct 2020 07:13:31 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id n15so2362196wrq.2;
        Tue, 20 Oct 2020 07:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lPduyuxLbnNllpgP2V2Es26ID1Kul6jDVcjp8m/z5tY=;
        b=QcseFjYifB/nVwGx8PCygt1Vws+vwLnAZoZnY7eb+iBfLZPjf+93MuL4oIrSF3TqfC
         t69uXmycEpmZ8Azg+sKG9GWz/Am2OTJu/qeKLFSlY9WSSG1cfk2uOPA9NiCPb4DQMqYl
         6fapEZnNZXGx8L+uJXYUcMlF5Hyeqsy9sMoB1D8noPcM7CejcLlnPih2gDvfpZPepWwl
         7vpQT6YplrXfqnr3EkcipvsyhOeZjoxjrC3zt6VHeuH+YO6rdtoy9c8ozGhzw158resj
         12A2r+FvK90i6Alpn0wYzxLn7zMstl6o+V1AyDsy0DMZwitTVKQxEBQdxNMC7jqOspGy
         2hAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lPduyuxLbnNllpgP2V2Es26ID1Kul6jDVcjp8m/z5tY=;
        b=TQmw1he6hDyWz6Z2RgBHxaiQ9xodeGo0KOaqjyTBYFMBHO1T9hy1fwpi6vC+6stWoi
         PGPSJCTScQ2iOhccZ851yF43ySjBVyGTj4VIFX4TUL1z1V8TH4MHGAISmUPsw0LJ5at2
         F6BNH245vtyMdcyJaKoGtuH5IDmP6vJbFdJbegbKXMwZSMIVzZF5vbA5rO75UbS61hTO
         sIcVhubXsoH2G5YuQ1bABklHwD5EUFrrzAHbinrIt0ItuO6SS8d1bTsJjsr6GKmdxoXE
         cCoXxez/EEIOwQScYbJ3fBsaOW7L4dqZijbaynnb4Jq30zB1MLD1Q9Vpy5REWui3RmSc
         5B1Q==
X-Gm-Message-State: AOAM531ZP1eI/qevIZO2q+SrzoqoAH0WA5o2HogYqQ7EcStAbfy7sRAc
        Jo2kbUovIDbs2UUxXiyJ32Wc2zATHDYQAlT7NHU=
X-Google-Smtp-Source: ABdhPJwiIFJyn3Q5AIFqYLZqNCyx2EQe+Sgocwvo1SpEVzuITf+JiH5ahXbfSyscCtrJiTVAeTVSlYpIvlkgFI7GjVc=
X-Received: by 2002:a5d:640d:: with SMTP id z13mr3657378wru.28.1603203208025;
 Tue, 20 Oct 2020 07:13:28 -0700 (PDT)
MIME-Version: 1.0
References: <20201012020958.229288-1-robdclark@gmail.com> <20201012020958.229288-8-robdclark@gmail.com>
 <20201012143555.GA438822@phenom.ffwll.local> <CAF6AEGstGtBswUUiyHxT2cCm8NwZekDnMzD0J_pQH37GwS=LiA@mail.gmail.com>
 <20201020090729.qgqish5kqamhvatj@vireshk-i7> <CAKMK7uHAgVUPHOPxDdt3LeAWqokxfuzqjZj4qqFkoKxFbRbRrg@mail.gmail.com>
 <20201020112413.xbk2vow2kgjky3pb@vireshk-i7>
In-Reply-To: <20201020112413.xbk2vow2kgjky3pb@vireshk-i7>
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 20 Oct 2020 07:13:16 -0700
Message-ID: <CAF6AEGsCj-AtFozn8d1xiNNFNbuMJ0UxS-eMhBVXiQ7rKahKnQ@mail.gmail.com>
Subject: Re: [PATCH v2 07/22] drm/msm: Do rpm get sooner in the submit path
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
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

On Tue, Oct 20, 2020 at 4:24 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
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

I do have an easy enough way to repro the issue, so if you have a
patch I can certainly test it.

BR,
-R
