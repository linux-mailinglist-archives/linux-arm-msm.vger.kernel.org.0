Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6645C6569DF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Dec 2022 12:23:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229679AbiL0LW6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Dec 2022 06:22:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231620AbiL0LWx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Dec 2022 06:22:53 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEFDC109D
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Dec 2022 03:22:52 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id p36so19185932lfa.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Dec 2022 03:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ksnoCNJ1qONO4wO2TMe95UeroS7VFopu//mYkJLJxUE=;
        b=SITCaE/2FuFKhryuOmd/Et8sD9DhOsFSlEyRTAxu68ND6eWS8iFhfhnyawoaInJ9cW
         /wAXIEr2mNb4u+n+9Xv+mKPR51wtg76K3pR6nR1ndtWjtWg8WYR4JyghIZ+irCPdFXgJ
         X2cE3OzkMJal4R8eL0vVGdLmBQsaqlaLntmin6uxjApGs7wLH24OG78m4t76ickssHLj
         2sgvUs1GsNvp6IQkU6duP4ZtmDvMizZu6j2wudweBgw+8guuk9CpTDhyW/cq/RKTq5rJ
         7cniwnK2duuEgAYoqREZuWlD5WTdPwvQ5HgPDJesNxsVjY/WnaGXDCWZXTis5V3t6deT
         mnZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ksnoCNJ1qONO4wO2TMe95UeroS7VFopu//mYkJLJxUE=;
        b=nE2QkgLKc6zLvm4YyhMFdSz98zCBWxGSPbuw8MRvAwOlFN0idih0DrI3IdM1PHrCHE
         VZnspM6lSrv9/FBIfR4Gg58HC+hPDrCBCRXS/0DmB4ykCqnSTTdpBYv4TGTS+m97pjER
         8lTpBRQVoyt4J/ciaOLVp1KZS2UeUbX+42oX+EZvSvZIK+LZSXe35qVWGOojFNCWLi/q
         WqbPG25P+950seRQI+0HyMjjNJAD7hVyQ9xH3h38uU2H+tOMJ0+TAMoTE8G5+w7thFbO
         wui1eNS3zdsQpcf3wBLMPRM6kTvJcmIj+HIsknXgeyIuSPsxaxQl/wfNBBCfk3xRoEXK
         OLRQ==
X-Gm-Message-State: AFqh2ko0vDAkqKs31ig4C2GidcV9qDvrzfHRJ9T4z2IyDaebgHvvxiyk
        nZAXcHMmdnojyDRZ+5kA21WFoA==
X-Google-Smtp-Source: AMrXdXsgb4g6b0HRHXeusv48ZOMuWuFykfy0DyyF0MHa5irzJmekBaBIjp1PYrf6SDGrvB/LRC7YQA==
X-Received: by 2002:a05:6512:141:b0:4ca:f887:fe99 with SMTP id m1-20020a056512014100b004caf887fe99mr3647965lfo.25.1672140171087;
        Tue, 27 Dec 2022 03:22:51 -0800 (PST)
Received: from [192.168.1.101] (abyl184.neoplus.adsl.tpnet.pl. [83.9.31.184])
        by smtp.gmail.com with ESMTPSA id k6-20020ac257c6000000b004b551cdfe13sm2189772lfo.279.2022.12.27.03.22.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Dec 2022 03:22:50 -0800 (PST)
Message-ID: <fd6fbdba-12e9-724f-8e0d-ac60035bd19d@linaro.org>
Date:   Tue, 27 Dec 2022 12:22:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/5] arm64: dts: qcom: msm8996: align bus node names with
 DT schema
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221224154255.43499-1-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221224154255.43499-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 24.12.2022 16:42, Krzysztof Kozlowski wrote:
> The node names should be generic and the bindings expect "bus" for
> simple-bus nodes:
> 
>   msm8996-mtp.dtb: agnoc@0: $nodename:0: 'agnoc@0' does not match '^bus(@[0-9a-f]+)?$'
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index c53018ca81d7..cf2f5b74a4c2 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -1814,7 +1814,7 @@ spmi_bus: spmi@400f000 {
>  			#interrupt-cells = <4>;
>  		};
>  
> -		agnoc@0 {
> +		bus@0 {
>  			power-domains = <&gcc AGGRE0_NOC_GDSC>;
>  			compatible = "simple-pm-bus";
Mind sending a separate patch to move compatible up on this one?

Konrad
>  			#address-cells = <1>;
