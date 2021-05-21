Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47B8B38D19B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 May 2021 00:35:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229534AbhEUWhN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 May 2021 18:37:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229507AbhEUWhM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 May 2021 18:37:12 -0400
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3068FC061574
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 May 2021 15:35:48 -0700 (PDT)
Received: by mail-qt1-x831.google.com with SMTP id h21so16474472qtu.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 May 2021 15:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WEqIhehtX3XDC7PP2eVobDGRw6p6kTjaOI2qEmTi9LY=;
        b=JuWjpEhic+xV1ZNrO7nGh7+zj/LoH1+GnTZhdGcEFUKEx3kh89A9Gbnykica6aRKHx
         YHO4f626GsAaCScaIHoGQzsXlhk5ZUuyj5XUAzDPZJ73XA5aXQeviDZF9fzCVIrJgc0R
         j6Kxwmj/OOdTTyL2+ZNMLOdRqMdTCn3PJ2+Wc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WEqIhehtX3XDC7PP2eVobDGRw6p6kTjaOI2qEmTi9LY=;
        b=Cpg5/uqVMbOeqWLNLlns+eeADAGUjqU7/cKy44lFbqOWELOf7J+mwjlWot2tlxZZjY
         lFrdk/ZWPttkSsopqMwKfL3j5A+3NEWoajiNHMJwUZOk4OnDT9zkhqJme46MUQyZLd/T
         EokORi/fvO46Z5mlvxAvXw83nrb3sT/Dv/b4m3/fpRJMTsOdrtwg/9QiVmHUAIkppJBg
         U6UuN+G7brJSTh/H3DO3dfbP4GNFAdHaQ8wFMktu20SSpc+PnYRIq7EMtIH9+5pZA8SI
         S0p/ZDX4wm6IqkdnfXtY0yGMp9ELL/I+epPaHQriO094+r2ei1tqB01TbPG6cIYCMQdx
         MX3Q==
X-Gm-Message-State: AOAM532V4QAguEvYkSNjfLBcfDQAjrPXYohLRdMXRaktkYIpKB/u370z
        5wVMS4R0QntGqxKwzmD7zJyxdEwWTz06IQ==
X-Google-Smtp-Source: ABdhPJxoNNEPBfj/4ngo5Xws+qUKFFAgChgJjF4+O/3QaejwsqjP/7p9lWqx24RsYP7Bsg54kkmXwQ==
X-Received: by 2002:a05:622a:341:: with SMTP id r1mr14200549qtw.307.1621636546857;
        Fri, 21 May 2021 15:35:46 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id q7sm5885258qki.17.2021.05.21.15.35.45
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 May 2021 15:35:45 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id p124so206672ybc.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 May 2021 15:35:45 -0700 (PDT)
X-Received: by 2002:a25:80d4:: with SMTP id c20mr19007986ybm.345.1621636545135;
 Fri, 21 May 2021 15:35:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210521134516.v2.1.Id496c6fea0cb92ff6ea8ef1faf5d468eb09465e3@changeid>
 <CAE-0n52xEDak4-vuJQ6SQz83F54-oTm+TjeVJ_0GoezG8O_M5Q@mail.gmail.com>
In-Reply-To: <CAE-0n52xEDak4-vuJQ6SQz83F54-oTm+TjeVJ_0GoezG8O_M5Q@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 21 May 2021 15:35:33 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XfwoNZ13TAq=vd1Am8jLwOS5c3R0z_wsydL4NLo7WtkA@mail.gmail.com>
Message-ID: <CAD=FV=XfwoNZ13TAq=vd1Am8jLwOS5c3R0z_wsydL4NLo7WtkA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm: Use nvmem_cell_read_variable_le_u32() to read
 speed bin
To:     Stephen Boyd <swboyd@chromium.org>
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
        Sharat Masetty <smasetty@codeaurora.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, May 21, 2021 at 3:02 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Douglas Anderson (2021-05-21 13:45:50)
> > Let's use the newly-added nvmem_cell_read_variable_le_u32() to future
> > proof ourselves a little bit.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> > The patch that this depends on is now in mainline so it can be merged
> > at will. I'm just sending this as a singleton patch to make it obvious
> > that there are no dependencies now.
> >
> > Changes in v2:
> > - Rebased
> >
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > index b4d8e1b01ee4..a07214157ad3 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > @@ -1403,10 +1403,10 @@ static int a6xx_set_supported_hw(struct device *dev, struct a6xx_gpu *a6xx_gpu,
> >  {
> >         struct opp_table *opp_table;
> >         u32 supp_hw = UINT_MAX;
> > -       u16 speedbin;
> > +       u32 speedbin;
> >         int ret;
> >
> > -       ret = nvmem_cell_read_u16(dev, "speed_bin", &speedbin);
> > +       ret = nvmem_cell_read_variable_le_u32(dev, "speed_bin", &speedbin);
>
> I missed the review of this API, sorry.

You commented on the patch that added it, though? Oddly I can't find
your commit on lore.kernel.org (?), but it's in my inbox...


> I wonder why it doesn't return
> the value into an __le32 pointer. Then the caller could use
> le32_to_cpu() like other places in the kernel and we know that code is
> properly converting the little endian value to CPU native order. Right
> now the API doesn't express the endianess of the bits in the return
> value because it uses u32, so from a static checker perspective (sparse)
> those bits are CPU native order, not little endian.

I think it's backwards of what you're saying? This function is for
when the value is stored in nvram in little endian but returned to the
caller in CPU native order. It would be really awkward _not_ to
convert this value from LE to native order in the
nvmem_cell_read_variable_le_u32() function because that functions
handles the fact that the cell could be specified as several different
sizes (as long as it's less than 32-bits).

-Doug


-Doug
