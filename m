Return-Path: <linux-arm-msm+bounces-37429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 978819C33D4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Nov 2024 17:47:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 402C11F21071
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Nov 2024 16:47:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34A8E4D8D1;
	Sun, 10 Nov 2024 16:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OrR+nUkJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098364778E;
	Sun, 10 Nov 2024 16:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731257237; cv=none; b=SjIzJVN/z0GdXyJvDw7a3vxujfkBouRjFAL8jrAQZjsVI1MU89iHEs0/EA1t96nNBEtx3CCKvXnUnGBvbBcO4YajddLampWdCtASmF3jHbl/yFY2e+5PTXeu5MoIIbB3eIOmWBwofkNzSpTwwKcFCJq034Gh4/solRNNxdpZ+dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731257237; c=relaxed/simple;
	bh=VGC2pIhZ+IDQ2o0aJN8sRl69nsKEozNmQTG3IEvbxKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=unmGPHKi/ej4x5zTQtRI73o6V2vSVHy47QvzLY0+CGXTTx7EFeNrK/knqQpZXWYfXjfBshw90OJvdUysbE1TTxzlwoim009m4By7e7rYyY3fm/5U05itlSfcoUAD7/lZiz6SXbtXLgN8BFL0UQ06s4Dx6NwWMBeEluLUtCrgtyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OrR+nUkJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3878C4CECD;
	Sun, 10 Nov 2024 16:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731257236;
	bh=VGC2pIhZ+IDQ2o0aJN8sRl69nsKEozNmQTG3IEvbxKU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OrR+nUkJ3bVOgtiK8F1MkijjiLACCSt+qLcmc6zPGxUQtm1LEJUun/AWRwTNsF8rW
	 A5uzZkGA3DKEANdXaWyq1dDgh3xgTXY5f5KjOsER55oVzsawGw0GgYQIjFsALsrAxP
	 HNTmUchhgJvz64QjzxxgKqW6xHOzE3EwOvzQthgLDWr1mBNsprio1NrrgkzL6hc8ZZ
	 3934oyHXrgar6FUUbFWCzHLuyR+tosfhLaCIBl5cw8AZMQv7hmZbi3EfifiggpsqbR
	 Zr57jui04VqejufQbkRuCRGC3+53hYViEtgQt7lvL7xtCHC7lgYdOWdIX/P9eTI392
	 bJF+yjnRIkY1w==
Date: Sun, 10 Nov 2024 10:47:13 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: Re: [PATCH v2] arm64: Allow packing uncompressed images into distro
 packages
Message-ID: <el65ezf4w2rj67afgvspn3ehyatvbc7jllkcpfc23mfeo6fsni@4t5vytmetz2p>
References: <20240910-uncompressed-distro-packages-v2-1-51538434787f@quicinc.com>
 <86wmi83sl5.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86wmi83sl5.wl-maz@kernel.org>

On Wed, Oct 16, 2024 at 05:44:54PM +0100, Marc Zyngier wrote:
> Hi Bjorn,
> 
> On Wed, 11 Sep 2024 03:53:16 +0100,
> Bjorn Andersson <andersson@kernel.org> wrote:
> > 
> > From: Bjorn Andersson <quic_bjorande@quicinc.com>
> > 
> > The distro packages (deb-pkg, pacman-pkg, rpm-pkg) are generated using
> > the compressed kernel image, which means that the kernel once installed
> > can not be booted with systemd-boot.
> 
> Are you sure? I just installed a guest with systemd-boot
> (252.30-1~deb12u, as shipped in Debian), and it is perfectly able to
> boot a compressed kernel.
> 

Sorry for the late response, to verify I did "make defconfig bindeb-pkg"
and crafted a disk image using mkosi. It contains:

# apt info systemd-boot
Package: systemd-boot
Version: 257~rc1-4

It fails to load my the compressed image:
../src/boot/efi/boot.c:2557@image_start: Error loading \debian\6.12.0-rc6-next-20241108-00003-ga216563e3174-dirty\vmlinuz: Unsupported

Which is expected per per this discussion:
https://github.com/systemd/systemd/issues/23788

> > 
> > This differs from the packages generated by the distros themselves,
> > which uses the uncompressed image.
> > 
> > Use the newly introduced CONFIG_COMPRESSED_INSTALL option to allow
> > selection of which version of the kernel image should be packaged into
> > the distro packages.
> 
> I'm normally building kernels as Debian packages, without any of
> CONFIG_EFI_ZBOOT or CONFIG_COMPRESSED_INSTALL.
> 

My goal is to make "make defconfig bindeb-pkg" (and the other -pkg
targets) boot out of the box in a "standard system".

> As a result, the installed kernel image of a Debian package shoots up
> from ~8M to an impressive 25M, since we're not picking the compressed
> image anymore. Storage may be cheap, but still.
> 

No argument about this.

> I really don't think CONFIG_COMPRESSED_INSTALL should change the
> existing behaviours, and a new option would be better suited to enable
> this new setup if deemed necessary.
> 

My main concern is that the "make *-pkg" targets create packages with
the compressed image, while at least Arch Linux Arm, Debian, and Fedora
are packaging uncompressed images in their official packages.

Regards,
Bjorn

> Thanks,
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.

