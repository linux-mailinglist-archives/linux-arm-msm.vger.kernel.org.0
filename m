Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8916224530
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jul 2020 22:29:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728437AbgGQU3e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jul 2020 16:29:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726492AbgGQU3c (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jul 2020 16:29:32 -0400
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com [IPv6:2607:f8b0:4864:20::a42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 729F5C0619D2
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2020 13:29:32 -0700 (PDT)
Received: by mail-vk1-xa42.google.com with SMTP id c11so2393744vkn.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2020 13:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YLpVMDYrwWJk9a87cWOg2bUrC1EGuGNsrDX+jB50X64=;
        b=QOcdUWmVYO1ruHidjb3BSZV+nTbElxTyRNbKn8qrlYGKW/hsoUgNhdQV35VwVKTeCK
         cLuBXa3aF18NO7qBg+2XtVH09Gnp+OP/6/WjY2PVwrY0zQuGLT6HFiEd6w2HW4jkN+kO
         uAGvcAq319nP7pcGzfoiqyaBryN0jxK7I9qTc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YLpVMDYrwWJk9a87cWOg2bUrC1EGuGNsrDX+jB50X64=;
        b=j7DoQCV84vBZSBhCgldIPdZShBQuZdaBrpLNENqEzqr54ggYioXLs0G1mSk62uUqHz
         G/vYlq89zTIy60tg1J/+F7Hxcp7bKkWQEgCM4ZcS862xB+a+re8g7lJrWQdCZ9TAauNB
         rez6UveIm86x+bpbP+/Wf5v84xRPoqKkaSTYcjnvEhsM5kJyOr67Z5vp4RASHxfwTJyd
         HgsSRwIAWiWacDhlOkaLMQuDZwcCetnvhCLZ2sghfevw6VVmuFn9qhEw3ZwRe98sub6G
         ZouIrpvdkTZvPMSDG6EZkFpmpxEjuqpqjHZHrZc0TrPKS4SV47zeMcBZpZrz/hQSu1f3
         a8Aw==
X-Gm-Message-State: AOAM5303h773p0IKxvSGFKCTd7hFrUtfrBPRSTLpcNKCNbuNoTHtdnLu
        jUq3mIuCCXg75x+BBm4EXgC0BI0NtGM=
X-Google-Smtp-Source: ABdhPJzmhP5HR+mOkNPv5Hdg4lh1k6lRZIN24lerbuiQWu2q/yTo7QX7pksptB2sjOrHDTQ79YXxNA==
X-Received: by 2002:ac5:c2d2:: with SMTP id i18mr8473974vkk.33.1595017771353;
        Fri, 17 Jul 2020 13:29:31 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id p27sm774044uaa.8.2020.07.17.13.29.30
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2020 13:29:30 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id k7so3250797uan.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2020 13:29:30 -0700 (PDT)
X-Received: by 2002:ab0:44e5:: with SMTP id n92mr8909789uan.121.1595017769995;
 Fri, 17 Jul 2020 13:29:29 -0700 (PDT)
MIME-Version: 1.0
References: <1594996458-15529-1-git-send-email-akhilpo@codeaurora.org>
 <20200717144607.GA16703@jcrouse1-lnx.qualcomm.com> <CAD=FV=Vdg36wBJiYM9bxGy-8hjxEf85aYAGuqR=Xh_oM0pLt0g@mail.gmail.com>
 <CAF6AEGvY9qxpi8rqL4Lef+Qs1yc20K3jEewK+9mWuTdhkLDKkA@mail.gmail.com>
In-Reply-To: <CAF6AEGvY9qxpi8rqL4Lef+Qs1yc20K3jEewK+9mWuTdhkLDKkA@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 17 Jul 2020 13:29:18 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VjTzD_Swcbuk8o20tGkkx1EtPF-CT74wZYBnB39-xLUQ@mail.gmail.com>
Message-ID: <CAD=FV=VjTzD_Swcbuk8o20tGkkx1EtPF-CT74wZYBnB39-xLUQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm: msm: a6xx: fix gpu failure after system resume
To:     Rob Clark <robdclark@gmail.com>
Cc:     Akhil P Oommen <akhilpo@codeaurora.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        dri-devel@freedesktop.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,


On Fri, Jul 17, 2020 at 1:24 PM Rob Clark <robdclark@gmail.com> wrote:
>
> On Fri, Jul 17, 2020 at 10:39 AM Doug Anderson <dianders@chromium.org> wrote:
> >
> > Hi,
> >
> > On Fri, Jul 17, 2020 at 7:46 AM Jordan Crouse <jcrouse@codeaurora.org> wrote:
> > >
> > > On Fri, Jul 17, 2020 at 08:04:18PM +0530, Akhil P Oommen wrote:
> > > > On targets where GMU is available, GMU takes over the ownership of GX GDSC
> > > > during its initialization. So, move the refcount-get on GX PD before we
> > > > initialize the GMU. This ensures that nobody can collapse the GX GDSC
> > > > once GMU owns the GX GDSC. This patch fixes some GMU OOB errors seen
> > > > during GPU wake up during a system resume.
> > >
> > > > Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> > > > Reported-by: Matthias Kaehlcke <mka@chromium.org>
> > > > Tested-by: Matthias Kaehlcke <mka@chromium.org>
> > >
> > > The Signed-off-by needs to be at the end but I think Rob can do that for you.
> >
> > It does?  I've always been told that this is supposed to be roughly a
> > log of what happens.  In that sense you added your SoB before the
> > review/test happened so it should come before.  I know some
> > maintainers seem to do things differently but that seems to be the
> > most common.  In that sense, I think the order that Akhil has is
> > correct.  ...but, obviously, it's up to the maintainer.  ;-)
>
> yeah, I chronological order was my understanding too.. but presumably
> the Reported-by happened before the Signed-of-by (which is how I
> reordered things when applying the patch)

Doh!  Yeah, I somehow read that as Reviewed-by.  Thanks!  :-)

-Doug
