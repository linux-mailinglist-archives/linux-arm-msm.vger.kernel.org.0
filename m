Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C33DB390F80
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 06:29:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229601AbhEZEb2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 00:31:28 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:33206 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbhEZEb1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 00:31:27 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1622003397; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=XpW6sOG7Ucv6llKqpIHNUwNVxPAdIkYhq01saEjDcpU=; b=fOWcbqhAU7C8y20/pmSYtrYXhIkkg4vDAJDxrPbM102/psSKZoLYV0lFn+IzyGoZUWBxZjrD
 LFG6SaE5lgE9xEcKsAanmgXArg+E7I0a/BXmvNkMFHY4sW8IGIo+VrlQ2CBF/lpOhkVcwlbs
 KBH1EyNgSpaCmEelsY1ZjNQ+f6w=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 60adceb32bff04e53bc24c05 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 26 May 2021 04:29:39
 GMT
Sender: sanm=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CF312C433F1; Wed, 26 May 2021 04:29:39 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [192.168.0.104] (unknown [49.206.34.253])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sanm)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A5FC7C433D3;
        Wed, 26 May 2021 04:29:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A5FC7C433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sanm@codeaurora.org
Subject: Re: [PATCH v7 2/5] usb: dwc3: core: Host wake up support from system
 suspend
To:     Matthias Kaehlcke <mka@chromium.org>,
        Felipe Balbi <balbi@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>
References: <1619586716-8687-1-git-send-email-sanm@codeaurora.org>
 <1619586716-8687-3-git-send-email-sanm@codeaurora.org>
 <87r1iuk9vs.fsf@kernel.org>
 <184ddea9-643f-91ea-6d1f-5bdd26373e53@codeaurora.org>
 <87h7jkhxmw.fsf@kernel.org> <YJxNBm0WiMqjJ2Cg@google.com>
From:   Sandeep Maheswaram <sanm@codeaurora.org>
Message-ID: <4e3951dc-f3e7-0815-7d73-d836240de3e9@codeaurora.org>
Date:   Wed, 26 May 2021 09:59:33 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <YJxNBm0WiMqjJ2Cg@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Felipe,

On 5/13/2021 3:17 AM, Matthias Kaehlcke wrote:
> On Mon, May 03, 2021 at 02:20:23PM +0300, Felipe Balbi wrote:
>> Hi,
>>
>> Sandeep Maheswaram <sanm@codeaurora.org> writes:
>>>> Sandeep Maheswaram <sanm@codeaurora.org> writes:
>>>>> Avoiding phy powerdown when wakeup capable devices are connected
>>>>> by checking phy_power_off flag.
>>>>> Phy should be on to wake up the device from suspend using wakeup capable
>>>>> devices such as keyboard and mouse.
>>>>>
>>>>> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
>>>>> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
>>>>> ---
>>>>>    drivers/usb/dwc3/core.c | 7 +++++--
>>>>>    1 file changed, 5 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
>>>>> index b6e53d8..bb414c3 100644
>>>>> --- a/drivers/usb/dwc3/core.c
>>>>> +++ b/drivers/usb/dwc3/core.c
>>>>> @@ -1738,7 +1738,7 @@ static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
>>>>>    		dwc3_core_exit(dwc);
>>>>>    		break;
>>>>>    	case DWC3_GCTL_PRTCAP_HOST:
>>>>> -		if (!PMSG_IS_AUTO(msg)) {
>>>>> +		if (!PMSG_IS_AUTO(msg) && dwc->phy_power_off) {
>>>> should be able to detect this generically, no? Shouldn't
>>>> device_may_wakeup() be valid here and give you the answer you want?
>>> I think  device_may_wakeup() gives whether the controller is wake up
>>> capable or not.
>> Yes, but it's a bit more than that. Looking at devices.rst we read:
>>
>> If :c:func:`device_may_wakeup(dev)` returns ``true``, the device should be
>> prepared for generating hardware wakeup signals to trigger a system wakeup event
>> when the system is in the sleep state.  For example, :c:func:`enable_irq_wake()`
>> might identify GPIO signals hooked up to a switch or other external hardware,
>> and :c:func:`pci_enable_wake()` does something similar for the PCI PME signal.
>>
>> So, if there is a condition where $this device has to, somehow, deal
>> with wakeup, it should be configured accordingly. This ->phy_power_off
>> flag is telling us the same thing.
>>
>>> But we want to keep phy powered on only when some wakeup capable devices
>>> (eg:keyboard ,mouse ) are connected to controller.
>> Understood, it could be that we're missing some method for propagating
>> that state (i.e. keyboard with PM support) up to the parent device, but
>> that's no excuse to bypass driver boundaries. Wouldn't you agree?
> I'm not sure if device_may_wakeup() is really the right tool for the
> job. This is the current implementation:
>
> static inline bool device_may_wakeup(struct device *dev)
> {
> 	return dev->power.can_wakeup && !!dev->power.wakeup;
> }
>
> IIUC power.can_wakeup specifies whether the device is wakeup
> capable, primarily in physical terms and indicating that the
> driver is ready to handle wakeups, and power.wakeup represents
> the policy which can be changed by userspace.
>
> Supposing the hub is generally wakeup capable that flag
> shouldn't be changed. Neither should be the policy based on
> what is connected to the bus.
Please suggest us how to proceed further with this patch.
