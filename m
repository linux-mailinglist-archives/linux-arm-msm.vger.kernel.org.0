Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C96C6677C56
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jan 2023 14:21:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231602AbjAWNVP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Jan 2023 08:21:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231130AbjAWNVK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Jan 2023 08:21:10 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77A5A15C90
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 05:21:09 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id 18so14506892edw.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 05:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SBWhNhiZ4FUyAbC08QC+fGNiod2oTpvcfGBQdpI5GH8=;
        b=gyTeXRBEGBxguFTWgf7UL8BGx0FomjC8KlAWnrx/jBiVFnPYSY3QhsrVkzMVdVB4k9
         8Yd1JGHAbtD6F+APVfvoLZ4j37J3CURzskZFZhdYwxe9aMBdUU5V0A2dIbQCNVZCo5gp
         QVJMtsuouilH0bjE1DE5bKJ5C6r8Tw7FS9BcnFdNESSXeeCoflMcVs41QsSUJAqKELXE
         CmF20AZewLo+VZlwMlFjWtgDfaexMIypdlo+4EV1grwDKhjsJpj9ShuVBiiafJx+xYrX
         lQgoJdYD1WO3Hz8Tn5AZ1WCjPWSyBx9zJoLLDbhqeVSz5cWSm0MUxZ10eIqHzTm4q7mk
         /iFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SBWhNhiZ4FUyAbC08QC+fGNiod2oTpvcfGBQdpI5GH8=;
        b=1LZ/pSLq2kpvIiVJmM1mF68thDwdk1n12BReZ/CLbCJ35Ir12lml8KLFBaQ/rygZ4b
         gSUaqQOGUQSm9OZUdbWwwH80Ad3sRS6sZCmOEo7/xR8VvbsVLw3MLy/3kqBmDLY91Xr8
         pxB1QsjXS3xsHLVp5gjMys51gDpQUNC+cknJ5Ws+pT2Z0GhtU/VbZfTxPTOI6xHR2uPi
         UhVEQSqgclKbgKH/V7b8WoVBP0yb80lD64I9pAEWZ9GZ+17LRB9Nafm6xHqa50JlApRz
         X6DjBIYfYjtIf20LrSvPUg1JiWuk7uuFqHhKk7bJrKDNeYutn47ESrwMQcV2S4w+hUOH
         lCpw==
X-Gm-Message-State: AFqh2kocWnYTDw0DhwK95Lx1OVPJoFRpCh2yFMwJAo0qTTrFkh/iEUix
        oGZgtt8oEhjPV3xE2uTKth4/hw==
X-Google-Smtp-Source: AMrXdXtaIHL/o+6LVr9t758vcJAlmOPxoXCXHzMQicgRM5Ncf+nMcbd1BWxiSJJ2nvUckNjfMqAyfA==
X-Received: by 2002:a05:6402:524f:b0:49e:910:5706 with SMTP id t15-20020a056402524f00b0049e09105706mr35360367edd.2.1674480068037;
        Mon, 23 Jan 2023 05:21:08 -0800 (PST)
Received: from [192.168.1.101] (abxi24.neoplus.adsl.tpnet.pl. [83.9.2.24])
        by smtp.gmail.com with ESMTPSA id z6-20020a50cd06000000b0046267f8150csm17130853edi.19.2023.01.23.05.21.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 05:21:07 -0800 (PST)
Message-ID: <1c62001d-5e1a-d5b3-ccb2-1224424c0418@linaro.org>
Date:   Mon, 23 Jan 2023 14:21:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 2/3] ARM: dts: qcom: sdx55: Add Qcom SMMU-500 as the
 fallback for IOMMU node
Content-Language: en-US
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        andersson@kernel.org, will@kernel.org, joro@8bytes.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        dmitry.baryshkov@linaro.org, stable@vger.kernel.org
References: <20230123131931.263024-1-manivannan.sadhasivam@linaro.org>
 <20230123131931.263024-3-manivannan.sadhasivam@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230123131931.263024-3-manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 23.01.2023 14:19, Manivannan Sadhasivam wrote:
> SDX55 uses the Qcom version of the SMMU-500 IP. So use "qcom,smmu-500"
> compatible as the fallback to the SoC specific compatible.
> 
> Cc: <stable@vger.kernel.org> # 5.12
> Fixes: a2bdfdfba2af ("ARM: dts: qcom: sdx55: Enable ARM SMMU")
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm/boot/dts/qcom-sdx55.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-sdx55.dtsi b/arch/arm/boot/dts/qcom-sdx55.dtsi
> index f1c0dab40992..93d71aff3fab 100644
> --- a/arch/arm/boot/dts/qcom-sdx55.dtsi
> +++ b/arch/arm/boot/dts/qcom-sdx55.dtsi
> @@ -578,7 +578,7 @@ pil-reloc@94c {
>  		};
>  
>  		apps_smmu: iommu@15000000 {
> -			compatible = "qcom,sdx55-smmu-500", "arm,mmu-500";
> +			compatible = "qcom,sdx55-smmu-500", "qcom,smmu-500", "arm,mmu-500";
>  			reg = <0x15000000 0x20000>;
>  			#iommu-cells = <2>;
>  			#global-interrupts = <1>;
