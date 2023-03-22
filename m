Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB4636C52A4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Mar 2023 18:37:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230150AbjCVRhy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Mar 2023 13:37:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230111AbjCVRht (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Mar 2023 13:37:49 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7187C442F7
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 10:37:43 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id i5so29206945eda.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 10:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679506662;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gA9v9nFXxMYuk8TaGFnohJPpRyhNADWGj1tI0eex/Bo=;
        b=K4/UxDXF4SWuSSyN2dVFIeo7JaNA4cLfq+JcTiPCkLKMUkOSrxQURuXuAZ24CMIPGC
         rDDA5oXX4pVNfbdGH6t4VcqE6s8Xd1kk0REFmVJSWoh/DzipU5ge1T6rGZyEirKXgGnV
         D1JQVoFp+RSa04aQP37CBD/PntX2u2Ol/8aLbXZ7E7HqBBAwVTDS27BUZlnaAGEADLUM
         TC+ZP/x0dJQLSEqMziBIMmQ54YUzaXNsADiVPe65ti4EDdwseLbNVRdnwXWmbjbqlrAk
         a4qsQMa9IHnzJShRZCSFMAHFH77baWV9QICxyWuMJIcB7QPjpA/vd4jus4EZAlFSXlR9
         3JxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679506662;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gA9v9nFXxMYuk8TaGFnohJPpRyhNADWGj1tI0eex/Bo=;
        b=SWHBBL7d9148/quFhLIzmVEAjD5Fx+GO6DYZnb6OevnHlfWa/MyyEghtQx08+9zwpq
         u98QyHq8X5QzvQ7gwGz44P3DCt9GmowWRMAajlyS7TnBIAz06Q0iLgZOjhr0xBepGLU7
         i+tq4PZPYP+IC69lMIcAtBLPvcLq+Sk1Vm/WVEaiIkxa3pSMKoTVnAEe7JcAIjJJlQhy
         F7Xwp9dIyU9BeJWMej4DHE/5AgBR1IujCmDsxr0PPfvztKCNjFGKMA7ETymH3DNXqxmy
         Us2Pk8rjZMse5YLrVjbjrPKjq3IOqv+SRYBvKerXglUUuYGIMY+mouq1XxsIrVsBw7c4
         Fk/A==
X-Gm-Message-State: AO0yUKUEOUwj98OrPxc2YJgWzpxzWidHJhHWWZT8fdOrSkkxmYPbdlge
        RVs9hMPdFNUFxydcvTjnWunUSg==
X-Google-Smtp-Source: AK7set8WO00ak1rfgb4uCE15GliBwuhYtsMbfMQ8SA3CKz+bqKUU4t0VlrpUyJNaexFgRWTGS4h7bQ==
X-Received: by 2002:a05:6402:10d7:b0:501:dc02:1956 with SMTP id p23-20020a05640210d700b00501dc021956mr6603469edu.29.1679506662000;
        Wed, 22 Mar 2023 10:37:42 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5050:151b:e755:1c6? ([2a02:810d:15c0:828:5050:151b:e755:1c6])
        by smtp.gmail.com with ESMTPSA id ec21-20020a0564020d5500b004fc01b0aa55sm8031076edb.4.2023.03.22.10.37.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 10:37:41 -0700 (PDT)
Message-ID: <59a6ef88-758f-4ec4-f663-47e4caa552c5@linaro.org>
Date:   Wed, 22 Mar 2023 18:37:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 00/13] mailbox/arm64/ qcom: rework compatibles for
 fallback
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230314080917.68246-1-krzysztof.kozlowski@linaro.org>
 <c35fd641-12ff-beba-341c-4d0305bcaa40@linaro.org>
 <290b9b19-a320-38a1-4426-51f5725dd54f@linaro.org>
In-Reply-To: <290b9b19-a320-38a1-4426-51f5725dd54f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/03/2023 07:52, Krzysztof Kozlowski wrote:
> On 14/03/2023 13:16, Dmitry Baryshkov wrote:
>> On 14/03/2023 10:09, Krzysztof Kozlowski wrote:
>>> Hi,
>>>
>>> Changes since v1
>>> ================
>>> 1. Rebase
>>> 2. Make msm8994 fallback for several variants, not msm8953, because the latter
>>>     actually might take some clocks.
>>
>> Although the approach looks correct, I think that in some cases it tries 
>> to mark devices compatible judging from the current driver, not from the 
>> hardware itself.
> 
> Which is what compatibility is about...
> 
>>
>> For the reference, on msm8994 the apcs is a clock controller for the l2 
>> clocks (which we do not support yet). If I'm not mistaken, on msm8976 
>> the apcs region contains a mux for the cluster1 clocks. On sdm630/660 
>> the apcs region also seems to be involved in CPU clocks scaling.
> 
> The question is this means they are incompatible?

Since there are no more comments I assume they are actually compatible
in the terms of SW interface.

Best regards,
Krzysztof

