Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFD5C2611B5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Sep 2020 15:00:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729717AbgIHM56 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Sep 2020 08:57:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729954AbgIHLiX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Sep 2020 07:38:23 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A82CCC061795
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2020 04:37:16 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id a17so18721157wrn.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2020 04:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=I/sh0hf7RWpKTkHRG2sXo6X29i3mK1fyatkLVFjwPyY=;
        b=TRI4o8zL814YHGA/D/zYMJIAaCIYqFZ0mIpUDMLZUZN87cVGkWukeoAQibFqRSdTi0
         6pbezBxBfFFSAjRUKWB8QJP5CHgs93NHYtFiS1nIDp648nb0kIv2ZVQ/RTs1fTwlNaec
         GPg0wCc5jkN3j+ma2gtmxo4nY/EYhDvIrUWKQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=I/sh0hf7RWpKTkHRG2sXo6X29i3mK1fyatkLVFjwPyY=;
        b=DjfVlefRA6bmNDLTfCjYIDLPhSPr14kDQc4DKXy2arVXdWBRel47xabgaGCEWJJ5AD
         BU53JoT9ChRFjr4k8MR358IzRat4JFTEdEimxvUdLK1DYlW/oMdqEJc7Ovzj+mn6m/Fr
         y8rbCqSXRF9SOYCmp1w61eCObd3Y88JMN7SF3cZvcaDPdrJP8pKYUJP80adJbsCORrW/
         gbjRoQ0L/JHs5OLqiMmuaM9EVATLx1erMDsvXmWBeQh/QmCBwLmSDIeI6WxZuJcqOi1G
         oBfIji1MnR0G9ZtJ+ZZD3Nfga3UIjJUibBMwH4ta0EKAQtDZHV7tQwzfw5Nb83Ch4zRl
         wuUQ==
X-Gm-Message-State: AOAM531bJbbfKHzxUVQVxBE4sgJfN3DsgyzeyUWdobHJa0jwsVgHhVSo
        W8ocPtJRj40Bj6Hj9qR9XDSkGw==
X-Google-Smtp-Source: ABdhPJyF2qwliIvI/LNW3ilYwO975TKwRXyUs29RK60LvcJNYZwaiKnp5x/7ZaLEGFTKwLjPhYZ/og==
X-Received: by 2002:adf:fd01:: with SMTP id e1mr24749831wrr.44.1599565035147;
        Tue, 08 Sep 2020 04:37:15 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id e18sm39103291wra.36.2020.09.08.04.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 04:37:14 -0700 (PDT)
Date:   Tue, 8 Sep 2020 13:37:12 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Gerd Hoffmann <kraxel@redhat.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Lucas Stach <l.stach@pengutronix.de>,
        Russell King <linux+etnaviv@armlinux.org.uk>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Ben Skeggs <bskeggs@redhat.com>,
        Sandy Huang <hjc@rock-chips.com>,
        Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
        "open list:RADEON and AMDGPU DRM DRIVERS" 
        <amd-gfx@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>,
        "moderated list:DRM DRIVERS FOR VIVANTE GPU IP" 
        <etnaviv@lists.freedesktop.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>,
        "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS" 
        <nouveau@lists.freedesktop.org>,
        "moderated list:ARM/Rockchip SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Rockchip SoC support" 
        <linux-rockchip@lists.infradead.org>,
        "open list:DRM DRIVERS FOR NVIDIA TEGRA" 
        <linux-tegra@vger.kernel.org>,
        "moderated list:DRM DRIVERS FOR XEN" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 1/1] drm: allow limiting the scatter list size.
Message-ID: <20200908113712.GL2352366@phenom.ffwll.local>
Mail-Followup-To: Gerd Hoffmann <kraxel@redhat.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Lucas Stach <l.stach@pengutronix.de>,
        Russell King <linux+etnaviv@armlinux.org.uk>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Ben Skeggs <bskeggs@redhat.com>, Sandy Huang <hjc@rock-chips.com>,
        Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
        "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>,
        "moderated list:DRM DRIVERS FOR VIVANTE GPU IP" <etnaviv@lists.freedesktop.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
        "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS" <nouveau@lists.freedesktop.org>,
        "moderated list:ARM/Rockchip SoC support" <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>,
        "open list:DRM DRIVERS FOR NVIDIA TEGRA" <linux-tegra@vger.kernel.org>,
        "moderated list:DRM DRIVERS FOR XEN" <xen-devel@lists.xenproject.org>
References: <20200907112425.15610-1-kraxel@redhat.com>
 <20200907112425.15610-2-kraxel@redhat.com>
 <CAKMK7uGjT73rh=9iuCKAXvC_CaOuygm8PgOQgofkTgH7wRysFw@mail.gmail.com>
 <20200908054858.um34wojjv6uhi7d3@sirius.home.kraxel.org>
 <20200908085544.GI2352366@phenom.ffwll.local>
 <20200908100253.b22sff23737l77bo@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200908100253.b22sff23737l77bo@sirius.home.kraxel.org>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Sep 08, 2020 at 12:02:53PM +0200, Gerd Hoffmann wrote:
> > > > The comments I've found suggest very much not ... Or is that all very
> > > > old stuff only that no one cares about anymore?
> > > 
> > > I think these days it is possible to override dma_ops per device, which
> > > in turn allows virtio to deal with the quirks without the rest of the
> > > kernel knowing about these details.
> > > 
> > > I also think virtio-gpu can drop the virtio_has_dma_quirk() checks, just
> > > use the dma api path unconditionally and depend on virtio core having
> > > setup dma_ops in a way that it JustWorks[tm].  I'll look into that next.
> > 
> > The comment above vring_use_dma_api() suggests that this has not yet
> > happened, that's why I'm asking.
> 
> Hmm, wading through the code, seems it indeed happen yet, even though my
> testing didn't show any issues.  Probably pure luck because devices and
> cpus have the same memory view on x86.  Guess I need to try this on
> ppc64 to see it actually failing ...
> 
> So dropping the virtio_has_dma_quirk() checks isn't going to fly.
> 
> Using dma_max_mapping_size() should be fine though.  It might use a
> lower limit than needed for virtio, but it should not break things.

Makes sense. On this patch here:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

And I guess would be good if virtio pushes a bit more towards using the
dma api abstraction fully so we can get rid of these hacks. Virtio feels
like a driver that really should be using dma-api and not dig around
behind it because "it' makes stuff 0.5% faster" or so, since being
virtualized it's already not the king of speed anyway :-)

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
