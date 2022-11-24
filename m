Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF403636F02
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Nov 2022 01:38:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229436AbiKXAi4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Nov 2022 19:38:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbiKXAiz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Nov 2022 19:38:55 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE3ECA6A29
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 16:38:54 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id v124-20020a1cac82000000b003cf7a4ea2caso2787220wme.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 16:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lPTfcNz50U0M/vb7uLpzXgDuOUjk5sVnb+89CU2LNRo=;
        b=TZTWgu1iHodWke7h0MVv8cEmWJPmV8i22pVhkI4SdIr+RmIxxlk35hH65045UbIIz2
         A/mFS6WUjmWwn9opUX3RKiUb/UxlfMRdTjniGVd15Z/YcF1EV8H6rT1ZBRH61gadgCZv
         LSG+0xWlZzSvnRyfhaGRkRx1FribW3ZpHlNoDbcXmknNL7Kae6/gJwJoRaKcwgARwTVf
         Cbn/uP5nH799fRKuAYVWfOPeMYkDu+pPoSum+ERkqSIbuZfW5K3RLzYgpZRm66lNHvUm
         G8Q9aWeacpGyeNJ4IXYgmQU3j4LpcO9hhWSM8w4EzHe/ISmt4Id4Imc0a6Gya6vUe0UW
         59cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lPTfcNz50U0M/vb7uLpzXgDuOUjk5sVnb+89CU2LNRo=;
        b=SX2oFllV903A0QSLdB47M4v0P+sLgbeHML7g5XfLEj1zvhz1HBKVj3/lB+j01QvAU0
         XnhnegUJL14sGkh5PTbkdygBk1R0/y6PLusJAcbzxVMxxwxuXuxe3cUfSN5OFE5NtCLI
         Sm8z80IlWBJ/egemCtLEEahfgyFgo+pOzKtAPjYiLvfDjc/WW8oOoQ66Lw2JCECk/9hy
         +leseveKHV/WAaCQ5T5Q66lE7/zjuvFEp1JF2JNPK47IC6eWUs/RAhNLLKRdREZumH5a
         P+d/D7DRLOImlTinhBHUBw/79nVTMtQ/zk0ZajgzYaN9hWBz1ou2O1Agjfi/ZxqCBInI
         g9Ww==
X-Gm-Message-State: ANoB5pmuK685edXEjCZAKql2UABppVFhxVmCqYZlD3W4DRnWxFXVsNAJ
        N9pXhNWfK8bdZt4wAhJNh2RHLw==
X-Google-Smtp-Source: AA0mqf42ken2tXf8L0MpLq2zbTztCEpOexhGVLp65RyA6jB5n2JGYWKWMhWsCFWDn2zJbvdLLQexTA==
X-Received: by 2002:a05:600c:4d84:b0:3cf:9881:e9d0 with SMTP id v4-20020a05600c4d8400b003cf9881e9d0mr13454327wmp.171.1669250283257;
        Wed, 23 Nov 2022 16:38:03 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id n6-20020a1ca406000000b003d005aab31asm3698387wme.40.2022.11.23.16.38.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 16:38:02 -0800 (PST)
Message-ID: <df730c94-91c2-4f8d-2712-203163d1d9b0@linaro.org>
Date:   Thu, 24 Nov 2022 00:38:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 0/2 RESEND] Fix pm8941-misc extcon interrupt dependency
 assumptions
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, myungjoo.ham@samsung.com,
        cw00.choi@samsung.com
Cc:     agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, gurus@codeaurora.org,
        aghayal@codeaurora.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20220926113143.40768-1-bryan.odonoghue@linaro.org>
 <2260542.ElGaqSPkdT@g550jk>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <2260542.ElGaqSPkdT@g550jk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22/11/2022 20:15, Luca Weiss wrote:
> On Montag, 26. September 2022 13:31:41 CET Bryan O'Donoghue wrote:
>> RESEND:
>> - I thought I resent these at the start of this month, can't find them
>>    in linux-msm I think I just sent them to myself.
>>
>>    No change since July 17th
>>
>> V4:
>> - Added suggested extra log text from Marjin to extcon patch
>>
>> V3:
>> - Adds a cover-letter since we are now doing two patches a dt-bindings fix
>> and platform_get_irq_byname_optional fix.
>> - Add Review-by -> Rob Herring, Marijn Suijten
>> - Add additional patch to negate warning when one of usb_id or usb_vbus
>>    is not declared in the platform DTS.
>>
>> Bryan O'Donoghue (2):
>>    dt-bindings: pm8941-misc: Fix usb_id and usb_vbus definitions
>>    extcon: qcom-spmi: Switch to platform_get_irq_byname_optional
>>
>>   .../devicetree/bindings/extcon/qcom,pm8941-misc.yaml | 12 ++++++++----
>>   drivers/extcon/extcon-qcom-spmi-misc.c               |  4 ++--
>>   2 files changed, 10 insertions(+), 6 deletions(-)
> 
> Hi Chanwoo Cho  and MyungJoo Ham,
> 
> could you please pick up these patches?
> 
> Regards
> Luca
> 
> 
Thanks for bumping this Luca.

I was about to do just that.

Chanwoo - would appreciate merging this, its an annoying and very old 
dts splat for us.

---
bod
