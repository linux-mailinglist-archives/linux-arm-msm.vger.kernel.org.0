Return-Path: <linux-arm-msm+bounces-83804-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 93750C92D9C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 18:57:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0DA3534AE92
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 17:57:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8B9231D37A;
	Fri, 28 Nov 2025 17:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Abbu+hwp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9582D781E;
	Fri, 28 Nov 2025 17:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764352668; cv=none; b=UqMaVSWzrGXPxbMLISdQ9Abb4GduQEFh5vtyzjZ2Lc8bq0Rr4Ph1jhLNymppU6j7C9DTj/52x7zdCrZjxq0VB3X5D1Bm0BaiF2FJp2BMoZ7J3BhrYi+lLVDmaVilpp/KhdyUf6kKfQ31Sxm1kL0CkqZl31djuuPIz5NzrETju6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764352668; c=relaxed/simple;
	bh=XgADMIX2UZQW5Yj7p3y5354MGXFw/VsdioJHjy2440E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=in6LqKl9DM3U0/UzmYYRn2qJoUCyEVkdnYurMqnHmA2CxkxoN0xSosX4G3O+gq668xlc3pxor0izKFvmaj4K9FmUclTyl2L1rPe0EsFxU9zhWIMVt5v7sTDPQ0aIMx1kuvBVX1hAiQXKxnBsWoyNED2Z4azR4EreR+FI12YiADc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Abbu+hwp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C087C4CEFB;
	Fri, 28 Nov 2025 17:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764352668;
	bh=XgADMIX2UZQW5Yj7p3y5354MGXFw/VsdioJHjy2440E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Abbu+hwpnTRZ3VzwZM6UJDJiIHKjZq+dbi6JG586tKeh/AI61rNTcZniHxZIwNSGj
	 ftAQEjJmnTA9xn6Wi6OrTX1kc5ApwKJ2KYqr7wTSUfUl63fr+Y8wHkdRNjds6LF6mk
	 4s6r35XLB9RyGl8HLsloVuKOWxrGQdc9XwzQFbIC1lfh2veFRTXUqy1Mz0A2fkvx55
	 UAf0pj/4q0zWBHoKXmEDvhpPCwpbXLUxS0+MEfmMZAdmPlpFSLcEhC/1qB3Sylchaz
	 8tB66lg6iN+D8I0dMDwhLEE0oyWdCJZxar3aHNpnw9vuoWk81WQIP0Cr5tYsr8mG4I
	 9CPgqDzSUnliA==
Date: Fri, 28 Nov 2025 09:55:59 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Cc: adrian.hunter@intel.com, ulf.hansson@linaro.org, abel.vesa@linaro.org,
	linux-mmc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mmc: host: sdhci-msm: Add support for wrapped keys
Message-ID: <20251128175559.GA2000@sol>
References: <20251127073048.2759159-1-neeraj.soni@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251127073048.2759159-1-neeraj.soni@oss.qualcomm.com>

On Thu, Nov 27, 2025 at 01:00:48PM +0530, Neeraj Soni wrote:
> Add the wrapped key support for sdhci-msm by implementing the needed
> methods in struct blk_crypto_ll_ops and setting the appropriate flag in
> blk_crypto_profile::key_types_supported.
> 
> ---
> This is a reworked version of the patchset
> https://lore.kernel.org/all/20241101031539.13285-1-quic_spuppala@quicinc.com/
> that was sent by Seshu Madhavi Puppala.
> 
> My changes rebase it to use the custom crypto profile support.
> 
> Signed-off-by: Neeraj Soni <neeraj.soni@oss.qualcomm.com>

Your Signed-off-by should go above the scissors line (---).

> Changes in v2:
> - Updated commit message for clarity.
> 
> Changes in v1:
> - Added initial support for wrapped keys.
> ---
>  drivers/mmc/host/sdhci-msm.c | 51 +++++++++++++++++++++++++++++++-----
>  1 file changed, 45 insertions(+), 6 deletions(-)

Otherwise the patch looks okay to me.  It lines up with the UFS
equivalent.  Can you also provide details on how you tested it?

- Eric

