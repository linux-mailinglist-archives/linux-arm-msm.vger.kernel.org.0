Return-Path: <linux-arm-msm+bounces-62230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08880AE6B7F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 17:43:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 151677AEC27
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 15:37:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D55DB2D29AA;
	Tue, 24 Jun 2025 15:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="jSzBubJG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3BE22C08B2;
	Tue, 24 Jun 2025 15:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750779398; cv=none; b=sXjLA7/pq9gZ2XWpP4fu0mTxtKxC5SP2o6FqGIvU79McMKDvpwLc73588HQPkk+B9WImJQXrTReoiy72jZtVukVUpbUJBFpX1x9+gCQo6lGgoNTXHRvHLc31iLNOp23MWLsoN66KfWhs2UdHz0xVlFgt25ZpI4s26JeLAPVJNvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750779398; c=relaxed/simple;
	bh=X315EiRGNWVRHkYcogPZeiI6Z0EUmn0duHIpSD+56v4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b2l1FgD2pihoG1EsLb9EASi5q6C9pd8sQKBn5lyv0U7B6RQO8iKeyXKdC4gLBF+TRjnM3rc8xMar6w/jhJcywYHGu7OZbclbLX5mXLkd2OXBNX9bf7BBYmmj456sJohazpJ/53BUajgkrtel4Co1hV65NvxX+mABKy2ArgTOeH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=jSzBubJG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F0CBC4CEE3;
	Tue, 24 Jun 2025 15:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1750779398;
	bh=X315EiRGNWVRHkYcogPZeiI6Z0EUmn0duHIpSD+56v4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jSzBubJGi1z/OEUNK4L6oD8CgDN9ArmNEOjNV6LQkwCIgrlzFiYBtpRURi4li5zl1
	 9IJIillbLkyPZM43VDWeoc0dnUAG0jkPqbEyR++b7iTrkDsomlZhytIdLN5XfM8vHN
	 yB4lgdYJuz3d7Y1yjYPhNQCu8z19d+dDnrzo1Om8=
Date: Tue, 24 Jun 2025 16:36:35 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
	srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
	quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org,
	quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
	arnd@arndb.de, stable@kernel.org
Subject: Re: [PATCH v2] misc: fastrpc: Fix channel resource access in
 device_open
Message-ID: <2025062424-dizziness-theft-0502@gregkh>
References: <20250619051026.984361-1-ekansh.gupta@oss.qualcomm.com>
 <kk3jvlwjdzy2mfs6bip7dadrnsoxwksyp2odi3rfxkv4crmwtn@x5qyn4sp2gck>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <kk3jvlwjdzy2mfs6bip7dadrnsoxwksyp2odi3rfxkv4crmwtn@x5qyn4sp2gck>

On Tue, Jun 24, 2025 at 04:27:21PM +0300, Dmitry Baryshkov wrote:
> On Thu, Jun 19, 2025 at 10:40:26AM +0530, Ekansh Gupta wrote:
> > During rpmsg_probe, fastrpc device nodes are created first, then
> > channel specific resources are initialized, followed by
> > of_platform_populate, which triggers context bank probing. This
> > sequence can cause issues as applications might open the device
> > node before channel resources are initialized or the session is
> > available, leading to problems. For example, spin_lock is initialized
> > after the device node creation, but it is used in device_open,
> > potentially before initialization. Move device registration after
> > channel resource initialization in fastrpc_rpmsg_probe.
> 
> You've moved device init, however there is still a possibility for the
> context devices to be created, but not bound to the driver (because all
> the probings are async). I think instead we should drop the extra
> platform driver layer and create and set up corresponding devices
> manually. For example, see how it is handled in
> host1x_memory_context_list_init(). That function uses iommu-maps, but we
> can use OF nodes and iommus instead.

Is this a real platform device?  If so, why do you need a second
platform driver, what makes this so unique?  If this isn't a platform
device, then why not just use the faux bus instead?

It seems that "number of sessions" is a DT property, is that something
that is really defined by the hardware?  Or is it just a virtual thing
that people are abusing in the DT?

And if you really have all these sessions, why not make them real
devices, wouldn't that make things simpler?

thanks,

greg k-h

