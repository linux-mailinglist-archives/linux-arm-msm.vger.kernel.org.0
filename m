Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85D602305CF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jul 2020 10:52:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728195AbgG1Iwt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jul 2020 04:52:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728183AbgG1Iwt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jul 2020 04:52:49 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE1ECC061794
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2020 01:52:48 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id t142so11002968wmt.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2020 01:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=HGy3jmbnLWtAugJhNyMPmIfpo7WUVn9rkKkQMW0ipLs=;
        b=M0e+APlLzUzGPEQPb5lfmfSp/o1k5PEssqciRfuFNdb3qha7nkzlBkC5i4JT2rzaO3
         sVfant5ccFL4AzNOePYhmHnXyZ4waR4H7ygUIgWUkzaFMamybKKUIxUuo6i3HWPBvxGn
         RoVPbV+rY96rVH4R2kzqG5FARO4ooptQ5407s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HGy3jmbnLWtAugJhNyMPmIfpo7WUVn9rkKkQMW0ipLs=;
        b=KP+fdKz4EMhF/NUjM4ZU+OyiJMCDacuao2/JxzybPYH614gW6Z/9X2/PexT8rRFxnG
         UyigqR3SU+VsyRG2oORuhNg5B6MjgzzNq4r/Nl8p9pp4aa9kCqeIuRPjvS5N5m+Nj4ie
         4DkA0/4J+R3XkEaXvdNXxp5CZ17RVWHl828m88KTvTTHlfM9I8xgQruRjiL/A8y+0t8h
         9GCXbKQoXW4aA15r0HFjiXRForV2A/TTDTiEoNUpIryaoRWCYbkqbPLRgmpZBSmD4Ul2
         q3b1qBp4zGJoyprO6aql4S7hOtrLWuE+4jXHgKgUoJGQb3QrhptAdXdf+WjCRyk0knzb
         3lBA==
X-Gm-Message-State: AOAM531CPz0KgyvmFOEAp8dGXYXYGXuzGHXVAQIShZero5eizcnrtbNB
        Am0jCvXW8R3mOTiOe/zQ2ey2kqTDh0g=
X-Google-Smtp-Source: ABdhPJyiM85CyXyw1HU6z/kML8IsbJGp9eXAAaJbV6ajj+CHl0qhajof/NwnJjkMBiAqdI6zzfqQxw==
X-Received: by 2002:a7b:ce0e:: with SMTP id m14mr3189753wmc.160.1595926367684;
        Tue, 28 Jul 2020 01:52:47 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id z207sm3317950wmc.2.2020.07.28.01.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2020 01:52:46 -0700 (PDT)
Date:   Tue, 28 Jul 2020 10:52:44 +0200
From:   daniel@ffwll.ch
Cc:     daniel@ffwll.ch, adelva@google.com,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        pdhaval@codeaurora.org, seanpaul@chromium.org,
        linux-arm-msm@vger.kernel.org, jsanka@codeaurora.org,
        sam@ravnborg.org
Subject: Re: [Freedreno] [PATCH V2] drm: hold gem reference until object is
 no longer accessed
Message-ID: <20200728085244.GY6419@phenom.ffwll.local>
References: <1595284250-31580-1-git-send-email-cohens@codeaurora.org>
 <20200727195507.GA240123@kroah.com>
 <20200727201128.GX6419@phenom.ffwll.local>
 <f035111e7139bdaeb7562afd2415f366@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f035111e7139bdaeb7562afd2415f366@codeaurora.org>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jul 27, 2020 at 05:54:59PM -0400, cohens@codeaurora.org wrote:
> On 2020-07-27 16:11, daniel@ffwll.ch wrote:
> > On Mon, Jul 27, 2020 at 09:55:07PM +0200, Greg KH wrote:
> > > On Mon, Jul 20, 2020 at 06:30:50PM -0400, Steve Cohen wrote:
> > > > A use-after-free in drm_gem_open_ioctl can happen if the
> > > > GEM object handle is closed between the idr lookup and
> > > > retrieving the size from said object since a local reference
> > > > is not being held at that point. Hold the local reference
> > > > while the object can still be accessed to fix this and
> > > > plug the potential security hole.
> > > >
> > > > Signed-off-by: Steve Cohen <cohens@codeaurora.org>
> > > > ---
> > > >  drivers/gpu/drm/drm_gem.c | 10 ++++------
> > > >  1 file changed, 4 insertions(+), 6 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> > > > index 7bf628e..ee2058a 100644
> > > > --- a/drivers/gpu/drm/drm_gem.c
> > > > +++ b/drivers/gpu/drm/drm_gem.c
> > > > @@ -871,9 +871,6 @@ drm_gem_flink_ioctl(struct drm_device *dev, void *data,
> > > >   * @file_priv: drm file-private structure
> > > >   *
> > > >   * Open an object using the global name, returning a handle and the size.
> > > > - *
> > > > - * This handle (of course) holds a reference to the object, so the object
> > > > - * will not go away until the handle is deleted.
> > > >   */
> > > >  int
> > > >  drm_gem_open_ioctl(struct drm_device *dev, void *data,
> > > > @@ -898,14 +895,15 @@ drm_gem_open_ioctl(struct drm_device *dev, void *data,
> > > >
> > > >  	/* drm_gem_handle_create_tail unlocks dev->object_name_lock. */
> > > >  	ret = drm_gem_handle_create_tail(file_priv, obj, &handle);
> > > > -	drm_gem_object_put_unlocked(obj);
> > > >  	if (ret)
> > > > -		return ret;
> > > > +		goto err;
> > > >
> > > >  	args->handle = handle;
> > > >  	args->size = obj->size;
> > > >
> > > > -	return 0;
> > > > +err:
> > > > +	drm_gem_object_put_unlocked(obj);
> > > > +	return ret;
> > > >  }
> > > >
> > > >  /**
> > > 
> > > As this seems to fix an important issue, any reason it wasn't cc:
> > > stable
> > > on it so that it gets backported properly?
> > > 
> > > How about a "Fixes:" tag so that we know what commit id it fixes so we
> > > know how far back to backport things?
> > > 
> > > And a hint to the maintainers that "this is an issue that needs to get
> > > into 5.8-final, it shouldn't wait around longer please" would have
> > > also
> > > been nice to see :)
> > > 
> > > And what chagned from v1, aren't you supposed to list that somewhere
> > > in
> > > the changelog or below the --- line (never remember what DRM drivers
> > > want here...)
> > > 
> > > Care to send a v3?
> > 
> > Don't worry, I'm pushing this to drm-misc-fixes now, should still make
> > it
> > to 5.8. Plus cc: stable. I didn't bother with Fixes: since I think the
> > bug
> > is rather old. Also, worst case you leak 32bit of some kernel memory
> > that
> > got reused already (but yeah I know that's often enough to get the foot
> > in
> > somewhere nasty and crack the door open).
> > 
> > I think it fell through cracks because Sam said he'll apply, guess that
> > didn't happen.
> 
> Sam added his Reviewed-By on V1 with a comment to rename the goto label,
> but in V2 I also updated the API documentation and the commit text for
> a more complete change and thought he would re-add the tag.
> 
> > Also yes a changelog, somewhere, for next time around.
> 
> Apologies, it won't happen again. Should I still submit a V3?
> It looks like you've got Greg's concerns covered.

Uh no, but we need another patch to re-add the kerneldoc you deleted. I
missed that when merging your patch. Also that's kinda what patch
changelogs are for, for blind reviewers like me :-)
-Daniel

> 
> -Steve
> 
> > -Daniel
> > 
> > 
> > > 
> > > thanks,
> > > 
> > > greg k-h

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
