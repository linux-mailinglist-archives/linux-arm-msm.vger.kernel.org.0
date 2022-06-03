Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B4EA53C7F8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jun 2022 11:56:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243257AbiFCJ4G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Jun 2022 05:56:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241320AbiFCJ4E (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Jun 2022 05:56:04 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6B9B3AA51
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jun 2022 02:56:03 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id q1so14912545ejz.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jun 2022 02:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=zs/Snm7wBkBvkKLKDEJnB4SYZuuEuwpMYd9uLaVIwAE=;
        b=DdIngkecu9AmD2BzAJfyBpoShkPBVC4nsP1yeLLlFehRqlWKi6JVSb1+elF2xPskEf
         vvEcXeBkkwygEIXvXZGY3hePMwnnpjO2MX+j9sMHvqik1O/pDV+UoFKabvYpubHyphLo
         bMxjmCxJHhKhbbxt2s3KMyDBnMp73jgsYJmTz1sU6mQSnDkJo86g1qcwSpyfpzz5IDzb
         zzOc0o2/VgHg4Ivm/SG9gCVH4M0uuSW192XTP2pA8qL3gtlp6HOm6z0XMDxx6noVDfLO
         oM2qN+XVjNQONM5KIoANhvk7OTFgReUPj5K38EiorCx4wAioCrlZ+bMSx7ljGVt505nm
         n6/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=zs/Snm7wBkBvkKLKDEJnB4SYZuuEuwpMYd9uLaVIwAE=;
        b=M0r8iwnGVqwCSMaJCnS8VYQjeYlwyMu4QEz2d4a5YUROguJyQgJvPS7zc/etyZbMJU
         ATHTX2iLsNanvk30o1oWJzgVVTlsILN2iQLGZX/e/mTp8stG5eOM/zDEnlGeHwZxjax3
         s1bs1/7jgZCPuz1To/hcKZ3iX5gC8cIOoNsZmYWMjbM5wSo3XeN8BBy+D8DU3+aYIfO+
         JtvXZ4CgHF0tYAGEwWb94sT+JenaDlnMvZ2XeGJXtiwcOTAE5eTj54rDKcMd3/hTnDU0
         fKswGAHqXGqToyKs19Whmq35guzlZ//gQhmZ2JIAC0iOkmQ+B+AFbpXleOpBZx2xfQFj
         6T6g==
X-Gm-Message-State: AOAM530PlpTcZkNZazDvMcCqJyJ2OrfwrK1FWG2X3A7SpUxU7C+n+sfl
        3wwTiIulVzAYNmyPJT3QEOrE7w==
X-Google-Smtp-Source: ABdhPJyLZEXgasjK1iNOh+v508745d/SULGzUUJKtECcrWud9tCUDwBjEhia6wGu5d/38gtONk+/Ww==
X-Received: by 2002:a17:907:1686:b0:70e:895b:7ba0 with SMTP id hc6-20020a170907168600b0070e895b7ba0mr1731808ejc.484.1654250162255;
        Fri, 03 Jun 2022 02:56:02 -0700 (PDT)
Received: from [192.168.0.181] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id l15-20020aa7c3cf000000b0042bdb6a3602sm3520334edr.69.2022.06.03.02.56.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jun 2022 02:56:01 -0700 (PDT)
Message-ID: <173ad8d6-44b3-444b-c72d-f35e83d7ed1a@linaro.org>
Date:   Fri, 3 Jun 2022 11:56:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] arm64: dts: qcom: add device tree for LG G7 and LG V35
Content-Language: en-US
To:     Stefan Hansson <newbie13xd@gmail.com>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org
Cc:     Anton Bambura <jenneron@protonmail.com>,
        Gregari Ivanov <llamashere@posteo.de>
References: <20220602120727.197491-1-newbie13xd@gmail.com>
 <b99033fd-ca3c-49bb-d46b-c9ca1cb0c386@linaro.org>
 <6927df15-54d1-bf1e-0e34-9524e79e3f0a@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <6927df15-54d1-bf1e-0e34-9524e79e3f0a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03/06/2022 11:47, Stefan Hansson wrote:

>>> +	gpio-keys {
>>> +		compatible = "gpio-keys";
>>> +
>>> +		pinctrl-names = "default";
>>> +		pinctrl-0 = <&vol_up_pin_a>;
>>> +
>>> +		label = "GPIO Buttons";
>>
>> Is "label" really a property of gpio-keys node?
>>
> 
> I tested these dts:es with dtbs_check and I do not see any errors 
> regarding labels. If you prefer me to delete this I can do that. I 
> understand it is rather weird to have this here if it's not in the 
> schema. I am rather new to writing device trees, so I think you are 
> better off making the call here.

Thanks for reporting. Indeed current DT schema won't detect this. Anyway
it seems gpio-keys driver already uses it and since it appeared in DTS,
maybe better to document it. I'll work on this, so feel free to keep the
property.


Best regards,
Krzysztof
