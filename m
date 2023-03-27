Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A895E6CA831
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Mar 2023 16:49:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229762AbjC0Otm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Mar 2023 10:49:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232208AbjC0Otj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Mar 2023 10:49:39 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AFDA30E4
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 07:49:37 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id h8so37260568ede.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 07:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679928576;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B+sMKV4hXt9Y8FmVutJx9ALyxrQpOlHZRgFJ2uj+OmM=;
        b=jmmW6zka1SAkQ4mhNxtqHS3RFOqpKsSiQ/SIj1uf3ZoeZ5iF1HxHSbDFvez+RVdRGC
         F2hIAHJc9vemFbT2buLVzPtSzGUEkBNA9nbmsifs0KqCNei5RbqypFS5Xf+a8NZZZU7r
         GvPWvJZLXvBit3525yLElGLa2lm9bpWNTPQpfw11mt3Szhoj/TPF/22k8pOe4Kuo/7uQ
         560jO89+fCSMb+d8Ly7N6koeo8terAORaZECxRZbZHotdPaEDOUBxFixBhv0t1fOLOAX
         Klgh6t27os8s/TCgGb2Y80f0a94JUHFTDp1pOOW1lmFXLUoZ7vihqN5m8Sj/t5SgLGvc
         jTgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679928576;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B+sMKV4hXt9Y8FmVutJx9ALyxrQpOlHZRgFJ2uj+OmM=;
        b=uaXibBrx7IMdeFwRxPLEuPbYKmsalZKNCDmswmQ601BSmTrRmmz8dzlYknXx/fduwm
         ubyw7b0b8yUdlZ8L5oHUMI2CDs9JKs8Y2gXSf7Z/QB0zzzwoRi3koqSq/QtQ2UTFzkct
         POjfkzr/x5zANc/5RlkqSovi1f8b2+E/Tln19pLoKybneam+t5KzcXMrFAkXS4/eiPvB
         +76ce1+ju1vTkylghtEcQij5SNaQEP3Amm+fDQvdwqP6BDNmehRtqHqliQf1786cqCB/
         3IjyvwlvHQPyotHEuxEAtXtBjVPi4v2UAgRKu3+mH9KlCsgyzHds5SIwu1JNRJfNXhSX
         YIkA==
X-Gm-Message-State: AAQBX9f43re8wS1JWC4hAFL2qXCwivtGdpxZ2kyum9wI51ZC31kFlYkp
        LwXF/LOs8PrAeI2Ceuk7RC+WUg==
X-Google-Smtp-Source: AKy350YyMDgs7XjncInC0ARSS0qHYfcIKMQGXI4JKu5X5pS7WplEAVFbKVVNw52PN1xsTlY94WcgZQ==
X-Received: by 2002:aa7:d806:0:b0:4ac:bcf9:6d6c with SMTP id v6-20020aa7d806000000b004acbcf96d6cmr11153021edq.36.1679928576071;
        Mon, 27 Mar 2023 07:49:36 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:581e:789c:7616:5ee? ([2a02:810d:15c0:828:581e:789c:7616:5ee])
        by smtp.gmail.com with ESMTPSA id u5-20020a50d505000000b004c09f0ba24dsm14757297edi.48.2023.03.27.07.49.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 07:49:35 -0700 (PDT)
Message-ID: <ef2c448b-ee5a-bde1-d207-1dbdb8cdd4aa@linaro.org>
Date:   Mon, 27 Mar 2023 16:49:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 16/18] dt-bindings: regulator: qcom,rpmh: add
 compatible for pmm8654au RPMH
Content-Language: en-US
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Mark Brown <broonie@kernel.org>
References: <20230327125316.210812-1-brgl@bgdev.pl>
 <20230327125316.210812-17-brgl@bgdev.pl>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230327125316.210812-17-brgl@bgdev.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27/03/2023 14:53, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Add the compatible for the pmm8654au RPMH regulators present on the
> sa8775p-ride development board.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Cc: Mark Brown <broonie@kernel.org>
> ---
>  .../bindings/regulator/qcom,rpmh-regulator.yaml    | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
> index a765837dc069..91054ed04c66 100644
> --- a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
> +++ b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
> @@ -78,6 +78,7 @@ properties:
>        - qcom,pmg1110-rpmh-regulators
>        - qcom,pmi8998-rpmh-regulators
>        - qcom,pmm8155au-rpmh-regulators
> +      - qcom,pmm8654au-rpmh-regulators
>        - qcom,pmr735a-rpmh-regulators
>        - qcom,pmx55-rpmh-regulators
>        - qcom,pmx65-rpmh-regulators
> @@ -244,6 +245,19 @@ allOf:
>        patternProperties:
>          "^vdd-s([1-9]|10)-supply$": true
>  
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - qcom,pmm8654au-rpmh-regulators
> +    then:
> +      properties:
> +        vdd-l2-l3-supply: true
> +        vdd-l6-l7-supply: true
> +        vdd-l8-l9-supply: true

What about l1, l4 and l5 supplies?


Best regards,
Krzysztof

