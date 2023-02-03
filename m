Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8B22689F6C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Feb 2023 17:37:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232576AbjBCQhh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Feb 2023 11:37:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232392AbjBCQhg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Feb 2023 11:37:36 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D0E210D4
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Feb 2023 08:37:35 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id v13so5698284eda.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Feb 2023 08:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4wcL0nQRhBAWB1PMR9qb7XiJJ/6J443HseXKG3FZopw=;
        b=L28byQkfPMPWQIn+VRbwrmpGzFAP6BdovDv0YYOB0OSKkJtVKvQq4RP2Psnd46Hh8Q
         tLsHjw6qEhnTJMLmDHrzUAZKJA29g6Ay2uAbeBQ8Yg2wTLA76wiUG2HPaMsH3XVE3JlA
         nv8RyO25XKEmkjR2deACBrA5TqEXuoFNbZUA95gSpI0i+4gYXGRppY5x5qQLQAKXYwiL
         el2+kMKrCx+CT86n525ObPnwXVBf7m3zlimPA4jbzYO4H+pgiR4KP/kEZPEQn41lcWBj
         rWw+GvAR7jtZealKyz3JBA/dbWCWwOYOeT6MkLVTf08HHM2yBvHQN82RS5hQbpDHJKwh
         1GmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4wcL0nQRhBAWB1PMR9qb7XiJJ/6J443HseXKG3FZopw=;
        b=8MqeTLB0Rp46WqaJa93eNu/HxNIKSOC1NorqHadDbn4kRUXTt8AOnOe/jGldifdi2E
         PAhzGQ2z2Jsi2egkVlCCsGIKzeD0zDklC2deTZqbMsuRqqyBwgNRnLt+J+iIHznHoXEt
         CQLUzuND75KDzWQmTGjhiXsk1e140b1KHaig3SdhtpjkiWQJ7156M7mIjrLNVEcPvaEo
         +fBPP2yYqJOub9iefzK2MvVw7iujbN2TK2JA4LdKXJxUxbsK7q5NgDOTuKrKh5RM5t76
         V2m2bPX5gdVDHckWaFJJhsfLiwugiel1WQnEgT09EHJLbXFJGNZklZfr28rQ5KzBb1kt
         99Vw==
X-Gm-Message-State: AO0yUKUCOBe3IwUTzpt+AgtU5wh+Wcnfii6NBlMYUo2RDc/OE+tZ0d8/
        gghmetaCT9kSWxqvGlv1GYHQkw==
X-Google-Smtp-Source: AK7set9YH/fARD2jhh2Go28SGdsvrYw+XFTTSJaV0P7RRj0AgB/AZ4G5hP4Tzd8FaZKC7ljmZga9wQ==
X-Received: by 2002:aa7:d7d0:0:b0:49f:a3d7:b84d with SMTP id e16-20020aa7d7d0000000b0049fa3d7b84dmr10041994eds.34.1675442253732;
        Fri, 03 Feb 2023 08:37:33 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id w12-20020a056402268c00b0049e65e4ff20sm1365815edd.14.2023.02.03.08.37.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Feb 2023 08:37:33 -0800 (PST)
Message-ID: <8254180a-e3ff-9cec-6fc4-6799641314df@linaro.org>
Date:   Fri, 3 Feb 2023 18:37:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC v3 3/7] dt-bindings: phy: qcom,snps-eusb2-repeater: Add phy
 related properties
Content-Language: en-GB
To:     Abel Vesa <abel.vesa@linaro.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-phy@lists.infradead.org
References: <20230202133816.4026990-1-abel.vesa@linaro.org>
 <20230202133816.4026990-4-abel.vesa@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230202133816.4026990-4-abel.vesa@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02/02/2023 15:38, Abel Vesa wrote:
> The phy properties are used for allowing the eusb2 to interface
> with the repeater, which is modelled as a phy driver. Add the phys
> and phy-names properties.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>   .../devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml     | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
> index de72577e34a4..8efb09b2dc5c 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
> @@ -33,6 +33,15 @@ properties:
>     resets:
>       maxItems: 1
>   
> +  phys:
> +    maxItems: 1
> +    description:
> +      Phandle to eUSB2 to USB 2.0 repeater
> +
> +  phy-names:
> +    items:
> +      - const: eusb2-repeater
> +

Do we really need the phy-names? There is a single PHY.

-- 
With best wishes
Dmitry

