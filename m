Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40246600888
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Oct 2022 10:15:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229949AbiJQIPd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Oct 2022 04:15:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230062AbiJQIP0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Oct 2022 04:15:26 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 845331DA51
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Oct 2022 01:15:06 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id bh7-20020a05600c3d0700b003c6fb3b2052so240951wmb.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Oct 2022 01:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jSQQqrvn1bR7uPIMDiF5zWlVeZ8RtYyWHn3obAjZo1w=;
        b=QCsW8Yn7LoMnoT3b7OgBRzgClzgwcPHftzgmNzGb5To1vCdeiTOtQYJB32ja3ArBDg
         95euGh5uTmR3+3Td/UpHXxlFHTyJ733RrED+5TZ2H1h7mccBUhbaT7q1/YWD/+gtUwlE
         U5eRq/R0NOhaA4WsT+e7ahzQDK9U2HjfYGG7AaTR6uuoJ8qr/cW1w4/ht0FTSsZHKyw2
         HaUNMiPInanOV1C7BDPweMOCxYfh8+xaIpOqQPc69qcp3qKxVeiSbUyaN0qHh7/IsRS5
         wpByozbIz9JFNCzQrVhg7Ku9dFOOFr7UvdO9DsiG4BKBZSA4p3tlaDngyrE4nn4wK6Av
         Vi4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jSQQqrvn1bR7uPIMDiF5zWlVeZ8RtYyWHn3obAjZo1w=;
        b=CVGCx6UsSAOmQ8oDtCy7k04s0t+ZV3aFciV4r6xFkMbghDCu2OK8rpE3I5JmoaGPmu
         t/nIvuSgBy84cit7OHHMcjp9EqF+9rDrg0HJdRSWVFZ4XR3e01OJ+aumtfFTQEt6pM8v
         KVIkf38sG2/fiXCl79Gl4zqKjj0pwgatfRhUVLQfV3QfwXePU7kB8tr6KgJk8xedO0w0
         tuCtXJRUWXelrJEXnrTWv5W27nj7Nb6pAMj+wcgf8eP3v7Uz7x4xXP8j6qXxwC+I+C2D
         zLBV58b4PaxPQWmCvul4nlNEgbrrhNDKZe2yjIWyve5E6YI0rTRts7ztw5D3YQ9QZcUe
         N13g==
X-Gm-Message-State: ACrzQf092sGUSQ2YiA01pAYxpl1GtrFmAIrQSIJlTM69R/+dNhSCJ7wb
        0swAwzLoq369oupXfY5WF8bIQA==
X-Google-Smtp-Source: AMsMyM64Wfi1XAz6kYclkVIN5q7k9d/1r3GjUdPP69qSKeHWL/4JKbIVuKHSeJJOzWNd3hOWp632wg==
X-Received: by 2002:a05:600c:6890:b0:3c6:c323:878d with SMTP id fn16-20020a05600c689000b003c6c323878dmr18107971wmb.87.1665994504084;
        Mon, 17 Oct 2022 01:15:04 -0700 (PDT)
Received: from [192.168.27.65] (home.beaume.starnux.net. [82.66.176.246])
        by smtp.gmail.com with ESMTPSA id k13-20020a5d6d4d000000b0022ac38fb20asm7808940wri.111.2022.10.17.01.15.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Oct 2022 01:15:03 -0700 (PDT)
Message-ID: <0b8fff8b-7cf2-2228-c3e2-62b972d56f98@linaro.org>
Date:   Mon, 17 Oct 2022 10:15:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 1/4] arm64: dts: qcom: msm8998: add gpio-ranges to TLMM
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221012151416.38645-1-krzysztof.kozlowski@linaro.org>
Reply-To: neil.armstrong@linaro.org
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20221012151416.38645-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 12/10/2022 17:14, Krzysztof Kozlowski wrote:
> Qualcomm pinctrl bindings and drivers expect gpio-ranges property.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/msm8998.dtsi | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> index f05f16ac5cc1..2c4acf227253 100644
> --- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> @@ -1056,6 +1056,7 @@ tlmm: pinctrl@3400000 {
>   			compatible = "qcom,msm8998-pinctrl";
>   			reg = <0x03400000 0xc00000>;
>   			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
> +			gpio-ranges = <&tlmm 0 0 150>;
>   			gpio-controller;
>   			#gpio-cells = <2>;
>   			interrupt-controller;

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
