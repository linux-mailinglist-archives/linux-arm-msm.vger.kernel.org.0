Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D03C3D2C0C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jul 2021 20:43:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229545AbhGVSCo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Jul 2021 14:02:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbhGVSCn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Jul 2021 14:02:43 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5104CC061575;
        Thu, 22 Jul 2021 11:43:17 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id k27so8014525edk.9;
        Thu, 22 Jul 2021 11:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=aayVaSrj6wpR7vjOBnNxWuHm04yb1VEMG6YXfKMFAeY=;
        b=YhfBTyMnDSS9p/tAZ/LuzZVO8fNKNPa9qnbz7b8b/DyG/jjYwU9zLT/1rwy6ehaZBk
         TDEcnlASWUClSnN0nSzTjYHA33ZH/mm29gzufPiLHy7sPOxpNDC6QfMlGbvRxDOM7J9J
         QmDudvOKYESNDF8ASDgfs+8L6kkk+GG9AqTBVITPOygEoPaWIpuMFfXrp272QfJ0ZXeu
         3jYcUN+Ku2az+Z8e1vr+QEXFYa/X2TQNL7V2/YHJ9oO3i/c1ntyL2WD6NknsmmwSVOEa
         FSXLM9uazIV1jTsenJ0TItvsPA1nOpYo5+IREWE9i2VCAfJGwhkZ48L/FNbPrSbZK2za
         VgQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=aayVaSrj6wpR7vjOBnNxWuHm04yb1VEMG6YXfKMFAeY=;
        b=qAZCOOe2rQDmMY5Y5GnauAu+9MNR7jmJ4Yd0FyZuZdWkbP1auSTlnXePcLXWEuc8zC
         5NzGtehWm7WF0Pb5qA/VDhBNBGQYlDzXjKtpTx2X3Ln6FSlrKxnr94xdn5oR9RAktoqg
         vWRwbzeqjC6G8lEm5YltNnDg7DYPaLKDSsOokG8rCl1PMAFbCBoUquWfAHD5iXaPNZfw
         VQ1xSVGfkDDOiZVGBvtoo7m7e7QCTHyoCKfVhJbC1s/qkEj8YjbeInkOsyzDIeyt8dcW
         JPjJjNHoMk0djXLtc01rMZzcNJz4wIaSDEqBeziU6kstj60jdqHJsqd4USbX/PM27pPr
         VkOw==
X-Gm-Message-State: AOAM532fSRppvN+CtD9UHjDZDcULyc9a32gtR+O71ExB5lDd7CS+mMN7
        EEFYpMFCZv+B1ei3BZP3DBI=
X-Google-Smtp-Source: ABdhPJwVDdYK2qcoyMXPSZaLhjYOAiQFQSk5KLcZVioaa932arUe6ztcnkFTTxwsV2j1ajQxPCB8ng==
X-Received: by 2002:aa7:cf8b:: with SMTP id z11mr1220742edx.54.1626979395765;
        Thu, 22 Jul 2021 11:43:15 -0700 (PDT)
Received: from ?IPv6:2001:981:6fec:1:dc4:28cd:9ec9:7c79? ([2001:981:6fec:1:dc4:28cd:9ec9:7c79])
        by smtp.gmail.com with ESMTPSA id x2sm11799939edj.37.2021.07.22.11.43.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jul 2021 11:43:15 -0700 (PDT)
Subject: Re: [PATCH v10 0/6] Re-introduce TX FIFO resize for larger EP
 bursting
To:     Wesley Cheng <wcheng@codeaurora.org>, balbi@kernel.org,
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
From:   Ferry Toth <fntoth@gmail.com>
Message-ID: <bafa93bb-11e3-c8a5-e14a-b0a6d5695055@gmail.com>
Date:   Thu, 22 Jul 2021 20:43:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <ebea75fe-5334-197b-f67a-cb6e1e30b39e@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

Op 22-06-2021 om 20:38 schreef Wesley Cheng:
> 
> 
> On 6/19/2021 5:40 AM, Ferry Toth wrote:
>> Hi
>>
>> Op 18-06-2021 om 00:25 schreef Wesley Cheng:
>>> Hi,
>>>
>>> On 6/17/2021 2:55 PM, Ferry Toth wrote:
>>>> Hi
>>>>
>>>> Op 17-06-2021 om 23:48 schreef Wesley Cheng:
>>>>> Hi,
>>>>>
>>>>> On 6/17/2021 2:01 PM, Ferry Toth wrote:
>>>>>> Hi
>>>>>>
>>>>>> Op 17-06-2021 om 11:58 schreef Wesley Cheng:
>>>>>>> Changes in V10:
>>>>>>>     - Fixed compilation errors in config where OF is not used
>>>>>>> (error due to
>>>>>>>       unknown symbol for of_add_property()).  Add of_add_property()
>>>>>>> stub.
>>>>>>>     - Fixed compilation warning for incorrect argument being passed to
>>>>>>> dwc3_mdwidth
>>>>>> This fixes the OOPS I had in V9. I do not see any change in
>>>>>> performance
>>>>>> on Merrifield though.
>>>>> I see...thanks Ferry! With your testing, are you writing to the
>>>>> device's
>>>>> internal storage (ie UFS, eMMC, etc...), or did you use a ramdisk as
>>>>> well?
>>>> In this case I just tested the EEM path using iperf3.
>>>>
>>> Got it.  I don't believe f_eem will use a high enough (if at all)
>>> bMaxBurst value to change the TXFIFO size.
>>>
>>>>> If not with a ramdisk, we might want to give that a try to avoid the
>>>>> storage path being the bottleneck.  You can use "dd" to create an empty
>>>>> file, and then just use that as the LUN's backing file.
>>>>>
>>>>> echo ramdisk.img >
>>>>> /sys/kernel/config/usb_gadget/g1/functions/mass_storage.0/lun.0/file
>>>> Ah, why didn't I think of that. I have currently mass storage setup with
>>>> eMMC but it seems that is indeed the bottleneck.
>>>>
>> I created a 64MB disk following the instructions here
>> http://www.linux-usb.org/gadget/file_storage.html (that seems a little
>> outdated, at least I can not start the first partition at sector 8, but
>> minimum 2048), and added a test file on it.
>>
>> I then copy the file to /dev/shm prior to setting configfs (composite
>> device gser/eem/mass_storage/uac2).
>>
>> journal shows:
>>
>> kernel: Mass Storage Function, version: 2009/09/11
>> kernel: LUN: removable file: (no medium)
>>
>> I don't know what that means, because I see the test file on the ramdisk.
>>
>> Then I again used gnome disks to benchmark (read/write 10MB):
>>
>> With V10 on top v5.13.0-rc5:
>>
>> R/W speed = 35.6/35.8MB/s, access time 0.35ms
>>
>> With no patches on top v5.12.0:
>>
>> R/W speed = 35.7/36.1MB/s, access time 0.35ms
> 
> Hi Ferry,
> 
>>
>> I see no speed difference (and it's about the same as with the eMMC
>> backed disk). But the patches are causing a new call trace
>>
> 
> Would you happen to know what DWC3 controller revision the device is
> using?  The callstack print occurs, because it looks like it ran out of
> internal memory, although there should be logic present for making sure
> that at least there is enough room for 1 FIFO per endpoint.  (possibly
> the logic/math depends on the controller revision)
> 
> Also, is there a way to use just a mass storage only composition?  Based
> on the above observation, that probably means that the mass storage
> interface wasn't resized at all, because the configuration took up a lot
> of the internal FIFO space.
> 
> Thanks
> Wesley Cheng
> 
>> kernel: using random self ethernet address
>> kernel: using random host ethernet address
>> kernel: Mass Storage Function, version: 2009/09/11
>> kernel: LUN: removable file: (no medium)
>> kernel: usb0: HOST MAC aa:bb:cc:dd:ee:f2
>> kernel: usb0: MAC aa:bb:cc:dd:ee:f1
>> kernel: IPv6: ADDRCONF(NETDEV_CHANGE): usb0: link becomes ready
>> kernel: dwc3 dwc3.0.auto: Fifosize(2154) > RAM size(2022) ep5in
>> depth:115540359
>> kernel: ------------[ cut here ]------------
>> kernel: WARNING: CPU: 0 PID: 594 at drivers/usb/gadget/udc/core.c:278
>> usb_ep_queue+0x75/0x80
>> kernel: Modules linked in: usb_f_uac2 u_audio usb_f_mass_storage
>> usb_f_eem u_ether usb_f_serial u_serial libcomposite rfcomm iptable_nat
>> bnep snd_sof_nocodec spi_pxa2>
>> kernel: CPU: 0 PID: 594 Comm: irq/14-dwc3 Not tainted
>> 5.13.0-rc5-edison-acpi-standard #1
>> kernel: Hardware name: Intel Corporation Merrifield/BODEGA BAY, BIOS 542
>> 2015.01.21:18.19.48
>> kernel: RIP: 0010:usb_ep_queue+0x75/0x80
>> kernel: Code: 01 73 e4 48 8b 05 fb 63 06 01 48 85 c0 74 12 48 8b 78 08
>> 44 89 e9 4c 89 e2 48 89 ee e8 74 05 00 00 44 89 e8 5d 41 5c 41 5d c3
>> <0f> 0b 41 bd 94 ff ff ff >
>> kernel: RSP: 0000:ffff91eec083fc98 EFLAGS: 00010082
>> kernel: RAX: ffff8af20357d960 RBX: 0000000000000000 RCX: ffff8af202f06400
>> kernel: RDX: 0000000000000a20 RSI: ffff8af208785780 RDI: ffff8af202e9ae00
>> kernel: RBP: ffff8af202e9ae00 R08: 00000000000000c0 R09: ffff8af208785780
>> kernel: R10: 00000000ffffe000 R11: 3fffffffffffffff R12: ffff8af208785780
>> kernel: R13: 0000000000000000 R14: ffff8af202e9ae00 R15: ffff8af203e26cc0
>> kernel: FS:  0000000000000000(0000) GS:ffff8af23e200000(0000)
>> knlGS:0000000000000000
>> kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> kernel: CR2: 000055e2c21f2100 CR3: 0000000003b38000 CR4: 00000000001006f0
>> kernel: Call Trace:
>> kernel:  u_audio_start_playback+0x107/0x1a0 [u_audio]
>> kernel:  composite_setup+0x224/0x1ba0 [libcomposite]
>> kernel:  ? dwc3_gadget_ep_queue+0xf6/0x1a0
>> kernel:  ? usb_ep_queue+0x2a/0x80
>> kernel:  ? configfs_composite_setup+0x6b/0x90 [libcomposite]
>> kernel:  configfs_composite_setup+0x6b/0x90 [libcomposite]
>> kernel:  dwc3_ep0_interrupt+0x469/0xa80
>> kernel:  dwc3_thread_interrupt+0x8ee/0xf40
>> kernel:  ? __wake_up_common_lock+0x85/0xb0
>> kernel:  ? disable_irq_nosync+0x10/0x10
>> kernel:  irq_thread_fn+0x1b/0x60
>> kernel:  irq_thread+0xd6/0x170
>> kernel:  ? irq_thread_check_affinity+0x70/0x70
>> kernel:  ? irq_forced_thread_fn+0x70/0x70
>> kernel:  kthread+0x116/0x130
>> kernel:  ? kthread_create_worker_on_cpu+0x60/0x60
>> kernel:  ret_from_fork+0x22/0x30
>> kernel: ---[ end trace e5b9e28058c53584 ]---
>> kernel: configfs-gadget gadget: u_audio_start_playback:451 Error!
>> kernel: configfs-gadget gadget: u_audio_start_playback:451 Error!
>> kernel: dwc3 dwc3.0.auto: request 000000003c32dcc5 was not queued to ep5in
>> kernel: dwc3 dwc3.0.auto: request 00000000b2512aa9 was not queued to ep5in
>> kernel: dwc3 dwc3.0.auto: Fifosize(2154) > RAM size(2022) ep5in
>> depth:115540359
>> kernel: configfs-gadget gadget: u_audio_start_playback:451 Error!
>> kernel: configfs-gadget gadget: u_audio_start_playback:451 Error!
>> kernel: dwc3 dwc3.0.auto: request 00000000b2512aa9 was not queued to ep5in
>> kernel: dwc3 dwc3.0.auto: request 00000000036ac129 was not queued to ep5in
>> kernel: dwc3 dwc3.0.auto: Fifosize(2154) > RAM size(2022) ep5in
>> depth:115540359
>> kernel: configfs-gadget gadget: u_audio_start_playback:451 Error!
>> kernel: configfs-gadget gadget: u_audio_start_playback:451 Error!
>> kernel: dwc3 dwc3.0.auto: request 00000000ad1b8c18 was not queued to ep5in
>> kernel: dwc3 dwc3.0.auto: request 00000000fbc71244 was not queued to ep5in
>> kernel: dwc3 dwc3.0.auto: Fifosize(2154) > RAM size(2022) ep5in
>> depth:115540359
>> kernel: configfs-gadget gadget: u_audio_start_playback:451 Error!
>> kernel: configfs-gadget gadget: u_audio_start_playback:451 Error!
>> kernel: dwc3 dwc3.0.auto: request 00000000fbc71244 was not queued to ep5in
>> kernel: dwc3 dwc3.0.auto: request 00000000ad1b8c18 was not queued to ep5in
>> kernel: dwc3 dwc3.0.auto: Fifosize(2154) > RAM size(2022) ep5in
>> depth:115540359
>> kernel: configfs-gadget gadget: u_audio_start_playback:451 Error!
>> kernel: configfs-gadget gadget: u_audio_start_playback:451 Error!
>> kernel: dwc3 dwc3.0.auto: request 000000003c32dcc5 was not queued to ep5in
>> kernel: dwc3 dwc3.0.auto: request 00000000b2512aa9 was not queued to ep5in
>>
>> Removing uac2 from the config makes the call trace go away, but the R/W
>> speed does not change.

I am testing with 5.14.0-rc2 and now related error appears (not in rc1). 
Disabling uac2 solves it still. Any idea what it could be?

BUG: unable to handle page fault for address: 0000000500000000
#PF: supervisor instruction fetch in kernel mode
#PF: error_code(0x0010) - not-present page
PGD 0 P4D 0
Oops: 0010 [#1] SMP PTI
CPU: 0 PID: 494 Comm: irq/14-dwc3 Not tainted 
5.14.0-rc2-edison-acpi-standard #1
Hardware name: Intel Corporation Merrifield/BODEGA BAY, BIOS 542 
2015.01.21:18.19.48
RIP: 0010:0x500000000
Code: Unable to access opcode bytes at RIP 0x4ffffffd6.
RSP: 0018:ffffa4d00045fc28 EFLAGS: 00010046
RAX: 0000000500000000 RBX: ffff8cd546aed200 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffff8cd547bfcae0 RDI: ffff8cd546aed200
RBP: ffff8cd547bfcae0 R08: 0000000000000000 R09: 0000000000000001
R10: ffff8cd541fd28c0 R11: 0000000000000000 R12: ffff8cd547342828
R13: ffff8cd546aed248 R14: 0000000000000000 R15: ffff8cd548b1d000
FS:  0000000000000000(0000) GS:ffff8cd57e200000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000500000000 CR3: 000000000311e000 CR4: 00000000001006f0
Call Trace:
  ? dwc3_remove_requests.constprop.0+0x14d/0x170
  ? __dwc3_gadget_ep_disable+0x7a/0x160
  ? dwc3_gadget_ep_disable+0x3d/0xd0
  ? usb_ep_disable+0x1c/0x70
  ? u_audio_stop_capture+0x79/0x120 [u_audio]
  ? afunc_set_alt+0x73/0x80 [usb_f_uac2]
  ? composite_setup+0x224/0x1b90 [libcomposite]
  ? __dwc3_gadget_kick_transfer+0x160/0x400
  ? dwc3_gadget_ep_queue+0xf3/0x1a0
  ? configfs_composite_setup+0x6b/0x90 [libcomposite]
  ? configfs_composite_setup+0x6b/0x90 [libcomposite]
  ? dwc3_ep0_interrupt+0x459/0xa40
  ? dwc3_thread_interrupt+0x8ee/0xf40
  ? __schedule+0x235/0x6c0
  ? disable_irq_nosync+0x10/0x10
  ? irq_thread_fn+0x1b/0x60
  ? irq_thread+0xc0/0x160
  ? irq_thread_check_affinity+0x70/0x70
  ? irq_forced_thread_fn+0x70/0x70
  ? kthread+0x122/0x140
  ? set_kthread_struct+0x40/0x40
  ? ret_from_fork+0x22/0x30

>>> :), not a problem...I've been working on getting the ideal set up for
>>> the performance profiling for awhile, so anything I can do to make sure
>>> we get some good results.
>>>
>>>> I'll try with a ramdisk and let you know.
>>>>
>>> Thanks again for the testing, Ferry.
>>>
>>> Thanks
>>> Wesley Cheng
>>>
>>>>> Thanks
>>>>> Wesley Cheng
>>>>>
>>>>>>> Changes in V9:
>>>>>>>     - Fixed incorrect patch in series.  Removed changes in DTSI, as
>>>>>>> dwc3-qcom will
>>>>>>>       add the property by default from the kernel.
>>>>>>>
>>>>>>> Changes in V8:
>>>>>>>     - Rebased to usb-testing
>>>>>>>     - Using devm_kzalloc for adding txfifo property in dwc3-qcom
>>>>>>>     - Removed DWC3 QCOM ACPI property for enabling the txfifo resize
>>>>>>>
>>>>>>> Changes in V7:
>>>>>>>     - Added a new property tx-fifo-max-num for limiting how much fifo
>>>>>>> space the
>>>>>>>       resizing logic can allocate for endpoints with large burst
>>>>>>> values.  This
>>>>>>>       can differ across platforms, and tie in closely with overall
>>>>>>> system latency.
>>>>>>>     - Added recommended checks for DWC32.
>>>>>>>     - Added changes to set the tx-fifo-resize property from
>>>>>>> dwc3-qcom by
>>>>>>> default
>>>>>>>       instead of modifying the current DTSI files.
>>>>>>>     - Added comments on all APIs/variables introduced.
>>>>>>>     - Updated the DWC3 YAML to include a better description of the
>>>>>>> tx-fifo-resize
>>>>>>>       property and added an entry for tx-fifo-max-num.
>>>>>>>
>>>>>>> Changes in V6:
>>>>>>>     - Rebased patches to usb-testing.
>>>>>>>     - Renamed to PATCH series instead of RFC.
>>>>>>>     - Checking for fs_descriptors instead of ss_descriptors for
>>>>>>> determining the
>>>>>>>       endpoint count for a particular configuration.
>>>>>>>     - Re-ordered patch series to fix patch dependencies.
>>>>>>>
>>>>>>> Changes in V5:
>>>>>>>     - Added check_config() logic, which is used to communicate the
>>>>>>> number of EPs
>>>>>>>       used in a particular configuration.  Based on this, the DWC3
>>>>>>> gadget driver
>>>>>>>       has the ability to know the maximum number of eps utilized in
>>>>>>> all
>>>>>>> configs.
>>>>>>>       This helps reduce unnecessary allocation to unused eps, and will
>>>>>>> catch fifo
>>>>>>>       allocation issues at bind() time.
>>>>>>>     - Fixed variable declaration to single line per variable, and
>>>>>>> reverse xmas.
>>>>>>>     - Created a helper for fifo clearing, which is used by ep0.c
>>>>>>>
>>>>>>> Changes in V4:
>>>>>>>     - Removed struct dwc3* as an argument for
>>>>>>> dwc3_gadget_resize_tx_fifos()
>>>>>>>     - Removed WARN_ON(1) in case we run out of fifo space
>>>>>>>     Changes in V3:
>>>>>>>     - Removed "Reviewed-by" tags
>>>>>>>     - Renamed series back to RFC
>>>>>>>     - Modified logic to ensure that fifo_size is reset if we pass the
>>>>>>> minimum
>>>>>>>       threshold.  Tested with binding multiple FDs requesting 6 FIFOs.
>>>>>>>
>>>>>>> Changes in V2:
>>>>>>>     - Modified TXFIFO resizing logic to ensure that each EP is
>>>>>>> reserved a
>>>>>>>       FIFO.
>>>>>>>     - Removed dev_dbg() prints and fixed typos from patches
>>>>>>>     - Added some more description on the dt-bindings commit message
>>>>>>>
>>>>>>> Currently, there is no functionality to allow for resizing the
>>>>>>> TXFIFOs, and
>>>>>>> relying on the HW default setting for the TXFIFO depth.  In most
>>>>>>> cases, the
>>>>>>> HW default is probably sufficient, but for USB compositions that
>>>>>>> contain
>>>>>>> multiple functions that require EP bursting, the default settings
>>>>>>> might not be enough.  Also to note, the current SW will assign an
>>>>>>> EP to a
>>>>>>> function driver w/o checking to see if the TXFIFO size for that
>>>>>>> particular
>>>>>>> EP is large enough. (this is a problem if there are multiple HW
>>>>>>> defined
>>>>>>> values for the TXFIFO size)
>>>>>>>
>>>>>>> It is mentioned in the SNPS databook that a minimum of TX FIFO
>>>>>>> depth = 3
>>>>>>> is required for an EP that supports bursting.  Otherwise, there
>>>>>>> may be
>>>>>>> frequent occurences of bursts ending.  For high bandwidth functions,
>>>>>>> such as data tethering (protocols that support data aggregation),
>>>>>>> mass
>>>>>>> storage, and media transfer protocol (over FFS), the bMaxBurst value
>>>>>>> can be
>>>>>>> large, and a bigger TXFIFO depth may prove to be beneficial in terms
>>>>>>> of USB
>>>>>>> throughput. (which can be associated to system access latency,
>>>>>>> etc...)  It
>>>>>>> allows for a more consistent burst of traffic, w/o any
>>>>>>> interruptions, as
>>>>>>> data is readily available in the FIFO.
>>>>>>>
>>>>>>> With testing done using the mass storage function driver, the results
>>>>>>> show
>>>>>>> that with a larger TXFIFO depth, the bandwidth increased
>>>>>>> significantly.
>>>>>>>
>>>>>>> Test Parameters:
>>>>>>>     - Platform: Qualcomm SM8150
>>>>>>>     - bMaxBurst = 6
>>>>>>>     - USB req size = 256kB
>>>>>>>     - Num of USB reqs = 16
>>>>>>>     - USB Speed = Super-Speed
>>>>>>>     - Function Driver: Mass Storage (w/ ramdisk)
>>>>>>>     - Test Application: CrystalDiskMark
>>>>>>>
>>>>>>> Results:
>>>>>>>
>>>>>>> TXFIFO Depth = 3 max packets
>>>>>>>
>>>>>>> Test Case | Data Size | AVG tput (in MB/s)
>>>>>>> -------------------------------------------
>>>>>>> Sequential|1 GB x     |
>>>>>>> Read      |9 loops    | 193.60
>>>>>>>         |           | 195.86
>>>>>>>              |           | 184.77
>>>>>>>              |           | 193.60
>>>>>>> -------------------------------------------
>>>>>>>
>>>>>>> TXFIFO Depth = 6 max packets
>>>>>>>
>>>>>>> Test Case | Data Size | AVG tput (in MB/s)
>>>>>>> -------------------------------------------
>>>>>>> Sequential|1 GB x     |
>>>>>>> Read      |9 loops    | 287.35
>>>>>>>         |           | 304.94
>>>>>>>              |           | 289.64
>>>>>>>              |           | 293.61
>>>>>>> -------------------------------------------
>>>>>>>
>>>>>>> Wesley Cheng (6):
>>>>>>>      usb: gadget: udc: core: Introduce check_config to verify USB
>>>>>>>        configuration
>>>>>>>      usb: gadget: configfs: Check USB configuration before adding
>>>>>>>      usb: dwc3: Resize TX FIFOs to meet EP bursting requirements
>>>>>>>      of: Add stub for of_add_property()
>>>>>>>      usb: dwc3: dwc3-qcom: Enable tx-fifo-resize property by default
>>>>>>>      dt-bindings: usb: dwc3: Update dwc3 TX fifo properties
>>>>>>>
>>>>>>>     .../devicetree/bindings/usb/snps,dwc3.yaml         |  15 +-
>>>>>>>     drivers/usb/dwc3/core.c                            |   9 +
>>>>>>>     drivers/usb/dwc3/core.h                            |  15 ++
>>>>>>>     drivers/usb/dwc3/dwc3-qcom.c                       |   9 +
>>>>>>>     drivers/usb/dwc3/ep0.c                             |   2 +
>>>>>>>     drivers/usb/dwc3/gadget.c                          | 212
>>>>>>> +++++++++++++++++++++
>>>>>>>     drivers/usb/gadget/configfs.c                      |  22 +++
>>>>>>>     drivers/usb/gadget/udc/core.c                      |  25 +++
>>>>>>>     include/linux/of.h                                 |   5 +
>>>>>>>     include/linux/usb/gadget.h                         |   5 +
>>>>>>>     10 files changed, 317 insertions(+), 2 deletions(-)
>>>>>>>
> 

