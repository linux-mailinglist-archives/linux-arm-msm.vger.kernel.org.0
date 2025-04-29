Return-Path: <linux-arm-msm+bounces-56049-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FD2AA0500
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 09:51:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 409783ACF1C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 07:50:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4D7F27702E;
	Tue, 29 Apr 2025 07:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HQj5HrM9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2EC275874
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 07:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745913061; cv=none; b=qCF8aKlOHABNYmJTjbdj54rwNLesAGGBtIBmgyctw+NuTZ1xT4TDyNmqo6nKwPGXBF2csqswVr5uuBC3LMLhFw7sJWIBd07YGoLpdQqBY4rOjhIAKFo6BYJarzf/CbLdmAvcP416QHMIFfB3JVJj7KuUjz2z4Xv+M2UExwj+SgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745913061; c=relaxed/simple;
	bh=0maA4HWt+dfsb/SO6st7769kV3RQOZp5X82vWych+9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NZSkQal0BhScq7v8LlapWAQ7u9ogCk+9CNQhvplt1Dlx8waNhbXWL14gJYP+FW79yXrRFogaHTbD+jDH/QuquVmphuAFXBQXuO4sGUzm7fn1TRl/WiXTIASMIrXAjZEPyPOp+z1GYImS9ZooKyuelzEP7q4D/n2uOhh46cVd8xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HQj5HrM9; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ace3b03c043so872335966b.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 00:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745913058; x=1746517858; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4S3OVk3iZS4jTjecVJq5ncwg3Lfwh0WDUheLTONON4I=;
        b=HQj5HrM9UKHvccVC+mihNf6EhrCBAjL27P+u1MU7lepruNBFyZ7LauxMxQlGOFsBF8
         nLCMLxNGL5h2PjX9GqBo1wffrDjxWReDMUrClFEH2vM6KWLras+OqpVVpF5lOoFZhgSm
         T1w4d4aYvevGEjKv3rWrEGnJMIlDTstgioaJlZzWmp7xKLyyBUzg2B8A87YrM1OSTIv3
         pYHVWnn8zfI8c58GKGRsfcun6m6xkgOnwZ+4pVyadaDjqO/8P2afMBXnXfvl+9KQ39WP
         mjtapZbZdNrR1MaBkupOskFVrBeUWAZPnl/qjPwIvGCIRPpQh0Ck8TtHKR81P+g95Y8O
         eD/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745913058; x=1746517858;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4S3OVk3iZS4jTjecVJq5ncwg3Lfwh0WDUheLTONON4I=;
        b=KtYdTuHIJrg7yM7BTSLbev5FhLdabJ+J58e52awdwTDDIXKRVc4FH53+Ku7UbHUclV
         nR2nZ77v11CFKWN5UMX46pXAdIRT6pD8JXANzJRMtps/I52YQhjeb6AWKhubjsK8mZZk
         HgEulud6fRaBKUfQ5GyXUaWSMg+7kJW1yYr0zY3fj2BfBp9QDICUJl/hIfvp303ahrFs
         Gw2r/kiMR3C0BIR8tX2omXR2d+72jhYVRHdTcwyBkKME3ORJ/p4IU5v1ykX41oU5nKPJ
         SMUaaqmaVSKHSH6Ril1/gD5eQdCERItM3mMVrxA4rsSkVWnnk46HvXfbQyvPdRhjOyJS
         8Aeg==
X-Forwarded-Encrypted: i=1; AJvYcCUjZXLIyP3k8PDuUnp98kZRsWtZNjuedP12st4fc+rGm86TG4f04zRUvqnlRIFRE1BBYaC9pm9CS4zEqF7I@vger.kernel.org
X-Gm-Message-State: AOJu0YyDmldsh57BPXdKObWnmRiFQlREfC9bp7OxzHRYRXddhQbm/+IP
	z9jSMkevMeH3B6ptecL/JDPA86tZRC/1l7s/k+gx9nwX6J0PXdhcA6HISUUlRIA=
X-Gm-Gg: ASbGncuu2DgJoezpp/UNZ4n/1w2ZWbzryNRUCX3jX1DEJ0UoS0pRPsvdYSMSlUXxAuH
	KbCJwhI/y8QT8BX9ahEQVTxEBb68D347RtF87ZV4qtm2YuwHeUYyDiT23uO6WVF9WRl4yXhcOiP
	NZbWTd+kDQTTIV0Z/kt0RsGckONnwheeXlzwth6g+cdsDUABdOB7rn5h3NzFIl5qpGr92iNYqjj
	EZ2Mh+KrR3s+irs+Ik6oVTrW0d/MXWUNhHRSkpemVcKKMg5CiodleNLm3NOkGbA4o78R4G0pEXp
	Cc8xGvmEdm3O8ZSagZVtuAQ6Ddh89ADctZ/3Vg==
X-Google-Smtp-Source: AGHT+IETfUdZEy4CFxn1YEIQmSr6ySR3G/g5zLsPVQSq6DzfPUY0rl3GN75l8UgZGLkV0LGhqQnxFA==
X-Received: by 2002:a17:907:7f0f:b0:ac3:446d:142 with SMTP id a640c23a62f3a-acec84b8840mr173980866b.2.1745913057842;
        Tue, 29 Apr 2025 00:50:57 -0700 (PDT)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7035464e6sm6980176a12.64.2025.04.29.00.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 00:50:57 -0700 (PDT)
Date: Tue, 29 Apr 2025 10:50:55 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
	Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	laurentiu.tudor1@dell.com
Subject: Re: drm/msm/dp: Introduce link training per-segment for LTTPRs
Message-ID: <aBCE3wSG2g5pp7jg@linaro.org>
References: <20250417021349.148911-1-alex.vinarskis@gmail.com>
 <aA8yFI2Bvm-lFJTl@hovoldconsulting.com>
 <CAMcHhXpmii=Rc9YVeKXaB17mYv0piSFs02K=0r8kWe5tQGk7eA@mail.gmail.com>
 <aA94yOjsayZHNDpx@hovoldconsulting.com>
 <aA+N8YHX0DZ6h9Uj@linaro.org>
 <aBB-gl150GVaZPn5@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBB-gl150GVaZPn5@hovoldconsulting.com>

On 25-04-29 09:23:46, Johan Hovold wrote:
> On Mon, Apr 28, 2025 at 05:17:21PM +0300, Abel Vesa wrote:
> > On 25-04-28 14:47:04, Johan Hovold wrote:
> > > On Mon, Apr 28, 2025 at 11:06:39AM +0200, Aleksandrs Vinarskis wrote:
> > > > On Mon, 28 Apr 2025 at 09:45, Johan Hovold <johan@kernel.org> wrote:
> > > > > On Thu, Apr 17, 2025 at 04:10:31AM +0200, Aleksandrs Vinarskis wrote:
> > > > > > Recently added Initial LTTPR support in msm/dp has configured LTTPR(s)
> > > > > > to non-transparent mode to enable video output on X1E-based devices
> > > > > > that come with LTTPR on the motherboards. However, video would not work
> > > > > > if additional LTTPR(s) are present between sink and source, which is
> > > > > > the case for USB Type-C docks (eg. Dell WD19TB/WD22TB4), and at least
> > > > > > some universal Thunderbolt/USB Type-C monitors (eg. Dell U2725QE).
> > > > >
> > > > > Does this mean that the incomplete LTTPR support in 6.15-rc1 broke
> > > > > adapters or docks with retimers in transparent mode?
> 
> > > > Docks with retimers do not work in 6.15-rcX, but I am unable to verify
> > > > if it did work before, as I do not have a Qualcomm based device
> > > > without LTTPR on the baseboard.
> > > 
> > > Abel (or anyone else), do you have one of these docks that you could
> > > test with the X13s to confirm whether this series fixes a regression or
> > > not?
> > 
> > Before the support for LTTPRs has been merged, if you would have one of
> > those docks (I do not own one) with LTTPRs, link training would've just
> > failed if the LTTPRs were not by default in transparent mode, which IIRC
> > is what the standard dictates.
> 
> Ok, but my concern is if they may have worked in a default transparent
> mode.

But if they are by default in transparent mode, doing the setup to
transparent mode will not break it in any way. At least that is my
understanding of the standard. Also, I tested multiple writes to
transparent mode on CRD back when I wrote the LTTPR msm/dp patches and
doing multiple writes doesn't affect the link training that happens
after in any way.

I do not own such dock though to confirm 100%.

> 
> > X13s doesn't have LTTPRs on-board so when reading the caps, LTTPRs count
> > would return 0 and none of the of the transparent/non-transparent setup
> > would happen.
> 
> But this is the crux; does any off-board LTTPRs in transparent mode add
> to the count or not? If they don't, how would you ever learn that there
> are any LTTPRs? If they do, it seems we may have a problem here.

Count gets increased either way. It doesn't matter if they are in
transparent mode or not.

If they are in transparent mode by default, link training will succeed.
No matter how many times the transparent mode is requested.

> 
> Johan

