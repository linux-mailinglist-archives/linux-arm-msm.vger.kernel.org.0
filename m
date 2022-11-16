Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B05862C4DA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 17:40:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234127AbiKPQkL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 11:40:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238685AbiKPQjl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 11:39:41 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C74360364
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 08:35:09 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id ud5so45486076ejc.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 08:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k6BjWFxjC5tkR9KugJPiYcnXilnxM9V2o5dhVfQ7RIg=;
        b=MaYi+1p87gDsFp/+YrJbDkaVlSzNptNXBKFFZjMQd62Ymf+8D7UfLGQNVxR5Ltezgx
         oWRRVh1jDXTwNBs6QZz/fM9NC+RP4E1tkmmYCZwkg/e7Me/dT8NCE60JRk07dcdIlQtc
         +eHuEUmh/Ih11Qvp3McTpKTnDdBJgrBRHMX2862sIDlSJAP7TtaEnklRT+Iznm0sO05V
         asbXT+lvuHX7U7jkPacDCkvf5YGXSTOnBEPy+j9oSMoJIRBQhc0RhtC7fa8NdGuvU5Xh
         x/yTlzo2B7SI/8XBjeXoMN9pTD39gglbiIvNkwQy6MORfX6hxbdgao+os7b5C+pulpL0
         w/iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k6BjWFxjC5tkR9KugJPiYcnXilnxM9V2o5dhVfQ7RIg=;
        b=NR7Ph2WGco9WWos7rQvrADLEM0LizxhwRTriaJM28exPVP/MkLG0FU3MB3CnajJEji
         TxhYTLsUEcPavSa+9fy6mbwUTLfyGcsLDStesXkQ4Z9ZIqPPItjJ6vX4wudbCXN89Urs
         cxOUzCn/tw9JRFTlv1k39SRONg21eB++9TWGPGpfuOqkT0r0XOt7+VHE7iY3FEFkuXly
         sXcPCKQfrzN/jqGCzIOut48i+PRCFRQqXD+k7mXPRHTgGm2R3u7FvY7pRzcxo26ao0R7
         wRT+1zlgXlVOGdbZ1fEmFy7EDmAl4UUCtwqT/WwokxUD6cabZfVaHEeMfvxMvF080sc3
         Yg9w==
X-Gm-Message-State: ANoB5plX9XLTibujkuTmo7TkXRLRqM9vsSu40QyqNepwnmCURSkT8thl
        1Dml3wW6OtRFAQOeFRl1B09Tdg==
X-Google-Smtp-Source: AA0mqf5tlMO/CBPtP76U3R10NAucSfzgJ2VMbBd35VSeuYdAr49/ShzS7nke/8ma1CNcpJ3DrPZFMA==
X-Received: by 2002:a17:906:34c4:b0:7ad:b7c2:a2f7 with SMTP id h4-20020a17090634c400b007adb7c2a2f7mr18640368ejb.227.1668616507656;
        Wed, 16 Nov 2022 08:35:07 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id kz23-20020a17090777d700b007af105a87cbsm2528290ejc.152.2022.11.16.08.35.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 08:35:07 -0800 (PST)
Message-ID: <a359aeb0-e253-6c2d-03b1-7b224a258cab@linaro.org>
Date:   Wed, 16 Nov 2022 17:35:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH] arm64: dts: qcom: sm8450: use defines for RPMh power
 domains
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221116163141.177997-1-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221116163141.177997-1-krzysztof.kozlowski@linaro.org>
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



On 16/11/2022 17:31, Krzysztof Kozlowski wrote:
> Use defines for RPMh power domains instead of hard-coding numbers.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
This, I also sent yesterday..

https://lore.kernel.org/linux-arm-msm/20221115130936.6830-1-konrad.dybcio@linaro.org/

Konrad
>   arch/arm64/boot/dts/qcom/sm8450.dtsi | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> index 19a0f5033cc9..705e05588941 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -2277,8 +2277,8 @@ remoteproc_mpss: remoteproc@4080000 {
>   			clocks = <&rpmhcc RPMH_CXO_CLK>;
>   			clock-names = "xo";
>   
> -			power-domains = <&rpmhpd 0>,
> -					<&rpmhpd 12>;
> +			power-domains = <&rpmhpd SM8450_CX>,
> +					<&rpmhpd SM8450_MSS>;
>   			power-domain-names = "cx", "mss";
>   
>   			memory-region = <&mpss_mem>;
