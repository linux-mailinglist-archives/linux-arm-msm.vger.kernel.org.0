Return-Path: <linux-arm-msm+bounces-32250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D113984302
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 12:05:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 608EA281F2B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 10:05:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC0D216E886;
	Tue, 24 Sep 2024 10:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LhlGz11/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0CE16DEB3;
	Tue, 24 Sep 2024 10:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727172348; cv=none; b=qcnjaWqHHrPzDRd/SsBEZQ878EUgkgy2rh3juPhpyu9/jXKF7VuEJb7X7Q+/pSoJ8lYgd7hgqLDR9dQoz8i5LYkB/iKE7WK0JTJ6x/YiLqa2w2bkj61FhdP7UDFbrCHOdidsTok5uXOiO7oeBn8sfyqy2TjboofFwSytr/wfd0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727172348; c=relaxed/simple;
	bh=bKuegEH66hlLFmJ+EVy3HPx8jgeuZ9gsUm50RH2vJL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AHvgI5FoDwEkPgIaUBotgbSU2VtNGDT9n99+tzmyAucSz+L3YmfrTQXa5LNgGvEjlzxuZ/Hv7QiRmUQY/AOGyj3Pkv+m46Pa9P6Sf7iirsMUmbslrnBScByg1luruXxOwQfgoIWts71f+tjnpk/fqk24tGfdAn+cUXtUBtkR6XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LhlGz11/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AA41C4CEC4;
	Tue, 24 Sep 2024 10:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727172348;
	bh=bKuegEH66hlLFmJ+EVy3HPx8jgeuZ9gsUm50RH2vJL4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LhlGz11/PYKWi9mPLeFu6e0SSH70XuOV9NOR3S++FaZ0ZJ8dHHGcDPCa9UR536eQC
	 4/VFtcJ3asEptvh2J0J2mQJKMk25k4HAKEXMCnnAJ6qJzpv08CCgb7hJ5xjhtPEGae
	 cfAbjRI8CHBTWZhBLxC1WKlpomtBACpjYIcN263csS4YUJi4iw5FEJvPgSOwluS7xP
	 YYlIkrrPuf6wR2z3MWfgh6wNEQYFAs9d+/sgfU/XoYRg3X9sM5VAkG21nFXfDHVem4
	 CV8glpQYEAiNbr3VQRFTvAVhqYfURlt2WaZKyMKD6ZQO39Q/E4OszOaT55+3hBRXUW
	 r4tbKlFV2Xsqg==
Date: Tue, 24 Sep 2024 12:05:43 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Merck Hung <merckhung@gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: sc8280xp-wdk2023: dt definition
 for WDK2023
Message-ID: <es6ihjams6bzr6gnbdcmmiiiinbn27r3md6jlsvixu6hqqnkgj@pnqnlnimh5ck>
References: <20240920-jg-blackrock-for-upstream-v2-0-9bf2f1b2191c@oldschoolsolutions.biz>
 <20240920-jg-blackrock-for-upstream-v2-1-9bf2f1b2191c@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240920-jg-blackrock-for-upstream-v2-1-9bf2f1b2191c@oldschoolsolutions.biz>

On Fri, Sep 20, 2024 at 07:47:24PM +0200, Jens Glathe wrote:
> Device tree for the Windows Dev Kit 2023. This work
> is based on the initial work of Merck Hung <merckhung@gmail.com>.
> 
> Supported features:
> - USB type-c and type-a ports
> - minidp connector
> - built-in r8152 Ethernet adapter
> - PCIe devices
> - nvme
> - ath11k WiFi (WCN6855)
> - WCN6855 Bluetooth
> - A690 GPU
> - Venus codec
> - ADSP and CDSP
> - GPIO keys
> - Audio definition (works via USB)
> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> Signed-off-by: Merck Hung <merckhung@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile                  |    1 +
>  .../boot/dts/qcom/sc8280xp-microsoft-blackrock.dts | 1332 ++++++++++++++++++++
>  2 files changed, 1333 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 0e5c810304fb..648e283498d2 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -184,6 +184,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sc8180x-lenovo-flex-5g.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sc8180x-primus.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sc8280xp-crd.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sc8280xp-lenovo-thinkpad-x13s.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sc8280xp-microsoft-blackrock.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sda660-inforce-ifc6560.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm450-lenovo-tbx605f.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm450-motorola-ali.dtb
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
> new file mode 100644
> index 000000000000..a16e0b739647
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
> @@ -0,0 +1,1332 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2021, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2022, Linaro Limited
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/iio/qcom,spmi-adc7-pm8350.h>
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/gpio-keys.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +
> +#include "sc8280xp.dtsi"
> +#include "sc8280xp-pmics.dtsi"
> +
> +/ {
> +	model = "Windows Dev Kit 2023";
> +	compatible = "microsoft,blackrock", "qcom,sc8280xp";

also chassis-type


Best regards,
Krzysztof


