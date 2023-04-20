Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95E566E90AA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Apr 2023 12:45:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234899AbjDTKpw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Apr 2023 06:45:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234891AbjDTKp3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Apr 2023 06:45:29 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EDDC5B8E
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 03:44:41 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2a8ad872ea5so4182641fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 03:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681987478; x=1684579478;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3XNpiIL0WrRgC2bDtAggRhXy91Dz9Y4MTH2vqhKCM0s=;
        b=q6+rX/LhWY9b89ZQ1jZZgV4E2JEbxql5ZB1Z6gbCACBI3mUmnwLFkKxsSywSoRo1oj
         LH2Q+4lpNDDy0oogUZyr4chmXygXhKZkiZxgtxry2wMm1ftBI+dZ/EKe+mEvKvjSEEPq
         kopzdba/J9DJk/DZ/XqTAsM0QvIOa1RCWUj2hZ9mwLx1VO7MHwvh+wNx2pUnvZgH9mPl
         7NCmj6gDGpwC7Y2sQ8zQ55lh4LH3a8RBf1reoy+pcr81PXpVy3ILB2zQGZoKzxsj3OoB
         c1yfBkNBvb02ZIc0OsgX6XQzLd8Qnaeg3rkkcZp1dPSW/k3UcdQah+YtBjH/6sIQ5Y8T
         tiJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681987478; x=1684579478;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3XNpiIL0WrRgC2bDtAggRhXy91Dz9Y4MTH2vqhKCM0s=;
        b=X5xC49UlduNT8R8snXoN364Yb9fGmAZbG6P+V5y+Gxe5+ZjzcWYvvgHbdAkU9E5yhh
         u+296wT8LZPThmB5hQ1npd0290AqiZju0vo/U6CK8lI6zWMUwwSCzep7bm53M3B5gpDb
         YlYivXJ5WpqhxntIBIMM2jBFx2SuILtCG4Ydod2nGGKwIKsw5pwbYAqIL21n8HqmyAUQ
         aKXn4qKAx7+/NV3YGN138R+0YKcBRlSUdBOYc9rtuIqpljAwYUy88e/oRfuMU8uKx6LM
         dTjt+IQhLnQ4ia0YrjmeMEucuoI9VK2r0NN2cKF8FfDjhZYVooykxjYqOmX8wbZHYOXW
         2iMA==
X-Gm-Message-State: AAQBX9chMYkNRu/vEAeKPzW3agnjjsWY3FRt23GoqKa9L8eEjxg539y1
        bwX/rsBk3/NEsGAzRGurt+i5bg==
X-Google-Smtp-Source: AKy350YwOzxQU9lPgHKHy79R0GAjFPaMgSJcop6YS2qFvLzrhDS+xLG/6gHC2jQp3t5B8SrCSAi1Ow==
X-Received: by 2002:ac2:4851:0:b0:4d8:6540:a72f with SMTP id 17-20020ac24851000000b004d86540a72fmr333238lfy.46.1681987478341;
        Thu, 20 Apr 2023 03:44:38 -0700 (PDT)
Received: from [192.168.1.101] (abyj144.neoplus.adsl.tpnet.pl. [83.9.29.144])
        by smtp.gmail.com with ESMTPSA id n24-20020a195518000000b004db513b017esm178849lfe.45.2023.04.20.03.44.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 03:44:37 -0700 (PDT)
Message-ID: <00c43e01-7034-3ade-947e-e2a6451d64b2@linaro.org>
Date:   Thu, 20 Apr 2023 12:44:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 3/7] arm64: dts: qcom: msm8994: add unit address to soc
 node
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230420063610.11068-1-krzysztof.kozlowski@linaro.org>
 <20230420063610.11068-3-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230420063610.11068-3-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 20.04.2023 08:36, Krzysztof Kozlowski wrote:
> "soc" node is supposed to have unit address:
> 
>   Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/msm8994.dtsi | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
> index 4041f3a690fe..184bdde5c78d 100644
> --- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
> @@ -340,8 +340,7 @@ modem_smp2p_in: slave-kernel {
>  		};
>  	};
>  
> -	soc: soc {
> -
> +	soc: soc@0 {
>  		#address-cells = <1>;
>  		#size-cells = <1>;
>  		ranges = <0 0 0 0xffffffff>;
