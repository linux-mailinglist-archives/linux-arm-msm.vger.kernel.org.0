Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 433691EBF39
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2020 17:43:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726750AbgFBPnR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Jun 2020 11:43:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726000AbgFBPnR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Jun 2020 11:43:17 -0400
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B252C08C5C0;
        Tue,  2 Jun 2020 08:43:17 -0700 (PDT)
Received: by mail-vs1-xe41.google.com with SMTP id r10so2270353vsa.12;
        Tue, 02 Jun 2020 08:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DYngnraAO9v6DgzTxyaGpMxNWkQ9LAzLsVZUZnOMctU=;
        b=Rih8KGyBH40LBX8n/poZKv9x/eVmj1SMH3+mvtzB7ahZBXpM5zgOl/2ZZZrpYuDWWp
         VrJEejMmZIzUOLmIWwoivs3brFbI2xHxVTdrDsbBlbr5G7rSN5pv/CU5K0PJS8Kzh8uk
         rry00PFj7iBcTa7YWVz4K5PqexXAPP6EDn7ekuYRbDjC1O8XAq0CD66pG29XOMU+Q1bM
         Z02BfsJWl5GocDb3k8jII1nKOTf+9vdgXXPLSeXNPgHysUxG0R6LQwywuPpauFCeB9sc
         QZ4soiAEvByi7k97gMxFnAM6Vnde9bkAzowzbsaTr2NORJ3UOZteslq/IzFns5zsIZY0
         BCWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DYngnraAO9v6DgzTxyaGpMxNWkQ9LAzLsVZUZnOMctU=;
        b=JomhvyBId5jbtZNjLoF5RDP1XLdZdK4YtBa5u4Oxj+3yUNVhF4m6m6OhToXeMmVb0z
         +LW9IDOwaqMhoVHUcVdgEwY52gFhuo4qgBMIxvANq9hTXc9RirSa5RgSG07hVRyzAoKp
         Qt6XMeAWwl9xFnkGP5R8Ffq9zl9qLkZtEaLgI6+dRVhx5eKDAQrBPpYDaAV+MSNSflwJ
         E3ksEQK0SjrwKu3lhEsoxrHWEZH2O9G2M4YrpW4iNg81sq3M4UFq0Z0LJL3ow+UTlG05
         KMF8EJ2F7GzOEPrWyBcKpg7nGuz5MxZxZQ7ArjPFY+MXYcUepjMoxo/xgwa8nPaRqbXp
         oH/A==
X-Gm-Message-State: AOAM533xdUpXtT9oPV3rktRe0yLKfOQNghft9eJ3jhABMq6Bt29VbvmM
        yAVF/9cUf1sALfCdjAO8rtPcl7+kgf0CdV46eFZ/Fg==
X-Google-Smtp-Source: ABdhPJzkda1ykteQq6BwLnY+Dxu+T8WkWOO2Mx3/6MCrDeWYhdFyjxNXaMlq4pyJjgaKfSkcyDdktLKjZsXYe1+o4Pg=
X-Received: by 2002:a67:b149:: with SMTP id z9mr17431445vsl.85.1591112596522;
 Tue, 02 Jun 2020 08:43:16 -0700 (PDT)
MIME-Version: 1.0
References: <1591009402-681-1-git-send-email-mkrishn@codeaurora.org>
 <CACvgo50eb5_jp_6B5tkV9cX_X2_y2Xnavu+wvUUhHN5FsV9hiw@mail.gmail.com> <cd61dd742e73b89794fc1b812d9fdcd9@codeaurora.org>
In-Reply-To: <cd61dd742e73b89794fc1b812d9fdcd9@codeaurora.org>
From:   Emil Velikov <emil.l.velikov@gmail.com>
Date:   Tue, 2 Jun 2020 16:39:58 +0100
Message-ID: <CACvgo50b+m2+onak=AZfgihkBXEP9POjMR52087v==-puLdkQQ@mail.gmail.com>
Subject: Re: [v2] drm/msm: add shutdown support for display platform_driver
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Krishna Manikandan <mkrishn@codeaurora.org>,
        ML dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno@lists.freedesktop.org,
        devicetree <devicetree@vger.kernel.org>,
        "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
        Sean Paul <seanpaul@chromium.org>, kalyan_t@codeaurora.org,
        "Kristian H . Kristensen" <hoegsberg@chromium.org>,
        mka@chromium.org, devicetree-owner@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 2 Jun 2020 at 15:49, Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> Hi Emil,
>
> On 2020-06-02 19:43, Emil Velikov wrote:
> > Hi Krishna,
> >
> > On Tue, 2 Jun 2020 at 08:17, Krishna Manikandan
> > <mkrishn@codeaurora.org> wrote:
> >>
> >> Define shutdown callback for display drm driver,
> >> so as to disable all the CRTCS when shutdown
> >> notification is received by the driver.
> >>
> >> This change will turn off the timing engine so
> >> that no display transactions are requested
> >> while mmu translations are getting disabled
> >> during reboot sequence.
> >>
> >> Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
> >>
> > AFAICT atomics is setup in msm_drm_ops::bind and shutdown in
> > msm_drm_ops::unbind.
> >
> > Are you saying that unbind never triggers? If so, then we should
> > really fix that instead, since this patch seems more like a
> > workaround.
> >
>
> Which path do you suppose that the unbind should be called from, remove
> callback? Here we are talking about the drivers which are builtin, where
> remove callbacks are not called from the driver core during
> reboot/shutdown,
> instead shutdown callbacks are called which needs to be defined in order
> to
> trigger unbind. So AFAICS there is nothing to be fixed.
>
Interesting - in drm effectively only drm panels implement .shutdown.
So my naive assumption was that .remove was used implicitly by core,
as part of the shutdown process. Yet that's not the case, so it seems
that many drivers could use some fixes.

Then again, that's an existing problem which is irrelevant for msm.
-Emil
