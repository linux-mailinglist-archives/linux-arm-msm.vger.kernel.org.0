Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E89FF283732
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Oct 2020 16:02:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726410AbgJEOCK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Oct 2020 10:02:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726018AbgJEOCK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Oct 2020 10:02:10 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42407C0613CE
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Oct 2020 07:02:10 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id k18so8920730wmj.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2020 07:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=Kw0jH99mH65cgbBf0cAKvt7u45o+bI69PtoRz7plT9I=;
        b=LKbavLR8ZdTnQm7tlmWwgndIQwhen8v8O8x1psZ+HIE2wmAD24D+bXj5NwsJAvyS/R
         MQkiaMJ/+ob1zWMVtrd+sEWT6BKvZocdCnxbzPsmOqi3r39+dbuF1VEaGtZJZGoHTneV
         0F4uvulqQGo0uTF43vmMZxaBExbJ8UbT6Sb9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=Kw0jH99mH65cgbBf0cAKvt7u45o+bI69PtoRz7plT9I=;
        b=p5Lghy03kyE2KYoMXrT52Yft9ENYwdBPfpq46uUjwyC8HSqQS1Ydhw2c7hWeL5LDuu
         5jefqVFFPrvsgumAICkp3aqQ1ipsarLv7iFJJ9osvB8ZLfHylWwlVlGN5akYmU7cNNZW
         1DcdLGw4ReXi1vLFASmT/zGwTWRZB2FweBSifaOJ5HxymJ5ArmIfh9iBTLQFKasgx14c
         VlcMTqJLSWKNpSyt4RyIK5goij37frc/pShMP7bjvmkYa9NNKHOyGYDA14OcDo0K48Kh
         cUYwf04VDvHyM7WgOOFl6Xqr/L5ugXJIZoCKvG6r+MdwI6H79nqTu3oTRrSucr5YZXG9
         on1g==
X-Gm-Message-State: AOAM532XBgE74bAqdM0QISy78v1BO1t9CaGuD1KSy2Ck4N3V1nt2J0ka
        xYbkz2mF9UDJsk63VFitPOkp1g==
X-Google-Smtp-Source: ABdhPJxaKvPpL0rwdLNrB+ck47hYngpJ9D4J1RqIbGrDU+BZnsh9AH/S/PSgGf1teantMnWe2hZn8w==
X-Received: by 2002:a1c:2905:: with SMTP id p5mr17734071wmp.187.1601906526822;
        Mon, 05 Oct 2020 07:02:06 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id t15sm78967wrp.20.2020.10.05.07.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 07:02:05 -0700 (PDT)
Date:   Mon, 5 Oct 2020 16:02:03 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Hillf Danton <hdanton@sina.com>
Cc:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 13/14] drm/msm: Drop struct_mutex in shrinker path
Message-ID: <20201005140203.GS438822@phenom.ffwll.local>
Mail-Followup-To: Hillf Danton <hdanton@sina.com>,
        Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20201004192152.3298573-1-robdclark@gmail.com>
 <20201005092419.15608-1-hdanton@sina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201005092419.15608-1-hdanton@sina.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 05, 2020 at 05:24:19PM +0800, Hillf Danton wrote:
> 
> On Sun,  4 Oct 2020 12:21:45
> > From: Rob Clark <robdclark@chromium.org>
> > 
> > Now that the inactive_list is protected by mm_lock, and everything
> > else on per-obj basis is protected by obj->lock, we no longer depend
> > on struct_mutex.
> > 
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/msm/msm_gem.c          |  1 -
> >  drivers/gpu/drm/msm/msm_gem_shrinker.c | 54 --------------------------
> >  2 files changed, 55 deletions(-)
> > 
> [...]
> 
> > @@ -71,13 +33,8 @@ msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
> >  {
> >  	struct msm_drm_private *priv =
> >  		container_of(shrinker, struct msm_drm_private, shrinker);
> > -	struct drm_device *dev = priv->dev;
> >  	struct msm_gem_object *msm_obj;
> >  	unsigned long freed = 0;
> > -	bool unlock;
> > -
> > -	if (!msm_gem_shrinker_lock(dev, &unlock))
> > -		return SHRINK_STOP;
> >  
> >  	mutex_lock(&priv->mm_lock);
> 
> Better if the change in behavior is documented that SHRINK_STOP will
> no longer be needed.

btw I read through this and noticed you have your own obj lock, plus
mutex_lock_nested. I strongly recommend to just cut over to dma_resv_lock
for all object lock needs (soc drivers have been terrible with this
unfortuntaly), and in the shrinker just use dma_resv_trylock instead of
trying to play clever games outsmarting lockdep.

I recently wrote an entire blog length rant on why I think
mutex_lock_nested is too dangerous to be useful:

https://blog.ffwll.ch/2020/08/lockdep-false-positives.html

Not anything about this here, just general comment. The problem extends to
shmem helpers and all that also having their own locks for everything.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
