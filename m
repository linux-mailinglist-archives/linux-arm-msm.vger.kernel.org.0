Return-Path: <linux-arm-msm+bounces-32157-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAFD97DF09
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Sep 2024 23:16:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CAB601F211A3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Sep 2024 21:16:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AACF86126;
	Sat, 21 Sep 2024 21:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OXWMqrP1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2939A1EA87
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Sep 2024 21:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726953374; cv=none; b=KyrKh9qV3z5eLoEPN5T7N1l+oLdsjXOAedugeOUCEPHNZyW2o9EZZlQcWJUOd9MxfmoZdiDiv/R2FxS04GLA6bZmQEYfWxUuRsR7nk94YIfEVaNv89jMYqUFeAEgjjzfp4Yc8aDH/Uh2S2draOA/H3a2PIpJpmtr+8vSo97G3J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726953374; c=relaxed/simple;
	bh=50ag4Y+sz8MxGdMheWsVAXBchEpzmh4xNUPDYQc9/Tc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QPZrM5DJhaBL/N+NSdaio+euBWVcU4r4bME809RHUqZIRXfqkQ7T22yWg6V5os43F9jHjlbcuGmkDTOaPG0nwgAJ68J7kvDtsaXikGYK+AVYPa4DGFI9SXK/3OS5NUxgvxB4LocJzcBAN1h+AliHxxDfsMcpAtf/CbCL9vMIwaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OXWMqrP1; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-535694d67eeso3321712e87.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Sep 2024 14:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726953370; x=1727558170; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wfY6hEGVgBSeeADzpkHr3ZptQ8VvnlBmZmvgQTMe9+k=;
        b=OXWMqrP1tXwMUG+JMbU5YmEIboU9oGZZx/g5oV+c3nJvU2u3yTE+nxCa562yKCRTKY
         F3xvP1/VgJWNCju3PcstwPHJ0dPVWCjCo5waV+sefLNJcaaIUzidQ/PAL/lnL17L/95C
         mDorGtq02hD6Km/0hZujiMTOkhGIRqg6Y3qBTK7Px3DakCFAd65EH/UQVh+9eiZI7WL6
         tcoyuzbI0oPl6L6i2PgHnXss/hUpOEYuRI1AGU9fWM49aPKuNotsSabhIRLXHsqtLRdt
         U+bRDfDx+IBUpPNL38j9fdvUFUas6/CH4gjcnUgGTk7+czoWFGprn5H1KjlezH0N/aHI
         Np9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726953370; x=1727558170;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wfY6hEGVgBSeeADzpkHr3ZptQ8VvnlBmZmvgQTMe9+k=;
        b=YocISNLK4sK+/dfJyNnJ65P6u3/WFQXpOwoY1lG//XfL0AIUC/hFmHl515HO4mqGg2
         dDod0Xib97d0fmlLQpOinGm/oe8Q46KWT9Fb/ynQVtAPSBEmXQyUvuFX8rkujpbsIBXA
         Wpb3i0NpZxSB7ZU05IrlVbwO/Yi9oceg+o3Yi6rEPJTkSDlQ1R8kQgQHK2JBEmE5+MH2
         Z8U9VNALWa1txGPbnuG5iRCrZJQHkcdAAXeoYgCRwzlIchL1lxTeZIPmxYLssicEPy4P
         dL9oowJlZax4wPoa/THFx0hq82uLwEwUchTz8TwOQaN7uSeeUzwrtXxUrhklqZ1ff9F/
         QQ1w==
X-Forwarded-Encrypted: i=1; AJvYcCUE4BYrjrbpVRxHx1awIQ5bWRTwANDDTxZegvlljGCKMGD1zclTG3oc98jkon8VvEtJ5vH7JC+dFUe4NN8q@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc4+DNoGHQhmJGpwJAMRQuL7ogkuerWPNSDGO4xEJmOoG2302x
	nEiOPyo26SdTsCjzvEAq6TQB3g/KX0KoEbi8qS1fM+tK71KON2vIeP/f3qDB+4k=
X-Google-Smtp-Source: AGHT+IHgSw3RH8nc0yn45Wrv03bvJaS53+RdIUYggI8KT7gXTHwNdGyEo8a5X+dnHH8bjNw4LBjd2A==
X-Received: by 2002:a05:6512:6c7:b0:52f:cc9e:449d with SMTP id 2adb3069b0e04-536a553c370mr3684742e87.3.1726953370124;
        Sat, 21 Sep 2024 14:16:10 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-536870969e7sm2693163e87.123.2024.09.21.14.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Sep 2024 14:16:09 -0700 (PDT)
Date: Sun, 22 Sep 2024 00:16:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Marc Gonzalez <mgonzalez@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>, 
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	Nathan Chancellor <nathan@kernel.org>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 7/8] drm/msmi: annotate pll_cmp_to_fdata() with
 __maybe_unused
Message-ID: <n3w7pq364l5ugsnmenece73ke4f3msqmaqoxfrpnqssdo3znyc@psa4cbbmmbix>
References: <cover.1725962479.git.jani.nikula@intel.com>
 <3553b1db35665e6ff08592e35eb438a574d1ad65.1725962479.git.jani.nikula@intel.com>
 <4ag2efwiizn5bnskauekqwfhgl4gioafcvetpvsmbdgg37bdja@3g6tt4rlfwcb>
 <19ac4e25-7609-4d92-8687-585c6ea00c79@freebox.fr>
 <878qvyjxpg.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878qvyjxpg.fsf@intel.com>

On Wed, Sep 11, 2024 at 01:23:23PM GMT, Jani Nikula wrote:
> On Tue, 10 Sep 2024, Marc Gonzalez <mgonzalez@freebox.fr> wrote:
> > On 10/09/2024 16:51, Dmitry Baryshkov wrote:
> >
> >> On Tue, Sep 10, 2024 at 01:03:43PM GMT, Jani Nikula wrote:
> >>
> >>> Building with clang and and W=1 leads to warning about unused
> >>> pll_cmp_to_fdata(). Fix by annotating it with __maybe_unused.
> >>>
> >>> See also commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
> >>> inline functions for W=1 build").
> >>>
> >>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> >> 
> >> I think this function can be dropped. Marc, your call, as an author of
> >> the patch?
> >
> > ( Why is the patch prefixed "drm/msmi", is "msmi" a typo? )
> 
> Whoops, a typo.
> 
> >
> > -> For the record, Arnaud is the driver's author.
> >
> > pll_cmp_to_fdata() was used in hdmi_8998_pll_recalc_rate()
> > in a commented code block which was later removed.
> >
> > Thus, yes, it is safe to completely delete the unused function.
> > I'm surprised gcc didn't catch that...
> 
> Thanks, I'll change this to drop the function.

Seeing no updated revisions here, I've posted a patch that drops the
offending function. If I missed an update, please exuse me.

> 
> GCC doesn't catch unused static inlines, while Clang does.
> 
> BR,
> Jani.
> 
> 
> >
> > Regards
> >
> >
> >>> ---
> >>>  drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c | 2 +-
> >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
> >>> index 0e3a2b16a2ce..c0bf1f35539e 100644
> >>> --- a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
> >>> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
> >>> @@ -153,7 +153,7 @@ static inline u32 pll_get_pll_cmp(u64 fdata, unsigned long ref_clk)
> >>>  	return dividend - 1;
> >>>  }
> >>>  
> >>> -static inline u64 pll_cmp_to_fdata(u32 pll_cmp, unsigned long ref_clk)
> >>> +static inline __maybe_unused u64 pll_cmp_to_fdata(u32 pll_cmp, unsigned long ref_clk)
> >>>  {
> >>>  	u64 fdata = ((u64)pll_cmp) * ref_clk * 10;
> >>>  
> >>> -- 
> >>> 2.39.2
> >
> >
> 
> -- 
> Jani Nikula, Intel

-- 
With best wishes
Dmitry

