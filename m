Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFAC33B4A12
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jun 2021 23:19:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229958AbhFYVWS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Jun 2021 17:22:18 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:44234 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229913AbhFYVWQ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Jun 2021 17:22:16 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1624655993; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=++jOA73UDxkEJBRxJmfW4eqJtjws4iPXETSTFH5caY0=; b=FAVeqLWFwYJ8wr65vEi2Ou3IacCmnb5FgJ9MbfmH97zE8M8L7kY2ddjfylIpHz0bCbXWrLYV
 1gjxa+7hyKjUO68DRgH2xHyMHnvO6NH7AfdS0SqQCIXqSsR3MaxsMatALRW72/uj9/ZtWcOj
 V1nbcdpQAHVz0RR9sfYfuM8S2+k=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 60d6487906ea41c94191e1ab (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 25 Jun 2021 21:19:53
 GMT
Sender: wcheng=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 38FE3C433D3; Fri, 25 Jun 2021 21:19:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLACK autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.110.120.60] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 97B4AC433F1;
        Fri, 25 Jun 2021 21:19:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 97B4AC433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=wcheng@codeaurora.org
Subject: Re: [PATCH v10 0/6] Re-introduce TX FIFO resize for larger EP
 bursting
To:     Ferry Toth <fntoth@gmail.com>, balbi@kernel.org,
        gregkh@linuxfoundation.org, robh+dt@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, frowand.list@gmail.com
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        jackp@codeaurora.org, heikki.krogerus@linux.intel.com,
        andy.shevchenko@gmail.com
References: <1623923899-16759-1-git-send-email-wcheng@codeaurora.org>
 <cfb83fe4-369c-ec72-7887-3bcb0f20fe15@gmail.com>
 <ec8050c5-c013-4af6-b39e-69779c009a9c@codeaurora.org>
 <f5ed0ee7-e333-681f-0f1a-d0227562204b@gmail.com>
 <2e01c435-9ecc-4e3b-f55c-612a86667020@codeaurora.org>
 <2ae9fa6a-3bb1-3742-0dd3-59678bdd8643@gmail.com>
 <ebea75fe-5334-197b-f67a-cb6e1e30b39e@codeaurora.org>
 <4e5fbcdb-765a-895d-7723-a87feed6eed5@gmail.com>
 <d9441227-b494-ccb5-fc72-e59d3a7d2c72@codeaurora.org>
 <89af9004-9867-6c0a-a709-6c71817efa81@gmail.com>
 <d870b5c9-f553-3448-c69e-f1e32e23feb9@codeaurora.org>
 <ee59382c-b8e6-9e5c-687f-ea654a28ed8a@gmail.com>
From:   Wesley Cheng <wcheng@codeaurora.org>
Message-ID: <dc570088-478a-4d0a-d0e2-148274a3e6af@codeaurora.org>
Date:   Fri, 25 Jun 2021 14:19:46 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <ee59382c-b8e6-9e5c-687f-ea654a28ed8a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 6/25/2021 2:10 PM, Ferry Toth wrote:
> Hi
> 
> Op 23-06-2021 om 09:50 schreef Wesley Cheng:
>>
>> On 6/22/2021 3:12 PM, Ferry Toth wrote:
>>> Hi
>>>
>>> Op 23-06-2021 om 00:00 schreef Wesley Cheng:
>>>> On 6/22/2021 1:09 PM, Ferry Toth wrote:
>>>>> Hi
>>>>>
>>>>> Op 22-06-2021 om 20:38 schreef Wesley Cheng:
>>>>>> On 6/19/2021 5:40 AM, Ferry Toth wrote:
>>>>>>> Hi
>>>>>>>
>>>>>>> Op 18-06-2021 om 00:25 schreef Wesley Cheng:
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>> On 6/17/2021 2:55 PM, Ferry Toth wrote:
>>>>>>>>> Hi
>>>>>>>>>
>>>>>>>>> Op 17-06-2021 om 23:48 schreef Wesley Cheng:
>>>>>>>>>> Hi,
>>>>>>>>>>
>>>>>>>>>> On 6/17/2021 2:01 PM, Ferry Toth wrote:
>>>>>>>>>>> Hi
>>>>>>>>>>>
>>>>>>>>>>> Op 17-06-2021 om 11:58 schreef Wesley Cheng:
>>>>>>>>>>>> Changes in V10:
>>>>>>>>>>>>       - Fixed compilation errors in config where OF is not used
>>>>>>>>>>>> (error due to
>>>>>>>>>>>>         unknown symbol for of_add_property()).  Add
>>>>>>>>>>>> of_add_property()
>>>>>>>>>>>> stub.
>>>>>>>>>>>>       - Fixed compilation warning for incorrect argument being
>>>>>>>>>>>> passed to
>>>>>>>>>>>> dwc3_mdwidth
>>>>>>>>>>> This fixes the OOPS I had in V9. I do not see any change in
>>>>>>>>>>> performance
>>>>>>>>>>> on Merrifield though.
>>>>>>>>>> I see...thanks Ferry! With your testing, are you writing to the
>>>>>>>>>> device's
>>>>>>>>>> internal storage (ie UFS, eMMC, etc...), or did you use a
>>>>>>>>>> ramdisk as
>>>>>>>>>> well?
>>>>>>>>> In this case I just tested the EEM path using iperf3.
>>>>>>>>>
>>>>>>>> Got it.  I don't believe f_eem will use a high enough (if at all)
>>>>>>>> bMaxBurst value to change the TXFIFO size.
>>>>>>>>
>>>>>>>>>> If not with a ramdisk, we might want to give that a try to avoid
>>>>>>>>>> the
>>>>>>>>>> storage path being the bottleneck.  You can use "dd" to create an
>>>>>>>>>> empty
>>>>>>>>>> file, and then just use that as the LUN's backing file.
>>>>>>>>>>
>>>>>>>>>> echo ramdisk.img >
>>>>>>>>>> /sys/kernel/config/usb_gadget/g1/functions/mass_storage.0/lun.0/file
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>> Ah, why didn't I think of that. I have currently mass storage
>>>>>>>>> setup
>>>>>>>>> with
>>>>>>>>> eMMC but it seems that is indeed the bottleneck.
>>>>>>>>>
>>>>>>> I created a 64MB disk following the instructions here
>>>>>>> http://www.linux-usb.org/gadget/file_storage.html (that seems a
>>>>>>> little
>>>>>>> outdated, at least I can not start the first partition at sector 8,
>>>>>>> but
>>>>>>> minimum 2048), and added a test file on it.
>>>>>>>
>>>>>>> I then copy the file to /dev/shm prior to setting configfs
>>>>>>> (composite
>>>>>>> device gser/eem/mass_storage/uac2).
>>>>>>>
>>>>>>> journal shows:
>>>>>>>
>>>>>>> kernel: Mass Storage Function, version: 2009/09/11
>>>>>>> kernel: LUN: removable file: (no medium)
>>>>>>>
>>>>>>> I don't know what that means, because I see the test file on the
>>>>>>> ramdisk.
>>>>>>>
>>>>>>> Then I again used gnome disks to benchmark (read/write 10MB):
>>>>>>>
>>>>>>> With V10 on top v5.13.0-rc5:
>>>>>>>
>>>>>>> R/W speed = 35.6/35.8MB/s, access time 0.35ms
>>>>>>>
>>>>>>> With no patches on top v5.12.0:
>>>>>>>
>>>>>>> R/W speed = 35.7/36.1MB/s, access time 0.35ms
>>>>>> Hi Ferry,
>>>>>>
>>>>>>> I see no speed difference (and it's about the same as with the eMMC
>>>>>>> backed disk). But the patches are causing a new call trace
>>>>>>>
>>>>>> Would you happen to know what DWC3 controller revision the device is
>>>>>> using?  The callstack print occurs, because it looks like it ran
>>>>>> out of
>>>>>> internal memory, although there should be logic present for making
>>>>>> sure
>>>>>> that at least there is enough room for 1 FIFO per endpoint. 
>>>>>> (possibly
>>>>>> the logic/math depends on the controller revision)
>>>> Hi Ferry,
>>>>
>>>>> Do you know where I could find that in a file on the device?
>>>>>
>>>> Maybe you can just dump the DWC3 registers?
>>>> cat /sys/kernel/debug/usb/<controller name>/regdump
>>> This isin host mode:
>>>
>>> ~# cat /sys/kernel/debug/usb/dwc3.0.auto/regdump
>>> GSBUSCFG0 = 0x00000006
>>> GSBUSCFG1 = 0x00000f00
>>> GTXTHRCFG = 0x230a0000
>>> GRXTHRCFG = 0x22800000
>>> GCTL = 0x45801002
>>> GEVTEN = 0x00000000
>>> GSTS = 0x3e800001
>>> GUCTL1 = 0x00000000
>>> GSNPSID = 0x5533250a
>>> GGPIO = 0x00000000
>>> GUID = 0x00050d00
>>> GUCTL = 0x0200ce00
>>> GBUSERRADDR0 = 0x00000000
>>> GBUSERRADDR1 = 0x00000000
>> ...
>> Hi Ferry,
>>
>> Great!  Thanks, that got me the information regarding the DWC3 revision
>> you're using. (its version 2.50a)  I checked the DWC3 databook and looks
>> like certain versions have some different math to calculate the TXFIFO
>> size.  I have taken this into account and factored that in in the next
>> revision.
>>
>> Is there a way you could collect the regdump in device mode w/ mass
>> storage only composition after enumerating with the PC?  That would help
>> confirm how the TXFIFO resizing logic is working on your platform.
> 
> Sorry for the wait. Yes I have serial console. So here is in device
> mode, mass_storage only, enumerated but not mounted:
> 
> GSBUSCFG0 = 0x00000006
> GSBUSCFG1 = 0x00000f00
> GTXTHRCFG = 0x230a0000
> GRXTHRCFG = 0x02800000
> GCTL = 0x45802002
> GEVTEN = 0x00000000
...
> 

Hi Ferry,

Thanks!  So does your board support SSUSB by any chance?  Based on the
DSTS output, it seems that its currently operating in HSUSB mode.  I
guess we'd expect higher tput values as well in general if we are in
SSUSB mode.

The resize logic would only happen if the device was in SSUSB, as SSUSB
has endpoint bursting, which is the main incentive for the fifo resize.

Thanks
Wesley Cheng

>> Thanks
>> Wesley Cheng
>>
>>>> Was going to ask for the same to confirm the TXFIFO sizes from your
>>>> results below :).
>>>>
>>>>> Otherwise, I'm hoping Andy will know?
>>>>>
>>>>>> Also, is there a way to use just a mass storage only composition?
>>>>>> Based
>>>>>> on the above observation, that probably means that the mass storage
>>>>>> interface wasn't resized at all, because the configuration took up a
>>>>>> lot
>>>>>> of the internal FIFO space.
>>>>> Sure, it's configured through configfs. With only mass_storage I have:
>>>>>
>>>>> With V10 on top v5.13.0-rc5:
>>>>>
>>>>> R/W speed = 41,6/39,3MB/s, access time 0.33ms
>>>>>
>>>>> With no patches on top v5.12.0:
>>>>>
>>>>> R/W speed = 41,1/38,7MB/s, access time 0.38ms
>>>>>
>>>> Thanks Ferry!  Could you collect the regdump, so I can confirm the two
>>>> things mentioned?
>>>>
>>>> Thanks
>>>> Wesley Cheng
>>>>
>>>>>> Thanks
>>>>>> Wesley Cheng
>>>>>>
>>>>>>> kernel: using random self ethernet address
>>>>>>> kernel: using random host ethernet address
>>>>>>> kernel: Mass Storage Function, version: 2009/09/11
>>>>>>> kernel: LUN: removable file: (no medium)
>>>>>>> kernel: usb0: HOST MAC aa:bb:cc:dd:ee:f2
>>>>>>> kernel: usb0: MAC aa:bb:cc:dd:ee:f1
>>>>>>> kernel: IPv6: ADDRCONF(NETDEV_CHANGE): usb0: link becomes ready
>>>>>>> kernel: dwc3 dwc3.0.auto: Fifosize(2154) > RAM size(2022) ep5in
>>>>>>> depth:115540359
>>>>>>> kernel: ------------[ cut here ]------------
>>>>>>> kernel: WARNING: CPU: 0 PID: 594 at
>>>>>>> drivers/usb/gadget/udc/core.c:278
>>>>>>> usb_ep_queue+0x75/0x80
>>>>>>> kernel: Modules linked in: usb_f_uac2 u_audio usb_f_mass_storage
>>>>>>> usb_f_eem u_ether usb_f_serial u_serial libcomposite rfcomm
>>>>>>> iptable_nat
>>>>>>> bnep snd_sof_nocodec spi_pxa2>
>>>>>>> kernel: CPU: 0 PID: 594 Comm: irq/14-dwc3 Not tainted
>>>>>>> 5.13.0-rc5-edison-acpi-standard #1
>>>>>>> kernel: Hardware name: Intel Corporation Merrifield/BODEGA BAY,
>>>>>>> BIOS 542
>>>>>>> 2015.01.21:18.19.48
>>>>>>> kernel: RIP: 0010:usb_ep_queue+0x75/0x80
>>>>>>> kernel: Code: 01 73 e4 48 8b 05 fb 63 06 01 48 85 c0 74 12 48 8b
>>>>>>> 78 08
>>>>>>> 44 89 e9 4c 89 e2 48 89 ee e8 74 05 00 00 44 89 e8 5d 41 5c 41 5d c3
>>>>>>> <0f> 0b 41 bd 94 ff ff ff >
>>>>>>> kernel: RSP: 0000:ffff91eec083fc98 EFLAGS: 00010082
>>>>>>> kernel: RAX: ffff8af20357d960 RBX: 0000000000000000 RCX:
>>>>>>> ffff8af202f06400
>>>>>>> kernel: RDX: 0000000000000a20 RSI: ffff8af208785780 RDI:
>>>>>>> ffff8af202e9ae00
>>>>>>> kernel: RBP: ffff8af202e9ae00 R08: 00000000000000c0 R09:
>>>>>>> ffff8af208785780
>>>>>>> kernel: R10: 00000000ffffe000 R11: 3fffffffffffffff R12:
>>>>>>> ffff8af208785780
>>>>>>> kernel: R13: 0000000000000000 R14: ffff8af202e9ae00 R15:
>>>>>>> ffff8af203e26cc0
>>>>>>> kernel: FS:  0000000000000000(0000) GS:ffff8af23e200000(0000)
>>>>>>> knlGS:0000000000000000
>>>>>>> kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>>>>>> kernel: CR2: 000055e2c21f2100 CR3: 0000000003b38000 CR4:
>>>>>>> 00000000001006f0
>>>>>>> kernel: Call Trace:
>>>>>>> kernel:  u_audio_start_playback+0x107/0x1a0 [u_audio]
>>>>>>> kernel:  composite_setup+0x224/0x1ba0 [libcomposite]
>>>>>>> kernel:  ? dwc3_gadget_ep_queue+0xf6/0x1a0
>>>>>>> kernel:  ? usb_ep_queue+0x2a/0x80
>>>>>>> kernel:  ? configfs_composite_setup+0x6b/0x90 [libcomposite]
>>>>>>> kernel:  configfs_composite_setup+0x6b/0x90 [libcomposite]
>>>>>>> kernel:  dwc3_ep0_interrupt+0x469/0xa80
>>>>>>> kernel:  dwc3_thread_interrupt+0x8ee/0xf40
>>>>>>> kernel:  ? __wake_up_common_lock+0x85/0xb0
>>>>>>> kernel:  ? disable_irq_nosync+0x10/0x10
>>>>>>> kernel:  irq_thread_fn+0x1b/0x60
>>>>>>> kernel:  irq_thread+0xd6/0x170
>>>>>>> kernel:  ? irq_thread_check_affinity+0x70/0x70
>>>>>>> kernel:  ? irq_forced_thread_fn+0x70/0x70
>>>>>>> kernel:  kthread+0x116/0x130
>>>>>>> kernel:  ? kthread_create_worker_on_cpu+0x60/0x60
>>>>>>> kernel:  ret_from_fork+0x22/0x30
>>>>>>> kernel: ---[ end trace e5b9e28058c53584 ]---
>>>>>>> kernel: configfs-gadget gadget: u_audio_start_playback:451 Error!
>>>>>>> kernel: configfs-gadget gadget: u_audio_start_playback:451 Error!
>>>>>>> kernel: dwc3 dwc3.0.auto: request 000000003c32dcc5 was not queued to
>>>>>>> ep5in
>>>>>>> kernel: dwc3 dwc3.0.auto: request 00000000b2512aa9 was not queued to
>>>>>>> ep5in
>>>>>>> kernel: dwc3 dwc3.0.auto: Fifosize(2154) > RAM size(2022) ep5in
>>>>>>> depth:115540359
>>>>>>> kernel: configfs-gadget gadget: u_audio_start_playback:451 Error!
>>>>>>> kernel: configfs-gadget gadget: u_audio_start_playback:451 Error!
>>>>>>> kernel: dwc3 dwc3.0.auto: request 00000000b2512aa9 was not queued to
>>>>>>> ep5in
>>>>>>> kernel: dwc3 dwc3.0.auto: request 00000000036ac129 was not queued to
>>>>>>> ep5in
>>>>>>> kernel: dwc3 dwc3.0.auto: Fifosize(2154) > RAM size(2022) ep5in
>>>>>>> depth:115540359
>>>>>>> kernel: configfs-gadget gadget: u_audio_start_playback:451 Error!
>>>>>>> kernel: configfs-gadget gadget: u_audio_start_playback:451 Error!
>>>>>>> kernel: dwc3 dwc3.0.auto: request 00000000ad1b8c18 was not queued to
>>>>>>> ep5in
>>>>>>> kernel: dwc3 dwc3.0.auto: request 00000000fbc71244 was not queued to
>>>>>>> ep5in
>>>>>>> kernel: dwc3 dwc3.0.auto: Fifosize(2154) > RAM size(2022) ep5in
>>>>>>> depth:115540359
>>>>>>> kernel: configfs-gadget gadget: u_audio_start_playback:451 Error!
>>>>>>> kernel: configfs-gadget gadget: u_audio_start_playback:451 Error!
>>>>>>> kernel: dwc3 dwc3.0.auto: request 00000000fbc71244 was not queued to
>>>>>>> ep5in
>>>>>>> kernel: dwc3 dwc3.0.auto: request 00000000ad1b8c18 was not queued to
>>>>>>> ep5in
>>>>>>> kernel: dwc3 dwc3.0.auto: Fifosize(2154) > RAM size(2022) ep5in
>>>>>>> depth:115540359
>>>>>>> kernel: configfs-gadget gadget: u_audio_start_playback:451 Error!
>>>>>>> kernel: configfs-gadget gadget: u_audio_start_playback:451 Error!
>>>>>>> kernel: dwc3 dwc3.0.auto: request 000000003c32dcc5 was not queued to
>>>>>>> ep5in
>>>>>>> kernel: dwc3 dwc3.0.auto: request 00000000b2512aa9 was not queued to
>>>>>>> ep5in
>>>>>>>
>>>>>>> Removing uac2 from the config makes the call trace go away, but the
>>>>>>> R/W
>>>>>>> speed does not change.
>>>>>>>
>>>>>>>> :), not a problem...I've been working on getting the ideal set
>>>>>>>> up for
>>>>>>>> the performance profiling for awhile, so anything I can do to make
>>>>>>>> sure
>>>>>>>> we get some good results.
>>>>>>>>
>>>>>>>>> I'll try with a ramdisk and let you know.
>>>>>>>>>
>>>>>>>> Thanks again for the testing, Ferry.
>>>>>>>>
>>>>>>>> Thanks
>>>>>>>> Wesley Cheng
>>>>>>>>
>>>>>>>>>> Thanks
>>>>>>>>>> Wesley Cheng
>>>>>>>>>>
>>>>>>>>>>>> Changes in V9:
>>>>>>>>>>>>       - Fixed incorrect patch in series.  Removed changes in
>>>>>>>>>>>> DTSI, as
>>>>>>>>>>>> dwc3-qcom will
>>>>>>>>>>>>         add the property by default from the kernel.
>>>>>>>>>>>>
>>>>>>>>>>>> Changes in V8:
>>>>>>>>>>>>       - Rebased to usb-testing
>>>>>>>>>>>>       - Using devm_kzalloc for adding txfifo property in
>>>>>>>>>>>> dwc3-qcom
>>>>>>>>>>>>       - Removed DWC3 QCOM ACPI property for enabling the txfifo
>>>>>>>>>>>> resize
>>>>>>>>>>>>
>>>>>>>>>>>> Changes in V7:
>>>>>>>>>>>>       - Added a new property tx-fifo-max-num for limiting
>>>>>>>>>>>> how much
>>>>>>>>>>>> fifo
>>>>>>>>>>>> space the
>>>>>>>>>>>>         resizing logic can allocate for endpoints with large
>>>>>>>>>>>> burst
>>>>>>>>>>>> values.  This
>>>>>>>>>>>>         can differ across platforms, and tie in closely with
>>>>>>>>>>>> overall
>>>>>>>>>>>> system latency.
>>>>>>>>>>>>       - Added recommended checks for DWC32.
>>>>>>>>>>>>       - Added changes to set the tx-fifo-resize property from
>>>>>>>>>>>> dwc3-qcom by
>>>>>>>>>>>> default
>>>>>>>>>>>>         instead of modifying the current DTSI files.
>>>>>>>>>>>>       - Added comments on all APIs/variables introduced.
>>>>>>>>>>>>       - Updated the DWC3 YAML to include a better description
>>>>>>>>>>>> of the
>>>>>>>>>>>> tx-fifo-resize
>>>>>>>>>>>>         property and added an entry for tx-fifo-max-num.
>>>>>>>>>>>>
>>>>>>>>>>>> Changes in V6:
>>>>>>>>>>>>       - Rebased patches to usb-testing.
>>>>>>>>>>>>       - Renamed to PATCH series instead of RFC.
>>>>>>>>>>>>       - Checking for fs_descriptors instead of
>>>>>>>>>>>> ss_descriptors for
>>>>>>>>>>>> determining the
>>>>>>>>>>>>         endpoint count for a particular configuration.
>>>>>>>>>>>>       - Re-ordered patch series to fix patch dependencies.
>>>>>>>>>>>>
>>>>>>>>>>>> Changes in V5:
>>>>>>>>>>>>       - Added check_config() logic, which is used to
>>>>>>>>>>>> communicate the
>>>>>>>>>>>> number of EPs
>>>>>>>>>>>>         used in a particular configuration.  Based on this, the
>>>>>>>>>>>> DWC3
>>>>>>>>>>>> gadget driver
>>>>>>>>>>>>         has the ability to know the maximum number of eps
>>>>>>>>>>>> utilized in
>>>>>>>>>>>> all
>>>>>>>>>>>> configs.
>>>>>>>>>>>>         This helps reduce unnecessary allocation to unused eps,
>>>>>>>>>>>> and will
>>>>>>>>>>>> catch fifo
>>>>>>>>>>>>         allocation issues at bind() time.
>>>>>>>>>>>>       - Fixed variable declaration to single line per variable,
>>>>>>>>>>>> and
>>>>>>>>>>>> reverse xmas.
>>>>>>>>>>>>       - Created a helper for fifo clearing, which is used by
>>>>>>>>>>>> ep0.c
>>>>>>>>>>>>
>>>>>>>>>>>> Changes in V4:
>>>>>>>>>>>>       - Removed struct dwc3* as an argument for
>>>>>>>>>>>> dwc3_gadget_resize_tx_fifos()
>>>>>>>>>>>>       - Removed WARN_ON(1) in case we run out of fifo space
>>>>>>>>>>>>       Changes in V3:
>>>>>>>>>>>>       - Removed "Reviewed-by" tags
>>>>>>>>>>>>       - Renamed series back to RFC
>>>>>>>>>>>>       - Modified logic to ensure that fifo_size is reset if we
>>>>>>>>>>>> pass the
>>>>>>>>>>>> minimum
>>>>>>>>>>>>         threshold.  Tested with binding multiple FDs
>>>>>>>>>>>> requesting 6
>>>>>>>>>>>> FIFOs.
>>>>>>>>>>>>
>>>>>>>>>>>> Changes in V2:
>>>>>>>>>>>>       - Modified TXFIFO resizing logic to ensure that each
>>>>>>>>>>>> EP is
>>>>>>>>>>>> reserved a
>>>>>>>>>>>>         FIFO.
>>>>>>>>>>>>       - Removed dev_dbg() prints and fixed typos from patches
>>>>>>>>>>>>       - Added some more description on the dt-bindings commit
>>>>>>>>>>>> message
>>>>>>>>>>>>
>>>>>>>>>>>> Currently, there is no functionality to allow for resizing the
>>>>>>>>>>>> TXFIFOs, and
>>>>>>>>>>>> relying on the HW default setting for the TXFIFO depth.  In
>>>>>>>>>>>> most
>>>>>>>>>>>> cases, the
>>>>>>>>>>>> HW default is probably sufficient, but for USB compositions
>>>>>>>>>>>> that
>>>>>>>>>>>> contain
>>>>>>>>>>>> multiple functions that require EP bursting, the default
>>>>>>>>>>>> settings
>>>>>>>>>>>> might not be enough.  Also to note, the current SW will
>>>>>>>>>>>> assign an
>>>>>>>>>>>> EP to a
>>>>>>>>>>>> function driver w/o checking to see if the TXFIFO size for that
>>>>>>>>>>>> particular
>>>>>>>>>>>> EP is large enough. (this is a problem if there are multiple HW
>>>>>>>>>>>> defined
>>>>>>>>>>>> values for the TXFIFO size)
>>>>>>>>>>>>
>>>>>>>>>>>> It is mentioned in the SNPS databook that a minimum of TX FIFO
>>>>>>>>>>>> depth = 3
>>>>>>>>>>>> is required for an EP that supports bursting.  Otherwise, there
>>>>>>>>>>>> may be
>>>>>>>>>>>> frequent occurences of bursts ending.  For high bandwidth
>>>>>>>>>>>> functions,
>>>>>>>>>>>> such as data tethering (protocols that support data
>>>>>>>>>>>> aggregation),
>>>>>>>>>>>> mass
>>>>>>>>>>>> storage, and media transfer protocol (over FFS), the bMaxBurst
>>>>>>>>>>>> value
>>>>>>>>>>>> can be
>>>>>>>>>>>> large, and a bigger TXFIFO depth may prove to be beneficial in
>>>>>>>>>>>> terms
>>>>>>>>>>>> of USB
>>>>>>>>>>>> throughput. (which can be associated to system access latency,
>>>>>>>>>>>> etc...)  It
>>>>>>>>>>>> allows for a more consistent burst of traffic, w/o any
>>>>>>>>>>>> interruptions, as
>>>>>>>>>>>> data is readily available in the FIFO.
>>>>>>>>>>>>
>>>>>>>>>>>> With testing done using the mass storage function driver, the
>>>>>>>>>>>> results
>>>>>>>>>>>> show
>>>>>>>>>>>> that with a larger TXFIFO depth, the bandwidth increased
>>>>>>>>>>>> significantly.
>>>>>>>>>>>>
>>>>>>>>>>>> Test Parameters:
>>>>>>>>>>>>       - Platform: Qualcomm SM8150
>>>>>>>>>>>>       - bMaxBurst = 6
>>>>>>>>>>>>       - USB req size = 256kB
>>>>>>>>>>>>       - Num of USB reqs = 16
>>>>>>>>>>>>       - USB Speed = Super-Speed
>>>>>>>>>>>>       - Function Driver: Mass Storage (w/ ramdisk)
>>>>>>>>>>>>       - Test Application: CrystalDiskMark
>>>>>>>>>>>>
>>>>>>>>>>>> Results:
>>>>>>>>>>>>
>>>>>>>>>>>> TXFIFO Depth = 3 max packets
>>>>>>>>>>>>
>>>>>>>>>>>> Test Case | Data Size | AVG tput (in MB/s)
>>>>>>>>>>>> -------------------------------------------
>>>>>>>>>>>> Sequential|1 GB x     |
>>>>>>>>>>>> Read      |9 loops    | 193.60
>>>>>>>>>>>>           |           | 195.86
>>>>>>>>>>>>                |           | 184.77
>>>>>>>>>>>>                |           | 193.60
>>>>>>>>>>>> -------------------------------------------
>>>>>>>>>>>>
>>>>>>>>>>>> TXFIFO Depth = 6 max packets
>>>>>>>>>>>>
>>>>>>>>>>>> Test Case | Data Size | AVG tput (in MB/s)
>>>>>>>>>>>> -------------------------------------------
>>>>>>>>>>>> Sequential|1 GB x     |
>>>>>>>>>>>> Read      |9 loops    | 287.35
>>>>>>>>>>>>           |           | 304.94
>>>>>>>>>>>>                |           | 289.64
>>>>>>>>>>>>                |           | 293.61
>>>>>>>>>>>> -------------------------------------------
>>>>>>>>>>>>
>>>>>>>>>>>> Wesley Cheng (6):
>>>>>>>>>>>>        usb: gadget: udc: core: Introduce check_config to verify
>>>>>>>>>>>> USB
>>>>>>>>>>>>          configuration
>>>>>>>>>>>>        usb: gadget: configfs: Check USB configuration before
>>>>>>>>>>>> adding
>>>>>>>>>>>>        usb: dwc3: Resize TX FIFOs to meet EP bursting
>>>>>>>>>>>> requirements
>>>>>>>>>>>>        of: Add stub for of_add_property()
>>>>>>>>>>>>        usb: dwc3: dwc3-qcom: Enable tx-fifo-resize property by
>>>>>>>>>>>> default
>>>>>>>>>>>>        dt-bindings: usb: dwc3: Update dwc3 TX fifo properties
>>>>>>>>>>>>
>>>>>>>>>>>>       .../devicetree/bindings/usb/snps,dwc3.yaml         | 
>>>>>>>>>>>> 15 +-
>>>>>>>>>>>>       drivers/usb/dwc3/core.c                            |  
>>>>>>>>>>>> 9 +
>>>>>>>>>>>>       drivers/usb/dwc3/core.h                            | 
>>>>>>>>>>>> 15 ++
>>>>>>>>>>>>       drivers/usb/dwc3/dwc3-qcom.c                       |  
>>>>>>>>>>>> 9 +
>>>>>>>>>>>>       drivers/usb/dwc3/ep0.c                             |  
>>>>>>>>>>>> 2 +
>>>>>>>>>>>>       drivers/usb/dwc3/gadget.c                          | 212
>>>>>>>>>>>> +++++++++++++++++++++
>>>>>>>>>>>>       drivers/usb/gadget/configfs.c                      | 
>>>>>>>>>>>> 22 +++
>>>>>>>>>>>>       drivers/usb/gadget/udc/core.c                      | 
>>>>>>>>>>>> 25 +++
>>>>>>>>>>>>       include/linux/of.h                                 |  
>>>>>>>>>>>> 5 +
>>>>>>>>>>>>       include/linux/usb/gadget.h                         |  
>>>>>>>>>>>> 5 +
>>>>>>>>>>>>       10 files changed, 317 insertions(+), 2 deletions(-)
>>>>>>>>>>>>

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
