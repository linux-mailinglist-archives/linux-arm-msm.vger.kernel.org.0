Return-Path: <linux-arm-msm+bounces-50660-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E48A5766D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 01:01:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AE7A97A83DF
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 00:00:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4945119D07C;
	Sat,  8 Mar 2025 00:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NkmBY1yi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF973ECF
	for <linux-arm-msm@vger.kernel.org>; Sat,  8 Mar 2025 00:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741392034; cv=none; b=VQvLpzD5rPxXfwIEXIXQkP5T1Qi++ROGlaHFsKIfNu2YOm9OQTxF122i6QZ3Z/XLFUUl0J719ZdMWXZD7Hiu5Wh8vCau9zuSZM4YGTeJ2w2cBxFFHmIhp4zWskuJx1fQw17d0dRC1IeZSgcZAaQxtQpNcKBL+TJ9EwYuputfP94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741392034; c=relaxed/simple;
	bh=G24jByTcLB3gZ7lneK9yPWDVXemn8A7VmPesVcSmOBw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LUKZk9LJW7hG4+IJPMFeYzFKM466e8uRcpStZHB+tw3WubmJhi7klv3qEk3bbG6usuYHjmTByl4kSVQQWXxjZFhTGmXEuEQyT6ZS0DSWsgxIkEPTkiqxjteV2aVya/dwbQZwE6+ZQGlnS2M7HUU/jnKEnfNq1UNSasfl+GauY+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NkmBY1yi; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30bf7d0c15eso11508021fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Mar 2025 16:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741392029; x=1741996829; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AEwMiLzCyICEunJ5u9SkRaghHLUa2TZbSRFS1CMQbNs=;
        b=NkmBY1yiPzJxrCbEyvTRt6E0VuRa19ATlJfgiNbWVhmE9Jo3UIr/KtQClPwI5vO4rG
         YPfZqsUq8kUPWqpBOzzIArxV9BToZ7nAvmvHu1im5SHmh9nWBIGDXQcslyjg6kI0MCDi
         yLvSYMrDwht2DfoxRsjGGDemYP6bn+zbG/L7gaI4fsaNKC/b0yQX4t55IKzaPUcLikJN
         BYZajfnba527eF/twvxEzD01z2oKFa5fpUtttxnBwnqtxAtgdpMRhLdFx4jfFwgVcAER
         31BD2AXqr5AGjnTorSBL0/NYo0M3P4qWtoHLSgjc6nSxQvvYiC3uQUYC9MTleU9ZxfhR
         YD9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741392029; x=1741996829;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AEwMiLzCyICEunJ5u9SkRaghHLUa2TZbSRFS1CMQbNs=;
        b=c9k6sV0ujLWo3V4gfZKw3sDM2NaMQdj5Rh3ZOvunnasectkrKlgX27dnzhe+yyy/DV
         T0ixmrv0aeBsjATW9aJO0SfnPqYsm5bELqTR6tUAgX8Tty5WC8s0Yrn16k514Qbbxzdv
         AeajeJ6zZbfI+QCAC37qP3fjokFE4EQ33LvkygJGB36PKeOxCga0NXdT5tFYUb2qAmhA
         bsHL3cmQfDlN9fQqwjRa46QOm/3DVa4mMBGPmcYsYraATtnhz85wOaNibBiMlC6p5htC
         KCrJLp0h76mOe5yk7/wdlzTxDTvg6zMKCXocGsGCvSmQcUAoOmgbQlgmmOd1C6dHazin
         oIKA==
X-Forwarded-Encrypted: i=1; AJvYcCWSnRXf+6fwexSMgFFEVK3tDcVOzxXmXC5iot1t8JrZw7Vb7poR9UAmoY2mkjvmBoOoE9mDRqBgpw6hdZZU@vger.kernel.org
X-Gm-Message-State: AOJu0YysRs0dceFGxodGf5GMm6ItNaUsBINuxyzf1ecNA7FfeU2uhnjR
	EYyooqSUl22LYXLJK+Lj0KkY8sjnovUh3rTSzz+42na5CS6UuThkYE2UXTsqBI0=
X-Gm-Gg: ASbGncstFbMyVIrjwytR0Ewjz/7ywVcSYcHfvaRnYbC31+lBslARoRjmc5WKDyZ3g97
	g3hUn6IlUjE0UpjLiAPMKjq5cNFK6TSO4ONg7wqxhIkruzxil2qbHJsQJPj3QIa5DJ99UMU30Zx
	ssS6+dLVky2vXgyNzJOHqSLf9IjUwFIq/8Atp39/2xJAIdT7D886sOdeOmByoyiH+WP0uOXQGkD
	0J9NNU9r7nKUKUAhtgpQEYqZxxhxiveGZPaRl4ftpFG8fs/fPAb1v+fFDdpKxMKROrP8c3sDvUl
	dLLRbg8fRK5SGEkvm1wiPJynscHGfB7nxU6GHzFAN2fojV34Isxqn2/hM0/kzDaDTId6Nu8Ig+Z
	vuytr/RS9dnbWxtkoEjd4EHUN
X-Google-Smtp-Source: AGHT+IHp+tbCuGTMiQOtkAJeNqJU+GLHRyHQrcNbiQ0L6CepcDGTgtUgqeherQpSU3yjAqkm/DxJgw==
X-Received: by 2002:a2e:a78a:0:b0:30b:c3ce:ea38 with SMTP id 38308e7fff4ca-30bf43b45bcmr21229201fa.0.1741392028923;
        Fri, 07 Mar 2025 16:00:28 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30be99c815fsm7131741fa.69.2025.03.07.16.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 16:00:27 -0800 (PST)
Date: Sat, 8 Mar 2025 02:00:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Lyude Paul <lyude@redhat.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Alex Deucher <alexander.deucher@amd.com>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>, 
	Xinwei Kong <kong.kongxinwei@hisilicon.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	amd-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH RFC v3 4/7] drm/display: dp-aux-dev: use new DCPD access
 helpers
Message-ID: <ytsczbxfokt4yz26w5zl2rxtuagrirdpi6uyxnt4itcllrowuk@wqqcgkr7b52k>
References: <20250307-drm-rework-dpcd-access-v3-0-9044a3a868ee@linaro.org>
 <20250307-drm-rework-dpcd-access-v3-4-9044a3a868ee@linaro.org>
 <3284acdfa43fa62e7230355b4ed2e09ab75f326a.camel@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3284acdfa43fa62e7230355b4ed2e09ab75f326a.camel@redhat.com>

On Fri, Mar 07, 2025 at 05:53:38PM -0500, Lyude Paul wrote:
> I thought we had agreed that drm_dp_aux_dev.c was one of the few places where
> we wanted to keep using the old functions here?

Hmm, I thought I dropped it.

> 
> On Fri, 2025-03-07 at 06:34 +0200, Dmitry Baryshkov wrote:
> > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > 
> > Switch drm_dp_aux_dev.c to use new set of DPCD read / write helpers.
> > 
> > Acked-by: Jani Nikula <jani.nikula@intel.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/display/drm_dp_aux_dev.c | 12 +++++-------
> >  1 file changed, 5 insertions(+), 7 deletions(-)
> > 

-- 
With best wishes
Dmitry

