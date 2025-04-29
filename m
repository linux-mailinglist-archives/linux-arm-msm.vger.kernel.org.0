Return-Path: <linux-arm-msm+bounces-56039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6117AA0457
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 09:24:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 77BEC5A7A51
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 07:24:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92463276027;
	Tue, 29 Apr 2025 07:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iqKvPj8O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687F4275844;
	Tue, 29 Apr 2025 07:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745911426; cv=none; b=mM+uS9fCMyI9ghMAsS7ygJgbL3ySIyMYyb29L3mBguohU98QRnjXifUuDWMdgO3XWBE5ipjuFsXz/OlQXsOUthrOmvE7x/U+L9Y8ZlzbVzNCSAg4+kJO29T4hfX1A/KtyGG1zw4AzYZ+iG60Hrl7Uf5uTMpYBWyYriojMn+4DOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745911426; c=relaxed/simple;
	bh=GTvBB4cqcEPZCXZA2x2a6SH8nj7EOHN48+b8FpTOeNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iADT3NUsJrFStwI/5t7fVCa2EIqa+mgc/rM1dZbb+p6oLV2m7Ad94O59UEa1RAsgmmpzf+Qoz7ETMpEsITKAE9fMq+cAwaH25SWZzehjxc/bela4URd1k8lr508Lxx33hVP3Zk81d0GlvpKHHrjmJ4L19y0bm5LNsNcohoUQXrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iqKvPj8O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C75B2C4CEE3;
	Tue, 29 Apr 2025 07:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745911425;
	bh=GTvBB4cqcEPZCXZA2x2a6SH8nj7EOHN48+b8FpTOeNk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iqKvPj8O4qVO7NAKLAzFUKorShtpffTEeisaeaG1sJFtQPmuuqCIJbolqelu3paHJ
	 ngdfBMDzhssstj5OAoiuzE2KK7go4hHXxVxGHYKh/l3TqOKi0EtnUbM7BdGWmWwOUj
	 TeI1h9HK+c2rVx1Xkz29cNnhY4o6SmoyHlEZQpveeDm+wxi7/dU56eSWgONctqVqLX
	 3hLRgEJca8mnMTFoXp+2WvoHcO2tzxA2j1IiI7R/nPbCZ1TD2RZdKNVmFK//6xbfTr
	 DAUABO0pOPAtSGzZ4WbjVdID4zWzlaHfFYMF+GR0mFiCGFksM0GaT1dMPoLZ/pVq98
	 R4HFx2Ty1i9EQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1u9fJi-000000004MS-2Cgi;
	Tue, 29 Apr 2025 09:23:47 +0200
Date: Tue, 29 Apr 2025 09:23:46 +0200
From: Johan Hovold <johan@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
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
Message-ID: <aBB-gl150GVaZPn5@hovoldconsulting.com>
References: <20250417021349.148911-1-alex.vinarskis@gmail.com>
 <aA8yFI2Bvm-lFJTl@hovoldconsulting.com>
 <CAMcHhXpmii=Rc9YVeKXaB17mYv0piSFs02K=0r8kWe5tQGk7eA@mail.gmail.com>
 <aA94yOjsayZHNDpx@hovoldconsulting.com>
 <aA+N8YHX0DZ6h9Uj@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aA+N8YHX0DZ6h9Uj@linaro.org>

On Mon, Apr 28, 2025 at 05:17:21PM +0300, Abel Vesa wrote:
> On 25-04-28 14:47:04, Johan Hovold wrote:
> > On Mon, Apr 28, 2025 at 11:06:39AM +0200, Aleksandrs Vinarskis wrote:
> > > On Mon, 28 Apr 2025 at 09:45, Johan Hovold <johan@kernel.org> wrote:
> > > > On Thu, Apr 17, 2025 at 04:10:31AM +0200, Aleksandrs Vinarskis wrote:
> > > > > Recently added Initial LTTPR support in msm/dp has configured LTTPR(s)
> > > > > to non-transparent mode to enable video output on X1E-based devices
> > > > > that come with LTTPR on the motherboards. However, video would not work
> > > > > if additional LTTPR(s) are present between sink and source, which is
> > > > > the case for USB Type-C docks (eg. Dell WD19TB/WD22TB4), and at least
> > > > > some universal Thunderbolt/USB Type-C monitors (eg. Dell U2725QE).
> > > >
> > > > Does this mean that the incomplete LTTPR support in 6.15-rc1 broke
> > > > adapters or docks with retimers in transparent mode?

> > > Docks with retimers do not work in 6.15-rcX, but I am unable to verify
> > > if it did work before, as I do not have a Qualcomm based device
> > > without LTTPR on the baseboard.
> > 
> > Abel (or anyone else), do you have one of these docks that you could
> > test with the X13s to confirm whether this series fixes a regression or
> > not?
> 
> Before the support for LTTPRs has been merged, if you would have one of
> those docks (I do not own one) with LTTPRs, link training would've just
> failed if the LTTPRs were not by default in transparent mode, which IIRC
> is what the standard dictates.

Ok, but my concern is if they may have worked in a default transparent
mode.

> X13s doesn't have LTTPRs on-board so when reading the caps, LTTPRs count
> would return 0 and none of the of the transparent/non-transparent setup
> would happen.

But this is the crux; does any off-board LTTPRs in transparent mode add
to the count or not? If they don't, how would you ever learn that there
are any LTTPRs? If they do, it seems we may have a problem here.

Johan

