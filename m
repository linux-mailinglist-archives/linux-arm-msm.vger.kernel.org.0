Return-Path: <linux-arm-msm+bounces-36805-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8060F9B9BC8
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Nov 2024 02:04:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A3E011C208F0
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Nov 2024 01:04:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6CDA18E2A;
	Sat,  2 Nov 2024 01:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VCskG88K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29A0BA4B
	for <linux-arm-msm@vger.kernel.org>; Sat,  2 Nov 2024 01:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730509486; cv=none; b=HvE9pKBulhtMw45HqwLoXyCOF+2xwUZOBHALUY1f2JR9TOjvqbAD6rZLCO8PSzWMgqSti+ZYQewwqya7WuTbPneSI8NEAwXk95NVzkC7T/U0KcyL2xuxmard6pdnJKUu/jjZSRduQ4nIXlhFmjuCW21El3Wpd4YBWX+xQOYMirY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730509486; c=relaxed/simple;
	bh=FjhbpQ26ecRSS3s6Ul4Cr4jut4DBYDKr287HNceOWY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lbVT22rpiZzyKq25XvcvUQ75Dgg47GmF3N+Q3oE/dsuHv8L/n8kktvD4tRaK6heuEpQg5KJ38+IYrFLqCOR7dIdByVx7xKgrAHkvy44wXWJnL+x4riV+eBaQGXdqCO6Hb/18tK0sXs6WC0/npMBfck2MBymr0ffxAqx22gA8w9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VCskG88K; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53a097aa3daso2426089e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Nov 2024 18:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730509483; x=1731114283; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sqErCMUF8gr+Z0iKwC2J15lI04+BWiUakafnHcS72HQ=;
        b=VCskG88Kmr7bdTJd5XQf1z3uvfllQj90ulgEXVdVG20SBCp7jVhA3X6XPzS7zIItBl
         HZ1lsX5gKt5mZMNF5o1zHH72yqx3iCruu+GkxtDpZTCTOMD/sjffH0zySpWQGQ933GP7
         p7LiQfsEiD4CWdBnqrobCLX3SoZiPhcHiJNkvRsuP1WNT/TFiovWAbdazMizej1QfjS8
         uW5eDPlI6U3cOjZtGoYMf7bjKHKcpZJyDlZAN9ndbgdrK5YS8SCrmwh+lXXiXUSNGvRs
         +lfDm6qIzZA3LBb/FcgMWiWUsdvmhlI0GsuZBDCe+oxd018WBv0CAsMTisDVtAilDFPn
         vsog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730509483; x=1731114283;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sqErCMUF8gr+Z0iKwC2J15lI04+BWiUakafnHcS72HQ=;
        b=ivaifS6TJbQO15RLP5NxfkVPuRntJFH35heBRegavGRyQQEZhtX6U9aoL6foXLauMH
         tvD2rfRn5efge6y38+cpRwLB4VddBhzTduM5uRn9cQxjq5103Kc9wsno1YCQzX5HLE2N
         UbnLADFJ3rjcQ/0WN8xUrucRDScnq/1uRpr8pXS4c4GZsg8YsSdp5J7EfAR71nRc2zMg
         ZS77VCX6844p3Tpl8E8rXNGXWKWcC2ckIyuWlaoQhdgLv+CYFWuUuguBQ7S/LyOWP8if
         qMwer4tUX+7P0X5hswdEDkrtPixYk9gtEoBPdo/ssTHHMQ/55H2BTCyS+X4AhQ4GU1Kl
         iq+A==
X-Forwarded-Encrypted: i=1; AJvYcCXrUzMw09N9/U9EeMYSXxiGiF8JKnYTGzdvK4NRnMyE+ZDJCrgclYB2xKN8ZA4+cSVtaJfLYK3sbVnKNsSK@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq3cnoLYIqOtTFeEy8VCIZ9TrpkKXJo32meNwR6pvbEszlltNl
	G7P/fUvIbAPNpaDHM+0zcKz87Gr5zHSZJvHwpNqtCT+v5IMQ3G235wIBw3tNes8=
X-Google-Smtp-Source: AGHT+IHprjXq36nNEExyCP3aSwaMNPwiLueb3h6RaUfM0RL73CJVzxQCx4hYdyGZXzORZZQQIB9mRA==
X-Received: by 2002:a05:6512:3d05:b0:536:55cf:3148 with SMTP id 2adb3069b0e04-53d65df8d2bmr2881920e87.31.1730509482550;
        Fri, 01 Nov 2024 18:04:42 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bcce3a9sm713069e87.150.2024.11.01.18.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 18:04:41 -0700 (PDT)
Date: Sat, 2 Nov 2024 03:04:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/hdmi: mark interlace_allowed as true
Message-ID: <ut5jr7chk7ea2szrar7vyj7dfo3uww4ac3m3xs3wioznrhwbzv@co6wovw5dphu>
References: <20241019-msm-hdmi-interlaced-v1-1-03bf85133445@linaro.org>
 <52229a96-64b0-48d0-9868-31be42b12db1@quicinc.com>
 <CAA8EJpps+spdowEbDoO2zNfyn+DnWwPgnZiFMw13ZE=iAnJEnA@mail.gmail.com>
 <bb5bd688-34dc-4c9e-8abf-d1395f3a385e@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bb5bd688-34dc-4c9e-8abf-d1395f3a385e@quicinc.com>

On Fri, Nov 01, 2024 at 05:40:46PM -0700, Abhinav Kumar wrote:
> 
> 
> On 11/1/2024 3:26 PM, Dmitry Baryshkov wrote:
> > On Fri, 1 Nov 2024 at 23:41, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> > > 
> > > 
> > > 
> > > On 10/18/2024 2:10 PM, Dmitry Baryshkov wrote:
> > > > The MSM HDMI driver supports interlaced modes. Set the corresponding
> > > > flag to allow interlaced modes on the corresponding connectors.
> > > > 
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > ---
> > > >    drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 1 +
> > > >    1 file changed, 1 insertion(+)
> > > > 
> > > > diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > > > index 4a5b5112227f..643c152e6380 100644
> > > > --- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > > > +++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > > > @@ -336,6 +336,7 @@ int msm_hdmi_bridge_init(struct hdmi *hdmi)
> > > >        bridge->funcs = &msm_hdmi_bridge_funcs;
> > > >        bridge->ddc = hdmi->i2c;
> > > >        bridge->type = DRM_MODE_CONNECTOR_HDMIA;
> > > > +     bridge->interlace_allowed = true;
> > > >        bridge->ops = DRM_BRIDGE_OP_HPD |
> > > >                DRM_BRIDGE_OP_DETECT |
> > > >                DRM_BRIDGE_OP_EDID;
> > > > 
> > > 
> > > I had quite a bit of discussion on this internally because this spans
> > > quite a few generations of chipsets.
> > > 
> > > On very old hardware, even before msm8996, there was dedicated hardware
> > > de-interlacer. But even on msm8996 or other HDMI supported chipsets
> > > where the handling of if (mode->flags & DRM_MODE_FLAG_INTERLACE) is
> > > present, these were because its carry forward of older interface code.
> > > 
> > > The way we handle interlaced formats today, is software needs to handle
> > > the part of dividing height / 2 and width * 2 and adjust the source crop
> > > if necessary. This part has moved to userspace for recent chips.
> > > 
> > > Othwerise, we will need to add this part in the dpu driver to adjust
> > > this. I am not seeing this part there yet. So may I know how you
> > > validated this change? Something similar to :
> > > 
> > > https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/LE.UM.1.3.r3.25/drivers/gpu/drm/msm/sde/sde_plane.c#L1340
> > > 
> > > If we add this part first to dpu code, then we can mark interlace_allowed.
> > 
> > I think you are mixing the interlaced formats and interlaced output.
> > The code that you have pointed to is related to hardware deinterlacing
> > - in other words taking the interlaced framebuffer and outputting it
> > to the progressive display.
> > 
> > The interlace_allowed flag controls a different feature - filtering of
> > the internalced modes (aka 576i, 1080i, etc). In this case we are
> > using progressive frames, but the HDMI outputs a picture as two
> > separate fields. I have validated this by outputting image (modetest)
> > to the external HDMI display on IFC6410 and on DB820c boards.
> > 
> 
> Yes I did think that this was to show interlaced content but that being
> said, I traced through the HDMI code a bit, it does have support for
> changing the HDMI timing but without the support of dpu, progressive content
> really cannot be converted to interlaced. So I think the HDMI pieces there
> were supposed to go along with the rest of the dpu pipeline that is the
> entire pipeline shows out interlaced content. But dpu support for giving out
> interlaced content is not there, so this hdmi piece by itself is not
> complete enough to mark interlace_allowed as true.

I could not find corresponding bits in the original fbdev or SDE
drivers. My quick tests showed the correct context, but most likely I
need to revertify that. Unfortunately next week I won't be able to run
the tests, so this gets into the 6.14 area.

-- 
With best wishes
Dmitry

