Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C910781CD1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Aug 2023 09:50:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230081AbjHTHuo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 20 Aug 2023 03:50:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229929AbjHTHul (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 20 Aug 2023 03:50:41 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67E361996
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Aug 2023 00:46:38 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-523100882f2so2772397a12.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Aug 2023 00:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692517597; x=1693122397;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QmfZ+SiJOWM4wr0njlNQlaopeewjxvRP8AoylcngqZ4=;
        b=GQUlkLfCJkqeNj5HfYK2AV2l5JKW/qkrnDxjsk//74Dw2LXOuDBKO2ZMHjaJNYmn8U
         zk+tHwH2mLQ1y8Y32YXtsH7ICtwUtoIk84BKMf9V7KYtJeCDIbKist6BOO4rZZhIMyDi
         CzjnVY/HFdEELJ3bzf/dEevLLNZ6c7eLVopBE80/5fcf7Y36v83dnkFuuV+VHn9Xh6Vu
         5K5wBUqZq5HQhVHY9aFqM4f0qWK6xuAUZe1hyF1xzMtPx1DAjA3FogHUr9MeHZ3mGJqO
         3zzBpVEIqKfuacsLHIKfHpAplXIXbU86yBGdZnyU33YGjchXNalc2XVSozUaoEql4IRq
         gGyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692517597; x=1693122397;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QmfZ+SiJOWM4wr0njlNQlaopeewjxvRP8AoylcngqZ4=;
        b=RLlT9OB/xKtXTy/GtyRDOEj8mBkVeF6ibnm+JEO3DvnHv5ep5H0zi22chCfImag22W
         WP8SvanU1sYs3CGYgOT2D1uwJLm1EF0xmDSxUYU9Vg+Mm7eLr1ziQz4pV7RYM1kWuUas
         HNw1d06kgagGV++67U/yFG+FsLbgo9kpwZ0GMZcN6FI6d2miqJAPecI8t9S7+BmfMc3I
         fZ4aTJfYba3fuw2+zAkOGirAYoQXfxT95xFHq4LX0gVZy1MujlVnJCe7GNttmAb8N1CD
         YnSYi34dXV4ueao4avlDl8nleIswus2TV4+k7HlZvnb6aWBHUVl0rvgE5KRaYYOWny5J
         qF7w==
X-Gm-Message-State: AOJu0YzjDqm4/aLosdGyBIUzEZIQ6whNVvSb8Fou4flAseCSwS7gR/XB
        XrM+ZBal8AukUR9pTBfITW8yXQ==
X-Google-Smtp-Source: AGHT+IE9UAhpM23Qtr+rSDWs9SKgkUBVji+XvoW8vc7xKd92v0kEPd6DTlD/OWETrGGN7CZwS08SOA==
X-Received: by 2002:aa7:d3d2:0:b0:523:d715:b7b3 with SMTP id o18-20020aa7d3d2000000b00523d715b7b3mr2132962edr.41.1692517596912;
        Sun, 20 Aug 2023 00:46:36 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id p1-20020aa7cc81000000b00525c01f91b0sm3922978edt.42.2023.08.20.00.46.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Aug 2023 00:46:36 -0700 (PDT)
Message-ID: <4b6c8f86-d879-fa69-ca28-cb684877932e@linaro.org>
Date:   Sun, 20 Aug 2023 09:46:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH RFT] arm64: dts: qcom: sc7280: drop incorrect EUD port on
 SoC side
Content-Language: en-US
To:     Doug Anderson <dianders@chromium.org>
Cc:     cros-qcom-dts-watchers@chromium.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
References: <20230725084633.67179-1-krzysztof.kozlowski@linaro.org>
 <CAD=FV=Xt26=rBf99mzkAuwwtb2f-jnKtnHaEhXnthz0a5zke4Q@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAD=FV=Xt26=rBf99mzkAuwwtb2f-jnKtnHaEhXnthz0a5zke4Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25/07/2023 21:35, Doug Anderson wrote:
> Hi,
> 
> On Tue, Jul 25, 2023 at 1:46 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> Qualcomm Embedded USB Debugger (EUD) second port should point to Type-C
>> USB connector.  Such connector was defined directly in root node of
>> sc7280.dtsi which is clearly wrong.  SC7280 is a chip, so physically it
>> does not have USB Type-C port.  The connector is usually accessible
>> through some USB switch or controller.
>>
>> Correct the EUD/USB connector topology by removing the top-level fake
>> USB connector and adding appropriate ports in boards having actual USB
>> Type-C connector defined (Herobrine, IDP).  All other boards will have
>> this EUD port missing.
>>
>> This fixes also dtbs_check warnings:
>>
>>   sc7280-herobrine-crd.dtb: connector: ports:port@0: 'reg' is a required property
>>
>> Fixes: 9ee402ccfeb1 ("arm64: dts: qcom: sc7280: Fix EUD dt node syntax")
>> Cc: Bhupesh Sharma <bhupesh.sharma@linaro.org>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> ---
>>
>> Not tested on hardware.
>> ---
>>  .../arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 15 +++++++++++++
>>  .../arm64/boot/dts/qcom/sc7280-idp-ec-h1.dtsi | 15 +++++++++++++
>>  arch/arm64/boot/dts/qcom/sc7280.dtsi          | 21 +------------------
>>  3 files changed, 31 insertions(+), 20 deletions(-)
> 
> FWIW, I've always been very intrigued about the embedded USB port but
> never managed to find any way to get it actually enabled. :( ...so I'm
> probably not the best person to actually review this. That being said:
> 
> 1. I'm nearly certain that this is completely unusable on herobrine
> boards. Specifically on herobrine there's a USB hub between the SoC
> and all the physical ports on the device and (I think?) that prevents
> EUD from working. It is possible that hoglin/zoglin is an exception
> here and Qualcomm might have some backdoor way to access EUD on these
> devices since this is hardware that they built.
> 
> 2. I've always been pretty baffled about the sc7280 EUD stuff since
> the device tree shows the EUD on "usb_2". For some background: there
> are two USB controllers on sc7280. There's "usb_1" which is USB
> 2.0/3.0 capable and, at an SoC level, is the "Type C" port.
> Specifically the pins on the SoC for the USB 3.0 signals are the same
> pins on the SoC as two of the DisplayPort lanes. Then there's "usb_2"
> which is USB 2.0 only. If you'll notice, "usb_2" is not set to status
> "okay" on any boards except "sc7280-idp.dts".
> 
> I asked Qualcomm at least a few times in the past if the EUD is truly
> on the USB 2.0 port (which means it isn't connected to anything on
> herobrine boards) or if it's actually on the "type C" port (which
> means there's a hub in between) and never got a ton of clarify...
> 
> Given how baffling everything is, I wouldn't be opposed to just
> deleting the EUD from the device tree until there is more clarity
> here. If you don't want to just delete it, at least I'd say that it
> shouldn't be hooked up for herobrine.
> 

Thanks Doug. I forgot to Cc the original author of the code - Souradeep
- but anyway disabling incomplete node seems reasonable.

Best regards,
Krzysztof

