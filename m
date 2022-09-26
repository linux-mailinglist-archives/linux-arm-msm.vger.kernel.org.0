Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65C5B5E99D3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Sep 2022 08:48:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233557AbiIZGsP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Sep 2022 02:48:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233443AbiIZGsN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Sep 2022 02:48:13 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76B1624BEE
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Sep 2022 23:48:12 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id s6so9290058lfo.7
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Sep 2022 23:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=xnB45KVy0Jgmqvqqa4iP23q7Nu/qWxhqmCJpHgjco6w=;
        b=tvjHBcsJmL2XPud8Uer4bOC9txkaora6eR8nrP5h+Vok2cqX4r5azTbIZDe8tapJ4n
         8/aWk5uQJw2LMAN5WuRUNdYkwb+u9BWfYbVHjgedq6hZM0ff4cIBnawp4Y6+1bojlGJS
         84ov4d8ycMORsBMKRzAwuBv2GeAXpbCANhIrbbns6YEx8w7SbCzCP2X1j6yVw3zwTmnL
         LivK70YNqTbW0ZCdxY16ouQIDhpNdblenFrXTQcvtzNoqXUmEl8CMFCysAWCBwP1Mctb
         uDEn3uoi7UMjI181R4AWhgzvE9jkuF+7C63B6556EHDmrx5Gtm/PWUJO4eJC1Sm3ivr1
         uXiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=xnB45KVy0Jgmqvqqa4iP23q7Nu/qWxhqmCJpHgjco6w=;
        b=2QgSpzNMtjxRmijMRn8pefssz0EovezT2MiPSZuW2t1IgL02FA7n6sTNbmcAJ3Fipu
         vnlXFP10Hl9Aq8YjJNrxGOTsBzcNZBkNsEnlbG6310fPYIexiXBSnpXe4yoeTBz9t/6T
         M20ODXc3Ulbeu6fKIZ2aOiDpy2Ym14bmdWBOLabHUYfVa1nU3D0WiU+V92VE4+cMCUeS
         ygZ3+52tovyk7QB106V4Kg0TYrz9Dh8OfmJeR9rEdMViZmrQpABP0DkfkhUoKi25w1Za
         uuBJVGrw5xdPgN0Rtx+za+1GBXckEPlNl621EzXiWymsGe90+iZwbcAfBVD4CHxeGqcT
         hHjw==
X-Gm-Message-State: ACrzQf2PKXexd0i0AaNIBslQunusGH1GLcJn0Qq1m9sKl7dF5/LL2Z0r
        YUT8VUOwqKKyHQl+umCbKYo9CQ==
X-Google-Smtp-Source: AMsMyM5xQLsMt+mT+gwGq0IiKT0zS1FucufeCIblvlZU2Da5RRo5Ahailez9kxVVrHpY5PaOe+tZ0Q==
X-Received: by 2002:a05:6512:1092:b0:4a1:de5f:1cc9 with SMTP id j18-20020a056512109200b004a1de5f1cc9mr258895lfg.219.1664174890794;
        Sun, 25 Sep 2022 23:48:10 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id w6-20020a05651234c600b0049f6484694bsm2440444lfr.161.2022.09.25.23.48.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Sep 2022 23:48:10 -0700 (PDT)
Message-ID: <cdfe6f83-266a-de8b-d518-cc8b7fd45732@linaro.org>
Date:   Mon, 26 Sep 2022 08:48:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 17/32] dt-bindings: pinctrl: qcom,msm8909-tlmm: do not
 require function on non-GPIOs
Content-Language: en-US
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sricharan R <sricharan@codeaurora.org>,
        Shawn Guo <shawn.guo@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220924080459.13084-1-krzysztof.kozlowski@linaro.org>
 <20220924080459.13084-18-krzysztof.kozlowski@linaro.org>
 <YzBe5NdhGqR+2bxN@gerhold.net>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <YzBe5NdhGqR+2bxN@gerhold.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25/09/2022 16:00, Stephan Gerhold wrote:
>> +    allOf:
>> +      - $ref: "qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state"
>> +      - if:
>> +          properties:
>> +            pins:
>> +              pattern: "^gpio([0-9]|[1-9][0-9]|10[0-9]|11[0-7])$"
>> +        then:
>> +          required:
>> +            - function
>>  
> 
> Is it possible to place this into qcom,tlmm-common.yaml? If the pattern
> is only used to make "function" required for GPIOs, then it should not
> matter if it matches just the prefix ("^gpio") or the exact set of
> allowed GPIO numbers. The definition of the "pins" property will already
> take care of validating those.

Hm, very good idea.

> 
> Or are there some Qcom SoCs where a GPIO without "function" is valid?

Quick look at drivers says there is no such case. I can try adding it to
common schema and look for errors.


Best regards,
Krzysztof

