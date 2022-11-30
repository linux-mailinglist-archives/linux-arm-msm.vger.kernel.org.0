Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2751663D437
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Nov 2022 12:18:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234597AbiK3LSZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Nov 2022 06:18:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234408AbiK3LSF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Nov 2022 06:18:05 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAB093C6FC
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Nov 2022 03:18:03 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id r8so20499446ljn.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Nov 2022 03:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=otStQxmxOG6LpjBUQIYuow/PF/UV5Z7DPxX9LVFmQEo=;
        b=fa9DTGfn6miiSdGDtIzetZ3cP+Y//XHFAUdhDMe/rcDBMGLkWiIlAIXblHykz3XBdq
         YzC0fnxzFt/60yWvxiqVbFIVXSJ+vvPP7rzKgGOIGzZ8p4rczzLY/n7Jh0d3pSP6asmS
         7GIf+V6LW3muePp0QgVBYwDrtglEYK8SCNEgQmgKpQhlICmt+y8IaUUoeshYPm5bZ4Y0
         PG6iXABOS/F6ufJVLLCEuzHlIzBc+YhSNmcYiVRL4gfQItJ34mAZq32Mnrbtno7K0rl/
         g7f0JjDMNEMQP/zEIVKTJcQ4yvgxgWRd4HROJpKo9uYKlGAB1AJ6i3yiZVXORWvn6uCv
         ILhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=otStQxmxOG6LpjBUQIYuow/PF/UV5Z7DPxX9LVFmQEo=;
        b=l/WlWPCTYdDURfMwTMSwKgvCjDx82rl7ZgdCvmWW2wjLm4wfGuVY/pSRP/Rg0Gp2wQ
         Yx7NA/msZbsiQJMP8O7TFnBWHjalxpclX3ayzQUSdpEuvXeEjaYHQCpReOt2Ooytx2J2
         2CzrtkjwtNDdSd9CEELhh4CpsrhrBlLzCcAOcr8lYfM+C8jok0huKRgTmDRSIsi6+rpl
         QQL+6Ud3FvRlIuVM1vFC1/TH+PmG9/2XQYAXCX0VJpLAqEeZq91yacbqBNjGLQA5LmQH
         7C2QIHAJUCpkM+BQUqnN1UCXzqe62rfueAXvnkd4ORAd3Ik86CeQtpJ4noK3jV75Du+1
         5vwA==
X-Gm-Message-State: ANoB5plhBvD5h5kmFZxbRaZwkG7ipvbgXZGYzKEB9oriDRSqEsdXiOG9
        M8KtxC9yLoHuPAe7aUy+xqMhqw==
X-Google-Smtp-Source: AA0mqf6wG9cAljfGq/fOblhbS+7rNoNwLhQu0yt79NeJDaajfzWbs9CAdx2+LxPPPMd07rqtVe40Hw==
X-Received: by 2002:a05:651c:88c:b0:26c:4e3a:516 with SMTP id d12-20020a05651c088c00b0026c4e3a0516mr14687322ljq.510.1669807083389;
        Wed, 30 Nov 2022 03:18:03 -0800 (PST)
Received: from [192.168.1.101] (95.49.125.236.neoplus.adsl.tpnet.pl. [95.49.125.236])
        by smtp.gmail.com with ESMTPSA id u22-20020ac258d6000000b0049e9122bd1bsm216515lfo.164.2022.11.30.03.18.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Nov 2022 03:18:02 -0800 (PST)
Message-ID: <46202b25-e253-0a5a-0c90-9d699906d3d7@linaro.org>
Date:   Wed, 30 Nov 2022 12:18:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 07/12] arm64: dts: qcom: sm6115: Add dispcc node
Content-Language: en-US
To:     Adam Skladowski <a39.skl@gmail.com>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Loic Poulain <loic.poulain@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
References: <20221129204616.47006-1-a39.skl@gmail.com>
 <20221129204616.47006-8-a39.skl@gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221129204616.47006-8-a39.skl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 29.11.2022 21:46, Adam Skladowski wrote:
> Add display clock controller to allow controlling display related clocks.
> 
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sm6115.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
> index 6d14bbcda9d3..ea0e0b3c5d84 100644
> --- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
> @@ -4,6 +4,7 @@
>   */
>  
>  #include <dt-bindings/clock/qcom,gcc-sm6115.h>
> +#include <dt-bindings/clock/qcom,sm6115-dispcc.h>
>  #include <dt-bindings/clock/qcom,rpmcc.h>
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> @@ -717,6 +718,19 @@ usb_1_dwc3: usb@4e00000 {
>  			};
>  		};
>  
> +		dispcc: clock-controller@5f00000 {
> +			compatible = "qcom,sm6115-dispcc";
> +			reg = <0x05f00000 0x20000>;
> +			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
> +				 <&sleep_clk>,
> +				 <&dsi0_phy 0>,
> +				 <&dsi0_phy 1>,
> +				 <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>;
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +		};
> +
>  		apps_smmu: iommu@c600000 {
>  			compatible = "qcom,sm6115-smmu-500", "arm,mmu-500";
>  			reg = <0x0c600000 0x80000>;
