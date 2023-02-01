Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 011BE6869B4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Feb 2023 16:14:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232018AbjBAPOR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Feb 2023 10:14:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229974AbjBAPOF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Feb 2023 10:14:05 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A17016DB03
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Feb 2023 07:13:30 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id m5-20020a05600c4f4500b003db03b2559eso1710569wmq.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Feb 2023 07:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EoczYxoYefo3q4e07FBM/XL6+cv7m/SSyckrYjyJ2jI=;
        b=tKqceXX1fCVRHew9rbSIswyEw480KhF951nMK1gj1DdIhvCvbgj1t6GvTU3G9iaQxH
         iVa7e5vbdIuDNBybRTT+DyPj3ccs3A1j1+MyANhBFIIU19ON3n44XMZAwsxdOL6d2+DM
         eULyNbAaBwUqdWooBXQj1s8/iSacT3+UUKqZlJH4U1EPKv2Rntizbvw8gE3I3MjE4kqj
         KlqQi64oVMkjzUIgIbHqL/yM+mBOwvn1yEolssdvtRkjwIXzflL6VWj2aNuGfFJ7++tS
         Swt11PCjQA4ugJBF5kJbRBvbUwAT59apFz0EIjtY3KseV4VKfo4unm0fyupUd5xyjnCv
         ipjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EoczYxoYefo3q4e07FBM/XL6+cv7m/SSyckrYjyJ2jI=;
        b=nGk57KwTM3oWWXPUI+lTT5mFNeYPcs13ntwRpW4SJqR05+h6jgvzvRzxsqvQ3WDH2U
         fZsBnPYi5vR2o+J1EkgLlYnAcRnnZgWP39sTXb4rFNZvdHYbpYPuWSF7SVhhYOoaV5xg
         piAOzMHF8sL48Fzhca2PyIFmD4YTH1ka98T0z/F5Mi8f3CMQOKJ0ewHuvp+bRvnPYCND
         D1qIbG7mmSZpRrnuDJtM4bp5XvDARiL2eo8aGzSU/wIFljrCb6+S25sFh3i17jSqTIGF
         VkqVmsAJ5OxSJYo9AQVldXImNI7NYjeR+O4CkcDRzfbKSgdXCymEwsVbTJjG+Fai0XPL
         XKkQ==
X-Gm-Message-State: AO0yUKWEksihJTiRNcMIl3bgWT7aMxKVjll86kZ04hL/ep+A8WyRcHeJ
        WAW+VycH/06w7g+4feG64x5Cqw==
X-Google-Smtp-Source: AK7set9QAWNS+grEJLKmMBdY3r/mHJMdSn6u8/EAciwP5Bos5o8XwQWXVoxusxhjfO0PYZufrwYWiw==
X-Received: by 2002:a05:600c:b8f:b0:3da:f5e6:a320 with SMTP id fl15-20020a05600c0b8f00b003daf5e6a320mr7872902wmb.22.1675264403721;
        Wed, 01 Feb 2023 07:13:23 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id j14-20020a05600c130e00b003df241f52e8sm861132wmf.42.2023.02.01.07.13.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Feb 2023 07:13:23 -0800 (PST)
Message-ID: <e28c9048-635d-3936-e440-27e293501ff6@linaro.org>
Date:   Wed, 1 Feb 2023 16:13:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 1/2] dt-bindings: pinctrl: describe sa8775p-tlmm
Content-Language: en-US
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20230201150011.200613-1-brgl@bgdev.pl>
 <20230201150011.200613-2-brgl@bgdev.pl>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230201150011.200613-2-brgl@bgdev.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/02/2023 16:00, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Add DT bindings for the TLMM controller on sa8775p platforms.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    tlmm: pinctrl@f000000 {
> +        compatible = "qcom,sa8775p-tlmm";
> +        reg = <0xf000000 0x1000000>;
> +        interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +        interrupt-controller;
> +        #interrupt-cells = <2>;
> +        gpio-ranges = <&tlmm 0 0 149>;

You have 148 GPIOs, so s/149/148/.

I'll fix other bindings as we have such mistake in several places.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

