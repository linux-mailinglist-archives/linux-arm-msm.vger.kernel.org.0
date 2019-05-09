Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 575E51901D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2019 20:22:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726658AbfEISWG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 May 2019 14:22:06 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:38583 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726661AbfEISWG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 May 2019 14:22:06 -0400
Received: by mail-ed1-f67.google.com with SMTP id w11so2880013edl.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 May 2019 11:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eJPh04YzT4O3RclBatzvmypCrnIuBZLLqFoFXlr0M40=;
        b=VH2PqHUG0qRA6uN/oKzzrV88ZMYOyQfGn1Y8aD0Vto/L0+w7gc2P4icPbBdKXejCnP
         ix63htD2lOlDA6LBNT3WyBGHKuP/laNWXcpf4A4sWYWDSripyHNTvzPlKmT5jjtY+SXm
         Rv2OyKaayMl8PwHnC9b5uBayvHs4lWAUBAFInPZREFKY5wpFkRJsYAh0KxABnx6JNWLx
         ffCdIjrd4XeSrfPVfMQKJujnl+8drqsm0q6qNXv3pejXWXb85wUy73jIWTt3sMENVAD3
         coHg6ykdbMVxs3tyfz93kZdulmjwe9F4fmQDKwJkkOfJedaCnVPw5eEKUNIvKWZon7B4
         uyuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eJPh04YzT4O3RclBatzvmypCrnIuBZLLqFoFXlr0M40=;
        b=V/wVuanBLNtl7xjAfxlXPB8hsf06QZYVDhRWpn9gOw3RPW1LUui6WFqgagPSn/li92
         PUmxMH4zkg8EgUnZEJJefmsJ3zDG3HHkI7SdKRjwYYptOXEAw7x7Lrjcw8mZCs0irl7+
         e/I1HK/FxF4xFtFJEaIqNNYjLYi/w7WGcegM8CQjBvYXhcj4BsN5UZXYzFx7j1S0LO12
         rDdyWeWpqKbcfxRnx3PdT7Vd0l69JHi3519sunmwCywYWcc5lVRM9qoaZbBs3Kt+j/9a
         LZEzb9KScmb7Ilo/OYyWzP5h2Oa/5GAGwOHa9TC9ErTHU5KJljXzzSSP0+yVOiYjoXEt
         hjBw==
X-Gm-Message-State: APjAAAV5T9THhBTXcGJvt27GVZW/UsgoOy9/4zSbuto8nrI+n+2MyOJa
        0DTZdG3ZinxcVGG+kjDT3wsVr1Tk92Yin6QX2Ow97GpH
X-Google-Smtp-Source: APXvYqz35NytvoCYC7jax9RgD2nvLMbkAfxsLvqb2irLbJH3rkd7UsNpw7p9z0yGoeezaVRswwXs1UUYT1Hq3CtvsCA=
X-Received: by 2002:a17:906:c456:: with SMTP id ck22mr4651394ejb.113.1557426124389;
 Thu, 09 May 2019 11:22:04 -0700 (PDT)
MIME-Version: 1.0
References: <1557252127-11145-1-git-send-email-jcrouse@codeaurora.org>
 <1557252127-11145-3-git-send-email-jcrouse@codeaurora.org> <cdf42319-b64c-4455-c6e1-94a9420a2da8@free.fr>
In-Reply-To: <cdf42319-b64c-4455-c6e1-94a9420a2da8@free.fr>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 9 May 2019 11:21:55 -0700
Message-ID: <CAF6AEGuut5VfmzuaPTSrx7jSqnALFQ9GCrmK5S4kuM6JwuL3Dw@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] drm/msm: Print all 64 bits of the faulting IOMMU address
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc:     Jordan Crouse <jcrouse@codeaurora.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, May 9, 2019 at 9:06 AM Marc Gonzalez <marc.w.gonzalez@free.fr> wrote:
>
> On 07/05/2019 20:02, Jordan Crouse wrote:
>
> > When we move to 64 bit addressing for a5xx and a6xx targets we will start
> > seeing pagefaults at larger addresses so format them appropriately in the
> > log message for easier debugging.
> >
> > Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> > ---
> >
> >  drivers/gpu/drm/msm/msm_iommu.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
> > index 12bb54c..1926329 100644
> > --- a/drivers/gpu/drm/msm/msm_iommu.c
> > +++ b/drivers/gpu/drm/msm/msm_iommu.c
> > @@ -30,7 +30,7 @@ static int msm_fault_handler(struct iommu_domain *domain, struct device *dev,
> >       struct msm_iommu *iommu = arg;
> >       if (iommu->base.handler)
> >               return iommu->base.handler(iommu->base.arg, iova, flags);
> > -     pr_warn_ratelimited("*** fault: iova=%08lx, flags=%d\n", iova, flags);
> > +     pr_warn_ratelimited("*** fault: iova=%16lx, flags=%d\n", iova, flags);
>
> Why no leading 0 for 64-bit numbers?
>
> Will 32-bit platforms always get 8 useless characters?
>

well, they should be 0's, rather than garbage, if that was the
question.  I'm not sure how many hoops it is worth jumping thru to
handle the diff between 32b GPU (<= a4xx) and 64b (>= a5xx).  Even on
newer devices, the display is still 32b iova.

I guess this is *mostly* useful for debugging mesa (or at least I
guess I'm the one who triggers the most iommu faults).. so maybe not
worth caring about?

BR,
-R
