Return-Path: <linux-arm-msm+bounces-21471-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A92818D7FA7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 12:05:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C4656B26008
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 10:05:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DDA582496;
	Mon,  3 Jun 2024 10:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dRqrGnuX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1DE81AB5
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Jun 2024 10:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717409092; cv=none; b=CJ3qz9e4X6a1LfG31fRLIcwB2p1yPENHnLmdCoB1kNCorkET0tMjLPw7p1l3uj6Eknm1iGNp6BIWXws+FbQ0uRihMC2cVdSBUYtPInFPVaCvsqt4cXNX3h65TYJG1XTNm1zlwpYUmVd4yoXY3dN5x5PBhV4D+IAIAfX3ER0vP18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717409092; c=relaxed/simple;
	bh=tKfwQNhdpAS8ePAKsxjBO9dzocIt1W3bKnnwgrstodM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G3ZTMupUmErz+dNn1DlBN8zo2X2+R9jky1EjvI4bpA7pomazAk5T58c7uwBC7W1fdDYEPqLTFwBn9aCwYmIDFx5TsY4slxbrhcvXLy1hAkILVAVOICzdjB8+9iML6jak/NCTTG24Ntggrhawr+h4JCaPq67eiJXbbUVindhiGyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dRqrGnuX; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52b912198f1so2590642e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Jun 2024 03:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717409087; x=1718013887; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Wigpiq3UYcvYdqkrQhN7qI4WVcDObAutfXNLBLWz1Qs=;
        b=dRqrGnuXf83ezATcTAd3nD6wwbGozWp8rkJ2UMDol1s1QBp54UT/iVhrZbXlHGUGov
         jrmbZb0Nrnk5IxoeEWWHT2sxzqYkJEqS4oax7h9BJvGsZSeWM0aXXXakiRpHjXsedI2p
         EGDjLdv2zMZyAba05qNFQ+RGGjVevaqDdnMZjxZr5l/KP4tjQCtec/vkUI384EXA9aBS
         kN60Rx/RV5GlpkrWygXiQe/vGRlxncGd3TKeATo1x/R7zq9D7Aqfh/u+vDVl6+mRMfSY
         RTOK3XF8tY66Q1sYNt3mhcDvmRqFS/wdSq4xwLS6E9oP/leu6rKRevf0sR7AmyGzdZsw
         344Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717409087; x=1718013887;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wigpiq3UYcvYdqkrQhN7qI4WVcDObAutfXNLBLWz1Qs=;
        b=fvzYrrPA5ubu3He4VtGbum1lFQ3X8hoSRUfGAANCd7gmgLEe1EY1gzoh5ElkWDjGXW
         cuNBSL7c9Q2fBioCzG28qMu/9KJflhuzB7ZkuH4oNE/SNzk7V0cVkmxM4Ia6HCjC4pnu
         1GIJUj9Z+Ur8LuRMzbt1dnHPTnkPUUGR1A4AqcFINkdwZJfm39oVlYCyQq9O1MVg2Lfs
         qchwdmS7eUR6E1KkMEi967wdHHaXf9qvvHgaOsnmR/EbKNTE5S22vEO10nBMq2V3J7DM
         KfFgYvsJw/hLZcoYOjpIrWMabXg8r5Z+8ytJOu3bP3aG5Z5pCv+Ktx4eY6zweFaCobBJ
         bnsA==
X-Forwarded-Encrypted: i=1; AJvYcCVrg2xQFISTkd0BDb7nQmthu8M43lCi9JC6fwKJlBz6jlV+Wlxa3pFdv5fEg90+k1Z32E4gXF2jApY9RtGDFH/H+CPYI9FlrxGum6Vheg==
X-Gm-Message-State: AOJu0YyGsEt4EHpDA9Jp4MR7FRhJzU2t6AGy2TRUpQB/cegkvyWb73rE
	/3Wg5UNW/uI+fej7adVRnpLV0k1OD4XJeUIVkpfWMB7I5+4MMFolYhpZ8lejTCg=
X-Google-Smtp-Source: AGHT+IF5KnG1FbQl2ZMSS1dblXe8W7iYWQvh17DRwDMEgS5aDyUVIouCkrUQXkbLDkWxPZaBVQnv9g==
X-Received: by 2002:a05:6512:239f:b0:52b:9037:996d with SMTP id 2adb3069b0e04-52b90379aafmr4283607e87.46.1717409087167;
        Mon, 03 Jun 2024 03:04:47 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b92e66010sm666446e87.102.2024.06.03.03.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 03:04:46 -0700 (PDT)
Date: Mon, 3 Jun 2024 13:04:45 +0300
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
Subject: Re: [PATCH v4 1/9] drm/connector: hdmi: accept NULL for Audio
 Infoframe
Message-ID: <th7i4ugpnbifmthtam7p5nmtclygx6asvzzyibzl2oxdsxxnmj@rd7dujgjxzuv>
References: <20240531-bridge-hdmi-connector-v4-0-5110f7943622@linaro.org>
 <20240531-bridge-hdmi-connector-v4-1-5110f7943622@linaro.org>
 <20240603-therapeutic-warm-fox-890bee@houat>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240603-therapeutic-warm-fox-890bee@houat>

On Mon, Jun 03, 2024 at 11:09:40AM +0200, Maxime Ripard wrote:
> Hi,
> 
> Sorry for not answering your mail on the previous version sooner.
> 
> On Fri, May 31, 2024 at 11:07:24PM GMT, Dmitry Baryshkov wrote:
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
> 
> I'm still two-minded about this. I think I would like a separate helper
> better, to also make things consistent with the HDMI helpers.
> 
> Most importantly, it looks like you're not using it at all in your series?

It should have been a part of msm_hdmi_audio_disable(), but it seems
with all the refactorings I forgot to use it. I'll check again the
behaviour and either drop this patch or add a separate helper and fix
other comments below.

> 
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
> We should probably clear infoframe->data here too


-- 
With best wishes
Dmitry

