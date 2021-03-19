Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4057C341BFC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Mar 2021 13:10:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229756AbhCSMJy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Mar 2021 08:09:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229638AbhCSMJe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Mar 2021 08:09:34 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DE62C06174A
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Mar 2021 05:09:34 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id u20so11618625lja.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Mar 2021 05:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=18bTTO0LtwICbrkP34GrvIGuHznNwuNg3xqUSgF99tc=;
        b=krXIlNUaCpuROQ+GF9uP7tqYm/TKa59pFpDaW/tG31pw1/nGkFVZAc3/LYKvmDZ7Co
         tO8cxGx7i+5PlvhSjOEanYzOwdNjV8xGxat+4GByGCL1EtpbtVtyYTE+BrAcmeoSaOms
         SAp7cEEmP7VW6/oSZHeEjUScKXb4qoiZmfX2H18JilsWyku5VuNip+Di6vLeveciIoNV
         jnEGraLrnrJ5GZqlm6HXgXcitKt457x/qxUYPjupiUPUrghRn8UrHkhcMuc8qynYgfoB
         c/gqZDTzq/QkWdR+nl2BrUNbZ373+xl/em9glkMdb3N92Eh+Bo1C6x7/OQO4QzbnrSWd
         fBTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=18bTTO0LtwICbrkP34GrvIGuHznNwuNg3xqUSgF99tc=;
        b=MI1+bRgnCZ0g4+Gyf7h3TDdFRDEP6opqDXf7HutPDZ3ZLNZmNuwUJ2ZYUETSTM5WFg
         Zgn5nxky0udnX/dYMhmFc3bK6mExKZDkV0i0mgYsTfKOthuZk6LnrlHb72Qc7m+Bt4vW
         saTYaN0Jc8710ycLYCP7/UCzvRGDvC5U+XtL3yMmnDhlOhoTHbBkIa4qP3A4FK09LnGP
         IrTeXgX6d8aFEX6qqqqZ34Nbna+JOvYyWZVTGDdCCxoNATHaMu+L5xlO3cawQdoJLuFo
         kY/QsY2TcBEVanCDjoHWVbEUgfl2OgeJ478QYTAmepbk3pbiQto9JlTnC8LY+7lSDX2D
         1rIQ==
X-Gm-Message-State: AOAM5326ykMydYIPRZKwfGcYEcbmrY4KwrhTLQb9PuhRkSAelRboligD
        zLHIe1KW44s+nqQPqPcMxZWmKM0D6BlxxKF8w7Y=
X-Google-Smtp-Source: ABdhPJxAMl+1VGuVaz1i/a22x+BQXeUsFJPe7kkmKAow3hjInbsN2y19OX/Bcwo8apqd7Ifvp0zVlbHNol4cukHZnXw=
X-Received: by 2002:a2e:9a0c:: with SMTP id o12mr701936lji.121.1616155772644;
 Fri, 19 Mar 2021 05:09:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210301214152.1805737-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20210301214152.1805737-1-dmitry.baryshkov@linaro.org>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Fri, 19 Mar 2021 09:09:21 -0300
Message-ID: <CAOMZO5Br85sf+ndiOWzeG7DgpqVHpXtnNGZLsVMOpBC5eVE2Aw@mail.gmail.com>
Subject: Re: [PATCH] gpu/drm/msm: fix shutdown hook in case GPU components
 failed to bind
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        DRI mailing list <dri-devel@lists.freedesktop.org>,
        David Airlie <airlied@linux.ie>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dmitry,

On Mon, Mar 1, 2021 at 6:41 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:

> diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
> index 6a326761dc4a..2fd0cf6421ad 100644
> --- a/drivers/gpu/drm/msm/msm_atomic.c
> +++ b/drivers/gpu/drm/msm/msm_atomic.c
> @@ -207,7 +207,12 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
>         struct msm_kms *kms = priv->kms;
>         struct drm_crtc *async_crtc = NULL;
>         unsigned crtc_mask = get_crtc_mask(state);
> -       bool async = kms->funcs->vsync_time &&
> +       bool async;
> +
> +       if (!kms)
> +               return;
> +
> +       async = kms->funcs->vsync_time &&
>                         can_do_async(state, &async_crtc);

I also see the same issue on a i.MX53:
https://lists.freedesktop.org/archives/freedreno/2021-January/009369.html

Then I got a different suggestion from Rob. Please check:

https://www.spinics.net/lists/dri-devel/msg286648.html
and
https://www.spinics.net/lists/dri-devel/msg286649.html

Does this series fix the issue in your platform too?
