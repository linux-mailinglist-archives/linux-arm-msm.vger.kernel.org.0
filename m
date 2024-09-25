Return-Path: <linux-arm-msm+bounces-32453-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FC198557C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 10:29:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A841A1C2087E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 08:29:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42AD915990E;
	Wed, 25 Sep 2024 08:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iYxVLF4u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4C21598E9
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Sep 2024 08:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727252944; cv=none; b=QZpQtlhAemYDBKFbzh4TyCKZzjhX1+iuLtiuNfdwPviXPHbAqF9Nsqy7OPFGbkv2UhOXclnUKprpmV5hvVfLNVj9fHWqVWKoCPfF9qv3QLf4CR5ntbG0vM9DwXPanVim3OfUDC5bdmwFt3nj6waNFJ+olFo5nAUFIa3W9qCnctw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727252944; c=relaxed/simple;
	bh=q29PEj4IlMN9GSxCgG1by5KAX38sxz8FA6VWkjwf1+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=In2EfPBFrJvBnSiGAosNfNaEUtfaupT0vMXjdeGGf+62r22bJDAD5kotOQfqF+dVDn4q0nTv7JCVqj8iiRjm3cVe3qOevErq7QUyrIR4bHn2tdt2DTzB3ZgYiXJCooZ4tBWvQb/MfDoLQSJ/73/3iyl3H7KV9xt+jjyIVU7nAF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iYxVLF4u; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-53653ee23adso5877100e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Sep 2024 01:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727252940; x=1727857740; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fJc/ZEonsSpvQx65a5f325f6xswc665KOha+qhiv8i8=;
        b=iYxVLF4uOOaUooX9pmelWwGNWXXDY/6O5fYHVjSnvArikmH1ULv6LImgfk9uub+B+M
         9NPsqTDi1cz42N7Hfoxa397tV//PW3j0gxux+7Mk2r8Koy1H3E+q+UlStQvl6Lmr0YCs
         y/pQY6MgGLYbeu+b31hKHhtVLUW49IelRGigZuTZd3YT3zPK6Pd29sq1QugYtKUmIRVA
         3kCee9zrOIMwcNQj17nzjFSOeZYX7rs8xfwCJ/4kl6JmH48WQlE/xTKAw8/jv/WTVst9
         l8VoX6nFhfGvrZqR0epPu3IHD4uILHSSZnUQ7LFuOfYdNQ2vRNI6DLli23RkuE0YIKdZ
         TJAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727252940; x=1727857740;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fJc/ZEonsSpvQx65a5f325f6xswc665KOha+qhiv8i8=;
        b=aF089O0CRXhkrWTBY/LM4l0h/WxXyOZEj/kt8l6XS6xYEmEzIizmIyqizdnsyasH9N
         uHgp4LWs/qpwN27ha6nyPSnHngphBRQTpGjd/9gQ01OqLMk8WAmw/ZMzmA5ngn7UnOcx
         bLiYMetSZl086FYO420ysD1ocLKB4huSJ9DBbtPUgoIhSFES2YGxbQ8kU8BUKn5aX9L0
         A6EbLIWoWR6BXju6ECym6TXLvkfRRiZ/5nZcl0F5suOTW9SNunFNlB1hfr8GnG/KEJr2
         N11QmkAK0eAV8Ka+92FC+MaL8tF7PsxC92rmaZ1gMQdAzyb1+1vacs2pbP1hdHRTiym+
         INeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVC3bhJC/zeJlgu4dODbN1AYFfGPsZOAfsdNwfw/R/T9cplXoGVX+JngZVcqA+36gsU7zdOpbBNaVNfCccr@vger.kernel.org
X-Gm-Message-State: AOJu0YyQnZoF1Doym5V8xTQNcKUOBd0gO53o/MVwqlg8Cw5KOGvgxUZh
	QPZRp5FHheBZXtn7L9lF8a7UCKjtl+vAp9+yKOn27SnsiUvAVhvo4VnP/08OrlY=
X-Google-Smtp-Source: AGHT+IFWtR5Spi/hxHDKmyK+yEjL67FVSC0HLJLKUPO8bW2hzqf39SxWRho/7uZXgcWIoMTcw6ko+w==
X-Received: by 2002:a05:6512:3f07:b0:535:6ba7:7725 with SMTP id 2adb3069b0e04-5387048a6d7mr1170484e87.3.1727252940511;
        Wed, 25 Sep 2024 01:29:00 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-537a8648d41sm454852e87.224.2024.09.25.01.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 01:28:59 -0700 (PDT)
Date: Wed, 25 Sep 2024 11:28:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	quic_ebharadw@quicinc.com, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>, 
	Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2 14/22] drm/msm/dpu: Require modeset if clone mode
 status changes
Message-ID: <zwxgml3qi3t253y2yhmi5lcpxg5odugrncfgh74y36kwubd4xv@oem2vicytu5i>
References: <20240924-concurrent-wb-v2-0-7849f900e863@quicinc.com>
 <20240924-concurrent-wb-v2-14-7849f900e863@quicinc.com>
 <yjfe5wajajeqmcp65kbvcttzgkrsfv5rhkbvqvioqx3rwdn6g6@2h2byk2l2imy>
 <75297d0d-528a-4152-b35f-ba41fbf914dc@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <75297d0d-528a-4152-b35f-ba41fbf914dc@quicinc.com>

On Tue, Sep 24, 2024 at 05:05:43PM GMT, Abhinav Kumar wrote:
> 
> 
> On 9/24/2024 4:25 PM, Dmitry Baryshkov wrote:
> > On Tue, Sep 24, 2024 at 03:59:30PM GMT, Jessica Zhang wrote:
> > > If the clone mode enabled status is changing, a modeset needs to happen
> > > so that the resources can be reassigned
> > 
> > Sima's comment regarding crtc_state->mode_changed seems to be ignored...
> > 
> 
> Not ignored. One of us has to take that up. There is a broader cleanup
> required for that.

At least then it should be mentioned in the commit message or under the
commit message.

> 
> We can sync up on how to tackle this : whether it needs to be in this series
> or push another one cleaning up all the instances.


Yes, let's sync separately.

> 
> > > 
> > > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > > ---
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 8 ++++++++
> > >   1 file changed, 8 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > index a7850bf844db..f20e44e9fc05 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > @@ -1268,6 +1268,8 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
> > >   {
> > >   	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state,
> > >   									  crtc);
> > > +	struct drm_crtc_state *old_crtc_state = drm_atomic_get_old_crtc_state(state,
> > > +									      crtc);
> > >   	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
> > >   	struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc_state);
> > > @@ -1279,6 +1281,8 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
> > >   	int rc = 0;
> > >   	bool needs_dirtyfb = dpu_crtc_needs_dirtyfb(crtc_state);
> > > +	bool clone_mode_requested = drm_crtc_in_clone_mode(old_crtc_state);
> > > +	bool clone_mode_enabled = drm_crtc_in_clone_mode(crtc_state);
> > >   	/* there might be cases where encoder needs a modeset too */
> > >   	drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc_state->encoder_mask) {
> > > @@ -1286,6 +1290,10 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
> > >   			crtc_state->mode_changed = true;
> > >   	}
> > > +	if ((clone_mode_requested && !clone_mode_enabled) ||
> > > +	    (!clone_mode_requested && clone_mode_enabled))
> > > +		crtc_state->mode_changed = true;
> > > +
> > >   	if (drm_atomic_crtc_needs_modeset(crtc_state)) {
> > >   		rc = dpu_crtc_assign_resources(crtc, crtc_state);
> > >   		if (rc < 0)
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > 

-- 
With best wishes
Dmitry

