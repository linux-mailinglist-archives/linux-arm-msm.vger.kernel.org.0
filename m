Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E0D622E9E6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jul 2020 12:22:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726139AbgG0KVy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jul 2020 06:21:54 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:24128 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727813AbgG0KVx (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jul 2020 06:21:53 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1595845311; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=3ICFc++bUE871suhrVMhUt05tELazLFLFEnQc5uUq3s=; b=EJrwR52xgk2yuevKOTSQJ0L6iiRhRsQky89tZM4bg177/uQZdekH0UuTbc8vff/iMGdUaQn4
 w5QrGDnRUs1muOT4nisu5mVXsBjIblySua3mfK2qI3GmgNXw9LRXCwMKHdLKWw0Zc9+6sw6d
 gZjKnr3mQPkCNXbKN9r5ngHINIo=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-west-2.postgun.com with SMTP id
 5f1eaab1aa44a6db05abd0a8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 27 Jul 2020 10:21:37
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E45C1C43395; Mon, 27 Jul 2020 10:21:36 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.103] (unknown [49.205.245.25])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vbadigan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id AB14EC433C9;
        Mon, 27 Jul 2020 10:21:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org AB14EC433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=vbadigan@codeaurora.org
Subject: Re: [PATCH V1] mmc: sdhci-msm: Set IO pins in low power state during
 suspend
To:     Ulf Hansson <ulf.hansson@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>
References: <1594213888-2780-1-git-send-email-vbadigan@codeaurora.org>
 <1594213888-2780-2-git-send-email-vbadigan@codeaurora.org>
 <20200710005233.GN3191083@google.com>
 <63323fe2-e3a3-030f-5275-01fa6b04e23b@codeaurora.org>
 <20200711001948.GO3191083@google.com>
 <2c322fe1-6a86-43c9-11f3-387b917836ed@codeaurora.org>
 <406769f7-2282-d658-5573-3a510d256eee@codeaurora.org>
 <CAPDyKFpLg0HnZ6p=x9Egv9w65hB5CtFw=gV1rpL8vbWcHYtCzg@mail.gmail.com>
From:   Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Message-ID: <5779057c-1639-6e86-a44e-5a3827a4fd75@codeaurora.org>
Date:   Mon, 27 Jul 2020 15:51:19 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAPDyKFpLg0HnZ6p=x9Egv9w65hB5CtFw=gV1rpL8vbWcHYtCzg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 7/24/2020 3:06 PM, Ulf Hansson wrote:
> On Tue, 14 Jul 2020 at 16:12, Veerabhadrarao Badiganti
> <vbadigan@codeaurora.org> wrote:
>>
>> On 7/13/2020 9:26 PM, Veerabhadrarao Badiganti wrote:
>>> On 7/11/2020 5:49 AM, Matthias Kaehlcke wrote:
>>>> Hi,
>>>>
>>>> On Fri, Jul 10, 2020 at 04:28:36PM +0530, Veerabhadrarao Badiganti
>>>> wrote:
>>>>> Hi Mathias,
>>>>>
>>>>> On 7/10/2020 6:22 AM, Matthias Kaehlcke wrote:
>>>>>> Hi,
>>>>>>
>>>>>> On Wed, Jul 08, 2020 at 06:41:20PM +0530, Veerabhadrarao Badiganti
>>>>>> wrote:
>>>>>>> Configure SDHC IO pins with low power configuration when the driver
>>>>>>> is in suspend state.
>>>>>>>
>>>>>>> Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
>>>>>>> ---
>>>>>>>     drivers/mmc/host/sdhci-msm.c | 17 +++++++++++++++++
>>>>>>>     1 file changed, 17 insertions(+)
>>>>>>>
>>>>>>> diff --git a/drivers/mmc/host/sdhci-msm.c
>>>>>>> b/drivers/mmc/host/sdhci-msm.c
>>>>>>> index 392d41d57a6e..efd2bae1430c 100644
>>>>>>> --- a/drivers/mmc/host/sdhci-msm.c
>>>>>>> +++ b/drivers/mmc/host/sdhci-msm.c
>>>>>>> @@ -15,6 +15,7 @@
>>>>>>>     #include <linux/iopoll.h>
>>>>>>>     #include <linux/regulator/consumer.h>
>>>>>>>     #include <linux/interconnect.h>
>>>>>>> +#include <linux/pinctrl/consumer.h>
>>>>>>>     #include "sdhci-pltfm.h"
>>>>>>>     #include "cqhci.h"
>>>>>>> @@ -1352,6 +1353,19 @@ static void
>>>>>>> sdhci_msm_set_uhs_signaling(struct sdhci_host *host,
>>>>>>>             sdhci_msm_hs400(host, &mmc->ios);
>>>>>>>     }
>>>>>>> +static int sdhci_msm_set_pincfg(struct sdhci_msm_host *msm_host,
>>>>>>> bool level)
>>>>>>> +{
>>>>>>> +    struct platform_device *pdev = msm_host->pdev;
>>>>>>> +    int ret;
>>>>>>> +
>>>>>>> +    if (level)
>>>>>>> +        ret = pinctrl_pm_select_default_state(&pdev->dev);
>>>>>>> +    else
>>>>>>> +        ret = pinctrl_pm_select_sleep_state(&pdev->dev);
>>>>>>> +
>>>>>>> +    return ret;
>>>>>>> +}
>>>>>>> +
>>>>>>>     static int sdhci_msm_set_vmmc(struct mmc_host *mmc)
>>>>>>>     {
>>>>>>>         if (IS_ERR(mmc->supply.vmmc))
>>>>>>> @@ -1596,6 +1610,9 @@ static void sdhci_msm_handle_pwr_irq(struct
>>>>>>> sdhci_host *host, int irq)
>>>>>>>                 ret = sdhci_msm_set_vqmmc(msm_host, mmc,
>>>>>>>                         pwr_state & REQ_BUS_ON);
>>>>>>>             if (!ret)
>>>>>>> +            ret = sdhci_msm_set_pincfg(msm_host,
>>>>>>> +                    pwr_state & REQ_BUS_ON);
>>>>>>> +        if (!ret)
>>>>>>>                 irq_ack |= CORE_PWRCTL_BUS_SUCCESS;
>>>>>>>             else
>>>>>>>                 irq_ack |= CORE_PWRCTL_BUS_FAIL;
>>>>>> I happened to have a debug patch in my tree which logs when regulators
>>>>>> are enabled/disabled, with this patch I see the SD card regulator
>>>>>> toggling constantly after returning from the first system suspend.
>>>>>>
>>>>>> I added more logs:
>>>>>>
>>>>>> [ 1156.085819] DBG: sdhci_msm_set_pincfg: level = 0 (ret: 0)
>>>>>> [ 1156.248936] DBG: sdhci_msm_set_pincfg: level = 1 (ret: 0)
>>>>>> [ 1156.301989] DBG: sdhci_msm_set_pincfg: level = 0 (ret: 0)
>>>>>> [ 1156.462383] DBG: sdhci_msm_set_pincfg: level = 1 (ret: 0)
>>>>>> [ 1156.525988] DBG: sdhci_msm_set_pincfg: level = 0 (ret: 0)
>>>>>> [ 1156.670372] DBG: sdhci_msm_set_pincfg: level = 1 (ret: 0)
>>>>>> [ 1156.717935] DBG: sdhci_msm_set_pincfg: level = 0 (ret: 0)
>>>>>> [ 1156.878122] DBG: sdhci_msm_set_pincfg: level = 1 (ret: 0)
>>>>>> [ 1156.928134] DBG: sdhci_msm_set_pincfg: level = 0 (ret: 0)
>>>>>>
>>>>>> This is on an SC7180 platform. It doesn't run an upstream kernel
>>>>>> though,
>>>>>> but v5.4 with plenty of upstream patches.
>>>>> I have verified this on couple of sc7180 targets (on Chrome platform
>>>>> with
>>>>> Chrome kernel).
>>>>> But didn't see any issue. Its working as expected.
>>>> Did you test system suspend too? At least in the Chrome OS kernel
>>>> tree system
>>>> suspend is not supported yet in the main branch, you'd need a pile of
>>>> 30+
>>>> extra patches to get it to work. This is expected to change soon
>>>> though :)
>>> Yes. I have verified with system  suspend-resume scenario.
>>> Sorry forgot to mention this point explicitly in last response.
>>>
>>> I believe all the needed patches were present on qcom internal tree.
>>> Suspend-resume is working fine on sc7180 qcom chrome tree.
>>>
>> Thanks Matthias. I cloud reproduce the issue on device without SDcard.
>>
>> Without SDcard inserted, cd-gpio (SD card detect GPIO) is getting read
>> as active HIGH
>> (as if card is inserted) during system-resume, resulting SDcard probe/scan.
>>
>> After that its triggering interrupt again when pinctrl config is applied
>> during SDcard
>> power-up sequence (as part of probe/scan) which is again triggering
>> sdcard scan.
>>
>> I will have to change SDcard cd-gpio sleep config to fix this issue like
>> below:
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> index e2230f47a17d..9266d514e163 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> @@ -2447,7 +2447,7 @@
>>
>>                                   pinconf-sd-cd {
>>                                           pins = "gpio69";
>> -                                       bias-disable;
>> +                                       bias-pull-up;
>>                                           drive-strength = <2>;
>>
>> I will check more on why its getting read as active HIGH during resume.
>>
>>
>>>>> Let me know if you are observing this issue constantly on multiple
>>>>> boards, I
>>>>> will share you
>>>>> a debug patch to check it further.
>>>> I currently have only one board with the SD card slot populated, I might
>>>> get another one next week.
>>>>
>>>> The toggling occurs only when no SD card is inserted.
>> Thanks
>>
>> Veera
>>
> Thanks for testing and for looking into this. Perhaps I should drop
> the $subject patch then?
Hi Uffe,

No need to drop this. We could root-casue the issue. Its a board 
specific issue.
This particular platform/board doesn't have external pull-up on the 
cd-gpio pin.

So internal pull-up config has to be applied on cd-gpio all the time.
We posted this dt change to enable internal pull 
https://patchwork.kernel.org/patch/11675347/

Thanks
Veera

> Uffe
