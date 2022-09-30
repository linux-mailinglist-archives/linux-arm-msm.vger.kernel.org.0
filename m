Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 087965F0961
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Sep 2022 12:58:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232270AbiI3K6U (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Sep 2022 06:58:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232353AbiI3K57 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Sep 2022 06:57:59 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D4D84D4D4
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 03:36:01 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id t16so4353273ljh.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 03:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=DcsCImqzPTtzDW+tcf53orV9UGxO9/x924I5Tz5lCW0=;
        b=DOBegeC3Tt/LD6Tc9/ludEXVJJkVcz3y+SfHVxnl0ptEwm4PI+2nPrOBrXdMm8QVFd
         pICuieo3rxj5ujEO3EdSjl8QIIBduUUj2S2SXewt0KEQqmFICZA+yiEDy1gBL2cRBaMi
         w+Lx2ZJ83Id/0aQ9MUUi46pyGWmNKXxCGmPt5MEt2/wdo7r26mNhIltCc6PGdnEi5LOm
         SdC5J69g1+3uNzK0iylzlMkX5e2NLutOXzBQHDo8PcjtOcwj0SJP1rZKoZgTB1HJzzYH
         VwXHPci5W2EmUoVi8TC6259gf/DqPb0gbiJUbZK3QOWCwtsgUhyekEOCfzmQAIKyUHbg
         snqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=DcsCImqzPTtzDW+tcf53orV9UGxO9/x924I5Tz5lCW0=;
        b=pYFGtKmplx5AHRYSe3VRWycocGWTNlSdyIwkuT1xuSDKjvySb/6XZlkR0A6bFYrKwI
         deBe7eKgPlXkRezUjSEt7UVP7N9wb/5ZhrdRkTi5O/SuSXG2osA6Vo93qKDEEieCmTw7
         GkaGb8EwDOxUd6XN1WtreA49wGdraw+NwAAA2BqDZSuoeFYM88Dc1h1wsUif9Pxqoul1
         VI1i/n1XBHX8GA1bRwAkI4FXkoWmIqQ8pINlerA/od6nfaHn4aQQWpd1ZGZg1AF+vtE6
         RYNo3LMden9BXreBtEsRC5X+QBaCVIWrIpG00X1v72YlqIVSYgJWET7h2jfQ0Wj/baAn
         1jDQ==
X-Gm-Message-State: ACrzQf0EzZ26jD8PTCVWqBzQNUfc8mK5K7HZHWdwuMzdIhPrKmrsaCeb
        87tNkkmpcRqPm5i7jkOIf6x68vYe59M8Ww==
X-Google-Smtp-Source: AMsMyM7LPvp0NeJoE5RQplQmz7PBBSJnZe0CoB01Qld704XlCb2Nvam4kDeGgajbxjzMgF1x9G0ZWg==
X-Received: by 2002:a2e:908a:0:b0:26b:fd3:1870 with SMTP id l10-20020a2e908a000000b0026b0fd31870mr2628888ljg.120.1664533573044;
        Fri, 30 Sep 2022 03:26:13 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id d15-20020ac25ecf000000b004979e231fafsm253439lfq.38.2022.09.30.03.26.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Sep 2022 03:26:12 -0700 (PDT)
Message-ID: <9999a1a3-cda0-2759-f6f4-9bc7414f9ee4@linaro.org>
Date:   Fri, 30 Sep 2022 12:26:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v2 3/4] dt-bindings: net: qcom,ethqos: Convert bindings to
 yaml
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        devicetree@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, agross@kernel.org,
        bhupesh.linux@gmail.com, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, netdev@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        David Miller <davem@davemloft.net>
References: <20220929060405.2445745-1-bhupesh.sharma@linaro.org>
 <20220929060405.2445745-4-bhupesh.sharma@linaro.org>
 <4e896382-c666-55c6-f50b-5c442e428a2b@linaro.org>
 <1163e862-d36a-9b5e-2019-c69be41cc220@linaro.org>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1163e862-d36a-9b5e-2019-c69be41cc220@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/09/2022 10:12, Bhupesh Sharma wrote:
>>> +  snps,reset-gpio:
>>> +    maxItems: 1
>>
>> Why is this one here? It's already in snps,dwmac.
>>
>> Actually this applies to several other properties. You have
>> unevaluatedProperties:false, so you do not have to duplicate snps,dwmac.
>> You only need to constrain it, like we said about interrupts in your
>> previous patch.
> 
> I was actually getting errors like the following without the same:
> 
> arm64/boot/dts/qcom/qcs404-evb-1000.dtb: ethernet@7a80000: Unevaluated 
> properties are not allowed ('snps,tso' was unexpected)
> 	From schema: Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> 
> So, its not clear to me that even though 'snps,dwmac.yaml' is referenced 
> here, the property appears as unevaluated.

Because snps,tso is not allowed, but the rest is.

> 
>>> +
>>> +  power-domains:
>>> +    maxItems: 1
>>> +
>>> +  resets:
>>> +    maxItems: 1
>>> +
>>> +  rx-fifo-depth:
>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>> +
>>> +  tx-fifo-depth:
>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>> +
>>> +  snps,tso:
>>> +    type: boolean
>>> +    description: Enables the TSO feature (otherwise managed by MAC HW capability register).
>>
>> You add here several new properties. Mention in commit msg changes from
>> pure conversion with answer to "why".
> 
> Right, most of them are to avoid the make dtbs_check errors / warnings 
> like the one mentioned above.

All of them should not be here.

Best regards,
Krzysztof

