Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE8C06101C2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Oct 2022 21:35:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235973AbiJ0Tfn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Oct 2022 15:35:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236217AbiJ0Tfm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Oct 2022 15:35:42 -0400
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 584C533A3B
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Oct 2022 12:35:38 -0700 (PDT)
Received: by mail-qk1-x729.google.com with SMTP id z30so1837081qkz.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Oct 2022 12:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rbyRCm0Gd+FdmeUyOk0cfhcPZPMWQsesg2OqEvdkBMY=;
        b=j3vz6sFcbQSd0afRiCWntxVUNamj7BKNT3CG8p8boI8cNle6Sh4PTVw09VO/JZIErd
         qBccPwh1v+Q5HW37rBDQAuwGRAv1vEgzVeoBMKLuadehHckfiIHJfOasJpcR1+21wWuX
         U+p0QMSok2HhlUGZ/xCVNh7OIyrU4IuHFiURIQv3CvvFq3wTCgVdDYM8f7ay/kuDO6jR
         bSrg0zapIplvURWvdTahisCfIqmQHQEWCItRR0vsyGT7Vnvf5S+pM8jBX07H8+TcV/XU
         gtQemTMj9BrnbiDL07902TW5n5/uhthi+fvDAbvCObapTCROmBcHeUXNYa3nF+mn9kE/
         T/hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rbyRCm0Gd+FdmeUyOk0cfhcPZPMWQsesg2OqEvdkBMY=;
        b=qLR7NZWurV82pJ0654R8vZIA9meb2j+FuX4OoisdxtOLd6BuD332cZdmi6a3GM36MA
         6/nKji62Rb97EkTikqWaOpTkyQTEW0N6Gl1YbJyZIRcwPrDYYmuiJ0QeFtSuFHFkEtox
         PwI5ddy0naPa9sNHbIfcGhYt+n53Hv82qWWZ87HQnOw9ytT9EuXuXaEUma4gE1FD0u8B
         f27yIOa5vnaYwak5ERvkBz0tYIsEU5mVRL3pC7fw9vRlpVGCmD/uw4HcPaTP9jW3yyjf
         rSmsFaQmLXemJ76wRFYsHkf565i+JPBmBczwFXNWT57pzTLhxaIiSspac/34nsvpFRms
         bG7w==
X-Gm-Message-State: ACrzQf3Bjs10wCVrzFdEVlHXcKVkXGRuNwgANkLMyDphRFNannH9N3tv
        8rRF3EWkTCP3rK1FeCJMmYbZOg==
X-Google-Smtp-Source: AMsMyM7UyL6+b/aQPAI3CY+Xvkdme18kpF4TO6jo+zW0vg83EZsyIQlHiR3SangdxR7Abxx6CvOWCA==
X-Received: by 2002:a37:48c:0:b0:6f8:70d5:9a41 with SMTP id 134-20020a37048c000000b006f870d59a41mr9781062qke.676.1666899337987;
        Thu, 27 Oct 2022 12:35:37 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id g11-20020ac8480b000000b0039cc665d60fsm1289355qtq.64.2022.10.27.12.35.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Oct 2022 12:35:37 -0700 (PDT)
Message-ID: <cb9a2732-0904-4a2b-61a5-a6d65cad58ae@linaro.org>
Date:   Thu, 27 Oct 2022 15:35:35 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v3 1/5] dt-bindings: clock: Add QDU1000 and QRU1000 GCC
 clock bindings
Content-Language: en-US
To:     Stephen Boyd <sboyd@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221026190441.4002212-1-quic_molvera@quicinc.com>
 <20221026190441.4002212-2-quic_molvera@quicinc.com>
 <e5009a33-1f71-1fe3-3a06-98bba031fdf0@linaro.org>
 <20221027182449.366AEC433D6@smtp.kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221027182449.366AEC433D6@smtp.kernel.org>
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

On 27/10/2022 14:24, Stephen Boyd wrote:
> Quoting Krzysztof Kozlowski (2022-10-27 08:54:51)
>> On 26/10/2022 15:04, Melody Olvera wrote:
>>> +description: |
>>> +  Qualcomm global clock control module which supports the clocks, resets and
>>> +  power domains on QDU1000 and QRU1000
>>> +
>>> +  See also:
>>> +  - include/dt-bindings/clock/qcom,gcc-qdu1000.h
>>> +
>>> +properties:
>>> +  compatible:
>>> +    items:
>>> +      - const: qcom,gcc-qdu1000
>>> +      - const: syscon
>>> +
>>> +  clocks:
>>> +    items:
>>> +      - description: Board XO source
>>> +      - description: Sleep clock source
>>> +      - description: PCIE 0 Pipe clock source
>>> +      - description: PCIE 0 Phy Auxiliary clock source
>>> +      - description: USB3 Phy wrapper pipe clock source
>>> +    minItems: 2
>>
>> Why the clocks are optional?
> 
> They should not be optional. They're always there.

Just to be sure - I refer to last three clocks here as indicated by
minItems:2.

DTS does not define them, so something here is not complete or correct.

Best regards,
Krzysztof

