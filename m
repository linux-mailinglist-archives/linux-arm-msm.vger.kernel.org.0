Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B711687A6B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Feb 2023 11:39:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232718AbjBBKjb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Feb 2023 05:39:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232560AbjBBKj2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Feb 2023 05:39:28 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0F2588F2C
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Feb 2023 02:39:20 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id h12so1250315wrv.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Feb 2023 02:39:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:cc:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E16wygEHabf7g5WwgI/WeZjDwUEJd7wtPZx3B4LLZ6Q=;
        b=DX1bgzezZkwhczfa75PPliTCZT/jhNaclYJe9hDbK7yfKE/BbuQ/+8BoISuTUUSWmc
         UaR5aST3E5QlSNPcchS2ENKKIws4tGPsRY1+QWmuD80CclfjSdOapU2cAG1USa1iQ4HN
         Stx3VTwCvJ63sfghhPJ3q+SNDEWcm/ofoxiz00IdYHvVKw7L3wRzpQKPws4/WQQ13S97
         Z+IlcEoxlAdiV/s9xqPyrKCFY27GRP4o6RcgIqLtr5/fDVjV48h5nijYk8s4rBKbRKt2
         EFczsYyV1UIxJuAejf0PgLLfGGIUk2a8CvcROQ2aVRV8ZHKTlv13QS6LLLqhcpNkEC99
         uxVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:cc:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E16wygEHabf7g5WwgI/WeZjDwUEJd7wtPZx3B4LLZ6Q=;
        b=By2Pm6B92/PuO29PWx7vUvLpZK16HLBehhi+erHqDfn8LpX8ytTmBxpGMxCBnjXyXr
         CxCXOAG3EFBYHc7bu8vHTlVWGWcB69DAn+pxlq5XIRg79kLjA7FZU93bkIopMCi/XbUg
         LmUPgY/OBNbcyxhMUwUSh6RcVirAY5luRCPWcJfjsO8CH+DN99CMjdvg6+GHUsZPuWQa
         kR72FJuhbdfOxf0Pab0sV7meCvUN0MKJhvno3PwHUCD28cgk3hxoeJoSSZJ6aR6+c+gY
         bMk0SCbj2RfuZ4wzlgAYBzTuHcok53DzZd8rJEOI0e/9ASAdw5fPQLTRhfs8uboV6id1
         5iow==
X-Gm-Message-State: AO0yUKWuxxAphx8Bf0XAIZjuL8LtdEW9+E6+tJFzD7y89rSzsBR4F66E
        bHNfsrZIr7QTMIBztmfM0DdrkQ==
X-Google-Smtp-Source: AK7set++iSIEmdZMwcH5G08gFH9wtE/hZDXBIYxoWjMEBG7Kiw/IZAeL/6eb/huO7D1KeqzaYqsBhw==
X-Received: by 2002:a5d:6b89:0:b0:2bf:b571:1f18 with SMTP id n9-20020a5d6b89000000b002bfb5711f18mr5692034wrx.61.1675334358663;
        Thu, 02 Feb 2023 02:39:18 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id a4-20020adffb84000000b002bc7f64efa3sm19235865wrr.29.2023.02.02.02.39.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 02:39:18 -0800 (PST)
Message-ID: <3481774e-2494-447b-a3ce-0267de296e5f@linaro.org>
Date:   Thu, 2 Feb 2023 11:39:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFT PATCH 00/14] ARM/arm64: dts: qcom: correct TLMM gpio-ranges
Content-Language: en-US
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230201155105.282708-1-krzysztof.kozlowski@linaro.org>
Cc:     Stephan Gerhold <stephan@gerhold.net>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230201155105.282708-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/02/2023 16:50, Krzysztof Kozlowski wrote:
> Hi,
> 
> Correct the number of GPIOs in TLMM pin controller.
> 
> I really hope I got it right... The last number of gpio-ranges is the number of
> GPIOs. See: Documentation/devicetree/bindings/gpio/gpio.txt
> 
> The examples in bindings were fixed here:
> https://lore.kernel.org/linux-arm-msm/20230201153019.269718-1-krzysztof.kozlowski@linaro.org/T/#t
> 
> Not realy tested, but I do not expect troubles, unless I missed some obvious
> stuff (like a number in pinctrl driver).
> 

As pointed out by Stephan, this is mostly incorrect and needs fixes.
There will be a v2.


Best regards,
Krzysztof

