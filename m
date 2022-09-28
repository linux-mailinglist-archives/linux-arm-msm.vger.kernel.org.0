Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC2B95ED6A7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Sep 2022 09:47:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233455AbiI1Hrp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 03:47:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232989AbiI1Hr0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 03:47:26 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EB6611918A
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 00:43:58 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id ay36so7994962wmb.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 00:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=WTMgsRJa6Oi0N9LRsPIz4cs9bNKx4jHZ48tFhWMCrUQ=;
        b=BAUoog63t7ctTyoTgrzVRG0qFV51jc28WFXV7onQ7W1zPT3wjkj21k8Qs/R0VY0p2M
         xD9bDDxxYRMi6hWVlHVBdJ0H4ymGABR7C/gDWfyh3xxGLHv6uzDn8b2YZ6ZdBsq/oPfn
         alhJSMcCi1SJ06qto6ALPa2kfl5x7lHlpJUijFHVa8BrnWJgHSalGXD/hpRpatYaSPDC
         eRY2I/Skywn7tTzmcXxzIJyPVB69cv7PkWlH6gmtUcpswz7sFdtDOZneLmlaIwxZvGsQ
         FbWpkFNTCfeF9t01Yblul7T91CKnrXWLBh5o7R8U7xDp6YQ50DBnwI9l4IDUV2ToBXJC
         2Hzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=WTMgsRJa6Oi0N9LRsPIz4cs9bNKx4jHZ48tFhWMCrUQ=;
        b=Un9z8JkV7zZyAjEPnt0jDAymNZB0UnIOFqhEEndDd9uw2UGI2bn26gaYPsXl1PShS0
         HEhALLV0t0DX+8ZvNgrfozCfn987L/JXizFxTrSMaHsWVs3As2n3Q5/HV7BnCibgoJcB
         OA2xMP7581g4x/XEeTxqVQwc5Frm/Pq7Zmo8Ux1IFStuk4sevZjyEtlR5BJuLQkM90fF
         SlWA8tcl1YlOAYS4TZiys49c1tvcWdqp0o68OL4TSyuSCM56geBaK9FSly8PSqdvZ9wi
         04SvWdb9EzHyLA39Ndf5/TzD/y1f0or/Q0jJZnR63w/cssHPFtVK/jBvepUIU25rhJG3
         fvOw==
X-Gm-Message-State: ACrzQf1/5COKMznujUQ7BE/1yw/asow+hruFgRl+QjPOQl0zrvrP5mmM
        ccm2DdMkepsfiqwoWd6lkCnYHE8CUcndAZt2
X-Google-Smtp-Source: AMsMyM6Tg6BOwFCRIEKZnaQYe+aMbJ3lZX2XWwuAyuJGsKkI7Mvn8eVPkeVdTLmTsbOUP0mAdkV5HQ==
X-Received: by 2002:a05:600c:198d:b0:3b4:a62c:a085 with SMTP id t13-20020a05600c198d00b003b4a62ca085mr5442180wmq.140.1664351026294;
        Wed, 28 Sep 2022 00:43:46 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:11d4:7c71:accf:6521? ([2a01:e0a:982:cbb0:11d4:7c71:accf:6521])
        by smtp.gmail.com with ESMTPSA id s11-20020adfbc0b000000b0022b0214cfa6sm4698319wrg.45.2022.09.28.00.43.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 00:43:45 -0700 (PDT)
Message-ID: <48b4c568-b737-c0c3-ab2d-798c88b94eab@linaro.org>
Date:   Wed, 28 Sep 2022 09:43:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/2] arm64: dts: qcom: ipq6018: move ARMv8 timer out of
 SoC node
Content-Language: en-US
To:     Robert Marko <robimarko@gmail.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@somainline.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220927201218.1264506-1-robimarko@gmail.com>
 <20220927201218.1264506-2-robimarko@gmail.com>
Reply-To: neil.armstrong@linaro.org
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20220927201218.1264506-2-robimarko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27/09/2022 22:12, Robert Marko wrote:
> The ARM timer is usually considered not part of SoC node, just like
> other ARM designed blocks (PMU, PSCI).  This fixes dtbs_check warning:
> 
> arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dtb: soc: timer: {'compatible': ['arm,armv8-timer'], 'interrupts': [[1, 2, 3848], [1, 3, 3848], [1, 4, 3848], [1, 1, 3848]]} should not be valid under {'type': 'object'}
> 	From schema: dtschema/schemas/simple-bus.yaml
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>
> ---
>   arch/arm64/boot/dts/qcom/ipq6018.dtsi | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> index 57978a8ab498..428e99e127c3 100644
> --- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> @@ -511,14 +511,6 @@ a53pll: clock@b116000 {
>   			clock-names = "xo";
>   		};
>   
> -		timer {
> -			compatible = "arm,armv8-timer";
> -			interrupts = <GIC_PPI 2 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> -				     <GIC_PPI 3 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> -				     <GIC_PPI 4 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> -				     <GIC_PPI 1 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
> -		};
> -
>   		timer@b120000 {
>   			#address-cells = <1>;
>   			#size-cells = <1>;
> @@ -770,6 +762,14 @@ dwc_0: usb@8a00000 {
>   		};
>   	};
>   
> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupts = <GIC_PPI 2 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 3 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 4 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 1 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
> +	};
> +
>   	wcss: wcss-smp2p {
>   		compatible = "qcom,smp2p";
>   		qcom,smem = <435>, <428>;

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
