Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 868FD6281F7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Nov 2022 15:07:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236826AbiKNOHz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Nov 2022 09:07:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236712AbiKNOHr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Nov 2022 09:07:47 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10A8A2B27C
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 06:07:45 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id z24so13319825ljn.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 06:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6ccwwIW79Q1wp+RCdp9ccn6uwmegByz56nlURvMAyHY=;
        b=SpFp1v9ZAJjhp6EB36WNfg60TtbpBMj1tGYf5Trjvq7kSClFo+db38EYFIgBD2Jq05
         D4P9Qh7q4B8WRTZ/e3E4AJKz6VGjEZxwD8WkwLqeGLxD2LjCQ40glrzrejMQK5h38AD2
         7Sy1JUB/6EUHFoOcol9NfTZPJlBENQAlJH81oj7qIynD9iKfC3ErObZ+rQLYhXr/QiXE
         8gyEAD5Z/s2latNJxLt/nvqIs64H2da9UdD71RqV1XdMt7cPzBwM+FdxACq0bGE75TNs
         L/fmK7AeZXlhEHFNtNi2CXgXgeR+JT2dS4T4gR4Zhf0t+zOMdXbXaTfigipM84GYobcj
         ne9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6ccwwIW79Q1wp+RCdp9ccn6uwmegByz56nlURvMAyHY=;
        b=YvOW2LL4pl4ZkWdH1oLkeLncwvUFmyMKsEQImfRhdvRN8iv7AWtIWm7GpaAHcB6NMa
         kJqQi8C/DPX1edF4978d4pd7HU8RgA99krP6DqxFXf2PvpQLsT29oYb50iWglwPRwyIq
         ixwmJm/3CIAzVR1t09keZjVN6AuOfpe8EBP3CUWjK6nvtbsAZkmX8Uc+3zBV6PXMWwr2
         56MR7SnJUYZMfT7noOWAKdTIyH7OqnCnJ6/87BNlMKmT1X8O7RjpKTiiW0bxMpSqlUQZ
         b5L/ZrlQEgrLoCqkF8/lkXkTAGtpwT1as846vsEKAzSZ2vPeHksQnWDeg0i7tzvs64TI
         9EAA==
X-Gm-Message-State: ANoB5pkb4d8TzpoAVG04+PC3SvwI7E0C83i/dhjvHCLGPe4043akMUtK
        LVH74Mpx66iAKxCIR3p8bZzqZw==
X-Google-Smtp-Source: AA0mqf7LC1QOnDuEDlFCopCuZ50Oj0F1+LypAIKaZQov5Bfx4JKEL735MyUsWqrx6y2vkADZoL4cLg==
X-Received: by 2002:a2e:3216:0:b0:277:295:982e with SMTP id y22-20020a2e3216000000b002770295982emr3888991ljy.11.1668434863376;
        Mon, 14 Nov 2022 06:07:43 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id r22-20020ac24d16000000b0049944ab6895sm1830010lfi.260.2022.11.14.06.07.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Nov 2022 06:07:42 -0800 (PST)
Message-ID: <de3a426a-03e8-ed15-a9a1-bb300e776e5f@linaro.org>
Date:   Mon, 14 Nov 2022 15:07:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 02/14] dt-bindings: phy: qcom,qmp-usb3-dp: fix sc8280xp
 bindings
Content-Language: en-US
To:     Johan Hovold <johan@kernel.org>
Cc:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221111092457.10546-1-johan+linaro@kernel.org>
 <20221111092457.10546-3-johan+linaro@kernel.org>
 <a22888cd-34cb-3453-0dc2-096da208564c@linaro.org>
 <Y3JCVzJ74YsfcDz4@hovoldconsulting.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y3JCVzJ74YsfcDz4@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
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

On 14/11/2022 14:27, Johan Hovold wrote:
> On Fri, Nov 11, 2022 at 04:17:29PM +0100, Krzysztof Kozlowski wrote:
>> On 11/11/2022 10:24, Johan Hovold wrote:
>>> The current QMP USB3-DP PHY bindings are based on the original MSM8996
>>> binding which provided multiple PHYs per IP block and these in turn were
>>> described by child nodes.
>>>
>>
>> Thank you for your patch. There is something to discuss/improve.
>>
>>
>>> +
>>> +maintainers:
>>> +  - Vinod Koul <vkoul@kernel.org>
>>
>> Maybe you want to add also yourself?
> 
> Due to the lack of public documentation for these platforms and the
> amount of work involved in effectively reverse-engineering the
> corresponding details from random vendor-kernel trees, it's probably
> best to leave maintainence with Vinod who at least has access to some
> documentation.
> 
>>> +
>>> +description:
>>> +  The QMP PHY controller supports physical layer functionality for a number of
>>> +  controllers on Qualcomm chipsets, such as, PCIe, UFS and USB.
>>> +
>>> +  See also:
>>> +    - include/dt-bindings/dt-bindings/phy/phy.h
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - qcom,sc8280xp-qmp-usb43dp-phy
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  clocks:
>>> +    maxItems: 4
>>> +
>>> +  clock-names:
>>> +    items:
>>> +      - const: aux
>>> +      - const: ref
>>> +      - const: com_aux
>>> +      - const: usb3_pipe
>>> +
>>> +  power-domains:
>>> +    maxItems: 1
>>> +
>>> +  resets:
>>> +    maxItems: 2
>>> +
>>> +  reset-names:
>>> +    items:
>>> +      - const: phy
>>> +      - const: common
>>> +
>>> +  vdda-phy-supply: true
>>> +
>>> +  vdda-pll-supply: true
>>> +
>>> +  "#clock-cells":
>>> +    const: 1
>>> +
>>> +  clock-output-names:
>>> +    items:
>>> +      - const: usb3_pipe
>>> +      - const: dp_link
>>> +      - const: dp_vco_div
>>
>> Why defining here fixed names? The purpose of this field is to actually
>> allow customizing these - at least in most cases. If these have to be
>> fixed, then driver should just instantiate these clocks with such names,
>> right?
> 
> I'm only using these names as documentation of the indexes. The driver

What do you mean by documentation of indexes? You require these specific
entries and do not allow anything else.

> doesn't use these names, but that's a Linux-specific implementation
> detail.
> 
> I noticed that several bindings leave the clock indexes unspecified, or
> have header files defining some or all of them. I first added a QMP
> header but that seemed like overkill, especially if we'd end up with
> one header per SoC (cf. the GCC headers) due to (known and potential)
> platform differences.

Headers for the names? I do not recall such but that does not seem right.

> 
> On the other hand reproducing this list in each node is admittedly a bit
> redundant.
> 
> Shall I add back a shared header for all PHYs handled by this driver
> (another implementation detail) even if this could eventually lead to
> describing clocks not supported by a particular SoC (so such constraints
> would still need to be described by the binding somehow):
> 
> 	/* QMP clocks */
> 	#define QMP_USB3_PIPE_CLK	0
> 	#define QMP_DP_LINK_CLK		1
> 	#define QMP_DP_VCO_DIV_CLK	2

What are these about? To remind - we talk about names of clocks this
device creates. The output names. Whatever IDs you have are not related
to the names.


Best regards,
Krzysztof

