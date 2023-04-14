Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C83C66E2679
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Apr 2023 17:09:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229774AbjDNPJN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Apr 2023 11:09:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230176AbjDNPJM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Apr 2023 11:09:12 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6400811C
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Apr 2023 08:09:10 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id fy21so3385197ejb.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Apr 2023 08:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681484949; x=1684076949;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y2YIosRAqD0RcoeUtDhEKssUjybK8X1yJ4TLNycZYAk=;
        b=Gry3UmYwLHT4qA7+1z/AMddLZsQimozLMMwWB4MRD3o5ySdLjkDZHDVcxUWOR1onoT
         ZsInt2oSiRVt0OFZtWE8k4p4TGAXqfbcQVEkMB7FqvEJ7aajSOX9KWoqdlJ98dcjITpw
         5BCEXKl4GWrnRsz/U1rIau+fJR/rxo8jzBkwPu5I5OtIIx9Dtoh7kAowBiWH1f2hU+Zh
         6jLDXvqKtJjIQtO39UKdUlrB5Dn2DT8xT3Hk3iFxwxMUohnN7dvLzk6C8iWcYlzqRsJG
         fGHP7rl241RIgOPjatWTEQFVOzptNlmmK5KhGvA/m9KUUMwwquuRmJC8FQuRMZYv/j5A
         9xNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681484949; x=1684076949;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y2YIosRAqD0RcoeUtDhEKssUjybK8X1yJ4TLNycZYAk=;
        b=fMmWBKvEVXBpa2KGxdb4v9G1yijvCOH0GgGeZ0c2X5UGFfxhPfpdPnE41fQlridQCr
         XSVPrYl7X18ya7qi2Rww90G5fslPv7/rdu6cGjpydgV862l51PwPhq9p65MtRsvOiPK3
         rvu+IWYLXJRqA65pNvLz4dE0g+0SrE64x9BFBnX2EbZoQHRl29Cpq3/HknFeCgo/5gXN
         c4XOj9NJjawpyZ9OVrjNkAnguDiDiiZbR3kmNrNx95juZVmJ/abkCtif5SD/lZoztcdj
         pGbpPGlaLqz7Oz5rnkDyiYbvsaR3LlPzCGM84RN4UIDQyC2Sp2DZwRdISZTuoS8sZv4p
         8R0Q==
X-Gm-Message-State: AAQBX9cfad0RKouDHiw7h+BdcioEs4wSVNuQdo7HaS66jYR2DrtlaC8i
        IJf7D2XgY2eHKcQKe73YMy6j5g==
X-Google-Smtp-Source: AKy350Y5vscslMdJAx35nCQvPSRnHUrNqLPW/+KyljmDqgU/KP6IWdG1spU0fR5e6iRHfMaUK4wMmA==
X-Received: by 2002:a17:906:d053:b0:930:4eba:1640 with SMTP id bo19-20020a170906d05300b009304eba1640mr5090248ejb.38.1681484948890;
        Fri, 14 Apr 2023 08:09:08 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:39b7:81a0:bd41:17b1? ([2a02:810d:15c0:828:39b7:81a0:bd41:17b1])
        by smtp.gmail.com with ESMTPSA id sg32-20020a170907a42000b008c16025b318sm2525558ejc.155.2023.04.14.08.09.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Apr 2023 08:09:08 -0700 (PDT)
Message-ID: <7b4fe58c-9cf8-57ab-8cbc-c5ccf0b2a46d@linaro.org>
Date:   Fri, 14 Apr 2023 17:09:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH V1 1/4] dt-bindings: clock: qcom,ipq9574-gcc: Drop the
 Bias PLL ubi clock source
Content-Language: en-US
To:     Devi Priya <quic_devipriy@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
Cc:     quic_srichara@quicinc.com, quic_sjaganat@quicinc.com,
        quic_kathirav@quicinc.com, quic_arajkuma@quicinc.com,
        quic_anusha@quicinc.com, quic_poovendh@quicinc.com
References: <20230414134812.16812-1-quic_devipriy@quicinc.com>
 <20230414134812.16812-2-quic_devipriy@quicinc.com>
 <dc48d390-9c8b-d3b7-9c5e-6cbddb0e1306@linaro.org>
 <aca7b808-51ce-1921-2ee2-0e82cf19d960@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <aca7b808-51ce-1921-2ee2-0e82cf19d960@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/04/2023 16:22, Devi Priya wrote:
> 
> 
> On 4/14/2023 7:47 PM, Krzysztof Kozlowski wrote:
>> On 14/04/2023 15:48, Devi Priya wrote:
>>> Remove bias_pll_ubi_nc_clk from the binding as it has been removed from
>>> the Device Tree. Also added Bjorn Andersson to the maintainers list.
>>
>> Was it really removed? Where?
>>
> It has been removed from the Device tree and binding in V11
> https://lore.kernel.org/linux-arm-msm/20230404101622.5394-1-quic_devipriy@quicinc.com/

I still see it in current next. Are you sure you refer to something
already merged?

Best regards,
Krzysztof

