Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB3E97A6304
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Sep 2023 14:32:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232080AbjISMcS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Sep 2023 08:32:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231683AbjISMcR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Sep 2023 08:32:17 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D730128
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Sep 2023 05:32:11 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-50307acd445so4606524e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Sep 2023 05:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695126729; x=1695731529; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XZCTRZKVBnR2YvNg1LyLeXAm38TzOjpP7llM/IPFqls=;
        b=jAWvBMcFfHTVGseK9wCfyvhcrut5Dsz4bwLAIw3VMcubDFh5uVxW/At16DMn0fSOc/
         8wi9zQNyV6pffsRR2tSFX2x0jgH8o8N34Ir2BYPrOTON9ZcfB4ZoOflRx7y1lPGZvXyq
         XhBp/9UYZQNSQ9jQo1wd1v1BcmEEdhu8ZGXlMSlD+3b3enGBse4bNHsGki2Zo3H32v6p
         4JvuFD5Q9uqZ3pX/M6heTeM9KAkFLUpkTMNGB5G62/qVtXcLrvIE8U9UDSeGk0cu80FH
         x8m9w8Rqw53Zc9wNwg7OtlJlMY+z1ZQ06IaF6BUtL2zAgStuONcV4LE0HUcBc1+mZg5d
         T8Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695126729; x=1695731529;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XZCTRZKVBnR2YvNg1LyLeXAm38TzOjpP7llM/IPFqls=;
        b=WkVbOBbeqxEFTF7bAFXr+PxrbOfHJ5EDM2pfHbSDChaTj2uihAdKJEugZYwXLzj9Y6
         F2ZhvJD9BquXkOr0rnIa7POlnJoIhYBL2eEkmsv69RRU0R+6+vWjOT62QZxLNFChYJjS
         w0tO/hEkHT9wqyMTA0AiK3mSXxNCX+QoOl/5oXmD05qqgUJXcqDyEfWbyDD+nRlecjIv
         Ma/YDJxvaLOys9G8b/x1JHS8lm6C7f9ryh0vMmohqb7kL606zEy9tnNoM+ijM2hP6gj4
         0hpaFryZ8fISEYhc8FpO6Mhv4Eb6I3ewaomscOALb3atgnDnNGY+cRpmAlG8o0SJLfkh
         B2yA==
X-Gm-Message-State: AOJu0YxcdeeGMpTKJI9BWGyOHa/j7qaYS5JGpI41ZHPul8Mg5Z/DcSW8
        YPsUiuCEGZKRu/Gif6ILtD0BcA==
X-Google-Smtp-Source: AGHT+IEMvNDUAog01rs4CwdBpxpoQSIRanKceTDHHAqosvyR1dwGOfCcPWL5cZ8GFNVP5mNVQ3B+kQ==
X-Received: by 2002:a05:6512:31d0:b0:503:102c:7a05 with SMTP id j16-20020a05651231d000b00503102c7a05mr6997285lfe.58.1695126729291;
        Tue, 19 Sep 2023 05:32:09 -0700 (PDT)
Received: from [172.20.24.238] (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id cx15-20020a05640222af00b005313c60165asm1811488edb.77.2023.09.19.05.32.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Sep 2023 05:32:08 -0700 (PDT)
Message-ID: <ee19e076-8f9c-c5b2-3e25-2832dbdab25b@linaro.org>
Date:   Tue, 19 Sep 2023 14:32:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH V2 1/4] dt-bindings: thermal: qcom-tsens: Add ipq5018
 compatible
Content-Language: en-US
To:     Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        srinivas.kandagatla@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        thara.gopinath@gmail.com, rafael@kernel.org,
        daniel.lezcano@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, dmitry.baryshkov@linaro.org
References: <20230915121504.806672-1-quic_srichara@quicinc.com>
 <20230915121504.806672-2-quic_srichara@quicinc.com>
 <03b0cafa-49c7-8838-b116-927c9649cbd3@linaro.org>
 <f5aee51d-0345-1294-a85b-ea96ed937685@linaro.org>
 <1f09339e-b3b5-874c-4874-199e8c7ae890@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1f09339e-b3b5-874c-4874-199e8c7ae890@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19/09/2023 09:22, Sricharan Ramabadhran wrote:
> 
> 
> On 9/15/2023 6:15 PM, Krzysztof Kozlowski wrote:
>> On 15/09/2023 14:43, Krzysztof Kozlowski wrote:
>>> On 15/09/2023 14:15, Sricharan Ramabadhran wrote:
>>>> IPQ5018 has tsens v1.0 block with 4 sensors and 1 interrupt.
>>>>
>>>> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
>>>> ---
>>>>   [v2] Sorted the compatible and removed example
>>>>
>>>
>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> No, unreviewed. Your driver says it is not compatible with
>> qcom,tsens-v1. This does not look right :/
>>
> 
>   Yes it is V1 IP, but since there is no RPM, to enable the IP/SENSORS
>   have to do those steps after calling init_common. Similar reason
>   added a new feat as well in patch #2 as well. Hence for this,
>   new compatible was required.

I dud not write about new or old compatible ("compatible" as noun). I
wrote that it is not compatible ("compatible" as adjective) with v1.

Best regards,
Krzysztof

