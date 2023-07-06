Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CEF0474A044
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jul 2023 17:00:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230217AbjGFPA2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jul 2023 11:00:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230235AbjGFPA0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jul 2023 11:00:26 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EBED10C
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jul 2023 08:00:25 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4f004cc54f4so1049381e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jul 2023 08:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688655623; x=1691247623;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yqwpPlMfIW0CMr+QI2pcqMAVZYszNSjNkLx+8OvN8jE=;
        b=qGrJhXum9FM9HtnmH7X2GBoEc9f+XcihwHBF9ods64JRXacyvxquTwtMTbnVNFRoMs
         F8kcGFE96u0ZWNdH5iMQ0OTaQzRUce0FBgewaqepWiLw56jTOCgjaAQ+I5InQ6dmFCe6
         9UdhYLDfQoF+T5fHTQhivEkXXgzTqiHvQ6EzSkQK6+0xDkwG/sj13wgj6/gjK/+msDtc
         QkgQRKRdKwszZhcsjfNU/VLD+yuJzuXikxbJrX4FSZCZ4pXTWWWcc3ds4ECfGKaVWcM4
         OpjbFex9eWNXNplnYl9aEh69D7NGFLU2IDQ0FoNfFAKN8vFytKP2PlQtiyv+2rTM4WAx
         +RXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688655623; x=1691247623;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yqwpPlMfIW0CMr+QI2pcqMAVZYszNSjNkLx+8OvN8jE=;
        b=dX+X2cPqsQrKawNioPjOqfKaRzyv0BGr5Qu7hD+EQ3bYGdWObfJsh/B+5uHdmDxGsG
         FRnbRHvgVl3pAOoI7eH/luSEr4wSLkmZjEvc9MgN+JX9FjNsdOr44z02k7SvYjM0O2U6
         KOjgO12Qv+bhlckWz33gaOr8gRjvKVnW8NZ6yoQlxIMKbRaztGt5Y/czI6o6L0bb506w
         9083ivBaH3y8jsXuP+VcKk3cjzUj1GG9/l/mMns368HHvSipuS+QdwcSDHYZ+vMHj4y7
         jqp8UKMgPv2t9pUGdsAjExeuKfBonABvxk+qEUlF9skdByFNtx9Vbeeh2bikf7EsanOY
         rJPA==
X-Gm-Message-State: ABy/qLY8G5x0FXhEpLAllr2l+mRcpfN29aQlLrBeImxHEsePE1aQ0YiH
        QQSsDWKePIYf/nYQF+IOJJRG5A==
X-Google-Smtp-Source: APBJJlHpNMwtKmvc2B14smOWAl0gDdgArrDFh/HeRQmgHvC+OnA4VfhfHO2/nVcJfvLX0aDtKLOb3A==
X-Received: by 2002:a19:5f18:0:b0:4fb:95fe:58f6 with SMTP id t24-20020a195f18000000b004fb95fe58f6mr2176230lfb.6.1688655623499;
        Thu, 06 Jul 2023 08:00:23 -0700 (PDT)
Received: from [192.168.1.101] (abyj26.neoplus.adsl.tpnet.pl. [83.9.29.26])
        by smtp.gmail.com with ESMTPSA id j18-20020ac24552000000b004fa53431073sm290388lfm.131.2023.07.06.08.00.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jul 2023 08:00:22 -0700 (PDT)
Message-ID: <b7376555-3ffd-3587-bc91-6c407c43e72e@linaro.org>
Date:   Thu, 6 Jul 2023 17:00:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/3] dt-bindings: power: rpmpd: Add Generic RPM(h) PD
 indexes
Content-Language: en-US
To:     Rohit Agarwal <quic_rohiagar@quicinc.com>,
        Pavan Kondeti <quic_pkondeti@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1688647793-20950-1-git-send-email-quic_rohiagar@quicinc.com>
 <1688647793-20950-2-git-send-email-quic_rohiagar@quicinc.com>
 <35b6b086-9b03-49df-b80d-863218b42fae@quicinc.com>
 <a6241054-0f66-53c4-af59-31ceca13bf7c@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <a6241054-0f66-53c4-af59-31ceca13bf7c@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 6.07.2023 16:47, Rohit Agarwal wrote:
> 
> On 7/6/2023 8:00 PM, Pavan Kondeti wrote:
>> On Thu, Jul 06, 2023 at 06:19:51PM +0530, Rohit Agarwal wrote:
>>> Add Generic RPM(h) Power Domain indexes that can be used
>>> for all the Qualcomm SoC henceforth.
>>>
>>> Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>
>>> Suggested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> Does it make sense to give this link [1] so that we know what is
>> Konrad's suggestion and the discussion around it?
>>
>> [1]
>> https://lore.kernel.org/all/0d468d08-6410-e424-b4f3-5245cdb0334a@linaro.org/
> Yes, could be given in the cover letter.
>>> ---
[...]

>>> +#define RPMPD_VDDMD        22
>>> +#define RPMPD_VDDMD_AO        23
>>> +#define RPMPD_LPICX_VFL        24
>>> +#define RPMPD_LPIMX_VFL        25
>>> +
>> How did you come up with this list? A union of all SoCs supported by
>> RPMh driver?
> Yes, union of all the SoCs and arranged based on frequencies of usage.
The latter part is very thoughtful, thanks for taking that into account.

That said (and I really don't wanna be picky here, I'm just coming up with
ideas a bit later than I'd like to).. Perhaps this patch should be limited
to RPMhPD [1] and the definitions could be moved to a new binding, so:

include/dt-bindings/power/qcom,rpmhpd.h
// this way we don't have to add RPMHPD_
#define CX	0

which would result in us being able to do:

#include ....rpmhpd.h
[...]
power-domains = <&rpmhpd CX>;

in the device tree

which is even more concise!


[1] The old RPM SMD platforms have some duplications in the names..
    No point in duplicating that. The oldest entries remember 2013 so
    it's easy to see how we had some dirt build up there.

Konrad
> 
> Thanks,
> Rohit.
>>>   /* SA8775P Power Domain Indexes */
>>>   #define SA8775P_CX    0
>>>   #define SA8775P_CX_AO    1
>>> -- 
>>> 2.7.4
>>>
>> Thanks,
>> Pavan
