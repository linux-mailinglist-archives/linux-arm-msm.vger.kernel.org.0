Return-Path: <linux-arm-msm+bounces-42352-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBF49F332F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 15:27:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE50B18834DC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 14:27:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D525204F9F;
	Mon, 16 Dec 2024 14:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="aLOauIXC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B0A203D42
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2024 14:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734359232; cv=none; b=qwua9Ai4MzAXCkQHfUb5PX763Ab311m8MXMZ4uPD+gNkK2CZJ6y3ZTuaA0hCr5vxM+Aa0MtCjeF76S35cIdbK9kIJDOwIt1fnM5X6jzNp/aRz7rq3liAU4d5uxet6X7BEjFrNAgJo/ROqjJR6t80TDrJC5ZEeLvJgvgIfbRAjMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734359232; c=relaxed/simple;
	bh=ED5JTQkZ6fE65RM3jQ6gIcZ0j02817IKZ+GJ3EmtFAM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WA+LlJ5nJEAX+TG+DE9jSgdaVE+NKA3+ucNncRA34sJr0b1bKWfv6J5kzF16ERlU5rLbz/rUKo15KghJlBG9mkiCkm+LMjLkY3Le9ioKzNenVjQub9Xo3m3ULVWdRQrcz+4W25nUsIVagn/ryHz++RqSqOh7y8w/x3sSnGaLIfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=aLOauIXC; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-434a766b475so44439645e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2024 06:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1734359228; x=1734964028; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z8Oktj07WxPQkf8tAMVutVUrZO5J/YvoL7NP4SyxFZg=;
        b=aLOauIXCZ2zW4HtOpxN1clNGaG39CNChA6kbCOGmQd38kiFavgqN42KUyW7cd6mH+e
         WH71OlsZqgMhQ2fYFPbTZaPq+V7jsO5/Pw7oIXoI3eNpYW3NNVEjcpUV9OY0791Ce476
         tiqOZ1VYeKnA/Zn7izIdBkdePmljvqXbPTbSo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734359228; x=1734964028;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z8Oktj07WxPQkf8tAMVutVUrZO5J/YvoL7NP4SyxFZg=;
        b=XWbdmLi1jJd8+F35hq+Y7J5Ih9BkMvNQKJcBZPSJXJPoviMtCmky0DB6JsWxB9mCoA
         mxptjU8lcqisyAezgVNY4Zr1FgaWk+SpQJV6hx+ZtLw4t2GqJGMrGyPa3NAxYGV9sJtW
         ytpYfGGATBtDnTWsK3+jBD63wejwlMYitlxuK9oz9Ys+ES90fu0V6IFU+qd5bp7hF2VQ
         9zeFwcvQMFNkzzSwBgPhSKgcGej4Nojyl6zsFR/fYNNf/PpxaKZ8NMTih6qGo3vaax4R
         w5SEu4wihV8oKedSHZTBY0BB8JtrtffHCqGQW2FY4Kf2FdVEvgC7Te0Kfd1y9O1TOAD4
         kGUA==
X-Forwarded-Encrypted: i=1; AJvYcCUB9w8L4XZxasaOItJ0Mcw/pyOABikW+LwGUWpX4NGluCioiEwXngavctRCuY0PcpsZRaqSVEdn8BnBcQMB@vger.kernel.org
X-Gm-Message-State: AOJu0Ywep4HxCfmLXkyueJTTlv7umNrn/QN182mMXdXY0y6h9B9U1KD7
	cjEL7tAmgmAY/6tdEeFM+vWJ77J1jr/qtuikBDB3tjZB8C/C74gcsIQymdgqQYs=
X-Gm-Gg: ASbGncvaquukjBWeYcGS/E59SvyKlU1k7l7yyEITKULQhsrXljbYrZwFmXwW0I40/he
	D9cuZxhwVrGvSZKM7XFSvkAca+PtHzBfjX96oUWTfBHfTPErTg2juvZAgHlglBDZZGF1ysG9y0N
	EX8lrEKSsSSQADBHAOsatDCdiDJDFEbzUHWpaDOepHAXqRndmgzWbSO0PUvqlajD15puY80VuKt
	ZWsk2MnwaY7OZsOpbif9TVX+CZTJ1tS9iSC3f/Yb2Li8uoEvMImNCAg1rE09sMftiW+
X-Google-Smtp-Source: AGHT+IGn5RgQ81hy0jW21u7TUA0sQjR5dFe9QEPAlFJD5h/VCFCRbd8HnQjhW9nAjZ+l5PGK8UsXnQ==
X-Received: by 2002:a05:600c:b99:b0:435:9ed3:5698 with SMTP id 5b1f17b1804b1-4362aa9784cmr102190165e9.24.1734359228496;
        Mon, 16 Dec 2024 06:27:08 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4362557c54bsm141004955e9.13.2024.12.16.06.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 06:27:07 -0800 (PST)
Date: Mon, 16 Dec 2024 15:27:05 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>,
	Maxime Ripard <mripard@kernel.org>, Rob Clark <robdclark@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>, quic_ebharadw@quicinc.com,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Rob Clark <robdclark@chromium.org>,
	Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2 02/22] drm: Add valid clones check
Message-ID: <Z2A4uahCHuOz45Fc@phenom.ffwll.local>
Mail-Followup-To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Maxime Ripard <mripard@kernel.org>, Rob Clark <robdclark@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>, quic_ebharadw@quicinc.com,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Rob Clark <robdclark@chromium.org>,
	Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
References: <20240924-concurrent-wb-v2-0-7849f900e863@quicinc.com>
 <20240924-concurrent-wb-v2-2-7849f900e863@quicinc.com>
 <20240925-hasty-bald-caribou-eedbf5@houat>
 <80d08449-71de-4a7f-8b2a-8af565d8d701@quicinc.com>
 <54188c68-41c7-4a42-9eca-67363b30217a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <54188c68-41c7-4a42-9eca-67363b30217a@quicinc.com>
X-Operating-System: Linux phenom 6.12.3-amd64 

On Sun, Dec 15, 2024 at 06:19:08PM -0800, Abhinav Kumar wrote:
> Hi Maxime
> 
> Gentle reminder on this one.
> 
> We are looking for some advice on how to go about KUnit for this static
> function.
> 
> Please help with our question below.
> 
> Thanks
> 
> Abhinav
> 
> On 12/6/2024 4:48 PM, Jessica Zhang wrote:
> > 
> > 
> > On 9/25/2024 12:23 AM, Maxime Ripard wrote:
> > > On Tue, Sep 24, 2024 at 03:59:18PM GMT, Jessica Zhang wrote:
> > > > Check that all encoders attached to a given CRTC are valid
> > > > possible_clones of each other.
> > > > 
> > > > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > > > ---
> > > >   drivers/gpu/drm/drm_atomic_helper.c | 23 +++++++++++++++++++++++
> > > >   1 file changed, 23 insertions(+)
> > > > 
> > > > diff --git a/drivers/gpu/drm/drm_atomic_helper.c
> > > > b/drivers/gpu/drm/drm_atomic_helper.c
> > > > index 43cdf39019a4..cc4001804fdc 100644
> > > > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > > > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > > > @@ -574,6 +574,25 @@ mode_valid(struct drm_atomic_state *state)
> > > >       return 0;
> > > >   }
> > > > +static int drm_atomic_check_valid_clones(struct
> > > > drm_atomic_state *state,
> > > > +                     struct drm_crtc *crtc)
> > > > +{
> > > > +    struct drm_encoder *drm_enc;
> > > > +    struct drm_crtc_state *crtc_state =
> > > > drm_atomic_get_new_crtc_state(state,
> > > > +                                      crtc);
> > > > +
> > > > +    drm_for_each_encoder_mask(drm_enc, crtc->dev,
> > > > crtc_state->encoder_mask) {
> > > > +        if ((crtc_state->encoder_mask & drm_enc->possible_clones) !=
> > > > +            crtc_state->encoder_mask) {
> > > > +            DRM_DEBUG("crtc%d failed valid clone check for mask
> > > > 0x%x\n",
> > > > +                  crtc->base.id, crtc_state->encoder_mask);
> > > > +            return -EINVAL;
> > > > +        }
> > > > +    }
> > > > +
> > > > +    return 0;
> > > > +}
> > > > +
> > > >   /**
> > > >    * drm_atomic_helper_check_modeset - validate state object for
> > > > modeset changes
> > > >    * @dev: DRM device
> > > > @@ -745,6 +764,10 @@ drm_atomic_helper_check_modeset(struct
> > > > drm_device *dev,
> > > >           ret = drm_atomic_add_affected_planes(state, crtc);
> > > >           if (ret != 0)
> > > >               return ret;
> > > > +
> > > > +        ret = drm_atomic_check_valid_clones(state, crtc);
> > > > +        if (ret != 0)
> > > > +            return ret;
> > > >       }
> > > 
> > > Pretty much the same comment, we should have kunit tests for this.
> > 
> > Hey Maxime,
> > 
> > I'm working on the kunit test for this and had a question on the design
> > for the unit test:
> > 
> > Since this is a static helper that returns a pretty common error code,
> > how would you recommend going about making sure that
> > `drm_atomic_check_valid_clones()` specifically is returning the error
> > (and not a different part of check_modeset) when testing the
> > check_valid_clones() failure path?

So the usual way to test very specific things of a big function is to
first setup a driver and atomic request which does pass all checks. And
then do a minimal change which does not pass anymore.

So what you could do here is have 3 connectors 1 crtc, but only the first
two connectors can be cloned. Then do an atomic request with those two
connectors and the crtc. Then the 2nd request is with one of the
connectors replaced with the 3rd one (so it's still a clone config, but
not an invalid one), then have a failure.

Note: I didn't check all the details, I might be getting something wrong
here, but the idea should work.

Cheers, Sima

> > 
> > Thanks,
> > 
> > Jessica Zhang
> > 
> > > 
> > > Maxime
> > 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

