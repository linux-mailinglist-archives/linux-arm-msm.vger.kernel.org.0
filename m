Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2856A65092E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Dec 2022 10:14:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229499AbiLSJOW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Dec 2022 04:14:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231335AbiLSJN4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Dec 2022 04:13:56 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61955E13
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Dec 2022 01:13:55 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id o6so7838069lfi.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Dec 2022 01:13:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LUx5MYCfnj/1H50qfkuVhePLMPUMVD211tZ96Ux4Qkk=;
        b=DofmNMWGgHsV98OYuQkE+JUWgwRoAIXoeP52WsseD0nBLTqXRTQjn1VYoAkcLzL/Y4
         6R7vqOqCyqtUEHNU8CM2jJ0yMYPbNsI2wCAq170/0rtiDOrl24hfv0+D4m2GYJ5soB0X
         jE1lr79kHyFcszGiB1iFNF7Yo0x/WiQ7o9t+PaBd9mTv4zSRsYpSPmKJfG2MHMKJWgQb
         qMP1kLAMJs1X8FaGhFysiZ6XRHJ4lrV5GxJgjI/TyTNnYE3PMKUcVctEpngq/FAFQ7fC
         eM1cuN2qBR/KC6zaCp3OZw8sJyeWpeNj7Y7jQGckggi/SgORSpW5CQ3JgvSd2R7CPykR
         SVsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LUx5MYCfnj/1H50qfkuVhePLMPUMVD211tZ96Ux4Qkk=;
        b=RSpLg8PDqj7TTB8fTvPQZyHLEP/DcfJsDH9PMJPfQQkuaOqbcoaLCZtiOjcQs0vSXi
         nAh6hnQPu+ajNtCQ4m26YoaGyC4yKLgaJtBgZIGnD6sL7q18yUDmad5oeiI+ViyDVrsi
         32XEV77I8mVaTCtErxZE4y/ikODWMCD4LL3RwFuEzouoyAgHpnWFhHNKP+cc2nMipVzA
         4zf7ERNZj5uahN5u1Xmfey33c2XFI6jcqXtuoBrpz84IZFb9NyEzu++2QMtOBeMOt6HB
         KpUSTFdxPH+jWwFVS57dAveoepIdtgN5CHqKXCa4/0vSAV5Jw7ve3p8//Z8sex3FbhIP
         5IZQ==
X-Gm-Message-State: ANoB5pmjJJVN/vm87VRt4JWjzLZdNy6oCjgZvbH8NSCN/uczXWkLSUSs
        pOOQqTlLj2j5qUlKUoOsHXn5TQ==
X-Google-Smtp-Source: AA0mqf5TYBkDMS+bjG24i/C65vIRXR7GqJJINJdikUEPOM+mTn+Z97RYzXcjrWzLcUo2K1yNlfpLpg==
X-Received: by 2002:a05:6512:2527:b0:4b6:edce:a192 with SMTP id be39-20020a056512252700b004b6edcea192mr9283232lfb.4.1671441233793;
        Mon, 19 Dec 2022 01:13:53 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id m18-20020a056512359200b004b523766c23sm1051457lfr.202.2022.12.19.01.13.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Dec 2022 01:13:53 -0800 (PST)
Message-ID: <eb1fb1a2-d31d-2a1f-39e3-0c329cbcae7b@linaro.org>
Date:   Mon, 19 Dec 2022 10:13:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 02/15] dt-bindings: clock: qcom: gcc-qcs404: switch to
 gcc.yaml
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20221217001730.540502-1-dmitry.baryshkov@linaro.org>
 <20221217001730.540502-3-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221217001730.540502-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17/12/2022 01:17, Dmitry Baryshkov wrote:
> Now as the gcc-qcs404 gained support for GDSC and requires using
> the #power-domain-cells property, switch the qcom,gcc-qcs404.yaml schema
> to use common gcc.yaml.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

