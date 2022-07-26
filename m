Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC18F58141D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Jul 2022 15:26:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231154AbiGZN0G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Jul 2022 09:26:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232994AbiGZN0E (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Jul 2022 09:26:04 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D6B5B1FC
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jul 2022 06:26:03 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id z25so22705509lfr.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jul 2022 06:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=7LFFMwiJHSgt40VzNgnK+p0FFAjdjoeGyTH4E8FwT0E=;
        b=Aiij4gjIIX693LP3uECqDjhaNEduUYkTznUdozN6Z1X40PUPTHN+vv8FbbmpNUqhrh
         u2m/nMkW5fh9k5qQ/m5dalcbJSVBVF4lQebPHd1LnVZt5zmiLl9sABtM/Nu+mNud+1Vg
         b4rBDftjLJu8c52FxG197+ZtQ+wYjpvPhQ32KlQVSTpOQmJso+Z+GluiUqli8oFn6lY/
         7GGUGe4dLSAXcnncncROK7clRlT4q6+bxv7ffFDN8wTJec+Ngx11lCo8e4Rff2oV+umo
         CFMFzez31oIvcU/N8+b9gPCbipF/Eb7q55vbQrKAfQBeOjsCijMeKvYwviwS3395i/Tn
         cQ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=7LFFMwiJHSgt40VzNgnK+p0FFAjdjoeGyTH4E8FwT0E=;
        b=RWHnKTr7OGwF78obwciJD8m92r7z+glVzLwrFvTY+1fRSD179AfrmUd3Uh0JWPBdAG
         rH757WuD8fmQyM1gNEcar2kFmu6xUyjPoZvF+Sm8NjgwPsaSasWpz/qTnl/s2r1FQwdA
         SAm8E36pj5/K36uYePABkw6A2m6cF3d33mjPNgETIp72pMflcZGwiYsHUtgfqkZnCLTk
         dasEwI56DeIFpPRJ6pKw/V6R6O9uyDIr+aoB45CQxyCvmRbilnAKJz0ozy09BT92zyGv
         MZUW07r7Zw6ggkL9yXUoWc3nl7YQ6YRvSC2Og7UdRMUo7HV8MTzmVLLYzurDM7HySEm0
         TvFg==
X-Gm-Message-State: AJIora9PzJ/5LKWTUz+7BgTtmrm46YMRk4FBV1UZNy0eNP48j9FhbSnF
        WQmh55dPi3M/fjcpGIykHKNhnw==
X-Google-Smtp-Source: AGRyM1uBaVRREf8/ovTyKCewffls63KLbGfV6IuqcxFgSfDg/bqFevMeoWqywHu+/bDCIz+1i8Cefw==
X-Received: by 2002:a05:6512:1301:b0:488:c42:5c02 with SMTP id x1-20020a056512130100b004880c425c02mr6106016lfu.61.1658841961437;
        Tue, 26 Jul 2022 06:26:01 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id p18-20020ac24ed2000000b00489c54859a5sm328145lfr.287.2022.07.26.06.25.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Jul 2022 06:26:00 -0700 (PDT)
Message-ID: <11e5c369-c0da-7756-b9e2-ac375dc78e9d@linaro.org>
Date:   Tue, 26 Jul 2022 15:25:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 4/4] dt-bindings: firmware: Add Qualcomm UEFI Secure
 Application client
Content-Language: en-US
To:     Maximilian Luz <luzmaximilian@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ard Biesheuvel <ardb@kernel.org>
Cc:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Steev Klimaszewski <steev@kali.org>,
        Shawn Guo <shawn.guo@linaro.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, linux-efi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
References: <20220723224949.1089973-1-luzmaximilian@gmail.com>
 <20220723224949.1089973-5-luzmaximilian@gmail.com>
 <e88d1036-dc58-3fc8-c388-edba9b2d62a7@linaro.org>
 <87c19c5a-d7f4-7183-1322-f62267e01b3b@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <87c19c5a-d7f4-7183-1322-f62267e01b3b@gmail.com>
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

On 26/07/2022 13:15, Maximilian Luz wrote:
>>> +properties:
>>> +  compatible:
>>> +    const: qcom,tee-uefisecapp
>>
>> Isn't this SoC-specific device? Generic compatibles are usually not
>> expected.
> 
> This is essentially software (kernel driver) talking to software (in the
> TrustZone), so I don't expect there to be anything SoC specific about it.

You are documenting here firmware in TZ (not kernel driver). Isn't this
a specific piece which might vary from device to device?

IOW, do you expect the same compatible to work for all possible Qualcomm
boards (past and future like in 10 years from now)?

> 
>>> +
>>> +required:
>>> +  - compatible
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    firmware {
>>> +        scm {
>>> +            compatible = "qcom,scm-sc8180x", "qcom,scm";
>>> +        };
>>> +        tee-uefisecapp {
>>> +            compatible = "qcom,tee-uefisecapp";
>>
>> You did not model here any dependency on SCM. This is not full
>> description of the firmware/hardware
> 
> How would I do that? A lot of other stuff also depends on SCM being
> present (e.g. qcom_q6v5_pas for loading mdt files) and I don't see them
> declare this in the device tree. As far as I can tell, SCM is pretty
> much expected to be there at all times (i.e. can't be unloaded) and
> drivers check for it when probing via qcom_scm_is_available(),
> deferring probe if not.

It seems this will be opening a can of worms...

The problem with existing approach is:
1. Lack of any probe ordering or probe deferral support.
2. Lack of any other dependencies, e.g. for PM.

Unloading is "solved" only by disallowing the unload, not by proper
device links and module get/put.

I understand that SCM must be there, but the same for several other
components and for these others we have ways to pass reference around
(e.g. syscon regmap, PHYs handles).

> 
> Don't take this as an excuse as in "I want to leave that out", it's just
> that I don't know how one would declare such a dependency explicitly. If
> you can tell me how to fix it, I'll include that for v2.

I think there are no dedicated subsystem helpers for this (like for
provider/consumer of resets/power domains/clocks etc), so one way would
be something like nvidia,bpmp is doing.

meson_sm_get is a bit similar - looking by compatible. This is less
portable and I would prefer the bpmp way (just like syscon phandles).

The qcom_q6v5_pas could be converted later to use similar approach and
eventually the "tatic struct qcom_scm *__scm;" can be entirely removed.

Any comments on this approach from Konrad, Bjorn, Dmitry, Vinod and
anyone else?


Best regards,
Krzysztof
