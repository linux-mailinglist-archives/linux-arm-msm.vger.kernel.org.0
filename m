Return-Path: <linux-arm-msm+bounces-74221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C20B8A5AE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 17:40:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E4681882710
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 15:40:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F79C31CA58;
	Fri, 19 Sep 2025 15:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="uN217LYl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E755231A80F;
	Fri, 19 Sep 2025 15:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758296362; cv=none; b=iALHBP50eLJf4J1W5LqDlcDEsngZDBSPr5Vpi0bF43QWbFO1BzQ2N2e6Vf0LY8gKg7dwaTe65J73eAahyXTSxzQ+5FHfiNpUv7Gdad+j4Mhl5WQLK+l/6IMcxWAJ5rVj1T5ETE0ulQpDU7NyHBzuvfESAzjkYVfuFNLmAwsc4Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758296362; c=relaxed/simple;
	bh=fGwMYeKkbdVCemNuR6v0rtYwdgVlunDWz15c8oYoB2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XPbjORgYu0SEXy+7QrMRDCaLbpfrzq++3tw7ZQVlOtVthTyDon4h2ajg+mYGBTmRZO9QAoiLjrmYSGexi8EmF9vlzX8qUh+Y+coo+bLfp+NuR0y9F0ZeGmYbusIx1y9VDKYgQbNBi5hPrVpdywz7d3kaTqD4qld9fCnb0WZRfbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=uN217LYl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FFA1C4CEF1;
	Fri, 19 Sep 2025 15:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1758296361;
	bh=fGwMYeKkbdVCemNuR6v0rtYwdgVlunDWz15c8oYoB2E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uN217LYl+fgOURebjwk69C5osGk6PPyVGns+Yx1ZvJhwapYF2WXYcypq4Wyf4TDAI
	 QOQxFPb8e9HycesVvLg1eFrO0ho9l+gX/02mg1+xmrkHy46Lu55suxyKcz0qsaco4o
	 jr1pxc++FNGvFqF13+i059HDNGme0mviO6LOwmsU=
Date: Fri, 19 Sep 2025 17:39:18 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Adrian =?utf-8?Q?Barna=C5=9B?= <abarnas@google.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Akhil Vinod <akhil.vinod@oss.qualcomm.com>,
	Sumit Kumar <sumit.kumar@oss.qualcomm.com>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: Re: [PATCH] drivers: mhi: make mhi_ep_bus_type const
Message-ID: <2025091913-hurricane-scored-2bea@gregkh>
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
> ---
>  drivers/bus/mhi/ep/internal.h | 2 +-
>  drivers/bus/mhi/ep/main.c     | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

