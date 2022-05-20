Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A71352EE87
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 May 2022 16:54:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350517AbiETOyl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 May 2022 10:54:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237447AbiETOyk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 May 2022 10:54:40 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 754EE1737CF
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 May 2022 07:54:39 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id b32so9982830ljf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 May 2022 07:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=4BJIT7CG+Ul2K/EB6KaL6cJMzPTA3sPqOQKdczNQrz0=;
        b=XiL/0TCBEhD5jOpMvf+4h3Uz3adrFQvHz3m15JiIOFF50t8K0dCctWQJl5TyuG8HSK
         /FQIIGd4+oZKqiRff4nW3Twkj4PAvbPHoDI2DICGKZWZMllrazXCk5yfr8//Esgu7Ksa
         AQErmMxiLKzR4Ei3gYnxDo1EMiWL6jVe45bRsdShKs3j/dyr77n7/dRxQ/o30byqYsDa
         cCdQDzHt+XL/p+WOjSsKg+5Qkfoq5l3xh86Rr8jCcnkOVBlAPg3woP7CBrlYG/Lt7aPG
         G66gvKCftnM2GZPyMVkg2V995CxPHLuCzQ1DN0zwTmNwJ0LJtIhG79uXq9RBn4rLj2wi
         85xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=4BJIT7CG+Ul2K/EB6KaL6cJMzPTA3sPqOQKdczNQrz0=;
        b=Nb1lx+fYqZOS6a9jazu1QWO+urCv+aOl46Hd07HR0rPRwFqq4ndSsYdKFTO9NrOB0b
         HTWEFjfLys/4Xf9pKlE7TxSPVY4s6tYponUwc53DeJE619QvydVXMDTlgl7O2vJbM5KK
         QoPKYgDk2isRIshg/vWaijPlVmpIGIH5/mo+n2bY1tY4+N4VzS9X63aZHwC/1KeK+OHv
         0gC1uA0E2Yl8q8HiaHAMWV2mr0nAVowm4wvtikcS7pz0ErmsO4JNganIJy5XhYRFNUqT
         b5oocQR5y2vhS1ehGFymd8T0+OxhBo4KAWkDqcJvN79dzV02RHsFH3EE4KMjML8alc6T
         iT4A==
X-Gm-Message-State: AOAM532ywGKuFHrVAusRApgViFOGVCWk98rAh9gfyUz/FagMWoY+jiSj
        JhI8CP8ASzBxreyCZfUhne6hN/pBW0+Vx2YZ
X-Google-Smtp-Source: ABdhPJwsgGw3Tfn2I01xsNTM/Xrzfl3SCvqSwPoFgoVuLlutxeYLQV0lqlxPCwxh7WUHbRKLbAru/Q==
X-Received: by 2002:a05:651c:179a:b0:247:d37b:6ec5 with SMTP id bn26-20020a05651c179a00b00247d37b6ec5mr5616804ljb.112.1653058477877;
        Fri, 20 May 2022 07:54:37 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id f3-20020a19ae03000000b004779f2ce1e7sm689290lfc.53.2022.05.20.07.54.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 May 2022 07:54:37 -0700 (PDT)
Message-ID: <1b39bff2-7eb1-b613-654d-59d11dcfe03a@linaro.org>
Date:   Fri, 20 May 2022 16:54:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] dt-bindings: soc: qcom,rpmh-rsc: simplify qcom,tcs-config
Content-Language: en-US
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Rob Herring <robh@kernel.org>
References: <20220426110757.80603-1-krzysztof.kozlowski@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220426110757.80603-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 26/04/2022 13:07, Krzysztof Kozlowski wrote:
> The schema for "qcom,tcs-config" property can be a little bit simpler,
> without the need of defining each item.  Also move the description of
> each part of "qcom,tcs-config" tupple to the tupple items description.
> 
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Hi,

This was sent a month ago... any chances for pick up?

Best regards,
Krzysztof
