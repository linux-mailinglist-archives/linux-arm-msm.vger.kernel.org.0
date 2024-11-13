Return-Path: <linux-arm-msm+bounces-37779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F329C6EDE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2024 13:15:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4042B1F21A42
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2024 12:15:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E62F200C90;
	Wed, 13 Nov 2024 12:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rMaNYGqZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F895200BB6;
	Wed, 13 Nov 2024 12:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731500123; cv=none; b=OZX9Y9Slw81ErPov9mFO+itK1ees/xLYMBzHjW+yg2nXExzC3C2F1qgG3hEWcK5zKnli8HvByIvLr/rnQPczMU7L2eDqRAoldid0CymGAW1lYKRr6FbSgFfvav5El1OZ/9b6tkUIxhnyKbYWTwvnghgIzR+6rjDFyGJoBRtLTeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731500123; c=relaxed/simple;
	bh=9YWmqx9A/xktQm++PEdttt53SjkgS0Z1jMoa8DxBCeg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ND9HIaC3x8pONUZCtxMftyWBY1I4neHjDs1fdkVGNWsYBULDd0Z045FP4umnft8xBv6m+JykRAxZl5NoZqWVSvt003IVSKs3k74FbhD5DP+5WEkW/HtbrxdcQTj8jiNllPf2GNhruXkqNWnWJNpSxe7h1ZPXFY15M+UlNyIltTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rMaNYGqZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4B95C4CED2;
	Wed, 13 Nov 2024 12:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731500122;
	bh=9YWmqx9A/xktQm++PEdttt53SjkgS0Z1jMoa8DxBCeg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rMaNYGqZODAfOviPG9NNweaAZwNdMKPKm/r7m9y12m44Tec8i0OzAwTd7x4gjni4g
	 s3YtR7e+s/D0MmQTRdIcxCELtQQ9d7LAiGcLvzcfve621XsYGkhHSnKmkoIkhIVaRY
	 SEsGSmI5VP1jGC61MITWv986/Uv6h0dRiYyZrv82AxZCBIHGxI6EJFWXb19WqlSRcc
	 BgnyRacgEdUqccH8JyhSiLN86ypg5v0g3kBux/gAzRcn0Ps3kCdL/VYeYNVUtcWxUS
	 Fcv7kagYRz9cbT+bn+Sys0opSUgs0lM4zwRGR6JjCZCO827Gbv51UusFNeIi8Frrg8
	 bl0M6/d+FoZDQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tBCHD-000000003zf-46qu;
	Wed, 13 Nov 2024 13:15:16 +0100
Date: Wed, 13 Nov 2024 13:15:15 +0100
From: Johan Hovold <johan@kernel.org>
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, gregkh@linuxfoundation.org,
	andersson@kernel.org, konradybcio@kernel.org,
	dmitry.baryshkov@linaro.org, mantas@8devices.com,
	quic_rohiagar@quicinc.com, quic_kriskura@quicinc.com,
	manivannan.sadhasivam@linaro.org, abel.vesa@linaro.org,
	quic_kbajaj@quicinc.com, quic_wcheng@quicinc.com,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 6/6] arm64: dts: qcom: Add USB controller and phy
 nodes for IPQ5424
Message-ID: <ZzSYU61pmFTcPf5_@hovoldconsulting.com>
References: <20241113072316.2829050-1-quic_varada@quicinc.com>
 <20241113072316.2829050-7-quic_varada@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241113072316.2829050-7-quic_varada@quicinc.com>

On Wed, Nov 13, 2024 at 12:53:16PM +0530, Varadarajan Narayanan wrote:

> --- a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
> +++ b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
> @@ -16,12 +16,71 @@ / {
>  	aliases {
>  		serial0 = &uart1;
>  	};
> +
> +	regulator_fixed_3p3: s3300 {

Fixed regulator nodes should have a "regulator-" prefix in their name.

And please use a shorter label, look at the existing DTs for
inspiration (e.g. "vreg_misc_3p3").


> +		compatible = "regulator-fixed";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +		regulator-name = "fixed_3p3";
> +	};

But is this really an accurate description of these regulators? Are
they not part of some PMIC? Can they really not be turned off?

Also please use the names from the schematics for these. I doubt they
are named "fixed_3p3".

> +
> +	regulator_fixed_1p8: s1800 {
> +		compatible = "regulator-fixed";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +		regulator-name = "fixed_1p8";
> +	};
> +
> +	regulator_fixed_0p925: s0925 {
> +		compatible = "regulator-fixed";
> +		regulator-min-microvolt = <925000>;
> +		regulator-max-microvolt = <925000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +		regulator-name = "fixed_0p925";
> +	};
> +

Stray newline.

> +};

Johan

