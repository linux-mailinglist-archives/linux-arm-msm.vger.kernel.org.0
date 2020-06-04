Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2615F1EDCEE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2020 08:09:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726664AbgFDGJB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Jun 2020 02:09:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726104AbgFDGJB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Jun 2020 02:09:01 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9333C05BD43
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2020 23:09:00 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id jz3so674594pjb.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2020 23:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=pmFDoKX5wz/mBcFrTGX9SIAeZsye0K07CGwAnpg7u7g=;
        b=bYYE+woUoYsdCiappu46pprNhNhbH9gIlFZYY3fFb6uLbL0bKTfEV5aMN0VcOXP6Mx
         mq82B8KBPk1hskT6GmjRevQJnJ/tVmMrdHs9ROdYR38OF78ZKadXFbS0uxMSTfbxU2le
         Y254RUQFW7GjtQPmf81soFIQU7RseTLddpAqzWTA6qEd+iawQBZ/TplQHHDLDOVflSVw
         nSRgu8ab9vMs4pjXFk/cb44Pv+ZIaNsKOljxZKD+Szp7SWhRddDQpwr9oTbcnaPjMcDd
         CynXnMtIgX8UUXsqHZLRs72MPXoj/TzrtpL1uIlrBylr4Zf4GhDz9REIfCyaSSq7nmX6
         xEOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=pmFDoKX5wz/mBcFrTGX9SIAeZsye0K07CGwAnpg7u7g=;
        b=tXwsCr8prUwES/PoFuvG3RaEeQTIir11h4sM0H4AUzv8FS66uqaE0w1KdUhkqy/ahh
         uWqlHH/SMUBBO7wM//+VtIqB5ufHFldfUvcU3kD7VkKfDD14pOrGPpiW0mMcJye4Ahqs
         3pWoW6LpePBlIlZWNr+Ti4Xdy40sbFIo923Naj38xl1w/PFouMIUjBWLRAAi3Wbn/ciL
         y7Ypo6PDNMzsvH/RvTiQL9E7WQkugjNIJzCoFYxnb2TeAjC55VNQIRyExJHyBQebTtiZ
         AxcfCNW2vo/5iM+gx+qlRqoPICRToJMdGzFY7gfMB6yBPiK2Lw8lYhMrx7t6qW9P63BF
         hLsQ==
X-Gm-Message-State: AOAM531/6SOYicRJLuDdft1IUW1BTFp54LvfvsWlosR+eShHT9VXQ3Xk
        apvEF9Ht9Suy+mcIuKfXt3ZE
X-Google-Smtp-Source: ABdhPJxZZH4d3iwIiFJA9lcpV6nsEWxGD9GsfPdXjNbA7cZNj3hHPYEI+DWiR1ltututcddPqpxK6A==
X-Received: by 2002:a63:2257:: with SMTP id t23mr2865507pgm.245.1591250940259;
        Wed, 03 Jun 2020 23:09:00 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6e90:f3d4:c404:4d38:8396:d1ee])
        by smtp.gmail.com with ESMTPSA id 145sm3423898pfa.53.2020.06.03.23.08.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Jun 2020 23:08:59 -0700 (PDT)
Date:   Thu, 4 Jun 2020 11:38:52 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        patches@linaro.org, linaro-kernel@lists.linaro.org
Subject: Re: [PATCH 1/7] arm64: dts: qcom: pm8009: Add base dts file
Message-ID: <20200604060852.GD16719@Mani-XPS-13-9360>
References: <20200604004331.669936-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200604004331.669936-1-dmitry.baryshkov@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 04, 2020 at 03:43:25AM +0300, Dmitry Baryshkov wrote:
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

2020

> + */
> +
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/spmi/spmi.h>
> +#include <dt-bindings/iio/qcom,spmi-vadc.h>

Sort includes alphabetically.

Thanks,
Mani

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
> 
