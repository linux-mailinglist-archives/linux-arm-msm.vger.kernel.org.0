Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB16D15C37
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2019 08:02:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727926AbfEGFfy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 May 2019 01:35:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:55876 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727921AbfEGFfx (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 May 2019 01:35:53 -0400
Received: from localhost (unknown [106.200.210.185])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4BB9420C01;
        Tue,  7 May 2019 05:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1557207353;
        bh=0L4usra1BWLLoQ6Ux30TjVYIwy8g90JNMEHJnbVW2bk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FqQwOTE8wHKh1em/Zw+yqD1h4HGq9lupWbgQrz3Bm+z+RBDstmOntfkEjUs9rx3Lm
         1KMgqbvHgNrdG7Qw0Deeu4HAg+3I3eHQWYIDlxmcDAfcHhxl2UX6ZevSjoAg2Omf9z
         miHgPFGSBqPcBwBljOKqFhXBWZSaec0HfYrARRfU=
Date:   Tue, 7 May 2019 11:05:47 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Niklas Cassel <niklas.cassel@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, amit.kucheria@linaro.org,
        jorge.ramirez-ortiz@linaro.org, lina.iyer@linaro.org,
        ulf.hansson@linaro.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: qcs404: Add PSCI cpuidle support
Message-ID: <20190507053547.GE16052@vkoul-mobl>
References: <20190506193115.20909-1-niklas.cassel@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190506193115.20909-1-niklas.cassel@linaro.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06-05-19, 21:31, Niklas Cassel wrote:
> Add device bindings for CPUs to suspend using PSCI as the enable-method.
> 
> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qcs404.dtsi | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> index ffedf9640af7..f9db9f3ee10c 100644
> --- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> @@ -31,6 +31,7 @@
>  			reg = <0x100>;
>  			enable-method = "psci";
>  			next-level-cache = <&L2_0>;
> +			cpu-idle-states = <&CPU_PC>;
>  		};
>  
>  		CPU1: cpu@101 {
> @@ -39,6 +40,7 @@
>  			reg = <0x101>;
>  			enable-method = "psci";
>  			next-level-cache = <&L2_0>;
> +			cpu-idle-states = <&CPU_PC>;
>  		};
>  
>  		CPU2: cpu@102 {
> @@ -47,6 +49,7 @@
>  			reg = <0x102>;
>  			enable-method = "psci";
>  			next-level-cache = <&L2_0>;
> +			cpu-idle-states = <&CPU_PC>;
>  		};
>  
>  		CPU3: cpu@103 {
> @@ -55,12 +58,24 @@
>  			reg = <0x103>;
>  			enable-method = "psci";
>  			next-level-cache = <&L2_0>;
> +			cpu-idle-states = <&CPU_PC>;
>  		};
>  
>  		L2_0: l2-cache {
>  			compatible = "cache";
>  			cache-level = <2>;
>  		};
> +
> +		idle-states {

Since we are trying to sort the file per address and
alphabetically, it would be great if this can be moved before l2-cache
:)

Other than that this lgtm
 
> +			CPU_PC: pc {
> +				compatible = "arm,idle-state";
> +				arm,psci-suspend-param = <0x40000003>;
> +				entry-latency-us = <125>;
> +				exit-latency-us = <180>;
> +				min-residency-us = <595>;
> +				local-timer-stop;
> +			};
> +		};
>  	};
>  
>  	firmware {
> -- 
> 2.21.0

-- 
~Vinod
