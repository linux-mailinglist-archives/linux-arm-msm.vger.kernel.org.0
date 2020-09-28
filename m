Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24A9D27B644
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Sep 2020 22:29:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726565AbgI1U3N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Sep 2020 16:29:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726500AbgI1U3N (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Sep 2020 16:29:13 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED840C061755;
        Mon, 28 Sep 2020 13:29:12 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id s13so2381688wmh.4;
        Mon, 28 Sep 2020 13:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=Q0lp3rLeok0/LIdGZMtUWTk4DBwvlYpBiYMCH4mTDmo=;
        b=Fhf3QkDEZWbN0+nOjdtpyln7D1G4Eg0gOZ0V85gztOZtw3D4HokakiOvkEHSt2DMQ9
         J4imFtjqxjsawJ/oK8B0CHI391+yBig73WrUDicb1lskeeQBw+AzTAvKZ3QM4G5hs8ks
         PfD5Y7VpmAqKVcxEGGMJxSxyjwXIDcAkxfR1RixzNXhz5ksJkWGPAzILXJTIuK8ikvV6
         Lm30bFHamzfANT8UXmgF1hAax5msCyr1et6izPYswrgqZt9loWONpYuiZBn1EtysnitB
         6cR4cwNeXksQcZfqIsrHdAA5ZKpBVJgty5VnsbOhGggfMPg+7wNt50dapZtA6I0F6diC
         fagQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=Q0lp3rLeok0/LIdGZMtUWTk4DBwvlYpBiYMCH4mTDmo=;
        b=K64YMXTIYNCAC885+wXeHll+0UrJ16ImneIyZtSHde3OzgzBTT9pglKAbkOSKoIJXj
         G0m3mDVQNW1BsFt3NPwJxM9u1n3c58mJ8eUZKeJduTwrz/ZI4t3jD9iBO4+Ro/xeYeR3
         +f77qsXmA8nFuNS3qrN+W6JDIMoHi5b6Xo5dao/6BqgXK3lt5YYo7LLtE/c1/+bYuvOh
         z64nJ6n7T0DS/qm6tIs8wITSUUpT/x9otwm7fU+XVMepjm6wdDHlzhlMsdTdFBd84RWy
         kVKRMMHh33SKctK4Hay6fbgPgePSjhYINC4JiH1HUJ5MX9nlkUqO5Sg/JrtMtHN5bYsb
         CWXg==
X-Gm-Message-State: AOAM530B/gPK7PTkIIAlWBYY2r2w15L+yaR+gFIsMxdnNGV3Lenk8Eds
        0cUTvhfTUJIv72i3ZyQhhQHapw7rVlI1N3ohTI8=
X-Google-Smtp-Source: ABdhPJyksvtNI+Mg0NDn1Hk0jA3e3slOwaUrbYwi4zR1ZbqKf/he+sN9D9+vk5PIDwTYGc5l0l2sKw9NOq2Iwl1J0xk=
X-Received: by 2002:a1c:5988:: with SMTP id n130mr910267wmb.95.1601324951481;
 Mon, 28 Sep 2020 13:29:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200926125146.12859-1-kholk11@gmail.com> <20200926125146.12859-6-kholk11@gmail.com>
 <20200928161546.GB29832@jcrouse1-lnx.qualcomm.com>
In-Reply-To: <20200928161546.GB29832@jcrouse1-lnx.qualcomm.com>
From:   AngeloGioacchino Del Regno <kholk11@gmail.com>
Date:   Mon, 28 Sep 2020 22:29:00 +0200
Message-ID: <CAK7fi1Z8uVRE+HRUSTz8bdDS5hYXaH8=D8KDUz+7mGs-H-TGpw@mail.gmail.com>
Subject: Re: [PATCH 5/7] drm/msm/a5xx: Fix VPC protect value in gpu_write()
To:     AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Dave Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, konradybcio@gmail.com,
        marijns95@gmail.com, martin.botka1@gmail.com,
        MSM <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Il giorno lun 28 set 2020 alle ore 18:16 Jordan Crouse
<jcrouse@codeaurora.org> ha scritto:
>
> On Sat, Sep 26, 2020 at 02:51:44PM +0200, kholk11@gmail.com wrote:
> > From: Konrad Dybcio <konradybcio@gmail.com>
> >
> > The upstream API for some reason uses logbase2 instead of
> > just passing the argument as-is, whereas downstream CAF
> > kernel does the latter.
> >
> > Hence, a mistake has been made when porting:
> > 4 is the value that's supposed to be passed, but
> > log2(4) = 2. Changing the value to 16 (= 2^4) fixes
> > the issue.
>
> FWIW I think downstream is wrong. Its a lot more intuitive to pass the number of
> registers that should be protected than to force a human to do math.
>
> Jordan
>
Uhm, actually, it's upstream the one forcing to do math... :P
In any case, downstream you have some calls with an explicit log2 and
some others with the "real" number of registers.

Hardware magic register layouts, maybe.... :)))

-- Angelo

> > Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
> > Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
> > ---
> >  drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> > index 00df5de3c8e3..b2670af638a3 100644
> > --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> > @@ -789,7 +789,7 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
> >
> >       /* VPC */
> >       gpu_write(gpu, REG_A5XX_CP_PROTECT(14), ADRENO_PROTECT_RW(0xE68, 8));
> > -     gpu_write(gpu, REG_A5XX_CP_PROTECT(15), ADRENO_PROTECT_RW(0xE70, 4));
> > +     gpu_write(gpu, REG_A5XX_CP_PROTECT(15), ADRENO_PROTECT_RW(0xE70, 16));
> >
> >       /* UCHE */
> >       gpu_write(gpu, REG_A5XX_CP_PROTECT(16), ADRENO_PROTECT_RW(0xE80, 16));
> > --
> > 2.28.0
> >
>
> --
> The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> a Linux Foundation Collaborative Project
