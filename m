Return-Path: <linux-arm-msm+bounces-13855-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE69878611
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Mar 2024 18:10:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9F979B21339
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Mar 2024 17:10:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F2804EB47;
	Mon, 11 Mar 2024 17:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pcv73Vwn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3174F4E1CB
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Mar 2024 17:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710177009; cv=none; b=DhoE8Nim/mVn8Kg4UfeYgIq2h9Qd3WRAs5jMvNnvwsMSE6LCL++zNd9vS0qnoXWEuBdCRUQhLdXsaaVa7GjFOeOC93f3UvcqeQYjs86VvHWduo3ksAUR5oYZBLsdfcgHEBpc+y8jH3eItYy/7wEa6ZxKdqCvqs4JaHkpTP3LbZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710177009; c=relaxed/simple;
	bh=/8zCjBY2clYlF3DnjHznB8ApAvzPiiVUoAsgHU0U3qw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U4daUhy5dSMN3aTqVC/vZ8iqE7qwAEsgzfwpuWvKNB9x9CI5iEbLaXpbZiwnTXRfQ/o4hZhMQxAPcWaeyEC6p9dh6WCl3oYhL7iN2pS2au1lKKBr2aoB8bkPY2bcvmdu4E1SjsJ2Ij+w2UbQmwhCG+fOG8hT+/KA9xKgH5bl1cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pcv73Vwn; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-60a068e26d8so35137827b3.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Mar 2024 10:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710177006; x=1710781806; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZIOt5ylsa65gbubxlHlA5pNSze10toj9s/4bkxpYxRc=;
        b=pcv73VwnmtAGSxTN9eXDe8B8avzcLvAjQdxMyrhzf761mQHgUfwPsTMIBzpm3161HZ
         0KcegIjHDba516EtRRGtEKOJsgzBVqW9oMIp4CMy35UcsGCqgEOuSAhoN+yoE/wRoM18
         HLpq8CUHvVQ14tdLB3dKCkmZ3tQiFC0Nr1yd9ab8dCtPqP9HwydeDaKWGJKY0n1XsD7Z
         WqO9y/CW1EHfcRKuFm60PVIpnaG+v2kdCoJrtqfxauDemE6f84fWPqqZCHB7+sGUzgzX
         PHTgNR0DGY5du2qps00aDQZaaigTAksgNmGEwjJaX4rLBsaV4HXvu4Z5qFDXvZR4oIMF
         4s2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710177006; x=1710781806;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZIOt5ylsa65gbubxlHlA5pNSze10toj9s/4bkxpYxRc=;
        b=h2/DMarY4WfRhZwwayaWDopL+8RH4oLIBVieEWyfN/rWgcMtuZD3JXLgEbxtUI1oAQ
         o1Un9//t3cbuaBYhG1eU2miq0IHnYcoQdO5GWryuMfD8ij6avZhfHw/CdO2JoBDK45L4
         zWEhm7Vt1VMkcufd+8d39FERzrQxRfCaOGzQ9/9L8P/QwfRJxPivSiyelF47/mTPrU/2
         GeuZPcDo3qKqYgMTdw6fG886cWFs8R69uEtoOSaNmo8L7ozx1tMc/CzDHDHBCnDjW8oI
         AZVw/kOKqznqFRw6P0YVRH4zwcRTESoCNPjlnYQfyhxSj6ifK6d9zWB5mTjFGnRRM0XH
         V2EA==
X-Forwarded-Encrypted: i=1; AJvYcCVgplJgrjoL0EV1CZIbZGKLD/UvVBuZIvjWCYlqbxMe1dcs4zia5nDm6bjjt6lmHn7P3unb5v0AvSMarMUEn75hXknDF8T2g+suiYPB4g==
X-Gm-Message-State: AOJu0YzgnlpoTqsn58bw9HLRuv9OHtk8I1t2DvErkXZjR0h+ZVPj1hUl
	3TeZJn3jE9nsHM5vz418Ze7vuxWpSXyFRmwkWSCOUmy0/Si+G1JpDxBGdNfEs3VMPIL6tkHD88H
	jGgz7qloiVXXUu0eFat+hrR/julyayH+qSSfxLw==
X-Google-Smtp-Source: AGHT+IGhYwlGmJoM+ibOnMZbeqRf64uf0hwVNVKwk8rPtXO/AmgfcXTSkmS0XFzBj3JXNTymf52mNnPhvyLn5m4rZAI=
X-Received: by 2002:a5b:644:0:b0:dc6:a223:bb3b with SMTP id
 o4-20020a5b0644000000b00dc6a223bb3bmr4902864ybq.46.1710177006272; Mon, 11 Mar
 2024 10:10:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240309-bridge-hdmi-connector-v2-0-1380bea3ee70@linaro.org>
 <20240309-bridge-hdmi-connector-v2-5-1380bea3ee70@linaro.org>
 <20240311-divergent-friendly-python-2c7d5d@houat> <CAA8EJpo-+qypK4gLrQGcCYi-AVtVzuCjh4HgJ6kRNsMTtNKKMA@mail.gmail.com>
 <20240311-offbeat-pogona-of-masquerade-3f40b6@houat>
In-Reply-To: <20240311-offbeat-pogona-of-masquerade-3f40b6@houat>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 11 Mar 2024 19:12:45 +0200
Message-ID: <CAA8EJpr9NRA5VgyaWmacWjhq0=xYBthzw=FNBsN+byWfYfzdDw@mail.gmail.com>
Subject: Re: [PATCH RFC v2 5/5] drm/msm/hdmi: make use of the
 drm_connector_hdmi framework
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, dri-devel@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 11 Mar 2024 at 19:06, Maxime Ripard <mripard@kernel.org> wrote:
>
> On Mon, Mar 11, 2024 at 05:55:36PM +0200, Dmitry Baryshkov wrote:
> > On Mon, 11 Mar 2024 at 17:46, Maxime Ripard <mripard@kernel.org> wrote:
> > >
> > > Hi,
> > >
> > > On Sat, Mar 09, 2024 at 12:31:32PM +0200, Dmitry Baryshkov wrote:
> > > > Setup the HDMI connector on the MSM HDMI outputs. Make use of
> > > > atomic_check hook and of the provided Infoframe infrastructure.
> > > >
> > > > Note: for now only AVI Infoframes are enabled. Audio Infoframes are
> > > > currenly handled separately. This will be fixed for the final version.
> > > >
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > >
> > > I had a look at the driver, and it looks like mode_set and mode_valid
> > > could use the connector_state tmds_char_rate instead of pixclock and
> > > drm_connector_hdmi_compute_mode_clock respectively instead of
> > > calculating it by themselves.
> >
> > Ack, I'll take a look.b
> >
> > >
> > > We can probably remove hdmi->pixclock entirely if we manage to pass the
> > > connector state to msm_hdmi_power_on.
> >
> > I'd like to defer this for a moment, I have a pending series moving
> > MSM HDMI PHY drivers to generic PHY subsystem. However that patchset
> > reworks the way the PHY is setup, so it doesn't make sense to rework
> > msm_hdmi_power_on().
> >
> > >
> > > And that's unrelated to this series, but we can also remove
> > > hdmi->hdmi_mode for drm_display_info.is_hdmi.
> >
> > Yes, that's the plan, once I rework the audio infoframe handling.
>
> Sure, if it makes more sense to defer it for now, then let's postpone it
> :)

I hope to fix this one for v3. Audio InfoFrame should be converted too.

-- 
With best wishes
Dmitry

