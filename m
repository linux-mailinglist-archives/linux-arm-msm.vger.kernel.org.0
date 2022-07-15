Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CBD7575B9C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Jul 2022 08:34:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231688AbiGOGeC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Jul 2022 02:34:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231665AbiGOGeB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Jul 2022 02:34:01 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CA50120B4
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 23:33:58 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id w2so4656471ljj.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 23:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=2XBIVdk3pYwMVaylPts4zneKtsuIVhkxVC9EHGtp4K8=;
        b=cFcfpi76yiB1fwndQb2XuB0In92e4LKbea2cwzZWUE2AOKjT19XFM1M3sNTgMMY7HB
         hc2icATTDQpGUwl1oyMnRG1yYLZUPba5hF80EIjHx1+lNYaVPqgaA5QTlkZp/mcFVBmj
         NOaZ/aN6WDZOZXLj0lu2KmfjQtPsQc8AKKPFhuS2djC5UGAK93yq+WiTNm5lPIO29eSL
         KWUo2FxN822oUXRXkj00ZL1e3oGY2pTVyR6OHGEGSAdn9K9qfdTuGpcJcPqp0OkBERmE
         ksfGMY/kn0VaBrMyOaVas38aTCiLOTPwFcZ+bQ6iF8MJQmLGcNwcmmCpg+mP/LjIzn0X
         kz5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=2XBIVdk3pYwMVaylPts4zneKtsuIVhkxVC9EHGtp4K8=;
        b=INjLNmFQe9UMz7e5abgDuAYIMbAsmuUO4Ycan5qXrWkctidB+DoQCCKz/ktoXJU2kg
         kvQFwMZfLcrds+RhkM84G3fJYOTqw6dnk/jQdIlzIIjlTGlqCat2DAgEuM0VaY9Hlaew
         fbdkbsQMyNMK+NE6QhNSo46G7RUxb14x8gBdrTGOr8W10nHhRpui/XimBFClcWBcFS6d
         a4uw1hEfW1elDzrlihoMS8j7NjyMAd+U7AslcqSD68P35OWVjiPJi9dlrRr4ylXpx64W
         xWTFVmZ+VRDL7k9fL56dEH9r9+CadMwdYvXWHowXHHeRREAPz0aAKWv5699oGjD9Yi7x
         dzTg==
X-Gm-Message-State: AJIora8Dx1JdHpfKbxPQ2fQXEOfJDuPkN8rvHyaJSsEBeGzdtJP9Jzys
        Bx8OQtysoyBRw6PcPzX6zX3A1A==
X-Google-Smtp-Source: AGRyM1sHCE3hEATcPB5N/H0GfvUb6bWpFuIMnZSK9pq+8uyMOQnR1KqcVxJk/9pPSJ+KWzUsXMVuYQ==
X-Received: by 2002:a05:651c:1a0c:b0:25b:f5f6:d42 with SMTP id by12-20020a05651c1a0c00b0025bf5f60d42mr6339214ljb.49.1657866836339;
        Thu, 14 Jul 2022 23:33:56 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id c8-20020a197608000000b0048724eb8cffsm737512lff.255.2022.07.14.23.33.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jul 2022 23:33:55 -0700 (PDT)
Message-ID: <cd8a2b66-ba7c-768c-f5b0-2728f0a8be99@linaro.org>
Date:   Fri, 15 Jul 2022 08:33:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/6] dt-bindings: remoteproc: qcom,q6v5: Move MSM8916 to
 schema
Content-Language: en-US
To:     Stephan Gerhold <stephan@gerhold.net>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Stephan Gerhold <stephan.gerhold@kernkonzept.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sireesh Kodali <sireeshkodali1@gmail.com>,
        Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
References: <20220712124421.3129206-1-stephan.gerhold@kernkonzept.com>
 <20220712124421.3129206-3-stephan.gerhold@kernkonzept.com>
 <434cbf73-c62d-7d5c-fe60-7d98a84bc7fe@linaro.org>
 <YtBlGJ+lQFQg+l+I@gerhold.net>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <YtBlGJ+lQFQg+l+I@gerhold.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/07/2022 20:48, Stephan Gerhold wrote:
> On Thu, Jul 14, 2022 at 11:50:30AM +0200, Krzysztof Kozlowski wrote:
>> On 12/07/2022 14:44, Stephan Gerhold wrote:
>>> [...]
>>> +properties:
>>> +  compatible:
>>> +    oneOf:
>>> +      - enum:
>>> +          - qcom,msm8916-mss-pil
>>> +
>>> +      - const: qcom,q6v5-pil
>>> +        description: Deprecated, prefer using qcom,msm8916-mss-pil
>>> +        deprecated: true
>>
>> The last compatible does not seem applicable here. Aren't you moving
>> only MSM8916 to new schema?
>>
> 
> "qcom,q6v5-pil" is exactly the same as "qcom,msm8916-mss-pil". It's just
> a deprecated quite unfortunately chosen old name for the same thing. :)
> 
> See these lines in the driver:
> 
> 	{ .compatible = "qcom,q6v5-pil", .data = &msm8916_mss},
> 	{ .compatible = "qcom,msm8916-mss-pil", .data = &msm8916_mss},

Yeah, but previous bindings were not mentioning it alone, so this would
not be a direct conversion.


Best regards,
Krzysztof
