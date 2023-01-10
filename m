Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F33A766415F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jan 2023 14:14:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232507AbjAJNO1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Jan 2023 08:14:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231767AbjAJNO0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Jan 2023 08:14:26 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37A47431AB
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jan 2023 05:14:25 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id az7so11699491wrb.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jan 2023 05:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RnE4fpLbcTktxDgKOw5o5AykRDw1ELTBr8AeZCuOMxk=;
        b=RYF+dwJScInqtksjXi7CaKi6U0QmKWIc1MT/7tNys0Mdjiz7BVq58Zac4iiBwdWnAH
         ZQRMVsQQkYsqH3fiNe+xKk90MtFLKybMVy1YMoEx9/myhqNsztTMmn/lLTkCZa0JOn/y
         8UGgzUH34CxT4ZFc4xlcxoFTFf75Yh7qjjBcgw18NzIOM3nwKfQ4UID7jZC+0+jCmkFf
         t1zy+B1we1oOq98ybkJGRSDg6XlzQDyEgNZiJG1fLR/fWY0+6cKYuERbnAbVYJiBzIbo
         KS7USHehvufu0YKmfxmkMqDO7r4GZw3HlkrVmeAIYOld93vNVB15Rcla38USWTCvMf0D
         pWjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RnE4fpLbcTktxDgKOw5o5AykRDw1ELTBr8AeZCuOMxk=;
        b=DxvrcOvYWmtrXhXibaxqX4wHN7tVInFu7Jx3l9gYYgWma1RK/r+7MWYnYeUcas/3fH
         7RrLFHTRqzJObEQ8rDxsadOyx0ZVhZutf2qJ07EsgW21cFGQcSTFXMC66QzHcY29xAoU
         zBLbYOdKwl+IgEC4tjFzYzWmTmmvnhqnWHOzfTQnxqwA6V8FcxwcTlJwm5HyBSC9bePD
         KJ1kBsx75SpoNGVLXEqaNqU3t3yL42/S6sRUwXDRmYHDHkYN6WFKZhML6hksubOasuvU
         lSF1rpktp+xeiezE7Fvf4PzH2YkHr8dbyurLF4dHOVkj+I1mNXbKUj7FBlmWy83wkj2R
         LWAQ==
X-Gm-Message-State: AFqh2koR+2Uo4G94+rQFKL20uUgRxkbKtTjh6rmNKp3ZE06X9j3BJUrw
        nQWfMfTm0tj3E3TPn0gDHQuQCw==
X-Google-Smtp-Source: AMrXdXs1T/XUz7ymawsRiuhyR7G7qFEF1Qq8385DQZCBDY5NH/B6jOZoZ2m4dktR4rh+wJKR0xos5w==
X-Received: by 2002:a05:6000:12c2:b0:2bc:5e1:6ff1 with SMTP id l2-20020a05600012c200b002bc05e16ff1mr4842047wrx.10.1673356463750;
        Tue, 10 Jan 2023 05:14:23 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id f3-20020adfdb43000000b00236883f2f5csm11400187wrj.94.2023.01.10.05.14.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 05:14:23 -0800 (PST)
Message-ID: <88d66834-ca80-888b-e56e-7694e84b6eae@linaro.org>
Date:   Tue, 10 Jan 2023 13:14:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 4/7] arm64: dts: qcom: Add msm8939 SoC
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        djakov@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        benl@squareup.com, shawn.guo@linaro.org, fabien.parent@linaro.org,
        leo.yan@linaro.org, dmitry.baryshkov@linaro.org,
        Jun Nie <jun.nie@linaro.org>,
        James Willcox <jwillcox@squareup.com>,
        Joseph Gates <jgates@squareup.com>,
        Max Chen <mchen@squareup.com>, Zac Crosby <zac@squareup.com>,
        Vincent Knecht <vincent.knecht@mailoo.org>,
        Stephan Gerhold <stephan@gerhold.net>
References: <20230103010904.3201835-1-bryan.odonoghue@linaro.org>
 <20230103010904.3201835-5-bryan.odonoghue@linaro.org>
 <6e594438-843a-d03e-5276-d6316a9dc2c0@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <6e594438-843a-d03e-5276-d6316a9dc2c0@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 03/01/2023 09:14, Krzysztof Kozlowski wrote:
> ../arch/arm64/boot/dts/qcom/msm8939.dtsi:1825.23-1842.5: Warning
> (simple_bus_reg): /soc@0/mmc@7824000: simple-bus unit address format
> error, expected "7824900

For the record the driver consuming this dt entry requires the host regs 
to come first followed by the core

sdhc_1: mmc@7824000 {
         compatible = "qcom,msm8916-sdhci", "qcom,sdhci-msm-v4";
         reg = <0x07824900 0x11c>, <0x07824000 0x800>;
         reg-names = "hc", "core";
}

If I change this and the msm8916 to

sdhc_1: mmc@7824000 {
         compatible = "qcom,msm8916-sdhci", "qcom,sdhci-msm-v4";
         reg = <0x07824000 0x800>, <0x07824900 0x11c>;
         reg-names = "core", "hc";
}

the warning goes away but then this code won't work as intended anymore.

drivers/mmc/host/sdhci-msm.c:		msm_host->core_mem = 
devm_platform_ioremap_resource(pdev, 1);

Weirdly when I change the ordering of the registers in the dts the SD 
seems to work just fine, which is at variance to my reading of the code.

Converting the sdhci driver to use the register name, instead of a 
static ordering of the regs feels like something to be done in a 
separate series.

---
bod
