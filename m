Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9349B493EFA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jan 2022 18:24:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356349AbiASRY1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Jan 2022 12:24:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349318AbiASRY1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Jan 2022 12:24:27 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D1E8C06161C
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jan 2022 09:24:26 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id 25-20020a05600c231900b003497473a9c4so15744281wmo.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jan 2022 09:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=eOH9iqU5IVX14/tYvkJqEjk8Qx7vTHtd1JM4aN1Uy+o=;
        b=DmDrtO1qA5+xS6RSFjC8YRAgWKLJSBrsCK3C1mYCeL3ScNiBJNJt+zzuegOEmgLjoP
         +/1qV59z4FrPlFKaNmWWmOAzeWqYXZefKd0ekBDSMLyaEC7lt9t07rqtIL/3zUc121jm
         +dcjCTcj0zrh3pRs67AwP1TQsb2jKMgygW7C8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=eOH9iqU5IVX14/tYvkJqEjk8Qx7vTHtd1JM4aN1Uy+o=;
        b=p8B/paF9U38UtuZLnM2TCP8PQaiOUnCsDzB8Ja+9uZjem6LSBGMNoIZJ0epGE6Iuuz
         uaxH6JkkkrPOVzgCNgMzKxlijk+uJyvfGsRkkxZp0gQpemsl0gz7yJgtpZleZAQsg71h
         SaPSHNUHZeHanSqXYreQRUkp3iG/HPnbMXA8wqGP4+RxH8NqYwL33GQhf+FbTnJQKKdx
         afllequ7eToSI7Vp7t3+eg5rbXLgK9ldgqXndyQpuNfKiKsDmJyq8fpo2M5R9fyHRVWG
         SXQScRWvCvXImPGKSkGNshhc83tLnmyF7LZvsrRZsZ/Qu+fqV+wWmF/+rJSkLWfEWW4Z
         8gFw==
X-Gm-Message-State: AOAM533JzDAlh+NwFmv+NQ7sduq3VFL+kbRThaTZTyv3QPzFC4C1vy/K
        GQ2+ZEJlGH1pGSxpEREGMSnqug==
X-Google-Smtp-Source: ABdhPJwmz4gHSPo9o9SV/Nix2goUKu/7MKdI00pmWvKG61VzYeY9XiHQLJbDl27v8A+WKNfPotxwNQ==
X-Received: by 2002:adf:e291:: with SMTP id v17mr29163539wri.479.1642613064738;
        Wed, 19 Jan 2022 09:24:24 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id f6sm428161wrj.26.2022.01.19.09.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 09:24:24 -0800 (PST)
Date:   Wed, 19 Jan 2022 18:24:22 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Ira Weiny <ira.weiny@intel.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 0/7] DRM kmap() fixes and kmap_local_page() conversions
Message-ID: <YehJRt+JngIsj+Gd@phenom.ffwll.local>
Mail-Followup-To: Ira Weiny <ira.weiny@intel.com>,
        David Airlie <airlied@linux.ie>,
        Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
References: <20211210232404.4098157-1-ira.weiny@intel.com>
 <20220119165356.GD209936@iweiny-DESK2.sc.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220119165356.GD209936@iweiny-DESK2.sc.intel.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jan 19, 2022 at 08:53:56AM -0800, Ira Weiny wrote:
> On Fri, Dec 10, 2021 at 03:23:57PM -0800, 'Ira Weiny' wrote:
> > From: Ira Weiny <ira.weiny@intel.com>
> > 
> > This series starts by converting the last easy kmap() uses to
> > kmap_local_page().
> > 
> > There is one more call to kmap() wrapped in ttm_bo_kmap_ttm().  Unfortunately,
> > ttm_bo_kmap_ttm() is called in a number of different ways including some which
> > are not thread local.  I have a patch to convert that call.  However, it is not
> > straight forward so it is not included in this series.
> > 
> > The final 2 patches fix bugs found while working on the ttm_bo_kmap_ttm()
> > conversion.
> 
> Gentile ping on this series?  Will it make this merge window?

I think this fell through the cracks and so no. Note that generally we
feature-freeze drm tree around -rc6 anyway for the upcoming merge window,
so you were cutting this all a bit close anyway. Also looks like the ttm
kmap caching question didn't get resolved?

Anyway if patches are stuck resend with RESEND and if people still don't
pick them up poke me and I'll apply as fallback.

Cheers, Daniel

> 
> Thanks,
> Ira
> 
> > 
> > 
> > Ira Weiny (7):
> > drm/i915: Replace kmap() with kmap_local_page()
> > drm/amd: Replace kmap() with kmap_local_page()
> > drm/gma: Remove calls to kmap()
> > drm/radeon: Replace kmap() with kmap_local_page()
> > drm/msm: Alter comment to use kmap_local_page()
> > drm/amdgpu: Ensure kunmap is called on error
> > drm/radeon: Ensure kunmap is called on error
> > 
> > drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 8 ++++----
> > drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c | 1 +
> > drivers/gpu/drm/gma500/gma_display.c | 6 ++----
> > drivers/gpu/drm/gma500/mmu.c | 8 ++++----
> > drivers/gpu/drm/i915/gem/i915_gem_shmem.c | 4 ++--
> > drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c | 8 ++++----
> > drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c | 4 ++--
> > drivers/gpu/drm/i915/gt/shmem_utils.c | 4 ++--
> > drivers/gpu/drm/i915/i915_gem.c | 8 ++++----
> > drivers/gpu/drm/i915/i915_gpu_error.c | 4 ++--
> > drivers/gpu/drm/msm/msm_gem_submit.c | 4 ++--
> > drivers/gpu/drm/radeon/radeon_ttm.c | 4 ++--
> > drivers/gpu/drm/radeon/radeon_uvd.c | 1 +
> > 13 files changed, 32 insertions(+), 32 deletions(-)
> > 
> > --
> > 2.31.1
> > 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
