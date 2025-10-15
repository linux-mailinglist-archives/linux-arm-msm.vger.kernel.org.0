Return-Path: <linux-arm-msm+bounces-77377-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B71BDE409
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 13:24:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 176AF19A74F8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 11:25:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E817F31A811;
	Wed, 15 Oct 2025 11:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kTkXRfys"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6A5319875;
	Wed, 15 Oct 2025 11:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760527479; cv=none; b=ZgFQlDDp3vGYdnV1pamXFA0AosDowFezVTySiCWR+ITvR0pBmMHTW1rh18i9PmTfV0a694STa4h9koqp7QD6Z4VU91OB/npJQ8GAnAW2Wv7jyp3/A8nj0DHpibdkQK3RS6IZlCVdYlsTkrKczvAdbbfwbdPhJr6RAakToi+lPcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760527479; c=relaxed/simple;
	bh=HhAMs4NQpq+tdQjGxrti3jqQxp0xeLf1bYQA+I3R1WA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R2q36yXpNdg17MHYcacrgLWBRCH5wC+/30X2lpKjk5RfVTs05lI4DEFvg+hSiLOpLmdBeHo1D5zI1cGUxZHWKKiT84ggFla6BK+xIvlKMuuyvdzMAyZVIDXDQek1W41aCu8wV7JcCrpOtitFhsMUxivR//GfeNWO/XvPAWLAeqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kTkXRfys; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DE95C4CEF8;
	Wed, 15 Oct 2025 11:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760527479;
	bh=HhAMs4NQpq+tdQjGxrti3jqQxp0xeLf1bYQA+I3R1WA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kTkXRfysjm/blDQ4VdVw10+TUCLu0LSuTBjDYdO0dX3JoTdl32VQoiLbN7VUlR3t+
	 1sHK9HOgUMAGm1SU9b2xmZS1zsjNPhswGory8VsbqH2Urh6Warackhhor/UMsz/Gcj
	 Tm7XG6kLhglUYIlzY6G4DSgNM/XM1Xd0eYhmlUrGQ007hhynUjVy9hPwvLJjUtA9Nn
	 xXh7SQITWALv+NFSkVnJuertl04Y+MWk9FSebH87DmB4MEC3HBV1H1sSMCMqB2u1Ls
	 L6SOtx6U8CoEZX/SYao3QTDw1khaLRVapBmbJEYaEGMUKZMcmNikj5ybpW7hz4gDR0
	 Cofemwo/Tzb5A==
Date: Wed, 15 Oct 2025 16:54:30 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Adrian =?utf-8?Q?Barna=C5=9B?= <abarnas@google.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Akhil Vinod <akhil.vinod@oss.qualcomm.com>, 
	Sumit Kumar <sumit.kumar@oss.qualcomm.com>, Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] drivers: mhi: make mhi_ep_bus_type const
Message-ID: <zqhspeq37j6j2ss6qreoq4kj23mzo2zd5ttkpykayuvo6jigip@dthsh4ngicqv>
References: <20250919074408.868220-1-abarnas@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250919074408.868220-1-abarnas@google.com>

On Fri, Sep 19, 2025 at 07:44:08AM +0000, Adrian Barnaś wrote:
> Because driver core can properly handle constant struct bus_type,
> move the mhi_ep_bus_type to be a constant structure as well, placing it
> into read-only memory which can not be modified at runtime.
> 
> Signed-off-by: Adrian Barnaś <abarnas@google.com>

Applied to mhi-next!

- Mani

> ---
>  drivers/bus/mhi/ep/internal.h | 2 +-
>  drivers/bus/mhi/ep/main.c     | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/bus/mhi/ep/internal.h b/drivers/bus/mhi/ep/internal.h
> index 577965f95fda..512da7482acc 100644
> --- a/drivers/bus/mhi/ep/internal.h
> +++ b/drivers/bus/mhi/ep/internal.h
> @@ -11,7 +11,7 @@
>  
>  #include "../common.h"
>  
> -extern struct bus_type mhi_ep_bus_type;
> +extern const struct bus_type mhi_ep_bus_type;
>  
>  #define MHI_REG_OFFSET				0x100
>  #define BHI_REG_OFFSET				0x200
> diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
> index cdea24e92919..86e003bc44e0 100644
> --- a/drivers/bus/mhi/ep/main.c
> +++ b/drivers/bus/mhi/ep/main.c
> @@ -1703,7 +1703,7 @@ static int mhi_ep_match(struct device *dev, const struct device_driver *drv)
>  	return 0;
>  };
>  
> -struct bus_type mhi_ep_bus_type = {
> +const struct bus_type mhi_ep_bus_type = {
>  	.name = "mhi_ep",
>  	.dev_name = "mhi_ep",
>  	.match = mhi_ep_match,
> -- 
> 2.51.0.534.gc79095c0ca-goog
> 

-- 
மணிவண்ணன் சதாசிவம்

