Return-Path: <linux-arm-msm+bounces-23520-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B358911B7A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 08:21:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 01F091F242E0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 06:21:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCBCA14A615;
	Fri, 21 Jun 2024 06:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fcYAvO1L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D9412D742;
	Fri, 21 Jun 2024 06:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718950789; cv=none; b=K4dYZgE6qQB53/DOZyOKktYopddVFUpygko2QfbgWbMWNRb4X+E207lH679dNW44VWLy22GM4u6O8QsIS6UAb05HgKLd7YJbmtiz31RsZSPeEn65TQLSUPF73tnX3NX3lGyhopdkyAcXbsHWFWk03rdviDZsOuUBn3/Qzpo17WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718950789; c=relaxed/simple;
	bh=er+wYh9AQ6uJk85XjeYB5lcqPTMyxJ8Uawx5iswT9Ho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p4UmSj5tYsvUkMorKmhPfOer060UNgnnJTRMAqBjLlNbv4OLCjN5Io1FrfllC0KPK2mh55AwxKnXxTwdvq+YNVK1C7384ss4iYRFld9psCzpcm2lb18IwKzEh5m63LPpOYR/pPW1J5zK8hfWH2KVYKTLsoeKrD44VsXAVQ3Vhu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fcYAvO1L; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D732C2BBFC;
	Fri, 21 Jun 2024 06:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718950789;
	bh=er+wYh9AQ6uJk85XjeYB5lcqPTMyxJ8Uawx5iswT9Ho=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fcYAvO1LsTvIcT0CLhh8l+htxR7UMoL1BsRb+zcm/D6vSpiCunj2mcHqm6Xm3qGqz
	 LAFR6e1nTNMct62czOEgsxapSV96QojElKOu87PNe0/H8QVVnlIGcbKbqoYTcFl8g7
	 YDwAohZZoVcC9D+hXvG0O3GPY4Lm+TgN1nWuLVb0dlLN8FZXk0ra7DIbZ5rcZdP1ru
	 s2WeQ6FWOvVJZxV3BlAb4oACtOqaNVGVBbSUktMnkTNJdbf1mGAsCot82Ny8BhU4l7
	 O4KAJky0OW0uHyO4aco8oo1I3G7zB5ygpBajaCwFlhZ+rksgnqADZrGya+LBEoehy9
	 3PX7HDNNOiNiQ==
Date: Fri, 21 Jun 2024 01:19:46 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Ekansh Gupta <quic_ekangupt@quicinc.com>, 
	Oded Gabbay <ogabbay@kernel.org>, srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
	gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org, 
	quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v1] misc: fastrpc: Move fastrpc driver to misc/fastrpc/
Message-ID: <z6g5ool5vomkudiroyaxh532rhlfu5x4i3l5xoqrsho2sxv4im@v5ghemjkpc3v>
References: <20240612064731.25651-1-quic_ekangupt@quicinc.com>
 <zbpia232dh4ojfsvhcqxrp6cwfygaalu5cycdrs47pqmnrisvk@dq24nww26gkm>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <zbpia232dh4ojfsvhcqxrp6cwfygaalu5cycdrs47pqmnrisvk@dq24nww26gkm>

On Wed, Jun 12, 2024 at 09:28:39PM GMT, Dmitry Baryshkov wrote:
> On Wed, Jun 12, 2024 at 12:17:28PM +0530, Ekansh Gupta wrote:
> > Move fastrpc.c from misc/ to misc/fastrpc/. New C files are planned
> > to be added for PD notifications and other missing features. Adding
> > and maintaining new files from within fastrpc directory would be easy.
> > 
> > Example of feature that is being planned to be introduced in a new C
> > file:
> > https://lore.kernel.org/all/20240606165939.12950-6-quic_ekangupt@quicinc.com/
> > 
> > Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> > ---
> >  MAINTAINERS                          |  2 +-
> >  drivers/misc/Kconfig                 | 13 +------------
> >  drivers/misc/Makefile                |  2 +-
> >  drivers/misc/fastrpc/Kconfig         | 16 ++++++++++++++++
> >  drivers/misc/fastrpc/Makefile        |  2 ++
> >  drivers/misc/{ => fastrpc}/fastrpc.c |  0
> >  6 files changed, 21 insertions(+), 14 deletions(-)
> >  create mode 100644 drivers/misc/fastrpc/Kconfig
> >  create mode 100644 drivers/misc/fastrpc/Makefile
> >  rename drivers/misc/{ => fastrpc}/fastrpc.c (100%)
> 
> Please consider whether it makes sense to move to drivers/accel instead
> (and possibly writing a better Kconfig entry, specifying that the driver
> is to be used to offload execution to the DSP).
> 

Wouldn't this come with the expectation of following the ABIs of
drivers/accel and thereby breaking userspace?

Regards,
Bjorn

