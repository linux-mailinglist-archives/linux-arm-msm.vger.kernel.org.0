Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91A7FD414B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2019 15:31:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728220AbfJKNb4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Oct 2019 09:31:56 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:43752 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727950AbfJKNb4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Oct 2019 09:31:56 -0400
Received: by mail-ot1-f66.google.com with SMTP id o44so7931243ota.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2019 06:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jOlMrLmiDpbJQN8gDxj5N5gUwCySt5JOBF27z06OLYc=;
        b=VjlIJKIYoq7/WRTQm4NQAt1mykqe9vwDAfvkkOm5uY9YvvNYf942Ym4E26GNAfHpeW
         1YWAakr9lHEFX0ml3HXVdZA2SmjnB65Fhm4w2Y+uGc1CC47CwKgdlZy0tLi0jrVYn/dy
         lLhUfE1b9oFV0uZgQJOpREWL6LJhyPWujRNLcvNLQrANKDgesawRB2vDuQB6RAMiBlGJ
         0gd30OVr6lpOFiKi5kcYE5QYRjGIGuRuJ3yGcpYT0L99BInGAsIW2j3pOwQpUsw3K4uY
         jCgZ0vdUEWa7gUox8AXllKl5lvA9ZYEA9t7o9sOfOIxWEZV6B/J0xdwghzgNCJAgHFel
         9Uew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jOlMrLmiDpbJQN8gDxj5N5gUwCySt5JOBF27z06OLYc=;
        b=Q526PRwoq5cMBEVz4rr7kqWOZCZD22eFYvIRUo2tU2goZ7wzXVEKnm2vexxVbV4an4
         Pw4PTnF+4Qmq+vZDuj8HSs+roVHVU152otmt1sLU5uvBHDYWz0eIjPA03nzfzb8drdaG
         MWSSaGDVUcqlh7trgb1Di/+Y89fKqj+HNLkArMWjQThCgt819WFOzLUSWMgWAEVDXEU2
         FQmBDVnGA3k2vOAtzSv9Fyjz1k2VBltN1MUfM2FrleuIy3IrlqO/wqoGxoAyDvbp83Bd
         mK+c1fB5wGC3rARU6mvwKg/SFuiyf4PA6gJ6H9XYk8kRJK/WegqNfyic50/d2FEhQ8r5
         d7dQ==
X-Gm-Message-State: APjAAAXXjC5aKACu1NKzr6g59o1lSYtgAMNmUpYfqp0mSz4Sc6tPZwzc
        dQWrov7VhQXlZOScq51NSGh0ZWpsH/s=
X-Google-Smtp-Source: APXvYqy0QnS/jlV3V8aa6/4ScrN1IKjTBx41QX5VNHlcDL/NkgQckADIHAN9KSxbMsnEihlPNjrL1A==
X-Received: by 2002:a81:1ac4:: with SMTP id a187mr2453439ywa.482.1570800713019;
        Fri, 11 Oct 2019 06:31:53 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
        by smtp.gmail.com with ESMTPSA id d4sm2180143ywf.69.2019.10.11.06.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2019 06:31:52 -0700 (PDT)
Date:   Fri, 11 Oct 2019 09:31:51 -0400
From:   Sean Paul <sean@poorly.run>
To:     Ben Dooks <ben.dooks@codethink.co.uk>,
        linux-kernel@lists.codethink.co.uk,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH] drm/msm: make a5xx_show and a5xx_gpu_state_put static
Message-ID: <20191011133151.GP85762@art_vandelay>
References: <20191009114607.701-1-ben.dooks@codethink.co.uk>
 <20191009154406.GB13386@jcrouse1-lnx.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191009154406.GB13386@jcrouse1-lnx.qualcomm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Oct 09, 2019 at 09:44:06AM -0600, Jordan Crouse wrote:
> On Wed, Oct 09, 2019 at 12:46:07PM +0100, Ben Dooks wrote:
> > The a5xx_show and a5xx_gpu_state_put objects are not exported
> > outside of the file, so make them static to avoid the following
> > warnings from sparse:
> > 
> > drivers/gpu/drm/msm/adreno/a5xx_gpu.c:1292:5: warning: symbol 'a5xx_gpu_state_put' was not declared. Should it be static?
> > drivers/gpu/drm/msm/adreno/a5xx_gpu.c:1302:6: warning: symbol 'a5xx_show' was not declared. Should it be static?
> 
> Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>
> 

Applied to msm-next, thanks for the review and patch!

Sean

> > Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> > ---
> > Cc: Rob Clark <robdclark@gmail.com>
> > Cc: Sean Paul <sean@poorly.run>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: linux-arm-msm@vger.kernel.org
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: freedreno@lists.freedesktop.org
> > ---
> >  drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> > index e9c55d1d6c04..7fdc9e2bcaac 100644
> > --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> > @@ -1289,7 +1289,7 @@ static void a5xx_gpu_state_destroy(struct kref *kref)
> >  	kfree(a5xx_state);
> >  }
> >  
> > -int a5xx_gpu_state_put(struct msm_gpu_state *state)
> > +static int a5xx_gpu_state_put(struct msm_gpu_state *state)
> >  {
> >  	if (IS_ERR_OR_NULL(state))
> >  		return 1;
> > @@ -1299,8 +1299,8 @@ int a5xx_gpu_state_put(struct msm_gpu_state *state)
> >  
> >  
> >  #if defined(CONFIG_DEBUG_FS) || defined(CONFIG_DEV_COREDUMP)
> > -void a5xx_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
> > -		struct drm_printer *p)
> > +static void a5xx_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
> > +		      struct drm_printer *p)
> >  {
> >  	int i, j;
> >  	u32 pos = 0;
> > -- 
> > 2.23.0
> > 
> 
> -- 
> The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> a Linux Foundation Collaborative Project

-- 
Sean Paul, Software Engineer, Google / Chromium OS
