Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 891863F0022
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Aug 2021 11:14:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231685AbhHRJO7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Aug 2021 05:14:59 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:49665 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231444AbhHRJO5 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Aug 2021 05:14:57 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1629278062; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=tl/IdrL1MX3Cp8bKiIsLn/8t7yxW9DakiGF9QhbN0oU=; b=IHiO05Ont7QvCpcanCwtPAi4nDG1DZghxd7yhnhALoLMU072C+TmKfJe9eqFG6L6WYCVg5yr
 wLjsmR4bRsyQOdL3t1fbVpktKV501MWayfTvhDVVTjRpUwc6ceFZTY/4ijQ2VM106uxpOGLp
 8QhURYArlcdXZLa4wPCLfj47SHQ=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 611ccf6d66ff1079041e29ee (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 18 Aug 2021 09:14:21
 GMT
Sender: sanm=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3949EC43460; Wed, 18 Aug 2021 09:14:21 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
        version=3.4.0
Received: from [192.168.0.104] (unknown [49.206.46.153])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sanm)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 799BCC4338F;
        Wed, 18 Aug 2021 09:14:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 799BCC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH v8 6/6] usb: dwc3: qcom: Keep power domain on to support
 wakeup
To:     Felipe Balbi <balbi@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pratham Pratap <prathampratap@codeaurora.org>
References: <1624882097-23265-1-git-send-email-sanm@codeaurora.org>
 <1624882097-23265-7-git-send-email-sanm@codeaurora.org>
 <YNo97HQXmYjUNz/C@google.com> <87fswjzx52.fsf@kernel.org>
From:   Sandeep Maheswaram <sanm@codeaurora.org>
Message-ID: <5ecee092-dba9-071c-940b-55e16f4d7a90@codeaurora.org>
Date:   Wed, 18 Aug 2021 14:44:13 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87fswjzx52.fsf@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Felipe,

On 7/12/2021 3:12 PM, Felipe Balbi wrote:
> Hi,
>
> Matthias Kaehlcke <mka@chromium.org> writes:
>> On Mon, Jun 28, 2021 at 05:38:17PM +0530, Sandeep Maheswaram wrote:
>>> If wakeup capable devices are connected to the controller (directly
>>> or through hubs) at suspend time keep the power domain on in order
>>> to support wakeup from these devices.
>>>
>>> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
>>> ---
>>> Checking phy_power_off flag instead of usb_wakeup_enabled_descendants
>>> to keep gdsc active.
>>>
>>>   drivers/usb/dwc3/dwc3-qcom.c | 13 +++++++++++++
>>>   1 file changed, 13 insertions(+)
>>>
>>> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
>>> index 82125bc..ba31aa3 100644
>>> --- a/drivers/usb/dwc3/dwc3-qcom.c
>>> +++ b/drivers/usb/dwc3/dwc3-qcom.c
>>> @@ -17,6 +17,7 @@
>>>   #include <linux/of_platform.h>
>>>   #include <linux/platform_device.h>
>>>   #include <linux/phy/phy.h>
>>> +#include <linux/pm_domain.h>
>>>   #include <linux/usb/of.h>
>>>   #include <linux/reset.h>
>>>   #include <linux/iopoll.h>
>>> @@ -355,9 +356,15 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom)
>>>   	u32 val;
>>>   	int i, ret;
>>>   
>>> +	struct dwc3 *dwc = platform_get_drvdata(qcom->dwc3);
>>> +	struct generic_pm_domain *genpd = pd_to_genpd(qcom->dev->pm_domain);
>>> +
>>>   	if (qcom->is_suspended)
>>>   		return 0;
>>>   
>>> +	if (!dwc->phy_power_off && dwc->xhci)
>>> +		genpd->flags |= GENPD_FLAG_ACTIVE_WAKEUP;
>>> +
>>>   	val = readl(qcom->qscratch_base + PWR_EVNT_IRQ_STAT_REG);
>>>   	if (!(val & PWR_EVNT_LPM_IN_L2_MASK))
>>>   		dev_err(qcom->dev, "HS-PHY not in L2\n");
>>> @@ -382,9 +389,15 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom)
>>>   	int ret;
>>>   	int i;
>>>   
>>> +	struct dwc3 *dwc = platform_get_drvdata(qcom->dwc3);
>>> +	struct generic_pm_domain *genpd = pd_to_genpd(qcom->dev->pm_domain);
>>> +
>>>   	if (!qcom->is_suspended)
>>>   		return 0;
>>>   
>>> +	if (dwc->xhci)
>>> +		genpd->flags &= ~GENPD_FLAG_ACTIVE_WAKEUP;
>>> +
>>>   	if (device_may_wakeup(qcom->dev))
>>>   		dwc3_qcom_disable_interrupts(qcom);
>>>   
>> This is essentially the same as v7, which Felipe NAKed
>> (https://patchwork.kernel.org/project/linux-arm-msm/patch/1619586716-8687-6-git-send-email-sanm@codeaurora.org/)
>>
>> I think Felipe wants to see the handling of the power domain in the
>> xhci-plat driver. One problem here is that the power domain is owned
> this is not exactly what I meant to say, though. I want drivers to be
> self-contained. I.e. dwc3 doesn't modify xhci data and vice-versa. There
> are a few assummpmtions that we can make, though. The structure is
> usually like this:
>
> glue {
>    dwc3 {
>      xhci
>    };
> };
>
> This means that in order for glue_suspend() to run, dwc3 has to suspend
> first and xhci has to suspend before dwc3.
>
> For example, in the suspend call above, qcom (the glue) is directly
> accessing dwc3 core data, which is incorrect. It looks like we want to
> know if the PHY is not powered off and if it isn't, then we want to
> change the power domain ACTIVE_WAKEUP flag. Now, phy_power_off is false
> whenever any of xHCI's children enable USB wakeup.
>
> It seems like we need to way to generically propagate that knowledge up
> the parent tree. I.e., a parent needs to know if its child is wakeup
> capable, then dwc3 could, in its suspend routine:
>
> static int dwc3_suspend(struct device *dev)
> {
> 	/* ... */
>
> 	if (device_children_wakeup_capable(dev))
>          	device_enable_wakeup(dev);
>
> 	/* ... */
> }

Can we use like  this device_may_wakeup(&dwc->xhci->dev) to check if 
children is wakeup capable like below ?

static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
{
	
/* ... */
	if (!PMSG_IS_AUTO(msg) && !device_may_wakeup(&dwc->xhci->dev)) {
			dwc3_core_exit(dwc);
			break;
	}

/* ... */

  }

> and similarly for qcom glue:
>
> static int dwc3_qcom_suspend(struct device *dev)
> {
> 	/* ... */
>
>
> 	if (device_children_wakeup_capable(dev)) {
>          	device_enable_wakeup(dev);
> 		genpd->flags |= GENPD_FLAG_ACTIVE_WAKEUP;
>          }
>
> 	/* ... */
> }
>
> It also seems plausible that this could be done at driver core and
> completely hidden away from drivers.

And in qcom glue like this

static int dwc3_qcom_suspend(struct dwc3_qcom *qcom)
{

/* ... */

     struct dwc3 *dwc = platform_get_drvdata(qcom->dwc3);


     if (device_may_wakeup(&dwc->xhci->dev) && dwc->xhci)
         genpd->flags |= GENPD_FLAG_ACTIVE_WAKEUP;

/* ... */

}


