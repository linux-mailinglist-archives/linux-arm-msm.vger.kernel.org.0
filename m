Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 732D36004B4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Oct 2022 03:07:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229963AbiJQBHy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 16 Oct 2022 21:07:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229886AbiJQBHx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 16 Oct 2022 21:07:53 -0400
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com [IPv6:2607:f8b0:4864:20::f33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF6492BE37
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Oct 2022 18:07:52 -0700 (PDT)
Received: by mail-qv1-xf33.google.com with SMTP id mg6so6640592qvb.10
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Oct 2022 18:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dv74hn933FA3VfCio2v72jisW2/SWhBYW/uCG0Tw39I=;
        b=JIdSUh2UghHdSb9G/9oZg1FECr31okecDgvqH0HqJ4NGPnIyFHMhX6bFB35gNENND9
         l74CmvRfm0rKff2OVU+1kwa5CwdcHeYqJh6vgJJLwij7Qxpxw+R7GKgdm/gaoEWLPBJU
         x/pkBulWNQ12c+6g29FMin2uq9i8T055wFO4ubN4rsEp93O98piaKY+uit3esFJsyEd2
         XvaePvTu8qYhWqJEDvhGlKSam11I7zH9Edco5UXPHt/RDy9kau2KZ9YwbCk16hBoIu0z
         3CUq2/uKo7l/+ohdrqRNT8otitH4u+vaqxJXqa+5EKFhgpJwBgorj9SekOzKEN4WBaxw
         aRmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dv74hn933FA3VfCio2v72jisW2/SWhBYW/uCG0Tw39I=;
        b=CdSD7LpO9W3DvwHhmgLPe9Ad0WLm0wCH/IMM/UycTCDa3ObLNT4523lCuhlR0u/NfB
         1iD5uDGmxSja3ZuihNdMMlbtMPiklM4i8gvXY/1U3THpS8aVkeav1lLcdWuvF6viDopY
         JFl3r8e5W2iZBa6MLqiwhopnWSMF03kCg5wW0mmIp5KZg15loygfdQ4mqkPVGNwHzKVH
         qNjPeJmhdBkGgiSLSEyM2hWmD5sRYSZNK1qsVvnWvmik/3mjv3S7/C6xKHfHXqn/rUeO
         LthwWbCX6D2zP/X6gskXbLemOdeAiCX4gb8A5HbqHEulgKKW4m2ViILviUGl3HfqMlgh
         LdWg==
X-Gm-Message-State: ACrzQf17IZBQmM2TWlHh3j3x/lXFn2RdZGtfNznZWZs4T51lQDR4wQaZ
        CvddPchYYgNyiRGGYhPgu/EJpw==
X-Google-Smtp-Source: AMsMyM56WOrdk918SGsxxf1jgHd2R6Lzby6hm/0JsfefLe4ZlVgb+3Vk6wQ++l8nb4MuntxsUtFcDQ==
X-Received: by 2002:a05:6214:62d:b0:4b3:fbac:3cdd with SMTP id a13-20020a056214062d00b004b3fbac3cddmr6534900qvx.117.1665968872042;
        Sun, 16 Oct 2022 18:07:52 -0700 (PDT)
Received: from ?IPV6:2601:42:0:3450:bb7d:1aa4:bef8:ec27? ([2601:42:0:3450:bb7d:1aa4:bef8:ec27])
        by smtp.gmail.com with ESMTPSA id bl19-20020a05620a1a9300b006cf38fd659asm7931567qkb.103.2022.10.16.18.07.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Oct 2022 18:07:51 -0700 (PDT)
Message-ID: <4212bbf3-6974-7287-5e6b-ad77653d6042@linaro.org>
Date:   Sun, 16 Oct 2022 21:07:42 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH] dt-bindings: mfd: qcom,spmi-pmic: support rradc type
Content-Language: en-US
To:     Caleb Connolly <caleb.connolly@linaro.org>
Cc:     Luca Weiss <luca@z3ntu.xyz>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Lee Jones <lee@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
References: <20221016175757.1911016-1-caleb.connolly@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221016175757.1911016-1-caleb.connolly@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/10/2022 13:57, Caleb Connolly wrote:
> 'adc@' nodes can also be the rradc.
> 
> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
> ---
> This patch is based on Luca's series:
> https://lore.kernel.org/linux-arm-msm/20220925211744.133947-2-luca@z3ntu.xyz/
> 
> Luca: feel free to apply this as a fixup if you re-send
> ---
>  Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
> index b5a06c1b67bb..cba25562e1da 100644
> --- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
> +++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
> @@ -102,6 +102,7 @@ patternProperties:
>      oneOf:
>        - $ref: /schemas/iio/adc/qcom,spmi-iadc.yaml#
>        - $ref: /schemas/iio/adc/qcom,spmi-vadc.yaml#
> +      - $ref: /schemas/iio/adc/qcom,spmi-rradc.yaml#

rradc seems to be present only on few specific PMICs, so we could
restrict it per compatible. Similarly like adc-tm is done.

>  
>    "^adc-tm@[0-9a-f]+$":
>      type: object

Best regards,
Krzysztof

