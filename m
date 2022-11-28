Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22C6563B429
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Nov 2022 22:26:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233902AbiK1V0F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Nov 2022 16:26:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231909AbiK1V0C (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Nov 2022 16:26:02 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5E1F2FFC0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Nov 2022 13:25:56 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id j4so19497096lfk.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Nov 2022 13:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WnMHEyYqf4JABxGOEKdDo36/UmgQjGCOb1+pWIHU2Xo=;
        b=eObK5wb1JfLnMiEcFoHYj6swOACa3W0OEmp/Mwl36h81H+YYasg8ZtWk2BPTN2wn98
         q0SEGNdO98E5sx4WYMH7QGTsDzohx+sRIIT6zGE4r4K13sArQ+KP874ZNLU1bS382AB7
         SZGvON1MofRTFeMg8jnUZ9zmHWt5gKOZfRibD56u5FTA7t1iwR2+4yY+W4myDWgdznFv
         P+LZ8h/HPFoTMqIlJDiLKoNGJ6g8ZrtFCiaLEKZjp8fihNsPbavewOrYQTPCsuNh0mjk
         xeSNqbjbwWKID14F5AcDwJPEOgwDWKT55RZFj1AEBVvZwG25lL3cJewGTObst2DpubSt
         4h0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WnMHEyYqf4JABxGOEKdDo36/UmgQjGCOb1+pWIHU2Xo=;
        b=MkWo5EZS+tNLtIJlWZNum8yJZImHXmym2pz4FyBxndm/hAjxRYh9F8V5o0OknyFIjD
         2JJNe2Q5WcjIu6UfkvGy+9UbUqpWu7Fd+YXXg4A7oHVFu8lcX93Bh4IK14zv5maREsxj
         zj5MXNGiYHmPUPldzf4e9o/Kkc7/vWQAs08YmTtBfi/8que3npMvsJixJprLc7A/WN98
         7OK5rwG7tjI5YVMRMPnfSFqTScXgdoqWDoxfp+iGmZUCyghvvq2OKvULwHuME9NFuN3Q
         7BcArN7vSjT38ZpjigNUg1s/lzg9NJCCVVf+BRM602568U8eGAjGm0tUzOxX04+UcnjC
         b9yQ==
X-Gm-Message-State: ANoB5pkPOPEDj8hSEv//HVUvfmX2L+qfZSf/rQPf6P1P8jDosED/gUDc
        PwnSx6UnpNMvada31dWiqgVRbg==
X-Google-Smtp-Source: AA0mqf7mr3wNPIOENPGrqrElt9mDtKiHDn7sCXpf3iPrdlhCXXl+yln1x75T1wBfwbC/fWA3HNcxpg==
X-Received: by 2002:ac2:4e8c:0:b0:4ac:d6e4:41cf with SMTP id o12-20020ac24e8c000000b004acd6e441cfmr14056927lfr.102.1669670755050;
        Mon, 28 Nov 2022 13:25:55 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id o9-20020a05651c050900b0026dcf81d804sm1336698ljp.31.2022.11.28.13.25.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Nov 2022 13:25:54 -0800 (PST)
Message-ID: <cf418569-abeb-b9df-8e19-5c50c6e3ac95@linaro.org>
Date:   Mon, 28 Nov 2022 22:25:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 1/9] dt-bindings: clock: Add SM8550 GCC clocks
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
 <20221128122820.798610-2-abel.vesa@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221128122820.798610-2-abel.vesa@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/11/2022 13:28, Abel Vesa wrote:
> Add device tree bindings for global clock controller on SM8550 SoCs.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

