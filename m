Return-Path: <linux-arm-msm+bounces-36604-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EF39B83B3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 20:53:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A78B8282CE6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 19:53:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D66D61CB52E;
	Thu, 31 Oct 2024 19:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="behjUGTx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866631A2562
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 19:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730404402; cv=none; b=XbwpY3D4/QC9nWjIZFvY3VVEXqaBXhtH6RYIa+MD3ZdARS/lnKfdXYYkDr68Z3wH2aq46AVdcuQ5QXZj0g24BoIRVmkXxS74GYv/Wjzled1JI2XnRFxGJky9o1uOMYbJyRRV5AFfuirv+9f8c6Zec+t4UpkwB5ngiZPbx3spWzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730404402; c=relaxed/simple;
	bh=or/eOjLkt95sAbdaUMnzJJV8ZsreHodlp3r+ogX+XhA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XaNS0SPJXo9umTrF26aiZ1ol3NBTeOqCZKWtgS0inDA7auXAqQ7T+/UuWYz1ZN1jFEoug8feiIOJV3unJM9frIlFIdv+CUVZ7uidKuntoN4DsJhmzJYek5Mz9YCVd/xGsRSmqyNArFtb5o4Vi7CL1GPnYsreAdylGcQX+Va+5GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=behjUGTx; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-539f58c68c5so2510915e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 12:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730404399; x=1731009199; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FfLXMCQQFkBg7dASFcVMaYIBkwL01Sjg2kKn5PFIJT4=;
        b=behjUGTxDyLhrACO6Nt88AvC5vkWc2d0XzbWDNrLEHOshn5XEgWXIGXCJOa0kaarjE
         zpOZu1brcZIFnoz+cp/KqG7+XdUSamNbRuogpY8xOzv9unBDl400Rwn4H+F1v7ikBCgS
         /6bjoise2tA5SkU+RoH9mfJewTPB96IncvpnBczJBbhewoG04X4dNET43ypWhc0OHAKX
         M5CJQ02Gl5oDmgG4lA3Rf5EOAEXlKU3gQL/cLtxm1f0gY+YKYjyPi2hbq+TvPBM0fdmC
         fkRxXSBnwMKXhvXileUTf1rKZ7E4dcragz7k9YSMLe9xs2T5S+4qSVfy/sCAYfwerIzr
         KroQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730404399; x=1731009199;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FfLXMCQQFkBg7dASFcVMaYIBkwL01Sjg2kKn5PFIJT4=;
        b=QTUIjHfsxhwb5iLmJvefLmujzCpQgZiy8zANsMfCVwfdvLSeF3vtMIkYfl3pJdNzR/
         DK3qErEEAlZL7vxUKHgt4vzboPvp4xLTestmSMdw5XEB8JL6onb/C/W/i62k6JvMLAZv
         XZkr5B+EynN6k0QQZkdaU7EWTKBnIsmljnAKqgdjAlJPwKw+781WFXfv103uGkTznUQ/
         wbxHccUvOw30MGB4UAvNlQy7qqZ0me5ITiyLI7h1G52QamQPVWg57Z8OhUlzETmSUGMl
         SKVNmiSA24j6Kib/9VhBxU0HrxTI8NKmKKbWdoS8bv1EAT2iEpqYpQQY2qRaVJDNPhhF
         bQ8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUVKyrHy8/5U8ZjW25QQMfjjhe01uZboYPBvDijfIo8e2sLbXiMErKF1vI1fefqpn7dt7LRjTWiqtfqIazl@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7rHTxpbHszi9cZkgvVZBpHEjrPvKpTTsic44Kyv6VbM9TWn7/
	aBcA/qbjY4nve8Qsm+4CUDiJGkhdER2UXxfWLFDTusi23/En1Uud2VwIUW9I+eE=
X-Google-Smtp-Source: AGHT+IFbIDigm0flj16NCCbZnnareTFGiMJU9B1xBShOIW2PD8XpTBELPIlnMY8x52kyuov0Cc5GyA==
X-Received: by 2002:a05:6512:3e0d:b0:539:f10b:ff97 with SMTP id 2adb3069b0e04-53d65e16242mr1025066e87.49.1730404398459;
        Thu, 31 Oct 2024 12:53:18 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bdcbcf6sm306468e87.194.2024.10.31.12.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 12:53:17 -0700 (PDT)
Date: Thu, 31 Oct 2024 21:53:14 +0200
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
Subject: Re: [PATCH v3 05/23] drm/msm/dpu: move resource allocation to CRTC
Message-ID: <33b25qy73byvz35djhduq4r4kksqtvels2fty6ikxkawox33u5@udv6j6buxnj2>
References: <20241016-concurrent-wb-v3-0-a33cf9b93835@quicinc.com>
 <20241016-concurrent-wb-v3-5-a33cf9b93835@quicinc.com>
 <3afded46-7aef-4444-9b61-b97f71d0e5fc@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3afded46-7aef-4444-9b61-b97f71d0e5fc@quicinc.com>

On Thu, Oct 31, 2024 at 12:37:03PM -0700, Abhinav Kumar wrote:
> 
> 
> On 10/16/2024 6:21 PM, Jessica Zhang wrote:
> > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > 
> > All resource allocation is centered around the LMs. Then other blocks
> > (except DSCs) are allocated basing on the LMs that was selected, and LM
> > powers up the CRTC rather than the encoder.
> > 
> > Moreover if at some point the driver supports encoder cloning,
> > allocating resources from the encoder will be incorrect, as all clones
> > will have different encoder IDs, while LMs are to be shared by these
> > encoders.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > [quic_abhinavk@quicinc.com: Refactored resource allocation for CDM]
> > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > [quic_jesszhan@quicinc.com: Changed to grabbing exising global state]
> > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  86 ++++++++++++
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 201 +++++++++++-----------------
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  19 +++
> >   3 files changed, 183 insertions(+), 123 deletions(-)
> > 
> 
> <Snip>
> 
> > -	/* See dpu_encoder_get_topology, we only support 2:2:1 topology */
> > +	/* We only support 2 DSC mode (with 2 LM and 1 INTF) */
> >   	if (dpu_enc->dsc)
> > -		num_dsc = 2;
> > +		topology->num_dsc += 2;
> > -	return (num_dsc > 0) && (num_dsc > intf_count);
> > -}
> 
> I dont recall the context of replacing num_dsc = 2 with num_dsc += 2
> and its not documented.
> 
> <Snip>
> 
> > +	/* We only support 2 DSC mode (with 2 LM and 1 INTF) */
> > +	if (dpu_enc->dsc)
> > +		num_dsc += 2;
> > -	return topology;
> > +	return (num_dsc > 0) && (num_dsc > num_intf);
> >   }
> 
> Same here
> 
> This should not break anything with current code. We could land it the way
> it is as this was the version which was last tested and post a follow up if
> this was not right. Something to be documented though, hope this note serves
> that purpose. Rest of the change LGTM,

As this is supposed to be a refactor, I'll land it as num_dsc = 2 and
let Jessica fix it in the followup patches. I think it's better this
way.

> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

-- 
With best wishes
Dmitry

