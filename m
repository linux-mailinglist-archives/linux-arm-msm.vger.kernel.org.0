Return-Path: <linux-arm-msm+bounces-37430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 011949C33DB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Nov 2024 17:55:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ACF2C1F210D5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Nov 2024 16:55:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3FD712BF02;
	Sun, 10 Nov 2024 16:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l/ferP/k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842EE4778E;
	Sun, 10 Nov 2024 16:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731257713; cv=none; b=i0eLTtu+995lmt2ZF6w9azIzBFrRMjCgY2KENi2Q8h/Uc2dRX7DmWOG2+nXCu3+urejp+XTNpu7PANBJrHQZ44LLhrZiqPEM97f+8CR+3io+Bs1IRqK3CIA8btOIG7RYTmtkLRip1w2znzCbEnNkNpWY2Low0QpeU4ZZadFof0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731257713; c=relaxed/simple;
	bh=AUZskdJBYevNYTGe0KPeZyYfuq+MaJc1K9ZNMQotNl4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RDVsapV0s8jvdJ5IHAOg3tt8Ane/NdGgtnOHAY6bhosaacxxolMyBrxP5w36d+xqLszj0swOz7RVqEQ1SIRwkGw8jEHLKq1SKHAZ3lXI20gBu6K+XEhkNHg2mqf5Sa3cYsj8Zt75zcbU4GBWKd9h8zghoEDV3o1jeLK7Vd9dBwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l/ferP/k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DFACC4CECD;
	Sun, 10 Nov 2024 16:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731257713;
	bh=AUZskdJBYevNYTGe0KPeZyYfuq+MaJc1K9ZNMQotNl4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l/ferP/khg0VXEakjcXIw7NF5yuPND+LsEIV15NV0+NvMWryrmeWMr162LPPXgj2h
	 mdehU44PqpqDruH9xl+MOV6WSXeX4EN1Vo7lYrvOrubIbEF0Q0eh9aEVx7Y3nUyxg6
	 0gXgBkIbnna7dGvQE/uueuNn8Xk11JBdjpywWR7Jea7cag7bkFoy1SPJRaJD5i4OvU
	 A0AGRyUCu1kuwSXVWOCGwEWyg1h1brXEUzTHUrdQFd8Jj0hmOoDixpDW+HsrdXvNWB
	 0oOv1hVZyhxAkfgSBy6PNioJBebTIXScAZUSYCwjojUTdX2OzKEv4lurwGArCSRF7x
	 c231OwRtXn8cQ==
Date: Sun, 10 Nov 2024 10:55:10 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: maud_spierings@hotmail.com
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] enable the gpu node
Message-ID: <rfdg37xvvfqumw6xjk6fod5iwsrdq3okadsz62eygymllh3pv3@llvipo64oz37>
References: <20241110-qcom-asus-gpu-v1-1-13d7b05784b8@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241110-qcom-asus-gpu-v1-1-13d7b05784b8@hotmail.com>

On Sun, Nov 10, 2024 at 01:46:12PM +0100, maud spierings via B4 Relay wrote:

Please run 
  git log --oneline -- arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
and add a prefix to your subject line to make your change match others
to this file.

Please also drop "node", as it's the GPU you're actually enabling.

> From: maud spierings <maud_spierings@hotmail.com>
> 
> enable the gpu node on the snapdragon powered asus vivobook s15

Looks good, please capitalize the 'e' at the beginning of your sentence.

> 
> ---

Anything below the '---' line is omitted from the git history,
including your Signed-off-by. So move that above this line (and remove
the "enables..."-line below.

> enables the gpu on the asus vivobook s15
> 
> Signed-off-by: maud spierings <maud_spierings@hotmail.com>

It would make me happy if you capitalized the 'm' and 's' in your
name...

Regards,
Bjorn

> ---
>  arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
> index 8515c254e15868a5d7f378b0dc0bf8f339fc7b19..f25991b887de3fca0092c5f81c881c5d8bd71aac 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
> @@ -328,6 +328,14 @@ vreg_l3j_0p8: ldo3 {
>  	};
>  };
>  
> +&gpu {
> +	status = "okay";
> +
> +	zap-shader {
> +		firmware-name = "qcom/x1e80100/ASUSTeK/vivobook-s15/qcdxkmsuc8380.mbn";
> +	};
> +};
> +
>  &i2c0 {
>  	clock-frequency = <400000>;
>  	status = "okay";
> 
> ---
> base-commit: 929beafbe7acce3267c06115e13e03ff6e50548a
> change-id: 20241110-qcom-asus-gpu-870c7c22935c
> 
> Best regards,
> -- 
> maud spierings <maud_spierings@hotmail.com>
> 
> 

