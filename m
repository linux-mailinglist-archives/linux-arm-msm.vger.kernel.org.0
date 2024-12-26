Return-Path: <linux-arm-msm+bounces-43336-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 929649FC7FB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 05:43:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E4F201882C71
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 04:43:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F44353363;
	Thu, 26 Dec 2024 04:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JufPT3WB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB235258;
	Thu, 26 Dec 2024 04:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735188199; cv=none; b=DbKvFOhXbme2jHqEVhrgg23bivrSCSYTab9DS0HjzpnwcSQDwpaDRuzwoV023gJKozwHhop4PwrJL8j+mS3O0hjXT60NasqLJJWF9ECk3Mxm5oUXFLsHnKTuMqda8xpWftS7REOpBH6tkB6tg3OjpV4/TyrzdVO+dRUz9Cw0f+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735188199; c=relaxed/simple;
	bh=5OfYPkPyuBwfR6uPv0h71tG9ixg26eQRQYpWfS0NWXM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YMkEFUs/P9r8ohgZIke7/jIzBoPPjOMcNDCmU6LPQJyBAVUm0sVb27oduyxppVtFQ/Ga4vJ3CgbyEyvzaZrCE3EnuRTflPGMWs3lZqCbVqxxcp2PPcNofaybEEjZ8npGOPRlhrewiAqIv5K1IbUENJ3kWU1gU5CioNP/6nlT11s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JufPT3WB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D52BCC4CED1;
	Thu, 26 Dec 2024 04:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735188198;
	bh=5OfYPkPyuBwfR6uPv0h71tG9ixg26eQRQYpWfS0NWXM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JufPT3WB2Wdp47SSZJ0l9aDg0dybt5U0vBO3BJEwBwlgNx3S1DTWDcEP/3FxOosJw
	 s4Gtj61KG0NWl8LHuHs9Ta9PE5sYdH04m2up1G9uhd7q+YGWOauL5+1vhdTazi8nil
	 huFlfShKneqdO3dJO7J3YCZt6w7PgSqxpnEph3Rth9WEWm8mFfAlEkKhVOO6Wfjx9z
	 9xlo17IvlL6uQtNLti+lF4UynZ7OUS1qXYXJfOv4kBMeqxXboAISDQlmsI1LllDjxp
	 Hp3GtRHQLMTZ3ilTKcwzRn33K9JKPoH4MGxTVWgRNo7Hal26n3lheICrMbzz+/Bhym
	 +H2iKG0vWB/aQ==
Date: Wed, 25 Dec 2024 22:43:16 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Prashanth K <quic_prashk@quicinc.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, cros-qcom-dts-watchers@chromium.org
Subject: Re: [PATCH v3 00/19] Disable USB U1/U2 entry for QC targets
Message-ID: <whfe57qqbe2chb75igiidzmruhgwpc6ueeghnf552wsa3yrru6@m4tuyfnsoqvo>
References: <20241218102707.76272-1-quic_prashk@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241218102707.76272-1-quic_prashk@quicinc.com>

On Wed, Dec 18, 2024 at 03:56:48PM +0530, Prashanth K wrote:
> Enabling U1 and U2 power-saving states can lead to stability and
> performance issues, particularly for latency-sensitive or high-
> throughput applications. These low-power link states are intended
> to reduce power consumption by allowing the device to enter partial
> low-power modes during idle periods. However, they can sometimes
> result in unexpected behavior. Over the years, some of the issues
> seen are as follows:
> 
> 1. In device mode of operation, when UVC is active, enabling U1/U2
> is sometimes causing packets drops due to delay in entry/exit of
> intermittent low power states. These packet drops are often reflected
> as Missed Isochronous transfers as the controller was not able to
> send the packet in that microframe interval and hence glitches are
> seen on the final transmitted video output.
> 
> 2. On QCS6490-Rb3Gen2 Vision kit, ADB connection is heavily unstable
> when U1/U2 is enabled. Often when link enters U2, there is a re-
> enumeration seen and device is unusable for many use cases.
> 
> 3. On QCS8300/QCS9100, it is observed that when Link enters U2, when
> the cable is disconnected and reconnected to host PC in HS, there
> is no link status change interrupt seen and the plug-in in HS doesn't
> show up a bus reset and enumeration failure happens.
> 
> 4. On older targets like SM8150/SM8250/SM8350, there have been
> throughput issues seen during tethering use cases.
> 
> 5. On targets like SDX75, intermittent disconnects were observed
> with certain cables due to impedence variations.
> 
> To avoid such issues, the USB team at Qualcomm added these quirks
> to all targets in the past 4-5 years and extensive testing was done.
> Although these are intermittent power states, disabling them didn't
> cause any major increase in power numbers.
> 
> This series was earlier started by Krishna Kurapati where he disabled
> U1/U2 on some SM targets. I'm extending this to more devices including
> Auto, Compute and IOT platforms. On a side note, this quirk has been
> already included on some mobile targets like SM8550/8650.
> 
> Changes in v2:
> - Removed the wrongly added quirks from tcsr_mutex node.
> - Link to v2: https://lore.kernel.org/all/20241213095237.1409174-1-quic_prashk@quicinc.com/
> 
> Link to RFC:
> https://lore.kernel.org/all/20241107073650.13473-1-quic_kriskura@quicinc.com/#Z31arch:arm64:boot:dts:qcom:sm8250.dtsi
> 
> Krishna Kurapati (8):
>   arm64: dts: qcom: Disable USB U1/U2 entry for SM8350
>   arm64: dts: qcom: Disable USB U1/U2 entry for SM8450
>   arm64: dts: qcom: Disable USB U1/U2 entry for SM8150
>   arm64: dts: qcom: Disable USB U1/U2 entry for SM6125
>   arm64: dts: qcom: Disable USB U1/U2 entry for SM8250
>   arm64: dts: qcom: Disable USB U1/U2 entry for SM6350
>   arm64: dts: qcom: Disable USB U1/U2 entry for SC7280
>   arm64: dts: qcom: Disable USB U1/U2 entry for SA8775P

Thank you for submitting this, changes looks good and this is very
welcome corrections!

But patch subject is not okay. The prefix should match other changes in
these files, and no "for XYZ" suffix.

As such, these should all look like:

"arm64: dts: qcom: <soc>: Disable USB U1/U2 entry"

> 
> Prashanth K (11):
>   arm64: dts: qcom: Disable USB U1/U2 entry for SDM630
>   arm64: dts: qcom: Disable USB U1/U2 entry for SDM845
>   arm64: dts: qcom: Disable USB U1/U2 entry for SDX75
>   ARM: dts: qcom: Disable USB U1/U2 entry for SDX65
>   ARM: dts: qcom: Disable USB U1/U2 entry for SDX55

I merge Arm and Arm64 patches through different trees, so I would
appreciate if you send these two as a separate series (also v4).

Thanks,
Bjorn

>   arm64: dts: qcom: Disable USB U1/U2 entry for QCS404
>   arm64: dts: qcom: Disable USB U1/U2 entry for SC7180
>   arm64: dts: qcom: Disable USB U1/U2 entry for X1E80100
>   arm64: dts: qcom: Disable USB U1/U2 entry for QDU1000
>   arm64: dts: qcom: Disable USB U1/U2 entry for SC8280XP
>   arm64: dts: qcom: Disable USB U1/U2 entry for SC8180X
> 
>  arch/arm/boot/dts/qcom/qcom-sdx55.dtsi |  2 ++
>  arch/arm/boot/dts/qcom/qcom-sdx65.dtsi |  2 ++
>  arch/arm64/boot/dts/qcom/qcs404.dtsi   |  4 ++++
>  arch/arm64/boot/dts/qcom/qdu1000.dtsi  |  2 ++
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi  |  6 ++++++
>  arch/arm64/boot/dts/qcom/sc7180.dtsi   |  2 ++
>  arch/arm64/boot/dts/qcom/sc7280.dtsi   |  4 ++++
>  arch/arm64/boot/dts/qcom/sc8180x.dtsi  |  6 ++++++
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi |  6 ++++++
>  arch/arm64/boot/dts/qcom/sdm630.dtsi   |  4 ++++
>  arch/arm64/boot/dts/qcom/sdm845.dtsi   |  4 ++++
>  arch/arm64/boot/dts/qcom/sdx75.dtsi    |  2 ++
>  arch/arm64/boot/dts/qcom/sm6125.dtsi   |  2 ++
>  arch/arm64/boot/dts/qcom/sm6350.dtsi   |  2 ++
>  arch/arm64/boot/dts/qcom/sm8150.dtsi   |  4 ++++
>  arch/arm64/boot/dts/qcom/sm8250.dtsi   |  4 ++++
>  arch/arm64/boot/dts/qcom/sm8350.dtsi   |  4 ++++
>  arch/arm64/boot/dts/qcom/sm8450.dtsi   |  2 ++
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 10 ++++++++++
>  19 files changed, 72 insertions(+)
> 
> -- 
> 2.25.1
> 

