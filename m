Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A725B339518
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Mar 2021 18:37:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231855AbhCLRgw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Mar 2021 12:36:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232487AbhCLRgs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Mar 2021 12:36:48 -0500
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAC5AC061574
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Mar 2021 09:36:47 -0800 (PST)
Received: by mail-oi1-x229.google.com with SMTP id d16so18324670oic.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Mar 2021 09:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=PlLmskPyjy9P85aN3TChCWZ2X95aJr2nN4YxhPO7zSY=;
        b=N+yTbPDdF2d7xD3C5ns6YPZ9aN8B6x0KUBg0e7dg9kgsbg8CYSYmojVLLqqprM6WXg
         Kd4E3NGHewuM1fXhGPlkQcynPn7KsHoA4SJekIuSMsu/shUU1qTSKYDtuEoZg8Oi2Etv
         iJ4fqCJFBulshemAmIA0rZkgzSbsLrwz24sES5R9aiWuWgYJVq7w9E3xn3z4AkU3t+Uc
         88LSJ3YWwDGVf5kggDlH7jTffgsykN5ygudDLLMhk6n7K4VEu01dr+CQSyTJaQ/pKw3A
         mkdcXlGYcQ8rVb4gzo4EyiuPD1kM3tIVVTOlSAsS2BTAoBNwjrLA2L71k9JtXEfmU+iS
         VbcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PlLmskPyjy9P85aN3TChCWZ2X95aJr2nN4YxhPO7zSY=;
        b=NHnm9Fs1s7UmH8e5BANSTK+QdxH4PD3G1+sfcRWP0GfPvBb9xfDG3D40go/+lnoIua
         hPGdW1p7AaP9QqjI1TwJBOrwjJITWEqZgNKywJ+euWofrKmytddrTbAfX2q2UEoruADH
         qp0ZXcgFV6ntqls1bMwzkPJWAImNnd21nqRGH3GLbdpZDgha/nOvknoxmz0OlfenqynQ
         YKjUDGp54miE6+wi8NmbdnXu1eB9pBYg4SS+OglY0AydMrWgmLgkhjFzACt3yOw1F5Aw
         wy2uVhrLGk2yaapmIcRNAEHbcg99vNdj7cSvErmIXfUnmutf0/AMXCo02Z+3OIbFi0zy
         jqPg==
X-Gm-Message-State: AOAM531U1MUcg3+285K5N7YiuM7Yyadpa9EOdSt1oPGv88jsygQzVxpl
        n2AHd725SaGMEUYD0EYZ/HeFNQ==
X-Google-Smtp-Source: ABdhPJwmX6nL4RGdrLNt/XYs8+aKXuTCyAZQdiJgTljGF8P6R1B1SYAT1dd/vS8qCPToUKYTwE8ghg==
X-Received: by 2002:aca:1c14:: with SMTP id c20mr6108079oic.146.1615570607262;
        Fri, 12 Mar 2021 09:36:47 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 7sm1564385otd.46.2021.03.12.09.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 09:36:46 -0800 (PST)
Date:   Fri, 12 Mar 2021 11:36:45 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     satya priya <skakit@codeaurora.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kgunda@codeaurora.org
Subject: Re: [PATCH] arm64: dts: qcom: sc7280: Add PMIC peripherals for SC7280
Message-ID: <YEumre0+KKxZ0p6Z@builder.lan>
References: <1615459229-27573-1-git-send-email-skakit@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1615459229-27573-1-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 11 Mar 04:40 CST 2021, satya priya wrote:

> Add PM7325/PM8350C/PMK8350/PMR735A peripherals such as PON,
> GPIOs, RTC and other PMIC infra modules for SC7280.
> 

Overall this looks good, just two small things below.

> Signed-off-by: satya priya <skakit@codeaurora.org>
> ---
> This patch depends on base DT and board files for SC7280 to merge first
> https://lore.kernel.org/patchwork/project/lkml/list/?series=487403
> 
>  arch/arm64/boot/dts/qcom/pm7325.dtsi  |  60 ++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/pm8350c.dtsi |  60 ++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/pmk8350.dtsi | 104 ++++++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/pmr735a.dtsi |  60 ++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sc7280.dtsi  |   8 +++
>  5 files changed, 292 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/pm7325.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/pm8350c.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/pmk8350.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/pmr735a.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm7325.dtsi b/arch/arm64/boot/dts/qcom/pm7325.dtsi
> new file mode 100644
> index 0000000..393b256
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/pm7325.dtsi
> @@ -0,0 +1,60 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +// Copyright (c) 2021, The Linux Foundation. All rights reserved.
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/spmi/spmi.h>
> +
> +&spmi_bus {
> +	pm7325: pmic@1 {
> +		compatible = "qcom,pm7325", "qcom,spmi-pmic";
> +		reg = <0x1 SPMI_USID>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		pm7325_tz: temp-alarm@a00 {
> +			compatible = "qcom,spmi-temp-alarm";
> +			reg = <0xa00>;
> +			interrupts = <0x1 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
> +			#thermal-sensor-cells = <0>;
> +		};
> +
> +		pm7325_gpios: gpios@8800 {
> +			compatible = "qcom,pm7325-gpio", "qcom,spmi-gpio";
> +			reg = <0x8800>;
> +			gpio-controller;
> +			gpio-ranges = <&pm7325_gpios 0 0 10>;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +	};
> +};
> +
> +&thermal_zones {
> +	pm7325_temp_alarm: pm7325_tz {

'_' is not allowed to be used in node names, there's a few of these
sprinkled through the patch. Please replace them with '-'.

> +		polling-delay-passive = <100>;
> +		polling-delay = <0>;
> +		thermal-governor = "step_wise";
> +		thermal-sensors = <&pm7325_tz>;
> +
> +		trips {
> +			pm7325_trip0: trip0 {
> +				temperature = <95000>;
> +				hysteresis = <0>;
> +				type = "passive";
> +			};
> +
> +			pm7325_trip1: trip1 {
> +				temperature = <115000>;
> +				hysteresis = <0>;
> +				type = "critical";
> +			};
> +
> +			pm7325_trip2: trip2 {
> +				temperature = <145000>;
> +				hysteresis = <0>;
> +				type = "critical";
> +			};
> +		};
> +	};
> +};
[..]
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 8af6d77..25402d4 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -606,4 +606,12 @@
>  			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
>  			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
>  	};
> +
> +	thermal_zones: thermal-zones {
> +	};
>  };
> +
> +#include "pm7325.dtsi"
> +#include "pm8350c.dtsi"
> +#include "pmk8350.dtsi"
> +#include "pmr735a.dtsi"

Is there any particular reason for you including these at the end of
sc7270.dtsi, rather than the top like we do in other platforms?

Also, are all SC7280 devices always coming with this quartet? We've seen
variations of this in the past and therefor typically include them from
the board dts instead.

Regards,
Bjorn
