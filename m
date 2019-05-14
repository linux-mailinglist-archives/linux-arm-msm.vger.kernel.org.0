Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6125B1CCA6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 May 2019 18:13:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726248AbfENQNH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 May 2019 12:13:07 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:42640 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726148AbfENQNH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 May 2019 12:13:07 -0400
Received: by mail-lf1-f68.google.com with SMTP id y13so2520426lfh.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 May 2019 09:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=XxdNcDZBC7pKWyDtBOa4HhdNtrua+nJJfFc0SM/wQOU=;
        b=NzJOMRh5YP3+bN+gG+Wp1flzGy/dzMQ1ZJkHsr7THRHC3BmvOJUSglvW79zBp3PNNq
         z0LcRK1gGnoLGaRhvN8juEOTJeMLZ5xQe5w5w10PaE3pZMUlFSej/K24RfWwm2SK5rNl
         sRYkuq0/B4R8Fotf1WDUY6s/lxyO4IhiPFT+Xop/kvXiq3jD0BD14E79Ah/dsSh9fer+
         NVhcr6wOiaOIdmymwJwz5rQOXWH6ZHzKb/KGUf8BaVFR7nppcoRduXDlFrbZsJVlHKiw
         o7fq1455b6bE8n9Qb7X9OFmWhgZoU95307lXhljCEyPZXx+sG0QS0N+TI4EDM/ndYGOm
         BQkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XxdNcDZBC7pKWyDtBOa4HhdNtrua+nJJfFc0SM/wQOU=;
        b=SAYc9MxXIcZM7Wwd1TMvDV0AFTe3iEWtgzzKSv5qdywceBIujxM1g+1kIZM+3xGsUu
         3LnLCORu5+JOJOQyxt21T3hH106eqXM2fu/Vtwp7shIS9l9SpOg1UKOCyzKQlcTraKzE
         WpzdMLKszIPD4uGmnwniTnCBe8/B1Ts4Dx1XOxQECNKSPUgFDOziVuPz1D8trQ/TR0sA
         NrTvYYvQo3whpdXLCspiLvH9V1n0eBW0NmHXfPq19yMgpfTQu9tE9haOsjYq2B95CUhj
         ZviFHnHqsWHKDguq8wqzrQCnuXvs43VlaBefH33K3UyZPKiOefx1CehFiOz0R3nzKtTj
         IDSQ==
X-Gm-Message-State: APjAAAVxou5GQiIytD6EEKKfOvg8i5oXksk+Kn3X/bICxouiMnQAqv/p
        G4FeAmBKsJUyGrnuPw0lTNwCcw==
X-Google-Smtp-Source: APXvYqyO2hCJ1b4uAFq+XiXapweKAt3aezsqaCDFEB/rHMNwzT71oiy3aRW6VZ9mr01FvySnfVZ25Q==
X-Received: by 2002:a19:e057:: with SMTP id g23mr16137295lfj.19.1557850384497;
        Tue, 14 May 2019 09:13:04 -0700 (PDT)
Received: from centauri.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id f21sm3686678ljk.94.2019.05.14.09.13.03
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 14 May 2019 09:13:03 -0700 (PDT)
Date:   Tue, 14 May 2019 18:13:01 +0200
From:   Niklas Cassel <niklas.cassel@linaro.org>
To:     Amit Kucheria <amit.kucheria@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, andy.gross@linaro.org,
        David Brown <david.brown@linaro.org>,
        Li Yang <leoyang.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        devicetree@vger.kernel.org
Subject: Re: [PATCHv1 7/8] arm64: dts: qcom: msm8998: Add PSCI cpuidle low
 power states
Message-ID: <20190514161301.GE1824@centauri.ideon.se>
References: <cover.1557486950.git.amit.kucheria@linaro.org>
 <0afe77d25490b10250f9eac4b4e92ccac8c42718.1557486950.git.amit.kucheria@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0afe77d25490b10250f9eac4b4e92ccac8c42718.1557486950.git.amit.kucheria@linaro.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, May 10, 2019 at 04:59:45PM +0530, Amit Kucheria wrote:
> Add device bindings for cpuidle states for cpu devices.
> 
> Cc: Marc Gonzalez <marc.w.gonzalez@free.fr>
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8998.dtsi | 32 +++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> index 3fd0769fe648..208281f318e2 100644
> --- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> @@ -78,6 +78,7 @@
>  			compatible = "arm,armv8";
>  			reg = <0x0 0x0>;
>  			enable-method = "psci";
> +			cpu-idle-states = <&LITTLE_CPU_PD>;
>  			efficiency = <1024>;
>  			next-level-cache = <&L2_0>;
>  			L2_0: l2-cache {
> @@ -97,6 +98,7 @@
>  			compatible = "arm,armv8";
>  			reg = <0x0 0x1>;
>  			enable-method = "psci";
> +			cpu-idle-states = <&LITTLE_CPU_PD>;
>  			efficiency = <1024>;
>  			next-level-cache = <&L2_0>;
>  			L1_I_1: l1-icache {
> @@ -112,6 +114,7 @@
>  			compatible = "arm,armv8";
>  			reg = <0x0 0x2>;
>  			enable-method = "psci";
> +			cpu-idle-states = <&LITTLE_CPU_PD>;
>  			efficiency = <1024>;
>  			next-level-cache = <&L2_0>;
>  			L1_I_2: l1-icache {
> @@ -127,6 +130,7 @@
>  			compatible = "arm,armv8";
>  			reg = <0x0 0x3>;
>  			enable-method = "psci";
> +			cpu-idle-states = <&LITTLE_CPU_PD>;
>  			efficiency = <1024>;
>  			next-level-cache = <&L2_0>;
>  			L1_I_3: l1-icache {
> @@ -142,6 +146,7 @@
>  			compatible = "arm,armv8";
>  			reg = <0x0 0x100>;
>  			enable-method = "psci";
> +			cpu-idle-states = <&BIG_CPU_PD>;
>  			efficiency = <1536>;
>  			next-level-cache = <&L2_1>;
>  			L2_1: l2-cache {
> @@ -161,6 +166,7 @@
>  			compatible = "arm,armv8";
>  			reg = <0x0 0x101>;
>  			enable-method = "psci";
> +			cpu-idle-states = <&BIG_CPU_PD>;
>  			efficiency = <1536>;
>  			next-level-cache = <&L2_1>;
>  			L1_I_101: l1-icache {
> @@ -176,6 +182,7 @@
>  			compatible = "arm,armv8";
>  			reg = <0x0 0x102>;
>  			enable-method = "psci";
> +			cpu-idle-states = <&BIG_CPU_PD>;
>  			efficiency = <1536>;
>  			next-level-cache = <&L2_1>;
>  			L1_I_102: l1-icache {
> @@ -191,6 +198,7 @@
>  			compatible = "arm,armv8";
>  			reg = <0x0 0x103>;
>  			enable-method = "psci";
> +			cpu-idle-states = <&BIG_CPU_PD>;
>  			efficiency = <1536>;
>  			next-level-cache = <&L2_1>;
>  			L1_I_103: l1-icache {
> @@ -238,6 +246,30 @@
>  				};
>  			};
>  		};
> +
> +		idle-states {
> +			entry-method="psci";

Please add a space before and after "=".

> +
> +			LITTLE_CPU_PD: little-power-down {

In Documentation/devicetree/bindings/arm/idle-states.txt
they seem to use labels such as CPU_SLEEP_0_0 for the first
cluster and CPU_SLEEP_1_0 for the second cluster.

Please also consider my comment in patch 4/8.

> +				compatible = "arm,idle-state";
> +				idle-state-name = "little-power-down";

Since all other idle-state-name in this series uses the qualcomm
terminology for idle states, I think this should as well.

> +				arm,psci-suspend-param = <0x00000002>;

PSCI suspend param 0x2 is actually "retention":
https://source.codeaurora.org/quic/la/kernel/msm-4.4/tree/arch/arm/boot/dts/qcom/msm8998-pm.dtsi?h=msm-4.4#n155

So it actually feels incorrect to call this "power-down".

All other patches in this series has added support for standalone power
collapse, so why not add support for SPC rather than retention?

(For SPC arm,psci-suspend-param should be <0x40000003> .)

> +				entry-latency-us = <43>;
> +				exit-latency-us = <43>;

Shouldn't the latency be <86> ?
https://source.codeaurora.org/quic/la/kernel/msm-4.4/tree/arch/arm/boot/dts/qcom/msm8998-pm.dtsi?h=msm-4.4#n157
AFAICT downstream assigns the exit_latency to what is parses from "qcom,latency-us":
https://source.codeaurora.org/quic/la/kernel/msm-4.4/tree/drivers/cpuidle/lpm-levels.c?h=msm-4.4#n1712

> +				min-residency-us = <200>;
> +				local-timer-stop;

Are you sure that the local timer is stopped?
the equivalent DT property to "local-timer-stop" in downstream is
"qcom,use-broadcast-timer", and this property seems to be missing
from this node:
https://source.codeaurora.org/quic/la/kernel/msm-4.4/tree/arch/arm/boot/dts/qcom/msm8998-pm.dtsi?h=msm-4.4#n153

You could try to remove "local-timer-stop", if it is really needed,
then the system should hang without this property.

> +			};
> +
> +			BIG_CPU_PD: big-power-down {
> +				compatible = "arm,idle-state";
> +				idle-state-name = "big-power-down";
> +				arm,psci-suspend-param = <0x00000002>;
> +				entry-latency-us = <41>;
> +				exit-latency-us = <41>;
> +				min-residency-us = <200>;
> +				local-timer-stop;
> +			};
> +		};
>  	};
>  
>  	firmware {
> -- 
> 2.17.1
> 
