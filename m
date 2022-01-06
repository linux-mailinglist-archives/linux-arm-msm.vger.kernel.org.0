Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46115486DD4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jan 2022 00:35:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245596AbiAFXfL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jan 2022 18:35:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245495AbiAFXfL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jan 2022 18:35:11 -0500
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B8F7C061245
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jan 2022 15:35:11 -0800 (PST)
Received: by mail-oi1-x230.google.com with SMTP id u21so5921931oie.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jan 2022 15:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=k+AXXTXFi1cWIEwtg73aFjj3MfoRkcbinIzxQo9/DOY=;
        b=MA3EeJeLnwvymvy4Qt2JImgfM9yMQRPtdNStEtT6cC0NkKPGG9e/Ypj4Qb0xB5+rjw
         T+sGqYHDW3hl92IIENMquMHcDvtkepaFQYhj4YDOQCO+j4SeJzH84VSpGaQCb1nQqLOA
         UKoGOUWX+fT2oul0+uBLhfJyNFNDGBv5F62y1KXAk8XO3HRvk6MjnapTSXT+946MLe0b
         gAv1QqG3X0Qsgb8p5HpGcJFtDbE2gSs+lC327/XZiomVQrofHFofOy5v6MZiRgI4PmP8
         Kkvra88lb8vS+GG5s5W4EGcP2LSMUn4Udj/QxwD3beLSLE2lqHPAM3T7WvmXjTZPRyJH
         EZdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=k+AXXTXFi1cWIEwtg73aFjj3MfoRkcbinIzxQo9/DOY=;
        b=gwbx/R+8iJxQZddPMsejnrrjdyeCQyFPP2di6iD3zxjXS6wt9E857awLHKSyCmu6X6
         GiVON1WbzxaqVMTEXUxH77WEfpg/ye1Tu1C7ezYemxdWYk1J5MvFHZEzxo3PYrh2KvbO
         ogKg960nQlmd7Nz+vTHd+voVVxbhDZ/5XDSP5tqa3PsCl8w1vgVHJ0zV62OKosvurE51
         ABcXbq7bxEOUq+RMqo225pWXUVd4RfQFD7J65AGSNpOUOhmDRyoYJ8CyxGEJZbwBoqYF
         vXsl6XlFz1JLj74swHxweMcNLwpL5E4QxorCORg28i8pvc76wpsaDEb9H4DoLsHnecXu
         ujWQ==
X-Gm-Message-State: AOAM531XMPfg+iB5z4U9EG5BTColPiZpBMQcYFGhaUlwt4EzrsWLHMc0
        t45E4OftFxOEhkYpTzSGpIvTrw==
X-Google-Smtp-Source: ABdhPJwaRRGMTpfWmpeUEfMfF32qW3dxW25CH6zMJn7uOynq8j1EabTLXGE8CMUDX9UanXZZj4eytw==
X-Received: by 2002:aca:1811:: with SMTP id h17mr7451667oih.178.1641512110515;
        Thu, 06 Jan 2022 15:35:10 -0800 (PST)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id h14sm633673ots.48.2022.01.06.15.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jan 2022 15:35:10 -0800 (PST)
Date:   Thu, 6 Jan 2022 15:35:59 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Thara Gopinath <thara.gopinath@linaro.org>,
        daniel.lezcano@linaro.org
Cc:     agross@kernel.org, rafael@kernel.org, rui.zhang@intel.com,
        robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [Patch v3 2/3] arm64: dts: qcom: sm8150: Add support for LMh node
Message-ID: <Ydd839Wu1Gm4bWpm@ripper>
References: <20220106173138.411097-1-thara.gopinath@linaro.org>
 <20220106173138.411097-3-thara.gopinath@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220106173138.411097-3-thara.gopinath@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 06 Jan 09:31 PST 2022, Thara Gopinath wrote:

> Add LMh nodes for cpu cluster0 and cpu cluster1 for sm8150 SoC.
> 
> Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Daniel, will you please apply patch 1 and 3 through your tree and I can
take this through the qcom dts tree.

Thanks,
Bjorn

> ---
>  arch/arm64/boot/dts/qcom/sm8150.dtsi | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> index 81b4ff2cc4cd..e755d7ab78dd 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> @@ -3650,6 +3650,30 @@ cpufreq_hw: cpufreq@18323000 {
>  			#freq-domain-cells = <1>;
>  		};
>  
> +		lmh_cluster1: lmh@18350800 {
> +			compatible = "qcom,sm8150-lmh";
> +			reg = <0 0x18350800 0 0x400>;
> +			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
> +			cpus = <&CPU4>;
> +			qcom,lmh-temp-arm-millicelsius = <60000>;
> +			qcom,lmh-temp-low-millicelsius = <84500>;
> +			qcom,lmh-temp-high-millicelsius = <85000>;
> +			interrupt-controller;
> +			#interrupt-cells = <1>;
> +		};
> +
> +		lmh_cluster0: lmh@18358800 {
> +			compatible = "qcom,sm8150-lmh";
> +			reg = <0 0x18358800 0 0x400>;
> +			interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
> +			cpus = <&CPU0>;
> +			qcom,lmh-temp-arm-millicelsius = <60000>;
> +			qcom,lmh-temp-low-millicelsius = <84500>;
> +			qcom,lmh-temp-high-millicelsius = <85000>;
> +			interrupt-controller;
> +			#interrupt-cells = <1>;
> +		};
> +
>  		wifi: wifi@18800000 {
>  			compatible = "qcom,wcn3990-wifi";
>  			reg = <0 0x18800000 0 0x800000>;
> -- 
> 2.25.1
> 
