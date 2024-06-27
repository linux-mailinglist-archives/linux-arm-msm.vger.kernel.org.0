Return-Path: <linux-arm-msm+bounces-24427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7413691A4E7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 13:18:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2BCA91F22CE7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 11:18:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45F3A1487DF;
	Thu, 27 Jun 2024 11:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Gj9HVeOl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAC0145B34;
	Thu, 27 Jun 2024 11:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719487096; cv=none; b=dqFVF+TNtl1cVeUVG2k2gj87mKUqpJ6brCu0ZA6eJkSWI3DJyq9w6N/hIuICZyfjtJ6USg75lbGstwGh0Cd4tLqART29d0GwjjTZfjbnzqmXHjWPhubjofcFmx1Io6btouaaIJ3iqVVvhW0GAlDRz4gLC/NTd4jv0JzHyuRGINw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719487096; c=relaxed/simple;
	bh=E0YEhlQqyrz9Rv1pwfdZuFu0LrVCBtcH1CdILfJjFqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IPBxeaDKZfeLt9C1pDYhjFmHq3dYNicaxE++V8CZSf+CKIbIrDSS6SiYcCyBqgSRSZ7r9/4bOVq9YuVq4uzyEtZkLjH8t2R2GW0MNS8INOumsJK8PTb+MjsLH4tXVi3jFk22ORls6GdrvLoC+/wFj9Dk4w3cRzCwOEp/bTY9ABA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Gj9HVeOl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A840C32786;
	Thu, 27 Jun 2024 11:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1719487095;
	bh=E0YEhlQqyrz9Rv1pwfdZuFu0LrVCBtcH1CdILfJjFqs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gj9HVeOlcxMX32l8FkenVufef6x+zWBoAkzbWeZZjOmgBF7O2I+8EfuAygGJaPAfS
	 SfLWvyMLVlBchCFIseZAEBqQ1KYe6V1vErIQKO4uKLYX96w7R6fjextaR2ZK6YTMy4
	 suNUOD95jG5d9hJo/o/WSpFiDE0EIm3H/772bpRQ=
Date: Thu, 27 Jun 2024 13:18:11 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
	quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org,
	quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
	arnd@arndb.de, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3] misc: fastrpc: Move fastrpc driver to misc/fastrpc/
Message-ID: <2024062715-ultra-muppet-c899@gregkh>
References: <20240627104245.1651214-1-quic_ekangupt@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627104245.1651214-1-quic_ekangupt@quicinc.com>

On Thu, Jun 27, 2024 at 04:12:44PM +0530, Ekansh Gupta wrote:
> Move fastrpc.c from misc/ to misc/fastrpc/. New C files are planned
> to be added for PD notifications and other missing features. Adding
> and maintaining new files from within fastrpc directory would be easy.
> 
> Example of feature that is being planned to be introduced in a new C
> file:
> https://lore.kernel.org/all/20240606165939.12950-6-quic_ekangupt@quicinc.com/
> 
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Changes in v2:
>   - Updated Kconfig.
> Changes in v3:
>   - Added newline in kconfig.
> 
>  MAINTAINERS                          |  2 +-
>  drivers/misc/Kconfig                 | 13 +------------
>  drivers/misc/Makefile                |  2 +-
>  drivers/misc/fastrpc/Kconfig         | 16 ++++++++++++++++
>  drivers/misc/fastrpc/Makefile        |  2 ++
>  drivers/misc/{ => fastrpc}/fastrpc.c |  0
>  6 files changed, 21 insertions(+), 14 deletions(-)
>  create mode 100644 drivers/misc/fastrpc/Kconfig
>  create mode 100644 drivers/misc/fastrpc/Makefile
>  rename drivers/misc/{ => fastrpc}/fastrpc.c (100%)

For now, no, sorry, not a new directory for just one .c file.

If you want to add more stuff, wonderful, then do this as the first
commit of the series when that actually happens.

sorry, but I'm not going to take this now.

greg k-h

