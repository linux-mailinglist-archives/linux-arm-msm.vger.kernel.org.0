Return-Path: <linux-arm-msm+bounces-40194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3929E9E373E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 11:10:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 98124B241DC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 10:09:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1BE41AC427;
	Wed,  4 Dec 2024 10:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SQ8oa7oY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1A21AA1DF
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Dec 2024 10:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733306988; cv=none; b=Yy6fZ13v+iFC825dysLcSPlJgUE12xY6wbYyQTVg7+/bcHzIUaWWVFT7Bs4WPpVr8LGjfPXLLjHFtufyghOjzO17ifISZ0+XctT67a0FCKIavpLCxdVXrwXxOIk5LPWcn8JCZk2XqbvcSirZrbBxiVX7wlAHcvkLpkJrU8J81Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733306988; c=relaxed/simple;
	bh=BMQwoaYseFJ8zeLch2xIJKZwOwqQ/RVh74KuCupqhhw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ETATsDNUhgBmWzdZkxZiCGsBh9fl6w2DyxYFUhWOgMXIknvj2eghUJZB4N4jIhhcGfQ02EGVkjHU56ycOGBnEJX1hTecSKCZxFLaPN98Uyf/xjKC14d2w/VuiDY7ZoL8hC4IwTsioLrWYU+mm+HzNztksBJlSHXe9NdM4+ajFXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SQ8oa7oY; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53df119675dso8053603e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Dec 2024 02:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733306985; x=1733911785; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6GG/C0igHoeNKj2mH68ClLF3Ygx5izj48/Bea3x0gsc=;
        b=SQ8oa7oYZi5/XnZWCzqe/pqdSvKEtDPM9ZVAeqbKbk0ydq0syhOsXVzd99XlEJBRCP
         qFhthVZ2OFSFplEPKTR171an6xEPhm3ws5Z+xxHQEaaitvao3zK6pST7VeX/tyhW175Q
         ERSo/manyr87A51YFzB0Z8QYaYNy3OqTHEhI+5P51nUNrW2+rQ74mEFYPZuAFZ59Tks/
         hg+ZilgJVjUM8Eu7rLSW0HMuWwonnYGbR4gT3Ux6W0Wqrf3qetFua2s1EilOaLxR0siP
         6wUq0ShlHLMtlrpvqjCCx8uV5e9UwQX3wz8BvuOlj9AZ2To2Ul71luXzJOcJ1F1//nyC
         ZpIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733306985; x=1733911785;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6GG/C0igHoeNKj2mH68ClLF3Ygx5izj48/Bea3x0gsc=;
        b=Jnc5aislyMD8yf72lBaXdS96Un9QvzZX1MNcgQaCHAoku3du3rUVSOD7dmeYO6SsrO
         LGNKA48xnV3GY4j1QpC5py9DY51taK5uaH6OtPdLEsO+E7BHZ8gdo2LIxK3+5wr3QA/5
         LpIUnsbCt4lPQB+9K56TftdXGvjMQh5gRNJ34q5F9i9I4OHhy/vDYF3UFTRSH+ByB5dk
         NctPxaV4G7RF/JimBm+OeJmYMXen8jc20zY90CO1k4aPdXEdzpx9l9MkvP0lvhR3r/+c
         0N4zCxeFO9HYPnaCQSUBSYzfXXygEZHADhK4qHKybx4+g1ruPtME2sEcdAlWqDQRicol
         O+3g==
X-Forwarded-Encrypted: i=1; AJvYcCVIRA3Qa6GUAB648J4LyAkZ9hiyc3eiF/ikaNbtOOfaa+w9Xgxw/2MEcj8k2tMj8niHuRaPxki8D22iveXA@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8+c74VfFWPJvt61DLmF1Irln+QD2WLZ/OoliO8oxr+iF4X06W
	sAMwplRDLco8okxV5kFyO+8g8+Q9pi6N3f+3bjeXIbQhe6NljNOGUQoBvwNj2i8=
X-Gm-Gg: ASbGncv4OA/rGh/kOmAT7T/5LjlA83y/WSP8Iv1Mr7hk237OZ/3JO6kGh3wZwZ/wJLB
	Ox/BdosrWXKXA0CnbRkGpSgpR1H5CyjYGpRlIOytdGjaCRqi7RRBnRyg3eAjYKyLte3m/oD9AXC
	cOZzaWkuvg6JmpfM3ZCjNCSKXAKk0cdXVAmwM41FbctzapWEMViyqUyc4AvdxH5piiPK7JrYRNL
	1GhSewvYm78GtU51D+xLfRm61m9zx7R2Td7RmIjnHkJDGbZPe9sdwo8gZX9J8d3msAJsOgKpdkz
	Upd1mG8KjN6Q6GcEM3NmxxgdVId6kg==
X-Google-Smtp-Source: AGHT+IFeChx3JdkEVrSx44qmoT8HCpAzvLzptFBGVf0Lu16LK9AmpqVP6+Unh/3j2hROlEszt0kJ2A==
X-Received: by 2002:a05:6512:224d:b0:53d:f82a:deb8 with SMTP id 2adb3069b0e04-53e129fdd73mr3741737e87.14.1733306985190;
        Wed, 04 Dec 2024 02:09:45 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e14f97649sm495602e87.146.2024.12.04.02.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 02:09:44 -0800 (PST)
Date: Wed, 4 Dec 2024 12:09:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	Mahadevan <quic_mahap@quicinc.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: display: msm: dp-controller: document
 clock parents better
Message-ID: <pxi2nf4h34xtkickkkuwh4svvhbtsutuz5u3ukzgfgd5rzzcps@g4gct5zuc6kj>
References: <20241202-dp_mst_bindings-v1-0-9a9a43b0624a@quicinc.com>
 <20241202-dp_mst_bindings-v1-2-9a9a43b0624a@quicinc.com>
 <bfa857c2-cd74-4fe2-a88c-3b35a58710b0@kernel.org>
 <gpqrugcsyhz32bvip5mgjtcservhral2o5b6c5nz4ocwbjw5uo@eypv4x6jyrdr>
 <hqe2pipkcnxftoq5mvdk36xmkj3ybr3oto6eghimq75rqlncsm@v45smglhedy7>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <hqe2pipkcnxftoq5mvdk36xmkj3ybr3oto6eghimq75rqlncsm@v45smglhedy7>

On Wed, Dec 04, 2024 at 09:02:18AM +0100, Krzysztof Kozlowski wrote:
> On Tue, Dec 03, 2024 at 03:41:48PM +0200, Dmitry Baryshkov wrote:
> > On Tue, Dec 03, 2024 at 09:01:31AM +0100, Krzysztof Kozlowski wrote:
> > > On 03/12/2024 04:31, Abhinav Kumar wrote:
> > > > Document the assigned-clock-parents better for the DP controller node
> > > > to indicate its functionality better.
> > > 
> > > 
> > > You change the clocks entirely, not "document". I would say that's an
> > > ABI break if it really is a Linux requirement. You could avoid any
> > > problems by just dropping the property from binding.
> > 
> > But if you take a look at the existing usage, the proposed change
> > matches the behaviour. So, I'd say, it's really a change that makes
> > documentation follow the actual hardware.
> 
> First, this should be in the commit msg, instead of "document better to
> indicate functionality better".
> 
> Second, what is the point of documenting it in the first place if you
> can change it and changing has no impact? So maybe just drop?

So, do you suggest setting both of the property descriptions to true? Or
dropping them completely and using unevaluatedProperties instead of
additionalProperties?

-- 
With best wishes
Dmitry

