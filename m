Return-Path: <linux-arm-msm+bounces-43641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CB49FE6A2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 14:44:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4B0947A052D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 13:44:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3E261A7ADD;
	Mon, 30 Dec 2024 13:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YvIUDxb8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93F21A3BD8
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 13:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735566290; cv=none; b=uI/zGEqXc0zNijyjtvItfI9Nz6o9LakrTqCLRP5MWX3belkmRozFM1bT+PhUgOWBmtyAeYvpzxSGz3+Q4josFd2rF4aIq24Vsn9mk7v59nhuqlu/oi5TS1UH4FLiiBXFCaWODvc5FbfCln9iphOw3dZhDkBFs3yhyj2XVhZBQWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735566290; c=relaxed/simple;
	bh=EC2XPpooBgRFb+ScuOPdjk7j2qFlruHVFIvF80/AdXc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cqQeJe2lQ9weLot4pJseBTiH9p2WF2aqhm6BAHuVp3lMGzIdvLLMDI1n71Ir7/vNJVTr5WW/x6ZrHx7G3AHdosIuPO2NE81vkyrnREme6lDcxjdzGLE0oLjhl4zO3xMeXmnRg7vafGIVBpt48pnYU3wfsDWJih0rX7l042ACoGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YvIUDxb8; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30033e07ef3so60677951fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 05:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735566287; x=1736171087; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UfDexyA0DqveLsLqtnhae+vl3u+416UboJrWSd6o/F8=;
        b=YvIUDxb8xBP1arDyPcGIjGAxSoAAZvZwUZIJbxrLNnnTpbNQ2kT2r55I7TFoxpjErh
         mNNZgbfgH7891yW1yY8f1P4rEhSS0kUOVKlAoiEwstwjISLFbbSpXQy3zpTrLUjrQLqq
         rwMa++GQmmr557f0CqxlT3Lm4+bPnePten8ZV9+ZHfaqbgmfxkcXoi8V1HDd1SaCHfVQ
         dSfB3Q7+z8crbEcXCrUCY/eRg/FLmj4CB8jGEDnOb6N/A9bMQ4x8QweQBFCZKJOiCUEW
         15ad5fZ8zDMTi6OkDoN5/MVoSUg6ShLcrFx6h96XnHSN7CnNMK2OEi8hk9YQTJANdiLI
         3kAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735566287; x=1736171087;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UfDexyA0DqveLsLqtnhae+vl3u+416UboJrWSd6o/F8=;
        b=aqj0uQGtONugjaa3alxZk65i+MHwmwlsEaQgJKQzzLCw/tXUGZYPZOj0gWrH5zNowx
         ixDAttnnfX0PmPIdLOuUB1wSJCvtRCIw1DHMouPwDpsAzhKzcrePWj6Ri4qefDdOj4fh
         srVvQynNuUmqAOZbvE3+JTyEx4E5KuerkwoK14UjDI5G+4i++R+Pe+o9RUOskSr6pvPa
         E2Lf4CC6JMdniLIiXu2faP1BIwVPI8RLzFE/sTl41PFVW1fjgTMHJeEh2pr26wco+rWp
         S1m5ofZT3SUfuRpj65BRaIiRL/jDFSsHPhHrgNUoHgAvjhWUuQd//Ntd9BuLT3Mg59JL
         Vfpw==
X-Forwarded-Encrypted: i=1; AJvYcCVv1Wuxzto9olYlVL+VAy9kL+7ET085FzCFb0MvpiQY5XMju9BtLySk9tKDnflj3f6zMgOn5w/HU4IpYpyI@vger.kernel.org
X-Gm-Message-State: AOJu0YxBVd7zuqEjV0XGzicTsL0BIvqZVrzPB7don7kASl3vleWUp+LU
	W4AbSfkadEQ0YDlZBYUZJ0jvqyoB03vvmQHzS7K0cwES/iH/8g6TsZvnPUHG/HY=
X-Gm-Gg: ASbGnctremf/k2wpV57zJPYTPlxYC/C/Z0UoOFiGCFSNHE0Xw+xwDoBSMf37y1uZ5DK
	BkOG/Bu+H/txcB7Xq638L4ZhnhF/Rrax270Y50Wws/vsYJYS/QOUZBNtKriRexEuogLyJSU+pJS
	ZwazlGiRPOdvGig7CQ8v+vGYBpqrNyncoeI69Kwq6mvBDU5z7sNCzx6BVZEs0+mPpGLAoejlqjJ
	KdZ7Us0YkYYl6To0qdbjkgwr2hLZEAWECdG1j5Z0HlP9J27BuDjJh9sASwPG+apohOie7lL+0ru
	JVh2ZUxg75aO7ygn6z600MnJlPg5whR9xHow
X-Google-Smtp-Source: AGHT+IHpedEDXvGR6WWPSvUrtH/iHawQ5u1rIIGMmoB8TGBeVGZEVGcJvivwA+rB6+81ya8nOnGl3w==
X-Received: by 2002:a05:651c:2118:b0:302:23bd:354b with SMTP id 38308e7fff4ca-30458337837mr126671731fa.1.1735566286830;
        Mon, 30 Dec 2024 05:44:46 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045b082d56sm34889051fa.106.2024.12.30.05.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 05:44:45 -0800 (PST)
Date: Mon, 30 Dec 2024 15:44:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
	Danilo Krummrich <dakr@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, 
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 1/4] drm/dp: Add helper to set LTTPRs in transparent
 mode
Message-ID: <lnbvudvkvgifbjmscgrvv5hkuescyqz57y6m2pydphyq2ubrhg@aynvaqlu7jz3>
References: <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-0-d5906ed38b28@linaro.org>
 <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-1-d5906ed38b28@linaro.org>
 <Z1mk08SHEd5_vc99@hovoldconsulting.com>
 <Z21VD82XCOVgVJUh@linaro.org>
 <877c7hpavo.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877c7hpavo.fsf@intel.com>

On Mon, Dec 30, 2024 at 03:18:35PM +0200, Jani Nikula wrote:
> On Thu, 26 Dec 2024, Abel Vesa <abel.vesa@linaro.org> wrote:
> > On 24-12-11 15:42:27, Johan Hovold wrote:
> >> On Wed, Dec 11, 2024 at 03:04:12PM +0200, Abel Vesa wrote:
> >>  
> >> > +/**
> >> > + * drm_dp_lttpr_set_transparent_mode - set the LTTPR in transparent mode
> >> > + * @aux: DisplayPort AUX channel
> >> > + * @enable: Enable or disable transparent mode
> >> > + *
> >> > + * Returns 0 on success or a negative error code on failure.
> >> > + */
> >> > +int drm_dp_lttpr_set_transparent_mode(struct drm_dp_aux *aux, bool enable)
> >> > +{
> >> > +	u8 val = enable ? DP_PHY_REPEATER_MODE_TRANSPARENT :
> >> > +			  DP_PHY_REPEATER_MODE_NON_TRANSPARENT;
> >> > +	int ret = drm_dp_dpcd_writeb(aux, DP_PHY_REPEATER_MODE, val);
> >> > +
> >> > +	return ret == 1 ? 0 : ret;
> >> 
> >> This looks correct, but I had to go look at drm_dp_dpcd_writeb() to make
> >> sure it never returns 0 (for short transfers).
> >
> > Will follow Dmitry's proposal here.
> >
> > 	if (ret < 0)
> >         	return ret;
> >
> > 	return (ret == 1) ? 0 : -EIO;
> 
> Arguably this (well, with ret == len) is what we should've done with
> *all* of the drm_dp_dpcd_*() functions. I don't think there's a single
> case where we'd actually need to know that some but not all data was
> transferred. And if there are, they could be special cased. Now we have
> hundreds of cases where we check against length and it's just cumbersome
> all over the place.
> 
> The question is, how confusing is it going to be to have some of the new
> functions return 0 instead of len? Very? Extremely?
> 
> As painful as it would be, I'd be in favor of changing them all to
> return 0 on ret == len. If we find a volunteer.

Maybe a correct Coccinelle script can do a significant part of such a
conversion for us?

Anyway, I think it a right thing to do. Could you possibly add a new set
of API and use it inside i915 driver? Then during the next cycle we can
start using new functions for all other drivers. Or would you rather add
new API through drm-misc? Then we can concert e.g. existing helpers in
the first place and then start working on the drivers.


-- 
With best wishes
Dmitry

