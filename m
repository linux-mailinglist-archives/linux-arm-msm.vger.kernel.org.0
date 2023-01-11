Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21E13666293
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jan 2023 19:14:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235616AbjAKSNz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Jan 2023 13:13:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235237AbjAKSNu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Jan 2023 13:13:50 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5650B373A7
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 10:13:47 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id z8-20020a05600c220800b003d33b0bda11so2989339wml.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 10:13:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DsPaEL6Hnqj1or7cig22FuyqbMsNudq9op/I2hyZVKs=;
        b=hltZ4ouVVsv2DWiM+E2w1jUCh60FKLYJjKpayoRtl9/Za4FvllorhkEI0wxQvEGFxw
         8PHLLlBCGWuE4vz+khGQHXHpXV8XuQDGNNM6iNt1et/EU0aR7XAa8+IGrT3p+1mjQQYa
         JG8uNEtJLxEj+Ku66+yOJm4/VtbR7IysiQh4dS3Fljx78TqxU4zCczaeihQHR14W1vTj
         YLMmIYduOgeg2Z+78n50h3dtG4pAqIZ6KFDzoiC3/Cxm/uPiNdH9NZ5QwLjAJ6rsywN3
         UWVBMoK5JaRm1rHe/BH5rLSz86BNGrs2pP3H946zVnlBNVBJN/OY5SgfMZoBHxStHCv7
         LEzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DsPaEL6Hnqj1or7cig22FuyqbMsNudq9op/I2hyZVKs=;
        b=5doYFehROdWejYOpIYC1nPv82XDOmKzA4Vi1lTQQYFa2lXIt5YKYDQNhm9ysv+5P7M
         uW4orWeUCvKw6sD9BAwmP/pHAmnpxje+x7cWLH8cDvWoyR4ommyMZTUJna8eyC5vBrel
         sf2muoU2yVJLUdS2xbhZX0RIT6V3T7O32or8t0f1I2PeA1RKfQiOUQqBiFXxG9VlEMYd
         Tsc8SCL3McBdBegp0Aa6L4+A62UXlaH6t2YvsL8hBlCdOtW5ChTo4VQq/HmbBB8qaJva
         7PTjmq2mBFnfoxsrd1SeBzAX6qjF70+cnCvnHXIWOCBqIkcJbXBLURX5xs+5Ds6QnCKI
         x8pA==
X-Gm-Message-State: AFqh2kqm3F/d7jZaNY0dmjDlXlmXUjRYpkdcYePxnulZUYuu4VNCyENE
        hKk14EaOLrB2/dS1mgAtVUuS9w==
X-Google-Smtp-Source: AMrXdXsnV0YMKJKweo3qmctnTs4kNEA0eBRZfegwBqzFpHzTeCxGDLocjERCdaF3JUs748AWc+vAZQ==
X-Received: by 2002:a05:600c:44d4:b0:3cf:7925:7a3 with SMTP id f20-20020a05600c44d400b003cf792507a3mr52208003wmo.24.1673460825703;
        Wed, 11 Jan 2023 10:13:45 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id c7-20020a05600c0a4700b003c6bbe910fdsm28162870wmq.9.2023.01.11.10.13.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jan 2023 10:13:45 -0800 (PST)
Message-ID: <ac906790-f9ff-4ca4-401f-3651097b3ccf@linaro.org>
Date:   Wed, 11 Jan 2023 19:13:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 1/3] dt-bindings: vendor-prefixes: add thwc
Content-Language: en-US
To:     Yang Xiwen <forbidden405@foxmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Jaime Breva <jbreva@nayarsystems.com>,
        Nikita Travkin <nikita@trvn.ru>,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20230111180322.21874-1-forbidden405@foxmail.com>
 <tencent_FF77D11FE1B5B5D6E83CC03FEED8FCD87308@qq.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <tencent_FF77D11FE1B5B5D6E83CC03FEED8FCD87308@qq.com>
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

On 11/01/2023 19:03, Yang Xiwen wrote:
> Shenzhen Tong Heng Wei Chuang Technology Co., Ltd. (hereinafter referred
> to as "Tong Heng Wei Chuang") is a focus on wireless communications
> equipment brand manufacturers.
> 
> Link: http://www.szthwc.com/en/about.html
> Signed-off-by: Yang Xiwen <forbidden405@foxmail.com>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

