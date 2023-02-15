Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B20746978F2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Feb 2023 10:26:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233312AbjBOJ0i (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Feb 2023 04:26:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233900AbjBOJ0Y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Feb 2023 04:26:24 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B3AA37573
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Feb 2023 01:25:43 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id f18-20020a7bcd12000000b003e206711347so28144wmj.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Feb 2023 01:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lRaz9F2ndu1/Zzg0HAXs4+stqA3VUbDuTuUhJDAoGm0=;
        b=oZDj+NVqsSmEJ5xdIf2TEYmmgUNCK6zQP03WEdPsHXYTmzbEg77rO75MQ1ymaqHtkK
         u8t7eOltDCyuMAndy09UOb2WYFu/beEnNT8JcnvuZUiUFH50NYqbyeP4SOqqPxqLFPtr
         IzWTR0DZderEsuIHzDLvEZcJl2Plcb6Y8URrctPSeIWS4qZ+AuvbiDspjn9Npj8am/dQ
         XhOHi3ZKE/MqOnYhlSMkvRh7MGGJLHmiet+xq6zgt4/rWbSMSRCfpnIiC/48goxqgG7W
         mTYQKQ59JXmjtSzXXr43XG6lAc65VQ7YBm16Qd7peAQDfaI+vhC9OiAiE025LZn5L8fS
         t2pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lRaz9F2ndu1/Zzg0HAXs4+stqA3VUbDuTuUhJDAoGm0=;
        b=BJILw17rdAqg/AoLbbabof4qIibAywNsjZPfKpIAFtLvRgmMp4RuMZHGf/JTTFrPN0
         6JtW/LzuKGq3VXEyWx0kTFz5l1XhILTHOWjz/mL2kXICv/irJOYKViVGJQ+8FDYKxVLF
         /fC6OrVkziuda/tWcyre4sE5AXP2VYliBFu7lskBgEpbtIZCpWvoq2MLV+/o+68ZL1YU
         bvNlt+cwjiLc0SY98JardUcjoSdtZ/w2SC1nLSW07+8b+S4ryQ5Sta/bhoOmF5REHZeo
         02mJp8DpsOt8zyhcZq+QonI5nm8O03rl9BgK77gBRzk/cjH91/Zz3l2sUiuNcQJbPA4q
         in3g==
X-Gm-Message-State: AO0yUKWo4g2pW0QA7HeW8+n/ZLwvZHzpoKjT4O1r7b8Vz38rzDz5Vw8G
        cKtzeL+A7v5+354FZImTud0J3Q==
X-Google-Smtp-Source: AK7set+MPgZiuLq/e8s82IBTD7f+ZJIhVUc3Y4h6gzu5gjWm0PGQysGvJd756SDP8P0/8jSvtDzwcg==
X-Received: by 2002:a05:600c:4d15:b0:3cf:7197:e68a with SMTP id u21-20020a05600c4d1500b003cf7197e68amr1675557wmp.18.1676453139517;
        Wed, 15 Feb 2023 01:25:39 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:7fda:5fd:df14:bb65? ([2a01:e0a:982:cbb0:7fda:5fd:df14:bb65])
        by smtp.gmail.com with ESMTPSA id b15-20020a5d550f000000b002c55ebe37ddsm5674783wrv.115.2023.02.15.01.25.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Feb 2023 01:25:38 -0800 (PST)
Message-ID: <f6f81af2-00ec-a75b-0e9e-a1eaf649edf5@linaro.org>
Date:   Wed, 15 Feb 2023 10:25:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2] dt-bindings: qcom,pdc: Add compatible for SM8550
Content-Language: en-US
To:     Marc Zyngier <maz@kernel.org>
Cc:     Andy Gross <agross@kernel.org>, Abel Vesa <abel.vesa@linaro.org>,
        devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Thomas Gleixner <tglx@linutronix.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20230127132558.1176730-1-abel.vesa@linaro.org>
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230127132558.1176730-1-abel.vesa@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mark,

On 27/01/2023 14:25, Abel Vesa wrote:
> Document the compatible for SM8550 PDC.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> 
> The v1 is here:
> https://lore.kernel.org/all/20221116114210.2673902-1-abel.vesa@linaro.org/
> 
> Changes since v1:
>   * rebased on next-20230125
>   * added Krzysztof's R-b tag
> 
>   .../devicetree/bindings/interrupt-controller/qcom,pdc.yaml       | 1 +
>   1 file changed, 1 insertion(+)

Do you think you can pick it for v6.3 ?

Thanks,
Neil

> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
> index 94791e261c42..5a733bd76b57 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
> @@ -37,6 +37,7 @@ properties:
>             - qcom,sm8250-pdc
>             - qcom,sm8350-pdc
>             - qcom,sm8450-pdc
> +          - qcom,sm8550-pdc
>         - const: qcom,pdc
>   
>     reg:

