Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53DF53A32DE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jun 2021 20:16:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231218AbhFJSSC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Jun 2021 14:18:02 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:36061 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231174AbhFJSSB (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Jun 2021 14:18:01 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1623348965; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=mVLUJXd2RETjC0iRuba0DAjVBduoMP1Tm2AuF8peuf4=; b=TyR4Z4dupSwf/ojY4vIEQwVMuqpiqhyvI86F8fg5sqfSWsScS30aumVKutVqZiTYkGA+qTi5
 X+q5YhCaWCInx53ctzXjEi9tolmN1YfZBqAXkwkD/4Wt67EvYWa6JoKfa2bZ2zfJLUWwvSpL
 pzLhKUxPRbK51mDH6tYSx9n6xG0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 60c256c4ed59bf69ccddf899 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 10 Jun 2021 18:15:32
 GMT
Sender: wcheng=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id F3809C4338A; Thu, 10 Jun 2021 18:15:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.110.62.3] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 88EB7C433D3;
        Thu, 10 Jun 2021 18:15:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 88EB7C433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=wcheng@codeaurora.org
Subject: Re: [PATCH v9 0/5] Re-introduce TX FIFO resize for larger EP bursting
To:     Felipe Balbi <balbi@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        jackp@codeaurora.org, Thinh.Nguyen@synopsys.com
References: <1621410561-32762-1-git-send-email-wcheng@codeaurora.org>
 <YLoUiO8tpRpmvcyU@kroah.com> <87k0n9btnb.fsf@kernel.org>
 <YLo6W5sKaXvy51eW@kroah.com>
 <c2daab34-1b25-7ee3-e203-a414c1e486d5@codeaurora.org>
 <874ke62i0v.fsf@kernel.org>
From:   Wesley Cheng <wcheng@codeaurora.org>
Message-ID: <e5f231ca-6807-bcea-29c2-ab3926057310@codeaurora.org>
Date:   Thu, 10 Jun 2021 11:15:28 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <874ke62i0v.fsf@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Felipe,

On 6/10/2021 2:20 AM, Felipe Balbi wrote:
> 
> Hi,
> 
> Wesley Cheng <wcheng@codeaurora.org> writes:
> 
>> Hi Greg/Felipe,
>>
>> On 6/4/2021 7:36 AM, Greg KH wrote:
>>> On Fri, Jun 04, 2021 at 05:18:16PM +0300, Felipe Balbi wrote:
>>>>
>>>> Hi,
>>>>
>>>> Greg KH <gregkh@linuxfoundation.org> writes:
>>>>> On Wed, May 19, 2021 at 12:49:16AM -0700, Wesley Cheng wrote:
>>>>>> Changes in V9:
>>>>>>  - Fixed incorrect patch in series.  Removed changes in DTSI, as dwc3-qcom will
>>>>>>    add the property by default from the kernel.
>>>>>
>>>>> This patch series has one build failure and one warning added:
>>>>>
>>>>> drivers/usb/dwc3/gadget.c: In function ‘dwc3_gadget_calc_tx_fifo_size’:
>>>>> drivers/usb/dwc3/gadget.c:653:45: warning: passing argument 1 of ‘dwc3_mdwidth’ makes pointer from integer without a cast [-Wint-conversion]
>>>>>   653 |         mdwidth = dwc3_mdwidth(dwc->hwparams.hwparams0);
>>>>>       |                                ~~~~~~~~~~~~~^~~~~~~~~~
>>>>>       |                                             |
>>>>>       |                                             u32 {aka unsigned int}
>>>>> In file included from drivers/usb/dwc3/debug.h:14,
>>>>>                  from drivers/usb/dwc3/gadget.c:25:
>>>>> drivers/usb/dwc3/core.h:1493:45: note: expected ‘struct dwc3 *’ but argument is of type ‘u32’ {aka ‘unsigned int’}
>>>>>  1493 | static inline u32 dwc3_mdwidth(struct dwc3 *dwc)
>>>>>       |                                ~~~~~~~~~~~~~^~~
>>>>>
>>>>>
>>>>> drivers/usb/dwc3/dwc3-qcom.c: In function ‘dwc3_qcom_of_register_core’:
>>>>> drivers/usb/dwc3/dwc3-qcom.c:660:23: error: implicit declaration of function ‘of_add_property’; did you mean ‘of_get_property’? [-Werror=implicit-function-declaration]
>>>>>   660 |                 ret = of_add_property(dwc3_np, prop);
>>>>>       |                       ^~~~~~~~~~~~~~~
>>>>>       |                       of_get_property
>>>>>
>>>>>
>>>>> How did you test these?
>>
>> I ran these changes on our internal branches, which were probably
>> missing some of the recent changes done to the DWC3 drivers.  Will fix
>> the above compile errors and re-submit.
>>
>> In regards to how much these changes have been tested, we've been
>> maintaining the TX FIFO resize logic downstream for a few years already,
>> so its being used in end products.  We also verify this with our
>> internal testing, which has certain benchmarks we need to meet.
> 
> the problem with that is that you *know* which gadget is running
> there. You know everyone of those is going to run the android
> gadget. In a sense, all those multiple products are testing the same
> exact use case :-)
> 

Mmmm, the USB gadget has changed from since we've implemented it, such
as going from Android gadget to Configfs.  Don't forget, we do have
other business segments that use this feature in other configurations as
well :).

>>>> to be honest, I don't think these should go in (apart from the build
>>>> failure) because it's likely to break instantiations of the core with
>>>> differing FIFO sizes. Some instantiations even have some endpoints with
>>>> dedicated functionality that requires the default FIFO size configured
>>>> during coreConsultant instantiation. I know of at OMAP5 and some Intel
>>>> implementations which have dedicated endpoints for processor tracing.
>>>>
>>>> With OMAP5, these endpoints are configured at the top of the available
>>>> endpoints, which means that if a gadget driver gets loaded and takes
>>>> over most of the FIFO space because of this resizing, processor tracing
>>>> will have a hard time running. That being said, processor tracing isn't
>>>> supported in upstream at this moment.
>>>>
>>
>> I agree that the application of this logic may differ between vendors,
>> hence why I wanted to keep this controllable by the DT property, so that
>> for those which do not support this use case can leave it disabled.  The
>> logic is there to ensure that for a given USB configuration, for each EP
>> it would have at least 1 TX FIFO.  For USB configurations which don't
>> utilize all available IN EPs, it would allow re-allocation of internal
>> memory to EPs which will actually be in use.
> 
> The feature ends up being all-or-nothing, then :-) It sounds like we can
> be a little nicer in this regard.
> 

Don't get me wrong, I think once those features become available
upstream, we can improve the logic.  From what I remember when looking
at Andy Shevchenko's Github, the Intel tracer downstream changes were
just to remove physical EP1 and 2 from the DWC3 endpoint list.  If that
was the change which ended up upstream for the Intel tracer then we
could improve the logic to avoid re-sizing those particular EPs.
However, I'm not sure how the changes would look like in the end, so I
would like to wait later down the line to include that :).

>>>> I still think this may cause other places to break down. The promise the
>>>> databook makes is that increasing the FIFO size over 2x wMaxPacketSize
>>>> should bring little to no benefit, if we're not maintaining that, I
>>>> wonder if the problem is with some of the BUSCFG registers instead,
>>>> where we configure interconnect bursting and the like.
>>>
>>
>> I've been referring mainly to the DWC3 programming guide for
>> recommendations on how to improve USB performance in:
>> Section 3.3.5 System Bus Features to Improve USB Performance
> 
> dwc3 or dwc3.1? Either way, since I left Intel I don't have access to
> the databook anymore. I have to trust what you guys are telling me and,
> based on the description so far, I don't think we're doing the right
> thing (yet).
> 

Ah, I see.  DWC3.1 and DWC3 both have that USB performance section.  I
can explain some of the points I made with a bit more detail.  I thought
you still had access to it.

> It would be nice if other users would test this patchset with different
> gadget drivers and different platforms to have some confidence that
> we're limiting possible regressions.
> 
> I would like for Thinh to comment from Synopsys side here.
> 
>> At least when I ran the initial profiling, adjusting the RX/TX
>> thresholds brought little to no benefits.  Even in some of the examples,
> 
> right, the FIFO sizes shouldn't help much. At least that's what Paul
> told me several years ago. Thinh, has the recommendation changed?
> 

So when I mention the RX/TX thresholds, this is different than the FIFO
resize.  The RX/TX threshold is used by the controller to determine when
to send or receive data based on the number of available FIFOs.  So for
the TX case, if we set the TX threshold, the controller will not start
transmitting data over the link after X amount of packets are copied to
the TXFIFO.  So for example, a TXFIFO size of 6 w/ a TX threshold of 3,
means that the controller will wait for 3 FIFO slots to be filled before
it sends the data.  So as you can see, with our configuration of TX FIFO
size of 2 and TX threshold of 1, this would really be not beneficial to
us, because we can only change the TX threshold to 2 at max, and at
least in my observations, once we have to go out to system memory to
fetch the next data packet, that latency takes enough time for the
controller to end the current burst.

>> they have diagrams showing a TXFIFO size of 6 max packets (Figure 3-5).
>>  I think its difficult to say that the TX fifo resizing won't help in
>> systems with limited, or shared resources where the bus latencies would
>> be somewhat larger.  By adjusting the TX FIFO size, the controller would
>> be able to fetch more data from system memory into the memory within the
>> controller, leading to less frequent end of bursts, etc... as data is
>> readily available.
>>
>> In terms of adjusting the AXI/AHB bursting, I would think the bandwidth
>> increase would eventually be constrained based on your system's design.
>>  We don't touch the GSBUSCFG registers, and leave them as is based off
>> the recommendations from the HW designers.
> 
> Right, I want to touch those as little as possible too :-) However, to
> illustrate, the only reason I implemented FIFO resizing was because
> OMAP5 ES1 had TX FIFOs that were smaller than a full USB3 packet. HW
> Designer's recommendation can be bogus too ;-)
> 

Haha...true, we question their designs only when there's something
clearly wrong, but the AXI/AHB settings look good.  :)

>>> Good points.
>>>
>>> Wesley, what kind of testing have you done on this on different devices?
>>>
>>
>> As mentioned above, these changes are currently present on end user
>> devices for the past few years, so its been through a lot of testing :).
> 
> all with the same gadget driver. Also, who uses USB on android devices
> these days? Most of the data transfer goes via WiFi or Bluetooth, anyway
> :-)
> 
> I guess only developers are using USB during development to flash dev
> images heh.
> 

I used to be a customer facing engineer, so honestly I did see some
really interesting and crazy designs.  Again, we do have non-Android
products that use the same code, and it has been working in there for a
few years as well.  The TXFIFO sizing really has helped with multimedia
use cases, which use isoc endpoints, since esp. in those lower end CPU
chips where latencies across the system are much larger, and a missed
ISOC interval leads to a pop in your ear.

Thanks
Wesley Cheng

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
