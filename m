Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B70C6CD87C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Mar 2023 13:32:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229842AbjC2LcF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Mar 2023 07:32:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229829AbjC2LcE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Mar 2023 07:32:04 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16D2840CE
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Mar 2023 04:32:02 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id q14so15692743ljm.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Mar 2023 04:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680089520;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2+DmZREGJLvaG78XJWbtpreueoMcEnxDx6Pkz53TmMI=;
        b=HBGugAGCH0yFGhYG/IU6OtOsjloJCctl2WSqcVIi4FVXDRDmRXKgXpFd/o5uub0NlM
         TEcIdA0+m1OLMdYGUeG/Vm4YRYD+GP7YsBCSmdURJ8cvkSGJEec9M0qHEAfyrYL0iM5l
         5Ra88t81JFGoQElR1kPZWszDrF6VfW1wiz6GHv3VDzbtUvo18jrBF9gw7SIZcfvJkLoI
         PSHWQLIKEqN538/iuldEzqxpP31Ty4REom33rt8oOEMg7t18TsE0r1sqA+g8IQAJrf+N
         DlM3Iit9oDWTBLeIUuFC1HyzodoZeUDju2yBGviTF8ZQ/SgAjSjc6D9v+5yTlvjNKX47
         QIgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680089520;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2+DmZREGJLvaG78XJWbtpreueoMcEnxDx6Pkz53TmMI=;
        b=qanSoEkmgePzx+ffapwO3K3If3sAhvbqKr560f2DNALTxiJ+GLXtq3JsHi1E/J2Dbg
         HnIFtZd8FxUP7PVDsp+w0pFEldHmcWOoALqNPmGhNMFNvK0rGYx/yFP0kuPBf2DBe+5T
         t7E6BAflzrmH08YL2LSMcCfBdk1umYc59NCLovY4R3O5oi/Q+T5V3HfsTXcCvK1VDu0x
         fIeB43f4biH4UpcNNQkjsuV7DdbMGdFnK2WbOyM8DOxogZ6133AN9MEsPPj075s4pd1q
         KSmx6SyQXF3iwnoPvsO2IqsMdUctlJBXvX6XHJV8VksHmuTGWGXumaC7G5MKg8XkgEA/
         r8hg==
X-Gm-Message-State: AAQBX9eNHeTcSEFHqegTkG38VVA++Rh7PiljFW4oMpivifWdv9roJVWL
        26JqRGbUqKNb78LXHKXRNcJJ7Q==
X-Google-Smtp-Source: AKy350YE88S5jvIQZVnuVpOQq2nScq3LFKtzJGssAQyWtRjo20ViDGBKbgJ3z8i5HVZH0KqvlDK8+A==
X-Received: by 2002:a2e:b162:0:b0:299:d0b5:cdce with SMTP id a2-20020a2eb162000000b00299d0b5cdcemr6524373ljm.44.1680089520380;
        Wed, 29 Mar 2023 04:32:00 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
        by smtp.gmail.com with ESMTPSA id y26-20020a2e321a000000b002934febffe4sm5454811ljy.128.2023.03.29.04.31.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Mar 2023 04:32:00 -0700 (PDT)
Message-ID: <ab09d5eb-b303-bfa4-4f35-283ab30ffed2@linaro.org>
Date:   Wed, 29 Mar 2023 13:31:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 6/7] arm64: dts: qcom: sa8775p: add the GPU clock
 controller node
Content-Language: en-US
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20230328193632.226095-1-brgl@bgdev.pl>
 <20230328193632.226095-7-brgl@bgdev.pl>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230328193632.226095-7-brgl@bgdev.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 28.03.2023 21:36, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Add the GPUCC node for sa8775p platforms.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> index 9ab630c7d81b..4c45ad1cc7ff 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> @@ -591,6 +591,18 @@ tcsr_mutex: hwlock@1f40000 {
>  			#hwlock-cells = <1>;
>  		};
>  
> +		gpucc: clock-controller@3d90000 {
> +			compatible = "qcom,sa8775p-gpucc";
> +			reg = <0x0 0x03d90000 0x0 0xa000>;
> +			clocks = <&gcc GCC_GPU_CFG_AHB_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK>,
> +				 <&gcc GCC_GPU_GPLL0_CLK_SRC>,
> +				 <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
Without the first clock, as pointed out in the clk review:

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

(that also makes it compatible with the generic gpucc bindings!)

Konrad
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +		};
> +
>  		pdc: interrupt-controller@b220000 {
>  			compatible = "qcom,sa8775p-pdc", "qcom,pdc";
>  			reg = <0x0 0x0b220000 0x0 0x30000>,
