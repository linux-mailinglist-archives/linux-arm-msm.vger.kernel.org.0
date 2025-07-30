Return-Path: <linux-arm-msm+bounces-67144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5591CB1609A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 14:47:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 93DF4566840
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 12:47:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F29E29993B;
	Wed, 30 Jul 2025 12:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uyRoU97i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F19299924;
	Wed, 30 Jul 2025 12:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753879586; cv=none; b=CIxOgBPvi/2NZiUUVOOHDspiqW2rQxZsimGI1aPIuikEwUJqyzfJxzHugGMCpnSLHDR393IsSrLAoihNlhZOE04gGCibANKxKl6iig/6lHDzGDqzMlMJ87rJHPy55Hx9pDiYtR/IFlv/EwaEFdtkWvRr8I7TsCURXGdXPrwaalA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753879586; c=relaxed/simple;
	bh=50UIteFtNHRUtkmAOTrMYqlbtcxNvyAqWTl8Cdv76Bs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tbPzr4tdUzugz9imGa0rSXeQtpN6ksF8SbufTLqnuF+8syi74xsq2En0lzLiyT/UYkZ+AV9gxEwLgazMPp41NcIDhxF4WHf9UhfQ3J4F6A1dLH+Dr5S+9fbgwByQlLfjfb7JJA83PZo6tjCTpgksxCJEMboA6zZX6sBpMy4cgDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uyRoU97i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49E15C4CEF5;
	Wed, 30 Jul 2025 12:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753879585;
	bh=50UIteFtNHRUtkmAOTrMYqlbtcxNvyAqWTl8Cdv76Bs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uyRoU97iNW4Q7pfzLuqM2O1mSa8sPr+48oa9cjJ7UPTOrgZMKRsfb8WkWBVqvA01f
	 MzlmP0wGN6no215r5gQBqmxFkaTrZ2Kyr8qW3YtpFNBGs082lG89/YLR7fkZKtTqDF
	 MLiLPc1e4nVS+NianvJSsnxq5CKgCRR1OLdYPaBO8dimJ7Jc72R/gq4SXh73kSf4SW
	 W3S2SqXDZ8JreMPNmRytk0kLOqPMt4pPTM2KwFDLiSdpGYOAhDV7YSFOK+0V2JZWO0
	 7nF7NDum1ISgff7QbXcGCU3r5HlBsYsM2gVOhodAYG1eR2qlpi+dnrC6ta67PGlcDw
	 rCWtXseuc1D6g==
Message-ID: <c8211e69-75d9-439e-a4de-1add711d2a05@kernel.org>
Date: Wed, 30 Jul 2025 14:46:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] arm64: dts: qcom: Add lemans evaluation kit (EVK)
 initial board support
To: Wasim Nazir <wasim.nazir@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 kernel@oss.qualcomm.com, Rakesh Kota <quic_kotarake@quicinc.com>,
 Sayali Lokhande <quic_sayalil@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250722144926.995064-1-wasim.nazir@oss.qualcomm.com>
 <20250722144926.995064-8-wasim.nazir@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250722144926.995064-8-wasim.nazir@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22/07/2025 16:49, Wasim Nazir wrote:
> Lemans EVK is an IoT board without safety monitoring feature of
> Safety Island(SAIL) subsystem.
> 
> Lemans EVK is single board supporting these peripherals:
>   - Storage: 2 × 128 GB UFS, micro-SD card, EEPROMs for MACs,
>     eMMC on mezzanine card
>   - Audio/Video, Camera & Display ports
>   - Connectivity: RJ45 2.5GbE, WLAN/Bluetooth, CAN/CAN-FD
>   - Sensors: IMU
>   - PCIe ports
>   - USB & UART ports
> 
> On top of lemans EVK board additional mezzanine boards can be stacked
> in future.
> 
> Implement basic features like uart/ufs to enable 'boot to shell'.
> 
> Co-developed-by: Rakesh Kota <quic_kotarake@quicinc.com>
> Signed-off-by: Rakesh Kota <quic_kotarake@quicinc.com>
> Co-developed-by: Sayali Lokhande <quic_sayalil@quicinc.com>
> Signed-off-by: Sayali Lokhande <quic_sayalil@quicinc.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile       |   1 +
>  arch/arm64/boot/dts/qcom/lemans-evk.dts | 291 ++++++++++++++++++++++++
>  2 files changed, 292 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/lemans-evk.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 2a1941c29537..cbc89c54f92b 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -31,6 +31,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp453.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp454.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= lemans-auto-ride.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= lemans-auto-ride-r3.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= lemans-ride-r3.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8216-samsung-fortuna3g.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-acer-a1-724.dtb
> diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> new file mode 100644
> index 000000000000..dd357d514587
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> @@ -0,0 +1,291 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.

Missing date, as discussed in other thread your internal guidelines are
not relevant here and to my knowledge upstream guidelines (provided in
other linked discussion) ask for year of first publication.

Best regards,
Krzysztof

