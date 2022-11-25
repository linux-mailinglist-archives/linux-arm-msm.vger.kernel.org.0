Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFE4E638723
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Nov 2022 11:13:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229865AbiKYKNe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Nov 2022 05:13:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229495AbiKYKNd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Nov 2022 05:13:33 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FC652F388
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Nov 2022 02:13:32 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id j4so6205801lfk.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Nov 2022 02:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N991s68h7sVHrWnW84OjVq88wuH3x/g5rq29JRb+HwM=;
        b=XqoGcZ2FqxYxS2X2ldP5QGMN6qyyENXtxhEJ4hCdJhT88q45IucO2ND2AaMQxEpuYA
         ZYyJ/VTS1pj80tAK1sHuIK241AETycPznRbe3o5enW5sajBso3Jq1TZ2uh04KqSdTdcJ
         nziMMEqotNcAuhoXC3dfGvh9+1pMZkODzNCaRq4wJ5076LdtEhWPR/gNzc1HvEg65R2R
         aSO4FKSZnd+TK3JCwjptwQp+Dkp1p/ilskQSZqJfNNrlXV2YFVdlY0/hO+ZmxrCrYT7i
         lz3pzMhqrwfO8maj5sCphgfAplBCFNGv+daFcBvKsu6Aw5ONan2aiGYyYBj4GppvZF1w
         nvcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N991s68h7sVHrWnW84OjVq88wuH3x/g5rq29JRb+HwM=;
        b=CRNE+jxLCuuf1dcB5QiJRoxsfOcQlJ77FCAifzrqXiAqCaDlO/mz1amtdD/rA/xJu+
         I25w+JI9Ic3ao4QCwacLCf7yq06qVV0kcO5plAtTl6LKzHKhm0+y22QGtvNYAMQX1V1S
         pb0apeyi0MsePj4WfLzI/QeD7mFanEsaSvikL22peQohlcHGC2DCDp6SjtkQLXm/1svn
         7XitIiakH244I7zDuoaHOCbKJQpOlWg0AEbsTkXNx6rzqDftVpL6pehaMS7ATOvT2zRv
         L9pPDL8Yk6dUIRBZY1d8szHPC2u5/MbZSb3VztZCUZkHKXcpY0CTS5ur2m17/tix91Jg
         LQAQ==
X-Gm-Message-State: ANoB5pnxqlZDDdapIvE9Z3Uc9zhWQwtj4PntuIp5xeVHanni9wTCUwNx
        eaODwD/57qnE0MRxMKQ+q+r0Ng==
X-Google-Smtp-Source: AA0mqf4ikIXcGn3T5q0OgJWQbcOO1xeRlZOzPhEYXbu7bpy5rMe7Yi4DJhaaJYDKhN3YpD29JoH/Fg==
X-Received: by 2002:a05:6512:74b:b0:4ad:5f7b:46e0 with SMTP id c11-20020a056512074b00b004ad5f7b46e0mr14177215lfs.350.1669371210546;
        Fri, 25 Nov 2022 02:13:30 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id p13-20020a2e9acd000000b002774e7267a7sm317595ljj.25.2022.11.25.02.13.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Nov 2022 02:13:30 -0800 (PST)
Message-ID: <d0a1c5b5-c75f-0bf6-0459-236feebb0e1b@linaro.org>
Date:   Fri, 25 Nov 2022 11:13:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v5 1/2] dt-bindings: arm: qcom: Add zombie
Content-Language: en-US
To:     Owen Yang <ecs.taipeikernel@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     Abner Yen <abner.yen@ecs.corp-partner.google.com>,
        Gavin Lee <gavin.lee@ecs.corp-partner.google.com>,
        Harvey <hunge@google.com>, Matthias Kaehlcke <mka@google.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Bob Moragues <moragues@google.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20221125174415.v5.1.Idfcba5344b7995b44b7fa2e20f1aa4351defeca6@changeid>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221125174415.v5.1.Idfcba5344b7995b44b7fa2e20f1aa4351defeca6@changeid>
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

On 25/11/2022 10:44, Owen Yang wrote:
> Add an entry in the device tree binding for sc7280-zombie.
> 
> Signed-off-by: Owen Yang <ecs.taipeikernel@gmail.com>
> ---

This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions. However, there's no need to repost patches *only* to add the
tags. The upstream maintainer will do that for acks received on the
version they apply.

https://elixir.bootlin.com/linux/v5.17/source/Documentation/process/submitting-patches.rst#L540

If a tag was not added on purpose, please state why and what changed.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

