Return-Path: <linux-arm-msm+bounces-62231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E94E2AE6B9C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 17:47:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E97F01C258E6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 15:40:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A100A3074A8;
	Tue, 24 Jun 2025 15:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ddnVBLNI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A1E307488;
	Tue, 24 Jun 2025 15:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750779508; cv=none; b=Din8BqXJT1BUHkBgUXsl7s87NDVLe5633LWNZAdbr1BOpaxISJ1pIQE15kzHxxDGx6N8NKrq4HUTRRn+7FJf27U1D4bkLUJeQnu/zj1FuWmKSTej4dUV+Y3ILvMD/tzlyk6JJ0BAPuR21lFRjEpUHEmEAmvoKjMPiOunUSGL/K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750779508; c=relaxed/simple;
	bh=rXklJ00Z6I5GxsNS607Yboj1efqM7M6krOTzOTuFDY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TyUaTl1Oyp4+ZmJwa7TrJEptpgCCqTNp3IdYR28oweERnbuPRYHl42yss8KpXSiKsOdtf/PqXkY4nLK+1KXKxkbb4+fLyziZSK00xxa/tTXVd8dpG4+4ZciWdVXD2lqd42Cex9aOv4rykQU85yPScinucTmLnykvjmF6r1lAFJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ddnVBLNI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D5A4C4CEE3;
	Tue, 24 Jun 2025 15:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1750779507;
	bh=rXklJ00Z6I5GxsNS607Yboj1efqM7M6krOTzOTuFDY4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ddnVBLNIhrnqyoeXv6nLy07w7vBFDKVZ5kNby1Cz3vXgCCgxksm6aeln4z0MXgpDs
	 DPe6ugwZNo3mpCzUjhqupzKPhNVfxJZ+RSqmETeeeBBZbLIxsmQPlB69TaC/j/TXuA
	 p8GIlNlSmftKwzGV5tFPsJKiyELa0lalNcsKnm3A=
Date: Tue, 24 Jun 2025 16:38:25 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
	srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
	quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org,
	quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
	arnd@arndb.de, stable@kernel.org
Subject: Re: [PATCH v2] misc: fastrpc: Fix channel resource access in
 device_open
Message-ID: <2025062434-reviving-grumble-1e53@gregkh>
References: <20250619051026.984361-1-ekansh.gupta@oss.qualcomm.com>
 <kk3jvlwjdzy2mfs6bip7dadrnsoxwksyp2odi3rfxkv4crmwtn@x5qyn4sp2gck>
 <2025062424-dizziness-theft-0502@gregkh>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025062424-dizziness-theft-0502@gregkh>

On Tue, Jun 24, 2025 at 04:36:35PM +0100, Greg KH wrote:
> On Tue, Jun 24, 2025 at 04:27:21PM +0300, Dmitry Baryshkov wrote:
> > On Thu, Jun 19, 2025 at 10:40:26AM +0530, Ekansh Gupta wrote:
> > > During rpmsg_probe, fastrpc device nodes are created first, then
> > > channel specific resources are initialized, followed by
> > > of_platform_populate, which triggers context bank probing. This
> > > sequence can cause issues as applications might open the device
> > > node before channel resources are initialized or the session is
> > > available, leading to problems. For example, spin_lock is initialized
> > > after the device node creation, but it is used in device_open,
> > > potentially before initialization. Move device registration after
> > > channel resource initialization in fastrpc_rpmsg_probe.
> > 
> > You've moved device init, however there is still a possibility for the
> > context devices to be created, but not bound to the driver (because all
> > the probings are async). I think instead we should drop the extra
> > platform driver layer and create and set up corresponding devices
> > manually. For example, see how it is handled in
> > host1x_memory_context_list_init(). That function uses iommu-maps, but we
> > can use OF nodes and iommus instead.
> 
> Is this a real platform device?  If so, why do you need a second
> platform driver, what makes this so unique?  If this isn't a platform
> device, then why not just use the faux bus instead?
> 
> It seems that "number of sessions" is a DT property, is that something
> that is really defined by the hardware?  Or is it just a virtual thing
> that people are abusing in the DT?
> 
> And if you really have all these sessions, why not make them real
> devices, wouldn't that make things simpler?

Oh wait, these are "fake" platform devices under the parent (i.e. real)
platform device.  That's not good, please don't do that, use the faux
bus code now instead to properly handle this.  Attempting to create a
device when open() is called is really really odd...

thanks,

greg k-h

