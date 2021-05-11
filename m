Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 635AC379EDD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 May 2021 06:56:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230291AbhEKE5Q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 May 2021 00:57:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230330AbhEKE5O (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 May 2021 00:57:14 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FAF4C061763
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 May 2021 21:55:54 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id t4-20020a05683014c4b02902ed26dd7a60so6349596otq.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 May 2021 21:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LRkUu5LCFvquDlyLgAggMIQvj0PMUIKV3fzj8HPK4n8=;
        b=Qv5FC1Qu1CtsXR1UyCXrkd3H3IdtGC0FvhcKvPZ2AVZy6EW/FOgLXMLu+gyFmPcicr
         tbGyiy8k25+sfaBK0EQBbMtgKmjrgvFtrASptwxobVuTYK/ju6Ge/V0GrQ6tqRS+6Aj+
         N73461M8vfuTpjuSyUqtPHVSa2JKd8j9MwOsgPmHkTF/PgG66p1gQy3fIrRMvzDgBesy
         nq3i75AVJNhoPnPxj0DwICnLO9LRd6JM8HWSNkXgXQ/UWUfq3xada1j8Rk9k+EkexBKl
         fim5b9j/oBKZveH8XAiSoCM9yyuyw4IIWc3RWnR/9OOBEer3SUh7sXV7QIIDTyqMKLau
         pcew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LRkUu5LCFvquDlyLgAggMIQvj0PMUIKV3fzj8HPK4n8=;
        b=o1YqScO6r3j3MRyqxh63QlxMSLp7Ow6s1It5YLUodnWIvuRMKgekSIjhWKc4Tt4//G
         cadtzeHS3Qt6RFHJ9rSKiw7/gPTp0pB1vSmz5lO8Vt8MU2vKjekT4nsw2oeEA1xUkJwR
         F06E9QG7qIfuNm0WjTs8NYIagjw9R03UpHAdXciz0pawj/l1oEJrdCdGV+Qk/IoDliqP
         sUZcPinNjREm+A31Our8ZS0wtQohXIoz9LoMSIy5wz1XQetR6/ZVmBznZoaAVF+xbQQW
         +5t8xvUr/2gq54htwgQHvJ/wDE1pD+HmMtlqVyMgOYO0kiZXmlQy0W9bsnh36VVj3Hb4
         lb9A==
X-Gm-Message-State: AOAM531rAyuTw533nq4goVDMnEOejwK10QO9dcmt4IOrJMlxzH/8uZTB
        DDm34Wv5ekVAK0bDJuuoCI2cG5N8OcF6WA==
X-Google-Smtp-Source: ABdhPJwn2ZRr/gjRSK8ClIz3ilxOMtFbJ2lD+fzPmX3FeDD9T3M0Pl0j3Uuro/ae7a/eiv8xtTSnZg==
X-Received: by 2002:a9d:721b:: with SMTP id u27mr15693822otj.95.1620708954195;
        Mon, 10 May 2021 21:55:54 -0700 (PDT)
Received: from yoga ([2607:fb90:e623:42c1:10df:adff:fec2:f1d])
        by smtp.gmail.com with ESMTPSA id x18sm3024293oix.28.2021.05.10.21.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 21:55:53 -0700 (PDT)
Date:   Mon, 10 May 2021 23:55:50 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     sbillaka@codeaurora.org
Cc:     Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>,
        Sean Paul <seanpaul@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        Krishna Manikandan <mkrishn@codeaurora.org>
Subject: Re: [PATCH v1 0/3] Add support for next gen eDP driver on SnapDragon
Message-ID: <20210511045550.GL2484@yoga>
References: <1620202579-19066-1-git-send-email-sbillaka@codeaurora.org>
 <CAA8EJpqZXHNvBySL0Vm-CmsrAh8Z85SoQHn97TqWLYeFW-Q=UA@mail.gmail.com>
 <3398f9a1f985ccd6bb6a44646f7bea24@codeaurora.org>
 <CAF6AEGuPpihBj9GQbuPKXuZvY=+Bid-pSB9XPP2ZXNQvHEm-Ag@mail.gmail.com>
 <3d96a5be6c6f0140b738a302befc25b5@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3d96a5be6c6f0140b738a302befc25b5@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 10 May 07:16 CDT 2021, sbillaka@codeaurora.org wrote:

> On 2021-05-06 20:32, Rob Clark wrote:
> > On Wed, May 5, 2021 at 11:47 PM <sbillaka@codeaurora.org> wrote:
> > > 
> > > On 2021-05-05 15:31, Dmitry Baryshkov wrote:
> > > > Hi,
> > > >
> > > > On Wed, 5 May 2021 at 11:17, Sankeerth Billakanti
> > > > <sbillaka@codeaurora.org> wrote:
> > > >>
> > > >> These patches add support for the next generation eDP driver on
> > > >> SnapDragon
> > > >> with dpu support. The existing eDP driver cannot support the new eDP
> > > >> hardware. So, to maintain backward compatibility, the older eDP driver
> > > >> is
> > > >> moved to v200 folder and the new generation eDP driver is added in
> > > >> the v510 folder.
> > > >
> > > > What exactly does this version correspond to?
> > > > I assume that v510 corresponds to sdmshrike/sc8180x. Is it right?
> > > [Sankeerth] This is for sc7280.
> > > 
> > > > Is it really so specific, or just v2/v5 would be enough? Not to
> > > > mention that this is the MDP/ version, while other blocks tend to use
> > > > block-specific versions/ids.
> > > [Sankeerth] I can rename it as edp-v1 and edp-v2. Edp v1 is very old
> > > chip and there is considerable HW delta between v1 and v2. So, we want
> > > to separate the driver. We followed similar model for DPU driver
> > > where,
> > > MDP4, MDP5 and DPU have separate folders. EDP v1 belongs to MDP4
> > > generation.
> > 
> > Bjorn brought up the idea of just dropping the existing drm/msm/edp..
> > since the efforts to upstream the platform it worked on (8084?)
> > fizzled out, I don't think there is any device which uses it.
> > 
> > But it does sound like edp is a subset of the the newer dp driver, so
> > seems sort of like the better approach would be to add edp support to
> > dp.  I believe Bjorn has something based on this approach which is
> > working for sc8280 (although not sure if it is in shape to post
> > patches yet)
> > 
> > BR,
> > -R
> Hi Rob,
> I will explore to integrate native eDP driver as part of DP driver. Will
> follow up with new patchsets.
> 
> Hi Dmitry,
> I will move the eDP phy to qmp drivers folder in the new patchsets so that
> it can reuse the dp core driver.
> 

Hi Sankeerth,

I've been working on eDP support for sc8180x recently, which afaict is
identical to sc7280 in this regard. I finally got the patches cleaned up
and posted here:
https://lore.kernel.org/linux-arm-msm/20210511042043.592802-1-bjorn.andersson@linaro.org/T/#t
https://lore.kernel.org/linux-arm-msm/20210511041930.592483-1-bjorn.andersson@linaro.org/T/#t

My initial patches added widebus support, rather than disabling it. But
those patches needs a little bit more polishing - and I finally figured
was able to disable the feature. So I will get back to this.

There's currently a few seconds delay on plug detection, so this needs
to be investigated further and I haven't looked at backlight handling
yet.

Regards,
Bjorn
