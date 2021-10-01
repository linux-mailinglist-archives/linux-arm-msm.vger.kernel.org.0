Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2A2141EEFE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Oct 2021 15:59:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231530AbhJAOAu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Oct 2021 10:00:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231186AbhJAOAt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Oct 2021 10:00:49 -0400
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81CC9C061775
        for <linux-arm-msm@vger.kernel.org>; Fri,  1 Oct 2021 06:59:05 -0700 (PDT)
Received: by mail-io1-xd36.google.com with SMTP id h129so11770001iof.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Oct 2021 06:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=z+a+OAnbn2I7NAN9np3zYA/hAsmt4Me5zaOYy7w4mjw=;
        b=fL+vUmI833aN0BEMvBL5ZwKKDoN1QrgN1cHfhwoWs/4cdOQsYyYpCCKmP0+dulwt+9
         cLBLX1dkN5SoCTiYF4Q7NbcUq8nKBq0DcP6u4YlmnWrBQpSSSmNeQzdSo/jbfVfLxQBJ
         CHoBAz7eXc2VYpCudViIqjCfvFGXT6iywZjOg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=z+a+OAnbn2I7NAN9np3zYA/hAsmt4Me5zaOYy7w4mjw=;
        b=b0kqIsAX19LPb6JyVp/V5yv1nHHprM8IHw6cWFaNjk2RMTl/ekcsJi2MEPUvZ1qy4s
         fkb7r24jjhnobYmzaKsvNBcfVTC8hDoht9x7pJwFNNki6jk5iUzfSqFnWriIbDiAqGBh
         zG6dWMRxRjs3Y9ixMX5Q3dUwIl53wsgE/QoIrmQr/4QoszASrryvvVQ7eHyWjR1HFz32
         0fkfF7dBq5TvwFZMhz3vhtGDJYHupPCQQt8IUh/hel2Cwr4Tmy7yEQCFTXfvGrsak8+B
         DsJRWRUUCJdpkiBB/SRgkOIoOebOJwigrQXD4asqZRAhSX9W18nxXPHSFzOkbOMxqsZj
         fFOA==
X-Gm-Message-State: AOAM531QvDUCyVS95hVe1/94+kXE4J7VeUiMZ5g3BPQNsfegjQBzZ6sN
        TrKZgScNHc9u5gyxSFbNscd8k7WfjnL/AA==
X-Google-Smtp-Source: ABdhPJzbo0ekJ9PLRD5asOivpKs40hwB3cF0rvT72kE8HwxAOiYomSW9G/lDYQ31AthryvWjucr8ug==
X-Received: by 2002:a02:a60a:: with SMTP id c10mr10044663jam.131.1633096744698;
        Fri, 01 Oct 2021 06:59:04 -0700 (PDT)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com. [209.85.166.178])
        by smtp.gmail.com with ESMTPSA id o10sm793932ilc.56.2021.10.01.06.59.02
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Oct 2021 06:59:02 -0700 (PDT)
Received: by mail-il1-f178.google.com with SMTP id p1so9367262ilg.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Oct 2021 06:59:02 -0700 (PDT)
X-Received: by 2002:a05:6e02:19cb:: with SMTP id r11mr8741064ill.120.1633096741727;
 Fri, 01 Oct 2021 06:59:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210825234233.1721068-1-bjorn.andersson@linaro.org>
 <20210825234233.1721068-4-bjorn.andersson@linaro.org> <CAE-0n52YaQXQ4-=bR5ffMHOMp7CyFnCS-u9a2pddvaRUQhLrog@mail.gmail.com>
In-Reply-To: <CAE-0n52YaQXQ4-=bR5ffMHOMp7CyFnCS-u9a2pddvaRUQhLrog@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 1 Oct 2021 06:58:49 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UWu4CBC8S8C9P7r=q+F=JqWMzTVAPyzWb+AT4QHbULZQ@mail.gmail.com>
Message-ID: <CAD=FV=UWu4CBC8S8C9P7r=q+F=JqWMzTVAPyzWb+AT4QHbULZQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] drm/msm/dp: Support up to 3 DP controllers
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Abhinav Kumar <abhinavk@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Aug 26, 2021 at 10:20 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Bjorn Andersson (2021-08-25 16:42:31)
> > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > index 2c7de43f655a..4a6132c18e57 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > @@ -78,6 +78,8 @@ struct dp_display_private {
> >         char *name;
> >         int irq;
> >
> > +       int id;
> > +
> >         /* state variables */
> >         bool core_initialized;
> >         bool hpd_irq_on;
> > @@ -115,8 +117,19 @@ struct dp_display_private {
> >         struct dp_audio *audio;
> >  };
> >
> > +
> > +struct msm_dp_config {
> > +       phys_addr_t io_start[3];
>
> Can this be made into another struct, like msm_dp_desc, that also
> indicates what type of DP connector it is, i.e. eDP vs DP? That would
> help me understand in modetest and /sys/class/drm what sort of connector
> is probing. dp_drm_connector_init() would need to pass the type of
> connector appropriately. Right now, eDP connectors still show up as DP
> instead of eDP in sysfs.

I'm not convinced that's the right way to do it. I think the right way
forward here is to look at whether drm_of_find_panel_or_bridge() finds
a panel. If it finds a panel then we're eDP. If it doesn't then we're
DP. That matches roughly what Laurent was planning to do for
ti-sn65dsi86:

https://lore.kernel.org/all/20210322030128.2283-11-laurent.pinchart+renesas@ideasonboard.com/

I know technically an eDP and DP controller can have different sets of
features but I think what we really are trying to communicate to
modetest is whether an internal panel or external display is
connected, right?


-Doug
