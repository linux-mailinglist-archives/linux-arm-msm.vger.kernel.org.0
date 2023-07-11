Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A33C874E72D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jul 2023 08:22:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231446AbjGKGWs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jul 2023 02:22:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230178AbjGKGWq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jul 2023 02:22:46 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CCC0E6E
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jul 2023 23:22:45 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-9936b3d0286so682856166b.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jul 2023 23:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689056563; x=1691648563;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tpO/kRGXZrcaHH/p3Ai9d1x5JI3iV2cFdsOiX0dHBSw=;
        b=j4Vz6XpJVEuaD4v2PFmw+Dztx/NfSOnFHz21bQjCzlcPhk5Zgygngj8YH9FAK8EG5l
         szqMWG4qHGtHQ/3YpukKC0qy3jP05GVhqbf8k8mZMBqbZWM0ZG7j/FgPqZEUMzVwcVzg
         pW9gxmGBD9MbdqGbcOqdU4PFixr6WPj/q73BOrVuCIrxZvJ04pLzHaHvHvKIvSFCfX36
         QzRToBLjYwqxKjIYddHc/1b64bV8clPa3dS6xv//9mUnrv46qFSXnzIkHh+xKPaz3u1A
         NE73oy9uGJxYe8Mdzfg3FZn9zmIegt79wuoNN5FMhQOx3XJqKGPakEi+HZQQHNp0mzb5
         ZQ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689056563; x=1691648563;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tpO/kRGXZrcaHH/p3Ai9d1x5JI3iV2cFdsOiX0dHBSw=;
        b=AfyujHKaUu7+OR6oBArXof8NFo2fN12qsehOxf0faLcApZ3tDxuFZbSIENSxFw5N/v
         x3n9HMFYwe8s/M8wiMpveDDv0YCl5rndn+gmtZhlWRaaNm3gPzj3P0+WzY7D+gLJ+EJ+
         X++JjwKLXfwsFAy4feBAixC7Y+rz+v5Br4MJ5kPwRD60jI8sTBfrK9pZlrI2SpTLVjWl
         bKCOY3xhfPQrecGy88eI7U5ckWD6qEpIsXr++lRjho9SEBPfE3vT4fAUMptVf2j5Rpnl
         AGoNMmhsgfkMsQQTyP1Yu1PpkzNYZttkVueHSWqwyHB6xgzFTwHzDF4qt4e46+l6ygER
         6bcQ==
X-Gm-Message-State: ABy/qLbDYv7Jg41yWyw3wBAYo4ax80IStu7b9DRHzFBYfHST0kcCRqA1
        Ng+YuevrtW710e5ZCrTlTKxooefKDtgWbfi0M+A=
X-Google-Smtp-Source: APBJJlG75Gj08t8cXGFBsFAzicMXDCqYemy05g+dTkjLYyu1nb6WZo82rIl6WLtRpu3GiQylcUEMIA==
X-Received: by 2002:a17:906:dc:b0:98e:4c96:6e16 with SMTP id 28-20020a17090600dc00b0098e4c966e16mr15367855eji.5.1689056563685;
        Mon, 10 Jul 2023 23:22:43 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id f26-20020a1709062c5a00b0098242730348sm696748ejh.72.2023.07.10.23.22.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jul 2023 23:22:43 -0700 (PDT)
Message-ID: <e885383b-a231-75a1-32ce-bf850f0cb022@linaro.org>
Date:   Tue, 11 Jul 2023 08:22:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 1/3] dt-bindings: power: rpmhpd: Add Generic RPMh PD
 indexes
Content-Language: en-US
To:     Rohit Agarwal <quic_rohiagar@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1689054169-10800-1-git-send-email-quic_rohiagar@quicinc.com>
 <1689054169-10800-2-git-send-email-quic_rohiagar@quicinc.com>
 <2040226e-9b45-b409-3edd-a5b86d86daa8@linaro.org>
 <8a3124ce-a11d-2491-eaee-1695cec70b17@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <8a3124ce-a11d-2491-eaee-1695cec70b17@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/07/2023 08:17, Rohit Agarwal wrote:
> 
> On 7/11/2023 11:22 AM, Krzysztof Kozlowski wrote:
>> On 11/07/2023 07:42, Rohit Agarwal wrote:
>>> Add Generic RPMh Power Domain indexes that can be used
>>> for all the Qualcomm SoC henceforth.
>>>
>>> Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>
>>> Suggested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>> ---
>>>   include/dt-bindings/power/qcom-rpmhpd.h | 30 ++++++++++++++++++++++++++++++
>>>   1 file changed, 30 insertions(+)
>>>   create mode 100644 include/dt-bindings/power/qcom-rpmhpd.h
>>>
>>> diff --git a/include/dt-bindings/power/qcom-rpmhpd.h b/include/dt-bindings/power/qcom-rpmhpd.h
>>> new file mode 100644
>>> index 0000000..4da2e04
>>> --- /dev/null
>>> +++ b/include/dt-bindings/power/qcom-rpmhpd.h
>> Filename based on compatible.
> This is not specific for SDX75. These are generic ones that should be 
> used for all other targets.
> Konrad suggested in v1 to avoid target specific prefixes everytime and 
> to create a new generic
> dt-bindings that can be reused.
>>> @@ -0,0 +1,30 @@
>>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
>>> +/*
>>> + * Copyright (c) 2023, Qualcomm Innovation Center, Inc. All rights reserved.
>>> + */
>>> +
>>> +#ifndef _DT_BINDINGS_POWER_QCOM_RPMHPD_H
>>> +#define _DT_BINDINGS_POWER_QCOM_RPMHPD_H
>>> +
>>> +/* Generic RPMH Power Domain Indexes */
>>> +#define CX               0
>> These are very generic names, usually not used in global headers. Please
>> use some reasonable prefix.
> This was based on the suggestion from Konrad in v2 to drop the RPMHPD 
> prefix and we can go only with names like CX, etc.

I don't think having so generic name in tree-wide header is good idea.
CX can mean anything.

Best regards,
Krzysztof

