Return-Path: <linux-arm-msm+bounces-38702-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5E49D52BD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 19:46:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C874A281D28
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 18:46:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32A3F1BD9EC;
	Thu, 21 Nov 2024 18:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TKtDv2sS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E734595B
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Nov 2024 18:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732214766; cv=none; b=pxph0r7hbK3+MkA8RNTR1QB2E0RyloF7rbK8f1paw6Bv6ixFq7QxWa4CXlZ2+XEEJ4POvVffx/O5UAEpIpTcnR4h9bjYJxGYa06egqDa1gCpLvpEANdte+bvz/FMAMshK+O883qil2/i4VzOKXP3GNrybUGCpmq+SiAc27jRMdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732214766; c=relaxed/simple;
	bh=3UUlF0HmxlSVz8Df4mv35dnQDsPGSDO7wbgueULFr/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lnx6/KiqxJTX7+EU4IRAn3hYwKJJOpC12I7ZuKsibZgNqQhlH8uC+5Huy7lDGu9/asd7iEkp5+Y4yCXeCb4yzwyjwJGCHa2el49n31XTo4LRoRjRdZy+scnwv4JmOhXlmgAyzhih2W6wAGTXK/ZFwyydEX5RJkF1BLnk25k10c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TKtDv2sS; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53d9ff8ef3aso1459343e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Nov 2024 10:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732214762; x=1732819562; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CnablajdzkJVJy6Wp4cRfkLe1DSYH+fJmZ0JrWl5Hcs=;
        b=TKtDv2sSEGqIKmg0RK6qiMmKkwmtE1dQGguTGiu9XutIdt36vETisvDh3szpJIqw8E
         OFlqDE+drW6IWw7YDLcsUiiwn4sYfT0/Q3zXrirbVbP/vRd79Ys2xe0qNJKreVyFKsTF
         Hq92KvSfEpQtmTkJO+eDGiX+nECVtSJmS2ltuqjRfKuimEp8T6YaA/RXqtkDxr+3p05+
         W69eOKgPuMWx330i5qPiqGOUuznaYUCX2LMdKxGktdzXLWq55xJgmejSpR3NUq/PV43P
         ceUcIebASRm3vFuJOV9iumZYIJ0CJJy+u0PiGR7ExuRtPSZhcuIADU0nZm9v2qLMlqI3
         Hzyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732214762; x=1732819562;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CnablajdzkJVJy6Wp4cRfkLe1DSYH+fJmZ0JrWl5Hcs=;
        b=aUtC/xNBU1AOj6DOtcIUH4RT3e9mwN8NTcv26ouykttZICGJTdOkpVTf4vlFX2vjYg
         nP3sNPJK8uYpL5WVklAXYwpC3d4GVffFkxEqI1H5diKYpUt7dGeH5idOycii/Bsepy/O
         I+egeYofsfGWLR0IxqvCkX5jyM5PsAne9bs7K3nvnaCztoYm/L5oezm1mQusJE9V1332
         b6blZuCVHdiNfc3pQt3P10ru21jZVF8kcvIrASkdw/NKsUpLLUVgRPXWtddX3AxfMkyB
         +c3lgg9YITwVC6DmlQTIcy9vrRj/qkrt0+rdcULZBEwdtv+95GqSOk1+pDHAx5AgY+//
         /qQw==
X-Forwarded-Encrypted: i=1; AJvYcCX3m+RUysnoWd0MQYnTMd1mclaIf09/CaByYlCECJxoaJPto5tHx1fhxT0i628kUWfnxByHDI4v03yVKyI7@vger.kernel.org
X-Gm-Message-State: AOJu0YyzSciEiHuQLeaHMs1kOUVVWm6SMZAtmngdm7IESUcZNKecpnsC
	lpK5CKeMB9Ff2C14q9HtN7o5jmLPhRxGfN3bALIw2wtKRBSQ6m2x26i1JljrsAs=
X-Gm-Gg: ASbGnct2KYoXDlOlJ0nE69zwu9H1jPv1RpmedRT5EMviNHwGcU8eR2xCkYF1OWv/+7a
	MZgCe8UUak5GAwAIPIJsmMc7vfEl8K9KCwy2LGmeUMPUxlmGdtRHfsadwWbWmr33BW3aAaZJANN
	uwEmm5prYfOZ/NPQqtDLjoG8rr1QVCxP54/itQ4Nyoa01Gp9tQksiusgWloTSDguZ09/LUVobfa
	+f+v/zXi0PRIAPBcBh+hd1O0by1q8dmBDq/M6+0hWScv05yzIlwmZ7NNvmfth5H5bSaR3dYQgtW
	uJBFbBZ6UXW5WgduJZzDzK+hUMIUAg==
X-Google-Smtp-Source: AGHT+IEFMJhZvAQ6Q6Wl16HShSZo5FGRcfel9GsUflAZEQIhYBQDxaV99Gquo8VIj1VgFnA8lOzrRw==
X-Received: by 2002:a05:6512:2383:b0:52f:c13f:23d2 with SMTP id 2adb3069b0e04-53dc13417b0mr3615259e87.25.1732214762476;
        Thu, 21 Nov 2024 10:46:02 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd2497dbfsm44161e87.244.2024.11.21.10.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 10:46:00 -0800 (PST)
Date: Thu, 21 Nov 2024 20:45:58 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>, 
	Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Connor Abbott <cwabbott0@gmail.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 05/11] drm/msm: adreno: add plumbing to generate
 bandwidth vote table for GMU
Message-ID: <yo7silisbeesgdn54x7wsy2tgqw5wcjzdbm7ay7htajk3k6xib@v45gfvdtlaie>
References: <20241119-topic-sm8x50-gpu-bw-vote-v2-0-4deb87be2498@linaro.org>
 <20241119-topic-sm8x50-gpu-bw-vote-v2-5-4deb87be2498@linaro.org>
 <stifp2gtqxmegysrewfuwdsxpqin6zznvqndw7rj5nysi6rq4g@543stomenpvf>
 <a1aa497f-3be9-4870-a09a-d91f10091308@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a1aa497f-3be9-4870-a09a-d91f10091308@linaro.org>

On Wed, Nov 20, 2024 at 01:37:16PM +0100, Neil Armstrong wrote:
> On 20/11/2024 12:42, Dmitry Baryshkov wrote:
> > On Tue, Nov 19, 2024 at 06:56:40PM +0100, Neil Armstrong wrote:
> > > The Adreno GMU Management Unit (GMU) can also scale DDR Bandwidth along
> > > the Frequency and Power Domain level, but by default we leave the
> > > OPP core scale the interconnect ddr path.
> > > 
> > > In order to calculate vote values used by the GPU Management
> > > Unit (GMU), we need to parse all the possible OPP Bandwidths and
> > > create a vote value to be sent to the appropriate Bus Control
> > > Modules (BCMs) declared in the GPU info struct.
> > > 
> > > The vote array will then be used to dynamically generate the GMU
> > > bw_table sent during the GMU power-up.
> > > 
> > > Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> > 
> > LGTM, two minor nits below.
> > 

[...]

> > > @@ -82,6 +92,10 @@ struct a6xx_gmu {
> > >   	unsigned long gpu_freqs[16];
> > >   	u32 gx_arc_votes[16];
> > > +	int nr_gpu_bws;
> > > +	unsigned long gpu_bw_table[16];
> > > +	u32 gpu_bw_votes[16][GMU_MAX_BCMS];
> > 
> > We still have magic 16 here. GPU_MAX_FREQUENCIES? GPU_FREQ_TABLE_SIZE?
> 
> Yeah it would be max frequencies.
> 
> I tried to replace this 16, but it's used as ARRAY_SIZE(gmu->gpu_bw_table)
> like the other gx_arc_votes & gpu_freqs.
> 
> So I don't know what do define and where, and how, a separate patch ?
> 
> The define would only be used in the struct, not in the code, or whould I
> drop the ARRAY_SIZE and use this define ?

I'd say, define in struct, ARRAY_SIZE in code. And yes a separate patch
changing gpu_freqs / gx_arc_votes would be beneficial.

> 
> > 
> > > +
> > >   	int nr_gmu_freqs;
> > >   	unsigned long gmu_freqs[4];
> > >   	u32 cx_arc_votes[4];
> > > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> > > index 4aceffb6aae89c781facc2a6e4a82b20b341b6cb..5b80919e595fa1ba0a3afcca55feb89e60870cb1 100644
> > > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> > > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> > > @@ -44,6 +44,7 @@ struct a6xx_info {
> > >   	u32 gmu_chipid;
> > >   	u32 gmu_cgc_mode;
> > >   	u32 prim_fifo_threshold;
> > > +	const struct a6xx_bcm bcm[GMU_MAX_BCMS];
> > >   };
> > >   struct a6xx_gpu {
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > 
> 
> Thanks,
> Neil
> 

-- 
With best wishes
Dmitry

