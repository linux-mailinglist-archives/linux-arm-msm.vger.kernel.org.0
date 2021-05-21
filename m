Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA76A38D1B1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 May 2021 00:54:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229548AbhEUW4B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 May 2021 18:56:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbhEUW4B (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 May 2021 18:56:01 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0727DC061574
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 May 2021 15:54:37 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id v19-20020a0568301413b0290304f00e3d88so19465391otp.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 May 2021 15:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=IUZ7Yk+LgTpwQPaOvRcB9XyT5Qk63J0G+73lhBj9gbY=;
        b=XSPe/WHCQkseZkUepNqNBhKaLyU2YL1yeS1EXkfUU5q2x9k3BZPMZHygFZaihlwW6A
         Z885CJgwgkJZxOTboQ4fnyG0r3cwrX7SZruVdIU84VFGyDgOWP3fJyy4Oa+jboo2uRNl
         tqZf8GSeHldX6vllfWGYZwK6kKz9NcTVEUkYY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=IUZ7Yk+LgTpwQPaOvRcB9XyT5Qk63J0G+73lhBj9gbY=;
        b=QuwCirSXLu6KipCGgBnesjlVTkexKNt8JZFI8M3ynBwEm+v0yjztx60FJDwlveABw5
         eN9ELaG+QCN6ZdW4rEGtGqP9DFQ82x6IDXE/4ff8xJG6PACaMKAHUswprSwxBEpNSQts
         Kft0fMs63BFBQ8x8ZdqOLpnB+13bJOtXBg9E6YGpO0AqCO9d7rGXZ9B/2MBvgQ7h9Pf1
         o2p7b7br5s63v8EOJ1GYNOn9awBoNdFpzEjFVjVA4WRabNKySmaknnzDi5kdv2/QgeeA
         iEN51JOKmjqLG8iQ7EwwIiqpGtKeUuMl9KPfimrortCgVy6PleZ4Lj8QBeKgBvEm745w
         Vn0w==
X-Gm-Message-State: AOAM530yljeM4XG+7n/UdSsmg7BvQNsOrB0dz0coJFtkmfnykzEmwuif
        +ngk/vECKizvOEzsupl8xKuCdEQqyCFWaoiGqCj8zw==
X-Google-Smtp-Source: ABdhPJybXzbqWtW1wiLeA2lnKG4jSNgNlDTUxwdwgeRUPrEmM149M/9WEzIGZQLx1iZ4eWKUv23Jy0/5DVmudHnP/jU=
X-Received: by 2002:a05:6830:4a1:: with SMTP id l1mr10380949otd.25.1621637677330;
 Fri, 21 May 2021 15:54:37 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 21 May 2021 15:54:36 -0700
MIME-Version: 1.0
In-Reply-To: <CAD=FV=XfwoNZ13TAq=vd1Am8jLwOS5c3R0z_wsydL4NLo7WtkA@mail.gmail.com>
References: <20210521134516.v2.1.Id496c6fea0cb92ff6ea8ef1faf5d468eb09465e3@changeid>
 <CAE-0n52xEDak4-vuJQ6SQz83F54-oTm+TjeVJ_0GoezG8O_M5Q@mail.gmail.com> <CAD=FV=XfwoNZ13TAq=vd1Am8jLwOS5c3R0z_wsydL4NLo7WtkA@mail.gmail.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Fri, 21 May 2021 15:54:36 -0700
Message-ID: <CAE-0n50SMVk4x4Z-90WGx4oC+hdRXTEJnyDwAMV_ysbTdC2CMQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm: Use nvmem_cell_read_variable_le_u32() to read
 speed bin
To:     Doug Anderson <dianders@chromium.org>
Cc:     Rob Clark <robdclark@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        YongQin Liu <yongqin.liu@linaro.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>, Eric Anholt <eric@anholt.net>,
        Jonathan Marek <jonathan@marek.ca>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Sean Paul <sean@poorly.run>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Doug Anderson (2021-05-21 15:35:33)
> Hi,
>
> On Fri, May 21, 2021 at 3:02 PM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > Quoting Douglas Anderson (2021-05-21 13:45:50)
> > > Let's use the newly-added nvmem_cell_read_variable_le_u32() to future
> > > proof ourselves a little bit.
> > >
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > ---
> > > The patch that this depends on is now in mainline so it can be merged
> > > at will. I'm just sending this as a singleton patch to make it obvious
> > > that there are no dependencies now.
> > >
> > > Changes in v2:
> > > - Rebased
> > >
> > >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 5 ++---
> > >  1 file changed, 2 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > > index b4d8e1b01ee4..a07214157ad3 100644
> > > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > > @@ -1403,10 +1403,10 @@ static int a6xx_set_supported_hw(struct device *dev, struct a6xx_gpu *a6xx_gpu,
> > >  {
> > >         struct opp_table *opp_table;
> > >         u32 supp_hw = UINT_MAX;
> > > -       u16 speedbin;
> > > +       u32 speedbin;
> > >         int ret;
> > >
> > > -       ret = nvmem_cell_read_u16(dev, "speed_bin", &speedbin);
> > > +       ret = nvmem_cell_read_variable_le_u32(dev, "speed_bin", &speedbin);
> >
> > I missed the review of this API, sorry.
>
> You commented on the patch that added it, though? Oddly I can't find
> your commit on lore.kernel.org (?), but it's in my inbox...

Must be brain fog on my end!

>
>
> > I wonder why it doesn't return
> > the value into an __le32 pointer. Then the caller could use
> > le32_to_cpu() like other places in the kernel and we know that code is
> > properly converting the little endian value to CPU native order. Right
> > now the API doesn't express the endianess of the bits in the return
> > value because it uses u32, so from a static checker perspective (sparse)
> > those bits are CPU native order, not little endian.
>
> I think it's backwards of what you're saying? This function is for
> when the value is stored in nvram in little endian but returned to the
> caller in CPU native order. It would be really awkward _not_ to
> convert this value from LE to native order in the
> nvmem_cell_read_variable_le_u32() function because that functions
> handles the fact that the cell could be specified as several different
> sizes (as long as it's less than 32-bits).
>

Ah ok. I was looking at the name of the API and thinking it was an le32;
happily glossing over that _u between le and 32. So it's "nvmem cell read
variable little endian to cpu u32"?

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
