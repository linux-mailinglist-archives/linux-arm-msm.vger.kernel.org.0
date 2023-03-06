Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 224B06ACAD6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Mar 2023 18:41:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229622AbjCFRlL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Mar 2023 12:41:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230219AbjCFRlJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Mar 2023 12:41:09 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90C036904C
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Mar 2023 09:40:35 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id y14so10528441ljq.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Mar 2023 09:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678124374;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3dNLEbPyZo5mN1gg42zhR9cuXAgSgz1Oq+jU60e1oA0=;
        b=Fy0lNtWgUMgt8lt4SmweElbQvFeLGOS4czDs8XyS36CrM9vlp9PIDjiSQ2Pgdpo+CR
         SLpWl/0/fMlI4bGUMafK239tzb1MQhX3T2ibapa4p4rpBMPw0TX1fBoG5sSLeukBMDzf
         eDOdMtGXXbBqpH08uWuFNA8r/BjeFY5dTINEUdrUE0+4pD0fd07uxtjpNmbYuHoL+TNY
         izQXxS3HU8MpFS2lFMeHdaqUv18OQ/rFEBwAHqwQNdrJrhaEygCSH+l4lehpPaGTtXr1
         aPjQkUXqZPIP+qkwTlapk4ouzAB6qmLaCDDngVq3MrJvJHq2dCpbJ21bu+CQUi5DwRCL
         5q6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678124374;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3dNLEbPyZo5mN1gg42zhR9cuXAgSgz1Oq+jU60e1oA0=;
        b=OUWvcrRhHgJGh/gbi5YLQPlu3I0F1wsK8jApfTrN6KhsK+Ob79X1immg9Ndnfb/Gvs
         BykkiBjvWGEbUU8f60F4eJAhSZ+dVHnnXtudvYkfngCtTchgj7UVYneG9kAMQciJaZYk
         vl/RQL9O6/yFpnibSxPVIRBVTpvozBk/BibTl5eEDyD1fSZU92wL4cIo3OUAL1sYhuLO
         4GqEL5XxNIP0vixeI7asd/q7nUUSsydFkQxB+c+83NSyMug4c8JlcnxTkTDqOZ035ZrR
         Xc/F7t0ylx53HI/f+cI51YR6a3LA/gSfTPmEv9HZIorE1DqD4RxXNnRqODNmumECTgnp
         4B5w==
X-Gm-Message-State: AO0yUKVi1rDLpcTPgRKVQSDSxRKIGQwkj7v430XcCi6DzFUgaMM/0gUp
        uBRp7eqlDcdDVPqLP7wcK8VOEA==
X-Google-Smtp-Source: AK7set8jr5M2hYW8dExveToOBhF762Ro7Yzp0Oj85PUMt5p3BJtjOVQOq8VK3ogaYMCqfXWcYexUTg==
X-Received: by 2002:a2e:b0d4:0:b0:28d:47b0:e97d with SMTP id g20-20020a2eb0d4000000b0028d47b0e97dmr2997641ljl.27.1678124374038;
        Mon, 06 Mar 2023 09:39:34 -0800 (PST)
Received: from [192.168.1.101] (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
        by smtp.gmail.com with ESMTPSA id a3-20020a056512390300b00498f77cfa63sm1700215lfu.280.2023.03.06.09.39.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Mar 2023 09:39:33 -0800 (PST)
Message-ID: <339a7421-8ad6-48bc-3fb3-db55e94cc05b@linaro.org>
Date:   Mon, 6 Mar 2023 18:39:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] arm64: dts: qcom: msm8996: Add missing property for
 OnePlus 3T
Content-Language: en-US
To:     "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        Harry Austen <hpausten@protonmail.com>
Cc:     devicetree@vger.kernel.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, kernel-dev@igalia.com,
        kernel@gpiccoli.net, Yassine Oudjana <y.oudjana@protonmail.com>
References: <20230213201651.1902323-1-gpiccoli@igalia.com>
 <d34d8851-fd73-9b87-9340-df25b64e96bb@linaro.org>
 <09879b66-4f72-a205-3e2d-cd8d8113625c@igalia.com>
 <97676add-de6b-4057-a5ef-dab313cf7050@linaro.org>
 <7c25f97f-c4bf-0e99-c60f-a9026ca42965@igalia.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <7c25f97f-c4bf-0e99-c60f-a9026ca42965@igalia.com>
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



On 6.03.2023 15:52, Guilherme G. Piccoli wrote:
> On 06/03/2023 07:14, Konrad Dybcio wrote:
>> [...] 
>>> Curiosity questions, since I'm far from expert in the device-tree world:
>>> what happens in case the device-tree doesn't export/contain this
>>> property (exactly the case we have right now)? Does the device work
>>> fine? Also, having it "wrong" (based on the other OnePlus 3) is worse
>>> than not having it? In other words, what's the default value picked if
>>> none is provided in the DT?
>> Basically:
>>
>> if (msm_id) {
>>     if is_close_enough(msm_id, internal_msm_id)
>>         boot()
>>     else
>>         die()
>> } else
>>     die()
>>
>> Konrad
>>>
> 
> Thanks, interesting...
> 
> So, if I understand correctly, currently we end-up in the 2nd else
> block, and we straight die(), right?
> 
> With this patch, we have some chance to boot, by falling in the if()
> block or...if we're not lucky, we also die() heh
> 
> With that said, any con in accepting this as-is if we don't find anybody
> to test? Notice it at least has the advantage of fixing the device-tree
> blob creation...
You're using some magic tools that shouldn't be necessary.. Some device
owner should try booting with simply appending the device tree to the
compressed kernel image.

Konrad
> 
> Ah, of course by "as-is" I mean I'd send a V2 fixing what you mentioned
> before ("...use the preprocessor constant...etc").
> Thanks,
> 
> 
> Guilherme
