Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73C35415419
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Sep 2021 01:47:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230412AbhIVXsi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Sep 2021 19:48:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238556AbhIVXsg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Sep 2021 19:48:36 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26247C061767
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Sep 2021 16:46:57 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id e15so18748332lfr.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Sep 2021 16:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=aAGBCjkspExmpXroz1trymUPrSbhC0Yih1wDe+h05ag=;
        b=JmattVShzBibso7FtXu3lo0vHfWEPqJcwLpy2lhH84uohEya5HfNHKn4Es7MVeta6B
         yB/xUfGizyXhuQxTROHTVqNipO+5vaRcy63QBvaFrwWnJK1dQpWJXh4W5sj81DqfnECt
         NOpxi9BDlTVN3zRpGTWm1qwhaHPfpbZvYVRT0xIDDbjqKpajs1fBfy829cAgq3ahL/FM
         kuyfDz0X/bRePpt9KOg3LRn1Db0sSyd0NjHK24hr7maUu9AgYnUJxT4xn5VwCiMQM87v
         5kvKLCOjQtkcgs4MYyq0XL0aTKUKBrthPk+DiDyZMHQG5fFBSnUo9Dbdevig9dG1AGNt
         jvTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=aAGBCjkspExmpXroz1trymUPrSbhC0Yih1wDe+h05ag=;
        b=ZYzmULj/hoGC434sq+9eYknRyHRSTiuLNGW5Fpqgm8FwDcpfHccfOfyfU88X4mmaBB
         Sv3dQWmi2zvOR6cTf1z+IJEMD8k6Pvooh7h91Azvam5THueD76uaQ0LIVIUj+lGFv7de
         EBAmkhAHVRT4bMy6XRfhXD5rLDw/r+MeWbDT73PsxIOutPaykqHNMS4oHCn9VVsL6g/J
         Zs5Ac6xld2r75LM77dISunKpt1SkVHBkx2Xlkpu7ljzO6O6qXy0FYs9hJHtYuve3kirg
         H9JatNaUBhar/t3vCAYh2PWpbkjFNyIiiYqfhRNmT3yXMfWi33GB+RYNrjpu8c8C1V1c
         qyqA==
X-Gm-Message-State: AOAM5319fNDxe8gsj50FB3Lr72iR6inQP8JYHMORyq5PtJ41KygIUUKa
        oSQog/Wdm6lzJ47JpDMTtxlifA==
X-Google-Smtp-Source: ABdhPJwZI5sE/S305lCmHN3qymUOeIcki+pNf7yR75LekUX3JQBM2TUjiyH+C3cXPCivKZxmqxZMoQ==
X-Received: by 2002:a05:651c:b12:: with SMTP id b18mr2036215ljr.512.1632354416017;
        Wed, 22 Sep 2021 16:46:56 -0700 (PDT)
Received: from [192.168.10.17] (88-112-130-172.elisa-laajakaista.fi. [88.112.130.172])
        by smtp.gmail.com with ESMTPSA id b28sm389970ljf.101.2021.09.22.16.46.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Sep 2021 16:46:55 -0700 (PDT)
Subject: Re: [PATCH] phy: qcom-qusb2: Fix a memory leak on probe
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
References: <20210922221613.2115038-1-vladimir.zapolskiy@linaro.org>
 <YUu0txXFw2fL3Fgq@ripper>
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Message-ID: <f4bd4988-543b-ee3f-a37b-1d0185760ea1@linaro.org>
Date:   Thu, 23 Sep 2021 02:46:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <YUu0txXFw2fL3Fgq@ripper>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

On 9/23/21 1:56 AM, Bjorn Andersson wrote:
> On Wed 22 Sep 15:16 PDT 2021, Vladimir Zapolskiy wrote:
> 
>> On success nvmem_cell_read() returns a pointer to a dynamically allocated
>> buffer, and therefore it shall be freed after usage.
>>
>> The issue is reported by kmemleak:
>>
>>    # cat /sys/kernel/debug/kmemleak
>>    unreferenced object 0xffff3b3803e4b280 (size 128):
>>      comm "kworker/u16:1", pid 107, jiffies 4294892861 (age 94.120s)
>>      hex dump (first 32 bytes):
>>        00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>>        00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>>      backtrace:
>>        [<000000007739afdc>] __kmalloc+0x27c/0x41c
>>        [<0000000071c0fbf8>] nvmem_cell_read+0x40/0xe0
>>        [<00000000e803ef1f>] qusb2_phy_init+0x258/0x5bc
>>        [<00000000fc81fcfa>] phy_init+0x70/0x110
>>        [<00000000e3d48a57>] dwc3_core_soft_reset+0x4c/0x234
>>        [<0000000027d1dbd4>] dwc3_core_init+0x68/0x990
>>        [<000000001965faf9>] dwc3_probe+0x4f4/0x730
>>        [<000000002f7617ca>] platform_probe+0x74/0xf0
>>        [<00000000a2576cac>] really_probe+0xc4/0x470
>>        [<00000000bc77f2c5>] __driver_probe_device+0x11c/0x190
>>        [<00000000130db71f>] driver_probe_device+0x48/0x110
>>        [<0000000019f36c2b>] __device_attach_driver+0xa4/0x140
>>        [<00000000e5812ff7>]  bus_for_each_drv+0x84/0xe0
>>        [<00000000f4bac574>] __device_attach+0xe4/0x1c0
>>        [<00000000d3beb631>] device_initial_probe+0x20/0x30
>>        [<000000008019b9db>] bus_probe_device+0xa4/0xb0
>>
>> Fixes: 0b56e9a7e835 ("phy: Group vendor specific phy drivers")
>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> ---
>>   drivers/phy/qualcomm/phy-qcom-qusb2.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
>> index 3c1d3b71c825..061665ba8ef7 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
>> @@ -589,6 +589,8 @@ static void qusb2_phy_set_tune2_param(struct qusb2_phy *qphy)
>>   		qusb2_write_mask(qphy->base, cfg->regs[QUSB2PHY_PORT_TUNE2],
>>   				 val[0] << HSTX_TRIM_SHIFT,
>>   				 HSTX_TRIM_MASK);
>> +
>> +	kfree(val);
> 
> Nice catch, here's my:
> 
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Thank you for the review, however I have just found a still unresolved
memleak when zeroes are returned, so there is v2.

> 
> That said, do you think we could replace the nvmem_cell_read() with a
> call to nvmem_cell_read_u8() to avoid the need to clean it up instead?

It might be a good idea to do it in a separate change, nvmem_cell_read_u8()
is found in v5.9 and later versions, so its usage prevents a probable
backport to stable branches, because the original problem comes in v4.12.

FWIW the sent fix should be clearly applicable to v4.20 and later versions
only, if it's needed, separate changes are required to cover v4.12-v4.20
range.

--
Best wishes,
Vladimir
