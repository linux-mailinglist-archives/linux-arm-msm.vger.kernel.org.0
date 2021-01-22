Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11895300C3C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Jan 2021 20:22:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729527AbhAVSmZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Jan 2021 13:42:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729812AbhAVSe1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Jan 2021 13:34:27 -0500
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EBDFC06174A
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Jan 2021 10:33:47 -0800 (PST)
Received: by mail-ot1-x330.google.com with SMTP id h14so6021356otr.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Jan 2021 10:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BGdZZQdO5GYKrOrvehghjSQ4V1yqSwKxYcFHxLWrOqo=;
        b=KkZ+KHxmVS71uZzOuuewbQScfGluCU0Dw3h5fwwJtUP8XmzH+/ZcFPu2UVU//45d1O
         0f/gUpkOTNRW0OoqHNfK/HsxKFSnuPgiITp3aZeB2E0ugvXgH43riU7NESg2c9I2WxgN
         EOMfHtvCia3DwmGfF7Uc8SOJ2qbyXZ8pmUYjqSPUOKH5+bEIJpBMqMsHTExh9F0cuzK2
         kW/Y+WeWCKvGTpjs5RgcvJHRYIrsQJAPOjkDZk8UQScZO+fJ7PbkCG1B0OwPOZoJ5CvF
         qVabXgPRYx7VbeczAZ4Uq2KnxZTWd3VFY39b/37J5b0Ki4Voz+RCIKRJHo/AUMKjHUgQ
         tn3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BGdZZQdO5GYKrOrvehghjSQ4V1yqSwKxYcFHxLWrOqo=;
        b=aaR73PpGwGF1GBGMh12BJNPQdFaZpfSvULlLYA6iO4rGSwzPOYPltwtZ0nP2Z7mT1m
         jsPB7cbg4UCvQTtlrHgW92BB2ZVzs18oQAtsbn3VHdmM5i01VR+UnLSnvyZ46C/ghlXA
         jbou0LvwUyleHYcGqB2rUX77lYn1/Eqq8TqvZV3YOEUdHoJBcwHE3leiefinqxGcL7/5
         ce+Fq9rgWiIXkE8Qs+yD1Vbjj+mdDqLk6SYr5sig/mS4/CCFvh5xnpM2lhOzRksRm/7M
         fauNLMZ7lWP0BXYj4r52kait4vE5bmbNa+Xiwo0nYHhvESwDVqd5OrqvuQrUNimiJKL9
         4vhA==
X-Gm-Message-State: AOAM533r4K6wG9NBOsGLGVr8PJWjJ0JxfR4scv3IxpU/DrylOnOFJCsL
        a41J7u+gQMigLeSc67UmoX2gdElvaxK/Eg==
X-Google-Smtp-Source: ABdhPJyWmLCUFN3gHBzs5pDWFGc+awTg39pglBJu5VX0/iaLiIQ/lGK2sFjn5nPabZgQIspc7OYqIw==
X-Received: by 2002:a9d:64cd:: with SMTP id n13mr4240417otl.113.1611340426984;
        Fri, 22 Jan 2021 10:33:46 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id e20sm1554660otr.14.2021.01.22.10.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jan 2021 10:33:46 -0800 (PST)
Date:   Fri, 22 Jan 2021 12:33:44 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Iskren Chernev <iskren.chernev@gmail.com>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Brian Masney <masneyb@onstation.org>
Subject: Re: [PATCH 1/4] ARM: dts: qcom: msm8974: add gpu support
Message-ID: <YAsaiBr1JTlFhMAy@builder.lan>
References: <20201230155132.3661292-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201230155132.3661292-1-iskren.chernev@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 30 Dec 09:51 CST 2020, Iskren Chernev wrote:

> From: Brian Masney <masneyb@onstation.org>
> 
> Add support for the a3xx GPU
> 
> Signed-off-by: Brian Masney <masneyb@onstation.org>

As discussed on IRC I'm waiting for a respin of this with your S-o-b
added after Brian's.

Thanks,
Bjorn

> ---
>  arch/arm/boot/dts/qcom-msm8974.dtsi | 45 +++++++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
> index 51f5f904f9eb9..c399446d8154e 100644
> --- a/arch/arm/boot/dts/qcom-msm8974.dtsi
> +++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
> @@ -1399,6 +1399,51 @@ cnoc: interconnect@fc480000 {
>  			         <&rpmcc RPM_SMD_CNOC_A_CLK>;
>  		};
>  
> +		gpu_opp_table: opp_table {
> +			status = "disabled";
> +
> +			compatible = "operating-points-v2";
> +
> +			opp-800000000 {
> +				opp-hz = /bits/ 64 <800000000>;
> +			};
> +
> +			opp-500000000 {
> +				opp-hz = /bits/ 64 <500000000>;
> +			};
> +
> +			opp-275000000 {
> +				opp-hz = /bits/ 64 <275000000>;
> +			};
> +		};
> +
> +		gpu: adreno@fdb00000 {
> +			status = "disabled";
> +
> +			compatible = "qcom,adreno-330.2",
> +			             "qcom,adreno";
> +			reg = <0xfdb00000 0x10000>;
> +			reg-names = "kgsl_3d0_reg_memory";
> +			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "kgsl_3d0_irq";
> +			clock-names = "core",
> +			              "iface",
> +			              "mem_iface";
> +			clocks = <&mmcc OXILI_GFX3D_CLK>,
> +			         <&mmcc OXILICX_AHB_CLK>,
> +			         <&mmcc OXILICX_AXI_CLK>;
> +			sram = <&gmu_sram>;
> +			power-domains = <&mmcc OXILICX_GDSC>;
> +			operating-points-v2 = <&gpu_opp_table>;
> +
> +			interconnects = <&mmssnoc MNOC_MAS_GRAPHICS_3D &bimc BIMC_SLV_EBI_CH0>,
> +			                <&ocmemnoc OCMEM_VNOC_MAS_GFX3D &ocmemnoc OCMEM_SLV_OCMEM>;
> +			interconnect-names = "gfx-mem",
> +			                     "ocmem";
> +
> +			// iommus = <&gpu_iommu 0>;
> +		};
> +
>  		mdss: mdss@fd900000 {
>  			status = "disabled";
>  
> 
> base-commit: d7a03a44a5e93f39ece70ec75d25c6088caa0fdb
> prerequisite-patch-id: aba6f684932cab35d98457c21e4ff7a5ac75c753
> prerequisite-patch-id: 4884d57df1bd197896b69e115d9002d6c26ae2e2
> prerequisite-patch-id: 4f1aba3c3675236b18578eedbe71b0cdca01ed77
> prerequisite-patch-id: cbfe6ccfebb142370baff15bbdf3cf2f34ee77df
> -- 
> 2.29.2
> 
