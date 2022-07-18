Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30D9D578066
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Jul 2022 13:04:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233438AbiGRLEv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Jul 2022 07:04:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233110AbiGRLEu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Jul 2022 07:04:50 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7CB6D135
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jul 2022 04:04:49 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id h14-20020a1ccc0e000000b0039eff745c53so7088798wmb.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jul 2022 04:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=s3SRUTT91L1y7t5GEOjZj8HDPa0Q/SNBknuFzvo8kak=;
        b=cC7xMYRTsj14RSQCXLyHwxZPnpL6BxrHiH6twSi57FxGc7wGXhagNBYZAu5tD4T23k
         PauuGEDwNAMPP5SEoUh/fSddrTS9NwEWE0B2NP4VCbExQwNz9VqOvcSaJv8bbO19gGV7
         qAANXIPZdbyyQfX+t8JThNxh6ls/Djboy5KwZhJjLQ4XZOVCAKEik8PQFOh3nkSbZin5
         CkeyJ7pfl4CYg2l4NyN8UxYx2pIjovHdOyxqKLrorsPCt8mVgWRK0C0CAT6owczL7Kx3
         VDIA/r23OfGzWH7ZH/pD3SkNmwgu28GBTcn52xpsAcGCuarbBAPmEgXC1+4904thPPNd
         d1oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=s3SRUTT91L1y7t5GEOjZj8HDPa0Q/SNBknuFzvo8kak=;
        b=v//JMrecFlSRxfeOICrzVg5mwT3HRGkAEMa1Xl6esK6B/tkmtmx9dB5p1m8FWTqQ7K
         oyE2WAyI3itl3tiY2SM0OjrOByy4eOMmKQxPVUkn3jsGDQu6/H8tNJ8xHlf/r7T3P2e4
         lIuzekZRmg1pWcL2HyHIr/NAll5Pd2b5yO9wkAkBtnayDLkCymFdifVHl1FFWxoiBVtk
         XYTlus4eO990utRtcFa7nSM7sCJXkyJDEIkJr5vNIJFvPd24Zv6JSxxG5rNIuxZY/BEA
         jusKs/7+/dEfJoL1iaISiMDccSTJ1EEuI4gepr3wt8ogfru3nRd3gVyHivllh/HO/fLn
         xSgA==
X-Gm-Message-State: AJIora+wMTUxbTPOQ4MNerREM4k//xjanFEN5Ub5G8ZN2Op7wElYRbQK
        qleBzqkYM3l7wQsQG35ALsFw6A==
X-Google-Smtp-Source: AGRyM1vsLPYI0d/Lf4ZAHX1xyAY0P59hAVrEnm/Pw31rXNSNR4XdvSMazEhHS4wXHN7XU4vI8v0y+w==
X-Received: by 2002:a05:600c:22c2:b0:3a3:19e3:a55 with SMTP id 2-20020a05600c22c200b003a319e30a55mr5008777wmg.53.1658142288482;
        Mon, 18 Jul 2022 04:04:48 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id v1-20020adfebc1000000b0021b98d73a4esm10639826wrn.114.2022.07.18.04.04.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Jul 2022 04:04:48 -0700 (PDT)
Message-ID: <f7cbe267-b8c4-7b4d-ef31-22fd863bda1e@linaro.org>
Date:   Mon, 18 Jul 2022 12:04:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3 2/2] dt-bindings: mailbox: qcom,apcs-kpss-global: Add
 clock-output-names
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        konrad.dybcio@somainline.org, jassisinghbrar@gmail.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        shawn.guo@linaro.org
References: <20220717213645.1147342-1-bryan.odonoghue@linaro.org>
 <20220717213645.1147342-3-bryan.odonoghue@linaro.org>
 <CAA8EJppnnjphLJC2fFW9Lz06fUZTw8kxS6L+s0kP0+i+1Yh+_A@mail.gmail.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <CAA8EJppnnjphLJC2fFW9Lz06fUZTw8kxS6L+s0kP0+i+1Yh+_A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18/07/2022 11:33, Dmitry Baryshkov wrote:
> On Mon, 18 Jul 2022 at 00:37, Bryan O'Donoghue
> <bryan.odonoghue@linaro.org> wrote:
>>
>> Add clock-output-names as optional so that SoCs such as the msm8939 which
>> have multiple a53 PLLs can latch the appropriate output name in
>> drivers/clk/qcom/apcs-msm8916.c.
>>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
>>   .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
>> index f504652fc0ea2..7497e4c930ae7 100644
>> --- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
>> +++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
>> @@ -63,6 +63,13 @@ properties:
>>         - const: aux
>>         - const: ref
>>
>> +  clock-output-names:
>> +    maxItems: 1
>> +    items:
>> +      - const: a53mux_c0
>> +      - const: a53mux_c1
>> +      - const: a53mux_cci
> 
> You have probably meant to use enum here.

I do mean enum ...

  However, is there any reason
> why you would like to use fixed output names here? You are going to
> use clocks DT properties (with clock-names or using indices) anyway,
> so there is no dependency on system clock name.
> Compare this with apcs-msm8916.c, which uses a53mux@unit_address.
> 

The answer is because I have this in the dtsi forwarded ported from 4.19 
and like an idiot I didn't check the clock names

a53pll@b016000
a53pll@b116000
a53pll@b1d0000

a53mux@b1d1000
a53mux@b011000
a53mux@b111000

you're right this is old/dead code I don't need it.
