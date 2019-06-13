Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4C5E44DCB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2019 22:50:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726177AbfFMUuT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jun 2019 16:50:19 -0400
Received: from mail-vs1-f67.google.com ([209.85.217.67]:41396 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725747AbfFMUuT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jun 2019 16:50:19 -0400
Received: by mail-vs1-f67.google.com with SMTP id g24so345669vso.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2019 13:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cHWysB/jHtnOrr6FV5hr+dNnXp1M6Ks26rI+1BDvzTY=;
        b=NrkIHzxgwj712cqcmd4BWBogyg4KotNOn/xwJu4T4SJYa0aT06jZvV8tc0ubk35DGJ
         qkQ8F8BPbny84JMnl43hOf6hmviKQu5prWSr0pUE1lNR/k9KO9ZcMnCqWC2bdyf6n1ay
         Gyx/El3pEfvNT8Ar4ISdJZUL12VUpPvPEkxKv2Y4aL4BZC/d0Hpwa8kt4gSCNJD7sEhO
         OX7gQfhbqU4U0ja/6RQXALJbVbsdWjlap1t0MyjjhzSZPotS8oDzFoVuAwrCMCg9t18o
         ieUVvgeFjphrFLsTcaSlbt5XsJ+RGN+5UGR2YmWs1+9lCv7J8UMN2kblv0dBhENd17vn
         Wz2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cHWysB/jHtnOrr6FV5hr+dNnXp1M6Ks26rI+1BDvzTY=;
        b=oXdgQ/cbh1KGWICeLSlhOf/hemFvHozYGfnc/KU36z2GHR5Ti9d28Ouo818amfstI7
         cUFJvmpZNj8HBsuB9PrIBMjGLzWddSTrttjfC81JZ1n/qq5Gwo0z10d1+nPMkVexcxxu
         y1jcubKf1djosDXaOk+eEh97jLzedjLZTFUBqlskiIzqm2KzqDnf3KaKo6bDlT+LnPME
         NQqnM+qly7Xs2dHDWvPNKrch3JkW+vbPueeHx1Pmo1M1B/vM2wFvysNJIWdDsQMmzTKA
         5TIZjOinr7Zep15XpMWMHyvlor/hqQEvoy5kMsRXC41E4A3+FX/WcVKdFjiSvTJrpayj
         iH0g==
X-Gm-Message-State: APjAAAULZ4DwNnLjVvGLwy02VdZdlMZ/+HONk/Ot4sXk1zhPf01SXqMr
        tsjYOoj1JxFJUJeWjyA1v6wEwYrYrJb6tRlRUJ1yRA==
X-Google-Smtp-Source: APXvYqyxW4oWXHnQSQVdB4KZO7je6r0VKz0Ag3aK7Qp7NyWu1upUqXLN8pdjDzWPwvsOcCybbVu+WMyWVgNhK6Tk9Js=
X-Received: by 2002:a67:7a09:: with SMTP id v9mr16707518vsc.43.1560459018585;
 Thu, 13 Jun 2019 13:50:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAJkfWY50geqLZv=dnchNEGp4i1yy0QfmTSz30uL6DXJXAq3VuA@mail.gmail.com>
In-Reply-To: <CAJkfWY50geqLZv=dnchNEGp4i1yy0QfmTSz30uL6DXJXAq3VuA@mail.gmail.com>
From:   Sean Paul <sean@poorly.run>
Date:   Thu, 13 Jun 2019 16:49:43 -0400
Message-ID: <CAMavQKLFSqb7nW1UsxutbGMQ9AM_ZXTVhrdzPsN3rJXLTnyGkQ@mail.gmail.com>
Subject: Re: Cleanup of -Wunused-const-variable in drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
To:     Nathan Huckleberry <nhuck@google.com>
Cc:     Jeykumar Sankaran <jsanka@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>,
        Dave Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno@lists.freedesktop.org, clang-built-linux@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 13, 2019 at 4:13 PM Nathan Huckleberry <nhuck@google.com> wrote:
>
> Hey all,
>
> I'm looking into cleaning up ignored warnings in the kernel so we can
> remove compiler flags to ignore warnings.
>
> There are several unused variables in dpu_formats.c
> ('dpu_format_map_tile', 'dpu_format_map_p010',
> 'dpu_format_map_p010_ubwc', 'dpu_format_map_tp10_ubwc').
> They look like modifiers that were never implemented. I'd like to
> remove these variables if there are no plans moving forward to
> implement them. Otherwise I'll just leave them.

We can probably remove them for now and if someone wants to add
support, they can dredge them back up.

Sean


>
> https://github.com/ClangBuiltLinux/linux/issues/528
>
> Thanks,
> Nathan Huckleberry
