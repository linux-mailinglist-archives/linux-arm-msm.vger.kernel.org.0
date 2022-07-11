Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 303CA56D701
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Jul 2022 09:45:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230184AbiGKHph (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Jul 2022 03:45:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230152AbiGKHpf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Jul 2022 03:45:35 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 722321A39E
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 00:45:33 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id bf9so7293401lfb.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 00:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=wqIFBf3DN10dow3GoXse21GGYLCZcVsfvhzNfQvO+X4=;
        b=bhLbh/jndXXNXiXMqF9n8seGfMnoBKK43GGudT+034/0ObNAvJXElA+PkDogw3+zvz
         pyQjOWzfJ6nNk3z7KpVKqEVBeuQXMlUdEAkDg6rgTp8HbKllExHTod6aqZISDZZbg8Pj
         w0Wi/owibTrxU/BgAaZ9wf1Ur5T18OlAvmcmAlOJUPdvIwvNivbKjeK4yQdy3UBuIdLZ
         MKDR4DBhmYmyBL1nbxQAkYge1/TaXEDSe7ty71Ro6K6AwDeMIgejSTwkfxw1PLZgZRA9
         8O/ba7KaeAKM2zfeq4AUdqc7jGptwKD6OHzc+FyI3VNINdcb6vv2Q6FItsCvH2uabyJ3
         OryA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=wqIFBf3DN10dow3GoXse21GGYLCZcVsfvhzNfQvO+X4=;
        b=V0Pgv+7vcVD9IHLMstCUT2r5vAdc4RQWuMx3UBPnmD0FOjfgNwrPyaRH2IrHtR/BmW
         tO5sC+LCpQ92HKEXs6CU/lGWwGW+UCrJM5dVdWcMT6KuK11lxmhC7wkevUkLwjp4DEIp
         Wy6k5zcsBg1HfUMc50fs/eyzUrZG8l+US6J0BpZ7Fgoww/cJ+hhpQdla1jh1qtTW5mqJ
         X+Rj/ntI7YWLJwJIPfJFRw1+KiNuLQaBQ7Fgs0QMZjgNzeQZQRriVY7R7VfpvnYdgPOe
         Po3/l7pZg9nTDP+PoMqrSincjyGJyxny6DCzSDkhge4jm0iH5/A0tustbMEmZcse/Ow0
         ViEw==
X-Gm-Message-State: AJIora/gGUsU0VFlTcD8dVafeYrPXMdr67kbp5XjYub9lIQ6X1NiS1Uw
        ye6aNqZtvaV+smetsZhDgJpDLQ==
X-Google-Smtp-Source: AGRyM1vPfEahu4HcbTv/71vdz7MtuUZ4XlDhRbns/Wsz9/D078JYEbthPyLCS1hxYMSuW+6bMIpmsg==
X-Received: by 2002:a05:6512:31c9:b0:489:e037:31b9 with SMTP id j9-20020a05651231c900b00489e03731b9mr1802467lfe.178.1657525531668;
        Mon, 11 Jul 2022 00:45:31 -0700 (PDT)
Received: from [10.0.0.8] (fwa5cab-55.bb.online.no. [88.92.171.55])
        by smtp.gmail.com with ESMTPSA id r17-20020ac25f91000000b004867a427026sm1401483lfe.40.2022.07.11.00.45.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Jul 2022 00:45:31 -0700 (PDT)
Message-ID: <9fb4beb2-96c3-1bf6-9ee3-5b87b641c234@linaro.org>
Date:   Mon, 11 Jul 2022 09:45:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/5] dt-bindings: mmc: sdhci-msm: constrain reg-names at
 least for one variant
Content-Language: en-US
To:     Doug Anderson <dianders@chromium.org>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
References: <20220707075151.67335-1-krzysztof.kozlowski@linaro.org>
 <20220707075151.67335-3-krzysztof.kozlowski@linaro.org>
 <CAD=FV=WFdtx_v3iPaNYDkhBw+fkSRriG0-w1R5vXRCugZPW6Vg@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAD=FV=WFdtx_v3iPaNYDkhBw+fkSRriG0-w1R5vXRCugZPW6Vg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/07/2022 16:31, Doug Anderson wrote:
> Hi,
> 
> On Thu, Jul 7, 2022 at 1:04 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> The entries in arrays must have fixed order, so the bindings and Linux
>> driver expecting various combinations of 'reg' addresses was never
>> actually conforming to guidelines.
>>
>> Specifically Linux driver always expects 'core' reg entry as second
>> item, but some DTSes are having there 'cqhci'.
> 
> This is a bit misleading and makes it sound like we've got a bug. In
> truth the Linux driver looks at the compatible string. If it sees any
> compatible listed as "v5" (or a slight variant of v5 to handle a
> workaround for sc7180 / sdm845) then it _doesn't_ expect 'core' reg as
> the second entry. See the variable `mci_removed`. The old bindings
> ".txt" file also had this to say:
> 
>                 For SDCC version 5.0.0, MCI registers are removed from SDCC
>                 interface and some registers are moved to HC. New compatible
>                 string is added to support this change - "qcom,sdhci-msm-v5".

You're right, thanks, I missed that part.

> 
> So I guess that means this is the documentation for all of the
> combinations you have listed:
> 
> * hc only - v5 controller w/out CQE / ICE
> 
> * hc + core - v4 controller w/out CQE / ICE
> 
> * hc + cqhci - v5 controller w/ CQE and w/out ICE
> 
> * hc + cqhci + ice - v5 controller w/ CQE / ICE
> 
> * hc + core + cqhci + ice - v4 controller w/ CQE / ICE
> 
> Said another way, before v5 the "core" range existed. After v5 it
> apparently doesn't so there's no way we could have specified it.
> 
> You'll notice that one of the options above implies that a v4
> controller (with "core" specified) can have CQE and ICE. Is this
> actually true, or was it a misunderstanding in the .txt to .yaml
> conversion?
> 
> If it's true that a v4 controller can have CQE and ICE then your patch
> is wrong in asserting that v4 controllers have only "hc" and "core".
> 
> If a v4 controller _can't_ have CQE and ICE then your patch is right
> but incomplete. It should also be removing the option:
>           - const: hc
>           - const: core
>           - const: cqhci
>           - const: ice
> 
> I am not intimately familiar with Qualcomm MMC controller history.
> That being said, the old .txt file said:
> 
>         - CQE register map (Optional, CQE support is present on SDHC
> instance meant
>                             for eMMC and version v4.2 and above)
> 
> To me this implies that a v4 controller could _at least_ have "cqhci".
> I dunno about "ice". I seem to recall that this was the argument for
> why the driver had to use reg-names to begin with and why the driver
> looks for "cqhci" by name.


I checked manual and SDCC v4 already supports CQE. ICE appears at v4.1
(MSM8996, MSM8953 and some more which do not have dedicated
compatibles), so the compatibles seems inaccurate. ICE capability can be
runtime detected, but we still need to provide ICE address space. Anyway
I don't want to dig too much into SDCC versions, so I'll allow
hc+core+cqhci+ice.

Thanks for the feedback, much appreciated!


Best regards,
Krzysztof
