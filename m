Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEA72202C6E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Jun 2020 21:36:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730196AbgFUTgw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 21 Jun 2020 15:36:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730085AbgFUTgw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 21 Jun 2020 15:36:52 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E74B7C061794
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2020 12:36:50 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id u8so6994439pje.4
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2020 12:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=GiPGL0KixKUZEggpcuvnQ2W4jyDXzf9YcPGFlK/W3KA=;
        b=mbLfBZteetG2m1x8jSaFUqIQpyGg40cM84u39l8cX7hR6xz2ZSWD2GpPkk3gy7uvVs
         Y0HCiz068zxERkQJmb7t18S4KBxpXmwna2UOlB8WJjRvsU99Vp7M10S7zoR9AksTKUEX
         tdXQDMHvGjuXWS1iWrMvhh7vZT+XODAt5Zm0OQQOU0aLrlp4yKYvHEVG79+2PXBaJKKo
         Zj+fA7hoE98lWfC0mOnfH6l76yeS2FhlGJFzcZzLDxsKrdR/6Cpd1KX747xN00QlwtUb
         oNF+2wvCAFb2+UpVuWqWoQX0Eu/UIYKB+wBlFbTcqT396qta9irbWLdheQp9QQ2m07yi
         QaTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GiPGL0KixKUZEggpcuvnQ2W4jyDXzf9YcPGFlK/W3KA=;
        b=gUVWAb4qFdSQK7YCRuhAXxzHDdZjeltULppvE6Dyv1018AggxEC9R/8LnoGU3zavSZ
         H43w1Mq8iFvCBYRzq+hQUWGfKbTyxiAmnCxk4olyMnUQL3rixrtmrqXsRwDJboMlC884
         E878t8A0hFPY+9c/vFGE74Y9AceAhi4pyEhv8ohdcoFEFkVPUJMAuCPU7uv3KkKDH+fR
         SU/+AUJVazj+KJ3q7ZTuJ0qRWLc9CuBaa9X9ORDzauzSEDrEByQl5zNh660OZ5Fhd19I
         ofVrOUaFf64jjsvKEXrHrNdXS6v5gxxHHU8TcJgCO0TgB7pSG9/f+lecCPjKRPMBgJvT
         vlkw==
X-Gm-Message-State: AOAM530bgDcaKcAaI914AtjqRIZU5H+lt3aZR2Xy8gSjnk2g412zBkiV
        CzXx4Qd16TRktYsT6q0Qzj7A4g==
X-Google-Smtp-Source: ABdhPJw1I8d+Aq3dTSSP13wu3UUzyuDeXX60UifmfZwWlP0no7eMkGik08Na+mB+kLZIJwFQz5LNaw==
X-Received: by 2002:a17:90a:4d09:: with SMTP id c9mr14957628pjg.137.1592768210427;
        Sun, 21 Jun 2020 12:36:50 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id k126sm11807514pfd.129.2020.06.21.12.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2020 12:36:49 -0700 (PDT)
Date:   Sun, 21 Jun 2020 12:34:03 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH 1/3] arm64: dts: qcom: pm8009: Add base dts file
Message-ID: <20200621193403.GM128451@builder.lan>
References: <20200621192824.2069145-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200621192824.2069145-1-dmitry.baryshkov@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun 21 Jun 12:28 PDT 2020, Dmitry Baryshkov wrote:

> Add base DTS file for pm8009 along with GPIOs and power-on nodes.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

I took the liberty of adding a pm8009_pon label to the pon node, then
applied the three patches.

Thanks,
Bjorn

> ---
>  arch/arm64/boot/dts/qcom/pm8009.dtsi | 37 ++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/pm8009.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm8009.dtsi b/arch/arm64/boot/dts/qcom/pm8009.dtsi
> new file mode 100644
> index 000000000000..cb1a10e72474
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/pm8009.dtsi
> @@ -0,0 +1,37 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2017-2019, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2020, Linaro Limited
> + */
> +
> +#include <dt-bindings/spmi/spmi.h>
> +
> +&spmi_bus {
> +	pmic@a {
> +		compatible = "qcom,pm8009", "qcom,spmi-pmic";
> +		reg = <0xa SPMI_USID>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		pon@800 {
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
> 2.27.0
> 
