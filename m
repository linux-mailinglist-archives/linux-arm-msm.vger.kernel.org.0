Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF68D687FD2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Feb 2023 15:22:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232295AbjBBOWA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Feb 2023 09:22:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232318AbjBBOV6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Feb 2023 09:21:58 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5CCF8E4A9
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Feb 2023 06:21:56 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id o18so1865216wrj.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Feb 2023 06:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hT2Sg5RCvxGVieyn9ThyduouHJ14wDuCxDRQiyyVT08=;
        b=J6bhMmXWXuIVKrracXN1hlO5UL0c6ORDi0dUF8738D5qvkC1WsSJBXct9MGnh924bg
         qF3zQAqtRSsf99OkABnyTd0y2Rj8v2L/ib8Zz0o7sR+XqKyv1YmWpo+h3ueIWxA/vKaJ
         T2r7o3MtRmED/rnfD7WvZynzpNr4x5FBztsRaYjR7uWN9cNqUXAzCCAOst4gV0HDBI6v
         ucE7apxixCOH1p0k7Lo/4HB7rqd+bLocQm5ighQ+vLsL1s1VupL9FKi7ixf4obEfLmMp
         3DptFuEl7NZxpLachyXgQeCLrXX+vppdRUJ35lVqGOu2TcrpJBZNx8kb9R2hJcmjTejr
         En/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hT2Sg5RCvxGVieyn9ThyduouHJ14wDuCxDRQiyyVT08=;
        b=keui+Rfr+bm8VX4ELu7bjeHiePsO/g5EwqWnn58Jr6c6vwLff6Euemtc02s8Fdvysp
         qCRdYhBWketq9NzzxI2m0TWVB4gmQVzGMV9Km7KiIcsfNHtqIBPpmfp03BD55WsVG1Zi
         mHsofbzL2Le+4ppXp20/Qng4D0zEr5BVKimoU12XgYp5ONfth61m0h796GQCV2Fr931p
         1EitEfS+akXWYeXW5aM4Mr3XAAxSv5a9HFUJvvJmR9RlOqP+ww6BYp97KGKQyMJMBBYG
         4vEjmG+CDAAdmohNcQzhJtlewpgP7LC6nHCgBSKd+gGLVXbgopz+OwN22qmJ10epPbW1
         xMgg==
X-Gm-Message-State: AO0yUKXQQ/g6T3jQB2IlacqiZhzhzhYxPvyv7Z6AU62gsFOdXxL/lZmV
        sJNj4i4dWsq87PE43m8XegiaBA==
X-Google-Smtp-Source: AK7set8zei2DpYWSg2v+HiyD2kgij91FDnUnAnI8IZ3BcHnTi/6hAy3n2MqL/MiZxc82RKC8sSDjRg==
X-Received: by 2002:a05:6000:68a:b0:2be:c5d:adc4 with SMTP id bo10-20020a056000068a00b002be0c5dadc4mr6235940wrb.13.1675347715298;
        Thu, 02 Feb 2023 06:21:55 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:ce5b:78ab:f662:ef0d? ([2a01:e0a:982:cbb0:ce5b:78ab:f662:ef0d])
        by smtp.gmail.com with ESMTPSA id p6-20020a5d48c6000000b002bfc0558ecdsm19701947wrs.113.2023.02.02.06.21.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 06:21:54 -0800 (PST)
Message-ID: <a2e4dff0-af8f-dccb-9074-8244b054c448@linaro.org>
Date:   Thu, 2 Feb 2023 15:21:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v8 5/9] dt-bindings: qcom-qce: document clocks and
 clock-names as optional
Content-Language: en-US
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org
References: <20230202135036.2635376-1-vladimir.zapolskiy@linaro.org>
 <20230202135036.2635376-6-vladimir.zapolskiy@linaro.org>
 <32c23da1-45f0-82a4-362d-ae5c06660e20@linaro.org>
 <36b6f8f2-c438-f5e6-b48f-326e8b709de8@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <36b6f8f2-c438-f5e6-b48f-326e8b709de8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 02/02/2023 15:04, Vladimir Zapolskiy wrote:
> Hi Krzysztof,
> 
> On 2/2/23 15:53, Krzysztof Kozlowski wrote:
>> On 02/02/2023 14:50, Vladimir Zapolskiy wrote:
>>> From: Neil Armstrong <neil.armstrong@linaro.org>
>>>
>>> On certain Snapdragon processors, the crypto engine clocks are enabled by
>>> default by security firmware.
>>
>> Then probably we should not require them only on these variants.
> 
> I don't have the exact list of the affected SoCs, I believe Neil can provide
> such a list, if you find it crucial.

It's the case for SM8350, SM8450 & SM8550.

Neil

> 
> -- 
> Best wishes,
> Vladimir

