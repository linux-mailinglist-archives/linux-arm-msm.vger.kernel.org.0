Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8C1762BBDB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 12:27:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238266AbiKPL11 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 06:27:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229585AbiKPL0i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 06:26:38 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 082F348750
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 03:17:36 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id g7so29003275lfv.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 03:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TW4xcY4nHnWk9kRggu8CtKt6pRiyYODi2/2Q5SmOTJI=;
        b=MM2CtdsNxD8PWnHMoqIB9i8OajlPSeVVH/xvi44hbD5p4kL5OSZbTzCIpuKH9KSr3F
         LadrTFQUPJDNmKXF7yVvhujZ7vSShLfZcu3Xfc3XxN3rVx7stX4q01I4c3A5ZA0tiaYO
         LmPu0p+qc97g2oYymrXb4UtyUJgLaD3gSbAMEtT2hRBMw7CEFjHLK8jG+LoLaugghZhe
         8UKguZcmHtWP0UPK2FMRIFBy9iNTrsEvsUr0hAbdV+MYWXeDwLs3Rs/u13MfA7TOa9TB
         uKv6DOOLLBq2r6MsyepHYkKLLS2hWWWC6GLAVNZ+dz808koCY0Czk1iVbz41zYO6eoMh
         cy3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TW4xcY4nHnWk9kRggu8CtKt6pRiyYODi2/2Q5SmOTJI=;
        b=hYFTSKpnzDaYTDdnPjj7I2oKEPzYG3fNbVYNKbQBOs11PmmZbdGKz7vNiLp5fADNZk
         38ImLVCrukdcT298bKh7L4MYcRdESHp3SjLz3amC0ZG+thQ8nxaH5cZ2u3Za9nd1LIOt
         zR8kES/hpKMRF/bTowfFcUxWuGnu6Q1KpknJZ/PDHWemf1mdTXYf4EjEan2w4y1PngZa
         n9SPSxtloqkzcornVeUcnTFCj7H91kzTqWEXh4Fng9TrE1hOJB7jcTQAUxoTDO09s0Vg
         ogQwKTs8rwfcz7bNjULWYti7Z+8gz/mr6GXQu/LlWNh5+fGzxRz0eO876Q/yDyl9IMF5
         RBAg==
X-Gm-Message-State: ANoB5pkmMrFfSO8AMDytc40v03NXknfYPN6Y3NByM4dQ9+QBrC/TuZNN
        tTURKqkPyHIaSIbJ+HpQwI/66Q==
X-Google-Smtp-Source: AA0mqf4DJVH9xhA+RGcPuHY5/k0KNunM6j6tIlBOc7xyYha8nMq4p44CztKtyiToOtBRueAtZGlJyg==
X-Received: by 2002:a19:380a:0:b0:4b4:a5c8:cc0b with SMTP id f10-20020a19380a000000b004b4a5c8cc0bmr2099270lfa.332.1668597455295;
        Wed, 16 Nov 2022 03:17:35 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id r17-20020a2e8e31000000b0027740a1b854sm2959498ljk.52.2022.11.16.03.17.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 03:17:34 -0800 (PST)
Message-ID: <93238bc8-8508-b5e8-8b43-b292a2b9a633@linaro.org>
Date:   Wed, 16 Nov 2022 12:17:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 4/7] dt-bindings: pinctrl: qcom,pmic-gpio: document
 pm8550, pm8550b, pm8550ve, pm8550vs & pmk8550
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20221114-narmstrong-sm8550-upstream-spmi-v1-0-6338a2b4b241@linaro.org>
 <20221114-narmstrong-sm8550-upstream-spmi-v1-4-6338a2b4b241@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221114-narmstrong-sm8550-upstream-spmi-v1-4-6338a2b4b241@linaro.org>
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

On 16/11/2022 11:11, Neil Armstrong wrote:
> Document compatible, pin count & pin names for pm8550, pm8550b, pm8550ve,
> pm8550vs & pmk8550 SPMI GPIO controllers.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

