Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F23274D47E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jul 2023 13:23:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231512AbjGJLXM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Jul 2023 07:23:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232160AbjGJLXM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Jul 2023 07:23:12 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FE8AE8
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jul 2023 04:23:10 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4fb96e2b573so6605362e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jul 2023 04:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688988188; x=1691580188;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xUxkf5RZGu2yidCyZ+qFJ65AjIed+EE+d0XWkl7imOo=;
        b=E8fH93rYottFv5gMOjGgOylNF+mqL+gCHxe9z+XPLr8mrtyuII38tTPOKjLlsd2FZy
         boSH4GoGSPtPVZV/T3xpXfTV80Q6GIE7+nkuCAUM1UZyh+n6phwPxkddLEom9Ahy7sTY
         WcfFuIXZ4aP4QFQOVtoHEyTgmOWJBg+RGJNyoA5L+0QQ0/cEL4vyNX6ORsFweqX5X20y
         Fzcb8uxlII77wqKMFdWE5ZNWxyFeHCR3XjoDjr5jMuJArz/VufFLpvqr7Z5nGYSFklvX
         llilX6nTEvy5U5zxip+4eWF2rXKiI6wLttofKA8bQGWzb/XSEKTtg9baofg5wrTitOfH
         29YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688988189; x=1691580189;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xUxkf5RZGu2yidCyZ+qFJ65AjIed+EE+d0XWkl7imOo=;
        b=BbyG/6/2yd312jpp/ooJ3iut8+/5RXXZIiJGnWJQdrAhhbtF6MDZtPi9qqrdDDYvgg
         IwlJmovRV/UnSn3W52t0I7+5tIZo68BEa/raOzIXhSfvDiG/Vh1bTRe8Ch9ZP4Balr3P
         XCvY8UPXyQz/9BCNKRbKCWN2s424jsMnzVBgWDysR4ue3jfcjQImOe41Oa6j/2DkdRkC
         jInBUd9oYAYCLRF/I2ZCmxVjceF6Q7uWrErIJfkPS82JJhL74U6ZUa6UbPj/GV2TPk8H
         bT7ojLEAVt7Pa/gaFGK35GanicenLjZwWFGlRWi6c02eW4ctU1aHuQqv//fZtg5LiTDI
         Tz1g==
X-Gm-Message-State: ABy/qLZY4W83OeiSK4IWXRu9MNFE/pZTD3P2UEs1SpdCIaymcyv1hGiR
        uOYNZ5NvyntvaEmLuk5aeW0ScQ==
X-Google-Smtp-Source: APBJJlEObkVeIgQVbnOkglpvJlBEnplY6s2uOIVDL3/gE5xX/0kLoNfinXj270azZbxc9QDRDte3HQ==
X-Received: by 2002:a05:6512:b8e:b0:4f9:a542:91c with SMTP id b14-20020a0565120b8e00b004f9a542091cmr12164170lfv.3.1688988188796;
        Mon, 10 Jul 2023 04:23:08 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id l3-20020ac24303000000b004fbc2ffdef8sm1661915lfh.174.2023.07.10.04.23.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jul 2023 04:23:08 -0700 (PDT)
Message-ID: <3f6ab4b4-b5f5-5807-0cb4-8ae782bd6044@linaro.org>
Date:   Mon, 10 Jul 2023 14:23:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 5/6] arm64: dts: qcom: ipq5332: Add thermal zone nodes
Content-Language: en-GB
To:     Praveenkumar I <quic_ipkumar@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, amitk@kernel.org,
        thara.gopinath@gmail.com, rafael@kernel.org,
        daniel.lezcano@linaro.org, rui.zhang@intel.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     quic_varada@quicinc.com
References: <20230710103735.1375847-1-quic_ipkumar@quicinc.com>
 <20230710103735.1375847-6-quic_ipkumar@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230710103735.1375847-6-quic_ipkumar@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/07/2023 13:37, Praveenkumar I wrote:
> This patch adds thermal zone nodes for sensors present in
> IPQ5332.
> 
> Signed-off-by: Praveenkumar I <quic_ipkumar@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/ipq5332.dtsi | 72 +++++++++++++++++++++++++++
>   1 file changed, 72 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> index a1e3527178c0..8b276aeca53e 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> @@ -527,4 +527,76 @@ timer {
>   			     <GIC_PPI 4 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
>   			     <GIC_PPI 1 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
>   	};
> +
> +	thermal-zones {
> +		rfa-0-thermal{
> +			polling-delay-passive = <0>;
> +			polling-delay = <0>;
> +			thermal-sensors = <&tsens 11>;
> +
> +			trips {
> +				rfa-0-critical {
> +					temperature = <125000>;
> +					hysteresis = <1000>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +
> +		rfa-1-thermal {
> +			polling-delay-passive = <0>;
> +			polling-delay = <0>;
> +			thermal-sensors = <&tsens 12>;
> +
> +			trips {
> +				rfa-1-critical {
> +					temperature = <125000>;
> +					hysteresis = <1000>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +
> +		misc-thermal {
> +			polling-delay-passive = <0>;
> +			polling-delay = <0>;
> +			thermal-sensors = <&tsens 13>;
> +
> +			trips {
> +				misc-critical {
> +					temperature = <125000>;
> +					hysteresis = <1000>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +
> +		cpu-top-thermal {
> +			polling-delay-passive = <0>;
> +			polling-delay = <0>;
> +			thermal-sensors = <&tsens 14>;
> +
> +			trips {
> +				cpu-top-critical {
> +					temperature = <125000>;
> +					hysteresis = <1000>;
> +					type = "critical";
> +				};
> +			};

Could you please add a passive cooling devices for the CPU?

> +		};
> +
> +		top-glue-thermal {
> +			polling-delay-passive = <0>;
> +			polling-delay = <0>;
> +			thermal-sensors = <&tsens 15>;
> +
> +			trips {
> +				top-glue-critical {
> +					temperature = <125000>;
> +					hysteresis = <1000>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +	};
>   };

-- 
With best wishes
Dmitry

