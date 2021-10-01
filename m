Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA16541EB53
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Oct 2021 13:04:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353356AbhJALGD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Oct 2021 07:06:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353426AbhJALGC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Oct 2021 07:06:02 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 654A8C06177C
        for <linux-arm-msm@vger.kernel.org>; Fri,  1 Oct 2021 04:04:09 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id g41so37022867lfv.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Oct 2021 04:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=dPJtdysPWf1IdoKqG5RU/ZfE0J2ZqTcs63K1XSCRLhI=;
        b=Z8Dcicr8SuR8iEwZihZObGh7X7IMte0cGaRWNsYFb8J9KDO2plqzItHeITTpDOD58i
         HAzR1dQODvN7KmD3rkIQAb+I9ZsuY5SnrldkKP7Etj8imRgAAu+mMd5c46DCPC2MNW7b
         qxA+dsm4vnV5va55SCFFf/n1iNtl79ahjkoGhMtYllxJsDq5cngfCPjmcnHufXUrr5Hu
         J+CtgZ6h1jKGWW6C4ep3NJyrgevRn2ah37FhZWXjCCuASR/h1bPR3VNC9Iee+rg82w+F
         iZVfQ2+hxbFZWpX3NqPaZPQf2+/VJkduc4nl6K6SmwQya0vu4tEElinvrjODf9WV+kUX
         ra+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dPJtdysPWf1IdoKqG5RU/ZfE0J2ZqTcs63K1XSCRLhI=;
        b=vklW+UexL6XoLdbn2dovPmEoZU0si3MOkcwZYyHTaCJm3p/zBfOYvgDe25oDrpjazR
         CYgT0vebRmLbQOWEqmpeGUIi9axtaEdbSySFa/eZv1a+C9dLI0Xa5ieBZP3tg4rgs6r/
         8iKVN1IOsIXjvON7HyyBVBmRusLeawCUnaFFr82PqOEzRjsnXf4RbwORZWTbDnqu5jRC
         c9cgRZOnt3+6PXs5nBrb+AaUh/nSoRyGx5dxHBrFUX+SH7HlkaH0M6ieVZLwIG5CkX0R
         F015HwOIFD6/rqlzujXaLIQ95wL8rIGWySROYnN3K4+GYe/KUMvIoCBugWkN098yzdXp
         cl/w==
X-Gm-Message-State: AOAM531JtBrbVyAVnxohAHPXBZbtgHQ/7gao8n9a8cuPU+9IUfgF/Cmv
        ogVuc+7rPP9LCBF8u+XYs65l9A==
X-Google-Smtp-Source: ABdhPJwYZGoJ6x2U6uiuPbssFgY+I8OjSFkrgQcSyribxdfOe6KSW/59y1iM0ZFgNad4cSfYIJuuoQ==
X-Received: by 2002:a05:651c:a06:: with SMTP id k6mr6502787ljq.349.1633086247635;
        Fri, 01 Oct 2021 04:04:07 -0700 (PDT)
Received: from [192.168.10.17] (88-112-130-172.elisa-laajakaista.fi. [88.112.130.172])
        by smtp.gmail.com with ESMTPSA id g7sm703408lfr.113.2021.10.01.04.04.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Oct 2021 04:04:07 -0700 (PDT)
Subject: Re: [PATCH v2] phy: qcom-qusb2: Fix a memory leak on probe
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
References: <20210922233548.2150244-1-vladimir.zapolskiy@linaro.org>
 <YVbYDIUdyTQD6gXq@matsya>
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Message-ID: <56c4530b-2f66-f325-b703-e58e90c3c66a@linaro.org>
Date:   Fri, 1 Oct 2021 14:04:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <YVbYDIUdyTQD6gXq@matsya>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/1/21 12:42 PM, Vinod Koul wrote:
> On 23-09-21, 02:35, Vladimir Zapolskiy wrote:
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
>> Fixes: ca04d9d3e1b1 ("phy: qcom-qusb2: New driver for QUSB2 PHY on Qcom chips")
>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> ---
>> Changes from v1 to v2:
>> * fixed a memory leak in case of reading a zero value and return,
>> * corrected the fixed commit, the memory leak is present before a rename.
>>
>>   drivers/phy/qualcomm/phy-qcom-qusb2.c | 16 ++++++++++------
>>   1 file changed, 10 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
>> index 3c1d3b71c825..f1d97fbd1331 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
>> @@ -561,7 +561,7 @@ static void qusb2_phy_set_tune2_param(struct qusb2_phy *qphy)
>>   {
>>   	struct device *dev = &qphy->phy->dev;
>>   	const struct qusb2_phy_cfg *cfg = qphy->cfg;
>> -	u8 *val;
>> +	u8 *val, hstx_trim;
>>   
>>   	/* efuse register is optional */
>>   	if (!qphy->cell)
>> @@ -575,7 +575,13 @@ static void qusb2_phy_set_tune2_param(struct qusb2_phy *qphy)
>>   	 * set while configuring the phy.
>>   	 */
>>   	val = nvmem_cell_read(qphy->cell, NULL);
>> -	if (IS_ERR(val) || !val[0]) {
>> +	if (IS_ERR(val)) {
>> +		dev_dbg(dev, "failed to read a valid hs-tx trim value\n");
> 
> not an error log..?
> 

It's a copy from the existing code, no changes on error but the memory leak fix.

If CONFIG_NVMEM is not set, then nvmem_cell_read() returns ERR_PTR(-EOPNOTSUPP),
still it allows to build/run the phy driver, so it seems to be a valid option,
please correct me.

--
Best wishes,
Vladimir
