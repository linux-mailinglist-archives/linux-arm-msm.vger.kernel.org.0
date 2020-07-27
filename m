Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B7CD22F9DF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jul 2020 22:11:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729014AbgG0ULd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jul 2020 16:11:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726451AbgG0ULd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jul 2020 16:11:33 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1723C061794
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2020 13:11:32 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id 3so9040773wmi.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2020 13:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zDl5RUkfGHLSMInWwOp5px8udHYRLdUMjoic1PpjVzM=;
        b=KHq123hD2/MOYXmQm30EB+T4d29gRLDQE8GGnUbZIJXHvyl32bmUhJ6AL0P0OGCHdR
         T2iLLaWxd5MPHEG+8jlBEb5904LKf+hJ79p5kPdGa+N3iVa+Y6CVeZwLFYTdpaQUhs7D
         tsVSMWoP2JoVj05Bk1DLst1iCaCjNhYu2om7U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zDl5RUkfGHLSMInWwOp5px8udHYRLdUMjoic1PpjVzM=;
        b=jB6fqPxsJReeFTwMI5/kjtOrNl2nA6aHKJscEG2mfJiciMQT1nw0X8zB6NtXdTEvNs
         FVhNbsxUAP6i1uoOa9H6IYG9zIuKVucVUwtDxqef+UYeOR/pNcsrOsLSkwQNw8aXC7Ty
         76orOp4bYfHkZlNIocriCsYQzlFT9JQ1OTLL60VYplfA5RfEVdEDetfPxKfIOQJ2peSc
         zMC/1IQVoVQshuYnA9CGuQoKXQL/Y/P7768mRXRoP7dtViKkCgQrylOOp254ryZ4oAzk
         oQiG5SJof4mfdhaUCDzvDp3U5QRZHRy+uKsYwN5HqFD9GKhYi5epCa4c/1Uzl/sV7g7o
         xUEw==
X-Gm-Message-State: AOAM5320VdIGJ8IsdAiD04gLs611R3TB5/SDq45wXHg5zOfRsHPwZzPG
        zplnAp54m7KpMfDTB56OTdcMFQ==
X-Google-Smtp-Source: ABdhPJx2a1g6uHcTUbQzBEkQW+R9PdQZzqy6R2CTGKDOzBc2bsgXoymvHQ3XrYGlWk0eY5Ti4DJdiw==
X-Received: by 2002:a7b:c257:: with SMTP id b23mr762510wmj.164.1595880691611;
        Mon, 27 Jul 2020 13:11:31 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id b137sm1000166wmb.9.2020.07.27.13.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 13:11:30 -0700 (PDT)
Date:   Mon, 27 Jul 2020 22:11:28 +0200
From:   daniel@ffwll.ch
Cc:     Steve Cohen <cohens@codeaurora.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, sam@ravnborg.org, daniel@ffwll.ch,
        seanpaul@chromium.org, pdhaval@codeaurora.org,
        jsanka@codeaurora.org, adelva@google.com
Subject: Re: [PATCH V2] drm: hold gem reference until object is no longer
 accessed
Message-ID: <20200727201128.GX6419@phenom.ffwll.local>
References: <1595284250-31580-1-git-send-email-cohens@codeaurora.org>
 <20200727195507.GA240123@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200727195507.GA240123@kroah.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jul 27, 2020 at 09:55:07PM +0200, Greg KH wrote:
> On Mon, Jul 20, 2020 at 06:30:50PM -0400, Steve Cohen wrote:
> > A use-after-free in drm_gem_open_ioctl can happen if the
> > GEM object handle is closed between the idr lookup and
> > retrieving the size from said object since a local reference
> > is not being held at that point. Hold the local reference
> > while the object can still be accessed to fix this and
> > plug the potential security hole.
> > 
> > Signed-off-by: Steve Cohen <cohens@codeaurora.org>
> > ---
> >  drivers/gpu/drm/drm_gem.c | 10 ++++------
> >  1 file changed, 4 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> > index 7bf628e..ee2058a 100644
> > --- a/drivers/gpu/drm/drm_gem.c
> > +++ b/drivers/gpu/drm/drm_gem.c
> > @@ -871,9 +871,6 @@ drm_gem_flink_ioctl(struct drm_device *dev, void *data,
> >   * @file_priv: drm file-private structure
> >   *
> >   * Open an object using the global name, returning a handle and the size.
> > - *
> > - * This handle (of course) holds a reference to the object, so the object
> > - * will not go away until the handle is deleted.
> >   */
> >  int
> >  drm_gem_open_ioctl(struct drm_device *dev, void *data,
> > @@ -898,14 +895,15 @@ drm_gem_open_ioctl(struct drm_device *dev, void *data,
> >  
> >  	/* drm_gem_handle_create_tail unlocks dev->object_name_lock. */
> >  	ret = drm_gem_handle_create_tail(file_priv, obj, &handle);
> > -	drm_gem_object_put_unlocked(obj);
> >  	if (ret)
> > -		return ret;
> > +		goto err;
> >  
> >  	args->handle = handle;
> >  	args->size = obj->size;
> >  
> > -	return 0;
> > +err:
> > +	drm_gem_object_put_unlocked(obj);
> > +	return ret;
> >  }
> >  
> >  /**
> 
> As this seems to fix an important issue, any reason it wasn't cc: stable
> on it so that it gets backported properly?
> 
> How about a "Fixes:" tag so that we know what commit id it fixes so we
> know how far back to backport things?
> 
> And a hint to the maintainers that "this is an issue that needs to get
> into 5.8-final, it shouldn't wait around longer please" would have also
> been nice to see :)
> 
> And what chagned from v1, aren't you supposed to list that somewhere in
> the changelog or below the --- line (never remember what DRM drivers
> want here...)
> 
> Care to send a v3?

Don't worry, I'm pushing this to drm-misc-fixes now, should still make it
to 5.8. Plus cc: stable. I didn't bother with Fixes: since I think the bug
is rather old. Also, worst case you leak 32bit of some kernel memory that
got reused already (but yeah I know that's often enough to get the foot in
somewhere nasty and crack the door open).

I think it fell through cracks because Sam said he'll apply, guess that
didn't happen.

Also yes a changelog, somewhere, for next time around.
-Daniel


> 
> thanks,
> 
> greg k-h

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
