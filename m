Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEEB03877FC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 May 2021 13:46:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235410AbhERLrv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 May 2021 07:47:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:50876 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232135AbhERLrt (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 May 2021 07:47:49 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id AB5C7610A2;
        Tue, 18 May 2021 11:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621338391;
        bh=Uk3gHUW5zi9CCNFwp0l3AxYfgyCz4q5TPSLgkmzh6gg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sfM+wwAp96QNkMIfQmlUifqiyRyMmXYn1bn7m+dK0G6teryiCnB5rbYLBJXn9hHdW
         dDDSXtReCFvTBnVT2RpxfNdxnqE7MGw40GkPY/2ttHdmviGjtU02qaQGsJXt6pyGqB
         0TgyiZfZiPOcEHFyNcvvXJ0xXuRDj25g34o7+GHvIuYXmYQPrJEkiEViL38eBv7HAv
         Gc9WEP2LY8OXzv11Xkb7bjiuqthmlkp5m6MtqZ+t7LbznHJc6ozoc7CKKVD0V284Tx
         wV/EZqmvowx3AlZ33WvLXWaqhh18ePtuSJe/xAxMa3ShLeT0Qx99JsT5m5GhGvXnqh
         nNqYp/n4K1W6A==
Date:   Tue, 18 May 2021 17:16:27 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     satya priya <skakit@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, mka@chromium.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kgunda@codeaurora.org
Subject: Re: [RESEND PATCH V4 3/8] arm64: dts: qcom: pm7325: Add pm7325 base
 dts file
Message-ID: <YKOpE1V25rdDj4Tk@vkoul-mobl.Dlink>
References: <1621318822-29332-1-git-send-email-skakit@codeaurora.org>
 <1621318822-29332-4-git-send-email-skakit@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1621318822-29332-4-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18-05-21, 11:50, satya priya wrote:
> Add base DTS file for pm7325 along with GPIOs and temp-alarm nodes.
> 
> Signed-off-by: satya priya <skakit@codeaurora.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> ---
> Changes in RESEND V4:
>  - No Changes.
> 
>  arch/arm64/boot/dts/qcom/pm7325.dtsi | 53 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/pm7325.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm7325.dtsi b/arch/arm64/boot/dts/qcom/pm7325.dtsi
> new file mode 100644
> index 0000000..e7f64a9
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/pm7325.dtsi
> @@ -0,0 +1,53 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +// Copyright (c) 2021, The Linux Foundation. All rights reserved.
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/spmi/spmi.h>
> +
> +&spmi_bus {
> +	pm7325: pmic@1 {
> +		compatible = "qcom,pm7325", "qcom,spmi-pmic";

where is qcom,pm7325 documented?

> +		reg = <0x1 SPMI_USID>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		pm7325_temp_alarm: temp-alarm@a00 {
> +			compatible = "qcom,spmi-temp-alarm";
> +			reg = <0xa00>;
> +			interrupts = <0x1 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
> +			#thermal-sensor-cells = <0>;
> +		};
> +
> +		pm7325_gpios: gpios@8800 {
> +			compatible = "qcom,pm7325-gpio", "qcom,spmi-gpio";

where is qcom,pm7325-gpio documented?

> +			reg = <0x8800>;
> +			gpio-controller;
> +			gpio-ranges = <&pm7325_gpios 0 0 10>;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +	};
> +};

-- 
~Vinod
