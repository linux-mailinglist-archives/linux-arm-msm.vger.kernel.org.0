Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96DDF3ABD2C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jun 2021 21:54:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230411AbhFQT4w (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Jun 2021 15:56:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230039AbhFQT4v (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Jun 2021 15:56:51 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98430C061574;
        Thu, 17 Jun 2021 12:54:42 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id gt18so11928121ejc.11;
        Thu, 17 Jun 2021 12:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=72RcK3nPF8Da9P2xC2uiuHdV/pjNmiyx8IfYF3SMe3g=;
        b=sssa6I2l9WowmXixBga1G5rOIbMIIn6PB2sgdwq47mYp+m535/1obtNqlKoMgkwfN2
         qtW2umUdDjsIF3c5w4XOp0xKQUFm5/ZEh/Dlrnbsn+ssfJ7JPc+g9wxg8MoJqyVpRWHI
         piAmha2LjOK+rRcOLy2ctzMX5HRNFy59PuolTuSQp5PftIY0VZXMSojjzRTFua0Xv8XS
         cTYc7tZieAwns8dWANheTxDmYsAbp0YlTkmz5Wx+pyWpAsiNrd0f4VBn3xH1NRKaPzKq
         9TL58ynCBrkU33YuLl/DQsBYA0aIb5YIUhb3YK7yhVvkXh1xppEeqVsnGIPCLP36MPpR
         VmwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=72RcK3nPF8Da9P2xC2uiuHdV/pjNmiyx8IfYF3SMe3g=;
        b=EVPw9AhCptLolUh9SK5mLr1+LxUbLU4ayzpcmAEsZjteHqruOsNw2ft8+JNab1snnG
         xJ1E7wlV1cyXczC7Nrp1EmNULWSVVqfukp0MJ3uV9diPiBUIgez12N7h/bQP5SNjzGqW
         399f5skHJ/wrclm/WFde8McoY++Qm6RSN0G/OXgILPVAn5f9GJbpTzJw4G8Q3Co+0IV5
         E1ItyfNQuviTUkLDe3yoOFg0KWqV3AAlf5VfB/ptNpAly8J9w4AMnwpK6MtLQc10xyOQ
         BpBDMMn3zAhoHqDBpSDHnIBBqRuYfgaldRFa3k2VsdgvbVwJssYva9j8Mz9R85IvuBZU
         G4bg==
X-Gm-Message-State: AOAM531FlE+BtDj2t7Ll/9YCetV6ytN1ImKgu6WLPzkQU85cRqORbAVe
        RrB2ZhOfrAAYu+0404sikMk=
X-Google-Smtp-Source: ABdhPJxJBxke9eiB//9xmoWFKrsrP+PoZD6ywYPKPHib/9v4a4vnT7EMKab4LjmurzVFf9HEjLBfKA==
X-Received: by 2002:a17:906:24db:: with SMTP id f27mr7132190ejb.321.1623959680967;
        Thu, 17 Jun 2021 12:54:40 -0700 (PDT)
Received: from ?IPv6:2001:981:6fec:1:fd94:32cc:b6d1:46c4? ([2001:981:6fec:1:fd94:32cc:b6d1:46c4])
        by smtp.gmail.com with ESMTPSA id bx11sm3892241ejc.122.2021.06.17.12.54.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jun 2021 12:54:40 -0700 (PDT)
Subject: Re: [PATCH v9 0/5] Re-introduce TX FIFO resize for larger EP bursting
To:     Wesley Cheng <wcheng@codeaurora.org>,
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
 <0e9373ec-931b-f96a-b2c9-dbd532a823a6@codeaurora.org>
 <f1e7939d-f679-9229-c1b2-27e8087bf52a@gmail.com>
 <bab42b23-d638-54d6-d34a-c9faa887741f@codeaurora.org>
 <fe834dbf-786a-2996-5c4b-1eac92e3ed18@gmail.com>
 <76cb9339-c558-d11b-2cbd-41688c30ba70@codeaurora.org>
From:   Ferry Toth <fntoth@gmail.com>
Message-ID: <b872fd98-102b-09ef-d43e-0a6aa2a40696@gmail.com>
Date:   Thu, 17 Jun 2021 21:54:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <76cb9339-c558-d11b-2cbd-41688c30ba70@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi

Op 17-06-2021 om 10:30 schreef Wesley Cheng:
>
> On 6/17/2021 12:47 AM, Ferry Toth wrote:
>> Hi
>>
>> Op 17-06-2021 om 06:25 schreef Wesley Cheng:
>>> On 6/15/2021 12:53 PM, Ferry Toth wrote:
>>>> Hi
>>>>
>>>> Op 15-06-2021 om 06:22 schreef Wesley Cheng:
>>>>> On 6/14/2021 12:30 PM, Ferry Toth wrote:
>>>>>> Op 14-06-2021 om 20:58 schreef Wesley Cheng:
>>>>>>> On 6/12/2021 2:27 PM, Ferry Toth wrote:
>>>>>>>> Hi
>>>>>>>>
>>>>>>>> Op 11-06-2021 om 15:21 schreef Andy Shevchenko:
>>>>>>>>> On Fri, Jun 11, 2021 at 4:14 PM Heikki Krogerus
>>>>>>>>> <heikki.krogerus@linux.intel.com> wrote:
>>>>>>>>>> On Fri, Jun 11, 2021 at 04:00:38PM +0300, Felipe Balbi wrote:
>>>>>>>>>>> Hi,
>>>>>>>>>>>
>>>>>>>>>>> Wesley Cheng <wcheng@codeaurora.org> writes:
>>>>>>>>>>>>>>>>>> to be honest, I don't think these should go in (apart from
>>>>>>>>>>>>>>>>>> the build
>>>>>>>>>>>>>>>>>> failure) because it's likely to break instantiations of the
>>>>>>>>>>>>>>>>>> core with
>>>>>>>>>>>>>>>>>> differing FIFO sizes. Some instantiations even have some
>>>>>>>>>>>>>>>>>> endpoints with
>>>>>>>>>>>>>>>>>> dedicated functionality that requires the default FIFO size
>>>>>>>>>>>>>>>>>> configured
>>>>>>>>>>>>>>>>>> during coreConsultant instantiation. I know of at OMAP5 and
>>>>>>>>>>>>>>>>>> some Intel
>>>>>>>>>>>>>>>>>> implementations which have dedicated endpoints for processor
>>>>>>>>>>>>>>>>>> tracing.
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>> With OMAP5, these endpoints are configured at the top of the
>>>>>>>>>>>>>>>>>> available
>>>>>>>>>>>>>>>>>> endpoints, which means that if a gadget driver gets loaded
>>>>>>>>>>>>>>>>>> and takes
>>>>>>>>>>>>>>>>>> over most of the FIFO space because of this resizing,
>>>>>>>>>>>>>>>>>> processor tracing
>>>>>>>>>>>>>>>>>> will have a hard time running. That being said, processor
>>>>>>>>>>>>>>>>>> tracing isn't
>>>>>>>>>>>>>>>>>> supported in upstream at this moment.
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> I agree that the application of this logic may differ between
>>>>>>>>>>>>>>>> vendors,
>>>>>>>>>>>>>>>> hence why I wanted to keep this controllable by the DT
>>>>>>>>>>>>>>>> property, so that
>>>>>>>>>>>>>>>> for those which do not support this use case can leave it
>>>>>>>>>>>>>>>> disabled.  The
>>>>>>>>>>>>>>>> logic is there to ensure that for a given USB configuration,
>>>>>>>>>>>>>>>> for each EP
>>>>>>>>>>>>>>>> it would have at least 1 TX FIFO.  For USB configurations
>>>>>>>>>>>>>>>> which
>>>>>>>>>>>>>>>> don't
>>>>>>>>>>>>>>>> utilize all available IN EPs, it would allow re-allocation of
>>>>>>>>>>>>>>>> internal
>>>>>>>>>>>>>>>> memory to EPs which will actually be in use.
>>>>>>>>>>>>>>> The feature ends up being all-or-nothing, then :-) It sounds
>>>>>>>>>>>>>>> like we can
>>>>>>>>>>>>>>> be a little nicer in this regard.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Don't get me wrong, I think once those features become available
>>>>>>>>>>>>>> upstream, we can improve the logic.  From what I remember when
>>>>>>>>>>>>>> looking
>>>>>>>>>>>>> sure, I support that. But I want to make sure the first cut isn't
>>>>>>>>>>>>> likely
>>>>>>>>>>>>> to break things left and right :)
>>>>>>>>>>>>>
>>>>>>>>>>>>> Hence, let's at least get more testing.
>>>>>>>>>>>>>
>>>>>>>>>>>> Sure, I'd hope that the other users of DWC3 will also see some
>>>>>>>>>>>> pretty
>>>>>>>>>>>> big improvements on the TX path with this.
>>>>>>>>>>> fingers crossed
>>>>>>>>>>>
>>>>>>>>>>>>>> at Andy Shevchenko's Github, the Intel tracer downstream changes
>>>>>>>>>>>>>> were
>>>>>>>>>>>>>> just to remove physical EP1 and 2 from the DWC3 endpoint list.
>>>>>>>>>>>>>> If that
>>>>>>>>>>>>> right, that's the reason why we introduced the endpoint feature
>>>>>>>>>>>>> flags. The end goal was that the UDC would be able to have custom
>>>>>>>>>>>>> feature flags paired with ->validate_endpoint() or whatever
>>>>>>>>>>>>> before
>>>>>>>>>>>>> allowing it to be enabled. Then the UDC driver could tell UDC
>>>>>>>>>>>>> core to
>>>>>>>>>>>>> skip that endpoint on that particular platform without
>>>>>>>>>>>>> interefering with
>>>>>>>>>>>>> everything else.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Of course, we still need to figure out a way to abstract the
>>>>>>>>>>>>> different
>>>>>>>>>>>>> dwc3 instantiations.
>>>>>>>>>>>>>
>>>>>>>>>>>>>> was the change which ended up upstream for the Intel tracer
>>>>>>>>>>>>>> then we
>>>>>>>>>>>>>> could improve the logic to avoid re-sizing those particular EPs.
>>>>>>>>>>>>> The problem then, just as I mentioned in the previous paragraph,
>>>>>>>>>>>>> will be
>>>>>>>>>>>>> coming up with a solution that's elegant and works for all
>>>>>>>>>>>>> different
>>>>>>>>>>>>> instantiations of dwc3 (or musb, cdns3, etc).
>>>>>>>>>>>>>
>>>>>>>>>>>> Well, at least for the TX FIFO resizing logic, we'd only be
>>>>>>>>>>>> needing to
>>>>>>>>>>>> focus on the DWC3 implementation.
>>>>>>>>>>>>
>>>>>>>>>>>> You bring up another good topic that I'll eventually needing to be
>>>>>>>>>>>> taking a look at, which is a nice way we can handle vendor
>>>>>>>>>>>> specific
>>>>>>>>>>>> endpoints and how they can co-exist with other "normal"
>>>>>>>>>>>> endpoints.  We
>>>>>>>>>>>> have a few special HW eps as well, which we try to maintain
>>>>>>>>>>>> separately
>>>>>>>>>>>> in our DWC3 vendor driver, but it isn't the most convenient, or
>>>>>>>>>>>> most
>>>>>>>>>>>> pretty method :).
>>>>>>>>>>> Awesome, as mentioned, the endpoint feature flags were added
>>>>>>>>>>> exactly to
>>>>>>>>>>> allow for these vendor-specific features :-)
>>>>>>>>>>>
>>>>>>>>>>> I'm more than happy to help testing now that I finally got our
>>>>>>>>>>> SM8150
>>>>>>>>>>> Surface Duo device tree accepted by Bjorn ;-)
>>>>>>>>>>>
>>>>>>>>>>>>>> However, I'm not sure how the changes would look like in the
>>>>>>>>>>>>>> end,
>>>>>>>>>>>>>> so I
>>>>>>>>>>>>>> would like to wait later down the line to include that :).
>>>>>>>>>>>>> Fair enough, I agree. Can we get some more testing of $subject,
>>>>>>>>>>>>> though?
>>>>>>>>>>>>> Did you test $subject with upstream too? Which gadget drivers
>>>>>>>>>>>>> did you
>>>>>>>>>>>>> use? How did you test
>>>>>>>>>>>>>
>>>>>>>>>>>> The results that I included in the cover page was tested with the
>>>>>>>>>>>> pure
>>>>>>>>>>>> upstream kernel on our device.  Below was using the ConfigFS
>>>>>>>>>>>> gadget
>>>>>>>>>>>> w/ a
>>>>>>>>>>>> mass storage only composition.
>>>>>>>>>>>>
>>>>>>>>>>>> Test Parameters:
>>>>>>>>>>>>      - Platform: Qualcomm SM8150
>>>>>>>>>>>>      - bMaxBurst = 6
>>>>>>>>>>>>      - USB req size = 256kB
>>>>>>>>>>>>      - Num of USB reqs = 16
>>>>>>>>>>> do you mind testing with the regular request size (16KiB) and 250
>>>>>>>>>>> requests? I think we can even do 15 bursts in that case.
>>>>>>>>>>>
>>>>>>>>>>>>      - USB Speed = Super-Speed
>>>>>>>>>>>>      - Function Driver: Mass Storage (w/ ramdisk)
>>>>>>>>>>>>      - Test Application: CrystalDiskMark
>>>>>>>>>>>>
>>>>>>>>>>>> Results:
>>>>>>>>>>>>
>>>>>>>>>>>> TXFIFO Depth = 3 max packets
>>>>>>>>>>>>
>>>>>>>>>>>> Test Case | Data Size | AVG tput (in MB/s)
>>>>>>>>>>>> -------------------------------------------
>>>>>>>>>>>> Sequential|1 GB x     |
>>>>>>>>>>>> Read      |9 loops    | 193.60
>>>>>>>>>>>>               |           | 195.86
>>>>>>>>>>>>               |           | 184.77
>>>>>>>>>>>>               |           | 193.60
>>>>>>>>>>>> -------------------------------------------
>>>>>>>>>>>>
>>>>>>>>>>>> TXFIFO Depth = 6 max packets
>>>>>>>>>>>>
>>>>>>>>>>>> Test Case | Data Size | AVG tput (in MB/s)
>>>>>>>>>>>> -------------------------------------------
>>>>>>>>>>>> Sequential|1 GB x     |
>>>>>>>>>>>> Read      |9 loops    | 287.35
>>>>>>>>>>>>             |           | 304.94
>>>>>>>>>>>>               |           | 289.64
>>>>>>>>>>>>               |           | 293.61
>>>>>>>>>>> I remember getting close to 400MiB/sec with Intel platforms without
>>>>>>>>>>> resizing FIFOs and I'm sure the FIFO size was set to 2x1024,
>>>>>>>>>>> though my
>>>>>>>>>>> memory could be failing.
>>>>>>>>>>>
>>>>>>>>>>> Then again, I never ran with CrystalDiskMark, I was using my own
>>>>>>>>>>> tool
>>>>>>>>>>> (it's somewhere in github. If you care, I can look up the URL).
>>>>>>>>>>>
>>>>>>>>>>>> We also have internal numbers which have shown similar
>>>>>>>>>>>> improvements as
>>>>>>>>>>>> well.  Those are over networking/tethering interfaces, so testing
>>>>>>>>>>>> IPERF
>>>>>>>>>>>> loopback over TCP/UDP.
>>>>>>>>>>> loopback iperf? That would skip the wire, no?
>>>>>>>>>>>
>>>>>>>>>>>>>> size of 2 and TX threshold of 1, this would really be not
>>>>>>>>>>>>>> beneficial to
>>>>>>>>>>>>>> us, because we can only change the TX threshold to 2 at max,
>>>>>>>>>>>>>> and at
>>>>>>>>>>>>>> least in my observations, once we have to go out to system
>>>>>>>>>>>>>> memory to
>>>>>>>>>>>>>> fetch the next data packet, that latency takes enough time
>>>>>>>>>>>>>> for the
>>>>>>>>>>>>>> controller to end the current burst.
>>>>>>>>>>>>> What I noticed with g_mass_storage is that we can amortize the
>>>>>>>>>>>>> cost of
>>>>>>>>>>>>> fetching data from memory, with a deeper request queue.
>>>>>>>>>>>>> Whenever I
>>>>>>>>>>>>> test(ed) g_mass_storage, I was doing so with 250 requests. And
>>>>>>>>>>>>> that was
>>>>>>>>>>>>> enough to give me very good performance. Never had to poke at TX
>>>>>>>>>>>>> FIFO
>>>>>>>>>>>>> resizing. Did you try something like this too?
>>>>>>>>>>>>>
>>>>>>>>>>>>> I feel that allocating more requests is a far simpler and more
>>>>>>>>>>>>> generic
>>>>>>>>>>>>> method that changing FIFO sizes :)
>>>>>>>>>>>>>
>>>>>>>>>>>> I wish I had a USB bus trace handy to show you, which would
>>>>>>>>>>>> make it
>>>>>>>>>>>> very
>>>>>>>>>>>> clear how the USB bus is currently utilized with TXFIFO size 2 vs
>>>>>>>>>>>> 6.  So
>>>>>>>>>>>> by increasing the number of USB requests, that will help if there
>>>>>>>>>>>> was a
>>>>>>>>>>>> bottleneck at the SW level where the application/function driver
>>>>>>>>>>>> utilizing the DWC3 was submitting data much faster than the HW was
>>>>>>>>>>>> processing them.
>>>>>>>>>>>>
>>>>>>>>>>>> So yes, this method of increasing the # of USB reqs will
>>>>>>>>>>>> definitely
>>>>>>>>>>>> help
>>>>>>>>>>>> with situations such as HSUSB or in SSUSB when EP bursting isn't
>>>>>>>>>>>> used.
>>>>>>>>>>>> The TXFIFO resize comes into play for SSUSB, which utilizes
>>>>>>>>>>>> endpoint
>>>>>>>>>>>> bursting.
>>>>>>>>>>> Hmm, that's not what I remember. Perhaps the TRB cache size plays a
>>>>>>>>>>> role
>>>>>>>>>>> here too. I have clear memories of testing this very scenario of
>>>>>>>>>>> bursting (using g_mass_storage at the time) because I was curious
>>>>>>>>>>> about
>>>>>>>>>>> it. Back then, my tests showed no difference in behavior.
>>>>>>>>>>>
>>>>>>>>>>> It could be nice if Heikki could test Intel parts with and without
>>>>>>>>>>> your
>>>>>>>>>>> changes on g_mass_storage with 250 requests.
>>>>>>>>>> Andy, you have a system at hand that has the DWC3 block enabled,
>>>>>>>>>> right? Can you help out here?
>>>>>>>>> I'm not sure if i will have time soon, I Cc'ed to Ferry who has a few
>>>>>>>>> more test cases (I have only one or two) and maybe can help. But I'll
>>>>>>>>> keep this in mind.
>>>>>>>> I just tested on 5.13.0-rc4 on Intel Edison (x86_64). All 5 patches
>>>>>>>> apply. Switching between host/gadget works, no connections
>>>>>>>> dropping, no
>>>>>>>> errors in dmesg.
>>>>>>>>
>>>>>>>> In host mode I connect a smsc9504 eth+4p hub. In gadget mode I have
>>>>>>>> composite device created from configfs with gser / eem /
>>>>>>>> mass_storage /
>>>>>>>> uac2.
>>>>>>>>
>>>>>>>> Tested with iperf3 performance in host (93.6Mbits/sec) and gadget
>>>>>>>> (207Mbits/sec) mode. Compared to v5.10.41 without patches host
>>>>>>>> (93.4Mbits/sec) and gadget (198Mbits/sec).
>>>>>>>>
>>>>>>>> Gadget seems to be a little faster with the patches, but that might
>>>>>>>> also
>>>>>>>> be caused  by something else, on v5.10.41 I see the bitrate bouncing
>>>>>>>> between 207 and 199.
>>>>>>>>
>>>>>>>> I saw a mention to test iperf3 to self (loopback). 3.09 Gbits/sec.
>>>>>>>> With
>>>>>>>> v5.10.41 3.07Gbits/sec. Not bad for a 500MHz device.
>>>>>>>>
>>>>>>>> With gnome-disks I did a read access benchmark 35.4MB/s, with v5.10.41
>>>>>>>> 34.7MB/s. This might be limited by Edison's internal eMMC speed (when
>>>>>>>> booting U-Boot reads the kernel with 21.4 MiB/s).
>>>>>>>>
>>>>>>> Hi Ferry,
>>>>>>>
>>>>>>> Thanks for the testing.  Just to double check, did you also enable the
>>>>>>> property, which enabled the TXFIFO resize feature on the platform?  For
>>>>>>> example, for the QCOM SM8150 platform, we're adding the following to
>>>>>>> our
>>>>>>> device tree node:
>>>>>>>
>>>>>>> tx-fifo-resize
>>>>>>>
>>>>>>> If not, then your results at least confirms that w/o the property
>>>>>>> present, the changes won't break anything :).  Thanks again for the
>>>>>>> initial testing!
>>>> I applied the patch now to 5.13.0-rc5 + the following:
>>>>
>>> Hi Ferry,
>>>
>>> Quick question...there was a compile error with the V9 patch series, as
>>> it was using the dwc3_mwidth() incorrectly.  I will update this with the
>>> proper use of the mdwidth, but which patch version did you use?
> Hi Ferry,
>
>> The V9 set gets applied to 5.13.0-rc5 by Yocto, if it doesn't apply it
>> stops the build. I didn't notice any compile errors, they stop the whole
>> build process too. But warnings are ignored. I'll check the logs to be sure.
> Ah, ok.  I think the incorrect usage of the API will result as a warning
> as seen in Greg's compile log:
>
> drivers/usb/dwc3/gadget.c: In function ‘dwc3_gadget_calc_tx_fifo_size’:
> drivers/usb/dwc3/gadget.c:653:45: warning: passing argument 1 of
> ‘dwc3_mdwidth’ makes pointer from integer without a cast [-Wint-conversion]
>    653 |         mdwidth = dwc3_mdwidth(dwc->hwparams.hwparams0);
I found exactly this warning in my logs. Sorry for this noise, I was 
watching for an error.
> This is probably why the page fault occurs, as we're not passing in the
> DWC3 struct.  I will send out a V10 shortly after testing it on my device.
>
> Thanks
> Wesley Cheng
>
>>> Thanks
>>> Wesley Cheng
>>>
>>>> --- a/drivers/usb/dwc3/dwc3-pci.c
>>>> +++ b/drivers/usb/dwc3/dwc3-pci.c
>>>> @@ -124,6 +124,7 @@ static const struct property_entry
>>>> dwc3_pci_mrfld_properties[] = {
>>>>       PROPERTY_ENTRY_BOOL("snps,dis_u3_susphy_quirk"),
>>>>       PROPERTY_ENTRY_BOOL("snps,dis_u2_susphy_quirk"),
>>>>       PROPERTY_ENTRY_BOOL("snps,usb2-gadget-lpm-disable"),
>>>> +    PROPERTY_ENTRY_BOOL("tx-fifo-resize"),
>>>>       PROPERTY_ENTRY_BOOL("linux,sysdev_is_parent"),
>>>>       {}
>>>>   };
>>>>
>>>>   and when switching to gadget mode unfortunately received the following
>>>> oops:
>>>>
>>>> BUG: unable to handle page fault for address: 00000000202043f2
>>>> #PF: supervisor read access in kernel mode
>>>> #PF: error_code(0x0000) - not-present page
>>>> PGD 0 P4D 0
>>>> Oops: 0000 [#1] SMP PTI
>>>> CPU: 0 PID: 617 Comm: conf-gadget.sh Not tainted
>>>> 5.13.0-rc5-edison-acpi-standard #1
>>>> Hardware name: Intel Corporation Merrifield/BODEGA BAY, BIOS 542
>>>> 2015.01.21:18.19.48
>>>> RIP: 0010:dwc3_gadget_check_config+0x33/0x80
>>>> Code: 59 04 00 00 04 74 61 48 c1 ee 10 48 89 f7 f3 48 0f b8 c7 48 89 c7
>>>> 39 81 60 04 00 00 7d 4a 89 81 60 04 00 00 8b 81 08 04 00 00 <81> b8 e8
>>>> 03 00 00 32 33 00 00 0f b6 b0 09 04 00 00 75 0d 8b 80 20
>>>> RSP: 0018:ffffb5550038fda0 EFLAGS: 00010297
>>>> RAX: 000000002020400a RBX: ffffa04502627348 RCX: ffffa04507354028
>>>> RDX: 0000000000000000 RSI: 000000000000003c RDI: 0000000000000004
>>>> RBP: ffffa04508ac0550 R08: ffffa04503a75b2c R09: 0000000000000000
>>>> R10: 0000000000000216 R11: 000000000002eba0 R12: ffffa04508ac0550
>>>> R13: dead000000000100 R14: ffffa04508ac0600 R15: ffffa04508ac0520
>>>> FS:  00007f7471e2f740(0000) GS:ffffa0453e200000(0000)
>>>> knlGS:0000000000000000
>>>> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>>> CR2: 00000000202043f2 CR3: 0000000003f38000 CR4: 00000000001006f0
>>>> Call Trace:
>>>>   configfs_composite_bind+0x2f4/0x430 [libcomposite]
>>>>   udc_bind_to_driver+0x64/0x180
>>>>   usb_gadget_probe_driver+0x114/0x150
>>>>   gadget_dev_desc_UDC_store+0xbc/0x130 [libcomposite]
>>>>   configfs_write_file+0xcd/0x140
>>>>   vfs_write+0xbb/0x250
>>>>   ksys_write+0x5a/0xd0
>>>>   do_syscall_64+0x40/0x80
>>>>   entry_SYSCALL_64_after_hwframe+0x44/0xae
>>>> RIP: 0033:0x7f7471f1ff53
>>>> Code: 8b 15 21 cf 0c 00 f7 d8 64 89 02 48 c7 c0 ff ff ff ff eb b7 0f 1f
>>>> 00 64 8b 04 25 18 00 00 00 85 c0 75 14 b8 01 00 00 00 0f 05 <48> 3d 00
>>>> f0 ff ff 77 55 c3 0f 1f 40 00 48 83 ec 28 48 89 54 24 18
>>>> RSP: 002b:00007fffa3dcd328 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
>>>> RAX: ffffffffffffffda RBX: 000000000000000c RCX: 00007f7471f1ff53
>>>> RDX: 000000000000000c RSI: 00005614d615a770 RDI: 0000000000000001
>>>> RBP: 00005614d615a770 R08: 000000000000000a R09: 00007f7471fb20c0
>>>> R10: 0000000000000000 R11: 0000000000000246 R12: 000000000000000c
>>>> R13: 00007f7471fee520 R14: 000000000000000c R15: 00007f7471fee720
>>>> Modules linked in: usb_f_uac2 u_audio usb_f_mass_storage usb_f_eem
>>>> u_ether usb_f_serial u_serial libcomposite rfcomm iptable_nat bnep
>>>> snd_sof_nocodec spi_pxa2xx_platform dw_dmac smsc snd_sof_pci_intel_tng
>>>> snd_sof_pci snd_sof_acpi_intel_byt snd_sof_intel_ipc snd_sof_acpi
>>>> smsc95xx snd_sof pwm_lpss_pci pwm_lpss snd_sof_xtensa_dsp
>>>> snd_intel_dspcfg snd_soc_acpi_intel_match snd_soc_acpi dw_dmac_pci
>>>> intel_mrfld_pwrbtn intel_mrfld_adc dw_dmac_core spi_pxa2xx_pci brcmfmac
>>>> brcmutil leds_gpio hci_uart btbcm ti_ads7950
>>>> industrialio_triggered_buffer kfifo_buf ledtrig_timer ledtrig_heartbeat
>>>> mmc_block extcon_intel_mrfld sdhci_pci cqhci sdhci led_class
>>>> intel_soc_pmic_mrfld mmc_core btrfs libcrc32c xor zstd_compress
>>>> zlib_deflate raid6_pq
>>>> CR2: 00000000202043f2
>>>> ---[ end trace 5c11fe50dca92ad4 ]---
>>>>
>>>>>> No I didn't. Afaik we don't have a devicetree property to set.
>>>>>>
>>>>>> But I'd be happy to test that as well. But where to set the property?
>>>>>>
>>>>>> dwc3_pci_mrfld_properties[] in dwc3-pci?
>>>>>>
>>>>> Hi Ferry,
>>>>>
>>>>> Not too sure which DWC3 driver is used for the Intel platform, but I
>>>>> believe that should be the one. (if that's what is normally used)  We'd
>>>>> just need to add an entry w/ the below:
>>>>>
>>>>> PROPERTY_ENTRY_BOOL("tx-fifo-resize")
>>>>>
>>>>> Thanks
>>>>> Wesley Cheng
>>>>>
>>>>>>> Thanks
>>>>>>> Wesley Cheng
>>>>>>>
>>>>>>>>>>>> Now with endpoint bursting, if the function notifies the host that
>>>>>>>>>>>> bursting is supported, when the host sends the ACK for the Data
>>>>>>>>>>>> Packet,
>>>>>>>>>>>> it should have a NumP value equal to the bMaxBurst reported in
>>>>>>>>>>>> the EP
>>>>>>>>>>> Yes and no. Looking back at the history, we used to configure NUMP
>>>>>>>>>>> based
>>>>>>>>>>> on bMaxBurst, but it was changed later in commit
>>>>>>>>>>> 4e99472bc10bda9906526d725ff6d5f27b4ddca1 by yours truly because
>>>>>>>>>>> of a
>>>>>>>>>>> problem reported by John Youn.
>>>>>>>>>>>
>>>>>>>>>>> And now we've come full circle. Because even if I believe more
>>>>>>>>>>> requests
>>>>>>>>>>> are enough for bursting, NUMP is limited by the RxFIFO size. This
>>>>>>>>>>> ends
>>>>>>>>>>> up supporting your claim that we need RxFIFO resizing if we want to
>>>>>>>>>>> squeeze more throughput out of the controller.
>>>>>>>>>>>
>>>>>>>>>>> However, note that this is about RxFIFO size, not TxFIFO size. In
>>>>>>>>>>> fact,
>>>>>>>>>>> looking at Table 8-13 of USB 3.1 r1.0, we read the following about
>>>>>>>>>>> NumP
>>>>>>>>>>> (emphasis is mine):
>>>>>>>>>>>
>>>>>>>>>>>           "Number of Packets (NumP). This field is used to
>>>>>>>>>>> indicate the
>>>>>>>>>>>           number of Data Packet buffers that the **receiver** can
>>>>>>>>>>>           accept. The value in this field shall be less than or
>>>>>>>>>>> equal to
>>>>>>>>>>>           the maximum burst size supported by the endpoint as
>>>>>>>>>>> determined
>>>>>>>>>>>           by the value in the bMaxBurst field in the Endpoint
>>>>>>>>>>> Companion
>>>>>>>>>>>           Descriptor (refer to Section 9.6.7)."
>>>>>>>>>>>
>>>>>>>>>>> So, NumP is for the receiver, not the transmitter. Could you
>>>>>>>>>>> clarify
>>>>>>>>>>> what you mean here?
>>>>>>>>>>>
>>>>>>>>>>> /me keeps reading
>>>>>>>>>>>
>>>>>>>>>>> Hmm, table 8-15 tries to clarify:
>>>>>>>>>>>
>>>>>>>>>>>           "Number of Packets (NumP).
>>>>>>>>>>>
>>>>>>>>>>>           For an OUT endpoint, refer to Table 8-13 for the
>>>>>>>>>>> description of
>>>>>>>>>>>           this field.
>>>>>>>>>>>
>>>>>>>>>>>           For an IN endpoint this field is set by the endpoint to
>>>>>>>>>>> the
>>>>>>>>>>>           number of packets it can transmit when the host resumes
>>>>>>>>>>>           transactions to it. This field shall not have a value
>>>>>>>>>>> greater
>>>>>>>>>>>           than the maximum burst size supported by the endpoint as
>>>>>>>>>>>           indicated by the value in the bMaxBurst field in the
>>>>>>>>>>> Endpoint
>>>>>>>>>>>           Companion Descriptor. Note that the value reported in this
>>>>>>>>>>> field
>>>>>>>>>>>           may be treated by the host as informative only."
>>>>>>>>>>>
>>>>>>>>>>> However, if I remember correctly (please verify dwc3 databook),
>>>>>>>>>>> NUMP in
>>>>>>>>>>> DCFG was only for receive buffers. Thin, John, how does dwc3
>>>>>>>>>>> compute
>>>>>>>>>>> NumP for TX/IN endpoints? Is that computed as a function of
>>>>>>>>>>> DCFG.NUMP or
>>>>>>>>>>> TxFIFO size?
>>>>>>>>>>>
>>>>>>>>>>>> desc.  If we have a TXFIFO size of 2, then normally what I have
>>>>>>>>>>>> seen is
>>>>>>>>>>>> that after 2 data packets, the device issues a NRDY.  So then we'd
>>>>>>>>>>>> need
>>>>>>>>>>>> to send an ERDY once data is available within the FIFO, and the
>>>>>>>>>>>> same
>>>>>>>>>>>> sequence happens until the USB request is complete.  With this
>>>>>>>>>>>> constant
>>>>>>>>>>>> NRDY/ERDY handshake going on, you actually see that the bus is
>>>>>>>>>>>> under
>>>>>>>>>>>> utilized.  When we increase an EP's FIFO size, then you'll see
>>>>>>>>>>>> constant
>>>>>>>>>>>> bursts for a request, until the request is done, or if the host
>>>>>>>>>>>> runs out
>>>>>>>>>>>> of RXFIFO. (ie no interruption [on the USB protocol level] during
>>>>>>>>>>>> USB
>>>>>>>>>>>> request data transfer)
>>>>>>>>>>> Unfortunately I don't have access to a USB sniffer anymore :-(
>>>>>>>>>>>
>>>>>>>>>>>>>>>>> Good points.
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>> Wesley, what kind of testing have you done on this on
>>>>>>>>>>>>>>>>> different devices?
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> As mentioned above, these changes are currently present on end
>>>>>>>>>>>>>>>> user
>>>>>>>>>>>>>>>> devices for the past few years, so its been through a lot of
>>>>>>>>>>>>>>>> testing :).
>>>>>>>>>>>>>>> all with the same gadget driver. Also, who uses USB on android
>>>>>>>>>>>>>>> devices
>>>>>>>>>>>>>>> these days? Most of the data transfer goes via WiFi or
>>>>>>>>>>>>>>> Bluetooth, anyway
>>>>>>>>>>>>>>> :-)
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> I guess only developers are using USB during development to
>>>>>>>>>>>>>>> flash dev
>>>>>>>>>>>>>>> images heh.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>> I used to be a customer facing engineer, so honestly I did see
>>>>>>>>>>>>>> some
>>>>>>>>>>>>>> really interesting and crazy designs.  Again, we do have
>>>>>>>>>>>>>> non-Android
>>>>>>>>>>>>>> products that use the same code, and it has been working in
>>>>>>>>>>>>>> there
>>>>>>>>>>>>>> for a
>>>>>>>>>>>>>> few years as well.  The TXFIFO sizing really has helped with
>>>>>>>>>>>>>> multimedia
>>>>>>>>>>>>>> use cases, which use isoc endpoints, since esp. in those lower
>>>>>>>>>>>>>> end CPU
>>>>>>>>>>>>>> chips where latencies across the system are much larger, and a
>>>>>>>>>>>>>> missed
>>>>>>>>>>>>>> ISOC interval leads to a pop in your ear.
>>>>>>>>>>>>> This is good background information. Thanks for bringing this
>>>>>>>>>>>>> up. Admitedly, we still have ISOC issues with dwc3. I'm
>>>>>>>>>>>>> interested in
>>>>>>>>>>>>> knowing if a deeper request queue would also help here.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Remember dwc3 can accomodate 255 requests + link for each
>>>>>>>>>>>>> endpoint. If
>>>>>>>>>>>>> our gadget driver uses a low number of requests, we're never
>>>>>>>>>>>>> really
>>>>>>>>>>>>> using the TRB ring in our benefit.
>>>>>>>>>>>>>
>>>>>>>>>>>> We're actually using both a deeper USB request queue + TX fifo
>>>>>>>>>>>> resizing. :).
>>>>>>>>>>> okay, great. Let's see what John and/or Thinh respond WRT dwc3 TX
>>>>>>>>>>> Burst
>>>>>>>>>>> behavior.
>>>>>>>>>> -- 
>>>>>>>>>> heikki
