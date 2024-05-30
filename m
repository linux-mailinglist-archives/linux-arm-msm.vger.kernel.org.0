Return-Path: <linux-arm-msm+bounces-21094-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 316068D4A93
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 13:23:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5551E1C20433
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 11:23:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 523C917C7D9;
	Thu, 30 May 2024 11:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZJ3E7wz2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759CF178CEA
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 11:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717068039; cv=none; b=VVY4h6NVT7Rv26s1hXGtdKfRa5h1H06SYfHgThMh6qmu7SK/LcLZ2Emsm+YIaEPPiCRA2OHahb5TvBqVBSv03prSRs6n5u3zpuz95ZQe2W7C4y8hHw+al3bOIGKYIzMekLHDCUfBgrTPMj6nMNqwcn/wBHpX8XVTdSQ1v3kpmJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717068039; c=relaxed/simple;
	bh=xYf0mkASB9nxZnZpE5f+cP17tvZTbxn9M/pl0YFPqQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eqBFzZjZexq4ds0bN1tLFqn7IEP0l3A5eJxhCi7BblSWB5QwaEK5qCZTNN1j9hDPMRybYQSANx5zkkYbtk3fXS4PcyrjcI5wt9cYhMCxAp3BIpbxqTffZmmYUN8KCt6rM593DBaxU7j4EfYea4gXYlVrgicRlbjrZtV8bUR3BUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZJ3E7wz2; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2e72224c395so6625821fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 04:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717068035; x=1717672835; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rulONiQoav/noPYiRK55pYebl0MVPgGh8k52ODEZHNw=;
        b=ZJ3E7wz2kp3jmQUkmjQND8CRYpG+HnkWmtT4JJaVWqMisihtCFHVz/szr7p1c9V4Tq
         OWVmIJHcrcVxQdLiC1tp/cGUB6GwMM0MAs6VZZ/WdiFS4R+QZrLo1rUMDZYaUQ7Jwygf
         784sFIDMpAPRbS9P2T5471S37uFbZ0sIXme3f43aQ1cpv8U1qSK46tcY/skiC7+uS4eU
         H1kKQmZcDHVaJT2wyz2cARutw1hPlRrCXLfudrJ7nYClnC2wQCfkTP80TV+ZSnao8uNM
         Jx2/IhaVo4eJSPcKJsR44giOjmTyB5QcWWUX3y9aqH0DQ1/B6jnUn1/hCafEl6LROqtk
         kDmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717068035; x=1717672835;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rulONiQoav/noPYiRK55pYebl0MVPgGh8k52ODEZHNw=;
        b=qIeyeBzRZB/CkTsbJ94+EXV0UWt0SGfEKAsEVfwnAccd7Kci9zmVRAmQc9C/ch3b1O
         Ndg1KgzHBeTOWzM7llYW5+oMBLN675sTvoM0+7L3ezCbslY5fbYyX8W5+Cx7pxbasBAd
         iRSuGmcGD7TO5ZWhAUonxIMQEdPp9F0PKsiFRFFHS+FuFA6KKPnC1J0dndx9FXjeYK4a
         +UmyriG44Zr8oip4o3awtVk0iKIXePO4eJg9mYetR9iM7rSJui4oLyJJJHQX6ZZainJq
         2H5Rj7dWHnxk0iUEV53ZJuLqbmhC+gXRcWjpIqNxdcX8kveLfDNWLuZD4kQ4dRCOM0yj
         ev5g==
X-Forwarded-Encrypted: i=1; AJvYcCUDihFX6wFGwLTGYVEhsLVKRxQDpgkoPsycsPseLEycsPIxMMOUh8HltFPdDSuoEfrpKylK5r/SrV9+eMHq/CnkSP1FIxBOJqViIDFAdA==
X-Gm-Message-State: AOJu0YxVvmnx6plCiitpJB7Ho8dMw9ieXrPcGf149ebNwJ7igum2dKlK
	RUFmtKX7KgWRljfpOQxEkT/DiIsnZzhdC3ancBTBK67qoZRMY91R4jFPSie1XsM=
X-Google-Smtp-Source: AGHT+IFKZF4N8Gaqyd1NA4+/cjvYzmxlJlkCP6xgeWDgb3mfAWPu5ONVzcWK5zonfx7QezemOPbnMg==
X-Received: by 2002:a2e:97d5:0:b0:2e9:8497:46ce with SMTP id 38308e7fff4ca-2ea84838dcdmr9311271fa.46.1717068035552;
        Thu, 30 May 2024 04:20:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e95bce9d5dsm28208901fa.48.2024.05.30.04.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 04:20:35 -0700 (PDT)
Date: Thu, 30 May 2024 14:20:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/7] drm/connector: hdmi: accept NULL for Audio
 Infoframe
Message-ID: <p4vkqqvfh4kdeq3lqfvyokdflaxodj4xv6ozawettewpaedfvg@6dcktfprvazy>
References: <20240530-bridge-hdmi-connector-v3-0-a1d184d68fe3@linaro.org>
 <20240530-bridge-hdmi-connector-v3-1-a1d184d68fe3@linaro.org>
 <20240530-daffy-satisfied-sheep-5b9e16@houat>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240530-daffy-satisfied-sheep-5b9e16@houat>

On Thu, May 30, 2024 at 10:49:26AM +0200, Maxime Ripard wrote:
> Hi,
> 
> On Thu, May 30, 2024 at 02:12:24AM GMT, Dmitry Baryshkov wrote:
> > Allow passing NULL as audio infoframe as a way to disable Audio
> > Infoframe generation.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 14 ++++++++++----
> >  1 file changed, 10 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> > index ce96837eea65..5356723d21f5 100644
> > --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> > +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> > @@ -681,7 +681,7 @@ EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_update_infoframes);
> >  /**
> >   * drm_atomic_helper_connector_hdmi_update_audio_infoframe - Update the Audio Infoframe
> >   * @connector: A pointer to the HDMI connector
> > - * @frame: A pointer to the audio infoframe to write
> > + * @frame: A pointer to the audio infoframe to write or NULL to disable sending the frame
> >   *
> >   * This function is meant for HDMI connector drivers to update their
> >   * audio infoframe. It will typically be used in one of the ALSA hooks
> > @@ -704,10 +704,16 @@ drm_atomic_helper_connector_hdmi_update_audio_infoframe(struct drm_connector *co
> >  
> >  	mutex_lock(&connector->hdmi.infoframes.lock);
> >  
> > -	memcpy(&infoframe->data, frame, sizeof(infoframe->data));
> > -	infoframe->set = true;
> > +	if (frame) {
> > +		memcpy(&infoframe->data, frame, sizeof(infoframe->data));
> > +		infoframe->set = true;
> > +
> > +		ret = write_infoframe(connector, infoframe);
> > +	} else {
> > +		infoframe->set = false;
> >  
> > -	ret = write_infoframe(connector, infoframe);
> > +		ret = clear_infoframe(connector, infoframe);
> > +	}
> 
> I'm not entirely sure your commit matches your commit log? It looks like
> you follow the same pattern than the other infoframes and call
> write_infoframe if there's one, or clear_infoframe if there isn't.
> 
> So we're never passing NULL to disable? clear_infoframe is called.

This function is being called from the driver, so I want to be able to
call drm_atomic_helper_connector_hdmi_update_audio_infoframe(connector,
NULL) in order to disable sending of the Audio InfoFrame.

-- 
With best wishes
Dmitry

