Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 122F96F91D9
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 May 2023 14:08:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231956AbjEFMH7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 6 May 2023 08:07:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232283AbjEFMH6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 6 May 2023 08:07:58 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3F6911DAC
        for <linux-arm-msm@vger.kernel.org>; Sat,  6 May 2023 05:07:55 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2ac826a1572so26823091fa.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 May 2023 05:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683374874; x=1685966874;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L/TpUzO72+WIvipcd8cPDbYSBA+KOD5yk/0d/3CF8oQ=;
        b=qSMgO0vZGSCVlieTaZrJAgL0zToTLMMYHQjX2sg/0SkCb1MynfXXBsSQLkMHyOG+/H
         IepFNQa5LB3KqSkIBxevE81XttzIdDN13FvtaHqjVPxMzi8bcSw19buJua++5u5UvbR5
         9hSFAoRanygYB0zltlQEhwSBemHd/KVzW0g4XgJ+eoK3a/3uwwYPUlJYEiKyhKw5bLWp
         J/0D/IoezVKGgDl8CBw6oZCe3+YktC+kkuIdawERWL3uJCboiFJNmFzNGJu0vC89M7nw
         aFhi0ABRSF6TwALfRfBBEHCOHX77w5TsEUpfLYwSzqbXp4JH7wLnnUFRWGKvAESi+P3d
         SOKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683374874; x=1685966874;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L/TpUzO72+WIvipcd8cPDbYSBA+KOD5yk/0d/3CF8oQ=;
        b=W23LsXsNvVDkxzdh9kzVfd/28f3qGgmuJpZG2/4dJgXE84XdJcd2KQM8icM9aNl2WB
         sI2DJ4A86rQ3RiInNTq33pwWXPM2TjBqo+39idYkQqjIyAVVaEs63Lcld/W5l/SuDZYJ
         0LbKKn8x7U5eWgSg4MzrPA9+tKOhISueCAKZHwzOddP9gtRbyJv8TDOsfDtQS4X7JjMe
         tU5XtRFoGSHzjBqd2zoYwKLlI4HWOU984CwAgYbiTtY1dv1irDqAb3U64LrdeDmY7QrI
         hzhmLAYOLBhG38ddoc6ZqMKCCDbY5mHzE98zZgkcfapPcXAL+mK8WPGoFkHH3dnynTpy
         c1cQ==
X-Gm-Message-State: AC+VfDw9IguKNHzOf8iucnl7FEAJIjh06oQyljgmJxuBKyoE6ha0aPyW
        uuvmnjIky27k2kuk+ffXzUdWTQ==
X-Google-Smtp-Source: ACHHUZ5MY2Mwj8kRLHyQvwUgkhZ9Hodsvj4MYti05UzFQN7nzqXPUJdbv2Jt3NRgMvWQ0DI0Nj461g==
X-Received: by 2002:a2e:b0c2:0:b0:2a9:f8fd:49ff with SMTP id g2-20020a2eb0c2000000b002a9f8fd49ffmr1248426ljl.17.1683374874215;
        Sat, 06 May 2023 05:07:54 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id k16-20020a2e2410000000b002ac6b18999asm368566ljk.4.2023.05.06.05.07.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 May 2023 05:07:53 -0700 (PDT)
Message-ID: <9a493ef9-c869-6671-38c0-d295ae8ebd63@linaro.org>
Date:   Sat, 6 May 2023 15:07:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 4/8] PCI: qcom: Do not advertise hotplug capability for
 IPs v2.3.3 and v2.9.0
Content-Language: en-GB
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        lpieralisi@kernel.org, kw@linux.com, bhelgaas@google.com
Cc:     robh@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, steev@kali.org,
        quic_srichara@quicinc.com
References: <20230506073139.8789-1-manivannan.sadhasivam@linaro.org>
 <20230506073139.8789-5-manivannan.sadhasivam@linaro.org>
 <ad5f9403-7131-7a0e-4fc6-5fdb3454f9a9@linaro.org>
In-Reply-To: <ad5f9403-7131-7a0e-4fc6-5fdb3454f9a9@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/05/2023 15:01, Dmitry Baryshkov wrote:
> On 06/05/2023 10:31, Manivannan Sadhasivam wrote:
>> SoCs making use of Qcom PCIe controller IPs v2.3.3 and v2.9.0 do not
>> support hotplug functionality. But the hotplug capability bit is set by
>> default in the hardware. This causes the kernel PCI core to register
>> hotplug service for the controller and send hotplug commands to it. But
>> those commands will timeout generating messages as below during boot
>> and suspend/resume.
>>
>> [    5.782159] pcieport 0001:00:00.0: pciehp: Timeout on hotplug 
>> command 0x03c0 (issued 2020 msec ago)
>> [    5.810161] pcieport 0001:00:00.0: pciehp: Timeout on hotplug 
>> command 0x03c0 (issued 2048 msec ago)
>> [    7.838162] pcieport 0001:00:00.0: pciehp: Timeout on hotplug 
>> command 0x07c0 (issued 2020 msec ago)
>> [    7.870159] pcieport 0001:00:00.0: pciehp: Timeout on hotplug 
>> command 0x07c0 (issued 2052 msec ago)
>>
>> This not only spams the console output but also induces a delay of a
>> couple of seconds. To fix this issue, let's not set the HPC bit in
>> PCI_EXP_SLTCAP register as a part of the post init sequence to not
>> advertise the hotplug capability for the controller.
>>
>> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>> ---
>>   drivers/pci/controller/dwc/pcie-qcom.c | 1 -
>>   1 file changed, 1 deletion(-)
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@gmail.com>
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

