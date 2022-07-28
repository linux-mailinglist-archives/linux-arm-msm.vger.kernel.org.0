Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46AB95840BC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Jul 2022 16:11:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230081AbiG1OKv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Jul 2022 10:10:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231219AbiG1OKS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Jul 2022 10:10:18 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59A8F6392B
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Jul 2022 07:10:05 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id bf9so2992883lfb.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Jul 2022 07:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=3ZkQISkEyAXqDJZYEpQ7KC461gTyV9M43PYYTAdpW9k=;
        b=l1GF1944v4xfZOTAoyVPjRU1bI2U5o/dI5UtIc8ezqvZnf6NLuoQyXXO9lBdy/HzQ1
         +dPIJxPqqSzNPc8VsHoSd6/JlGb5zLyq4cNxNqpiXrik6qjLpqMutKXPbBF2uuYzniUG
         6uJShkWKsE4I29ZHjuhSpvH8rOew62e96DMQULj+zuFjt8FCGTlm4om7Uc7AiAOiidKo
         yWpb65M38LA7CyzuIhyA8nDHIsLZNdvpiFE+V/SdsEdF2l56AfxXsuCavlsOL4mKLLra
         F9eAhGM+agB1gTsE4kNekk0xY3vYAwuPTxec0hl0f+cn0zIY3KzN1Lj+8+ZGOYzaiidl
         WYyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=3ZkQISkEyAXqDJZYEpQ7KC461gTyV9M43PYYTAdpW9k=;
        b=trm/MBocZi8ct9fVyfhlFpcbtYetOT5sN7XEPmIDFRESMDK9L7jQOSPQktQbKD5bw0
         W511qbnU3PP3s1hTz+oNVv4n84CX+dvQxHingvrR2GEGA4ytDXWF7UeE1MIEyrrcFV+r
         8sEXdVzEgGiYQEgDSwSY+Stg2ifUAttD8NBZZLsjQD9r8UT3ncORF9q6FLP2DDBOEFhl
         S2ShtJOBjWM4n7am4YEhsk0XNEQFkmaSMlybMlDNN50DXCjq9lcOQEJu7IJDo2PuaKvQ
         L9UBCUonE/p5k51RGVJjB5jZKsCs+A+uJRbjEPOvF3e5U2wmSC0ElsVy7JHcHkqxJM02
         WLQg==
X-Gm-Message-State: AJIora8pQe9pWTwSmjWYNZLJuCDPGp5R5OXF2yJxOEBQKDA8GojFCiig
        yWfjkCEGhvaXPpNvoANselsPj+D1nLsXmw==
X-Google-Smtp-Source: AGRyM1s6eMkW7RadgIwnMhQWUiqP2h73XK4fRJOfJ7MByx2t3fVD6PR8bOn5QnF0b3ef0tJyASGPUQ==
X-Received: by 2002:a05:6512:151c:b0:48a:9763:5d29 with SMTP id bq28-20020a056512151c00b0048a97635d29mr6347878lfb.79.1659017403706;
        Thu, 28 Jul 2022 07:10:03 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id e13-20020a05651236cd00b0048a727ac440sm220929lfs.45.2022.07.28.07.10.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jul 2022 07:10:03 -0700 (PDT)
Message-ID: <84923720-30a6-1a49-48f6-96e078a46743@linaro.org>
Date:   Thu, 28 Jul 2022 16:10:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 3/3] dt-bindings: phy: add definition for MSM8960
Content-Language: en-US
To:     Shinjo Park <peremen@gmail.com>
Cc:     David Heidelberg <david@ixit.cz>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220728111740.30595-1-peremen@gmail.com>
 <aef9bae5-b72b-d520-a8e5-8f6a838775eb@linaro.org>
 <CAAs2AW7A4RfxAaKPsmJjA1s7s5_rnM2O4XAAFC=7x1Npttg5rQ@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAAs2AW7A4RfxAaKPsmJjA1s7s5_rnM2O4XAAFC=7x1Npttg5rQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/07/2022 15:54, Shinjo Park wrote:
> Hello Krzysztof,
> 
> Sorry for any confusion during my first patch submission.
> 
> PATCH 1:
>>> Change the reference of sleep_clk to the same as qcom-apq8064.dtsi.
>>
>> You add label, not change something.
> 
>>> - sleep_clk {
> 
>>> + sleep_clk: sleep_clk {
> 
>>
> 
>> Since you touch the line, make the device node sleep-clk (device node
> 
>> names should not have underscores) and mention this in commit msg.
> 
> 
> I can change the line into "sleep_clk: sleep-clk". And the commit message
> would be "Change the device node of sleep_clk to sleep-clk and add a
> label"? Another problem is that in the same .dtsi file there are other
> device nodes containing underscores (cxo_board, pxo_board). Should I also
> change these in the patch?
> 
> PATCH 2:
>>> +                     phy-names = "usb-phy";
>>> +                     status = "disabled";
>>
>> status is the last property.
>>
>>> +                     #reset-cells = <1>;
> 
> I can move #reset-cells one line up and make the status last line. On the
> other hand, the same definition is also used in
> arch/arm/boot/dts/qcom-apq8064.dtsi (also the clock definition mentioned in
> PATCH 1). Shall I include another patch for that file in the next revision
> of this patch series?


Yes, you can rename them in other patch as well.

> 
> PATH 3:
>> 1. Thread your submissions.
> 
> Shall I use this thread for all follow-ups for my first and second patch?

No. One patchset, one thread.

https://elixir.bootlin.com/linux/v5.19-rc5/source/Documentation/process/5.Posting.rst

> 
>> 2. Use subject prefix matching the file.
> 
> If I understood correctly, then this should be "dt-bindings: phy:
> qcom,usb-hs-phy:"?

Yes.


Best regards,
Krzysztof
