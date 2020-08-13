Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1DFF2434AB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Aug 2020 09:17:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726044AbgHMHR3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Aug 2020 03:17:29 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:42143 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726048AbgHMHR3 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Aug 2020 03:17:29 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1597303048; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=7+SupX1KdeOjMckzG2kriiII+B/Pn9nxUz4H7+p3Lew=; b=EujTo83/whrmlj55viqaIZ+rZkVDvMFJEzuDSRKjKi89SnL5/nNIB03qseQu1wgErkEAcD1A
 AaliUU6VXU178Bos2YYHkLaCO5tXtHUgGU9Yszzkd+FjhVN/XVq7KSrDRanpKd/2Q47pkXRI
 fqgskkvLL0V0cK6RKGcod2+EJ3g=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 5f34e907440a07969a35cb8c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 13 Aug 2020 07:17:27
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id EBD26C43391; Thu, 13 Aug 2020 07:17:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.29.129] (unknown [49.36.77.164])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1FFB5C433C6;
        Thu, 13 Aug 2020 07:17:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1FFB5C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH v4 2/7] pinctrl: qcom: Use return value from irq_set_wake
 call
To:     Stephen Boyd <swboyd@chromium.org>, bjorn.andersson@linaro.org,
        evgreen@chromium.org, linus.walleij@linaro.org, maz@kernel.org,
        mka@chromium.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, agross@kernel.org, tglx@linutronix.de,
        jason@lakedaemon.net, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org
References: <1597058460-16211-1-git-send-email-mkshah@codeaurora.org>
 <1597058460-16211-3-git-send-email-mkshah@codeaurora.org>
 <159717444178.1360974.6520145243224264090@swboyd.mtv.corp.google.com>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <aa506a3d-3e89-08ed-2d66-7098f6e5af91@codeaurora.org>
Date:   Thu, 13 Aug 2020 12:47:18 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <159717444178.1360974.6520145243224264090@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 8/12/2020 1:04 AM, Stephen Boyd wrote:
> Quoting Maulik Shah (2020-08-10 04:20:55)
>> msmgpio irqchip is not using return value of irq_set_wake call.
>> Start using it.
> Does this work when the irq parent isn't setup in a hierarchy?
yes it works fine even when parent isn't setup in hierarchy.
> I seem to
> recall that this was written this way because sometimes
> irq_set_irq_wake() would fail for the summary irq so it was a best
> effort setting of wake on the summary line.
Thanks for pointing this.

It was written this way since previously GIC driver neither had 
IRQCHIP_SKIP_SET_WAKE flag nor it implemented .irq_set_wake callback,

so the call to irq_set_irq_wake() to set_irq_wake_real() used to return 
error -ENXIO in past.

I see this is already taken care now in GIC drivers by adding 
IRQCHIP_SKIP_SET_WAKE flag.

>
>> Fixes: e35a6ae0eb3a ("pinctrl/msm: Setup GPIO chip in hierarchy")
>> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
>> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>> ---
>>   drivers/pinctrl/qcom/pinctrl-msm.c | 8 +++-----
>>   1 file changed, 3 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
>> index 90edf61..c264561 100644
>> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
>> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
>> @@ -1077,12 +1077,10 @@ static int msm_gpio_irq_set_wake(struct irq_data *d, unsigned int on)
>>           * when TLMM is powered on. To allow that, enable the GPIO
>>           * summary line to be wakeup capable at GIC.
>>           */
>> -       if (d->parent_data)
>> -               irq_chip_set_wake_parent(d, on);
>> -
>> -       irq_set_irq_wake(pctrl->irq, on);
>> +       if (d->parent_data && test_bit(d->hwirq, pctrl->skip_wake_irqs))
>> +               return irq_chip_set_wake_parent(d, on);
> So this bit is probably fine.
>
>>   
>> -       return 0;
>> +       return irq_set_irq_wake(pctrl->irq, on);
> But this one is probably not fine.

As per above both of them are fine.

Thanks,
Maulik

>
>>   }
>>   
>>   static int msm_gpio_irq_reqres(struct irq_data *d)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

