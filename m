Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61A32459ADE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Nov 2021 05:00:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231137AbhKWEDQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Nov 2021 23:03:16 -0500
Received: from mail.kernel.org ([198.145.29.99]:44200 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229982AbhKWEDO (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Nov 2021 23:03:14 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7215860E0B;
        Tue, 23 Nov 2021 04:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637640007;
        bh=TrvxL3GAHbLK+nDc69XnlyZlhHQzEgEZPwY8fVS1DxI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GVhqDHqSEyIKclc1fM9iBaGdXFjESFzUCVrN0yh20kxCYAMAp7nh2T/5mCxb2tSJ6
         pnv0An2JjAqlFpk2pY0cWCZJDtzc8ix4gDYDaRMB2vmNO9b4lOVtixnuru3Rr/8KF6
         nV4OXle2ld2Huubk8X0HW+gTY/46nwZF68VtxC/gRWm6+2yEYBn4/wiVOZHYSE2Cbb
         r37w/SrPvp9z2QCOIAzwQu71hkJBdikg3PIDvY5eL7rSLTQ/ySuwNsepj58HenhTqK
         qgr7/WFLW2W2sYdev9Le2jyHnvfaPMw4MvU2HGLIfKdJaCf2gi4QLdeEwbBaenRweW
         n3iTSvhYcKQXw==
Date:   Tue, 23 Nov 2021 09:30:01 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Katherine Perez <kaperez@linux.microsoft.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] arm64: dts: add minimal DTS for Microsoft Surface
 Duo2
Message-ID: <YZxnQfB6V7GOlygq@matsya>
References: <20211122190552.74073-1-kaperez@linux.microsoft.com>
 <20211122190552.74073-2-kaperez@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211122190552.74073-2-kaperez@linux.microsoft.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22-11-21, 11:05, Katherine Perez wrote:
> This is a minimal devicetree for Microsoft Surface Duo 2 with SM8350
> Chipset
> 
> Signed-off-by: Katherine Perez <kaperez@linux.microsoft.com>
> ---
> 
> Changes since v1:
> - Change remoteprocs firmware-naming scheme to qcom/sm8350/microsft/*
> - Add chassis-type
> 
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../qcom/sm8350-microsoft-surface-duo2.dts    | 369 ++++++++++++++++++
>  2 files changed, 370 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 6b816eb33309..a8cc6bd3c423 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -106,4 +106,5 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-mtp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-sony-xperia-edo-pdx203.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-sony-xperia-edo-pdx206.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8350-hdk.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sm8350-microsoft-surface-duo2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8350-mtp.dtb
> diff --git a/arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dts b/arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dts
> new file mode 100644
> index 000000000000..d4963c9015cb
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dts
> @@ -0,0 +1,369 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (C) 2021, Microsoft Corporation
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +#include "sm8350.dtsi"
> +#include "pm8350.dtsi"
> +#include "pm8350b.dtsi"
> +#include "pm8350c.dtsi"
> +#include "pmk8350.dtsi"
> +#include "pmr735a.dtsi"
> +#include "pmr735b.dtsi"
> +
> +/ {
> +	model = "Microsoft Surface Duo 2";
> +	compatible = "microsoft,surface-duo2", "qcom,sm8350";
> +	chassis-type = "handset";

This is interesting, I see it used at lot of place, unfortunately, it
does not seem to be documented :(

-- 
~Vinod
