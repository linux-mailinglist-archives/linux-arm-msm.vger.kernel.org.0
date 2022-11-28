Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F3CC63B42E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Nov 2022 22:26:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234547AbiK1V0c (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Nov 2022 16:26:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233351AbiK1V0b (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Nov 2022 16:26:31 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC90A21E33
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Nov 2022 13:26:30 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id z4so14680220ljq.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Nov 2022 13:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MqF/vPvGSRlnkNfRE7ZwgV461GzDRthCdVTW17k8+Mw=;
        b=mFVndKxRlcrXGjtS8xbEr3frusXRA87L62kMxR0t4bAP32KtgWOXjO4s8yB66IohOZ
         IaGKC4ygwy7PubIVkQrFRPOGl1mNVuPGGE37Hue2/7cK8QS6dDHyclrpFJPRffunpmYO
         UgnKNq92E7j8VltxxbCJgHfrSkqwLqmZorHeFkhJH0Qn8zjdVJS7FyGqXD4qvEiwqyuO
         TrGp01tdnnIxjFDJi79+neICv6z613z9QCA8MuvzYDCfgc0LuOmkidnpKnK/MdlTcFFy
         lzbdSnrS7wcLxRvXMCwZO4QRnoa/mfoQWBKrHGPYDiHf1M4glbL9IUJCQ0p8C84i28bW
         R+JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MqF/vPvGSRlnkNfRE7ZwgV461GzDRthCdVTW17k8+Mw=;
        b=Kf4FH7pq+aELQ84bt2lYbAt2L6hmsdbgDLsIcj3mT0Xh5cEskU1t1e5sA1/8lQtrV6
         Q66t08BgP8gAlGkpm7skySdWaoIIE9Yyk5D24QAz9h+ZVRXzCqjk8oGisWkpgRt00jg7
         5eV0zP9qoKefFyE4Z+lY736hPQvq/PpeRU+loj8GAOsonyX4C//2wjXmDSCKza4J9QFp
         UdzE+HAIr85rEqmJY94nNFhMBQBRdDP9JEwKzKjGWpiDJRGrWXiY8VRwHkUs3n1TlwEt
         H9vrA3XVFLKRj3GUT5zjrnvRle8vG12/vgcobmmYbnVxIjtNRziQHWwAcZOUXZrjX4nb
         5S3w==
X-Gm-Message-State: ANoB5pkkScdoLbDSPieolec/oDZIeCpEMb+sAm6d2kzYcqf3sKtOs+bj
        JWkhJvHkSX67R6cZCfnL0QHE7w==
X-Google-Smtp-Source: AA0mqf7vdeGSIbvyyOexOobx6plSnYLm1oLzAIJDc/j+i13vpXyW0KfgLOM1Pn5yGdLNZjLAjsK0cw==
X-Received: by 2002:a2e:b80c:0:b0:279:78b7:fbed with SMTP id u12-20020a2eb80c000000b0027978b7fbedmr9025436ljo.308.1669670788999;
        Mon, 28 Nov 2022 13:26:28 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id a18-20020a194f52000000b00494643db68fsm1877720lfk.81.2022.11.28.13.26.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Nov 2022 13:26:28 -0800 (PST)
Message-ID: <94e94d0d-c786-accc-089e-e7aa56331b2f@linaro.org>
Date:   Mon, 28 Nov 2022 22:26:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 2/9] dt-bindings: clock: Add SM8550 TCSR CC clocks
Content-Language: en-US
To:     Abel Vesa <abel.vesa@linaro.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20221128122820.798610-1-abel.vesa@linaro.org>
 <20221128122820.798610-3-abel.vesa@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221128122820.798610-3-abel.vesa@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/11/2022 13:28, Abel Vesa wrote:
> Add bindings documentation for clock TCSR driver on SM8550.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
> 
> Changes since v2:
>  * dropped the allOf clause
>  * changed comments in bindings header to mention TCSR CC clocks
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

