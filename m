Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1273A5A5B6C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Aug 2022 08:05:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229987AbiH3GFn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Aug 2022 02:05:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230003AbiH3GFj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Aug 2022 02:05:39 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F4866DF85
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Aug 2022 23:05:36 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id z25so14112119lfr.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Aug 2022 23:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=SPCLsnkZZX4iCGdMrI0NRyhLebv9iz4yOZkGgAlJE2s=;
        b=fy/6Ry4OvY1VBJ9B3BON3QiioEsaarY3fntjpXHYlBWb/KACVwsMzvdX93VIPDX69c
         I6yZ+P5FmcJSIT0aC/d27ZiNuuGx21Y6gTWSLEXYT6/pSpHc2XeqFSqGClAQIuqeO5h0
         JaRNs8frE0QkXebQipE0ilYQ6L+mXYS1l3n+22ifu/r0Yw67Jb083X6i/eTaMGi1IPlV
         Kogt7mu6/+mbMjj5SxxL5QZRrB6lL7ctWnh5uCZndq0xPo+LAoNsRcG+k+VIShZsroTK
         +8hSGKxtOL+O4O+93eliN0l/e8S+cQBf3rCyP8XUZsJCyBXUYXfkUOaFssefgDV2wZqE
         Ij5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=SPCLsnkZZX4iCGdMrI0NRyhLebv9iz4yOZkGgAlJE2s=;
        b=yhcLlLMpIvmEs5Uj3H6Xg+zZQwOziJKC99gGLqF6idg46AynP0VLSyz5pLQKLr+8eX
         lWTB/x5rjQMbYih5RHdcA+yJqpVUv7N/O7ZgpoXdIniS2TqFXLC6AHugVXKoS63HYs6+
         B1Gk1ZETEqDOyxuwpNgKwBwkhJCFysN5iLNlkUqqSoTkdXKkjBWOVm1Dba8KEVn9MDqB
         tw7hVaSE6IJE6Rm2QfGf1J6MP519nNLnz4+hH/8VzjwxTpQaj3CjJtMd0ToVTFbSaj6F
         Ag178v2LjpYPRkTFneLa1A3BGpPoKP6l/2MiTZN+M5SYJTSM74HutdXu4XEawRP2aoYE
         eWFA==
X-Gm-Message-State: ACgBeo2Y6zfVQgOJw9F3qRcbWmgf691F5CculuvDgcqq9NPZOC+uQ2dM
        pvx2QQ9WZaihbHOlOjiG3wgg/g==
X-Google-Smtp-Source: AA6agR6ce+/d6pmsFPtQExEpEdeRmNNuqmCJ0m/vL4bFvetG3QQzMfrjRGyTohY7QzAoirf9loMFgw==
X-Received: by 2002:a05:6512:234c:b0:492:d9fd:da59 with SMTP id p12-20020a056512234c00b00492d9fdda59mr6849371lfu.63.1661839534020;
        Mon, 29 Aug 2022 23:05:34 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id e20-20020a196914000000b0048b17852938sm1027643lfc.162.2022.08.29.23.05.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Aug 2022 23:05:33 -0700 (PDT)
Message-ID: <c36a4b78-241e-8c0d-f2b7-3844fa709be1@linaro.org>
Date:   Tue, 30 Aug 2022 09:05:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: qcom: Document additional skus
 for sc7180 pazquel360
Content-Language: en-US
To:     Yunlong Jia <yunlong.jia@ecs.corp-partner.google.com>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Henry Sun <henrysun@google.com>,
        Bob Moragues <moragues@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20220830025438.v2.1.Ic4d4e0777115011544dbc2ab07ed4d7b408c003a@changeid>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220830025438.v2.1.Ic4d4e0777115011544dbc2ab07ed4d7b408c003a@changeid>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/08/2022 05:55, Yunlong Jia wrote:
> pazquel360 is an extension project based on pazquel.
> We create 3 sku on pazquel360:
>    sku 20 for LTE with physical SIM _and_ eSIM and WiFi
>    sku 21 for WiFi only
>    sku 22 for LTE with only a physical SIM
>  Both sku20 and sku22 are LTE SKUs.
>  One has the eSIM stuffed and one doesn't.
>  There is a single shared device tree for the two.
> 
> Signed-off-by: Yunlong Jia <yunlong.jia@ecs.corp-partner.google.com>
> 

No need for such blank lines. Do you see them in the code?

> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Best regards,
Krzysztof
