Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E6A15517CB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jun 2022 13:52:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236849AbiFTLwQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jun 2022 07:52:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239789AbiFTLwP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jun 2022 07:52:15 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CF58175AB
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jun 2022 04:52:13 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id um5so5624953ejb.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jun 2022 04:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=pjiYiq00+pKffQK8KVZh0Qwi/MjZpnVeHRmOtDA+mME=;
        b=jOg+J0isum7Uf/uwtj5efIGxs5MptaJNpHnAGh3CTv9iRPo/Sng2RTD22nqqpTtjuC
         4WbVQyoUEednhZFWpzlqqnBd0y8Ywhg4a6dVr9yiF/0BRpYgiBxYtmsPLaRBcrha7Gm+
         OAxIRZJ1IX7obzfJCFS6VQeIUbSZuMlZUWUGvsQl1UNqJdC/ZjecBNVmfjnxvYNCxFt/
         uYDjGmS3wO+GaGJqVYl/ohIYjMI60Kh+S1GD1c4BzsgySWwmAiUCd7pHVfCplEuFrgVl
         CcbaysD0xDz/IIrxShg+mHFMQpDaj9DExdBU2YJuRPQSBgTHbDJYE0KB3aE07QO45Yg1
         qBEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=pjiYiq00+pKffQK8KVZh0Qwi/MjZpnVeHRmOtDA+mME=;
        b=jaW9Mf4oFRrN+qwfUrDtmG9hE6wIIptfj/0I9Kqj1qjE0gOXxvWMDrcODzsf+7F+th
         wY1n8xsd9dz3WvrUiSXERGS/SRawJCameLIyzzoetjiws42rpzXdnDbTnYuYkxF52IJc
         aI+FUXfZiYnedGJQDb27MCQIv9Ez56VL0V3MhAJ3uGj0ySHQ1p7D7crR2oQ+tLaXxtWM
         zXgoSq3B6HdhfKeh+dC3XrmWn71oE50LaqrJSjnooAVc0P83YqG1h+XQTh+n0iZ9JXIw
         RGed1SLxTwPBbf9is8bHSfuil7TUuu4DHT5N0L4XgDUEfOMDJNByFMbxchGtiAHvQmlX
         e9QA==
X-Gm-Message-State: AJIora9/wAq7vk9RYR6enxrsJD6wFy16Ibb6mTnrt5oqTUd6TooozvgC
        7RkKhNcT2pOse7zxINvWrbKq2w==
X-Google-Smtp-Source: AGRyM1sZQbtILGoXdAHeknokVlLyAlaxF1ADx9hpjfcfX97km1jjoQIELxTPRCJFoDzO5RzmHVhtsA==
X-Received: by 2002:a17:906:64cb:b0:711:f686:a843 with SMTP id p11-20020a17090664cb00b00711f686a843mr21147101ejn.333.1655725931854;
        Mon, 20 Jun 2022 04:52:11 -0700 (PDT)
Received: from [192.168.0.209] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id s18-20020a170906169200b006fec69a3978sm5749565ejd.207.2022.06.20.04.52.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jun 2022 04:52:11 -0700 (PDT)
Message-ID: <b3b37e00-e3fb-f24e-de02-5a83ca525222@linaro.org>
Date:   Mon, 20 Jun 2022 13:52:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 4/4] ARM: dts: qcom: msm8660: add pxo/cxo clocks to the
 GCC node
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220620110739.1598514-1-dmitry.baryshkov@linaro.org>
 <20220620110739.1598514-4-dmitry.baryshkov@linaro.org>
 <d80d2148-cfc2-8f48-56d5-71f4aae03cb6@linaro.org>
 <CAA8EJpqp92_SOKyU+AjckKC53pDB-i4wsrYx01BySOWNhUaJsA@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAA8EJpqp92_SOKyU+AjckKC53pDB-i4wsrYx01BySOWNhUaJsA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/06/2022 13:25, Dmitry Baryshkov wrote:
> On Mon, 20 Jun 2022 at 14:17, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 20/06/2022 13:07, Dmitry Baryshkov wrote:
>>> Add pxo/cxo clocks to the GCC device tree node.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>  arch/arm/boot/dts/qcom-msm8660.dtsi | 6 ++++--
>>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/arm/boot/dts/qcom-msm8660.dtsi b/arch/arm/boot/dts/qcom-msm8660.dtsi
>>> index 47b97daecef1..61e3ab0ebfd3 100644
>>> --- a/arch/arm/boot/dts/qcom-msm8660.dtsi
>>> +++ b/arch/arm/boot/dts/qcom-msm8660.dtsi
>>> @@ -50,13 +50,13 @@ cpu-pmu {
>>>       };
>>>
>>>       clocks {
>>> -             cxo_board {
>>> +             cxo_board: cxo_board {
>>
>> If you touch this line, please correct the naming for node - no
>> underscores and preferred some prefix or suffix, so:
>> cxo-board-clk
>> clk-cxo-board
> 
> Unfortunately, I don't think it's possible. We are bound by backwards
> compatibility. Node name is used as a clock name. And other drivers
> might reference the clock using the name. Thus, if you check other DT
> files, we also have similar clock node names.

Hm, right, we would need clock-output-names which makes the change a bit
bigger than just adding label.

Best regards,
Krzysztof
