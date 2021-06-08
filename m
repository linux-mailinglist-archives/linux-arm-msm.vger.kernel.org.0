Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A04B39EE52
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jun 2021 07:45:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229512AbhFHFrU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Jun 2021 01:47:20 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:21790 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230269AbhFHFrR (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Jun 2021 01:47:17 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1623131125; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=FTH5irT6do2Mgww4obC31jDBjjRHc32WfJ8ytHIN7i0=; b=PVMkLzBOuZuYRIDU0jDNQ9wYy2Cb7i+bnsIJKLsz1HcVdvCVo1A1528tKBfVhyb/tb3m7RVB
 NewfwgLp4UwCxQe5w1RIT8U9Tne4PLpnRU45DPmwDCU2cUHI0mgkQYEogEDoBCRZWY1qqfyq
 j0tNDedFkJ7ru2sE0yKH0OuY1q8=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 60bf03dbe570c05619336782 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 08 Jun 2021 05:44:59
 GMT
Sender: wcheng=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2B98CC433D3; Tue,  8 Jun 2021 05:44:59 +0000 (UTC)
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 20E97C433D3;
        Tue,  8 Jun 2021 05:44:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 20E97C433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=wcheng@codeaurora.org
Subject: Re: [PATCH v9 0/5] Re-introduce TX FIFO resize for larger EP bursting
To:     Greg KH <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        jackp@codeaurora.org, Thinh.Nguyen@synopsys.com
References: <1621410561-32762-1-git-send-email-wcheng@codeaurora.org>
 <YLoUiO8tpRpmvcyU@kroah.com> <87k0n9btnb.fsf@kernel.org>
 <YLo6W5sKaXvy51eW@kroah.com>
From:   Wesley Cheng <wcheng@codeaurora.org>
Message-ID: <c2daab34-1b25-7ee3-e203-a414c1e486d5@codeaurora.org>
Date:   Mon, 7 Jun 2021 22:44:56 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <YLo6W5sKaXvy51eW@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Greg/Felipe,

On 6/4/2021 7:36 AM, Greg KH wrote:
> On Fri, Jun 04, 2021 at 05:18:16PM +0300, Felipe Balbi wrote:
>>
>> Hi,
>>
>> Greg KH <gregkh@linuxfoundation.org> writes:
>>> On Wed, May 19, 2021 at 12:49:16AM -0700, Wesley Cheng wrote:
>>>> Changes in V9:
>>>>  - Fixed incorrect patch in series.  Removed changes in DTSI, as dwc3-qcom will
>>>>    add the property by default from the kernel.
>>>
>>> This patch series has one build failure and one warning added:
>>>
>>> drivers/usb/dwc3/gadget.c: In function ‘dwc3_gadget_calc_tx_fifo_size’:
>>> drivers/usb/dwc3/gadget.c:653:45: warning: passing argument 1 of ‘dwc3_mdwidth’ makes pointer from integer without a cast [-Wint-conversion]
>>>   653 |         mdwidth = dwc3_mdwidth(dwc->hwparams.hwparams0);
>>>       |                                ~~~~~~~~~~~~~^~~~~~~~~~
>>>       |                                             |
>>>       |                                             u32 {aka unsigned int}
>>> In file included from drivers/usb/dwc3/debug.h:14,
>>>                  from drivers/usb/dwc3/gadget.c:25:
>>> drivers/usb/dwc3/core.h:1493:45: note: expected ‘struct dwc3 *’ but argument is of type ‘u32’ {aka ‘unsigned int’}
>>>  1493 | static inline u32 dwc3_mdwidth(struct dwc3 *dwc)
>>>       |                                ~~~~~~~~~~~~~^~~
>>>
>>>
>>> drivers/usb/dwc3/dwc3-qcom.c: In function ‘dwc3_qcom_of_register_core’:
>>> drivers/usb/dwc3/dwc3-qcom.c:660:23: error: implicit declaration of function ‘of_add_property’; did you mean ‘of_get_property’? [-Werror=implicit-function-declaration]
>>>   660 |                 ret = of_add_property(dwc3_np, prop);
>>>       |                       ^~~~~~~~~~~~~~~
>>>       |                       of_get_property
>>>
>>>
>>> How did you test these?

I ran these changes on our internal branches, which were probably
missing some of the recent changes done to the DWC3 drivers.  Will fix
the above compile errors and re-submit.

In regards to how much these changes have been tested, we've been
maintaining the TX FIFO resize logic downstream for a few years already,
so its being used in end products.  We also verify this with our
internal testing, which has certain benchmarks we need to meet.

>>
>> to be honest, I don't think these should go in (apart from the build
>> failure) because it's likely to break instantiations of the core with
>> differing FIFO sizes. Some instantiations even have some endpoints with
>> dedicated functionality that requires the default FIFO size configured
>> during coreConsultant instantiation. I know of at OMAP5 and some Intel
>> implementations which have dedicated endpoints for processor tracing.
>>
>> With OMAP5, these endpoints are configured at the top of the available
>> endpoints, which means that if a gadget driver gets loaded and takes
>> over most of the FIFO space because of this resizing, processor tracing
>> will have a hard time running. That being said, processor tracing isn't
>> supported in upstream at this moment.
>>

I agree that the application of this logic may differ between vendors,
hence why I wanted to keep this controllable by the DT property, so that
for those which do not support this use case can leave it disabled.  The
logic is there to ensure that for a given USB configuration, for each EP
it would have at least 1 TX FIFO.  For USB configurations which don't
utilize all available IN EPs, it would allow re-allocation of internal
memory to EPs which will actually be in use.

>> I still think this may cause other places to break down. The promise the
>> databook makes is that increasing the FIFO size over 2x wMaxPacketSize
>> should bring little to no benefit, if we're not maintaining that, I
>> wonder if the problem is with some of the BUSCFG registers instead,
>> where we configure interconnect bursting and the like.
> 

I've been referring mainly to the DWC3 programming guide for
recommendations on how to improve USB performance in:
Section 3.3.5 System Bus Features to Improve USB Performance

At least when I ran the initial profiling, adjusting the RX/TX
thresholds brought little to no benefits.  Even in some of the examples,
they have diagrams showing a TXFIFO size of 6 max packets (Figure 3-5).
 I think its difficult to say that the TX fifo resizing won't help in
systems with limited, or shared resources where the bus latencies would
be somewhat larger.  By adjusting the TX FIFO size, the controller would
be able to fetch more data from system memory into the memory within the
controller, leading to less frequent end of bursts, etc... as data is
readily available.

In terms of adjusting the AXI/AHB bursting, I would think the bandwidth
increase would eventually be constrained based on your system's design.
 We don't touch the GSBUSCFG registers, and leave them as is based off
the recommendations from the HW designers.

> Good points.
> 
> Wesley, what kind of testing have you done on this on different devices?
> 

As mentioned above, these changes are currently present on end user
devices for the past few years, so its been through a lot of testing :).

Thanks
Wesley Cheng


-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
