Return-Path: <linux-arm-msm+bounces-17288-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5988A1FF8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 22:15:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1883A1F246EA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 20:15:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CCB017C6A;
	Thu, 11 Apr 2024 20:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HMw2DWeX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F18A17C8D
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Apr 2024 20:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712866539; cv=none; b=UOmvDrs5rFOl2Wrr55geQo/LHCWMXv6wJUFR102jeo5Vn3nkn37wJdneNPvhi6k2uvjIMSPZIQLkdcmoL5iu9RTBnS6ncm7YCxJX4Xu36Xa4LjfDaxOAnWryuJ1IQB4Nls1HZ1wgsws4WFQegu3g6ZSX7LiPrNVutgLdvkYa0qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712866539; c=relaxed/simple;
	bh=xZcPqO7ReU3NUagBEcPN6/gO2IcyUcibJH2Opu4ThrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a3mYPniJhkalk6ox0flKOFCI5f5ujRczDL3po7iPiBct8XWQu5WXS/GO2+N328/APGWEGMT6ztNvkXavHjZf64HuBy2FEtkVBCXyBCNaRubVzXCRiFh/ataJmBJLBeK0hHP86IwGeJaRNu94jNKgcs9aD6x2UeUCfYCSElQa7Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HMw2DWeX; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2d718ee7344so1831711fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Apr 2024 13:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712866536; x=1713471336; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ONM6qGXwZNOSTTCELomosW3dBjUNpoKKkgP2gKgU2NU=;
        b=HMw2DWeXUDWvkZ6vtEp5yTyzT7OREQz15OFgMm2CxsXTwVJw12pAwMmU/7MrloBY3R
         NwlaCgtRJIMszz8CxDapHQ1SNTxJOT8rYChwbcR5LFaKtwPJpr/V4JTEgSwVTjkItRGm
         8lRahGvq1vxvx9bN8+27QAJzJiXG8JbpPOfyaLvdky87hJpE0XERJ9u8o0FYd5ATqLwX
         GwhVn1Bv1dNX3qYtgtXLggMY3EoY8bkIsbJBkVvUo1Mp0eA1bssm4UHmpG5fnLyNWlC/
         pWcsb8VKiwnu7uKr9qkjSfFPYHPc1GlYWcJjxhxerTEfw+0VLneuAWSrlujwk6cz7jrl
         b2rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712866536; x=1713471336;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ONM6qGXwZNOSTTCELomosW3dBjUNpoKKkgP2gKgU2NU=;
        b=JsRSQLUhgSlN2PUEfoURmnYQUgWbQfZmTLEZ4aevKLAVgEPIcS0pmTHwwOkUqlVmnq
         hKned3lw5+efzpZ5gGkWaRO3pNS/xh0VOKbym0drw1fvKnMm1kjbD6sfN6vsvE0aztkn
         eoZHXc1DXaX3VuImt3RMWk2dInRG7qIfO1JmH5G5ufZ184ZfR/AJ/2rO/KsYBCg2/dTt
         017+yX0fUwawCZIawaR+JQsXhhDBXhkZKFBVIZhDExf299P0gnKn7wAK1YE0eG5EE6YC
         vst3rlao48bTHjSq2zTpIAPrFlwRU5d98dTA48LzTSeG0umYkICHkTB0//p5+DAm89Wp
         cj6A==
X-Forwarded-Encrypted: i=1; AJvYcCV457VU1jLSTCh1RSAV/J11of6XuV+/ZmvvTCwXl6qlRZfOLYh2vUWg2oA3fsMxOzY2/OvYRKbkstCjTnlNI/kkJ6H3WxWDksgOn6DTIg==
X-Gm-Message-State: AOJu0YzPMilXvJB+TsJ3aXA69JSxNxJklMkHY/oRABnZCwDuhxVuba7u
	vSv4BwE5Tij+JSozH488KO5upnCpu0GpHEoMw0ll0xjN3vr/FpfIylb8pewmeM4=
X-Google-Smtp-Source: AGHT+IGdsNyIbOa4XLU2eXBzW61Cn7sodgybJ2C0I8mwkFnwb0pHkGP0/sxnafUxIWM79J9A5u/+RQ==
X-Received: by 2002:a05:651c:104d:b0:2d8:dd28:8748 with SMTP id x13-20020a05651c104d00b002d8dd288748mr503632ljm.1.1712866535697;
        Thu, 11 Apr 2024 13:15:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id e8-20020a2e8ec8000000b002d860a40f9dsm302300ljl.136.2024.04.11.13.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 13:15:35 -0700 (PDT)
Date: Thu, 11 Apr 2024 23:15:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: Drop msm_read/writel
Message-ID: <jpy7kei47tqbkoqzwz56ibxi4bexecxja3kb4tvqaxub4warix@wu7ita3nrjjz>
References: <20240410-topic-msm_rw-v1-1-e1fede9ffaba@linaro.org>
 <bwhfcobfkddhw2jdj6orvtbejap6ast7njahkbggj6lpelibqi@ae7357lpepmf>
 <ZhgBWv5BjDvQbWWi@hu-bjorande-lv.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZhgBWv5BjDvQbWWi@hu-bjorande-lv.qualcomm.com>

On Thu, Apr 11, 2024 at 08:27:22AM -0700, Bjorn Andersson wrote:
> On Thu, Apr 11, 2024 at 04:31:41AM +0300, Dmitry Baryshkov wrote:
> > On Wed, Apr 10, 2024 at 11:52:52PM +0200, Konrad Dybcio wrote:
> [..]
> > > diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> > > index e4275d3ad581..5a5dc3faa971 100644
> > > --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> > > +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> > > @@ -12,10 +12,10 @@
> > >  
> > >  #include "dsi.h"
> > >  
> > > -#define dsi_phy_read(offset) msm_readl((offset))
> > > -#define dsi_phy_write(offset, data) msm_writel((data), (offset))
> > > -#define dsi_phy_write_udelay(offset, data, delay_us) { msm_writel((data), (offset)); udelay(delay_us); }
> > > -#define dsi_phy_write_ndelay(offset, data, delay_ns) { msm_writel((data), (offset)); ndelay(delay_ns); }
> > > +#define dsi_phy_read(offset) readl((offset))
> > > +#define dsi_phy_write(offset, data) writel((data), (offset))
> > > +#define dsi_phy_write_udelay(offset, data, delay_us) { writel((data), (offset)); udelay(delay_us); }
> > > +#define dsi_phy_write_ndelay(offset, data, delay_ns) { writel((data), (offset)); ndelay(delay_ns); }
> > 
> > What about also inlining these wrappers?
> > 
> 
> But that should be done in a separate commit, no?

Yesm of course.

> 
> PS. Too much scrolling to find your comments, please trim your replies.

Ack. I'm probably too used to GMail and Thunderbird extension which
collapses quotes.

> 
> Thanks,
> Bjorn

-- 
With best wishes
Dmitry

