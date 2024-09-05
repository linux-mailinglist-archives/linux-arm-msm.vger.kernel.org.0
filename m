Return-Path: <linux-arm-msm+bounces-30929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0434796DB10
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 16:04:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A15A11F27720
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 14:04:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E948D19DF6A;
	Thu,  5 Sep 2024 14:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PxVv7IEW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBEC919DF53;
	Thu,  5 Sep 2024 14:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725545069; cv=none; b=Y5pCxTfLNkEwk6xN2cqnxiLF5XBjimISMppprIUx18zGzY2GQJgyJEFtoEotQXBmsy5X1BGlkQGyN192sp8MIOk7gSjT7xY6M5MPGDIQwyYqtR3NHJQizI9EyPfgihClasAfE4ONkqyfV5pK7IDUG1Knpu2RcNKdrXbKc1er3zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725545069; c=relaxed/simple;
	bh=0wFXhlDNi64WpkGU8ZSV9JVT552PkkVjpI/1SvVravc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i0PBbtPcWvY5AfCOlDDzAzoFcTWKF8beWhb/yhpZL7fl7IZTIl441nOFesD4vNx7w41SHn51SzWgmDg2/SY/3msw/f/mgWz0tAOKrtmyGOMjxqnuXS4ry7Kl0TIJ/8T7tdtvGZrEbP5vRSfG4XKAVlSaInML/tHeiMAG/joQUnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PxVv7IEW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26123C4CEC3;
	Thu,  5 Sep 2024 14:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725545069;
	bh=0wFXhlDNi64WpkGU8ZSV9JVT552PkkVjpI/1SvVravc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PxVv7IEW9k/CgR+5Eqynl7FqdGdFTPKiQhc7GJbQWHSB/yShYRHjm+IE+s2MTjlKg
	 1SrdPXyR45OQVbQJOIpQIBr429QA2fWU39gHy3sm7jdvCLlLtltMfyGeAha1egnmH3
	 vCNUcOOCwbstC8IDR3+Xo5yw+tHbigRPhGJ8zED0/NN8ntm5kkVtAJuZdugXXAI0yY
	 amuLQx/II1V02p5dK+WVayj/VJlwy7NF9WFdkV8P8dJ1M7SnFT/bFkyqaGm6xpjoip
	 b0oVXAB9Rk2FYai0frZjGeZwOVz4kLtnc0tLO8/lV9td8FYw3Qf+lri9LjELQOvKhC
	 4X26vmaTRDKiA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1smD6N-000000002Il-1oQ9;
	Thu, 05 Sep 2024 16:04:47 +0200
Date: Thu, 5 Sep 2024 16:04:47 +0200
From: Johan Hovold <johan@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: sc8280xp-x13s: keep less
 regulators always-on
Message-ID: <Ztm6fzmoeWcCpqvi@hovoldconsulting.com>
References: <20240905122023.47251-1-brgl@bgdev.pl>
 <20240905122023.47251-5-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240905122023.47251-5-brgl@bgdev.pl>

On Thu, Sep 05, 2024 at 02:20:22PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Remove the regulator-always-on property from the ones that used to be
> implicitly needed by the on-board WCN6855 now that its PMU is modeled in
> device-tree.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> index 88b31550f9df..1a9dac16c952 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> @@ -479,7 +479,6 @@ vreg_s10b: smps10 {
>  			regulator-min-microvolt = <1800000>;
>  			regulator-max-microvolt = <1800000>;
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> -			regulator-always-on;
>  		};

What makes you think s10b is only used by wcn6855?

You clearly did not check the schematics so make sure you verify the
rest as well before resending.

And if any of these are valid, I think this should be part of the
previous patch.

Johan

