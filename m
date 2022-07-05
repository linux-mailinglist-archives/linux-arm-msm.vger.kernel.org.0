Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FA9C566FAE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jul 2022 15:46:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233277AbiGENpp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jul 2022 09:45:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232762AbiGENpZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jul 2022 09:45:25 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 767742CE30
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jul 2022 06:09:17 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id o10so3767507ljj.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jul 2022 06:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=g7aZhMFlVt+NAEp5sMXIEc1SOcFN2FETlRBor6D8Qkk=;
        b=OczgK1CkL4fAmHTQogEkdipAbgQ0JKSwzWreoTjVUE6+yRkq1j18PaSwmGAcgTcS0s
         46LPaL8oy55MLJtGz9Y/LlsoaVjVZrWhBiEIor2monrzaYdXIZWXcMkJTswUf+XCk0HH
         Fu1IkqPXgoOASnDp0UqwKs4KPNsStV+qSbXrWGC7HGxzIGdflaFWI0x/ovD7POHQX0Ms
         d2+W3qyavPyZkGnGTBgtbymxfZvG1YX1tJJHd51whnuu9QyJL4/yTvHDsRgmwLLH5m6m
         TIwKWRIDC1L66WlLDHjtXiARAwlhpjS0R8HQhdApxfdPBMPp7capBWO9MI4GGUbcJBKE
         ylcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=g7aZhMFlVt+NAEp5sMXIEc1SOcFN2FETlRBor6D8Qkk=;
        b=T58FM2jORAlR8FE++OCmOyzS/gDSjvIvPIXtDr8YTbGXD5AKfbGwdOHZ1VYf2jRDO9
         /zcXj03p/00/ec9IJnf1k0WORA53WiaNwInfjXWZrypDw0LWrh+2NFIGIzV+Chbq+Lk4
         g9gntdwW6dz6K+TaJ5lcnHqngdG+zXKh2azc4Qe2nQmjz3PaGxVuZzfl+HxqKx9nSGPF
         Hy8cgyxgVG70kWhfzHWNRZR7AhITQCRiowQyMaizh4XgwQsUKAqFf7nKczTndj9En3/G
         +pPFxX9bFqJ5yZRHOoo1YKK1JwvknoWEyi+yYEKb3rl/jRymnx5h7XSvotspvVBHVALN
         tQjg==
X-Gm-Message-State: AJIora/F7O9DHKjhpdd/uLkq/K4tBjLp2XkcJZOvLDy5y+CdYkRRHUn3
        mNuiq3eYfgf+/paweDEnPG38xQ==
X-Google-Smtp-Source: AGRyM1tskjOP0cBxY63PA8vwSd97cCQav6/27Sd6nSVAMfyruTybrhmY5nVgq/iNXtEnc1n7cXZLyQ==
X-Received: by 2002:a2e:95da:0:b0:25a:8e27:f1f2 with SMTP id y26-20020a2e95da000000b0025a8e27f1f2mr20226494ljh.45.1657026555794;
        Tue, 05 Jul 2022 06:09:15 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id z8-20020a056512370800b004846e25aeddsm147759lfr.149.2022.07.05.06.09.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Jul 2022 06:09:15 -0700 (PDT)
Message-ID: <61281f98-f45c-4701-f21e-269c5e78881a@linaro.org>
Date:   Tue, 5 Jul 2022 16:09:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 06/14] arm64: dts: qcom: msm8998: drop USB PHY clock index
Content-Language: en-GB
To:     Johan Hovold <johan+linaro@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220705114032.22787-1-johan+linaro@kernel.org>
 <20220705114032.22787-7-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220705114032.22787-7-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/07/2022 14:40, Johan Hovold wrote:
> The QMP USB PHY provides a single clock so drop the redundant clock
> index.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

However please note 
https://lore.kernel.org/linux-arm-msm/20220620071936.1558906-3-dmitry.baryshkov@linaro.org/ 
(for this and the last patch).

> ---
>   arch/arm64/boot/dts/qcom/msm8998.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> index 758c45bbbe78..2511e70d66ef 100644
> --- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> @@ -2080,7 +2080,7 @@ usb1_ssphy: phy@c010200 {
>   				      <0xc010600 0x128>,
>   				      <0xc010800 0x200>;
>   				#phy-cells = <0>;
> -				#clock-cells = <1>;
> +				#clock-cells = <0>;
>   				clocks = <&gcc GCC_USB3_PHY_PIPE_CLK>;
>   				clock-names = "pipe0";
>   				clock-output-names = "usb3_phy_pipe_clk_src";


-- 
With best wishes
Dmitry
