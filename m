Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D80F563540A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Nov 2022 10:02:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236942AbiKWJCI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Nov 2022 04:02:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236922AbiKWJBz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Nov 2022 04:01:55 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04FCA1001F5
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 01:01:54 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id g7so27241213lfv.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 01:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WA7wcqap9FFSojyAIedMI2HkYd/yBUkUMbNf1qYRGDQ=;
        b=oiepXkfX2ozhXYoitSiMJdedTucyjr0vbG8Y331jpwhNAtO377avpdEIUokHvGP+z8
         2R5Mono0FGVQ8SvDeDRuABrB86bgCw9ZUBFRzkyRn4uWVdOb+VVFH/d0IuRel+dlkIIo
         A9j5MNM6BaIMvYxWOu//+UBLalE0ailN4OANyohJOKboO2GRbFxNxjbJIrWTGiosbOQR
         KHCLnp2akVpoftWmwiDgDgon7I+JLxcNKbL64wp+8rAHpFGm5g4rIWgEJkN0cjgr4mY7
         lFQNaMWatYJcUXTkKFKSwmXTbNEc6d7VeRdx1DbbfAThVk3T6CQTDvSc/yxDQyEM2jGZ
         jRAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WA7wcqap9FFSojyAIedMI2HkYd/yBUkUMbNf1qYRGDQ=;
        b=8SGg0Qu79vtnuTwFtat+Sv/J/1d9M5La5ZX1ziq8PEiTYAi9Kzp8iE/fPNnrrPo8PH
         HKNcnS0nJfjRN1UYKUh/jKTlS0M1zTCMTqAKbCpbOogdsz+IRqgfogxhlsf5NbQ+oWbN
         lewCn/Td5dJ1nEvNCF35P30k8NJX4+NJvBWagsWIy1YGblz7/6m+5aIkajPs2AeueRAN
         3rp+Lu0l/r3cqMGUuWDoPVutnZelImsgrHAEQCDVHjIkedxivYGFsQTFcUN+L//oaGGM
         atFfee8cAqZAM56mMTW7aTxWbjr2GcZB9K7ehdl2IjADhJlH9bLDOSKJzsI7ktz+ybVW
         cZxg==
X-Gm-Message-State: ANoB5pnEoYHs9aEBvlzes/AoYwh2ZAORtlaQD0A9icaUXsOUtYwXcBP/
        6q7rZnvAuOSs6lj6LmifvPsruA==
X-Google-Smtp-Source: AA0mqf6Jf0/+ltsRerqajN32SESPAarDvzpQCu/W4nX4wn56+27rFasS+QC5XNK+JMyEiI6Uf9n6/w==
X-Received: by 2002:a05:6512:128d:b0:4b4:b645:6303 with SMTP id u13-20020a056512128d00b004b4b6456303mr3117475lfs.475.1669194112270;
        Wed, 23 Nov 2022 01:01:52 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id b17-20020a196451000000b00498f23c249dsm2779102lfj.74.2022.11.23.01.01.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 01:01:51 -0800 (PST)
Message-ID: <ac216c05-d939-0045-9a32-c874b584ee2d@linaro.org>
Date:   Wed, 23 Nov 2022 10:01:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 4/5] arm64: dts: qcom: sm8450-hdk: Add LT9611uxc HDMI
 bridge
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Vinod Koul <vkoul@kernel.org>
References: <20221122233659.3308175-1-dmitry.baryshkov@linaro.org>
 <20221122233659.3308175-5-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221122233659.3308175-5-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23/11/2022 00:36, Dmitry Baryshkov wrote:
> From: Vinod Koul <vkoul@kernel.org>
> 
> Add the LT9611uxc DSI-HDMI bridge and supplies
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

> +
>  &sdhc_2 {
>  	cd-gpios = <&tlmm 92 GPIO_ACTIVE_HIGH>;
>  	pinctrl-names = "default", "sleep";
> @@ -431,6 +478,20 @@ &sdhc_2 {
>  &tlmm {
>  	gpio-reserved-ranges = <28 4>, <36 4>;
>  
> +	lt9611_irq_pin: lt9611-irq {

-state suffix

And test DTS against bindings (`make dtbs_check`).

> +		pins = "gpio44";
> +		function = "gpio";
> +		bias-disable;
> +	};
> +
> +	lt9611_rst_pin: lt9611-rst-state {
> +		pins = "gpio107";
> +		function = "normal";
> +
> +		output-high;
> +		input-disable;
> +	};
> +
>  	sdc2_card_det_n: sd-card-det-n-state {
>  		pins = "gpio92";
>  		function = "gpio";

Best regards,
Krzysztof

