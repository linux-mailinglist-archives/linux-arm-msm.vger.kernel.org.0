Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9566A649AA4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Dec 2022 10:07:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231741AbiLLJHM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Dec 2022 04:07:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231735AbiLLJHB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Dec 2022 04:07:01 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7580A95A6
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 01:07:00 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id c1so17461318lfi.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 01:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sTVaySmzPKYHeit0z3XOO6b0j/OVHVNITW2ljPEYuJg=;
        b=rKHpQg7qY7PA1P7H/4qyRs10t72UcTp/d38Mda8LHJxeG8FPkFOpUhDaSA3uVO6j7E
         iKf6z1zvWI+uUKXAFVkOk1SiySaGoIDeNmw+eEbLXN/8HM1An+GhtNkgKTVlouB4EhWA
         +PyofCFP/zluDIg3Zz2flzytYFwywTclHvw7wTwb1AKu0bbhqGiDTDKOQditRQ5Pts5a
         MEyyCdmsCRMz/yzrB4W3+bJWjXTSWwPp6n5DI5QtPVk634u4VseNADvhCI3/DnwtK2MP
         C0b4kAX/3aRHVJLVa4NzzEs9zYo4d48xI/5snAkD1ZowUQ7NujvoGxWaX7QwazunMgez
         JmnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sTVaySmzPKYHeit0z3XOO6b0j/OVHVNITW2ljPEYuJg=;
        b=lSuNc9FzhHr3LQgOPRVCTwP+hz+ZBKp0Frd9ZEUG5Fdy85VStd4SmqjEgFSyTg9BgM
         QDtVYZXvkTnaPKpzVnFvNr3bomTDgD0zeF7Z5kq3haLV++oxbRdp5DSkMFz3Dyfm593N
         JhY0CIa6hn3dsyiMIo1IXjWV2O6iTGD8HEJSgwPbbJntI0dqnvHpg90fd+iqZ60nwnlp
         PRJ9qqcJDN38GSoVqk0dN6CkcIaWNL1mcVXrE4Z7PZZrbnD4bRRe9VSZA86D4PJljTug
         13FnFLhx7o1D0x7CxRbq+1y/YKmUjRA89QfeemaVfBaU5+h4YU0qa/rlGfyB5yYC+Kch
         AufA==
X-Gm-Message-State: ANoB5pmMQImk6EWtf1anL6/l6xLGCumY436hUJB23KNboyKL9IuqE+3G
        Iy6H1qNeap0SphdZJ/jXFsi2Lw==
X-Google-Smtp-Source: AA0mqf7Q/Yj0CNJXu/1Q+sRvAVGSq6rOUCAKTbqvslIcFL0Hd0eqipGLowU+mtoxIZKETMXKLU0tag==
X-Received: by 2002:a19:a41a:0:b0:4b5:8fee:1d71 with SMTP id q26-20020a19a41a000000b004b58fee1d71mr3269047lfc.64.1670836018898;
        Mon, 12 Dec 2022 01:06:58 -0800 (PST)
Received: from [192.168.1.101] (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id y20-20020a05651c021400b002797d6bb516sm1151042ljn.20.2022.12.12.01.06.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Dec 2022 01:06:58 -0800 (PST)
Message-ID: <3234174d-e778-7c66-d7bd-8860e4eb6361@linaro.org>
Date:   Mon, 12 Dec 2022 10:06:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: qcom,adsp: Add SM6375 MPSS
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     patches@linaro.org, Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221210135807.10688-1-konrad.dybcio@linaro.org>
 <34e5b0c4-3ca8-5008-46cc-38c60f69cd95@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <34e5b0c4-3ca8-5008-46cc-38c60f69cd95@linaro.org>
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



On 11.12.2022 21:25, Krzysztof Kozlowski wrote:
> On 10/12/2022 14:58, Konrad Dybcio wrote:
>> Add entries for SM6375 MPSS. Unlike most other modems, this one only
>> expects a single (cx) power domain.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>  Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
>> index a9219c7c8349..434d34578fc5 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
>> @@ -42,6 +42,7 @@ properties:
>>        - qcom,sm6350-mpss-pas
>>        - qcom,sm6375-adsp-pas
>>        - qcom,sm6375-cdsp-pas
> 
> There is no such entry... Do you base on some other patchset?
Yep, this one [1].. I thought it was merged, as Bjorn pulled in the
DT part (which stated dependency on [1])..

Konrad

[1] https://lore.kernel.org/linux-arm-msm/20221109170822.58281-1-konrad.dybcio@linaro.org/
> 
>> +      - qcom,sm6375-mpss-pas
> 
> I propose to rebase it on my series:
> https://lore.kernel.org/all/20221124184333.133911-1-krzysztof.kozlowski@linaro.org/
> 
> and then either add it as new file or maybe it will fit to one of the
> device schemas.
> 
> Best regards,
> Krzysztof
> 
