Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A004A616F6A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Nov 2022 22:11:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231289AbiKBVLk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Nov 2022 17:11:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231168AbiKBVLj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Nov 2022 17:11:39 -0400
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DCA4DF21
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Nov 2022 14:11:38 -0700 (PDT)
Received: by mail-qk1-x732.google.com with SMTP id s20so6241329qkg.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Nov 2022 14:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SMdd6W9zqTykplxA9atF92tm5CBcUP1U7yvf5vUxJ94=;
        b=qB3heRMEENXq8LFOVv7rITGt3zC5JeYlR5KthvYqttf4k6cy+wq7eT+G5PU0Y1gk+T
         hIDyJ8EDJGC4oefNczl6sxRZJYwkHx7zYy0szk3EL69mVeSGtEEgYnxqWp1eJAqGUtDD
         FzvCzCNYtJKaplARHRsXpCDCC/UuQgXbAqcA45tzUMB+KOnfLMBtdvJCUfKBMUfT+F1r
         C6yUhosIbNAemIdWXHBCwCI1WMUJo/j4cJyUvfJvPQZrBI1zf/cBQehcdITcpYrDiyeD
         L6tOkEedAVUpFSq63IEZskKrZ/HwskotE8pb/OT0LprAO9P7dw5nUXd7C51ynN90uOQQ
         cqMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SMdd6W9zqTykplxA9atF92tm5CBcUP1U7yvf5vUxJ94=;
        b=W5WJqqSdVN7tc+n3qe1VN3HGJ3ID0R8YIaXRoKYtEnousAZ8dAJPxgJzlm+RRkpiNk
         3beHZ8q2IsPlqVfQzC62/2TTuz9JdCQ9/nS2Kg8OVub8cB/nzoh9aDGZXLPTFi3lmg6d
         gIYfrDmxuyE7mL8W1Kv3WP5RqCk1dQf4rwURw1icX//NJYJY86HLhhzEmHKfABluvlDX
         7vAh4ncQ8wlazSLcUBdtQjoSOAcN1vAdq7Uc8hCpQKAirwdSm1X6nnzsMOmeT6qYSx/a
         3tX9X4fwF/zFfmQ38UF/4mfXQqpD5pyKzrrifOj+8cW96S0GFXfzIEfSpf7ZUNjxlU5k
         ktwA==
X-Gm-Message-State: ACrzQf3tCaMDx+XVb4mDHfWY/bKppD1MvoCFqeRo+3urdGU1RDTPcbAA
        icb4GIrwAdIdfQKnC+UmoT12gg==
X-Google-Smtp-Source: AMsMyM6Wkzj6KTSaNv+AilpDqn1fSqGn/N2Li1l/svMXz1ljJSNXtiq4HeywPXe80VDgV4C1XUmDFQ==
X-Received: by 2002:a37:ef05:0:b0:6fa:630:2b4f with SMTP id j5-20020a37ef05000000b006fa06302b4fmr19416018qkk.41.1667423497764;
        Wed, 02 Nov 2022 14:11:37 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:28d9:4790:bc16:cc93? ([2601:586:5000:570:28d9:4790:bc16:cc93])
        by smtp.gmail.com with ESMTPSA id h10-20020ac846ca000000b0039853b7b771sm7139821qto.80.2022.11.02.14.11.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Nov 2022 14:11:37 -0700 (PDT)
Message-ID: <1a7fd1fd-4f0d-bec3-ddd5-7c6a99a2ab01@linaro.org>
Date:   Wed, 2 Nov 2022 17:11:35 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v3 1/3] dt-bindings: interconnect: Remove required reg
 field
Content-Language: en-US
To:     Melody Olvera <quic_molvera@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Odelu Kukatla <quic_okukatla@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221026190520.4004264-1-quic_molvera@quicinc.com>
 <20221026190520.4004264-2-quic_molvera@quicinc.com>
 <a214f513-fe28-2096-c2b0-2107e97f3ce2@linaro.org>
 <64d0e5ef-fd36-6f25-2c39-00e8e1346af7@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <64d0e5ef-fd36-6f25-2c39-00e8e1346af7@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 31/10/2022 19:29, Melody Olvera wrote:
> 
> 
> On 10/27/2022 8:29 AM, Krzysztof Kozlowski wrote:
>> On 26/10/2022 15:05, Melody Olvera wrote:
>>> Many of the *-virt compatible devices do not have a reg field
>>> so remove it as required from the bindings.
>> and some virt have it... This should be probably separate binding or if
>> the list is small - allOf:if:then.
> I attempted this; however I'm still seeing failures in dtb_check. I've added this
> to the binding; does this look correct?
>  allOf:
>    - $ref: qcom,rpmh-common.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,qdu1000-clk-virt
> +              - qcom,qdu1000-mc-virt
> +
> +    then:
> +      required:
> +        - compatible

No, because we talk about reg, not compatible. You should not require
reg instead for some compatibles... but then the schema is getting
complicated.

It's difficult to give you recommendation because I do not know what are
all these "virt" interconnects. Why some have unit address, why some do not?

Best regards,
Krzysztof

