Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C0023A75C1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jun 2021 06:23:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230064AbhFOEZI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Jun 2021 00:25:08 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:64789 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229601AbhFOEZF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Jun 2021 00:25:05 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1623730982; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=PC2BWi7/fj12EOdix7csJFfznHvJ1m/1LrgBWseNBFQ=; b=gIWCeRdEnfLbAcCOH6dGOXhwgMqX7Zh3UeBq75EVcG8JhuxKZbib1miodq7b+P/ZhDWKklFG
 zkqUuG1SnLMEupuEtDt5eDRI7XyzMRg/2DOH2+6r+tqCftxakYrSISYq6hK2uY8XK8UcMoOk
 lmTnDTf3zzlRB+en+KbkO/s2W8k=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 60c82b21abfd22a3dce239dd (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 15 Jun 2021 04:22:56
 GMT
Sender: wcheng=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id DE709C4360C; Tue, 15 Jun 2021 04:22:54 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [10.110.86.111] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4AE69C433F1;
        Tue, 15 Jun 2021 04:22:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4AE69C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=wcheng@codeaurora.org
Subject: Re: [PATCH v9 0/5] Re-introduce TX FIFO resize for larger EP bursting
To:     Ferry Toth <fntoth@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        USB <linux-usb@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org,
        devicetree <devicetree@vger.kernel.org>,
        Jack Pham <jackp@codeaurora.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        John Youn <John.Youn@synopsys.com>
References: <1621410561-32762-1-git-send-email-wcheng@codeaurora.org>
 <YLoUiO8tpRpmvcyU@kroah.com> <87k0n9btnb.fsf@kernel.org>
 <YLo6W5sKaXvy51eW@kroah.com>
 <c2daab34-1b25-7ee3-e203-a414c1e486d5@codeaurora.org>
 <874ke62i0v.fsf@kernel.org>
 <e5f231ca-6807-bcea-29c2-ab3926057310@codeaurora.org>
 <8735to29tt.fsf@kernel.org>
 <f1d57fca-3ac1-d8c8-bd23-cf525b366573@codeaurora.org>
 <87tum4zhc9.fsf@kernel.org> <YMNhnCBq2lb7oUZK@kuha.fi.intel.com>
 <CAHp75VeXTekvj88n2-v+tVUkDvR6rHtuHm3XuTGTrgOyU9wC7Q@mail.gmail.com>
 <33c6cecf-3dce-8c4f-2be2-55cc3c6c6830@gmail.com>
 <d5a9f4f8-949b-88f9-90e0-9e70b40ff9e0@codeaurora.org>
 <098b2211-c3cf-e4c3-c0bd-9b4f8253389b@gmail.com>
From:   Wesley Cheng <wcheng@codeaurora.org>
Message-ID: <0e9373ec-931b-f96a-b2c9-dbd532a823a6@codeaurora.org>
Date:   Mon, 14 Jun 2021 21:22:49 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <098b2211-c3cf-e4c3-c0bd-9b4f8253389b@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 6/14/2021 12:30 PM, Ferry Toth wrote:
> 
> Op 14-06-2021 om 20:58 schreef Wesley Cheng:
>>
>> On 6/12/2021 2:27 PM, Ferry Toth wrote:
>>> Hi
>>>
>>> Op 11-06-2021 om 15:21 schreef Andy Shevchenko:
>>>> On Fri, Jun 11, 2021 at 4:14 PM Heikki Krogerus
>>>> <heikki.krogerus@linux.intel.com> wrote:
>>>>> On Fri, Jun 11, 2021 at 04:00:38PM +0300, Felipe Balbi wrote:
>>>>>> Hi,
>>>>>>
>>>>>> Wesley Cheng <wcheng@codeaurora.org> writes:
>>>>>>>>>>>>> to be honest, I don't think these should go in (apart from
>>>>>>>>>>>>> the build
>>>>>>>>>>>>> failure) because it's likely to break instantiations of the
>>>>>>>>>>>>> core with
>>>>>>>>>>>>> differing FIFO sizes. Some instantiations even have some
>>>>>>>>>>>>> endpoints with
>>>>>>>>>>>>> dedicated functionality that requires the default FIFO size
>>>>>>>>>>>>> configured
>>>>>>>>>>>>> during coreConsultant instantiation. I know of at OMAP5 and
>>>>>>>>>>>>> some Intel
>>>>>>>>>>>>> implementations which have dedicated endpoints for processor
>>>>>>>>>>>>> tracing.
>>>>>>>>>>>>>
>>>>>>>>>>>>> With OMAP5, these endpoints are configured at the top of the
>>>>>>>>>>>>> available
>>>>>>>>>>>>> endpoints, which means that if a gadget driver gets loaded
>>>>>>>>>>>>> and takes
>>>>>>>>>>>>> over most of the FIFO space because of this resizing,
>>>>>>>>>>>>> processor tracing
>>>>>>>>>>>>> will have a hard time running. That being said, processor
>>>>>>>>>>>>> tracing isn't
>>>>>>>>>>>>> supported in upstream at this moment.
>>>>>>>>>>>>>
>>>>>>>>>>> I agree that the application of this logic may differ between
>>>>>>>>>>> vendors,
>>>>>>>>>>> hence why I wanted to keep this controllable by the DT
>>>>>>>>>>> property, so that
>>>>>>>>>>> for those which do not support this use case can leave it
>>>>>>>>>>> disabled.  The
>>>>>>>>>>> logic is there to ensure that for a given USB configuration,
>>>>>>>>>>> for each EP
>>>>>>>>>>> it would have at least 1 TX FIFO.  For USB configurations which
>>>>>>>>>>> don't
>>>>>>>>>>> utilize all available IN EPs, it would allow re-allocation of
>>>>>>>>>>> internal
>>>>>>>>>>> memory to EPs which will actually be in use.
>>>>>>>>>> The feature ends up being all-or-nothing, then :-) It sounds
>>>>>>>>>> like we can
>>>>>>>>>> be a little nicer in this regard.
>>>>>>>>>>
>>>>>>>>> Don't get me wrong, I think once those features become available
>>>>>>>>> upstream, we can improve the logic.  From what I remember when
>>>>>>>>> looking
>>>>>>>> sure, I support that. But I want to make sure the first cut isn't
>>>>>>>> likely
>>>>>>>> to break things left and right :)
>>>>>>>>
>>>>>>>> Hence, let's at least get more testing.
>>>>>>>>
>>>>>>> Sure, I'd hope that the other users of DWC3 will also see some
>>>>>>> pretty
>>>>>>> big improvements on the TX path with this.
>>>>>> fingers crossed
>>>>>>
>>>>>>>>> at Andy Shevchenko's Github, the Intel tracer downstream changes
>>>>>>>>> were
>>>>>>>>> just to remove physical EP1 and 2 from the DWC3 endpoint list.
>>>>>>>>> If that
>>>>>>>> right, that's the reason why we introduced the endpoint feature
>>>>>>>> flags. The end goal was that the UDC would be able to have custom
>>>>>>>> feature flags paired with ->validate_endpoint() or whatever before
>>>>>>>> allowing it to be enabled. Then the UDC driver could tell UDC
>>>>>>>> core to
>>>>>>>> skip that endpoint on that particular platform without
>>>>>>>> interefering with
>>>>>>>> everything else.
>>>>>>>>
>>>>>>>> Of course, we still need to figure out a way to abstract the
>>>>>>>> different
>>>>>>>> dwc3 instantiations.
>>>>>>>>
>>>>>>>>> was the change which ended up upstream for the Intel tracer
>>>>>>>>> then we
>>>>>>>>> could improve the logic to avoid re-sizing those particular EPs.
>>>>>>>> The problem then, just as I mentioned in the previous paragraph,
>>>>>>>> will be
>>>>>>>> coming up with a solution that's elegant and works for all
>>>>>>>> different
>>>>>>>> instantiations of dwc3 (or musb, cdns3, etc).
>>>>>>>>
>>>>>>> Well, at least for the TX FIFO resizing logic, we'd only be
>>>>>>> needing to
>>>>>>> focus on the DWC3 implementation.
>>>>>>>
>>>>>>> You bring up another good topic that I'll eventually needing to be
>>>>>>> taking a look at, which is a nice way we can handle vendor specific
>>>>>>> endpoints and how they can co-exist with other "normal"
>>>>>>> endpoints.  We
>>>>>>> have a few special HW eps as well, which we try to maintain
>>>>>>> separately
>>>>>>> in our DWC3 vendor driver, but it isn't the most convenient, or most
>>>>>>> pretty method :).
>>>>>> Awesome, as mentioned, the endpoint feature flags were added
>>>>>> exactly to
>>>>>> allow for these vendor-specific features :-)
>>>>>>
>>>>>> I'm more than happy to help testing now that I finally got our SM8150
>>>>>> Surface Duo device tree accepted by Bjorn ;-)
>>>>>>
>>>>>>>>> However, I'm not sure how the changes would look like in the end,
>>>>>>>>> so I
>>>>>>>>> would like to wait later down the line to include that :).
>>>>>>>> Fair enough, I agree. Can we get some more testing of $subject,
>>>>>>>> though?
>>>>>>>> Did you test $subject with upstream too? Which gadget drivers
>>>>>>>> did you
>>>>>>>> use? How did you test
>>>>>>>>
>>>>>>> The results that I included in the cover page was tested with the
>>>>>>> pure
>>>>>>> upstream kernel on our device.  Below was using the ConfigFS gadget
>>>>>>> w/ a
>>>>>>> mass storage only composition.
>>>>>>>
>>>>>>> Test Parameters:
>>>>>>>    - Platform: Qualcomm SM8150
>>>>>>>    - bMaxBurst = 6
>>>>>>>    - USB req size = 256kB
>>>>>>>    - Num of USB reqs = 16
>>>>>> do you mind testing with the regular request size (16KiB) and 250
>>>>>> requests? I think we can even do 15 bursts in that case.
>>>>>>
>>>>>>>    - USB Speed = Super-Speed
>>>>>>>    - Function Driver: Mass Storage (w/ ramdisk)
>>>>>>>    - Test Application: CrystalDiskMark
>>>>>>>
>>>>>>> Results:
>>>>>>>
>>>>>>> TXFIFO Depth = 3 max packets
>>>>>>>
>>>>>>> Test Case | Data Size | AVG tput (in MB/s)
>>>>>>> -------------------------------------------
>>>>>>> Sequential|1 GB x     |
>>>>>>> Read      |9 loops    | 193.60
>>>>>>>             |           | 195.86
>>>>>>>             |           | 184.77
>>>>>>>             |           | 193.60
>>>>>>> -------------------------------------------
>>>>>>>
>>>>>>> TXFIFO Depth = 6 max packets
>>>>>>>
>>>>>>> Test Case | Data Size | AVG tput (in MB/s)
>>>>>>> -------------------------------------------
>>>>>>> Sequential|1 GB x     |
>>>>>>> Read      |9 loops    | 287.35
>>>>>>>           |           | 304.94
>>>>>>>             |           | 289.64
>>>>>>>             |           | 293.61
>>>>>> I remember getting close to 400MiB/sec with Intel platforms without
>>>>>> resizing FIFOs and I'm sure the FIFO size was set to 2x1024,
>>>>>> though my
>>>>>> memory could be failing.
>>>>>>
>>>>>> Then again, I never ran with CrystalDiskMark, I was using my own tool
>>>>>> (it's somewhere in github. If you care, I can look up the URL).
>>>>>>
>>>>>>> We also have internal numbers which have shown similar
>>>>>>> improvements as
>>>>>>> well.  Those are over networking/tethering interfaces, so testing
>>>>>>> IPERF
>>>>>>> loopback over TCP/UDP.
>>>>>> loopback iperf? That would skip the wire, no?
>>>>>>
>>>>>>>>> size of 2 and TX threshold of 1, this would really be not
>>>>>>>>> beneficial to
>>>>>>>>> us, because we can only change the TX threshold to 2 at max,
>>>>>>>>> and at
>>>>>>>>> least in my observations, once we have to go out to system
>>>>>>>>> memory to
>>>>>>>>> fetch the next data packet, that latency takes enough time for the
>>>>>>>>> controller to end the current burst.
>>>>>>>> What I noticed with g_mass_storage is that we can amortize the
>>>>>>>> cost of
>>>>>>>> fetching data from memory, with a deeper request queue. Whenever I
>>>>>>>> test(ed) g_mass_storage, I was doing so with 250 requests. And
>>>>>>>> that was
>>>>>>>> enough to give me very good performance. Never had to poke at TX
>>>>>>>> FIFO
>>>>>>>> resizing. Did you try something like this too?
>>>>>>>>
>>>>>>>> I feel that allocating more requests is a far simpler and more
>>>>>>>> generic
>>>>>>>> method that changing FIFO sizes :)
>>>>>>>>
>>>>>>> I wish I had a USB bus trace handy to show you, which would make it
>>>>>>> very
>>>>>>> clear how the USB bus is currently utilized with TXFIFO size 2 vs
>>>>>>> 6.  So
>>>>>>> by increasing the number of USB requests, that will help if there
>>>>>>> was a
>>>>>>> bottleneck at the SW level where the application/function driver
>>>>>>> utilizing the DWC3 was submitting data much faster than the HW was
>>>>>>> processing them.
>>>>>>>
>>>>>>> So yes, this method of increasing the # of USB reqs will definitely
>>>>>>> help
>>>>>>> with situations such as HSUSB or in SSUSB when EP bursting isn't
>>>>>>> used.
>>>>>>> The TXFIFO resize comes into play for SSUSB, which utilizes endpoint
>>>>>>> bursting.
>>>>>> Hmm, that's not what I remember. Perhaps the TRB cache size plays a
>>>>>> role
>>>>>> here too. I have clear memories of testing this very scenario of
>>>>>> bursting (using g_mass_storage at the time) because I was curious
>>>>>> about
>>>>>> it. Back then, my tests showed no difference in behavior.
>>>>>>
>>>>>> It could be nice if Heikki could test Intel parts with and without
>>>>>> your
>>>>>> changes on g_mass_storage with 250 requests.
>>>>> Andy, you have a system at hand that has the DWC3 block enabled,
>>>>> right? Can you help out here?
>>>> I'm not sure if i will have time soon, I Cc'ed to Ferry who has a few
>>>> more test cases (I have only one or two) and maybe can help. But I'll
>>>> keep this in mind.
>>> I just tested on 5.13.0-rc4 on Intel Edison (x86_64). All 5 patches
>>> apply. Switching between host/gadget works, no connections dropping, no
>>> errors in dmesg.
>>>
>>> In host mode I connect a smsc9504 eth+4p hub. In gadget mode I have
>>> composite device created from configfs with gser / eem / mass_storage /
>>> uac2.
>>>
>>> Tested with iperf3 performance in host (93.6Mbits/sec) and gadget
>>> (207Mbits/sec) mode. Compared to v5.10.41 without patches host
>>> (93.4Mbits/sec) and gadget (198Mbits/sec).
>>>
>>> Gadget seems to be a little faster with the patches, but that might also
>>> be caused  by something else, on v5.10.41 I see the bitrate bouncing
>>> between 207 and 199.
>>>
>>> I saw a mention to test iperf3 to self (loopback). 3.09 Gbits/sec. With
>>> v5.10.41 3.07Gbits/sec. Not bad for a 500MHz device.
>>>
>>> With gnome-disks I did a read access benchmark 35.4MB/s, with v5.10.41
>>> 34.7MB/s. This might be limited by Edison's internal eMMC speed (when
>>> booting U-Boot reads the kernel with 21.4 MiB/s).
>>>
>> Hi Ferry,
>>
>> Thanks for the testing.  Just to double check, did you also enable the
>> property, which enabled the TXFIFO resize feature on the platform?  For
>> example, for the QCOM SM8150 platform, we're adding the following to our
>> device tree node:
>>
>> tx-fifo-resize
>>
>> If not, then your results at least confirms that w/o the property
>> present, the changes won't break anything :).  Thanks again for the
>> initial testing!
> 
> No I didn't. Afaik we don't have a devicetree property to set.
> 
> But I'd be happy to test that as well. But where to set the property?
> 
> dwc3_pci_mrfld_properties[] in dwc3-pci?
> 
Hi Ferry,

Not too sure which DWC3 driver is used for the Intel platform, but I
believe that should be the one. (if that's what is normally used)  We'd
just need to add an entry w/ the below:

PROPERTY_ENTRY_BOOL("tx-fifo-resize")

Thanks
Wesley Cheng

>> Thanks
>> Wesley Cheng
>>
>>>>>>> Now with endpoint bursting, if the function notifies the host that
>>>>>>> bursting is supported, when the host sends the ACK for the Data
>>>>>>> Packet,
>>>>>>> it should have a NumP value equal to the bMaxBurst reported in
>>>>>>> the EP
>>>>>> Yes and no. Looking back at the history, we used to configure NUMP
>>>>>> based
>>>>>> on bMaxBurst, but it was changed later in commit
>>>>>> 4e99472bc10bda9906526d725ff6d5f27b4ddca1 by yours truly because of a
>>>>>> problem reported by John Youn.
>>>>>>
>>>>>> And now we've come full circle. Because even if I believe more
>>>>>> requests
>>>>>> are enough for bursting, NUMP is limited by the RxFIFO size. This
>>>>>> ends
>>>>>> up supporting your claim that we need RxFIFO resizing if we want to
>>>>>> squeeze more throughput out of the controller.
>>>>>>
>>>>>> However, note that this is about RxFIFO size, not TxFIFO size. In
>>>>>> fact,
>>>>>> looking at Table 8-13 of USB 3.1 r1.0, we read the following about
>>>>>> NumP
>>>>>> (emphasis is mine):
>>>>>>
>>>>>>         "Number of Packets (NumP). This field is used to indicate the
>>>>>>         number of Data Packet buffers that the **receiver** can
>>>>>>         accept. The value in this field shall be less than or
>>>>>> equal to
>>>>>>         the maximum burst size supported by the endpoint as
>>>>>> determined
>>>>>>         by the value in the bMaxBurst field in the Endpoint Companion
>>>>>>         Descriptor (refer to Section 9.6.7)."
>>>>>>
>>>>>> So, NumP is for the receiver, not the transmitter. Could you clarify
>>>>>> what you mean here?
>>>>>>
>>>>>> /me keeps reading
>>>>>>
>>>>>> Hmm, table 8-15 tries to clarify:
>>>>>>
>>>>>>         "Number of Packets (NumP).
>>>>>>
>>>>>>         For an OUT endpoint, refer to Table 8-13 for the
>>>>>> description of
>>>>>>         this field.
>>>>>>
>>>>>>         For an IN endpoint this field is set by the endpoint to the
>>>>>>         number of packets it can transmit when the host resumes
>>>>>>         transactions to it. This field shall not have a value greater
>>>>>>         than the maximum burst size supported by the endpoint as
>>>>>>         indicated by the value in the bMaxBurst field in the Endpoint
>>>>>>         Companion Descriptor. Note that the value reported in this
>>>>>> field
>>>>>>         may be treated by the host as informative only."
>>>>>>
>>>>>> However, if I remember correctly (please verify dwc3 databook),
>>>>>> NUMP in
>>>>>> DCFG was only for receive buffers. Thin, John, how does dwc3 compute
>>>>>> NumP for TX/IN endpoints? Is that computed as a function of
>>>>>> DCFG.NUMP or
>>>>>> TxFIFO size?
>>>>>>
>>>>>>> desc.  If we have a TXFIFO size of 2, then normally what I have
>>>>>>> seen is
>>>>>>> that after 2 data packets, the device issues a NRDY.  So then we'd
>>>>>>> need
>>>>>>> to send an ERDY once data is available within the FIFO, and the same
>>>>>>> sequence happens until the USB request is complete.  With this
>>>>>>> constant
>>>>>>> NRDY/ERDY handshake going on, you actually see that the bus is under
>>>>>>> utilized.  When we increase an EP's FIFO size, then you'll see
>>>>>>> constant
>>>>>>> bursts for a request, until the request is done, or if the host
>>>>>>> runs out
>>>>>>> of RXFIFO. (ie no interruption [on the USB protocol level] during
>>>>>>> USB
>>>>>>> request data transfer)
>>>>>> Unfortunately I don't have access to a USB sniffer anymore :-(
>>>>>>
>>>>>>>>>>>> Good points.
>>>>>>>>>>>>
>>>>>>>>>>>> Wesley, what kind of testing have you done on this on
>>>>>>>>>>>> different devices?
>>>>>>>>>>>>
>>>>>>>>>>> As mentioned above, these changes are currently present on end
>>>>>>>>>>> user
>>>>>>>>>>> devices for the past few years, so its been through a lot of
>>>>>>>>>>> testing :).
>>>>>>>>>> all with the same gadget driver. Also, who uses USB on android
>>>>>>>>>> devices
>>>>>>>>>> these days? Most of the data transfer goes via WiFi or
>>>>>>>>>> Bluetooth, anyway
>>>>>>>>>> :-)
>>>>>>>>>>
>>>>>>>>>> I guess only developers are using USB during development to
>>>>>>>>>> flash dev
>>>>>>>>>> images heh.
>>>>>>>>>>
>>>>>>>>> I used to be a customer facing engineer, so honestly I did see
>>>>>>>>> some
>>>>>>>>> really interesting and crazy designs.  Again, we do have
>>>>>>>>> non-Android
>>>>>>>>> products that use the same code, and it has been working in there
>>>>>>>>> for a
>>>>>>>>> few years as well.  The TXFIFO sizing really has helped with
>>>>>>>>> multimedia
>>>>>>>>> use cases, which use isoc endpoints, since esp. in those lower
>>>>>>>>> end CPU
>>>>>>>>> chips where latencies across the system are much larger, and a
>>>>>>>>> missed
>>>>>>>>> ISOC interval leads to a pop in your ear.
>>>>>>>> This is good background information. Thanks for bringing this
>>>>>>>> up. Admitedly, we still have ISOC issues with dwc3. I'm
>>>>>>>> interested in
>>>>>>>> knowing if a deeper request queue would also help here.
>>>>>>>>
>>>>>>>> Remember dwc3 can accomodate 255 requests + link for each
>>>>>>>> endpoint. If
>>>>>>>> our gadget driver uses a low number of requests, we're never really
>>>>>>>> using the TRB ring in our benefit.
>>>>>>>>
>>>>>>> We're actually using both a deeper USB request queue + TX fifo
>>>>>>> resizing. :).
>>>>>> okay, great. Let's see what John and/or Thinh respond WRT dwc3 TX
>>>>>> Burst
>>>>>> behavior.
>>>>> -- 
>>>>> heikki
>>>>

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
