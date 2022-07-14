Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85141574E6B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jul 2022 14:55:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239176AbiGNMzM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jul 2022 08:55:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231347AbiGNMzL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jul 2022 08:55:11 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2916481F9
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 05:55:09 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id r9so2630767lfp.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 05:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=htN8c5e/clHdwV/pWm6QotC7JCLAfymyLpwHsXpBxmk=;
        b=tywqxw4y2sqVdVvdCQmJ5CKbw0PBTJgqdNBPxC2b2ACQ41Ei7YYBZVE1G1OwGkPhcF
         wmFRjHM9GqNZEvomGQNDB+50mROUbUmL2Ek5H8KV2aVEQwT49dbzcvJc5eegLD4FK850
         mjF3LozalrWPctG13HOLFTfPpbJxrl1xUUHs1OJt62mZRuxDjvY9x2lLwSjjzfr6QUeS
         B4iUC96DYGF+8qZLHyJc8RrIQB747y48SAIO0pdaH4/4KqDNxst0UidOJiPNVKJYd9C6
         rvQJ77x+KCN7K0ffjght3eSaB03ZRQCaruJxJy1jjq0wekY6VfgYLWUMLbgoQtPCrYlw
         dghg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=htN8c5e/clHdwV/pWm6QotC7JCLAfymyLpwHsXpBxmk=;
        b=C6PpUVgCmZZTQwrU49ljW/HAK0pDGSRbeQkjwYISyrHQOB+OhAFFFA+BgBBIGRFgah
         p1sh8Vmpu/RoY8TxLIUxSxpgvVhh1uoTLNEoYmQ4DI3/8Y+dnAIrRLCHPn1g3Ikr3vAX
         InFqcroA6EB5Y5335qchps6kO9K6gyAgUWV8N+eVYxn1vaC1PPynkXayt4WuaNazZ64I
         AvYK4TUCXqGp8AkOFtLbRouFZOndwkp88AzZTJn88p1cJn7u/A9nt2G7SdLzpg+tmNGY
         Neau8FCKKP1iDmaCfuF04/s4gcUkchc+Ck0TZRu47YUNRFcjsZWB+vbfjRo9ZloR6Mbg
         A/tg==
X-Gm-Message-State: AJIora+w7yuWF00IoGDHUDq8A4x4mktlmW2kwdJSgdVrz6TEM4VTTbhA
        GR8Yqev9yuzGjXFNH0vOLQiBRw==
X-Google-Smtp-Source: AGRyM1tE+kix12/jjaJK26eAoX32moOOAR1WjGNwla6iNBAsn0fbYTT0OYBcTTkOddsITmqZk2M5Tg==
X-Received: by 2002:a05:6512:2812:b0:489:e611:5546 with SMTP id cf18-20020a056512281200b00489e6115546mr5309482lfb.638.1657803308260;
        Thu, 14 Jul 2022 05:55:08 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u20-20020a05651220d400b0047255d21132sm347067lfr.97.2022.07.14.05.55.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jul 2022 05:55:07 -0700 (PDT)
Message-ID: <7f555901-da65-59d5-9997-b93baab20ce9@linaro.org>
Date:   Thu, 14 Jul 2022 15:55:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v1 1/4] dt-bindings: clock: qcom: add bindings for dispcc
 on SM8450
Content-Language: en-GB
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220623114737.247703-1-dmitry.baryshkov@linaro.org>
 <20220623114737.247703-2-dmitry.baryshkov@linaro.org>
 <YsX0YdV40Zp55wz8@builder.lan>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <YsX0YdV40Zp55wz8@builder.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/07/2022 23:45, Bjorn Andersson wrote:
> On Thu 23 Jun 06:47 CDT 2022, Dmitry Baryshkov wrote:
> 
>> Add device tree bindings for the display clock controller on Qualcomm
>> SM8450 platform.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   .../bindings/clock/qcom,dispcc-sm8450.yaml    | 132 ++++++++++++++++++
>>   1 file changed, 132 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/clock/qcom,dispcc-sm8450.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8450.yaml b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8450.yaml
>> new file mode 100644
>> index 000000000000..953d20a25cfb
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8450.yaml
>> @@ -0,0 +1,132 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/qcom,dispcc-sm8450.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Display Clock & Reset Controller Binding for SM8450
>> +
>> +maintainers:
>> +  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> +
>> +description: |
>> +  Qualcomm display clock control module which supports the clocks, resets and
>> +  power domains on SM8450.
>> +
>> +  See also:
>> +    dt-bindings/clock/qcom,dispcc-sm8450.h
> 
> Please prefix this with include/
> 
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,sm8450-dispcc
>> +
>> +  clocks:
>> +    items:
> 
> I really think we should include a reference to GCC_DISP_AHB_CLK here.
> 
> There are two cases here, either the implementation does what we do in
> Linux and just always-on the clock from gcc, in which case there's
> nothing in here to ensure probe order and that the clock is actually on
> before dispcc probes.
> 
> The other case would be that the implementation doesn't always-on the
> gcc clock, in which case we need the reference.

Let me check how does this work on earlier platforms. We might want to 
update them too. Or even better, we can make actual use of DISP_AHB_CLK.


-- 
With best wishes
Dmitry
