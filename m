Return-Path: <linux-arm-msm+bounces-52946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8797A7770A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 10:58:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BCAEF188DF8F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 08:58:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FFBB1EB9F3;
	Tue,  1 Apr 2025 08:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YPHaS3Yp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C101D7E52;
	Tue,  1 Apr 2025 08:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743497901; cv=none; b=I/qCSxt1Yca2ugiJZuQMe52xA1Q/0Z8F4IokyNVuKrzgNHAZ7ooeel7wygqbiEzI+JiBQiV6Q+XWZeyf6Niy1RNXQD1vJsyPWeb5yPJ/mEVaYKFjt5gGqw+yylb31MOBAsUZvfQIDRlfLj+YavXszfJjWQGATyKCCBFo9ywiaQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743497901; c=relaxed/simple;
	bh=t936lpg6lmBc/X8Bym05vY2nu5vTXDbTMcpPetbLpEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FIXunaIMfzc7E//qpWohsbezDZhDMmxThRQzHmU47HS8GLS49kwsUjgHG8zh6bVTDIh98Ixw+KbW1cF/5ejPyWqcqbhNvs16uEomV7p9ER4lVRcjlOSycInP7zlucNb8DzaGJNmpeZMAWqLubqGve9I73qDzZUfGvTKdM4t0+Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YPHaS3Yp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D917AC4CEE4;
	Tue,  1 Apr 2025 08:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743497900;
	bh=t936lpg6lmBc/X8Bym05vY2nu5vTXDbTMcpPetbLpEs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YPHaS3Ypb7ttO4k2FKtQOY6hFUF11P11Sx6s3zsZItIYqfsCfnMS/cwVM5ME1CTal
	 NtEQPyAGqdG+U6pEMAyTv/g4P7gIKsT3k8VjHVyVFesBtw634TZARcIXqUswn19sAr
	 bLCv8Wl13ies/KHRzLspJR+bvN8LowMRzI9ezi+k+iLsZK/MjPBVJTfaGdkLZjHrwp
	 2gRc13j+KMEdVQwKaozA+zi/HxDe/odLlRQG+sL4hV0fJkfkmRFQebl0XLmgpc8wMZ
	 IPPkOICZIHgyRtcwaer0oal9dZrXEGb5ur246E4jn9hNP+Y7FS64oIikvusN0gGTar
	 9Duk3C0WY+ENQ==
Date: Tue, 1 Apr 2025 09:58:15 +0100
From: Daniel Thompson <danielt@kernel.org>
To: Henry Martin <bsdhenrymartin@gmail.com>
Cc: Markus.Elfring@web.de, lee@kernel.org, jingoohan1@gmail.com,
	deller@gmx.de, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v3] backlight: pm8941: Add NULL check in wled_configure()
Message-ID: <Z-uqpxcge0J99IPI@aspen.lan>
References: <d5f2aa49-27e2-4cc1-91be-4e195ed5249e@web.de>
 <20250401082950.21698-1-bsdhenrymartin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401082950.21698-1-bsdhenrymartin@gmail.com>

On Tue, Apr 01, 2025 at 04:29:50PM +0800, Henry Martin wrote:
> The function wled_configure() uses devm_kasprintf() without checking for
> allocation failures, which could lead to NULL pointer dereferences.
>
> Add proper error handling when devm_kasprintf() fails by:
> - Returning -ENOMEM immediately
> - Ensuring no resources are left allocated (none need cleanup in this case)

Two things have gone wrong here:

1. This patch has been incorrectly posted with the wrong patch number.
2. You've let Markus bully you into adding some pointless text in the
   patch description ;-). I think the original v3 was better worded.
   IMHO the bulleted list adds nothing useful.

When you get the chance please send a v4 of the patch so we can pick it
up without any confusion (I suspect it might be a week or two before
this gets pulled so clean mail threads help a lot). It's up to you but
I'd recommend keeping the original v3 wording and label it something
like:
V3 -> V4: No functional changes, just correcting the version number


Daniel.



>
> Fixes: f86b77583d88 ("backlight: pm8941: Convert to using %pOFn instead of device_node.name")
> Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> V2 -> V3: Fix commit message and verify proper error handling with
> resource cleanup.
> V1 -> V2: Fix commit message to use imperative mood and wrap lines to 75
> characters.
>
>  drivers/video/backlight/qcom-wled.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
> index 9afe701b2a1b..a63bb42c8f8b 100644
> --- a/drivers/video/backlight/qcom-wled.c
> +++ b/drivers/video/backlight/qcom-wled.c
> @@ -1406,9 +1406,11 @@ static int wled_configure(struct wled *wled)
>  	wled->ctrl_addr = be32_to_cpu(*prop_addr);
>
>  	rc = of_property_read_string(dev->of_node, "label", &wled->name);
> -	if (rc)
> +	if (rc) {
>  		wled->name = devm_kasprintf(dev, GFP_KERNEL, "%pOFn", dev->of_node);
> -
> +		if (!wled->name)
> +			return -ENOMEM;
> +	}
>  	switch (wled->version) {
>  	case 3:
>  		u32_opts = wled3_opts;
> --
> 2.34.1
>

