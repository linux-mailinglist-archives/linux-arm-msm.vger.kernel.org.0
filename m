Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3026660E6F
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Jan 2023 12:51:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232029AbjAGLv2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 7 Jan 2023 06:51:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231890AbjAGLvP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 7 Jan 2023 06:51:15 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 597F7B1F
        for <linux-arm-msm@vger.kernel.org>; Sat,  7 Jan 2023 03:51:13 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id cf42so5699135lfb.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Jan 2023 03:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LUv1X4vJ50+KHRQymLp4zbDFdcHgkMPucIQ1HeL1G3c=;
        b=scplzH2PFgTKnV4U8V6nzwu/xTsLp9do1jKdVoYnb71Getg/ol5wEbwhYfKZE8gtFq
         IoauW2BGmO6OS4xv2uY+LgAWbLnrfxqLA1Ni+sd57PpwG6HLB+M8zpncmwA3AlE+tY6G
         +8IhbPO7d4YQQCDh1WnIQ6OCbDMz7ef21v7XRnA/LLenVn3KY+ZdpOVUTBXHe9O+y1cJ
         5v+exu86aqbbwpLHcINj+XlTxZyHxue512wlS5oSpJJCJ+jeQcgrwS+eFD+LLux7Tw5e
         iElFx0dZpwkCParVUa3DaZS3eJC+BhvSvtASEmI7RBz2KIDtu50xDi15Heb0zQ16kp91
         GeQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LUv1X4vJ50+KHRQymLp4zbDFdcHgkMPucIQ1HeL1G3c=;
        b=yzuvHCVZ9uIjWdLpxeSzRjjwZ5J8Kq6+GLcu8pPau0QdE6Q2C08RCCH8XcliFZ2/4D
         1/5qIvEeupk1ygguJMPyT7hyCyFN36/e5WfDj/+ndyx5BuEL2+5Z+vzfxmOFV62stxB/
         rqzpCJhtIjL9HvxjhOLpt8pcF/MxUl+hLH3fy8WfhtuyfuUiQOamcbZES1wEg1j1EOoj
         0X00/4EKuxV7o6yp8dt+U5YQGeOkBKNTEmY6di3/eqpJRia7fSIEdMT1UwVRo7HugTeF
         mVYFO1LLMLjXq4gBsQeXJosJ05wrw3LJ60ldiTW52uOgavcMOVZ5ql2LMY+ZJE8lM/GL
         Ropw==
X-Gm-Message-State: AFqh2ko5Os1js4x1DdMgNGZB+Zv/SDoES4tLASR8csEzdLYNCezRRVFM
        YMW//ji7tUZe9GNr9ZxfY8uZeg==
X-Google-Smtp-Source: AMrXdXuUMUQoR5PSvwAX/DRPQHj60NeVyiMNrMQ5lCNtAadRH+LuCM3V/AnBVcobZ9do9f8UHBaF/A==
X-Received: by 2002:a05:6512:2316:b0:4b0:6023:6f6f with SMTP id o22-20020a056512231600b004b060236f6fmr19494995lfu.57.1673092271683;
        Sat, 07 Jan 2023 03:51:11 -0800 (PST)
Received: from [192.168.1.101] (abxi45.neoplus.adsl.tpnet.pl. [83.9.2.45])
        by smtp.gmail.com with ESMTPSA id 1-20020ac25f41000000b004b590b0c084sm550008lfz.3.2023.01.07.03.51.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Jan 2023 03:51:11 -0800 (PST)
Message-ID: <c20125c3-b5a9-daed-1823-689ae3f02bfe@linaro.org>
Date:   Sat, 7 Jan 2023 12:51:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/2] arm64: dts: qcom: msm8916: Enable blsp_dma by default
Content-Language: en-US
To:     Stephan Gerhold <stephan@gerhold.net>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20230107110958.5762-1-stephan@gerhold.net>
 <20230107110958.5762-2-stephan@gerhold.net>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230107110958.5762-2-stephan@gerhold.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 7.01.2023 12:09, Stephan Gerhold wrote:
> Adding the "dmas" to the I2C controllers prevents probing them if 
> blsp_dma is disabled (infinite probe deferral). Avoid this by enabling 
> blsp_dma by default - it's an integral part of the SoC that is almost 
> always used (even if just for UART).
> 
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/apq8016-sbc.dts | 4 ----
>  arch/arm64/boot/dts/qcom/msm8916.dtsi    | 1 -
>  2 files changed, 5 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dts b/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
> index ef5b39ba1238..c52d79a55d80 100644
> --- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
> +++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
> @@ -169,10 +169,6 @@ led@6 {
>  	};
>  };
>  
> -&blsp_dma {
> -	status = "okay";
> -};
> -
>  &blsp_i2c2 {
>  	/* On Low speed expansion */
>  	status = "okay";
> diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> index ffb4ce8935b3..98da982548a1 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> @@ -1522,7 +1522,6 @@ blsp_dma: dma-controller@7884000 {
>  			clock-names = "bam_clk";
>  			#dma-cells = <1>;
>  			qcom,ee = <0>;
> -			status = "disabled";
>  		};
>  
>  		blsp1_uart1: serial@78af000 {
