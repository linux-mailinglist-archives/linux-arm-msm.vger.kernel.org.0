Return-Path: <linux-arm-msm+bounces-35835-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D67219AFF1B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 11:55:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 824CE1F2338B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 09:55:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F2FB1D45FC;
	Fri, 25 Oct 2024 09:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zvKKd+St"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9CC1D4359
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 09:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729850096; cv=none; b=VOSrdtslLB92HoF/aHMgO1TSQAEN/MssNGTEjkGTSHuGfBAXZWY9fvwDIGldoYiF2klY3liQWnbYjVLI+qwW4H9U6cpEPjFPhH7ccB9peDXsD6N2vaONaMQdbonrzp2MtQNytP+xn4CU7+ntmSHlsxDKALsqBXy/9a4Vi//YrLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729850096; c=relaxed/simple;
	bh=ovzUCbOnf8ad3/AG/s6edyQx3Y96JvN5zzmYGNZvn88=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MrGc3RYfdVBCEwsm3mvWg8MaiChO+SVdIYSkkdEFkTHGJkAPVS/RAWqH6yGJjK1LhmBNetdmJJY9Sne2GeWpOqkKyYTP4clSP/MiVKF5Lok2goMkvkhM17li8TZZ3I61nyFgySJEkNSP4Tz8X5qj/XjcUKYpF75MO/faASO0KRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zvKKd+St; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6e2e3e4f65dso21271537b3.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 02:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729850093; x=1730454893; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ovzUCbOnf8ad3/AG/s6edyQx3Y96JvN5zzmYGNZvn88=;
        b=zvKKd+StNLV+oCqn4p6vaB4u8JAwPSgagTsHr64tMdGXpo+n6ydfeNQZNvWjNh4F7E
         FLHJ8oBGS51YJMUyg1JGTdKfEbMt/9Clc+V1fA6e6tcUYNcJR0kFVx9Ys2Gy9cDxaosf
         jduPYPfdzXJ/imDNPH0quvPUfyRkNX18j9YVAKRIHtJ/QCoE39neMZC5Y9H0p6slp8GH
         GK84H8aI49qPek0fd+MKIA3K/AbYlC48oWFh0oPoIttGwgDFmBrcxs8QBSI0Z1FFH0vS
         xX5jTgNUevJCloWci7Jzg5uqGSg2ACqIxJPKdfwNFGjq9/guOjaxj6Qqco9/eNrOQd7c
         sgVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729850093; x=1730454893;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ovzUCbOnf8ad3/AG/s6edyQx3Y96JvN5zzmYGNZvn88=;
        b=rlmAseQ0c89tRXRmC+sD2broAID3DEVPwS3VNmgo4siNAieB2CAw7dSGukNTDMohgI
         Gdh1ggWMuwrUdsMtuown8Cgr3LhrvzzpwR+4BrsBYY4ZpMbKJdfc1IMvs7kxRN41keiN
         L5/fB1+sOJp/fqp/pm+KE7G7/zAjySglsazt4y/3zetBz1q+BfB1cEZTmuEXkamCgWhD
         hR0gvugChBoI45tTcTRM8fN6Qj/EktnvEmdWdR9R4aDmR13YbnJnhjR22F9oSSA294Vn
         PiPZboWkanrkHkXNCOJXkJPlOxxwbOmwCIqOGwnRzIKLQ37onikuF4g8oZ2EzSrZ55uJ
         ktGA==
X-Forwarded-Encrypted: i=1; AJvYcCVK9yLEKF2HDNkoFg62V7RBf4/B2SjdnK1wLI4Q2kqy4QBxAT1ZFfFZ55a1trOSBN4HRF7kfCxo6Amq+7yv@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1VHvaLKCTJkjqiSSmD2L+LyIL0ClmQ4K6Vb8o5BAtZDKNFbiP
	tea1ojqMMv2nXVTacavp1r0kOf9i85vdkOKFrhX04VzNOdsV1PqkFwZQShGstSzhqx2SxizLIRM
	iRTsyGwb0DYcVCvE2fmVgto3/luoJlOtgREJj7A==
X-Google-Smtp-Source: AGHT+IFZu/LyAjfpwX5MrN+JVkr0x0xSzSrKk0A5Mdi5tj38z9PJE4G47Yh4NVVkEqgziX0kL7VNUYJrsxipC6JS6p4=
X-Received: by 2002:a05:690c:fc7:b0:6e7:fb87:7094 with SMTP id
 00721157ae682-6e85814d77fmr57343097b3.6.1729850092872; Fri, 25 Oct 2024
 02:54:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241002182200.15363-1-ville.syrjala@linux.intel.com> <ZxtMz8JP3DbzpMew@intel.com>
In-Reply-To: <ZxtMz8JP3DbzpMew@intel.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 25 Oct 2024 12:54:42 +0300
Message-ID: <CAA8EJprT=BGyMnvkjS4BkRqar1hHn_hpXFaz9gstPL_9u1rAsQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] drm: Treewide plane/crtc legacy state sweeping
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Alex Deucher <alexander.deucher@amd.com>, Alexey Brodkin <abrodkin@synopsys.com>, 
	amd-gfx@lists.freedesktop.org, Andy Yan <andy.yan@rock-chips.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Danilo Krummrich <dakr@redhat.com>, freedreno@lists.freedesktop.org, 
	Hans de Goede <hdegoede@redhat.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Inki Dae <inki.dae@samsung.com>, Jyri Sarha <jyri.sarha@iki.fi>, 
	Karol Herbst <kherbst@redhat.com>, linux-amlogic@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-msm@vger.kernel.orga, 
	linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	Liviu Dudau <liviu.dudau@arm.com>, Lyude Paul <lyude@redhat.com>, 
	=?UTF-8?B?TWHDrXJhIENhbmFs?= <mairacanal@riseup.net>, 
	Marijn Suijten <marijn.suijten@somainline.org>, nouveau@lists.freedesktop.org, 
	nouveau@lists.freedesktop.orga, 
	Patrik Jakobsson <patrik.r.jakobsson@gmail.com>, Rob Clark <robdclark@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Sandy Huang <hjc@rock-chips.com>, Sean Paul <sean@poorly.run>, 
	spice-devel@lists.freedesktop.org, virtualization@lists.linux.dev, 
	xen-devel@lists.xenproject.org, Xinhui Pan <Xinhui.Pan@amd.com>, 
	Zack Rusin <zack.rusin@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 25 Oct 2024 at 10:46, Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
>
> On Wed, Oct 02, 2024 at 09:21:58PM +0300, Ville Syrjala wrote:
> > From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> >
> > An attempt to hide the drm_plane/crtc legacy state better.
> >
> > This also highlights the fact that a lot of supposedly
> > atomic drivers are poking around in the legacy crtc state,
> > which is rather questionable. For planes we did force the
> > legacy state to NULL already to force drivers to behave.
> > But even then it seems capable of confusing people with
> > its high profile location directly under drm_plane.
> >
> > This might end up as some kind of conflict
> > galore, but the alternative would involve trying
> > to wean the atomic drivers off one by one,
> > which would probably take forever. At least with
> > this the issue becomes visible and shouldn't be
> > forgotten as easily.
>
> Ping, anyone have thoughts on this? I'd like to get something
> like this in at some point to make the legacy state (ab)users
> easily visible...

I think that's a good idea. I hope to find a time slot and check the
(ab)using of legacy state in drm/msm driver.

>
> >
> > The cc list was getting way out of hand, so I had
> > to trim it a bit. Hopefully I didn't chop off too
> > many names...



--=20
With best wishes
Dmitry

