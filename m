Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FC6739FCFF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jun 2021 19:02:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233533AbhFHRD7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Jun 2021 13:03:59 -0400
Received: from mail-wr1-f54.google.com ([209.85.221.54]:46839 "EHLO
        mail-wr1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231261AbhFHRD7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Jun 2021 13:03:59 -0400
Received: by mail-wr1-f54.google.com with SMTP id a11so20493803wrt.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jun 2021 10:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Im5P/QCWaWuF664a1UIlJ1Y+ySq7OGimr9hjjiznKJU=;
        b=m02ub/+oJjSbIpgy34CK+ZPFcS2gXnED5LUKcWyfaHGn9mkTpliOC30WbHpz7D/o3M
         exr/W6vU7+XeWJjJWv567ZnEZh/8Gc3IBcjU9GkqomhgMtWqLRVLGO07XoQfan8IhAhr
         rT4ooLG94sb/tgMh7ldTHuiZyAPGdfwxeewpyER+XLsV0WHB6rjWTV7i12aBk51QKOVs
         0whsxylIvCefkSGtZYAYxtegWH5XRtkzEaAVvZGQpd9SiHab8Ghpc7BIhYhsXtWpBEi1
         PCiJ43neWSeLHQS7g8sFGUsBaKRNeKmU225VvvWJz1TmKiE64DmjmVtbPoIrsRUwyYRW
         fQNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Im5P/QCWaWuF664a1UIlJ1Y+ySq7OGimr9hjjiznKJU=;
        b=NaqewmjqJFEgn+J9afATcRFmAJYoPOQ4bpBr7mQE882xyR2zrmi6AYcQWjI+WNqjiZ
         dpq/iinfC4xvMqc7PyLRtEi+8Uik6s4ZDofZN7imxEsenxhxF0Zpu7KcxP0sZGvLO3LL
         +wTIqVEm0W3ubHoBZDmQiiwaq3IyG0iV/ofKhNbwQ2xIqYKN6/KWc96e+nfz1xOeRwrS
         2tfETAOZLVvwDLuhxrAG1jZnXC3RmVDGDTUyFfKwVMlAwjLIoBUZ+pDT2BeUF2JvOLIS
         r9HEen2HFpLbkqF4vBnw3pb5Udlm+XGdVO9a1c6cPfTW+nr2e9Idnp2BoQQP8hQ0TuYN
         LTwA==
X-Gm-Message-State: AOAM5318csBwrWBZVRSjkzFOvV/WLySL7tkw4ZZrEVwjRqBTN+ZY3B+r
        0dyXVmcASjyNXDvnRJB42o/yRY3n1nN6xfYziHw=
X-Google-Smtp-Source: ABdhPJy9d1NDFKEHkyMxClSAHm844rimo5epL8i+sQpQnUYEKdksEOvpAHmFCpp6tGuXueQ7mHv36SBNH5iIZLrmYoI=
X-Received: by 2002:adf:eed2:: with SMTP id a18mr23464179wrp.147.1623171652813;
 Tue, 08 Jun 2021 10:00:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210529002508.3839467-1-dmitry.baryshkov@linaro.org>
 <20210529002508.3839467-6-dmitry.baryshkov@linaro.org> <CAF6AEGsoUET_=P1YkAKb7GMRyrZV5_jmGeMHZhB1u4uE9m7B9A@mail.gmail.com>
 <CAA8EJpqkrkYF=DW46PWB=0huB9U6e2QqXjJv532f0PyDCC-eXA@mail.gmail.com>
In-Reply-To: <CAA8EJpqkrkYF=DW46PWB=0huB9U6e2QqXjJv532f0PyDCC-eXA@mail.gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 8 Jun 2021 10:04:46 -0700
Message-ID: <CAF6AEGubTbNs4S5=Bzyrve-nM98FydtDpXmWK7eZFeAZaCKYFQ@mail.gmail.com>
Subject: Re: [RFC 5/8] lib: add small API for handling register snapshots
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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

On Thu, Jun 3, 2021 at 9:33 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Thu, 3 Jun 2021 at 17:41, Rob Clark <robdclark@gmail.com> wrote:
> >
> > On Fri, May 28, 2021 at 5:25 PM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > >
> > > Add small API covering lists of register dumps. Currently this is a part
> > > of MSM DRM driver, but is extracted as it might be usefull to other
> > > drivers too.
> > >
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > >  include/linux/dump_state.h | 78 ++++++++++++++++++++++++++++++++++++++
> > >  lib/Kconfig                |  3 ++
> > >  lib/Makefile               |  1 +
> > >  lib/dump_state.c           | 51 +++++++++++++++++++++++++
> > >  4 files changed, 133 insertions(+)
> > >  create mode 100644 include/linux/dump_state.h
> > >  create mode 100644 lib/dump_state.c
> > >
> > [snip]
> > > diff --git a/lib/dump_state.c b/lib/dump_state.c
> > > new file mode 100644
> > > index 000000000000..58d88be65c0a
> > > --- /dev/null
> > > +++ b/lib/dump_state.c
> > > @@ -0,0 +1,51 @@
> > > +/* SPDX-License-Identifier: GPL-2.0-only */
> > > +/*
> > > + * Copyright (c) 2020-2021, The Linux Foundation. All rights reserved.
> > > + * Copyright (c) 2021, Linaro Ltd
> > > + */
> > > +
> > > +#include <linux/dump_state.h>
> > > +#include <linux/slab.h>
> > > +
> > > +void dump_state_free_blocks(struct dump_state *state)
> > > +{
> > > +       struct dump_state_block *block, *tmp;
> > > +
> > > +       list_for_each_entry_safe(block, tmp, &state->blocks, node) {
> > > +               list_del(&block->node);
> > > +               kfree(block);
> > > +       }
> > > +}
> > > +EXPORT_SYMBOL(dump_state_free_blocks);
> >
> > nit, perhaps EXPORT_SYMBOL_GPL()?
>
> I don't really care. What is the current recommendation?

AFAIU it is to default to EXPORT_SYMBOL_GPL() unless there is a good reason..

BR,
-R

> >
> > BR,
> > -R
> >
> > > +
> > > +struct dump_state_block *dump_state_allocate_block_va(void __iomem *base_addr, size_t len, gfp_t gfp, const char *fmt, va_list args)
> > > +{
> > > +       struct dump_state_block *block = kzalloc(sizeof(*block) + len, gfp);
> > > +
> > > +       if (!block)
> > > +               return ERR_PTR(-ENOMEM);
> > > +
> > > +       vsnprintf(block->name, sizeof(block->name), fmt, args);
> > > +
> > > +       INIT_LIST_HEAD(&block->node);
> > > +       block->size = len;
> > > +       block->base_addr = base_addr;
> > > +
> > > +       return block;
> > > +}
> > > +EXPORT_SYMBOL(dump_state_allocate_block);
> > > +
> > > +struct dump_state_block *dump_state_allocate_block(void __iomem *base_addr, size_t len, gfp_t gfp, const char *fmt, ...)
> > > +{
> > > +       struct dump_state_block *block;
> > > +       va_list va;
> > > +
> > > +       va_start(va, fmt);
> > > +
> > > +       block = dump_state_allocate_block_va(base_addr, len, gfp, fmt, va);
> > > +
> > > +       va_end(va);
> > > +
> > > +       return block;
> > > +}
> > > +EXPORT_SYMBOL(dump_state_allocate_block_va);
> > > --
> > > 2.30.2
> > >
>
>
>
> --
> With best wishes
> Dmitry
