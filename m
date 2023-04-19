Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 241346E80D7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Apr 2023 20:06:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233337AbjDSSGL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Apr 2023 14:06:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232786AbjDSSGK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Apr 2023 14:06:10 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C8AA61AB
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Apr 2023 11:06:08 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id fy21so374768ejb.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Apr 2023 11:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681927567; x=1684519567;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jvCt3MywFrcX9GHqlm3zcnse8V+3gXrJugEUN4idsnw=;
        b=EzfCCYkVCLb2BQNhpT8c00YwjvF+DJAXdwFOhgWEZeVlGAjdR0EdCTh9LDIDAHWAPb
         5SNr2emCsOF3HrZE2h4vQ5EW6q3DMbeMI284TeAHop5vi/FlFflmM4zKyKuCIM8hwd1E
         8CiRD+p8GcyMdeDamDHOyx9TI3xAffzC3vxGU5ftq9QbCASHW5tsUn7bjpF9XXgCSkTD
         NKFOzJBlSHRpkt+WUDLowdyEU6SifzFGlUMtIBrrcSjYZM3tZtupKR5oJx19C4nR4l3/
         ueI2fncC2jXh22K6CJplLYpF5QsPSJV/TYU3Tm6j+8R/HdBu7JnTkiAyVA5lu0RJdVk3
         Vz7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681927567; x=1684519567;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jvCt3MywFrcX9GHqlm3zcnse8V+3gXrJugEUN4idsnw=;
        b=SiILgHM4+zFO51Zh7mYa2ocfoZVrbkIb0JtcPF3VPZ1hT1p3NehNjI2SSqcrDXJ9nQ
         M6OVftHfxGUmoyvoOJDSn7zOLfA/YXdWIA/SxEU0llKu+eJOyve24ZB9rsWLmEtmGW6L
         xDqMtfoR/DZDZ5Tl8xAm+JIReAzlvSmxufwGaDs9taFtaozaPZe7WfQL8U72ln2t4TON
         OJkJKPggcqiqmWb6gl+KoLjGQWMGYKwFsat2cyuIp1+uxOEpYSrazSndEx92hjc8mQVU
         4ZtRiZHg+rgXv68PQ6TktiEyS7J4cUWQElDF8lgcg2phPvfl7z2pn5pXqnNog0wqs9WW
         Qqlg==
X-Gm-Message-State: AAQBX9f+zod39tw3bctwPUoEy7/jIjtpBxHS01FYv3ovzB9Jm0mD39dd
        pg9y83AGs/SaWenLt5MoMlVTqQ==
X-Google-Smtp-Source: AKy350Z1kQaGqxZpRrHlcGb8/o5E+CPyrAvlnkfJSBEVz7jTcsZ1Val0XBAReq1zz/NEb7k3I5jCIQ==
X-Received: by 2002:a17:907:a70e:b0:953:429e:fff6 with SMTP id vw14-20020a170907a70e00b00953429efff6mr4586906ejc.51.1681927566817;
        Wed, 19 Apr 2023 11:06:06 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:b7d8:d88b:1fac:c802? ([2a02:810d:15c0:828:b7d8:d88b:1fac:c802])
        by smtp.gmail.com with ESMTPSA id f4-20020a170906ef0400b0094f969e877bsm3839652ejs.43.2023.04.19.11.06.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Apr 2023 11:06:06 -0700 (PDT)
Message-ID: <206724fd-dc64-9724-8541-34325a1b96c7@linaro.org>
Date:   Wed, 19 Apr 2023 20:06:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 1/8] dt-bindings: pinctrl: qcom,pmic-gpio: add PMI632
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Stephen Boyd <sboyd@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-doc@vger.kernel.org
References: <20230414-pmi632-v2-0-98bafa909c36@z3ntu.xyz>
 <20230414-pmi632-v2-1-98bafa909c36@z3ntu.xyz>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230414-pmi632-v2-1-98bafa909c36@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18/04/2023 18:43, Luca Weiss wrote:
> Document the 8 GPIOs found on PMI632.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

