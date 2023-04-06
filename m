Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 939376DA352
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Apr 2023 22:35:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239479AbjDFUfY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Apr 2023 16:35:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239602AbjDFUev (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Apr 2023 16:34:51 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 168FDCA20
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Apr 2023 13:32:48 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id g29so2466009lfj.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Apr 2023 13:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680813167;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sSjbkEzdKUWsxqf6FTHcvALXYuTkKMbJioNVsbzVNEU=;
        b=qp8NnOfZKpCHKk8L2hKR8i9dYAHN2EZ2svldCyg2eeBIOXlsZSaX6p57jM626kyski
         67h+ko4l2EL6sIK0WZKj0snJtiIDASo5vYCQZpzBrkU4HbSzQ4aE8NxYEDLg7vtS3mv+
         8Pw3J/6RemAjrtcML8yEFNMThSXnB3JRjzBjpILjcqeRdq32toDe7vMEUVHvRjc4+OZR
         jPn6WGJbt3oj9w8Pk2rOR7/qMcQiCasVLUX9TQyDdxW0boGg121S+/C8rXOMbdAd0hhs
         tztaiEcu5LrcnBHmE390rW95lALNvDQw4D0LEBTRMIMAeHk9oyWvH4t0sGBGAR/l0Iao
         56Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680813167;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sSjbkEzdKUWsxqf6FTHcvALXYuTkKMbJioNVsbzVNEU=;
        b=ZkqYB3uBap/d2QilX/je0kGiTid4PV1zfZLG6i2hTrFgqPYSuNODL+xWCU/LwoF8T8
         5ez8ZajIgIDJqjZWO8G2Z64ILqrW4b2JsHJXMaAr5B3xppVDvxmHNkosZroQ0438iWII
         WWw+YR3ba02MI5s0ud6p/0KcHfd5P7D7GgJkpwM3VOGGEWyjSU47XUoQ21+SZ14wmpPV
         FCNlzxKbQwKfOKalh7ofH/qyIkJPiMTKQSvVkBznhkXnYDcT75HAduCRHjWydawJyN5r
         MUchASqDlBmAj2RgF8PrcAGE/7zmE8Qu9jD4sbWiojosdx8jlO6cYkWbqpapJj0MfJ9C
         M74g==
X-Gm-Message-State: AAQBX9fJyKnudtJTEKe2o7gjyZZsmrSA8KTcTp677sb/Vj1/kYHLrj30
        1e5PUKSgos6NfwZbvcwyNRVj+w==
X-Google-Smtp-Source: AKy350YJueL7oZdOLdSHwjpRBL3LiGsVJ4lWEGJEmOWeQiK4kV4iErvQSXFyq9sCNydPmo8t+6MeXw==
X-Received: by 2002:ac2:46d6:0:b0:4ec:363a:5f17 with SMTP id p22-20020ac246d6000000b004ec363a5f17mr84297lfo.21.1680813167082;
        Thu, 06 Apr 2023 13:32:47 -0700 (PDT)
Received: from [192.168.1.101] (abxh37.neoplus.adsl.tpnet.pl. [83.9.1.37])
        by smtp.gmail.com with ESMTPSA id v3-20020ac25923000000b004eaef4b51dasm408338lfi.107.2023.04.06.13.32.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 13:32:46 -0700 (PDT)
Message-ID: <57cf27c5-be4e-976e-bc3c-fee046b079e7@linaro.org>
Date:   Thu, 6 Apr 2023 22:32:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 7/7] arm64: dts: qcom: sa8775p: add the GPU IOMMU node
Content-Language: en-US
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20230406200723.552644-1-brgl@bgdev.pl>
 <20230406200723.552644-8-brgl@bgdev.pl>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230406200723.552644-8-brgl@bgdev.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 6.04.2023 22:07, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Add the GPU IOMMU for sa8775p-based platforms.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 36 +++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> index f799cb5abb87..f46c1a73abdb 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> @@ -7,6 +7,7 @@
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/clock/qcom,rpmh.h>
>  #include <dt-bindings/clock/qcom,sa8775p-gcc.h>
> +#include <dt-bindings/clock/qcom,sa8775p-gpucc.h>
>  #include <dt-bindings/interconnect/qcom,sa8775p-rpmh.h>
>  #include <dt-bindings/power/qcom-rpmpd.h>
>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
> @@ -605,6 +606,41 @@ gpucc: clock-controller@3d90000 {
>  			#power-domain-cells = <1>;
>  		};
>  
> +		kgsl_smmu: iommu@3da0000 {
> +			compatible = "qcom,sa8775p-smmu-500", "qcom,smmu-500", "arm,mmu-500";
No "qcom,adreno"? Does this one not support per-process pagetables?
Do you have a working GPU setup to confirm that?

Konrad
> +			reg = <0x0 0x03da0000 0x0 0x20000>;
> +			#iommu-cells = <2>;
> +			#global-interrupts = <2>;
> +			dma-coherent;
> +			power-domains = <&gpucc GPU_CC_CX_GDSC>;
> +			clocks = <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
> +				 <&gcc GCC_GPU_SNOC_DVM_GFX_CLK>,
> +				 <&gpucc GPU_CC_AHB_CLK>,
> +				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>,
> +				 <&gpucc GPU_CC_CX_GMU_CLK>,
> +				 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
> +				 <&gpucc GPU_CC_HUB_AON_CLK>;
> +			clock-names = "gcc_gpu_memnoc_gfx_clk",
> +				      "gcc_gpu_snoc_dvm_gfx_clk",
> +				      "gpu_cc_ahb_clk",
> +				      "gpu_cc_hlos1_vote_gpu_smmu_clk",
> +				      "gpu_cc_cx_gmu_clk",
> +				      "gpu_cc_hub_cx_int_clk",
> +				      "gpu_cc_hub_aon_clk";
> +			interrupts = <GIC_SPI 673 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 674 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 678 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 679 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 680 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 681 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 682 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 683 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 684 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>;
> +		};
> +
>  		pdc: interrupt-controller@b220000 {
>  			compatible = "qcom,sa8775p-pdc", "qcom,pdc";
>  			reg = <0x0 0x0b220000 0x0 0x30000>,
