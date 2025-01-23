Return-Path: <linux-arm-msm+bounces-45945-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CF0A1A287
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 12:05:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B688B3A47F2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 11:05:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63AB220CCE3;
	Thu, 23 Jan 2025 11:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fc6HrnNS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6C91C5F14
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 11:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737630353; cv=none; b=Xem5ImhUnjnj4Qtnu+lEHWHshf13yjHXVvL9n+oJ8Xl6HsAE8dsQLPt8tOpEzJPJhhAKxaD0rgxoZOxadZRtG44P+9bvZeEyuC+vt0+KPB1vUgOP1K+if6/Pex82fKPe6ICuJ5is5SFQwxZsvVQKR2askUadSSr0ciEHEwbv6d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737630353; c=relaxed/simple;
	bh=lnsK60NAQN2IxDqwxkDbAExBUNfiY4yX+ux/mcm5QfI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YyseZWM5PORFEEPCNnM+671NWIgJdBw+2RclfFQAqKYuMF4wVaB/U5vPZaPD9lCbgOgAmGjBSXRzM9Q4AlGUhHJ1J+DJMpkJCJSisY43WEQGHRiUsaeLeYXQKYezZvPpixNQVXqYAOiKLC70uIfgUiS4G3/+0pwX87D0mxBA7Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fc6HrnNS; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53e3778bffdso904399e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 03:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737630349; x=1738235149; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CFYMIx7gA2x2BXWR8sEBjoZP5q8qiqn+m17lbzTPceE=;
        b=fc6HrnNSVr5PopVVVp92RWSs4oFg/4I6XANOsQ5eH5X3J/8KzHPCbXQ92hxtShQt7b
         UHJEf/m+ra17PXii8dQjYYClBhDHmKEuSVwkuQ5WKaV7PvjzvWQZAdS0ommY3ETkRRHX
         gAZH5WrE8imyp2oFnFFBLOyVCJeb9WPRkuGrbyXKT1p0qbjwrHlTamWjQBstrmqioFe4
         IcsswE5UqtDFjUR8yVYuJxHAoL9YPOcgk0/aYGdAdeTUGyZl8e4iaAraWwNbrkdtO3gc
         3W8KrTSOGA22caTbQzlzQq6AeMPpWcCMtwptpyqESC6fVABNozdYXpcV+RR32gZBpYgZ
         u9+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737630349; x=1738235149;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CFYMIx7gA2x2BXWR8sEBjoZP5q8qiqn+m17lbzTPceE=;
        b=H+b/0LPpo1MVxxlN8H8JpHDI4Sl311kZnkExMe1bz0kctFFoTM9Lqt+e2xxpCChwnb
         KflSYMCUyUpgj3N3gpBsGNwgu2xKEZiJKEFl1A1o4FSBUjRrQtH/2vqpmCOTzEnDXXBd
         GTBYO2mywqT9ruY41lVt1VzktkD7K2xVWbNeGhZoWt0WyZ7OrzwQUzR2l3rzmBLfPe9p
         bXbiVHUDbsnR2+dP/+XB98cKLTTnNWBPis5V78o15kMyczHEGFOM4xghhwByNob53GwC
         ganG+KWizotI9wJdwkA5NP+qcKYKss2RlmTN2dYQiDv+xsXesy2WyyBHM63jJ7MY+YNj
         RP8g==
X-Forwarded-Encrypted: i=1; AJvYcCXpLASVD9nvtgi+SjPTWFbkEnTEzvArTuZQc6uuXQWshgRj7gPWQ6SsOnptd4hABtZ0RTKSEUMdgkL0NulQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwUmWa2UTtdVFOV8metKajDVdps2bwgAM9/wu3EXbGKGIEof1yg
	yqsfgyvP1DOu4ZoK6WdAMktYxdCuwhqBoW7lsvlzcjcOhM4zG1CWVJfgUdvJZBg=
X-Gm-Gg: ASbGncuncAPG25f7h11od9ercgkaq2HVtwZucCrl4ujuKtRwn1mxMF7mPwMWwQthDOp
	Jeo0DZ3OGKuWLNLyV4+8GKatKn9rzyML9QlFkTEPNhfYWUSayLq1qmHVCfmF81ZxosxBlv8U98W
	E408MA1rCSYFj31QHUPPHHCv6y3vrF2Flk8Ut8GwSIF8tj1aePEYQ1dmfHeqbQaT/9q/NFvhcNZ
	BQIwdlJQWn3uZ6hZmLGkzHBty8WSv0JXf6W+Mpu2UtZCKNh4WRRQwr+KMmW1Ui5wwNzA6gMBRck
	noyVAQ8+FfHZb7oxYCAlkae1BFrNf12NcUwr0w/0QjJ20vAIuWypAjgdgv3p
X-Google-Smtp-Source: AGHT+IHOaMZIgrl/i9fQhU0VenZdqikom/uRDq5+HNRf0/hpwi1H0EDReWzRh+78eKvL8X05QKwEBA==
X-Received: by 2002:a05:6512:3e03:b0:540:1b53:d412 with SMTP id 2adb3069b0e04-5439c28ac2dmr11408048e87.43.1737630349503;
        Thu, 23 Jan 2025 03:05:49 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5439af66c36sm2609048e87.160.2025.01.23.03.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 03:05:49 -0800 (PST)
Date: Thu, 23 Jan 2025 13:05:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH RFC 4/7] drm/display: dp-aux-dev: use new DCPD access
 helpers
Message-ID: <7unkxysvdn57fp6t7sjmgqsiacg5grbrk4lp3fbfdvaht3hq4o@gqshn45sa5ww>
References: <20250117-drm-rework-dpcd-access-v1-0-7fc020e04dbc@linaro.org>
 <20250117-drm-rework-dpcd-access-v1-4-7fc020e04dbc@linaro.org>
 <87tt9pn8uu.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87tt9pn8uu.fsf@intel.com>

On Thu, Jan 23, 2025 at 12:05:29PM +0200, Jani Nikula wrote:
> On Fri, 17 Jan 2025, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> > Switch drm_dp_aux_dev.c to use new set of DPCD read / write helpers.
> 
> This might be one of the few places where the old functions and the old
> return value was used in a sensible manner.

Well... Yes and no. What does it mean if we return less bytes? Is that
still a protocol error?

> 
> BR,
> Jani.
> 
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/display/drm_dp_aux_dev.c | 12 +++++-------
> >  1 file changed, 5 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/display/drm_dp_aux_dev.c b/drivers/gpu/drm/display/drm_dp_aux_dev.c
> > index 29555b9f03c8c42681c17c4a01e74a966cf8611f..a31ab3f41efb71fd5f936c24ba5c3b8ebea68a5e 100644
> > --- a/drivers/gpu/drm/display/drm_dp_aux_dev.c
> > +++ b/drivers/gpu/drm/display/drm_dp_aux_dev.c
> > @@ -163,17 +163,16 @@ static ssize_t auxdev_read_iter(struct kiocb *iocb, struct iov_iter *to)
> >  			break;
> >  		}
> >  
> > -		res = drm_dp_dpcd_read(aux_dev->aux, pos, buf, todo);
> > -
> > +		res = drm_dp_dpcd_read_data(aux_dev->aux, pos, buf, todo);
> >  		if (res <= 0)
> >  			break;
> >  
> > -		if (copy_to_iter(buf, res, to) != res) {
> > +		if (copy_to_iter(buf, todo, to) != todo) {
> >  			res = -EFAULT;
> >  			break;
> >  		}
> >  
> > -		pos += res;
> > +		pos += todo;
> >  	}
> >  
> >  	if (pos != iocb->ki_pos)
> > @@ -211,12 +210,11 @@ static ssize_t auxdev_write_iter(struct kiocb *iocb, struct iov_iter *from)
> >  			break;
> >  		}
> >  
> > -		res = drm_dp_dpcd_write(aux_dev->aux, pos, buf, todo);
> > -
> > +		res = drm_dp_dpcd_write_data(aux_dev->aux, pos, buf, todo);
> >  		if (res <= 0)
> >  			break;
> >  
> > -		pos += res;
> > +		pos += todo;
> >  	}
> >  
> >  	if (pos != iocb->ki_pos)
> 
> -- 
> Jani Nikula, Intel

-- 
With best wishes
Dmitry

