Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E198646A01
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Dec 2022 08:59:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229586AbiLHH7Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Dec 2022 02:59:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229606AbiLHH7V (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Dec 2022 02:59:21 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FC4F5445F
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Dec 2022 23:59:20 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id s8so827681lfc.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Dec 2022 23:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ifN3keePSqcP1VQvXgjgaCnpgDY0iz9KJSv9ZTvk64U=;
        b=NyfoEAix9x9ZjuHYxTQNy67/Ymvezy9y2hj03fXPx8mIJA6dW8Vi3co8zXn82yON7M
         UI15Ol21gzQW75izSCq/0gFibYIJ+JivwpvcRq1l4DDnVZW1gWGOFX73ZOK47ILqLNGC
         meSCv2o3EBf/9napNBpTFnXQQYsAK0NcMy85+jpBU+dwpoK0BHsnHLOk7qUq9TBL47RA
         Pxsvd4SPN+gRZ672am2fSNIjF5Zmts4mSiBR2YSuUMGAcfKQov7Y6hEXFoRfHSK4NOFj
         JE+/se7E9BrUhJ3YGBSaKWzrq4mrY1+gUCQivvAQuClqU/oedzs1/IcaLrO/norEsYcE
         4tGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ifN3keePSqcP1VQvXgjgaCnpgDY0iz9KJSv9ZTvk64U=;
        b=VQavVoXfy7hyDBQzPT5xaL3rigYeItz7Mj6M8/pcjjCop54XTvClla/anDoDF4ImJ8
         FfUxgD4gL8MqKPdLCQcbb4e0SeCiL9odKyTtrL6Y/XI7kSyH7CJ5dfTgbRW4slox3XiZ
         7imBN6w62B2QDdn5ovcRmPj5NPegEVtHvHKDfbL5t7XCZKB1VdZJRw5ks/bWszza4NZ1
         3/GgQNEamcyA9X2oNDjGEIEkJUaGAhzuXa7kfNzcREuFwUWHRA2bW+zSYhaPgyUxpJXP
         bHr6ZEXtk+Pf4+cvCRWt1OWdLuJr5x6lldQr07sZiCRw3yXomSGxrPJSmNyDqIHinzP/
         rH6w==
X-Gm-Message-State: ANoB5pl8LL7HYYGW+lhwfUx+gms358kV65beHXCq6Y8znvNX1sFE3tXD
        jhwgGINOweVEwdYmCukobplrew==
X-Google-Smtp-Source: AA0mqf6Ai63Lvn4lPSEHsIJqs5NWlG+yEnhX8s/K+t+sinQ058a/JdqLaNPM6UtafcdtITYNKx3R2g==
X-Received: by 2002:a05:6512:33d2:b0:4b5:28fc:36e1 with SMTP id d18-20020a05651233d200b004b528fc36e1mr12149885lfg.179.1670486358836;
        Wed, 07 Dec 2022 23:59:18 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id o9-20020ac25e29000000b0049465afdd38sm3247926lfg.108.2022.12.07.23.59.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Dec 2022 23:59:18 -0800 (PST)
Message-ID: <a2653b17-4ed4-6fe3-ca46-6f8917a58171@linaro.org>
Date:   Thu, 8 Dec 2022 08:59:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH V6 1/2] dt-bindings: firmware: qcom,scm: Add optional
 interrupt
Content-Language: en-US
To:     Sibi Sankar <quic_sibis@quicinc.com>, andersson@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, konrad.dybcio@somainline.org,
        robimarko@gmail.com, quic_gurus@quicinc.com,
        quic_rjendra@quicinc.com
References: <20221208064031.2875-1-quic_sibis@quicinc.com>
 <20221208064031.2875-2-quic_sibis@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221208064031.2875-2-quic_sibis@quicinc.com>
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

On 08/12/2022 07:40, Sibi Sankar wrote:
> From: Guru Das Srinagesh <quic_gurus@quicinc.com>
> 
> Add an interrupt specification to the bindings to support the wait-queue
> feature on SM8450 SoCs.
> 
> Signed-off-by: Guru Das Srinagesh <quic_gurus@quicinc.com>
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> ---
> 
> The interrupt property for scm firmware from a binding perspective is
> completely optional i.e. not all tz fw running in the wild on sm8450
> devices support this feature. The bootloader does the interrupt property
> addition on sm8450 devices with wait-queue support.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

