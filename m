Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 944DF1EE0E4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2020 11:10:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726740AbgFDJKu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Jun 2020 05:10:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:35624 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726444AbgFDJKu (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Jun 2020 05:10:50 -0400
Received: from localhost (unknown [122.179.53.240])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1E1B92074B;
        Thu,  4 Jun 2020 09:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591261849;
        bh=QaKe1TsH6wrSFWbihlFTG5OTysVrqRRyCfA9MzPON7M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=yClpMraXFsG+LZLsBnngyqUnrug81PyT78qbDuIRcAfdAQ/4cJXtUAWYVz/E71IZP
         mTWILWxnSjdkO/6Xo5Wo9uFtMREtlWJv2i3jNSgo/Fe0pOhxq4qdn8RZxBzTNg425O
         Yd6BHEJhww7qzisVXQ5hkYObgZHQ2NupoJN4srsU=
Date:   Thu, 4 Jun 2020 14:40:44 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        patches@linaro.org, linaro-kernel@lists.linaro.org
Subject: Re: [PATCH 1/7] arm64: dts: qcom: pm8009: Add base dts file
Message-ID: <20200604091044.GF3521@vkoul-mobl>
References: <20200604004331.669936-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200604004331.669936-1-dmitry.baryshkov@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 04-06-20, 03:43, Dmitry Baryshkov wrote:
> Add base DTS file for pm8009 along with GPIOs and power-on nodes.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/pm8009.dtsi | 40 ++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/pm8009.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm8009.dtsi b/arch/arm64/boot/dts/qcom/pm8009.dtsi
> new file mode 100644
> index 000000000000..9f3e19b5bd00
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/pm8009.dtsi
> @@ -0,0 +1,40 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2017-2019, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2019, Linaro Limited

We are in 2020 :)

> + */
> +
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/interrupt-controller/irq.h>

DO you need these headers for base patch, we should add them when adding
uses of this file

> +#include <dt-bindings/spmi/spmi.h>
> +#include <dt-bindings/iio/qcom,spmi-vadc.h>

This one too

> +
> +&spmi_bus {
> +	pmic@a {
> +		compatible = "qcom,pm8009", "qcom,spmi-pmic";
> +		reg = <0xa SPMI_USID>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		power-on@800 {
> +			compatible = "qcom,pm8916-pon";
> +			reg = <0x0800>;
> +		};
> +
> +		pm8009_gpios: gpio@c000 {
> +			compatible = "qcom,pm8005-gpio";
> +			reg = <0xc000>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +	};
> +
> +	pmic@b {
> +		compatible = "qcom,pm8009", "qcom,spmi-pmic";
> +		reg = <0xb SPMI_USID>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +	};
> +};
> -- 
> 2.26.2

-- 
~Vinod
