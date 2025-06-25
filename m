Return-Path: <linux-arm-msm+bounces-62283-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F10FAE77CA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 09:09:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E27B9177F10
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 07:09:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BA9D1F8676;
	Wed, 25 Jun 2025 07:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="cXeaT/9k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DFF61F9F51;
	Wed, 25 Jun 2025 07:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750835391; cv=none; b=lca8PHSnju9dUGjJ0gh7aSx2j1AmAAnTElIkYftjfOUg3RQJOXkOPONtbJ3Q9LCuvonuzDOAxuqzz7oPCRCCR2oFrQgCLD4E9L8/rgsiRC5MMsYk26Pv4JcZcJakxeHIRBfQKKc0Jpd4eB+dD9CTad+jum71F0oUijgzYM9FRWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750835391; c=relaxed/simple;
	bh=DR1uJyqv9XG/PvqeJ57yVZ2OEhRA5/ykIyTajKQJ4+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YLh2Sc7mAv4jYkkYob6bQ+ohB7xLP3ML7xfRcXF8pqrdly19Pf+jH3LjFXxFAw48beLZLA4NCPRe8p0LC4OS0m/X2/25ak1c3exJ1PuYYABn23j9x66gLhOw6sKiBSRlcVAtJBIMUeo1GOy/R9ZeGUeizygUPmFIUUgrDAs8Hq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=cXeaT/9k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADB2DC4CEEA;
	Wed, 25 Jun 2025 07:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1750835391;
	bh=DR1uJyqv9XG/PvqeJ57yVZ2OEhRA5/ykIyTajKQJ4+g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cXeaT/9kn0q0gdf+AA26jglNvcClZyL8mKFOQRudIj+S4Htm6j5dN+H5IAMbpQq9W
	 GQ9NaOZdVJoKLbrz6XlvyH+3sosjRnWOqCNlDhuWaWq/pzmDKYGpdvyNfZrGlLemD4
	 FzEIaoVIaTwhPsX7l6M7S3KPUjcD6wP7Mdq0xs+g=
Date: Wed, 25 Jun 2025 08:09:48 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
	srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
	quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org,
	quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
	arnd@arndb.de, stable@kernel.org
Subject: Re: [PATCH v2] misc: fastrpc: Fix channel resource access in
 device_open
Message-ID: <2025062535-subsidize-popsicle-38d0@gregkh>
References: <20250619051026.984361-1-ekansh.gupta@oss.qualcomm.com>
 <kk3jvlwjdzy2mfs6bip7dadrnsoxwksyp2odi3rfxkv4crmwtn@x5qyn4sp2gck>
 <2025062424-dizziness-theft-0502@gregkh>
 <2025062434-reviving-grumble-1e53@gregkh>
 <golcrcr6voafr3fqsnihyjyut36sii55vzws4josfhkjjg3nie@ur43qq2kvlsv>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <golcrcr6voafr3fqsnihyjyut36sii55vzws4josfhkjjg3nie@ur43qq2kvlsv>

On Wed, Jun 25, 2025 at 02:45:27AM +0300, Dmitry Baryshkov wrote:
> On Tue, Jun 24, 2025 at 04:38:25PM +0100, Greg KH wrote:
> > On Tue, Jun 24, 2025 at 04:36:35PM +0100, Greg KH wrote:
> > > On Tue, Jun 24, 2025 at 04:27:21PM +0300, Dmitry Baryshkov wrote:
> > > > On Thu, Jun 19, 2025 at 10:40:26AM +0530, Ekansh Gupta wrote:
> > > > > During rpmsg_probe, fastrpc device nodes are created first, then
> > > > > channel specific resources are initialized, followed by
> > > > > of_platform_populate, which triggers context bank probing. This
> > > > > sequence can cause issues as applications might open the device
> > > > > node before channel resources are initialized or the session is
> > > > > available, leading to problems. For example, spin_lock is initialized
> > > > > after the device node creation, but it is used in device_open,
> > > > > potentially before initialization. Move device registration after
> > > > > channel resource initialization in fastrpc_rpmsg_probe.
> > > > 
> > > > You've moved device init, however there is still a possibility for the
> > > > context devices to be created, but not bound to the driver (because all
> > > > the probings are async). I think instead we should drop the extra
> > > > platform driver layer and create and set up corresponding devices
> > > > manually. For example, see how it is handled in
> > > > host1x_memory_context_list_init(). That function uses iommu-maps, but we
> > > > can use OF nodes and iommus instead.
> > > 
> > > Is this a real platform device?  If so, why do you need a second
> > > platform driver, what makes this so unique?  If this isn't a platform
> > > device, then why not just use the faux bus instead?
> > > 
> > > It seems that "number of sessions" is a DT property, is that something
> > > that is really defined by the hardware?  Or is it just a virtual thing
> > > that people are abusing in the DT?
> 
> Purely software value.
> 
> > > 
> > > And if you really have all these sessions, why not make them real
> > > devices, wouldn't that make things simpler?
> > 
> > Oh wait, these are "fake" platform devices under the parent (i.e. real)
> > platform device.  That's not good, please don't do that, use the faux
> > bus code now instead to properly handle this.  Attempting to create a
> > device when open() is called is really really odd...
> 
> The driver doesn't created devices during open(). It creates them
> earlier, then another driver probes an populates the data. I suggest to
> follow Tegra approach, remove the sub-driver completely and instead of
> calling of_platform_populate() create necessary devices manually and set
> corresponding IOMMU configuration from the main driver's probe path.

That sounds much more reasonable.

thanks,

greg k-h

