Return-Path: <linux-arm-msm+bounces-42892-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CB89F8A29
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 03:41:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CFD8716BB84
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 02:41:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88A1522331;
	Fri, 20 Dec 2024 02:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ODv0NCIM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0221CAA4
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 02:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734662459; cv=none; b=oOcKKbEFX9WBcWUk4gSKe2LwSAUB68i3kaI63zpjtH7RpShC3ve3eNUS9BY0FK+1K50ZFRNcazqEMhr7JqWhELod0Wxyp+iWnIPX0m9TMRUBlITgAv1Ep4HxTW3oZZCCqALD6ktPCowfkBnG/NnkW+Bheii2MRj3RD07pf/8dVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734662459; c=relaxed/simple;
	bh=peGrK4jMcuUUu3eDKf2bJIx6D83/7Hm+35bxd84rYKs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VP7AsaEd0OwgKgZ+0G+xgPtPxGE9dPU2TlglMYubmyYxot0VUczzuhdLPT+7JoXUlj4yhD4JoNdPB9zikyLS1jm9J4EB15XPzMACQAvvnX2NGVCBH6HEkKFQIgCb1CtZsYTPwo1fYjqeY4TZWkpJcPHQuVd+D3ngNgBjaqphfgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ODv0NCIM; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3011c7b39c7so17466951fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 18:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734662455; x=1735267255; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jj0/+JoMZ17NUsO/ZKTRoawucSi6dpMQmNWszONhX+A=;
        b=ODv0NCIM6hj8RQEU/RDpiBbSLyjcmIEkCA7n54Hk59ZfL71HjvNPziM/nwZotHNoJo
         QO+WS63kCZ/Vk5keps52adLGbeB2MXoj+Qn0ksOlHOA6FPpebFPrUAL7t2RSB1OZXL+e
         DcW/Fw+DV348llydOU4vJKGUdBciHAUj5Mipupda0ZyS0L+eK5yY8XKKD1hO1kE0BOI2
         y4rnT2kgb0MwCpEiStWTJWya6AErVtF/F5CIT7U2dGpF9kA/qR7q+NsTVzXliUSJGtpr
         1ec7P9ehZHN0gQN2xKo4L/xxve/P3e/rbEeKY+gpQnLYOR+1qmADTvpbvTFzQ8QVsy8p
         uwTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734662455; x=1735267255;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jj0/+JoMZ17NUsO/ZKTRoawucSi6dpMQmNWszONhX+A=;
        b=JD+xnjYKXNGsAXu9e6dohw+xpqIA7bL80y4jVLVSwCQJjKgFy3HhGBxMtrPW2DZPOQ
         wJCDl6IVxKyja6e8UX5DjzoUMLmoMPznMCLXkXVordBwIop/1RptTjKosb++eMBZGDSE
         a57aiekFHmzn/Lg8KUoBASSGX2UXuioXxS57VG1wb4TpzPwQtq6D2sbT/sPNsRx1kJex
         AlKG+7ajaENFK1M8WOgSj8tKKU3MIo6JL69fAvcWV10z2u5tRSu1AeQUNj+xFbgtHa/B
         tN+pkyTPXJrcTCQksMajWVtADajA9YQEPJ89fCgnWWJ6vyxt/AjrNXCenVtqH/K4rE0I
         ebEw==
X-Forwarded-Encrypted: i=1; AJvYcCVW3nPGeIaq/XzBI2X/CNqNa82m0Iu6hXC0TtFyESPwcc/tlGhc9a0PpiIGSRvQulq60G5EVW1PqSRKsmu5@vger.kernel.org
X-Gm-Message-State: AOJu0YyKBRFhxnq89w3GDACu69cHKeHweH74dYI1KttANtJruETmwx4O
	E9VuUaHbD+rSZPLvJFCugUoe7UkipUdzi1+oVDPBipDnTEL9g+KWJWrDT+eil2g=
X-Gm-Gg: ASbGncskykx0TUcU+1On+EJ46IcHbPPuRFVAsXWRRkUlyrI1E0fMvF2olLHddF4jH71
	hznVAWXmDvXt+wMEnn7D/CczHWGVdot9BWsCSxTDQL2p5VS7RCJQseO7souRXfNy5sVTBPP1v25
	5/xq9SN/x0rfAXiySOGYa1xhdgzvuQ+EVOn+oN/n+XiTRvrKVDRSs3A9x0RQhpRd4djed6bvBn4
	gO1sBQRgX6um+I0tfLqInf541Odsb3A2ZQDariVlqc5smLR70Ju8vPDTXwNHEW4U2+Ugs5i4viE
	eY+B0nNfXnFwusPkWhJSKUm3npZfAIyjJeWG
X-Google-Smtp-Source: AGHT+IEUtxddJ0Qtp8K+sqBvLg335FfoFSz3yowbgMd4Sr4LEg51Aq8dj7zo+GJF7reCRmcWomU+lg==
X-Received: by 2002:a2e:b8c5:0:b0:300:31db:a782 with SMTP id 38308e7fff4ca-30468517676mr3478791fa.6.1734662455551;
        Thu, 19 Dec 2024 18:40:55 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045adac5bbsm4064911fa.53.2024.12.19.18.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 18:40:54 -0800 (PST)
Date: Fri, 20 Dec 2024 04:40:52 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, 
	Simona Vetter <simona.vetter@ffwll.ch>, quic_ebharadw@quicinc.com, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Rob Clark <robdclark@chromium.org>, Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v4 08/25] drm/msm/dpu: fill CRTC resources in dpu_crtc.c
Message-ID: <pqy2qa2ikvadchox3jtrfuimmzeauuxkuyalpelzzfjzsddk3i@htband4aqjxr>
References: <20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com>
 <20241216-concurrent-wb-v4-8-fe220297a7f0@quicinc.com>
 <097a3d10-0992-46a4-8f89-aa54538c9776@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <097a3d10-0992-46a4-8f89-aa54538c9776@quicinc.com>

On Mon, Dec 16, 2024 at 05:39:15PM -0800, Abhinav Kumar wrote:
> 
> 
> On 12/16/2024 4:43 PM, Jessica Zhang wrote:
> > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > 
> > Stop poking into CRTC state from dpu_encoder.c, fill CRTC HW resources
> > from dpu_crtc_assign_resources().
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > [quic_abhinavk@quicinc.com: cleaned up formatting]
> > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 29 +++++++++++++++++++++++++++++
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  4 ++--
> >   2 files changed, 31 insertions(+), 2 deletions(-)
> > 
> 
> <snip>
> 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > index 2b999a0558b2a016644ed5d25bf54ab45c38d1d9..a895d48fe81ccc71d265e089992786e8b6268b1b 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > @@ -1138,7 +1138,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
> >   	struct dpu_hw_blk *hw_pp[MAX_CHANNELS_PER_ENC];
> >   	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
> >   	struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
> > -	int num_ctl, num_pp, num_dsc;
> > +	int num_pp, num_dsc, num_ctl;
> >   	unsigned int dsc_mask = 0;
> >   	int i;
> > @@ -1166,7 +1166,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
> >   		drm_enc->crtc, DPU_HW_BLK_PINGPONG, hw_pp,
> >   		ARRAY_SIZE(hw_pp));
> >   	num_ctl = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> > -		drm_enc->crtc, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
> > +			drm_enc->crtc, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
> >   	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
> >   		dpu_enc->hw_pp[i] = i < num_pp ? to_dpu_hw_pingpong(hw_pp[i])
> > 
> 
> This chunk of diff is unnecessary. You are just changing the order of
> defines and fixing alignment. Does not have to be in this change.

I can drop it while applying.

-- 
With best wishes
Dmitry

