Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF8E2600876
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Oct 2022 10:13:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229816AbiJQINh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Oct 2022 04:13:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230244AbiJQINg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Oct 2022 04:13:36 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2AE55C95E
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Oct 2022 01:13:33 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id r13so17223456wrj.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Oct 2022 01:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TtQU6LBVZTvZm9SLebgqYC0IMXwDULp3uW4RHWrCH5I=;
        b=uq3jMd6saVcby/oziKkwC6MbyY4g5JBzajmWnxcY1dlWPQXQ8aK/gJDelO3P1VpaiF
         9xlH2bj1S/2wbKfhJGjetktWI3AekhW1o5V7AtueHE7noeGx1KCFHYOhqdwydNRf01RZ
         1INiuOQB4+Jh/lCPEUq+XpPvKY1eQQ8BavhaMgH+A+SikA9zavnqUKmUuNSklHL3VIMJ
         V7AGuOkN1NgEbdBGvpHmZX1xWj/CuydmxZ+embCMddPeetNpQE5zrU/fC03ZSflOxfhV
         NRXHR8iK7pdNxkd0and7+0oSb6ros7wh57w9Xz9z0GzcTzetVliSaCM1EUIb/u0Yyv3J
         O1nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TtQU6LBVZTvZm9SLebgqYC0IMXwDULp3uW4RHWrCH5I=;
        b=R7THr24Mr/FQgwj3N/HhIaAP65AayL5zUbfx43amWZJ7bsj1fm5KGZXJ/bpu43DbD1
         jsP1v1AupxPo1mBjFvp6YGxDVtHqc2w5hiHMczqhJjBPS4emo9HPw4An+OUQOJk6CUcO
         9e+iEv8Li0MIKXCesM5w1IUSwXROm4lk4MbbXL+mSmRafe9gM90T8DV8YEHBhuP+Lmcl
         7YwPs8rMPirpQqea5b8XFI5tVYRYg+LlmtcCfF27/6HtHIvRUpP6OssAzdcHl5qc6ce1
         6UmrLaQR2ChEBDwyVe66QASiddkXL4JkHNFKtp9xiDdm7kGGJfjhA6xk+Qk3u6RqwSW2
         xj+Q==
X-Gm-Message-State: ACrzQf36dO9C1FXAYqaq/33PMrqkJeE+mcOLOkrkwUsnpfpvyCr+RkUS
        Uh0mdl+ut7iO53U3gUIMpMQmNw==
X-Google-Smtp-Source: AMsMyM6vz23g3klw74CDZtn3A4upho5Lnj7LzDWMu24f9N3l99ZinP99Ny04lA38ZLzvW7w7gbhpqw==
X-Received: by 2002:adf:db42:0:b0:22e:386e:f6af with SMTP id f2-20020adfdb42000000b0022e386ef6afmr5267537wrj.400.1665994412163;
        Mon, 17 Oct 2022 01:13:32 -0700 (PDT)
Received: from [192.168.27.65] (home.beaume.starnux.net. [82.66.176.246])
        by smtp.gmail.com with ESMTPSA id l6-20020a05600c1d0600b003a5f3f5883dsm15399885wms.17.2022.10.17.01.13.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Oct 2022 01:13:31 -0700 (PDT)
Message-ID: <c1b88277-d07a-329a-850e-996fadad9327@linaro.org>
Date:   Mon, 17 Oct 2022 10:13:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 3/4] arm64: dts: qcom: msm8998: align TLMM pin
 configuration with DT schema
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221011213145.122879-1-krzysztof.kozlowski@linaro.org>
 <20221011213145.122879-3-krzysztof.kozlowski@linaro.org>
Reply-To: neil.armstrong@linaro.org
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20221011213145.122879-3-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/10/2022 23:31, Krzysztof Kozlowski wrote:
> DT schema expects TLMM pin configuration nodes to be named with
> '-state' suffix and their optional children with '-pins' suffix.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   .../boot/dts/qcom/msm8998-clamshell.dtsi      |  7 +-
>   .../boot/dts/qcom/msm8998-fxtec-pro1.dts      | 16 ++--
>   arch/arm64/boot/dts/qcom/msm8998-mtp.dts      |  4 +-
>   .../dts/qcom/msm8998-oneplus-cheeseburger.dts | 10 +--
>   .../boot/dts/qcom/msm8998-oneplus-common.dtsi | 14 ++--
>   .../dts/qcom/msm8998-sony-xperia-yoshino.dtsi | 30 ++++----
>   arch/arm64/boot/dts/qcom/msm8998.dtsi         | 76 +++++++++----------
>   7 files changed, 78 insertions(+), 79 deletions(-)
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

