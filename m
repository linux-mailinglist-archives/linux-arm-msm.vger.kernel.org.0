Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20F9C62BEEA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 14:04:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233550AbiKPNEt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 08:04:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233747AbiKPNEo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 08:04:44 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A33732B1B1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 05:04:42 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id bp15so29310424lfb.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 05:04:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hC7hAWdXJrbOBhiPtC+d8+UIyRAaqU4u9VT50dOh8F0=;
        b=yjh/9w0+ChTTMXUeNDeMpHE2gsl6ozXsxhdQZC5YMMbA/CF70a9w2fzV6eAOShCktd
         SVY5T13Bo+eBi9ZIiS5FKaxPZVaufmQ1V8WFkfY5hLa10/qs5ZDuT6lXT6R7Tl76yhd5
         BJsuuu+t+WchZhcDT77o0KwLcKcv6lMvAue8ACDUKePMLqU0dhj32rlWs/vPMHKV5XQa
         j5zrL45KTrRVuafLJDd/FNmyZf2QxDHJPV0aUwtFxESMnMAb4bd0Pg6IhHtHLiqYHem0
         mDw5SDgPPKn6xp+vvlneE9kD/SdFfQL2uEOQ0I6Y9TQAC1fcT/84CX3f6hv019X8hrbY
         2v/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hC7hAWdXJrbOBhiPtC+d8+UIyRAaqU4u9VT50dOh8F0=;
        b=KDiXJNh6u+xsNA5mZgr8hbk54iHuxpWezxAur0F0FFz3DWqDvdsIGB3KJHG2bjF76H
         V+3r+fFGU9rmfPiGAyVVDao4wAQG0WI5f+jKvYjSd+fBLy+20+qSjQdxxly43NbbBP82
         ULVmpymhHhi+/ciC5vCLRwDNBDFwyj0RKV8D39Yvc1TyvFRDGUhkqtO+4i2/6ssmdPcP
         py64w419VaZcFgxWmayCTaggXJVYHxSs0uY/3Ofz8UiLJzhJLYghS395D49ecL7yPbqR
         5tpkrTV6BsQaceEASUsY9QYjk6gOjAsIn/3dPxqUoUM07Tx8kJllV6iDMUgSWB+7teq8
         MU7Q==
X-Gm-Message-State: ANoB5pnajCMnYs+zMhQc5NlNpbTm5jMUpyojqytF8U99mapJflcK4rxf
        9CD0V182XoF93rz7NH9zJnnuWQ==
X-Google-Smtp-Source: AA0mqf72YgutZylIoJBbSinzlh9BACGJygEv22CpJzWaxhQBxOmzTy/UCRLkcZlPBtmWoF9YswXL5w==
X-Received: by 2002:ac2:530c:0:b0:4b4:aed7:4aa5 with SMTP id c12-20020ac2530c000000b004b4aed74aa5mr1198189lfh.447.1668603881020;
        Wed, 16 Nov 2022 05:04:41 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id c6-20020ac25f66000000b0049a4862966fsm2590501lfc.146.2022.11.16.05.04.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 05:04:39 -0800 (PST)
Message-ID: <623814f5-9abd-2634-bc2d-51de08074abe@linaro.org>
Date:   Wed, 16 Nov 2022 14:04:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] dt-bindings: cpufreq: cpufreq-qcom-hw: Add SM8550
 compatible
Content-Language: en-US
To:     Abel Vesa <abel.vesa@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Rob Herring <robh@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20221116115046.2687244-1-abel.vesa@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221116115046.2687244-1-abel.vesa@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/11/2022 12:50, Abel Vesa wrote:
> Add compatible for EPSS CPUFREQ-HW on SM8550.
> Also document the interrupts.

None of other variants had interrupts so far, so you are adding it for
new SoC, right? Or documenting existing usage? If the first, you need
allOf:if:then.

> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  .../devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml       | 7 +++++++
>  1 file changed, 7 insertions(+)
> 


Best regards,
Krzysztof

