Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCD59554825
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jun 2022 14:13:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353445AbiFVIaT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jun 2022 04:30:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352995AbiFVIaC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jun 2022 04:30:02 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99740E0A
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jun 2022 01:30:00 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id o23so11303880ljg.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jun 2022 01:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=eDo1oVSdKF5uO1cuGKW7ZAbpzKDD+Gib9NolbbnayOw=;
        b=v/Ut1O/ASxefCDtWLWd24WHMnmlssEQgnVvbGJ2FOqGGzhrGNooaG3D2PAy2RnuW8U
         qJk4vyqVy4Pnn0464UvdSPrHheU2RxYIkeArxtcWJq7OMuLCXPVxZd2tBOZB+DI2ns1h
         MkjsXTrHZoUe3lyDmriZ0vWDi2WN3M8A4Yco552/xLCOPLZxMMOfX8lkyO+zuL4wTrCV
         FexCm6QUDTCiX57+yXKMvo8388PHH6AriVDt448aASfi46U34Zjk9dTZjw0MpLxFf0u3
         dfUoVTg9bDR5LpBsgDmAPmoISMofItmvr5pbMGDTtYbPpHqN3zJQ0srUnP9F63WPXi9w
         BLCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=eDo1oVSdKF5uO1cuGKW7ZAbpzKDD+Gib9NolbbnayOw=;
        b=Ae1BfamSIQ1lc1+CM6jSldXWWSwsvWQfKWg9rGJ8iMsX2fYT3F1RPDbPloebvVYMF8
         gzhIsG/B/cq3mD9GfwPMhKSBKZlB0GnH0G+UK43X/ZkopHrrPcij9pOaG7ADNAkJJwVW
         lNeRdSXHuBErfUwl+x/IVa9J0PYaEvJSE9hnwGy502bS/RGPl3Y05bEoZ3NYnekCerNg
         JKEY/YX18Mr4nOzz5WDtaffu1j6JkTVfldbhtya651w9Jq8xAuw3gZ0uKfzT4+44Inx3
         2ZSHk+bzXvvM7QaF43GSH7elq/7RCcEOjNHemdsBPXH6yWvmlj83Fd1n5iNeWXFnMaOZ
         O1/g==
X-Gm-Message-State: AJIora84viM6pbITboUOkKXFxnCJkSMDAl7vDlF78G2bYevm/Ka3wxQz
        icmI1PhQUdBg4bkLZdgtzRVBqw==
X-Google-Smtp-Source: AGRyM1uKAWxAN3bqc+ijQRjTXI0nOOH8kl9G2j5cOHDqBwksuSlrAfSy+86sMAFEyc7Z3VsOlEGrnA==
X-Received: by 2002:a2e:97d0:0:b0:255:7c1c:f3ba with SMTP id m16-20020a2e97d0000000b002557c1cf3bamr1204652ljj.49.1655886598914;
        Wed, 22 Jun 2022 01:29:58 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id i18-20020a196d12000000b0047f8e9826a1sm339166lfc.31.2022.06.22.01.29.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jun 2022 01:29:58 -0700 (PDT)
Message-ID: <dd63b876-54ad-65ac-02fc-e75464071232@linaro.org>
Date:   Wed, 22 Jun 2022 11:29:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/4] dt-bindings: arm: qcom: document qcom,msm-id and
 qcom,board-id
Content-Language: en-GB
To:     Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Rob Clark <robdclark@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        Kumar Gala <galak@codeaurora.org>
References: <20220529202629.47588-1-krzysztof.kozlowski@linaro.org>
 <20220529202629.47588-2-krzysztof.kozlowski@linaro.org>
 <20220605150747.GA3465286-robh@kernel.org>
 <54015d41-d4eb-12ae-5bd1-00d2c3cf7814@linaro.org>
 <20220610163343.GA1787330-robh@kernel.org>
 <89d6735a-61eb-08cf-8d4a-6fb1b2d457ad@linaro.org>
 <CAL_JsqKL-mtAQ8Q9H4vLGM8izVVzDPbUAVWSdS8AmGjN6X6kcA@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAL_JsqKL-mtAQ8Q9H4vLGM8izVVzDPbUAVWSdS8AmGjN6X6kcA@mail.gmail.com>
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

On 13/06/2022 18:30, Rob Herring wrote:
> On Sat, Jun 11, 2022 at 7:07 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 10/06/2022 18:33, Rob Herring wrote:
>>> On Tue, Jun 07, 2022 at 01:15:51PM +0200, Krzysztof Kozlowski wrote:
>>>> On 05/06/2022 17:07, Rob Herring wrote:
>>>>> On Sun, May 29, 2022 at 10:26:26PM +0200, Krzysztof Kozlowski wrote:
>>>>>> The top level qcom,msm-id and qcom,board-id properties are utilized by
>>>>>> bootloaders on Qualcomm MSM platforms to determine which device tree
>>>>>> should be used and passed to the kernel.
>>>>>>
>>>>>> The commit b32e592d3c28 ("devicetree: bindings: Document qcom board
>>>>>> compatible format") from 2015 was a consensus during discussion about
>>>>>> upstreaming qcom,msm-id and qcom,board-id fields.  There are however still
>>>>>> problems with that consensus:
>>>>>> 1. It was reached 7 years ago but it turned out its implementation did
>>>>>>     not reach all possible products.
>>>>>>
>>>>>> 2. Initially additional tool (dtbTool) was needed for parsing these
>>>>>>     fields to create a QCDT image consisting of multiple DTBs, later the
>>>>>>     bootloaders were improved and they use these qcom,msm-id and
>>>>>>     qcom,board-id properties directly.
>>>>>>
>>>>>> 3. Extracting relevant information from the board compatible requires
>>>>>>     this additional tool (dtbTool), which makes the build process more
>>>>>>     complicated and not easily reproducible (DTBs are modified after the
>>>>>>     kernel build).
>>>>>>
>>>>>> 4. Some versions of Qualcomm bootloaders expect these properties even
>>>>>>     when booting with a single DTB.  The community is stuck with these
>>>>>>     bootloaders thus they require properties in the DTBs.
>>>>>>
>>>>>> Since several upstreamed Qualcomm SoC-based boards require these
>>>>>> properties to properly boot and the properties are reportedly used by
>>>>>> bootloaders, document them.
>>>>>
>>>>> My primary issue here is accepting this will be an endorsement for
>>>>> other vendors doing something similar. I'm not against an ID
>>>>> property(ies) in the root node, but would rather see something common
>>>>> if we do anything.
>>>>
>>>> Hi Rob,
>>>>
>>>> A more common approach was merged back in 2015 - encoding this ID
>>>> information in the board compatibles. If I understood previous
>>>> discussion correctly, this common method was later used by Qualcomm DTB
>>>> post-processing tool. At least for some of the cases.
>>>>
>>>> Other cases (several Qualcomm boards from different vendors) still use
>>>> these ID properties. It even turns out they use it differently between
>>>> vendors (e.g. Xiaomi vs OnePlus).
>>>>
>>>> Important arguments for documenting these properties:
>>>> 1. These ID properties are already on released boards where changing
>>>> bootloader is non-trivial or even not possible. It will not be possible
>>>> to remove these properties, without seriously affecting the community
>>>> working with them.
>>>
>>> Accepting things because they are already in use is also not a path we
>>> want to go down. If it's the color of the bike shed, then fine.
>>>
>>>> 2. According to Konrad [1] (second paragraph), newer chipsets (starting
>>>> with sm8350 released in 2021) do not use these properties. These newer
>>>> DTS do not have them.
>>>>
>>>> Considering 1+2 above, maybe let's document these properties as
>>>> compatible? Would that solve your point of "endorsement for other vendors"?
>>>
>>> What do you mean? Only allow them for certain root compatible strings? I
>>> suppose that would be okay by me. It would also be useful documentation
>>> of where they are needed.
>>
>> Bah, I wrote something else than I had in mind. So one more try:
>>
>> Considering 1+2 above, maybe let's document these properties as
>> *deprecated*? Would that solve your point of "endorsement for other
>> vendors"?
> 
> Yes.

It seems point 2 is not 100% correct. Qualcomm has been using these 
properties in the sm8350 and sm8450 dts files.

However to I'd suggest to continue with the agreement to mark these 
properties as deprecated (and compat-bound to Qualcomm devices/root 
compatible strings). Which means that adding them to the new DT file 
would require some justification. For example 'the board fails to boot 
without these properties' or 'we are demanded to provide a single boot 
image and using these properties allows bootloader to select the correct 
DTs.

> 
>> However the idea to restrict them per-compatible, is also nice. Although
>> I cannot guarantee the list will not grow for older SoCs.
> 
> No issue with that.
> 
> Rob


-- 
With best wishes
Dmitry
