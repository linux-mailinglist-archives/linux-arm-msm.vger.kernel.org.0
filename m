Return-Path: <linux-arm-msm+bounces-60900-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8403AD4935
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 05:07:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8DE1017D22F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 03:07:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CC5A18DB3D;
	Wed, 11 Jun 2025 03:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UFGe5HZt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0DA3C1F;
	Wed, 11 Jun 2025 03:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749611259; cv=none; b=WOsvl76fKHITGsIiqs9cuuzIoFJwbYYx9guRyAqpu6+Gc38J2Vm+KdvAwZKnGMuYQiuQq9RbviV3mRZ1ttqPqaNVz5xrvImjGFSIHMhVnTkcd3y1g1VtljjLdNdHrap9TWZdI+vz4Vivdao0yS+dDZQ0EEFzebhNj/vFQPUlUZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749611259; c=relaxed/simple;
	bh=E7xUWJdloB33WGP7xJW69ab7nUE7dxZpE2Truv488Wk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HOh7oVENgfxmVTFX7B5XSn2qRwL40uz/EtiYeK9cAqWzJoqGqbHrclUS1VI1ewqjtl+9RQQYOzaXEObkNz68A0MJzM6m0dMvOlAJXNOmy2sUOkawCokOxUibZE/e3D16+iyrCpWbgmxAW8ymyrO+/+VRQ3XtAjtj31Rp5zmruXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UFGe5HZt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75056C4CEED;
	Wed, 11 Jun 2025 03:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749611254;
	bh=E7xUWJdloB33WGP7xJW69ab7nUE7dxZpE2Truv488Wk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UFGe5HZtpguRl7KnGkQKWWmdbNR0OPYVANJOhcFYgHmciOAtYa+/T6xohWUIQ5vux
	 azoWbjaTo+7PfyxIq46/d7uAJv7lVJwOtrT+b0Gt+2dci+bx+y5LeK8uFC+xNrBFe4
	 x979qPkNcSt23pGifxttXx8J7qL/WYBeAqBqZTDAAftbn0jkKDOmURUostnbV+GN5s
	 llujLI4slPim8UKEMSZ6aZUGcvxBSsTNbJ1w849mjOWrR5YHI9OmnVh+3zscP+gCS2
	 OA2uv5IJ+f1huxAJ+kE6G9O01Ydq+R2YrSW58QQg6uygJSo1iB9jrYd3mJt3oo0ZN7
	 Th0zFAjX51GWw==
Date: Tue, 10 Jun 2025 22:07:32 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH] rpmsg: Use strscpy() instead of strscpy_pad()
Message-ID: <nvzbo6dq3pf7dupelmksd3y4kxynre3qgblqlxbfcx4aza4p4t@o7gf63u4jjd4>
References: <20250429104543.66927-2-thorsten.blum@linux.dev>
 <CANLsYkxBxt-fE-kV3yS7WDQuF4o7OSL045fMmXrTvfx3P=A+1A@mail.gmail.com>
 <1F19F750-E9CF-4AC8-B14E-78C957869F75@linux.dev>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1F19F750-E9CF-4AC8-B14E-78C957869F75@linux.dev>

On Tue, Jun 10, 2025 at 12:38:14PM +0200, Thorsten Blum wrote:
> Hi Mathieu,
> 
> On 30. Apr 2025, at 16:59, Mathieu Poirier wrote:
> > On Tue, 29 Apr 2025 at 04:46, Thorsten Blum wrote:
> >> 
> >> kzalloc() already zero-initializes the destination buffer, making
> >> strscpy() sufficient for safely copying the name. The additional NUL-
> >> padding performed by strscpy_pad() is unnecessary.
> >> 
> >> The size parameter is optional, and strscpy() automatically determines
> >> the size of the destination buffer using sizeof() when the argument is
> >> omitted. RPMSG_NAME_SIZE is equal to sizeof(rpdev->id.name) and can be
> >> removed - remove it.
> >> 
> >> No functional changes intended.
> >> 
> >> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> >> ---
> >> drivers/rpmsg/qcom_glink_native.c | 2 +-
> >> drivers/rpmsg/qcom_smd.c          | 2 +-
> >> 2 files changed, 2 insertions(+), 2 deletions(-)
> > 
> > 
> > I will let Bjorn take care of this one.
> 
> This one didn't make it into the last merge window, did it?
> 
> Could you or Bjorn take care of it or should I resend it?
> 

I looked at it, but needed to convince myself that there were no side
effects, and then missed pulling it. It's still in the queue, so I'm
taking another look, no need to resend it.

Thanks,
Bjorn

> Thanks,
> Thorsten
> 

