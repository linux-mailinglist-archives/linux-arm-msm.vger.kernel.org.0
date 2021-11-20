Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC81E457FF5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Nov 2021 19:03:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237800AbhKTSGJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 20 Nov 2021 13:06:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbhKTSGI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 20 Nov 2021 13:06:08 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D273AC061574;
        Sat, 20 Nov 2021 10:03:04 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id a9so24156979wrr.8;
        Sat, 20 Nov 2021 10:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h+uDZ8B0+FIrUaufpROus9M3fzWHj1TqAl6ALRsgs/E=;
        b=Q6CcTalyhJMl2dU/MAJyRRlblfIlEttDPBMil8TaLI4h7opkrbYU5tzyoXt1F0ZrHY
         o+Lz9MruepobD7dYWDgnj1BPPsY7L6VtnjiXonzpU5khi3onjforwR5JZ+hnS63yuXwo
         xMe1IdyqZQHrQUW3uSlrw9Zp3G+C8KKcF7vXfTWhiLduh1vbq/8nu5iiK8dN9h/7Vz79
         3+/Kh47F7V8utZJTPPokfjUYtw3zbMXSpzn9A0GoI00r74BEpSEHpBwli543CMQkoC6L
         JhZigBri8wRRz487LTX/+PKbAMP8pzNfjs9NBcGrtsvzYVQ/4byKleJqKdmzmNaHHlux
         obEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h+uDZ8B0+FIrUaufpROus9M3fzWHj1TqAl6ALRsgs/E=;
        b=0h4yognnneYBLn/we4WCbIhBdYcQ3HnZprr35xiip7akxZp1Ma6Cp9tZwSco3lVIi9
         sxmw0SvPgS+UM+XUK/pweVcZZOaZR07KD+w/eZyJ+AaTD4ZiBa7JNb4sCu6mlCZPVplG
         p0cKWVqtGWg86ajkKuH0+MgYKbX+urqfOjhtlX4CyAuEhhKU+u+lEkVA9lkjgc+ysiQE
         87GbTP97R0bQa22Hs3ljeo/xKizAymWPnd74NCRUeXz2c7v/YI3NA3D3VYOpGuQx40Dh
         eVUv0osaXbOwPRPCLmFoTrIioS+UI78CI2YKsUole4pO93ycul0uBvgU/oO2Jy2JIuP8
         NLTg==
X-Gm-Message-State: AOAM5319AYWf7JEY9zUBvlbcZlYQcG/4XGjpQ7QLOTocNP0YmHEhGTE9
        dOZ3OPX5o3kyEWsLVTehjslOc6Sh1dOHilKTaCTvM9tb
X-Google-Smtp-Source: ABdhPJwwyY+STeb0nl/i0vQ3mmaky2ZZuZ4AgHjsdhPpIv2/FoV9tz401ElWhB2WZA0pL56egYeBhMACEWBqwxbnln8=
X-Received: by 2002:a05:6000:1862:: with SMTP id d2mr19504472wri.251.1637431383136;
 Sat, 20 Nov 2021 10:03:03 -0800 (PST)
MIME-Version: 1.0
References: <20211119225157.984706-1-robdclark@gmail.com> <20211119225157.984706-2-robdclark@gmail.com>
 <CAD=FV=UraStftJyUDHp5=iKoh4tnCQiTgBZJBNF3-q=HDZUPZw@mail.gmail.com>
In-Reply-To: <CAD=FV=UraStftJyUDHp5=iKoh4tnCQiTgBZJBNF3-q=HDZUPZw@mail.gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Sat, 20 Nov 2021 10:08:07 -0800
Message-ID: <CAF6AEGvU7nbdbKCRcXUEnrWmp7xJfSJxmwzQP2LwW_UzuS0Zjw@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/msm/gpu: Respect PM QoS constraints
To:     Doug Anderson <dianders@chromium.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Nov 19, 2021 at 4:21 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Fri, Nov 19, 2021 at 2:47 PM Rob Clark <robdclark@gmail.com> wrote:
> >
> > +void msm_devfreq_boost(struct msm_gpu *gpu, unsigned factor)
> > +{
> > +       struct msm_gpu_devfreq *df = &gpu->devfreq;
> > +       unsigned long freq;
> > +
> > +       freq = get_freq(gpu);
> > +       freq *= factor;
> > +       freq /= HZ_PER_KHZ;
>
> Should it do the divide first? I don't know for sure, but it feels
> like GPU frequency could conceivably be near-ish the u32 overflow? (~4
> GHz). Better to be safe and do the / 1000 first?
>

It looks like on 8998 we have some GPU OPPs that are not integer # of
KHz.. although that would not change the integer math result unless
factor > 10.

We are a bit aways for 32b overflow (highest freq for current things
is 825MHz, but I guess we could see things closer to 1GHz in the
future.. generally GPUs aren't clocked nearly as high as CPUs.. slow
but wide, and all that).. but maybe this should just be 64b math
instead to be safe?

>
> > @@ -201,26 +217,14 @@ static void msm_devfreq_idle_work(struct kthread_work *work)
> >         struct msm_gpu_devfreq *df = container_of(work,
> >                         struct msm_gpu_devfreq, idle_work.work);
> >         struct msm_gpu *gpu = container_of(df, struct msm_gpu, devfreq);
> > -       unsigned long idle_freq, target_freq = 0;
> >
> >         if (!df->devfreq)
> >                 return;
>
> Why does the msm_devfreq_idle_work() need a check for "!df->devfreq"
> but the boost work doesn't? Maybe you don't need it anymore now that
> you're not reaching into the mutex? ...or maybe the boost work does
> need it?
>
> ...and if "df->devfreq" is NULL then doesn't it mean that
> msm_hrtimer_work_init() was never called? That seems bad...

Looks like 658f4c829688 ("drm/msm/devfreq: Add 1ms delay before
clamping freq") was badly rebased on top of efb8a170a367 ("drm/msm:
Fix devfreq NULL pointer dereference on a3xx").. I'll send a separate
patch to fix that

BR,
-R
