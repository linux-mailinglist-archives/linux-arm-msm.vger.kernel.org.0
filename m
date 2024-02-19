Return-Path: <linux-arm-msm+bounces-11661-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C961485A21A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Feb 2024 12:37:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 684E61F218A0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Feb 2024 11:37:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 369F32C686;
	Mon, 19 Feb 2024 11:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RuTyl+rH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E342C1AF
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Feb 2024 11:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708342664; cv=none; b=Y4Z9LywQrKznvM1v3Ef0X9ghpn/65Kl6CYgfXrPFklYT3vqwIdxBYCEA19N2jg1xD9/5H+MRcsV0i0x3pV9S4DyzpWxmCcPwR2WKGlW6lK9+hNEXHth6KP4JCAPo5c3ocB6acI1WpSz4f1od3HGV5/jZ8GtjqpP/QLgbUAGZiDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708342664; c=relaxed/simple;
	bh=MqJ6X9bHhgIvnhhVNHt7I9sd6Vf8RfjTJZGaLdv/tzU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ky/4ztOvaBupBsfOztrsvfTPp7nFREA+WBbrv2eM7THAfBsUpbj/d3B0PEaLV7xT6rIql7/VcC3yEEjAqfyQjwHMHDqfrkcrUKT9GnHa7ifIrapoXBHy1vte6L3p4IYjeGtzckEL/daIU33NtSj9rT92MHdHDXxODsgxcy9sXZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RuTyl+rH; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-607f8894550so20583197b3.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Feb 2024 03:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708342661; x=1708947461; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GaUyZ50XjXvDF8jY3Q3ZEC7jLE1bXKIRWKK8kFzpxxY=;
        b=RuTyl+rHwmb3qtgZf8mBDqPfY/pPSiSgag9Ayx0TIStlBIlY71/0yoE2HgZwekCQa/
         RbF0bU4DjziNq9Xi8YaMePPbRSvya9wANnR1jUK/sj9XoTsdv/I0IDw8yEC6neTk41iB
         MCxKbklEizqmodH198SXgbtSFiNTfeYZNlkfZi4H/Z0qmZTc/kD3H6t8v9/LTT6+wDnT
         sSmvVqmbHRFtEv3vWBaB5x11IC/z6MJc84Tmiz+Tswuzxc5EiGDZ2lbnKTNRGN/x63uU
         vkLxh9huXt65tqZFKPVDuIACp5cZ5W0uX+pvl0j4zJARIcVYVQURCOdyPHI591rvuUCi
         4wNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708342661; x=1708947461;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GaUyZ50XjXvDF8jY3Q3ZEC7jLE1bXKIRWKK8kFzpxxY=;
        b=Agi+wzTx//qiCY1RuXzrBHOrHx1xa1Jw7uzkbCYfQOEOYWzTfayt89o9qQjLpyq5+U
         ub4hTfwDvU4gqXGYefqmCBQZh2GzfKjjDQWk7nbrf946Xxxo2MXq6qf3ezPrpAsCzzi+
         Hhx7WX7HqMQolCrcf/8KtB6vcHw1JTgTXbLdDaVoxS6gAb244UFn02FvikM9Nstodqe2
         XOv5tx4JkNVLLYQlyZBeJt9df7iu39sWsiRqIBd8ak4lgGXkvtcbWvCGXI7AuRLRFFct
         zyDSjav6TRBAstH5DoXIdATmiMdhxyqiMFfFPlb1WpJ/CsnYPbfRXVN7JSZQKkvW/uw1
         zD7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVznR+hROzQQo1WmFRJVfMGP9dqYD1m1jhEWkuIMSxhezEKio53Vo63XsVx4fDFbabYLFFoF6/N7SKn5T+b3QwwcCP/wKKF8AgVv6cBBg==
X-Gm-Message-State: AOJu0YxZZXwwG0BX7wkgtxvSqclfjpXyI9SiJSw1KrSs/jAKJ7Q1ElPo
	fPNDxaaoT6xHISG5rtulWP8RMnnm99nHz8j5ewiBSYMJor6+xD6n4w3euDXvTl5vfXvgcc+/YrH
	P4RQqqyJIpPuu18J0dulqvQDneXqiix5xuFMg6uvWAgk8IN1L
X-Google-Smtp-Source: AGHT+IGQ1WnS7mBk+2g+qAwDGntsHIztsi8TubTD1INdibjvREVQvyi8hjDez2VQ2B6iwhTX0PVK/T0srPtjJXHbaAA=
X-Received: by 2002:a0d:dd94:0:b0:607:a0cf:d9ff with SMTP id
 g142-20020a0ddd94000000b00607a0cfd9ffmr11328416ywe.31.1708342661019; Mon, 19
 Feb 2024 03:37:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240208-fd-migrate-mdp5-v4-0-945d08ef3fa8@linaro.org>
 <20240208-fd-migrate-mdp5-v4-2-945d08ef3fa8@linaro.org> <9a4bf513-4390-3e36-f3b7-f9fef1c296fd@quicinc.com>
 <CAA8EJpoVivjg2KKVgf725C2cwMCOk=JK6hz65ewTheBAb8t_vQ@mail.gmail.com>
In-Reply-To: <CAA8EJpoVivjg2KKVgf725C2cwMCOk=JK6hz65ewTheBAb8t_vQ@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 19 Feb 2024 13:37:29 +0200
Message-ID: <CAA8EJprrVnb-5fhq9oc6PanoM8hY1fhBv0NvmcXhbAC9yJGmLA@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] drm/msm/dpu: support binding to the mdp5 devices
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 9 Feb 2024 at 20:58, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Fri, 9 Feb 2024 at 20:44, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >
> >
> >
> > On 2/8/2024 7:01 AM, Dmitry Baryshkov wrote:
> > > Existing MDP5 devices have slightly different bindings. The main
> > > register region is called `mdp_phys' instead of `mdp'. Also vbif
> > > register regions are a part of the parent, MDSS device. Add support for
> > > handling this binding differences.
> > >
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 98 ++++++++++++++++++++++++++-------
> > >   drivers/gpu/drm/msm/msm_drv.h           |  3 +
> > >   drivers/gpu/drm/msm/msm_io_utils.c      | 13 +++++
> > >   3 files changed, 93 insertions(+), 21 deletions(-)
> > >
> >
> > I thought we had agreed on a quite version of msm_ioremap_mdss for
> > vbif_nrt_phys?
> >
> > Anyway, its not something to block this change. Hence,
>
> Excuse me, I'll fix it when applying, if I don't forget.

I took another glance. The  msm_ioremap_mdss is already quiet (it is
not printing warnings if the resource is not present), so this should
be fine by default. But I'll make a note that we might be able to
replace most of msm_ioremap functions with the standard devm ioremap
functions.

-- 
With best wishes
Dmitry

