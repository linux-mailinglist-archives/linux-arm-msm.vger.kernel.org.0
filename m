Return-Path: <linux-arm-msm+bounces-81710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71AFEC59F7B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 21:26:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2DB163ADA95
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 20:24:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D392313524;
	Thu, 13 Nov 2025 20:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kANWmNZt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9262FE04B;
	Thu, 13 Nov 2025 20:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763065475; cv=none; b=f57lzngICpH/iHiVpj/M9ZKtgsBNn1XWKg5AEbM9nEd0aoAgjpXeOJ8/GU2hKeLHdAP5u5lsVKYlV4uE5ZwpPyxDibM/WsZLWU8KeTx7KbmTYnD+iv6tQdknbygT+6DGEZIUnCGJnpI9FoDwXMhnhMTlPcT3zur+t5jAOr119x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763065475; c=relaxed/simple;
	bh=4NO2Xdkz+jSDa61SzpnaLxD87yK+fJMEQl6hv5p3foU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p9y9VN1qmvBMZbK/+GpK0E5Kt7tZqo7NxBuTf9sH2eBZEzpb/yBAQ7wuwEpy20utswhIb1KJnHqf+y2eapmD5kbcy0xNz7f15IQt5koHEJUCihm3/P2LrhdXBnA27CUuzRydWyQ/9beYTiK4y83BNTebYJMh2mxu3w+68urcask=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kANWmNZt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17A4AC4CEFB;
	Thu, 13 Nov 2025 20:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763065475;
	bh=4NO2Xdkz+jSDa61SzpnaLxD87yK+fJMEQl6hv5p3foU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kANWmNZt1Ib/MEjszjq3IIn1PYr6mCiLIBAhiqYeog6m2ahduTP9W0j9Wjdh98b94
	 5NwldTDIdGZvV/ZnR3ppFS5bn1vWpQ/cKeSHou9697vZZGaCGDRdn+YCA1rEjU4Unw
	 X3S7a45nV5XpczwpLG9uvQhr5SxrhtLOc3iy/rtBEZwNWxHH2TTRJC8oHasptjG6ZG
	 HvqBE6U5UyhUwN3H5UcQhgs+ueZMDM/DIIWhhiBQDDNYu+ho+SnBhvm0CsZzuWXW/o
	 4MnZIqnYisZWY7Kv4N+JVQIhEofCUwYqwSxCqwJIqWDkYg01Lrd5GgtOaf96FAJvIB
	 firhIZDFs8TUg==
Date: Thu, 13 Nov 2025 14:28:58 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: david@ixit.cz
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Casey Connolly <casey.connolly@linaro.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 02/12] arch: arm64: qcom: sdm845-enchilada: Specify
 panel name within the compatible
Message-ID: <mccbyhok747hjopkigm7rj7y6564bhnqxzcpo5yqjhbfffa4z4@5odvenhhsh3p>
References: <20251113-sofef00-rebuild-v2-0-e175053061ec@ixit.cz>
 <20251113-sofef00-rebuild-v2-2-e175053061ec@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113-sofef00-rebuild-v2-2-e175053061ec@ixit.cz>

On Thu, Nov 13, 2025 at 06:57:36PM +0100, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>

No "arch: " prefix on these files, please. (If patch 1 is picked in the
current form, I can fix it up for you) 

Regards,
Bjorn

> 
> sofef00 is name of the DDIC, it doesn't contain name of the panel used.
> The DDIC is also paired with other panels, so make clear which panel is
> used.
> 
> New device-tree will work with old driver as expected, due to secondary
> compatible.
> 
> cosmetic: sort the node.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts b/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
> index a259eb9d45ae0..8aead6dc25e00 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
> @@ -31,9 +31,9 @@ battery: battery {
>  };
>  
>  &display_panel {
> -	status = "okay";
> +	compatible = "samsung,sofef00-ams628nw01", "samsung,sofef00";
>  
> -	compatible = "samsung,sofef00";
> +	status = "okay";
>  };
>  
>  &bq27441_fg {
> 
> -- 
> 2.51.0
> 
> 

