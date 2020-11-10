Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A45E2AD285
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Nov 2020 10:33:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726462AbgKJJdT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Nov 2020 04:33:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726213AbgKJJdS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Nov 2020 04:33:18 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6531DC0613CF
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2020 01:33:18 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id d12so10376101wrr.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2020 01:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=D87wf9S+VQgrir5Y3Im/Lq0uDNDXr/OXwkaKziQOSSk=;
        b=eqL1EGtwAV0BAaSSSGWva6fXzKWOb6Oa1XVotzJar+d6PpWo5hMHGFJXoBYXBTBNHo
         f0rstUhe9BA+ySYTaa/XO3JrE0m+/VM4StP0l5JEXeeJjkBiyFQ/+8Bjmyd2465hZ7ED
         2wQc6/2xM8CqGgjA/wixfzu3N3yl/UlEOwSkc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=D87wf9S+VQgrir5Y3Im/Lq0uDNDXr/OXwkaKziQOSSk=;
        b=Gj9gyusCznVB+o5krcBtdg+HTlC8Io2BEKrD908XZmJKhrBam+2clkgRioWQYWr1Z5
         YrBkkuCOfqDPVBnE3Q/DHFbhFZeHxy4ib8TLtYs/Q3B9HwBTBRuR7Bj6z51fUmOL7HUq
         uQbfJMKUq7/GKyF9W7M4SWqHcBQh/xgTnYOVNEwj8kBDSWzDQQX1/nxJeUN61BpA/3cQ
         9zrYvp4l3hP1SFNo3KorZ8CAEkPLt86xHZArwCGVKLFl+9FmV/ndu9VtrQdZ9eH86S9O
         Llk6etQ7Fqz/Ixib+xIIzherzKzhDHkUoB5iuVl85I6AKiGskAPK5sSXXpXVhPU+8RfJ
         tIkg==
X-Gm-Message-State: AOAM531UmlI1YI1dniQ5jMAtWfIUEmqFR9O9hX6TO8I8fHsg/YTFbEQ/
        ES7IGfeta+Z3BMxiog8Ws7/efA==
X-Google-Smtp-Source: ABdhPJyGbMjLRkYp8QapsVbIw4iwcuqTaZ4I3ctrgmpDvNh11tupCr/ocZW9QLoIqcZCE+molvVXBg==
X-Received: by 2002:adf:8465:: with SMTP id 92mr21597643wrf.50.1605000797075;
        Tue, 10 Nov 2020 01:33:17 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id t12sm16411910wrm.25.2020.11.10.01.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2020 01:33:16 -0800 (PST)
Date:   Tue, 10 Nov 2020 10:33:14 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     daniel@ffwll.ch, airlied@linux.ie, chunkuang.hu@kernel.org,
        p.zabel@pengutronix.de, robdclark@gmail.com, sean@poorly.run,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 0/2] drm: Build fixes for msm and mediatek
Message-ID: <20201110093314.GE401619@phenom.ffwll.local>
References: <20201109103242.19544-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201109103242.19544-1-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Nov 09, 2020 at 11:32:40AM +0100, Thomas Zimmermann wrote:
> Commit 49a3f51dfeee ("drm/gem: Use struct dma_buf_map in GEM vmap ops and
> convert GEM backends") changed DRM's internal GEM vmap callbacks. Msm and
> mediatek were forgotten during the conversion.
> 
> Thomas Zimmermann (2):
>   drm/msm: Use struct dma_buf_map in GEM vmap ops
>   drm/mediatek: Use struct dma_buf_map in GEM vmap ops

On both:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

I guess more motivation to convert drivers over to shmem helpers, if
possible ...
-Daniel

> 
>  drivers/gpu/drm/mediatek/mtk_drm_gem.c | 20 ++++++++++++--------
>  drivers/gpu/drm/mediatek/mtk_drm_gem.h |  4 ++--
>  drivers/gpu/drm/msm/msm_drv.h          |  4 ++--
>  drivers/gpu/drm/msm/msm_gem_prime.c    | 13 ++++++++++---
>  4 files changed, 26 insertions(+), 15 deletions(-)
> 
> --
> 2.29.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
