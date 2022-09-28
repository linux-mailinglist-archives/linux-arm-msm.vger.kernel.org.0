Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF6C35ED60E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Sep 2022 09:28:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231143AbiI1H2v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 03:28:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233616AbiI1H2A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 03:28:00 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F816B284F
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 00:25:04 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id z4so1244141lft.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 00:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=1Fcjg+cr/kivPTm/GJb7y8jmzhRLvf3S0ZdXAVdnOJ4=;
        b=pIEAF7CmpeuNeerOjifq8bpwxJUxDu0IhdixG7O6Bzt6ga6FDxRzK3xVNbtzdFk8aJ
         qO8xeH0alV1B3+7fjnQQoIP8pUUTg2xON02V1lW+2DLgMYtwxnjqbpLKkRd6ia54NygP
         gQPPmzMxhwfFz6CTG8z+0T7wPnGAC5HGlZ4pKwMjk0OIDDAqgU3gy4b6+iFcxOBq+Ix5
         vfLMwYsHxSHmQh2YBNKXjAfVQwmmwbj0TSuTezApYhPO0DTMPREMpRUG+rBLal0Qyudh
         5I0Fx9H/4zUjLCX1v69tmiU4UK5+gDf44feD4RL75X3052nPOxWT8+tulsy45arbovLF
         kHww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=1Fcjg+cr/kivPTm/GJb7y8jmzhRLvf3S0ZdXAVdnOJ4=;
        b=urTqODVxivB/5FrlTZ7rQpAf685tNJwrkLZa/812OVdPcRwmFVKLGnQQRNHkx7JUdb
         +P6r065hEm1swT06nnMHdF/cJsRtiPeiOudbTGeMNm6ENl4a224NfN6KObO1zNfxEkOH
         0EADwZj/+LHfsaLV+LioueuqYdtWKKSkRd/3KChZyPgJD8Jz47yqZzpnbCHkas8NIHC9
         0RiDIgK33Jog0R9lwyC7Gxlg5eKIjQFR4c7XIlI38ulal17dKofqLjki/1xzeziWPDHJ
         a0upxOJUvQ4uZqGsZnsFwSsQLht56In8yhCP4GaP2csfsFHfs21VS1HClX4kOZ2RrYfS
         kOvA==
X-Gm-Message-State: ACrzQf2PM1MR943+FMWs5uw5LZfRxw0iaVotUx8Q5qY7Zdzr4x10FupB
        moQ9Z4sUfny+YZLdKyvKu0mJnw==
X-Google-Smtp-Source: AMsMyM6kIwuBG/XkP+Hl8WnArBsRLdJDRAI28PZIjVFq8EEHgxYrmDVoYYp+8AujJn5Gftc+Hy7wFg==
X-Received: by 2002:a19:490b:0:b0:49f:52cf:aeaf with SMTP id w11-20020a19490b000000b0049f52cfaeafmr12249740lfa.46.1664349863733;
        Wed, 28 Sep 2022 00:24:23 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id s12-20020a05651c048c00b0026da7734d7bsm357017ljc.112.2022.09.28.00.24.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 00:24:22 -0700 (PDT)
Message-ID: <a3d2d7db-e27b-3d6b-2bbf-9f8b258a23b4@linaro.org>
Date:   Wed, 28 Sep 2022 09:24:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 2/3] ARM: dts: qcom: pm8941: adjust node names to bindings
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, neil.armstrong@linaro.org,
        linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220925210229.128462-1-luca@z3ntu.xyz>
 <3070538e-fa8d-4506-bbf8-c2770d092eb5@linaro.org>
 <3dda8e86-b92b-488a-5afb-0cb49e7e52ae@linaro.org>
 <13105309.uLZWGnKmhe@g550jk>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <13105309.uLZWGnKmhe@g550jk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 26/09/2022 17:07, Luca Weiss wrote:
> Hi Krzysztof,
> 
> On Montag, 26. September 2022 12:29:11 CEST Krzysztof Kozlowski wrote:
>> On 26/09/2022 12:04, Neil Armstrong wrote:
>>> On 26/09/2022 11:22, Krzysztof Kozlowski wrote:
>>>>>   		};
>>>>>
>>>>> -		usb_id: misc@900 {
>>>>> +		usb_id: extcon@900 {
>>>>
>>>> Why? extcon is Linux specific name and should not be added to DTS.
>>>> Anything requires it?
>>>
>>> It matches the current dt bindings:
>> Then instead maybe let's fix it in the bindings and DTS?
> 
> What node name do you propose? I doubt "misc" is a better name as it really 
> doesn't describe anything so I don't really have a suggestion here..
> 

Some manufacturers call it a muic (Micro-USB IC), but maybe just
usb-detect? The role of this device is accessory and cable detection.

Best regards,
Krzysztof

