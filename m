Return-Path: <linux-arm-msm+bounces-79085-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C8100C12CEC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 04:48:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B68D74EA311
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 03:48:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D633279329;
	Tue, 28 Oct 2025 03:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r+LlHi1D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2FD2571BD;
	Tue, 28 Oct 2025 03:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761623309; cv=none; b=iIli3y8WuVIihj2Q8yAJbFGniZ+/uTzGeRZCGUKX5Cv44NQsDJj5i1wvDVpUBcKlW5ics8gLs1iV3q8H3nyGogVsarIQMR9NMzYfsRS3yeM8aonRoAF2kskrf1I4+iM4ahOu5CNE83wjIKeDTdvat7I5y/QfONW9eV+29n8zThA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761623309; c=relaxed/simple;
	bh=F9PEdAfzgWQQ2Eeck3XTAAh60sY+/GKtfF7NT+YXA9k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PurDzIZ1LuzlPpRObRdLV7sYShFe1LAoGlRXJWSlKGXjOh7Ajic/dNR2V45iGZ5cw9ylrVxORkyBGe209XItKKV6VMwVEYIwn6w8YzBYv2K0JKgyVa7VVa/pK/oRwRTAti8AVZxQEs8u0LkNX+puOULQUUKwk7Ql+YAbGwm8Cxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r+LlHi1D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2741AC4CEE7;
	Tue, 28 Oct 2025 03:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761623308;
	bh=F9PEdAfzgWQQ2Eeck3XTAAh60sY+/GKtfF7NT+YXA9k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r+LlHi1DRjrYdeHjbmQptIeHgcr+h+3w70uVuYEPJGPrY4kRuE4Afm1cwWeN17Ni6
	 IABr8PF3+vkXuiicY7YlxBsudMRGr6JUVREv4e2Z+ouddyWJCC9UNFN5LtV9jm+QLU
	 +CYLaW7XWhQKux0MzE9HXbpzqwFx70xulmvMKLOFD4sNLFNDUh9gYLTLpFmrbmX9AO
	 h0LGzo7sj/QQz430yP8rbrguggjQBsur4KRWQqRPEnvgfDyQ0px7BbYYyhsIW//bVN
	 G/JiIFDV+D0+dvFICRAVgdqEjRUhe5n77ARIKYdvU1u3IwTYdHw2wI7C9NvqCts/Xj
	 YbEd4ytzBVAFg==
Date: Mon, 27 Oct 2025 22:51:23 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, 
	abhinav.kumar@linux.dev, sean@poorly.run, marijn.suijten@somainline.org, 
	airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca, 
	quic_khsieh@quicinc.com, neil.armstrong@linaro.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com, 
	yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 08/12] arm64: defconfig: Enable NT37801 DSI panel driver
Message-ID: <wuh7agcgg6spghilnx4amqukaaydj25u7kbdiod7fl6pu2ulvm@pmosyuo43cyw>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-3-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023080609.1212-3-yuanjie.yang@oss.qualcomm.com>

On Thu, Oct 23, 2025 at 04:06:05PM +0800, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> Build the NT37801 DSI panel driver as module.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

You (Yuanjie) authored the patch, but forgot to sign-off, then Yongxing
provided certificate of origin, then you provide certificate of origin
and send it to list?

Please correct.

Also, all other patches in this series are merged by DRM maintainers,
while I'm supposed to merge this one. Please send it separately, once
it's ready to be merged.

Thanks,
Bjorn

> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 8cfb5000fa8e..537a065db11c 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -945,6 +945,7 @@ CONFIG_DRM_PANEL_SITRONIX_ST7703=m
>  CONFIG_DRM_PANEL_STARTEK_KD070FHFID015=m
>  CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA=m
>  CONFIG_DRM_PANEL_VISIONOX_VTDR6130=m
> +CONFIG_DRM_PANEL_NOVATEK_NT37801=m
>  CONFIG_DRM_DISPLAY_CONNECTOR=m
>  CONFIG_DRM_FSL_LDB=m
>  CONFIG_DRM_ITE_IT6263=m
> -- 
> 2.34.1
> 

