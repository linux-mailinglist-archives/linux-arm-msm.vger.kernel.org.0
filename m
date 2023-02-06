Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A38868B722
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Feb 2023 09:14:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230044AbjBFIOP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Feb 2023 03:14:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229640AbjBFION (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Feb 2023 03:14:13 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADB406187
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Feb 2023 00:14:12 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id f23-20020a05600c491700b003dff4480a17so1988826wmp.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Feb 2023 00:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ePDxyT/u8Kqhxr/nFXRB6Y/lsRv/qmX+1Ra2K4W1UZ4=;
        b=yDTjJTaniLkFNHN/Va60zE9me5I/ocX+6hNKokbNuE4RkW0gEmmJFyBtLjmEatcdZs
         pVRYdKDLcbCQoehiv9zbCMpg+RTNlZZWHk8uzqDbegwVwGzrdDTvMQLg7Mv+BJFa5TnD
         WIzfhYjc4FfoXHUek4MYMyLxQsy9EgkIzF+RpuFLpZt64PYht+M/B7nbMdD3jQgf0zoP
         4j/N/tTBnOipJGohZqo9NOuc9fn8X0kOmm8rjNnIhLAIwbPtO1p7wr2f1J3DIvzjHl6I
         p0cZEmCmLrl9aMmgOGhzlkkeOnM3SQqH4HNNERExXO/4rfNySeSqrM31rlkcC/NpKyEX
         CHFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ePDxyT/u8Kqhxr/nFXRB6Y/lsRv/qmX+1Ra2K4W1UZ4=;
        b=WAAyxBkxRQ8gDWBgTbho8vLLATlUOL9Dm8yNJWAVPKVgCb7nvdtWMyDvj8bKylY1ev
         7w5aUL+27NGpQUoUAnCnYkH/AG2osNI+QUOanyghXJ7bm+KwOhuALedQcTDjOAtCRRjI
         bzfV9NOKpKUaIV54uil1WAIUtt7wSple+1V2bp5m138NJO/Skn88u+tXgw0dbUlTjhCy
         rRzv23tnEtufKvzHkMZHfYzDwKE2k8VEdhLtzpRrC5Jub3RxzMhWGtq6ag/1AZZO0eKy
         WHKOYlyzHJcp9AiHtqpfq4n75hkRun2g8gv2tZsM2y6anlXMZkCurKXY1Lolag/dSHUL
         rY4g==
X-Gm-Message-State: AO0yUKVgG0cMp7G0J8fsj0jQ9RdRqMp0OHxVJSdBrLo+vWUg4d/Jn27G
        uIkFyb0OptXbDslVmpM6f1R0Hw==
X-Google-Smtp-Source: AK7set9ZBm8SdWkWa32GKfeHe2SwoK5HaBJJIOMo9SK5Ix2kwtX6TBMZUllvfY5y7kAZEycJOyXqfw==
X-Received: by 2002:a05:600c:35c6:b0:3df:9858:c034 with SMTP id r6-20020a05600c35c600b003df9858c034mr10770454wmq.9.1675671251319;
        Mon, 06 Feb 2023 00:14:11 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id v16-20020a05600c471000b003dd1bd66e0dsm11185749wmo.3.2023.02.06.00.14.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Feb 2023 00:14:10 -0800 (PST)
Message-ID: <a8a2ee18-7160-bf03-6f8f-43f39141742e@linaro.org>
Date:   Mon, 6 Feb 2023 09:14:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 1/2] dt-bindings: clock: Add SM7150 GCC clocks
Content-Language: en-US
To:     Danila Tikhonov <danila@jiaxyga.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        David Wronek <davidwronek@gmail.com>
References: <20230205211257.285997-1-danila@jiaxyga.com>
 <20230205211257.285997-2-danila@jiaxyga.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230205211257.285997-2-danila@jiaxyga.com>
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

On 05/02/2023 22:12, Danila Tikhonov wrote:
> Add device tree bindings for global clock subsystem clock
> controller for Qualcomm Technology Inc's SM7150 SoCs.
> 
> Co-developed-by: David Wronek <davidwronek@gmail.com>
> Signed-off-by: David Wronek <davidwronek@gmail.com>
> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

