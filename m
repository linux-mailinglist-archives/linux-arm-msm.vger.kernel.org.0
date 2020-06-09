Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C82A1F4793
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2020 21:53:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732192AbgFITxQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Jun 2020 15:53:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732181AbgFITxN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Jun 2020 15:53:13 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80FC5C05BD1E
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2020 12:53:12 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id r125so22934lff.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2020 12:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tUWfuhibOgc2qDuR8j6PZRsitIEa5AgrV8pmEG0P02Y=;
        b=sK+8RlDjikgHEuA3/kcxNekFgXz3Mu5DR09v16l8o+7xRQjax6TDincVJct+FsWt0/
         IncvasH0MP32OvvhlGAjndRmYWzo/PA5Vt7aikyqeE2WCYB9RbkWH09rczh6i8LwgOEF
         oR0AfEzkVg3A8q5iWCLYhVtz6dADYE/m8058DSVyr6w6Voc6edxVj1IPARx5HoawvfIz
         8BUoMJfqmOh/nHtady0/cPmbRrLwAqGbdozHp1gXUvKYiXoiPMh0ZMuj51TFU+bbkj/o
         Zfmkk9VrVGZ9k5fKv7JZnnLg33MBw5eaPWctnqDHeFnmUtNWwUaH1rIcIPYUsXcvXD9/
         el9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tUWfuhibOgc2qDuR8j6PZRsitIEa5AgrV8pmEG0P02Y=;
        b=Qj8vzES7l0cTKBkYLAavLYYOYItXUx0EzQZUpZbFwGxjkA8Z8fsLfV20D8WHqDnHEp
         f6vaQBWcw2sEwtRupzBZrRHuutU4J9APKCYD7TTsVcSMKYe3/Izh7LMnK6TQlmQJyWNw
         CoM3KbEnHhn4T+F6M6d12lgmwjapTqy7sWg2npnuqunrpMXfgRAhdRGdbFJVefCyxFJd
         x0zTAscmOkyXfTfe6ege/iVS7Dy7XvQOzXo/zYXIKHYRrarqM+5CftQ9QsIS6T7PL5SO
         9o0qYOkuKCqM2IWcfqixAVkPlfPPY+AFkGa+Dkt/YmbVmpMqiHTc9mNoW2aZuxqzLk9t
         YSYw==
X-Gm-Message-State: AOAM531pRNKYpqC2U8R3p2GgzbtupDJwuRRqQYyBG9Nu32qJPZnSP1pL
        oJYK2ZCNOUOmtLBc2fGBoDgGhb2BJs1PtAfUKxXkhQ==
X-Google-Smtp-Source: ABdhPJwe80eLeSB161s6pLsJ9M/dSqM3rMPgLB0OQVvgMZYcddUazRxjNwbPDc8UxolcwAuZqNy8k+4V9D3RHC/fBus=
X-Received: by 2002:ac2:4823:: with SMTP id 3mr16162946lft.194.1591732390917;
 Tue, 09 Jun 2020 12:53:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200408191458.1260397-1-arnd@arndb.de> <CACRpkdYQJocN_-i07J0fFC16pDUfb9o0mzRF0YRO8UMrE=Suxw@mail.gmail.com>
 <CACRpkdYUTujUX7FdwFjehFVAOLz_w6epXRzYc8e8yB=zDsRCyw@mail.gmail.com> <CAJs_Fx4V9JkwATGeY8eV=Z1khr6z=OVd+B=YRJ1RY7xxxM47_Q@mail.gmail.com>
In-Reply-To: <CAJs_Fx4V9JkwATGeY8eV=Z1khr6z=OVd+B=YRJ1RY7xxxM47_Q@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 9 Jun 2020 21:53:00 +0200
Message-ID: <CACRpkdadv9+Lu7f9uRibhdnd41rX2n_H7AUSzmXc_Dn_EYs1eA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: fix link error without CONFIG_DEBUG_FS
To:     Rob Clark <robdclark@chromium.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        "Kristian H. Kristensen" <hoegsberg@gmail.com>,
        Allison Randal <allison@lohutok.net>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jun 9, 2020 at 4:04 PM Rob Clark <robdclark@chromium.org> wrote:
> On Tue, Jun 9, 2020 at 5:48 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> > On Tue, May 5, 2020 at 10:27 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> > > On Wed, Apr 8, 2020 at 9:15 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > >
> > > > I ran into a randconfig link error with debugfs disabled:
> > > >
> > > > arm-linux-gnueabi-ld:
> > > > drivers/gpu/drm/msm/msm_gpu.o: in function `should_dump': msm_gpu.c:(.text+0x1cc): undefined reference to `rd_full'
> > > >
> > > > Change the helper to only look at this variable if debugfs is present.
> > > >
> > > > Fixes: e515af8d4a6f ("drm/msm: devcoredump should dump MSM_SUBMIT_BO_DUMP buffers")
> > > > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > >
> > > This fixes a compilation error for me on the APQ8060.
> > > Tested-by: Linus Walleij <linus.walleij@linaro.org>
> >
> > Could someone be so kind and apply this fix to the MSM DRM tree?
> >
>
> This should be fixed by 20aebe83698feb107d5a66b6cfd1d54459ccdfcf in
> msm-next/drm-next, are you still seeing this issue?

Oh nice this works too, I was just rebasing my trees and the patch was still
there, of course I didn't see that anothe patch fixed the same issue already.

Thanks Rob!

Linus Walleij
