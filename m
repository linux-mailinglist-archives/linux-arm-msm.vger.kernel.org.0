Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1D173A5106
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Jun 2021 23:39:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229985AbhFLVlF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 12 Jun 2021 17:41:05 -0400
Received: from mail-pf1-f178.google.com ([209.85.210.178]:45874 "EHLO
        mail-pf1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229753AbhFLVlE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 12 Jun 2021 17:41:04 -0400
Received: by mail-pf1-f178.google.com with SMTP id d16so7431157pfn.12;
        Sat, 12 Jun 2021 14:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dpnGFzCkmQY2IFt0MuPdTzsmGVILHZIfMAUtgXaArh4=;
        b=QxC7WfgHeQ6msam5JeTgIMRFG1ErpDFiPGaq4cMGoIKdlBA4NZfyGaFJIA/Leg4IMn
         bduBajOF9ZKCxqlQTll/XdLwzhfLSEfPU0KlZ95Fz9Wmp1rM7al/LcQbIxj559syJSid
         Yye56lXOOR+EAmmx9HTTXKFNJYBqF8TPFGpcc+EAe0POiF0/cnCfJpjZtR6qOeeilI7J
         HWWLc7DljDcIY8ydrbA3xdO6PylCHcw4PGhQarbmTcM+ZJnwkIyiqm5Z3GHoNYE60xHF
         ONut0g3E/5sYxOoomxkDxSEinY1tpBUPXrE3QcgwvogBSeYab/++Wk/cIZG96dU97704
         ycEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dpnGFzCkmQY2IFt0MuPdTzsmGVILHZIfMAUtgXaArh4=;
        b=nhz14c94/TRcYw9V3PYmGucVog6huTUqt6tvrGKJCJsXgOaRa/0pYZRuAVSJbyUAHZ
         hVKhqPUxPcxSlTlL3qW2GvpILZA0gE+C0ernkyre04e7lep2uF7gg5FeX9w3SO1EfUWU
         6/AZnFM1ToddEXzcw2IlanUEiYGP1oRbRGF074T/9f6rwl4CSPBjxP5mj8yqQVsWaPXb
         IYWA5AueLEdOB0gy4fPjdRFuPfYfuY6pTXUs3Ai8Vadin36hAZjxaBnqAnLpmAb9y3rl
         SG2MJswW9d/auLRQusAIrhHr9eAqbaAz/OmahBB3Tz5RCN+JxdEUIncloXitz78QQmf1
         qSpw==
X-Gm-Message-State: AOAM5331Sn7HuW+orUVn76VG/6dZKHpdgAY5PdqnD45XMzj4KaaX4ynh
        XrgoTZ2AlI7vI1aqI+gR21hMAAGK6JXRKrTukfE=
X-Google-Smtp-Source: ABdhPJwWsj6VQ8FqltXtW6lJVAHgsJsar8XVfLt10hvx32/G5KwjEV/mRlj9YCqQwAlUMreqkyMkcxZWxnPuqL4DG2w=
X-Received: by 2002:a63:4145:: with SMTP id o66mr10115328pga.4.1623533884551;
 Sat, 12 Jun 2021 14:38:04 -0700 (PDT)
MIME-Version: 1.0
References: <1621410561-32762-1-git-send-email-wcheng@codeaurora.org>
 <YLoUiO8tpRpmvcyU@kroah.com> <87k0n9btnb.fsf@kernel.org> <YLo6W5sKaXvy51eW@kroah.com>
 <c2daab34-1b25-7ee3-e203-a414c1e486d5@codeaurora.org> <874ke62i0v.fsf@kernel.org>
 <e5f231ca-6807-bcea-29c2-ab3926057310@codeaurora.org> <8735to29tt.fsf@kernel.org>
 <f1d57fca-3ac1-d8c8-bd23-cf525b366573@codeaurora.org> <87tum4zhc9.fsf@kernel.org>
 <YMNhnCBq2lb7oUZK@kuha.fi.intel.com> <CAHp75VeXTekvj88n2-v+tVUkDvR6rHtuHm3XuTGTrgOyU9wC7Q@mail.gmail.com>
 <33c6cecf-3dce-8c4f-2be2-55cc3c6c6830@gmail.com>
In-Reply-To: <33c6cecf-3dce-8c4f-2be2-55cc3c6c6830@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 13 Jun 2021 00:37:47 +0300
Message-ID: <CAHp75VdaRxDRAU0qLHz-EP0yV8JnRzW_bxr+tYbv-JZM=Sq4zg@mail.gmail.com>
Subject: Re: [PATCH v9 0/5] Re-introduce TX FIFO resize for larger EP bursting
To:     Ferry Toth <fntoth@gmail.com>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wesley Cheng <wcheng@codeaurora.org>,
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
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Jun 13, 2021 at 12:27 AM Ferry Toth <fntoth@gmail.com> wrote:
> Op 11-06-2021 om 15:21 schreef Andy Shevchenko:
> > On Fri, Jun 11, 2021 at 4:14 PM Heikki Krogerus
> > <heikki.krogerus@linux.intel.com> wrote:
> >> On Fri, Jun 11, 2021 at 04:00:38PM +0300, Felipe Balbi wrote:
> >>> Wesley Cheng <wcheng@codeaurora.org> writes:

...

> >>>>   - USB Speed = Super-Speed
> >>>>   - Function Driver: Mass Storage (w/ ramdisk)
> >>>>   - Test Application: CrystalDiskMark
> >>>>
> >>>> Results:
> >>>>
> >>>> TXFIFO Depth = 3 max packets
> >>>>
> >>>> Test Case | Data Size | AVG tput (in MB/s)
> >>>> -------------------------------------------
> >>>> Sequential|1 GB x     |
> >>>> Read      |9 loops    | 193.60
> >>>>            |           | 195.86
> >>>>            |           | 184.77
> >>>>            |           | 193.60
> >>>> -------------------------------------------
> >>>>
> >>>> TXFIFO Depth = 6 max packets
> >>>>
> >>>> Test Case | Data Size | AVG tput (in MB/s)
> >>>> -------------------------------------------
> >>>> Sequential|1 GB x     |
> >>>> Read      |9 loops    | 287.35
> >>>>          |           | 304.94
> >>>>            |           | 289.64
> >>>>            |           | 293.61
> >>> I remember getting close to 400MiB/sec with Intel platforms without
> >>> resizing FIFOs and I'm sure the FIFO size was set to 2x1024, though my
> >>> memory could be failing.
> >>>
> >>> Then again, I never ran with CrystalDiskMark, I was using my own tool
> >>> (it's somewhere in github. If you care, I can look up the URL).
> >>>
> >>>> We also have internal numbers which have shown similar improvements as
> >>>> well.  Those are over networking/tethering interfaces, so testing IPERF
> >>>> loopback over TCP/UDP.
> >>> loopback iperf? That would skip the wire, no?
> >>>
> >>>>>> size of 2 and TX threshold of 1, this would really be not beneficial to
> >>>>>> us, because we can only change the TX threshold to 2 at max, and at
> >>>>>> least in my observations, once we have to go out to system memory to
> >>>>>> fetch the next data packet, that latency takes enough time for the
> >>>>>> controller to end the current burst.
> >>>>> What I noticed with g_mass_storage is that we can amortize the cost of
> >>>>> fetching data from memory, with a deeper request queue. Whenever I
> >>>>> test(ed) g_mass_storage, I was doing so with 250 requests. And that was
> >>>>> enough to give me very good performance. Never had to poke at TX FIFO
> >>>>> resizing. Did you try something like this too?
> >>>>>
> >>>>> I feel that allocating more requests is a far simpler and more generic
> >>>>> method that changing FIFO sizes :)
> >>>>>
> >>>> I wish I had a USB bus trace handy to show you, which would make it very
> >>>> clear how the USB bus is currently utilized with TXFIFO size 2 vs 6.  So
> >>>> by increasing the number of USB requests, that will help if there was a
> >>>> bottleneck at the SW level where the application/function driver
> >>>> utilizing the DWC3 was submitting data much faster than the HW was
> >>>> processing them.
> >>>>
> >>>> So yes, this method of increasing the # of USB reqs will definitely help
> >>>> with situations such as HSUSB or in SSUSB when EP bursting isn't used.
> >>>> The TXFIFO resize comes into play for SSUSB, which utilizes endpoint
> >>>> bursting.
> >>> Hmm, that's not what I remember. Perhaps the TRB cache size plays a role
> >>> here too. I have clear memories of testing this very scenario of
> >>> bursting (using g_mass_storage at the time) because I was curious about
> >>> it. Back then, my tests showed no difference in behavior.
> >>>
> >>> It could be nice if Heikki could test Intel parts with and without your
> >>> changes on g_mass_storage with 250 requests.
> >> Andy, you have a system at hand that has the DWC3 block enabled,
> >> right? Can you help out here?
> > I'm not sure if i will have time soon, I Cc'ed to Ferry who has a few
> > more test cases (I have only one or two) and maybe can help. But I'll
> > keep this in mind.
>
> I just tested on 5.13.0-rc4 on Intel Edison (x86_64). All 5 patches
> apply. Switching between host/gadget works, no connections dropping, no
> errors in dmesg.
>
> In host mode I connect a smsc9504 eth+4p hub. In gadget mode I have
> composite device created from configfs with gser / eem / mass_storage /
> uac2.
>
> Tested with iperf3 performance in host (93.6Mbits/sec) and gadget
> (207Mbits/sec) mode. Compared to v5.10.41 without patches host
> (93.4Mbits/sec) and gadget (198Mbits/sec).
>
> Gadget seems to be a little faster with the patches, but that might also
> be caused  by something else, on v5.10.41 I see the bitrate bouncing
> between 207 and 199.
>
> I saw a mention to test iperf3 to self (loopback). 3.09 Gbits/sec. With
> v5.10.41 3.07Gbits/sec. Not bad for a 500MHz device.
>
> With gnome-disks I did a read access benchmark 35.4MB/s, with v5.10.41
> 34.7MB/s. This might be limited by Edison's internal eMMC speed (when
> booting U-Boot reads the kernel with 21.4 MiB/s).

Ferry, thank you very much for this information and testing efforts!

> >>>> Now with endpoint bursting, if the function notifies the host that
> >>>> bursting is supported, when the host sends the ACK for the Data Packet,
> >>>> it should have a NumP value equal to the bMaxBurst reported in the EP
> >>> Yes and no. Looking back at the history, we used to configure NUMP based
> >>> on bMaxBurst, but it was changed later in commit
> >>> 4e99472bc10bda9906526d725ff6d5f27b4ddca1 by yours truly because of a
> >>> problem reported by John Youn.
> >>>
> >>> And now we've come full circle. Because even if I believe more requests
> >>> are enough for bursting, NUMP is limited by the RxFIFO size. This ends
> >>> up supporting your claim that we need RxFIFO resizing if we want to
> >>> squeeze more throughput out of the controller.
> >>>
> >>> However, note that this is about RxFIFO size, not TxFIFO size. In fact,
> >>> looking at Table 8-13 of USB 3.1 r1.0, we read the following about NumP
> >>> (emphasis is mine):
> >>>
> >>>        "Number of Packets (NumP). This field is used to indicate the
> >>>        number of Data Packet buffers that the **receiver** can
> >>>        accept. The value in this field shall be less than or equal to
> >>>        the maximum burst size supported by the endpoint as determined
> >>>        by the value in the bMaxBurst field in the Endpoint Companion
> >>>        Descriptor (refer to Section 9.6.7)."
> >>>
> >>> So, NumP is for the receiver, not the transmitter. Could you clarify
> >>> what you mean here?
> >>>
> >>> /me keeps reading
> >>>
> >>> Hmm, table 8-15 tries to clarify:
> >>>
> >>>        "Number of Packets (NumP).
> >>>
> >>>        For an OUT endpoint, refer to Table 8-13 for the description of
> >>>        this field.
> >>>
> >>>        For an IN endpoint this field is set by the endpoint to the
> >>>        number of packets it can transmit when the host resumes
> >>>        transactions to it. This field shall not have a value greater
> >>>        than the maximum burst size supported by the endpoint as
> >>>        indicated by the value in the bMaxBurst field in the Endpoint
> >>>        Companion Descriptor. Note that the value reported in this field
> >>>        may be treated by the host as informative only."
> >>>
> >>> However, if I remember correctly (please verify dwc3 databook), NUMP in
> >>> DCFG was only for receive buffers. Thin, John, how does dwc3 compute
> >>> NumP for TX/IN endpoints? Is that computed as a function of DCFG.NUMP or
> >>> TxFIFO size?
> >>>
> >>>> desc.  If we have a TXFIFO size of 2, then normally what I have seen is
> >>>> that after 2 data packets, the device issues a NRDY.  So then we'd need
> >>>> to send an ERDY once data is available within the FIFO, and the same
> >>>> sequence happens until the USB request is complete.  With this constant
> >>>> NRDY/ERDY handshake going on, you actually see that the bus is under
> >>>> utilized.  When we increase an EP's FIFO size, then you'll see constant
> >>>> bursts for a request, until the request is done, or if the host runs out
> >>>> of RXFIFO. (ie no interruption [on the USB protocol level] during USB
> >>>> request data transfer)
> >>> Unfortunately I don't have access to a USB sniffer anymore :-(
> >>>
> >>>>>>>>> Good points.
> >>>>>>>>>
> >>>>>>>>> Wesley, what kind of testing have you done on this on different devices?
> >>>>>>>>>
> >>>>>>>> As mentioned above, these changes are currently present on end user
> >>>>>>>> devices for the past few years, so its been through a lot of testing :).
> >>>>>>> all with the same gadget driver. Also, who uses USB on android devices
> >>>>>>> these days? Most of the data transfer goes via WiFi or Bluetooth, anyway
> >>>>>>> :-)
> >>>>>>>
> >>>>>>> I guess only developers are using USB during development to flash dev
> >>>>>>> images heh.
> >>>>>>>
> >>>>>> I used to be a customer facing engineer, so honestly I did see some
> >>>>>> really interesting and crazy designs.  Again, we do have non-Android
> >>>>>> products that use the same code, and it has been working in there for a
> >>>>>> few years as well.  The TXFIFO sizing really has helped with multimedia
> >>>>>> use cases, which use isoc endpoints, since esp. in those lower end CPU
> >>>>>> chips where latencies across the system are much larger, and a missed
> >>>>>> ISOC interval leads to a pop in your ear.
> >>>>> This is good background information. Thanks for bringing this
> >>>>> up. Admitedly, we still have ISOC issues with dwc3. I'm interested in
> >>>>> knowing if a deeper request queue would also help here.
> >>>>>
> >>>>> Remember dwc3 can accomodate 255 requests + link for each endpoint. If
> >>>>> our gadget driver uses a low number of requests, we're never really
> >>>>> using the TRB ring in our benefit.
> >>>>>
> >>>> We're actually using both a deeper USB request queue + TX fifo resizing. :).
> >>> okay, great. Let's see what John and/or Thinh respond WRT dwc3 TX Burst
> >>> behavior.



-- 
With Best Regards,
Andy Shevchenko
