Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF7C917E2FC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2020 16:01:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726893AbgCIPBb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Mar 2020 11:01:31 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:34902 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726891AbgCIPBb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Mar 2020 11:01:31 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1583766091; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=OfeXMwCy0tr21RuuUPUFSbLXXtySnJ162vCqOeqxiCI=; b=AGhXJCGVFsauoM4VQnsSSw/wvY0VYPrUB3OuQDKM+GqaitWpW3M5xvYOBQWLwLXuM3Z6UeES
 6WPhDBW0ryTALgeZoNnul1L2YUIP0jr0X88KdS4UceDRcVW86zEGe/BbpQ03xk4z0rja1ilQ
 +s9I8g1rSjx/3Z/P3r0Ip6ERrJA=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e665a31.7f3d35f82228-smtp-out-n03;
 Mon, 09 Mar 2020 15:01:05 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3A50FC43637; Mon,  9 Mar 2020 15:01:05 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0EE80C433CB;
        Mon,  9 Mar 2020 15:01:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0EE80C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date:   Mon, 9 Mar 2020 09:01:01 -0600
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Brian Masney <masneyb@onstation.org>
Cc:     robh+dt@kernel.org, robdclark@gmail.com, sean@poorly.run,
        devicetree@vger.kernel.org, jeffrey.l.hugo@gmail.com,
        airlied@linux.ie, linux-arm-msm@vger.kernel.org,
        smasetty@codeaurora.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        sam@ravnborg.org
Subject: Re: [Freedreno] [PATCH] dt-bindings: display: msm: gmu: move sram
 property to gpu bindings
Message-ID: <20200309150101.GA29092@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Brian Masney <masneyb@onstation.org>, robh+dt@kernel.org,
        robdclark@gmail.com, sean@poorly.run, devicetree@vger.kernel.org,
        jeffrey.l.hugo@gmail.com, airlied@linux.ie,
        linux-arm-msm@vger.kernel.org, smasetty@codeaurora.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, sam@ravnborg.org
References: <20200309111804.188162-1-masneyb@onstation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200309111804.188162-1-masneyb@onstation.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Mar 09, 2020 at 07:18:04AM -0400, Brian Masney wrote:
> The sram property was incorrectly added to the GMU binding when it
> really belongs with the GPU binding instead. Let's go ahead and
> move it.
> 
> While changes are being made here, let's update the sram property
> description to mention that this property is only valid for a3xx and
> a4xx GPUs. The a3xx/a4xx example in the GPU is replaced with what was
> in the GMU.

Thank you kindly!  I'll re-submit my stack on top of this.

Acked-by: Jordan Crouse <jcrouse@codeaurora.org>

> Signed-off-by: Brian Masney <masneyb@onstation.org>
> Fixes: 198a72c8f9ee ("dt-bindings: display: msm: gmu: add optional ocmem property")
> ---
> Background thread:
> https://lore.kernel.org/lkml/20200303170159.GA13109@jcrouse1-lnx.qualcomm.com/
> 
> I started to look at what it would take to convert the GPU bindings to
> YAML, however I am unsure of the complete list of "qcom,adreno-XYZ.W"
> compatibles that are valid.
> 
>  .../devicetree/bindings/display/msm/gmu.txt   | 51 -----------------
>  .../devicetree/bindings/display/msm/gpu.txt   | 55 ++++++++++++++-----
>  2 files changed, 42 insertions(+), 64 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/gmu.txt b/Documentation/devicetree/bindings/display/msm/gmu.txt
> index bf9c7a2a495c..90af5b0a56a9 100644
> --- a/Documentation/devicetree/bindings/display/msm/gmu.txt
> +++ b/Documentation/devicetree/bindings/display/msm/gmu.txt
> @@ -31,10 +31,6 @@ Required properties:
>  - iommus: phandle to the adreno iommu
>  - operating-points-v2: phandle to the OPP operating points
>  
> -Optional properties:
> -- sram: phandle to the On Chip Memory (OCMEM) that's present on some Snapdragon
> -        SoCs. See Documentation/devicetree/bindings/sram/qcom,ocmem.yaml.
> -
>  Example:
>  
>  / {
> @@ -67,50 +63,3 @@ Example:
>  		operating-points-v2 = <&gmu_opp_table>;
>  	};
>  };
> -
> -a3xx example with OCMEM support:
> -
> -/ {
> -	...
> -
> -	gpu: adreno@fdb00000 {
> -		compatible = "qcom,adreno-330.2",
> -		             "qcom,adreno";
> -		reg = <0xfdb00000 0x10000>;
> -		reg-names = "kgsl_3d0_reg_memory";
> -		interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
> -		interrupt-names = "kgsl_3d0_irq";
> -		clock-names = "core",
> -		              "iface",
> -		              "mem_iface";
> -		clocks = <&mmcc OXILI_GFX3D_CLK>,
> -		         <&mmcc OXILICX_AHB_CLK>,
> -		         <&mmcc OXILICX_AXI_CLK>;
> -		sram = <&gmu_sram>;
> -		power-domains = <&mmcc OXILICX_GDSC>;
> -		operating-points-v2 = <&gpu_opp_table>;
> -		iommus = <&gpu_iommu 0>;
> -	};
> -
> -	ocmem@fdd00000 {
> -		compatible = "qcom,msm8974-ocmem";
> -
> -		reg = <0xfdd00000 0x2000>,
> -		      <0xfec00000 0x180000>;
> -		reg-names = "ctrl",
> -		             "mem";
> -
> -		clocks = <&rpmcc RPM_SMD_OCMEMGX_CLK>,
> -		         <&mmcc OCMEMCX_OCMEMNOC_CLK>;
> -		clock-names = "core",
> -		              "iface";
> -
> -		#address-cells = <1>;
> -		#size-cells = <1>;
> -
> -		gmu_sram: gmu-sram@0 {
> -			reg = <0x0 0x100000>;
> -			ranges = <0 0 0xfec00000 0x100000>;
> -		};
> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/display/msm/gpu.txt b/Documentation/devicetree/bindings/display/msm/gpu.txt
> index 7edc298a15f2..fd779cd6994d 100644
> --- a/Documentation/devicetree/bindings/display/msm/gpu.txt
> +++ b/Documentation/devicetree/bindings/display/msm/gpu.txt
> @@ -35,25 +35,54 @@ Required properties:
>    bring the GPU out of secure mode.
>  - firmware-name: optional property of the 'zap-shader' node, listing the
>    relative path of the device specific zap firmware.
> +- sram: phandle to the On Chip Memory (OCMEM) that's present on some a3xx and
> +        a4xx Snapdragon SoCs. See
> +        Documentation/devicetree/bindings/sram/qcom,ocmem.yaml.
>  
> -Example 3xx/4xx/a5xx:
> +Example 3xx/4xx:
>  
>  / {
>  	...
>  
> -	gpu: qcom,kgsl-3d0@4300000 {
> -		compatible = "qcom,adreno-320.2", "qcom,adreno";
> -		reg = <0x04300000 0x20000>;
> +	gpu: adreno@fdb00000 {
> +		compatible = "qcom,adreno-330.2",
> +		             "qcom,adreno";
> +		reg = <0xfdb00000 0x10000>;
>  		reg-names = "kgsl_3d0_reg_memory";
> -		interrupts = <GIC_SPI 80 0>;
> -		clock-names =
> -		    "core",
> -		    "iface",
> -		    "mem_iface";
> -		clocks =
> -		    <&mmcc GFX3D_CLK>,
> -		    <&mmcc GFX3D_AHB_CLK>,
> -		    <&mmcc MMSS_IMEM_AHB_CLK>;
> +		interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-names = "kgsl_3d0_irq";
> +		clock-names = "core",
> +		              "iface",
> +		              "mem_iface";
> +		clocks = <&mmcc OXILI_GFX3D_CLK>,
> +		         <&mmcc OXILICX_AHB_CLK>,
> +		         <&mmcc OXILICX_AXI_CLK>;
> +		sram = <&gpu_sram>;
> +		power-domains = <&mmcc OXILICX_GDSC>;
> +		operating-points-v2 = <&gpu_opp_table>;
> +		iommus = <&gpu_iommu 0>;
> +	};
> +
> +	gpu_sram: ocmem@fdd00000 {
> +		compatible = "qcom,msm8974-ocmem";
> +
> +		reg = <0xfdd00000 0x2000>,
> +		      <0xfec00000 0x180000>;
> +		reg-names = "ctrl",
> +		            "mem";
> +
> +		clocks = <&rpmcc RPM_SMD_OCMEMGX_CLK>,
> +		         <&mmcc OCMEMCX_OCMEMNOC_CLK>;
> +		clock-names = "core",
> +		              "iface";
> +
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +
> +		gpu_sram: gpu-sram@0 {
> +			reg = <0x0 0x100000>;
> +			ranges = <0 0 0xfec00000 0x100000>;
> +		};
>  	};
>  };
>  
> -- 
> 2.24.1
> 
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
