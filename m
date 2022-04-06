Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 221AC4F62DC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Apr 2022 17:18:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235886AbiDFPQj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Apr 2022 11:16:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235757AbiDFPQb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Apr 2022 11:16:31 -0400
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48D8A63FF5E;
        Wed,  6 Apr 2022 05:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649247410; x=1680783410;
  h=to:cc:references:from:subject:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=rpKYLZdYBLhVE5YeaVAJgHvi/eQxc/sAqc3k28IE/NI=;
  b=CDKg/bhl+u9U8i1vhxt63LMkRsvzz+dkYGafeBX2GnqwA56vDti9nNOZ
   PlSjgiChFQ3QJQnDld5AdL4wf9RYCmvddByJnbMS8qTCprBC5CwP3V0c/
   aj9Y0lyOz44otWSQEmkfLn/LX7evx46t4cXjpm+SlgF/G6AbyFu0DrHS1
   zkEAQR5YfZkzXI6bliDq9SjenZykKUQ7X6Yv+7tFNXFsNRLfqGbyCMlvQ
   dLy4BJ8hCt2HwDaj7X8NLyWqORFlrQsdInCc9UNIFQHE+8jDr1gyIVvMb
   8MZTIlnGp79J5F14ZLLfrqxNCxL4CNL1FR8zUFUPE1vLAArIX0fR4QzZL
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10308"; a="321724888"
X-IronPort-AV: E=Sophos;i="5.90,239,1643702400"; 
   d="scan'208";a="321724888"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2022 05:16:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,239,1643702400"; 
   d="scan'208";a="658504053"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orsmga004.jf.intel.com with ESMTP; 06 Apr 2022 05:16:25 -0700
To:     Pavan Kondeti <quic_pkondeti@quicinc.com>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        "Sandeep Maheswaram (Temp)" <quic_c_sanm@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Peter Chen <peter.chen@kernel.org>,
        Pawel Laszczak <pawell@cadence.com>,
        Roger Quadros <rogerq@kernel.org>,
        Aswath Govindraju <a-govindraju@ti.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_ppratap@quicinc.com,
        quic_kriskura@quicinc.com
References: <4c2a28ad-b866-1b65-e73a-4eda0596cea2@linux.intel.com>
 <Yj2nPa6/Y01P5aCY@kuha.fi.intel.com>
 <4619c75c-cd34-82f2-56e1-a8bcb6d97177@linux.intel.com>
 <Yj3h4p/kmZTvMz0O@kuha.fi.intel.com>
 <fae54b27-9ae2-ecfc-69ae-40e5f5e1afbe@quicinc.com>
 <bd694ef9-be57-79f1-e95e-5501c396be25@linux.intel.com>
 <YkWNpTLjh2weX9Mk@kuha.fi.intel.com>
 <20220404082516.GE29680@hu-pkondeti-hyd.qualcomm.com>
 <20220406062543.GA10801@hu-pkondeti-hyd.qualcomm.com>
 <1234f637-9420-77e2-dc61-7e702ac8abe0@linux.intel.com>
 <20220406110153.GE10801@hu-pkondeti-hyd.qualcomm.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH v3 3/3] usb: dwc: host: add xhci_plat_priv quirk
 XHCI_SKIP_PHY_INIT
Message-ID: <f578947c-fb10-11b7-abe8-28b6b3f6bb0c@linux.intel.com>
Date:   Wed, 6 Apr 2022 15:18:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220406110153.GE10801@hu-pkondeti-hyd.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 6.4.2022 14.01, Pavan Kondeti wrote:
> Hi Mathias,
> 
> On Wed, Apr 06, 2022 at 01:52:56PM +0300, Mathias Nyman wrote:
>> Hi
>>
>> Sorry about the delayed response.
>>
>>
>> On 6.4.2022 9.25, Pavan Kondeti wrote:
>>> Hi Heikki/Mathias,
>>>
>>> On Mon, Apr 04, 2022 at 01:55:16PM +0530, Pavan Kondeti wrote:
>>>> Hi Heikki,
>>>>
>>>> On Thu, Mar 31, 2022 at 02:16:53PM +0300, Heikki Krogerus wrote:
>>>>> On Wed, Mar 30, 2022 at 08:47:34PM +0300, Mathias Nyman wrote:
>>>>>> On 29.3.2022 12.18, Sandeep Maheswaram (Temp) wrote:
>>>>>>> Hi Mathias,Heikki
>>>>>>>
>>>>>>> On 3/25/2022 9:08 PM, Heikki Krogerus wrote:
>>>>>>>> On Fri, Mar 25, 2022 at 04:33:27PM +0200, Mathias Nyman wrote:
>>>>>>>>> On 25.3.2022 13.27, Heikki Krogerus wrote:
>>>>>>>>>> On Fri, Mar 25, 2022 at 12:36:22AM +0200, Mathias Nyman wrote:
>>>>>>>>>>> On 24.3.2022 14.27, Heikki Krogerus wrote:
>>>>>>>>>>>> On Thu, Mar 24, 2022 at 12:07:11PM +0530, Sandeep Maheswaram wrote:
>>>>>>>>>>>>> Currently the phy init is done from dwc3 and also xhci which makes the
>>>>>>>>>>>>> runtime_usage value 2 for the phy which causes issue during runtime
>>>>>>>>>>>>> suspend. When we run the below command the runtime_status still shows
>>>>>>>>>>>>> active.
>>>>>>>>>>>>> echo auto > /sys/bus/platform/devices/88e3000.phy/power/control
>>>>>>>>>>>>>
>>>>>>>>>>>>> dwc3 manages PHY by own DRD driver, so skip the management by
>>>>>>>>>>>>> HCD core by setting this quirk.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Signed-off-by: Sandeep Maheswaram <quic_c_sanm@quicinc.com>
>>>>>>>>>>>>> ---
>>>>>>>>>>>>>   drivers/usb/dwc3/host.c | 13 +++++++++++++
>>>>>>>>>>>>>   1 file changed, 13 insertions(+)
>>>>>>>>>>>>>
>>>>>>>>>>>>> diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
>>>>>>>>>>>>> index eda8719..d4fcf06 100644
>>>>>>>>>>>>> --- a/drivers/usb/dwc3/host.c
>>>>>>>>>>>>> +++ b/drivers/usb/dwc3/host.c
>>>>>>>>>>>>> @@ -13,6 +13,12 @@
>>>>>>>>>>>>>   #include <linux/platform_device.h>
>>>>>>>>>>>>>     #include "core.h"
>>>>>>>>>>>>> +#include <linux/usb/xhci-plat.h>
>>>>>>>>>>>>> +#include <linux/usb/xhci-quirks.h>
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +static const struct xhci_plat_priv xhci_plat_dwc3_xhci = {
>>>>>>>>>>>>> +    .quirks = XHCI_SKIP_PHY_INIT,
>>>>>>>>>>>>> +};
>>>>>>>>>>>>>     static void dwc3_host_fill_xhci_irq_res(struct dwc3 *dwc,
>>>>>>>>>>>>>                       int irq, char *name)
>>>>>>>>>>>>> @@ -122,6 +128,13 @@ int dwc3_host_init(struct dwc3 *dwc)
>>>>>>>>>>>>>           }
>>>>>>>>>>>>>       }
>>>>>>>>>>>>>   +    ret = platform_device_add_data(xhci, &xhci_plat_dwc3_xhci,
>>>>>>>>>>>>> +            sizeof(xhci_plat_dwc3_xhci));
>>>>>>>>>>>>> +    if (ret) {
>>>>>>>>>>>>> +        dev_err(dwc->dev, "failed to add data to xHCI\n");
>>>>>>>>>>>>> +        goto err;
>>>>>>>>>>>>> +    }
>>>>>>>>>>>>> +
>>>>>>>>>>>>>       ret = platform_device_add(xhci);
>>>>>>>>>>>>>       if (ret) {
>>>>>>>>>>>>>           dev_err(dwc->dev, "failed to register xHCI device\n");
>>>>>>>>>>>> I think you should just use device property:
>>>>>>>>>>>>
>>>>>>>>>>> This was suggested in an earlier series, but was rejected as it also added
>>>>>>>>>>> the property as a device tree parameter.
>>>>>>>>>>>
>>>>>>>>>>> I think adding more device properties can be messy in the long run, especially if we
>>>>>>>>>>> need to add them for many of the existing xhci quirks.
>>>>>>>>>>> We also end up with a mix where some device properties are listed as device tree
>>>>>>>>>>> parameters, and some not.
>>>>>>>>>>>
>>>>>>>>>>> Defining xhci quirks and platform data structure in headers shared with dwc3 and cdns3
>>>>>>>>>>> allow those drivers to easily set any existing xhci quirk, or other possible optional
>>>>>>>>>>> callbacks.
>>>>>>>>>>>
>>>>>>>>>>> cdns3 driver is already doing this, but it includes the full xhci.h header.
>>>>>>>>>>> This series cleans up that a bit so cdns3 will only include xhci quirk bits and
>>>>>>>>>>> platform data structure.
>>>>>>>>>>>
>>>>>>>>>>> On the downside we add a couple xhci related header files to include/linux/usb/
>>>>>>>>>>> Let me know if you see any other issues I missed with this approach.
>>>>>>>>>> The problem here is that these drivers are now coupled together, and
>>>>>>>>>> that should not be taken lightly. We have a dependency hell in our
>>>>>>>>>> hands with a lot of drivers, and the culprit is always platform data.
>>>>>>>>>>
>>>>>>>>>> Build-in device properties may be messy, but I would still say they
>>>>>>>>>> are less messy than those quirk flags - you got to admit, they are a
>>>>>>>>>> mess. The benefit from build-in properties is in any case the fact
>>>>>>>>>> that they remove the need to couple these drivers together.
>>>>>>>>> Agree, quirk bits are messy. Any suggestion that would work with
>>>>>>>>> PCI xHCI devices, devicetree, and "pure" platform devices?
>>>>>>>> I think xHCI driver should always be able to rely on being able to
>>>>>>>> read this kind of information from the fwnode. If there is no actual
>>>>>>>> firmware node (DT or ACPI), or if it's missing some information, the
>>>>>>>> glue driver needs to populate software node for the xHCI.
>>>>>>>>
>>>>>>>> Right now I just want to avoid having to pass the quirks using
>>>>>>>> platform data from drivers such as drivers/usb/cdns3/host.c and
>>>>>>>> drivers/usb/dwc3/host.c to xHCI.
>>>>>>>>
>>>>>>>> One way we could do that is by defining compatibility ID for both of
>>>>>>>> them that we provide using a single device property (like I guess DT
>>>>>>>> does). Then based on that compatibility ID, xhci-plat.c can set the
>>>>>>>> actual "static" quirk flags. That we could already do easily. How
>>>>>>>> would that sound to you?
>>>>>>
>>>>>> Sounds good. 
>>>>>>
>>>>>>>
>>>>>>> This was my previous patch where I was using device tree property. Should we go ahead with this approach?
>>>>>>>
>>>>>>> https://patchwork.kernel.org/project/linux-arm-msm/cover/1636353710-25582-1-git-send-email-quic_c_sanm@quicinc.com/
>>>>>>>
>>>>>>> Any further changes to this ?
>>>>>>
>>>>>> By dropping the DT part of that series we get a similar built-in device property
>>>>>> solution as Heikki initially suggested.
>>>>>>
>>>>>> How about adding the compatibility ID device property that was just suggested?
>>>>>> Then matching the Id in xhci-plat.c against a static table containing Ids and
>>>>>> xhci_plat_priv structures, with the needed quirks for dwc3.
>>>>>
>>>>> There was a comment from Pavan. Is it still possible to get this
>>>>> detail from DT?
>>>>> I guess that would still be ideal, right?
>>>>>
>>>> I was suggesting if we can have device tree param like the patch sandeep
>>>> pointed out.
>>>>
>>>> How would adding a compatible index to usb_xhci_of_match[] would work
>>>> actually? I ask this because, dwc3/host.c creates platform device and
>>>> it is not associated with any of_node, so of_driver_match_device() called
>>>> from platform bus match method does not work. one way to achieve this would
>>>> be by matching against sysdev. Something like below. Is it acceptible?
>>>>
>>>> diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
>>>> index 649ffd8..bd5d055 100644
>>>> --- a/drivers/usb/host/xhci-plat.c
>>>> +++ b/drivers/usb/host/xhci-plat.c
>>>> @@ -126,6 +126,10 @@ static const struct xhci_plat_priv xhci_plat_brcm = {
>>>>  	.quirks = XHCI_RESET_ON_RESUME,
>>>>  };
>>>>  
>>>> +static const struct xhci_plat_priv xhci_plat_dwc3 = {
>>>> +	.quirks = XHCI_SKIP_PHY_INIT,
>>>> +};
>>>> +
>>>>  static const struct of_device_id usb_xhci_of_match[] = {
>>>>  	{
>>>>  		.compatible = "generic-xhci",
>>>> @@ -167,6 +171,9 @@ static const struct of_device_id usb_xhci_of_match[] = {
>>>>  	}, {
>>>>  		.compatible = "brcm,bcm7445-xhci",
>>>>  		.data = &xhci_plat_brcm,
>>>> +	}, {
>>>> +		.compatible = "snps,dwc3",
>>>> +		.data = &xhci_plat_dwc3,
>>>>  	},
>>
>> Isn't there a risk that xhci-plat now binds to the parent dwc3 device?
>> competing with the similar of_match_table entry created in drivers/usb/dwc3/core.c
> 
> Sill of me. Yes, it does not work. Thanks for pointing it out.
> 
>>
>>>>  	{},
>>>>  };
>>>> @@ -274,6 +281,15 @@ static int xhci_plat_probe(struct platform_device *pdev)
>>>>  	else
>>>>  		priv_match = dev_get_platdata(&pdev->dev);
>>>>  
>>>> +	/* allow private data mapping with the sysdev compatible */
>>>> +	if (!priv_match) {
>>>> +		struct of_device_id *match;
>>>> +
>>>> +		match = of_match_device(usb_xhci_of_match, sysdev);
>>>> +		if (match)
>>>> +			priv_match = match->data;
>>>> +	}
>>>> +
>>>>  	if (priv_match) {
>>>>  		priv = hcd_to_xhci_priv(hcd);
>>>>  		/* Just copy data for now */
>>>>
>>>>> I have another question. Can't we now just assume that if the sysdev
>>>>> is the parent (or grandparent), then the phy initialization should
>>>>> always be skipped? In that case we could just do something like this:
>>>>>
>>>>> diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
>>>>> index 649ffd861b44e..1018b33488046 100644
>>>>> --- a/drivers/usb/host/xhci-plat.c
>>>>> +++ b/drivers/usb/host/xhci-plat.c
>>>>> @@ -212,8 +212,12 @@ static int xhci_plat_probe(struct platform_device *pdev)
>>>>>  #endif
>>>>>         }
>>>>>  
>>>>> -       if (!sysdev)
>>>>> +       if (sysdev) {
>>>>> +               if (sysdev != &pdev->dev)
>>>>> +                       hcd->skip_phy_initialization = 1;
>>>>> +       } else {
>>>>>                 sysdev = &pdev->dev;
>>>>> +       }
>>>>>  
>>>>>         if (WARN_ON(!sysdev->dma_mask))
>>>>>                 /* Platform did not initialize dma_mask */
>>>>>
>>>>>
>>>>> I did not go through all the drivers that carefully, so I may have
>>>>> missed something, but it looks like the only drivers that can have the
>>>>> sysdev as the parent or grandparent are cdns3 and dwc3.
>>>>>
>>>> I cross checked and these are two drivers that are creating xhci-plat device.
>>>> So this patch would definitely work. However I am not sure in future if any
>>>> device created via device tree would want to use this feature. For now,
>>>> it looks good. It Mathias, Do you see any problem with this approach?
>>>>
>>
>> Would work for now but seems like a risk to assume this would hold for all future
>> xhci platform devices. 
>>
> Agree that it may break in future for other drivers.
> 
>>>
>>> Can you please provide your suggestions on this? We have discussed about
>>> 3 approaches here other than the whole platform data refactoring done.
>>>
>>> (1) Introduce a new dT property and expect dwc3/host.c to set this property
>>> to skip the phy initialization.
>>
>> Adding one more device property to swnode in dwc3/host.c starts
>> to look like the best option for now even if it didn't appeal initially.
>>
>> The place creating the xhci platform device should have best info on what properties
>> are needed for the platform device.
>>
>> So this would be just like Heikki's first suggestion, or Sandeep's patches 2/3 and 3/3 in:
>> https://patchwork.kernel.org/project/linux-arm-msm/cover/1636353710-25582-1-git-send-email-quic_c_sanm@quicinc.com/
>> but without the devicetree binding documentation part.
>>
> Why do you say devicetree binding doc is not needed in this case? Possible
> that xhci-plat's device can be coming from dT and this param is passed to
> skip initialization of PHY.

Adding it is fine by me. It was rejected earlier by Rob Herring

But we can live without it.
In dwc3 and cdns3 "pure" platform case we add the device property when
creating the device.

In dT case we should have a compatible entry, and we can add a matching
entry in usb_xhci_of_match[] which sets the needed quirk.

Thanks
-Mathias
