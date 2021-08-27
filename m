Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3FB23F9D5D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Aug 2021 19:15:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236088AbhH0RPK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Aug 2021 13:15:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235305AbhH0RPK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Aug 2021 13:15:10 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28AD5C0613CF
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Aug 2021 10:14:21 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id q11-20020a9d4b0b000000b0051acbdb2869so3799303otf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Aug 2021 10:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zK3aiufjz7ahPa7Tc/uovDrwODHk5O2Kax7tz64cLHE=;
        b=YuifmkEni1937iAfOjJjARdxFbdIen3tmwXAIKXv6RGYhhnthKze+CAp7xWygPqZ2V
         jvKYzEDU/bXZMRVa6XsJWufP3VYUcvx72KRPQLZC/3IYU8y17UJn7qGw+WcobkYhFSfI
         hfpxFlU8qnrvMwB22ycY2JsSjUqRjtSKhkG0pWSmuyStkzuzYnLvyHhpiCe6WppU7+YP
         UD5EYnJx0kTEeyGbQclFz0ofNKccVPPA0jyMmP3eMZLt4klokE6AfjTkB88YISQT59Sv
         z2CllTUuAAToJpg2d6zh4kqnxAKi1i+BOUbg+JDtZgpKHQiWF02QJzluhDn/dpCAAkOz
         QQKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zK3aiufjz7ahPa7Tc/uovDrwODHk5O2Kax7tz64cLHE=;
        b=YOoDyF4/YR7lUKof6t2KDhNeUD3y973Xuuv0X8zJY1r69DKQ95ju/kdUjlfmFLTxWt
         R7pa4RwsJvBqrP2YKwNSD+5gC3et4lV5cjp1ItWXmd6NMOIQ2z6tdLGEk5Dh3MUr47FS
         CKTXi/v9va+GsIqYApgWkqKFPJhMOzmkcN2Y8TehHdWWy7WKantk7sms9AP9FC1uEc9t
         SWoqfYEgX8jx3TS0qtaMovkVs4nYq3KBY/G9hvWT38hBO8LInFsU91fgZR8DgfcU9CBp
         OLQPgRKd2zXUUHTwfkhKWUhRtTTT5NRNLTeqbt+DeonJ4g/is35SuCG4wTYArtlHFq6i
         t9VA==
X-Gm-Message-State: AOAM532lMZHuxr7ag6aMW+SmNqIP1JTClmhYdeJj5K9X2KkFjDej8TsR
        LzocAhihWM0dvplNHd++6USlJMvEjmP4Eg==
X-Google-Smtp-Source: ABdhPJzaUbwWRzaLBbQulWdsE0TFLXvYUc7WuweJbzC1OcohmnizQZGT5Bcx7GOFfJfYOs4CenHf8A==
X-Received: by 2002:a05:6830:4196:: with SMTP id r22mr9319481otu.231.1630084460503;
        Fri, 27 Aug 2021 10:14:20 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id q13sm1330942ota.17.2021.08.27.10.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 10:14:20 -0700 (PDT)
Date:   Fri, 27 Aug 2021 12:14:18 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Abhinav Kumar <abhinavk@codeaurora.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/5] drm/msm/dp: Support up to 3 DP controllers
Message-ID: <YSkdaljt7DPbyTDe@builder.lan>
References: <20210825234233.1721068-1-bjorn.andersson@linaro.org>
 <20210825234233.1721068-4-bjorn.andersson@linaro.org>
 <CAE-0n52YaQXQ4-=bR5ffMHOMp7CyFnCS-u9a2pddvaRUQhLrog@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE-0n52YaQXQ4-=bR5ffMHOMp7CyFnCS-u9a2pddvaRUQhLrog@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 27 Aug 00:20 CDT 2021, Stephen Boyd wrote:

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
> 

I like it, will spin a v3 with this.

Regards,
Bjorn

> > +       size_t num_dp;
> > +};
> > +
> > +static const struct msm_dp_config sc7180_dp_cfg = {
> > +       .io_start = { 0x0ae90000 },
> > +       .num_dp = 1,
> > +};
> > +
> >  static const struct of_device_id dp_dt_match[] = {
> > -       {.compatible = "qcom,sc7180-dp"},
> > +       { .compatible = "qcom,sc7180-dp", .data = &sc7180_dp_cfg },
> >         {}
> >  };
> >
