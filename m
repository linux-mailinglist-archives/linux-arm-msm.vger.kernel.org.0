Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 550C766461A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jan 2023 17:32:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238703AbjAJQbx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Jan 2023 11:31:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238628AbjAJQbq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Jan 2023 11:31:46 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCE9F81D5C
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jan 2023 08:31:42 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id ay40so9249882wmb.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jan 2023 08:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kgOd+VWxsnmKVu53YzWAVlTYBysrxAFnTfMj/8sDZDE=;
        b=Kbq7XT8uNB0knbmfwL9Q1lihlhuGeO0201X31jmgqbpked5t9NliIEh8HYr21QVJuK
         kXUdnGAEC/8oStNApzbVsOeHfgnqb3As8t9gom4QKl8qWCazPWRG2ljn2jEzfuw2auco
         jtH0MtvSxJjzMNNl0Z7bicmkMIWCslhoGzveDOp8EmltPaiccb16fAmui1EoAFagJ6Iw
         pNPHIJa3E9FBof9cI+5ccHxCJisJpOCZOEjWH3e7Su1LK+Qtb8WGpGlexbUVHqsRR1vi
         xZlZUbaK1wT5u/iejFGfhQ+QQa0sCbqivEu2Ft1ktfa0T6ifjF4OxMkV+sS9XihY2F5H
         FIXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kgOd+VWxsnmKVu53YzWAVlTYBysrxAFnTfMj/8sDZDE=;
        b=OefVBt6ONZcc9kyelY57Kh5Zqjv2cqjP8VBIwmr6K5qcCS/DgBJJqMdtNS1HnWvVUQ
         7ono7ILhvr5EyhopcJZy686NG0RAtaO+AGvyuJaEI4iAnolXQFG8ZTSL0UpGg7Mt8taJ
         cAHgPxrCf/kgHRANrSdR2R3FnSedrkrG8Ig9qU29snbn/xfj/u1xU2AnAwyNKs7yOPix
         xiYSm+6f6kpYW8q5yLidUeaQaZFbebSyOvpzF7G4F3olDTEuKUJvx02sXZWyV2aprSEP
         i2crfU15cLmaj5RgzCmBN4mRzzIcikh1YQSC1+z7fxQP+r02H+bmCf8GZBFLIa+dwSPz
         Ik7A==
X-Gm-Message-State: AFqh2ko8VELiDa9yehO7Gt7A3YyLrfYiI8qQjOVfHuR1TUQ8Fv+MZ/ha
        E93czrKj0TJNxxKxR3Ukc2kAGA==
X-Google-Smtp-Source: AMrXdXv6olYMonryRGkx+SneUVIxO8RmSw0eLwPtZ0cqKL6w6ZyJfFtjunX//Vf2e2ZrSFajZZQjtg==
X-Received: by 2002:a05:600c:5c8:b0:3d1:4145:b3b with SMTP id p8-20020a05600c05c800b003d141450b3bmr51162153wmd.9.1673368301362;
        Tue, 10 Jan 2023 08:31:41 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id c18-20020a05600c0ad200b003d9c97d82f2sm15278312wmr.8.2023.01.10.08.31.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 08:31:40 -0800 (PST)
Message-ID: <439c4aa1-2769-3c66-4d15-15729643c736@linaro.org>
Date:   Tue, 10 Jan 2023 17:31:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 2/3] dt-bindings: qcom: Ducument bindings for new
 msm8916-zhihe-uf896 and msm8916-zhihe-ufi001c
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
References: <20230110155014.31664-1-forbidden405@foxmail.com>
 <tencent_5AB8DBF2B3CDE947BB84B3D6D2A0D7023F0A@qq.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <tencent_5AB8DBF2B3CDE947BB84B3D6D2A0D7023F0A@qq.com>
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

On 10/01/2023 16:50, Yang Xiwen wrote:
> Document the new zhihe,uf896/ufi001c device tree bindings used in
> their device trees.

Subject: drop second/last, redundant "bindings for". The "dt-bindings"
prefix is already stating that these are bindings.

Subject: typo - Document

Subject: shorten it, use some shorter user descriptive model name

> 
> Signed-off-by: Yang Xiwen <forbidden405@foxmail.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index 65ef7e442da0d..efe5f6c384b69 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -210,6 +210,8 @@ properties:
>                - samsung,j5
>                - samsung,serranove
>                - wingtech,wt88047
> +              - zhihe,uf896
> +              - zhihe,ufi001c

Real hardware, running real mainline OS cannot be called "placeholder".

>            - const: qcom,msm8916
>  
>        - items:

Best regards,
Krzysztof

