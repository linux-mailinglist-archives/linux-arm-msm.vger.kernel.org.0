Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E85E8D2A91
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2019 15:13:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387586AbfJJNNZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Oct 2019 09:13:25 -0400
Received: from mail-yb1-f193.google.com ([209.85.219.193]:38441 "EHLO
        mail-yb1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727788AbfJJNNY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Oct 2019 09:13:24 -0400
Received: by mail-yb1-f193.google.com with SMTP id r68so1911920ybf.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2019 06:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=lPUoYQxZyPgy6cMBZcypdWlf69r2dSAMQKiUwUDOqmg=;
        b=CyaD597+jmcwXVaBYnS6aJwAwm/fMZz40b01867553jRikQDWPoHVhMEe9mkbqWB7Q
         gYOXPUHIt8H5m20xFl2lBrRoFtaRk1qPC7guMRYHx/8+n2mNXrA0uTEq/xgHb0rVu54R
         GbQWLrEw/BFA+XKQznEBIFLBrl5KnUpffHjF2FYW+p+jaB0zD44/SbfTTA0+hjDJdD4u
         9ufRMYMnXjUINM00BVWl8xzIxLM4wEDwRTstlS6MvALTzR6PHCLT6jI53LiAtvjMzM38
         VCAFDLFxahRyNnULFwVvijtTmLyzvUkNzNNUaVffFKJziiV7dXVSbFAEeSkIPUTnL9gb
         /Pxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=lPUoYQxZyPgy6cMBZcypdWlf69r2dSAMQKiUwUDOqmg=;
        b=FtRQvHZMzePkvWD5FriHJzQ07EgQW3pQFlx4BCSZWXqx+3AO+yCz6tmQgRdt4qckUT
         Pt2/z8uo0m/VUjqKhTIcXx5DoJqQ3pv9Y7mLTBs+vurbShZ+78krKHPmkhWcGBlAhRtq
         RIvF0jg1ofRn1KQJSpgNSGX2i63A5zUU+qHDMjfxEJ18gy1qAx3VfLbOWeHnKa9Ur8qg
         7w9J0EU+5tkJLBgoGAQHZqpziu1iOAZgKfHHLW4SKQiKkMcFVo53HA5dIO9SBllX51XR
         svgMAnQrPkrS926gqXndbdR0GD1YN3zLHZsApfv9bGxA3jopi1H0DAPE2uVxIo8n9/o+
         pxOQ==
X-Gm-Message-State: APjAAAWvlAaWLhKtfM2nUDVrAXpaF3U3wc9Hm4Poq9khRwkGERRVZIIP
        AAxyZbdOvhUCGi97d5af0rfivA==
X-Google-Smtp-Source: APXvYqw6lNLeKIG/QVCUCrhOe+WUcZLbsbst+nyYSND8iMRRXvFEdh9N3i1diRKJKHEyCQjbJtRHSA==
X-Received: by 2002:a25:7a47:: with SMTP id v68mr6211821ybc.438.1570713203791;
        Thu, 10 Oct 2019 06:13:23 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
        by smtp.gmail.com with ESMTPSA id v40sm1302001ywh.109.2019.10.10.06.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2019 06:13:23 -0700 (PDT)
Date:   Thu, 10 Oct 2019 09:13:22 -0400
From:   Sean Paul <sean@poorly.run>
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Sean Paul <sean@poorly.run>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Sean Paul <seanpaul@chromium.org>
Subject: Re: [PATCH v2 16/24] drm/msm: dpu: Add modeset lock checks where
 applicable
Message-ID: <20191010131322.GI85762@art_vandelay>
References: <20181116184238.170034-1-sean@poorly.run>
 <20181116184238.170034-17-sean@poorly.run>
 <CAKMK7uEx2fL69jPGXVpQhhcj8Q8zEzb3ogCv-uVyGrX3QYFeWQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uEx2fL69jPGXVpQhhcj8Q8zEzb3ogCv-uVyGrX3QYFeWQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Oct 10, 2019 at 12:20:56AM +0200, Daniel Vetter wrote:
> On Fri, Nov 16, 2018 at 7:44 PM Sean Paul <sean@poorly.run> wrote:
> >
> > From: Sean Paul <seanpaul@chromium.org>
> >
> > Add modeset lock checks to functions that could be called outside the
> > core atomic stack.
> >
> > Changes in v2:
> > - None
> >
> > Signed-off-by: Sean Paul <seanpaul@chromium.org>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 2 ++
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 1 +
> >  2 files changed, 3 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > index a008a87a8113..cd0a0bea4335 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > @@ -284,6 +284,8 @@ enum dpu_intf_mode dpu_crtc_get_intf_mode(struct drm_crtc *crtc)
> >                 return INTF_MODE_NONE;
> >         }
> >
> > +       WARN_ON(!drm_modeset_is_locked(&crtc->mutex));
> > +
> >         /* TODO: Returns the first INTF_MODE, could there be multiple values? */
> >         drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state->encoder_mask)
> >                 return dpu_encoder_get_intf_mode(encoder);
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > index 64134d619748..5104fc01147e 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > @@ -358,6 +358,7 @@ void dpu_kms_encoder_enable(struct drm_encoder *encoder)
> >         if (funcs && funcs->commit)
> >                 funcs->commit(encoder);
> >
> > +       WARN_ON(!drm_modeset_is_locked(&dev->mode_config.connection_mutex));
> >         drm_for_each_crtc(crtc, dev) {
> >                 if (!(crtc->state->encoder_mask & drm_encoder_mask(encoder)))
> >                         continue;
> 
> I'm fairly sure this is called in the atomic_commit path, and in there
> you might not actually hold these locks (if you do a nonblocking
> modeset).

Indeed. I'm not sure what my thinking was when submitting this, I think some of
the callsites may have changed since this was posted (with the enable/probe
refactors from a few months ago). At any rate, doesn't matter now, I'll post the
revert :-)

> 
> The locking rules for ->state are pretty fun: Either hold the lock, or
> be in atomic commit. In the later case atomic helpers' commit ordering
> guarantees that you can safely access ->state (but read-only only)
> without hodling any locks. You might want to revert.
> 
> Don't ask why I stumbled over this.

Ok, I'll just assume that you read seanpaul's 11-month old reviews before bed to
relax ;-)

Sean


> -Daniel
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> +41 (0) 79 365 57 48 - http://blog.ffwll.ch

-- 
Sean Paul, Software Engineer, Google / Chromium OS
