Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35973358178
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Apr 2021 13:15:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229721AbhDHLPq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Apr 2021 07:15:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231145AbhDHLPo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Apr 2021 07:15:44 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EF73C061760
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Apr 2021 04:15:32 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id a12so1676946wrq.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Apr 2021 04:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=AcAFUqp6UAoctTPigHac0GLdbrDMBzvgfm1w3MAPCVc=;
        b=gGVo0KdtGQFzn+gxvhAI7/mbF2A4l4VfZBwtPQU6K9eV3ca1vm5pLoji6HAfVncZrs
         1LLFVDeqlQleRFCHV19mRzY0GQCTbs4IrhypdEy/VGbI001vRiAYAJ/jqzBOz251K1Zl
         4PeICtkXuYO/XR2Hil7Uer17XqYYN7+RcIUEM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=AcAFUqp6UAoctTPigHac0GLdbrDMBzvgfm1w3MAPCVc=;
        b=EId9zlUJqLsaQSgI1VKlYtcBfEwdVIbeuAsIa4D0TEJf5jNqB667zWk6QF3kGWXySw
         CNrbAjktCWLpsU3uZ/J6/FsTorWRMUxSeMpX9pWp0pgFLm5mUXXbuKm4Sob+YlJNNsXk
         REf98rYoYHBncnb+8LAB9o5SPmP5qY+9LfqiMbZieWlEg/fJFfQaEoonrQ5ObAVS+AHm
         2nzTgONVqBZsuOr+jt/dwgVj47T1856wQwQ4oxLSDfuidlccqqEZ7fQa+/nu8P+oWngE
         2ko/Ry67CeMorQvA2O4ntPTlokpd99svCAFyBIJ7n7T5YdfLmsPVzC9o5XWZgiYQhOHM
         MmEw==
X-Gm-Message-State: AOAM533Uvc1llAMTd33x8OtJ+VgTHd57Oyrp4n3Q9Cfl0tJqEp5PO32d
        NJucmwqtwbfnZJTJIgn+ZVYa/w==
X-Google-Smtp-Source: ABdhPJxsrvJEP26+VkzvzCqzDNRxmHcvrkr2wjLdHOCmOy+nZZfHQ5wDk3KDW5f115ZZy75z4/ZORA==
X-Received: by 2002:a5d:4f0e:: with SMTP id c14mr10713632wru.0.1617880530387;
        Thu, 08 Apr 2021 04:15:30 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id o2sm18376833wry.4.2021.04.08.04.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 04:15:29 -0700 (PDT)
Date:   Thu, 8 Apr 2021 13:15:28 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>
Subject: Re: [PATCH 0/8] drm/msm: Swappable GEM objects
Message-ID: <YG7l0LwVQ2s4Y0Sa@phenom.ffwll.local>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
        dri-devel@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>
References: <20210405174532.1441497-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210405174532.1441497-1-robdclark@gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Apr 05, 2021 at 10:45:23AM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> One would normally hope not to be under enough memory pressure to need
> to swap GEM objects to disk backed swap.  But memory backed zram swap
> (as enabled on chromebooks, for example) can actually be quite fast
> and useful on devices with less RAM.  On a 4GB device, opening up ~4
> memory intensive web pages (in separate windows rather than tabs, to try
> and prevent tab discard), I see ~500MB worth of GEM objects, of which
> maybe only 10% are active at any time, and with unpin/evict enabled,
> only about half resident (which is a number that gets much lower if you
> simulate extreme memory pressure).  Assuming a 2:1 compression ratio (I
> see a bit higher in practice, but cannot isolate swapped out GEM pages
> vs other), that is like having an extra 100+MB of RAM, or more under
> higher memory pressure.
> 
> Rob Clark (8):
>   drm/msm: ratelimit GEM related WARN_ON()s
>   drm/msm: Reorganize msm_gem_shrinker_scan()
>   drm/msm: Clear msm_obj->sgt in put_pages()
>   drm/msm: Split iova purge and close
>   drm/msm: Add $debugfs/gem stats on resident objects
>   drm/msm: Track potentially evictable objects
>   drm/msm: Small msm_gem_purge() fix
>   drm/msm: Support evicting GEM objects to swap

Given how much entertainement shrinkers are, should we aim for more common
code here?

Christian has tons of fun with adding something like this for ttm (well
different shades of grey). i915 is going to adopt ttm, at least for
discrete.

The locking is also an utter pain, and msm seems to still live a lot in
its own land here. I think as much as possible a standard approach here
would be really good, ideally maybe as building blocks shared between ttm
and gem-shmem drivers ...
-Daniel

> 
>  drivers/gpu/drm/msm/msm_drv.c          |   2 +-
>  drivers/gpu/drm/msm/msm_drv.h          |  13 ++-
>  drivers/gpu/drm/msm/msm_gem.c          | 155 +++++++++++++++++--------
>  drivers/gpu/drm/msm/msm_gem.h          |  68 +++++++++--
>  drivers/gpu/drm/msm/msm_gem_shrinker.c | 129 ++++++++++++--------
>  drivers/gpu/drm/msm/msm_gpu_trace.h    |  13 +++
>  6 files changed, 272 insertions(+), 108 deletions(-)
> 
> -- 
> 2.30.2
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
