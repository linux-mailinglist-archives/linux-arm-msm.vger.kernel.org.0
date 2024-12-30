Return-Path: <linux-arm-msm+bounces-43696-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CB39FEBBA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Dec 2024 00:59:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 466D97A132F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 23:59:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C445C19D07B;
	Mon, 30 Dec 2024 23:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LMPP4yp6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D267F2746B
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 23:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735603148; cv=none; b=OlgX+pyiQ8AYM9bWHDqfWKJ4OpJMhethfJz+DRCvTDiupUjDuLiggpd+oMk09P7OdzwoWZ8EJiYdwU9I/4r9cbbNLDeWgSzUxBj2hRepL+HZUazjL5eQWtLcDua4cLz2i9x1DZyKvZ2fmeUa6lBLrb/vYQxb+tmFAnS9c3WyEJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735603148; c=relaxed/simple;
	bh=9P+sGciHJrgOTy1jg2ntkyx70t/bwAZ6VyoLCBm92D0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JwZOwt8Z8BFm+ulBEXEDFlwUOTg53hxjo5/JWnfzrPinAV0zJ33K0qmZP5L1S4zeoAYq+ts/LcG0JiUOIkeS9Ohb+sGeAEce64gdKKEEJnhqC6mbonkoIpYncLV/pdcvihj8ns6LbMXma1/TeSK1wzYFYpXlaBLGZLIrI7Nr6Nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LMPP4yp6; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53e399e3310so11733031e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 15:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735603145; x=1736207945; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=esYDpsWPuEO88zvObUesCzqAb0/9+MI3c8A4Qm20q9k=;
        b=LMPP4yp6fi/8pp3kw9pA1Pa+orNoTA9w9hTMKZ4pXSwpN8wEvFPM9G86meEh7zpUQb
         Mdja/yvJ1osdu8RLI2l8ZzUY27FBPrSe9HTs+RvK7hy5bJQFeeOKfLgpLneyT/pJk2Oo
         o+gVcAsD/m1tz7x/FtyHupinInbpMxGot7u7Bdp5vX/EX8wuurbyzAhwZZ4hDh8bz9Be
         SSrT6OH7MbwA3yJMRh89QYJLahHKy0hd90HLIxPlNq1RCk2auvOhdWg6k1frWcpX2Ep7
         10dE+hyvdTovMgghIbYxNaVMG5esKUCjWJRnZ9A1Oj86mYC5Pj1iqQ2eu9OWHFY03JDZ
         X5yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735603145; x=1736207945;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=esYDpsWPuEO88zvObUesCzqAb0/9+MI3c8A4Qm20q9k=;
        b=fErI85ZkzbNg/RfIfmv0OgOPNmNN3JP68jg6iUmJ13KpoAcp4XymOoEGvgh9zGHB+Q
         vsUgbyK20uwT8YISc3ZU4HX7vP5fPHxktD7vqqp162FplppBiDsn2/xoY1aB0V/ONutH
         HuHp/aBPto0dJnV++zUjmBGpBV5kDau+tZLxXnT4aNyZgqk7p4Z0X8JsfIMl364aU55R
         knHz7zwgRuAL0kjT3av6/qUbZ4Aj1bbnnVPkevWUxzyHm+ftXLMugbsnE1aS0fQw33Rv
         xTVE0tY4wa8j16hm0bPTc47ZWygHHEeg448wvZDKjQT1ZqTa8fxoHYnCYqn1Di4My/cv
         661g==
X-Forwarded-Encrypted: i=1; AJvYcCWlK/3SnSLUMLna3/d7if//pt9EWPRQOAdkb2yGAB31zepvRwMS9DPHDQuYSIT0W+im7rnZQKagt3T+pDKq@vger.kernel.org
X-Gm-Message-State: AOJu0YwWqU2OoVB+rwAKn8lIHOF6HbGEu16bLjQNFtmFpHL5aCxjEfmo
	s31YcRN1NEGlgHJ+HQCg7DCDzoDvfTddVsQ+DwTDQ31qz8Lxu0mX0NkQ50k27W0=
X-Gm-Gg: ASbGnct1KbMoCxxce8CCR2oO7FTB9PfxYbwyCjSdrA+NFE3QBWXn5BuhRvXCpKhA+ps
	92ZLZEbe4SgMdzat5L+lHejVbdWlj+0FoDLeARf0TXLHquqhBPKTyD0uji56s+wE9bpUBPFSkZT
	BcYHVy80fVYBWirwFTobKgb4K5PJjGTDogz4+3grlw7+NCUo1JqlCdWCuWKC3ebWMblStOPhk85
	Ccq5KZ15e8UubjZJGKvSvDkaP9D8S41FE+ztARjVwmUslG7XugTe/TCF4HH6tye42qx7TCa42ED
	qv1r/wJQYe8UaaQ0sUtJdME3pM7Rb/LsAn4F
X-Google-Smtp-Source: AGHT+IF+rLSsY4tbtNxgTE8NrlTlXuaIB94Yc2ChSyIRKdgpG/cckY+ZwMmKpOESxNjsZ97FlkawOg==
X-Received: by 2002:a05:6512:1296:b0:53e:368c:ac48 with SMTP id 2adb3069b0e04-542295229femr10026548e87.11.1735603144992;
        Mon, 30 Dec 2024 15:59:04 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5422382109dsm3217871e87.170.2024.12.30.15.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 15:59:03 -0800 (PST)
Date: Tue, 31 Dec 2024 01:59:01 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>, 
	quic_ebharadw@quicinc.com, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>, 
	Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v4 17/25] drm/msm/dpu: Fail atomic_check if CWB and CDM
 are enabled
Message-ID: <klngsvbaqycfye6bobeq3krvkttno6n6y4qnidoobdobgxfeln@fkzpellmdjlk>
References: <20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com>
 <20241216-concurrent-wb-v4-17-fe220297a7f0@quicinc.com>
 <qpy3yjnrq7ljsj7a2b2avbnd6cptyfr6vzxhm733dyaiso5lwg@txhr5zwjqtt7>
 <ac1cbdd1-ffea-4643-83ed-c5a321e000e8@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac1cbdd1-ffea-4643-83ed-c5a321e000e8@quicinc.com>

On Thu, Dec 26, 2024 at 02:51:12PM -0800, Jessica Zhang wrote:
> 
> 
> On 12/19/2024 9:44 PM, Dmitry Baryshkov wrote:
> > On Mon, Dec 16, 2024 at 04:43:28PM -0800, Jessica Zhang wrote:
> > > We cannot support both CWB and CDM simultaneously as this would require
> > > 2 CDM blocks and currently our hardware only supports 1 CDM block at
> > > most.
> > 
> > Why would CWB require a second CDM block? I think that YUV output over
> > DP (needs_cdm = true) and RGB output over WB (cwb_enabled = true) should
> > work. Am I wrong?
> 
> Hey Dmitry,
> 
> No, I think your usecase should work. In that case, I can change this so
> that it only fails if both DP and WB are requesting CDM simultaneously.

Sounds good to me, thank you!.


-- 
With best wishes
Dmitry

