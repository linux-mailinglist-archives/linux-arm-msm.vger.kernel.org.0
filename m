Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A47904FF69F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Apr 2022 14:22:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235459AbiDMMYU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Apr 2022 08:24:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232518AbiDMMYT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Apr 2022 08:24:19 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC7BA5AED7
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Apr 2022 05:21:57 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id lc2so3525607ejb.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Apr 2022 05:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=rpCsgx3BFkd87McXAlT3TS+uWnpM9/0DdzFDUG/S+DM=;
        b=T/CUma3/LAtEtHc+ampE41nM1SAwJ5eQQibUJu6IQ6K22wVvLnJ12fNDGfQwxhsz5Q
         D8UaJclfftEDhKoSN3z4VoeAQkfPmOlFeGcvONWOxLBLrrwjDOwQNQ9ycFqPqb+zpTF3
         +hbkOkQBFVNAuxCxkkKwwIOWXvxjhi+hBNzFYoZIV+jPgvNFxOg3I4p97qtScgkQ7Z03
         OR3muBQgo1bnfegTrrQ40Q+z2EPgqF2iv1jBzM9W314l50LZcyFkIbVkrQveS9JhZVey
         caYf8OlqveXkv1cUN855r2DmnKVWoNtekZAYsUm9zkTohUO0KOFVcT3hMIFDN/TR129l
         HT3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=rpCsgx3BFkd87McXAlT3TS+uWnpM9/0DdzFDUG/S+DM=;
        b=b4fKwsRf6cKTWWhYVv8Gcvoy9bl3leX3oWYzzRDTQOa57K4lspsW4XJSIDm8zCwW8/
         RDAIGMiAIT/dsBWLGqk2an9IJu6Y4KbS+aZZhvwfB4AHXNrdt46SvP+mlt51uTjdaQGT
         CCu8eAPFEK2G4MmNc1dlP1KAsQm4zMyO8Ifkh1y5YRPigTfu0Zu6/z1voI21Q19CmhzA
         GnFg/F9S5+IbBeOiqCUvFdCrtXvbIP+7+vLx7fr3ubIcvS4jPDc/drFN3Uh6pJzvfaX9
         UyTC+2sgBAz731ZEXkun8UR2OT4Vn/krozDqvuSpqm8RmzPWHPeiwfEehI37lzmQNiJ5
         4avw==
X-Gm-Message-State: AOAM531eIi91tPnr97/QEwfogawZ/yYwV7UNKtlAG5PTqO4UsUTxQFG4
        6EZBUJVWN7ZDBiQ5AuDPW0urUw==
X-Google-Smtp-Source: ABdhPJyVp0uKVBeFKv5TzEYR64VTNnxSpPPeU1h2FWBqaeSVx1YQSoxC3AmfYHnsf63Wda8fDap+cA==
X-Received: by 2002:a17:906:8514:b0:6e8:966f:3004 with SMTP id i20-20020a170906851400b006e8966f3004mr12023629ejx.115.1649852516302;
        Wed, 13 Apr 2022 05:21:56 -0700 (PDT)
Received: from [192.168.0.204] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id jl28-20020a17090775dc00b006e05cdf3a95sm14185065ejc.163.2022.04.13.05.21.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Apr 2022 05:21:55 -0700 (PDT)
Message-ID: <a96f56b6-0959-b672-0521-e44e5d9f6fbc@linaro.org>
Date:   Wed, 13 Apr 2022 14:21:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] dt-bindings: interconnect: Add Qualcomm SDX65 DT
 bindings
Content-Language: en-US
To:     Rohit Agarwal <quic_rohiagar@quicinc.com>, agross@kernel.org,
        bjorn.andersson@linaro.org, djakov@kernel.org, robh+dt@kernel.org,
        krzk+dt@kernel.org
Cc:     manivannan.sadhasivam@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1649740053-14507-1-git-send-email-quic_rohiagar@quicinc.com>
 <1649740053-14507-2-git-send-email-quic_rohiagar@quicinc.com>
 <7e1e6c10-c02a-c8da-44c0-ba3abef1950e@linaro.org>
 <99e49c61-4a6a-69c6-810c-581ee0ce5008@quicinc.com>
 <89ad9e08-e0b2-d163-b089-c96ce70509b3@linaro.org>
 <9704adae-54f0-f8f4-1584-aefc2b1de402@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <9704adae-54f0-f8f4-1584-aefc2b1de402@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/04/2022 14:14, Rohit Agarwal wrote:
> 
> On 4/13/2022 12:03 PM, Krzysztof Kozlowski wrote:
>> On 13/04/2022 08:29, Rohit Agarwal wrote:
>>> On 4/12/2022 2:52 PM, Krzysztof Kozlowski wrote:
>>>> On 12/04/2022 07:07, Rohit Agarwal wrote:
>>>>> Add interconnect IDs for Qualcomm SDX65 platform.
>>>>>
>>>>> Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>
>>>> (...)
>>>>
>>>>> diff --git a/include/dt-bindings/interconnect/qcom,sdx65.h b/include/dt-bindings/interconnect/qcom,sdx65.h
>>>>> new file mode 100644
>>>>> index 0000000..8d02c79
>>>>> --- /dev/null
>>>>> +++ b/include/dt-bindings/interconnect/qcom,sdx65.h
>>>>> @@ -0,0 +1,67 @@
>>>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>>> Is it possible to license it the same as bindings (GPL-2.0 OR BSD-2-Clause)?
>>> The qcom related code are marked as GPL 2.0 license
>> This I see here, unless you meant some other qcom related code?
> 
> Yes, I meant the other codes as well because most of them I see (for eg. 
> sdx55) have added only GPL 2.0.

Happens, maybe no one pointed out this. The bindings, including headers
because these are part of bindings, are expected to have (GPL-2.0 OR
BSD-2-Clause) license. Just because some bindings or some binding
headers have GPL-2.0, is not a justification that wrong license should
be used.

Best regards,
Krzysztof
