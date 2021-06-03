Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0D1139A5D2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jun 2021 18:34:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229786AbhFCQgd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Jun 2021 12:36:33 -0400
Received: from mail-qt1-f178.google.com ([209.85.160.178]:33426 "EHLO
        mail-qt1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229695AbhFCQgd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Jun 2021 12:36:33 -0400
Received: by mail-qt1-f178.google.com with SMTP id a15so4858608qta.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Jun 2021 09:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7DZmud8/NtbG9baAZHHVlQy45tmMkpb0U+jSSBeyr0o=;
        b=OJtnsUj+NU3k9eUbaBLoZa3VTWFwShEc8qClgbcAydu3jpRLmFZvXo0S0GFkNEQI5m
         70zGDVy/c/F2SXrvYFzqUe9QI0Q0gdpfzp+YNtkvGdfH2q+gQoAYI1E8UDgPJ2lCKjsO
         kfdvL4JeF8H4G+Mov9iBsP3ybfNhm3/gfInNTTwBWY9AJRuCGrg6Eh/BBTy5T/m+n4V5
         dNe5UALRYPNlKYm63n6ONLLrp4eWKqEymkPfl5A4UF0ilQ9HcROTNbMPeHdb39D9NcZq
         ynWs1/W9Hwkrtco0K4VU3Or/HcFjgj4YwiGGBpMIIMvf5GXxGf0y3bgpj5rOZ7gTNgSo
         t9nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7DZmud8/NtbG9baAZHHVlQy45tmMkpb0U+jSSBeyr0o=;
        b=HHrzOvOUln7NqLMc7ja7ATnacbtRBopkRVRw3lb9BGd1q45ced80w+puH3KrSKxaiD
         T2pbr1gZwqr3+AGQpHA746vRwaELOQss4jWmgREYjvG7vxQ8joG6LM5j0sMuLCmn3dvz
         pwl09Jl8UHVMZOqFILBdA8bkjz0qzeCbyPD6yeGjGkUBTQHAR3c2lf/40fPBAZWqR6RT
         VPuI5bjGaOyYKRwmcgsDALcU2M4AwSvw17ZW/nkcS5dVXZSTi4/PsUpGDT9KEGkmptrB
         dtfyLMo2lf6exuHNlvSkYKYbz9hvnKuv2XjjH6MbcxrE5pIfGTB47INxV1shS5uJsSAS
         8Jvg==
X-Gm-Message-State: AOAM531Lh/a124QSGIJFPR+h3WhDzSR0mwYmBsTadN7uptj2MKWjwHow
        ZRNAHS1zqAZOQrmP4/JP639AjYlexu9xve8Xn30BYA==
X-Google-Smtp-Source: ABdhPJzeujnPaoppD4L3W7TKyoCjppbsv+WDwxb4a7/akyjuJiDJQcS4p674wBCDV3Vht6awFUTQcfFmk6ji0AGwTas=
X-Received: by 2002:ac8:6b08:: with SMTP id w8mr335813qts.364.1622738028536;
 Thu, 03 Jun 2021 09:33:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210529002508.3839467-1-dmitry.baryshkov@linaro.org>
 <20210529002508.3839467-6-dmitry.baryshkov@linaro.org> <CAF6AEGsoUET_=P1YkAKb7GMRyrZV5_jmGeMHZhB1u4uE9m7B9A@mail.gmail.com>
In-Reply-To: <CAF6AEGsoUET_=P1YkAKb7GMRyrZV5_jmGeMHZhB1u4uE9m7B9A@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 3 Jun 2021 19:33:37 +0300
Message-ID: <CAA8EJpqkrkYF=DW46PWB=0huB9U6e2QqXjJv532f0PyDCC-eXA@mail.gmail.com>
Subject: Re: [RFC 5/8] lib: add small API for handling register snapshots
To:     Rob Clark <robdclark@gmail.com>
Cc:     Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 3 Jun 2021 at 17:41, Rob Clark <robdclark@gmail.com> wrote:
>
> On Fri, May 28, 2021 at 5:25 PM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > Add small API covering lists of register dumps. Currently this is a part
> > of MSM DRM driver, but is extracted as it might be usefull to other
> > drivers too.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  include/linux/dump_state.h | 78 ++++++++++++++++++++++++++++++++++++++
> >  lib/Kconfig                |  3 ++
> >  lib/Makefile               |  1 +
> >  lib/dump_state.c           | 51 +++++++++++++++++++++++++
> >  4 files changed, 133 insertions(+)
> >  create mode 100644 include/linux/dump_state.h
> >  create mode 100644 lib/dump_state.c
> >
> [snip]
> > diff --git a/lib/dump_state.c b/lib/dump_state.c
> > new file mode 100644
> > index 000000000000..58d88be65c0a
> > --- /dev/null
> > +++ b/lib/dump_state.c
> > @@ -0,0 +1,51 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Copyright (c) 2020-2021, The Linux Foundation. All rights reserved.
> > + * Copyright (c) 2021, Linaro Ltd
> > + */
> > +
> > +#include <linux/dump_state.h>
> > +#include <linux/slab.h>
> > +
> > +void dump_state_free_blocks(struct dump_state *state)
> > +{
> > +       struct dump_state_block *block, *tmp;
> > +
> > +       list_for_each_entry_safe(block, tmp, &state->blocks, node) {
> > +               list_del(&block->node);
> > +               kfree(block);
> > +       }
> > +}
> > +EXPORT_SYMBOL(dump_state_free_blocks);
>
> nit, perhaps EXPORT_SYMBOL_GPL()?

I don't really care. What is the current recommendation?

>
> BR,
> -R
>
> > +
> > +struct dump_state_block *dump_state_allocate_block_va(void __iomem *base_addr, size_t len, gfp_t gfp, const char *fmt, va_list args)
> > +{
> > +       struct dump_state_block *block = kzalloc(sizeof(*block) + len, gfp);
> > +
> > +       if (!block)
> > +               return ERR_PTR(-ENOMEM);
> > +
> > +       vsnprintf(block->name, sizeof(block->name), fmt, args);
> > +
> > +       INIT_LIST_HEAD(&block->node);
> > +       block->size = len;
> > +       block->base_addr = base_addr;
> > +
> > +       return block;
> > +}
> > +EXPORT_SYMBOL(dump_state_allocate_block);
> > +
> > +struct dump_state_block *dump_state_allocate_block(void __iomem *base_addr, size_t len, gfp_t gfp, const char *fmt, ...)
> > +{
> > +       struct dump_state_block *block;
> > +       va_list va;
> > +
> > +       va_start(va, fmt);
> > +
> > +       block = dump_state_allocate_block_va(base_addr, len, gfp, fmt, va);
> > +
> > +       va_end(va);
> > +
> > +       return block;
> > +}
> > +EXPORT_SYMBOL(dump_state_allocate_block_va);
> > --
> > 2.30.2
> >



-- 
With best wishes
Dmitry
