Return-Path: <linux-arm-msm+bounces-56052-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F1220AA0529
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 10:03:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 011113A8900
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 08:03:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 280D9270578;
	Tue, 29 Apr 2025 08:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dz1MO+Di"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38B2227EAE;
	Tue, 29 Apr 2025 08:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745913826; cv=none; b=HqWiXiRKbxaPln8VDHWIG8AFzdd1HGeSg7VDTdzqUtRJfYlTCFOjz237+C+ogSE04Of2yaND8FsApChXPzu3gf1z0efYC/hU4iYO/RTjAeIIgj6ZLGUUrA2+pLe7YpGQWL+lDTlnXrYZtb6IOusQy2nOuf/dTxlVAa+1fr05Mzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745913826; c=relaxed/simple;
	bh=pmshIlvLRAdRvDeLsdcl2kLYHfWtssSEGw+i8OfR21Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hl2CZLE5GthVWZkOvGeunKGjJtYQ0pGG2r3QFF6fdhE9CFXRD5+whVcH1rJgevs2FNY8bOhg1mKyn4QeovBzcBBh2/uieEJvsxvVnyx9q0OEibCetg9WKO8HdecWnZhke/UN+DGI8WeZgUGRT2aAjaodMnH3BpH1tQEKJDyH/tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dz1MO+Di; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 742C8C4CEE3;
	Tue, 29 Apr 2025 08:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745913825;
	bh=pmshIlvLRAdRvDeLsdcl2kLYHfWtssSEGw+i8OfR21Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dz1MO+DiWtr9y2ztoIPuBon5YwwEoH0xVH+OZfkXRcZzqWoMYZ4YYU0O23F+k95Te
	 5y1UAv2PfUvdN1iouu6DcSUFlYD/1B5BuePdepcpHgZeGb9KwohRY7DRaardZOG4uA
	 wPrQ0sTcoHvcF/vgHanR7SwrVhFVlRvfWrNvsG962NnmEAMNWv/crVv3vW8hB7URwM
	 pVp3AAqDP/JVHWTO/p/oWxgUkhPP0WhJvQZdn+sjT1cBFpYbzQEyhyjZBEPHOcrUm4
	 jOjXOsYL75bu3DdLds793KongrHCe5RKYddb7LcQeQpPJACyaEmqShDKg7mwwVJ4CD
	 A1PnVEBOxpIAQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1u9fwQ-000000007Pq-3tEE;
	Tue, 29 Apr 2025 10:03:47 +0200
Date: Tue, 29 Apr 2025 10:03:46 +0200
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
Message-ID: <aBCH4oo7dbG8ajvP@hovoldconsulting.com>
References: <20250417021349.148911-1-alex.vinarskis@gmail.com>
 <aA8yFI2Bvm-lFJTl@hovoldconsulting.com>
 <CAMcHhXpmii=Rc9YVeKXaB17mYv0piSFs02K=0r8kWe5tQGk7eA@mail.gmail.com>
 <aA94yOjsayZHNDpx@hovoldconsulting.com>
 <aA+N8YHX0DZ6h9Uj@linaro.org>
 <aBB-gl150GVaZPn5@hovoldconsulting.com>
 <aBCE3wSG2g5pp7jg@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBCE3wSG2g5pp7jg@linaro.org>

On Tue, Apr 29, 2025 at 10:50:55AM +0300, Abel Vesa wrote:
> On 25-04-29 09:23:46, Johan Hovold wrote:
> > On Mon, Apr 28, 2025 at 05:17:21PM +0300, Abel Vesa wrote:
> > > On 25-04-28 14:47:04, Johan Hovold wrote:
> > > > On Mon, Apr 28, 2025 at 11:06:39AM +0200, Aleksandrs Vinarskis wrote:
> > > > > On Mon, 28 Apr 2025 at 09:45, Johan Hovold <johan@kernel.org> wrote:

> > > > > > Does this mean that the incomplete LTTPR support in 6.15-rc1 broke
> > > > > > adapters or docks with retimers in transparent mode?

> > Ok, but my concern is if they may have worked in a default transparent
> > mode.
> 
> But if they are by default in transparent mode, doing the setup to
> transparent mode will not break it in any way.

It looks like it will, see below.

> > > X13s doesn't have LTTPRs on-board so when reading the caps, LTTPRs count
> > > would return 0 and none of the of the transparent/non-transparent setup
> > > would happen.
> > 
> > But this is the crux; does any off-board LTTPRs in transparent mode add
> > to the count or not? If they don't, how would you ever learn that there
> > are any LTTPRs? If they do, it seems we may have a problem here.
> 
> Count gets increased either way. It doesn't matter if they are in
> transparent mode or not.

Thanks for confirming. So then it seems we do have a problem as since
6.15-rc1 drm_dp_lttpr_init() will switch all LTTPRs to non-transparent
mode.

Johan

