Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B21233ADA02
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Jun 2021 14:40:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234186AbhFSMnE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 19 Jun 2021 08:43:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234112AbhFSMnD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 19 Jun 2021 08:43:03 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8F9BC061574;
        Sat, 19 Jun 2021 05:40:52 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id i13so12317187edb.9;
        Sat, 19 Jun 2021 05:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=4r3DDynJmRfMW1l3EdPXzjoIYAmaCBzJLmZBw8Xh62g=;
        b=WremX4h4qUhrLScKWVt8URLg80TeTVZw6R3F84IqZNqA/HvxyqjW4XsQTaXvQqFiEz
         NlkJjjBRhZo5lwO0lPfWa3SEpdANif3FpPp9WH2Gzz+/lskv7jJi4ek10TcfSytPFJ2f
         LqpBgta0+RzMcKS3oT8TWajZxjVamuziH3ldy14GvUvplh7Cv0y3qB9RuwBip3yeVR2I
         +TYkBZn5hJe6qpoxYX9Y9EhCHq2fJ4YCsqveeGb1DpJkK6U97MlAXvV8bOHi2znunn81
         C/JMoJ/YygOcjriSCDsS83xLXBbQIJ0dFkXgPKYfEV0e51czY8OXm9TcoyZhYNSFjlF0
         yaAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=4r3DDynJmRfMW1l3EdPXzjoIYAmaCBzJLmZBw8Xh62g=;
        b=iZiigg7Lm7D25b3gkfhLKpjluXtXGzcUVuWzsPbSlYK0e5DKdgu7/7dCbtGrK4I+HH
         5HEeKwb4M35OPeFnzHQkSBsy/2zwnyCrDWpPkxtvNyuvx1OpO4XxiW0hJbZ4zICqGJNb
         8K4z1Qc1xdkH4FBFBqqjZvH6KxerDconGsBlMDBH85Uvs9RozxAFp+1H7pmb30PYMaJS
         6gOE37zHwkXNQC0ubM/EquY3nIxjtqNONU1WXfXGUgoACmljxK9d2jGCVQ4fNmQ9WXRp
         Eh7i+pKwu+Jn5ktEtkRCigOrOaC7A7lZFMLZIrosPvWYz+aJsLc/zJDeDP6z9IV1yHkT
         Mf2g==
X-Gm-Message-State: AOAM531i2hgniM5lHiLvCs8QJaQN9VgsBQKrR/RKOPiJFuxNWUjKMQrI
        mJt/yC4UlJ6wF2CTxEffJe++PL7g3LqUow==
X-Google-Smtp-Source: ABdhPJyo47hYs5X4mrmiUqgz7/Qfp1mgy1otDD9ku5uXO3y46EZmjsDeEDvg8t3QxKP/UFzUAK1WMw==
X-Received: by 2002:a05:6402:51d1:: with SMTP id r17mr10568134edd.91.1624106451144;
        Sat, 19 Jun 2021 05:40:51 -0700 (PDT)
Received: from ?IPv6:2001:981:6fec:1:e9e8:2f65:ffcf:dffa? ([2001:981:6fec:1:e9e8:2f65:ffcf:dffa])
        by smtp.gmail.com with ESMTPSA id d24sm7898222edp.7.2021.06.19.05.40.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Jun 2021 05:40:50 -0700 (PDT)
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
From:   Ferry Toth <fntoth@gmail.com>
Message-ID: <2ae9fa6a-3bb1-3742-0dd3-59678bdd8643@gmail.com>
Date:   Sat, 19 Jun 2021 14:40:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <2e01c435-9ecc-4e3b-f55c-612a86667020@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi

Op 18-06-2021 om 00:25 schreef Wesley Cheng:
> Hi,
>
> On 6/17/2021 2:55 PM, Ferry Toth wrote:
>> Hi
>>
>> Op 17-06-2021 om 23:48 schreef Wesley Cheng:
>>> Hi,
>>>
>>> On 6/17/2021 2:01 PM, Ferry Toth wrote:
>>>> Hi
>>>>
>>>> Op 17-06-2021 om 11:58 schreef Wesley Cheng:
>>>>> Changes in V10:
>>>>>    - Fixed compilation errors in config where OF is not used (error due to
>>>>>      unknown symbol for of_add_property()).  Add of_add_property() stub.
>>>>>    - Fixed compilation warning for incorrect argument being passed to
>>>>> dwc3_mdwidth
>>>> This fixes the OOPS I had in V9. I do not see any change in performance
>>>> on Merrifield though.
>>> I see...thanks Ferry! With your testing, are you writing to the device's
>>> internal storage (ie UFS, eMMC, etc...), or did you use a ramdisk as well?
>> In this case I just tested the EEM path using iperf3.
>>
> Got it.  I don't believe f_eem will use a high enough (if at all)
> bMaxBurst value to change the TXFIFO size.
>
>>> If not with a ramdisk, we might want to give that a try to avoid the
>>> storage path being the bottleneck.  You can use "dd" to create an empty
>>> file, and then just use that as the LUN's backing file.
>>>
>>> echo ramdisk.img >
>>> /sys/kernel/config/usb_gadget/g1/functions/mass_storage.0/lun.0/file
>> Ah, why didn't I think of that. I have currently mass storage setup with
>> eMMC but it seems that is indeed the bottleneck.
>>
I created a 64MB disk following the instructions here 
http://www.linux-usb.org/gadget/file_storage.html (that seems a little 
outdated, at least I can not start the first partition at sector 8, but 
minimum 2048), and added a test file on it.

I then copy the file to /dev/shm prior to setting configfs (composite 
device gser/eem/mass_storage/uac2).

journal shows:

kernel: Mass Storage Function, version: 2009/09/11
kernel: LUN: removable file: (no medium)

I don't know what that means, because I see the test file on the ramdisk.

Then I again used gnome disks to benchmark (read/write 10MB):

With V10 on top v5.13.0-rc5:

R/W speed = 35.6/35.8MB/s, access time 0.35ms

With no patches on top v5.12.0:

R/W speed = 35.7/36.1MB/s, access time 0.35ms

I see no speed difference (and it's about the same as with the eMMC 
backed disk). But the patches are causing a new call trace

kernel: using random self ethernet address
kernel: using random host ethernet address
kernel: Mass Storage Function, version: 2009/09/11
kernel: LUN: removable file: (no medium)
kernel: usb0: HOST MAC aa:bb:cc:dd:ee:f2
kernel: usb0: MAC aa:bb:cc:dd:ee:f1
kernel: IPv6: ADDRCONF(NETDEV_CHANGE): usb0: link becomes ready
kernel: dwc3 dwc3.0.auto: Fifosize(2154) > RAM size(2022) ep5in 
depth:115540359
kernel: ------------[ cut here ]------------
kernel: WARNING: CPU: 0 PID: 594 at drivers/usb/gadget/udc/core.c:278 
usb_ep_queue+0x75/0x80
kernel: Modules linked in: usb_f_uac2 u_audio usb_f_mass_storage 
usb_f_eem u_ether usb_f_serial u_serial libcomposite rfcomm iptable_nat 
bnep snd_sof_nocodec spi_pxa2>
kernel: CPU: 0 PID: 594 Comm: irq/14-dwc3 Not tainted 
5.13.0-rc5-edison-acpi-standard #1
kernel: Hardware name: Intel Corporation Merrifield/BODEGA BAY, BIOS 542 
2015.01.21:18.19.48
kernel: RIP: 0010:usb_ep_queue+0x75/0x80
kernel: Code: 01 73 e4 48 8b 05 fb 63 06 01 48 85 c0 74 12 48 8b 78 08 
44 89 e9 4c 89 e2 48 89 ee e8 74 05 00 00 44 89 e8 5d 41 5c 41 5d c3 
<0f> 0b 41 bd 94 ff ff ff >
kernel: RSP: 0000:ffff91eec083fc98 EFLAGS: 00010082
kernel: RAX: ffff8af20357d960 RBX: 0000000000000000 RCX: ffff8af202f06400
kernel: RDX: 0000000000000a20 RSI: ffff8af208785780 RDI: ffff8af202e9ae00
kernel: RBP: ffff8af202e9ae00 R08: 00000000000000c0 R09: ffff8af208785780
kernel: R10: 00000000ffffe000 R11: 3fffffffffffffff R12: ffff8af208785780
kernel: R13: 0000000000000000 R14: ffff8af202e9ae00 R15: ffff8af203e26cc0
kernel: FS:  0000000000000000(0000) GS:ffff8af23e200000(0000) 
knlGS:0000000000000000
kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
kernel: CR2: 000055e2c21f2100 CR3: 0000000003b38000 CR4: 00000000001006f0
kernel: Call Trace:
kernel:  u_audio_start_playback+0x107/0x1a0 [u_audio]
kernel:  composite_setup+0x224/0x1ba0 [libcomposite]
kernel:  ? dwc3_gadget_ep_queue+0xf6/0x1a0
kernel:  ? usb_ep_queue+0x2a/0x80
kernel:  ? configfs_composite_setup+0x6b/0x90 [libcomposite]
kernel:  configfs_composite_setup+0x6b/0x90 [libcomposite]
kernel:  dwc3_ep0_interrupt+0x469/0xa80
kernel:  dwc3_thread_interrupt+0x8ee/0xf40
kernel:  ? __wake_up_common_lock+0x85/0xb0
kernel:  ? disable_irq_nosync+0x10/0x10
kernel:  irq_thread_fn+0x1b/0x60
kernel:  irq_thread+0xd6/0x170
kernel:  ? irq_thread_check_affinity+0x70/0x70
kernel:  ? irq_forced_thread_fn+0x70/0x70
kernel:  kthread+0x116/0x130
kernel:  ? kthread_create_worker_on_cpu+0x60/0x60
kernel:  ret_from_fork+0x22/0x30
kernel: ---[ end trace e5b9e28058c53584 ]---
kernel: configfs-gadget gadget: u_audio_start_playback:451 Error!
kernel: configfs-gadget gadget: u_audio_start_playback:451 Error!
kernel: dwc3 dwc3.0.auto: request 000000003c32dcc5 was not queued to ep5in
kernel: dwc3 dwc3.0.auto: request 00000000b2512aa9 was not queued to ep5in
kernel: dwc3 dwc3.0.auto: Fifosize(2154) > RAM size(2022) ep5in 
depth:115540359
kernel: configfs-gadget gadget: u_audio_start_playback:451 Error!
kernel: configfs-gadget gadget: u_audio_start_playback:451 Error!
kernel: dwc3 dwc3.0.auto: request 00000000b2512aa9 was not queued to ep5in
kernel: dwc3 dwc3.0.auto: request 00000000036ac129 was not queued to ep5in
kernel: dwc3 dwc3.0.auto: Fifosize(2154) > RAM size(2022) ep5in 
depth:115540359
kernel: configfs-gadget gadget: u_audio_start_playback:451 Error!
kernel: configfs-gadget gadget: u_audio_start_playback:451 Error!
kernel: dwc3 dwc3.0.auto: request 00000000ad1b8c18 was not queued to ep5in
kernel: dwc3 dwc3.0.auto: request 00000000fbc71244 was not queued to ep5in
kernel: dwc3 dwc3.0.auto: Fifosize(2154) > RAM size(2022) ep5in 
depth:115540359
kernel: configfs-gadget gadget: u_audio_start_playback:451 Error!
kernel: configfs-gadget gadget: u_audio_start_playback:451 Error!
kernel: dwc3 dwc3.0.auto: request 00000000fbc71244 was not queued to ep5in
kernel: dwc3 dwc3.0.auto: request 00000000ad1b8c18 was not queued to ep5in
kernel: dwc3 dwc3.0.auto: Fifosize(2154) > RAM size(2022) ep5in 
depth:115540359
kernel: configfs-gadget gadget: u_audio_start_playback:451 Error!
kernel: configfs-gadget gadget: u_audio_start_playback:451 Error!
kernel: dwc3 dwc3.0.auto: request 000000003c32dcc5 was not queued to ep5in
kernel: dwc3 dwc3.0.auto: request 00000000b2512aa9 was not queued to ep5in

Removing uac2 from the config makes the call trace go away, but the R/W 
speed does not change.

> :), not a problem...I've been working on getting the ideal set up for
> the performance profiling for awhile, so anything I can do to make sure
> we get some good results.
>
>> I'll try with a ramdisk and let you know.
>>
> Thanks again for the testing, Ferry.
>
> Thanks
> Wesley Cheng
>
>>> Thanks
>>> Wesley Cheng
>>>
>>>>> Changes in V9:
>>>>>    - Fixed incorrect patch in series.  Removed changes in DTSI, as
>>>>> dwc3-qcom will
>>>>>      add the property by default from the kernel.
>>>>>
>>>>> Changes in V8:
>>>>>    - Rebased to usb-testing
>>>>>    - Using devm_kzalloc for adding txfifo property in dwc3-qcom
>>>>>    - Removed DWC3 QCOM ACPI property for enabling the txfifo resize
>>>>>
>>>>> Changes in V7:
>>>>>    - Added a new property tx-fifo-max-num for limiting how much fifo
>>>>> space the
>>>>>      resizing logic can allocate for endpoints with large burst
>>>>> values.  This
>>>>>      can differ across platforms, and tie in closely with overall
>>>>> system latency.
>>>>>    - Added recommended checks for DWC32.
>>>>>    - Added changes to set the tx-fifo-resize property from dwc3-qcom by
>>>>> default
>>>>>      instead of modifying the current DTSI files.
>>>>>    - Added comments on all APIs/variables introduced.
>>>>>    - Updated the DWC3 YAML to include a better description of the
>>>>> tx-fifo-resize
>>>>>      property and added an entry for tx-fifo-max-num.
>>>>>
>>>>> Changes in V6:
>>>>>    - Rebased patches to usb-testing.
>>>>>    - Renamed to PATCH series instead of RFC.
>>>>>    - Checking for fs_descriptors instead of ss_descriptors for
>>>>> determining the
>>>>>      endpoint count for a particular configuration.
>>>>>    - Re-ordered patch series to fix patch dependencies.
>>>>>
>>>>> Changes in V5:
>>>>>    - Added check_config() logic, which is used to communicate the
>>>>> number of EPs
>>>>>      used in a particular configuration.  Based on this, the DWC3
>>>>> gadget driver
>>>>>      has the ability to know the maximum number of eps utilized in all
>>>>> configs.
>>>>>      This helps reduce unnecessary allocation to unused eps, and will
>>>>> catch fifo
>>>>>      allocation issues at bind() time.
>>>>>    - Fixed variable declaration to single line per variable, and
>>>>> reverse xmas.
>>>>>    - Created a helper for fifo clearing, which is used by ep0.c
>>>>>
>>>>> Changes in V4:
>>>>>    - Removed struct dwc3* as an argument for dwc3_gadget_resize_tx_fifos()
>>>>>    - Removed WARN_ON(1) in case we run out of fifo space
>>>>>    Changes in V3:
>>>>>    - Removed "Reviewed-by" tags
>>>>>    - Renamed series back to RFC
>>>>>    - Modified logic to ensure that fifo_size is reset if we pass the
>>>>> minimum
>>>>>      threshold.  Tested with binding multiple FDs requesting 6 FIFOs.
>>>>>
>>>>> Changes in V2:
>>>>>    - Modified TXFIFO resizing logic to ensure that each EP is reserved a
>>>>>      FIFO.
>>>>>    - Removed dev_dbg() prints and fixed typos from patches
>>>>>    - Added some more description on the dt-bindings commit message
>>>>>
>>>>> Currently, there is no functionality to allow for resizing the
>>>>> TXFIFOs, and
>>>>> relying on the HW default setting for the TXFIFO depth.  In most
>>>>> cases, the
>>>>> HW default is probably sufficient, but for USB compositions that contain
>>>>> multiple functions that require EP bursting, the default settings
>>>>> might not be enough.  Also to note, the current SW will assign an EP to a
>>>>> function driver w/o checking to see if the TXFIFO size for that
>>>>> particular
>>>>> EP is large enough. (this is a problem if there are multiple HW defined
>>>>> values for the TXFIFO size)
>>>>>
>>>>> It is mentioned in the SNPS databook that a minimum of TX FIFO depth = 3
>>>>> is required for an EP that supports bursting.  Otherwise, there may be
>>>>> frequent occurences of bursts ending.  For high bandwidth functions,
>>>>> such as data tethering (protocols that support data aggregation), mass
>>>>> storage, and media transfer protocol (over FFS), the bMaxBurst value
>>>>> can be
>>>>> large, and a bigger TXFIFO depth may prove to be beneficial in terms
>>>>> of USB
>>>>> throughput. (which can be associated to system access latency,
>>>>> etc...)  It
>>>>> allows for a more consistent burst of traffic, w/o any interruptions, as
>>>>> data is readily available in the FIFO.
>>>>>
>>>>> With testing done using the mass storage function driver, the results
>>>>> show
>>>>> that with a larger TXFIFO depth, the bandwidth increased significantly.
>>>>>
>>>>> Test Parameters:
>>>>>    - Platform: Qualcomm SM8150
>>>>>    - bMaxBurst = 6
>>>>>    - USB req size = 256kB
>>>>>    - Num of USB reqs = 16
>>>>>    - USB Speed = Super-Speed
>>>>>    - Function Driver: Mass Storage (w/ ramdisk)
>>>>>    - Test Application: CrystalDiskMark
>>>>>
>>>>> Results:
>>>>>
>>>>> TXFIFO Depth = 3 max packets
>>>>>
>>>>> Test Case | Data Size | AVG tput (in MB/s)
>>>>> -------------------------------------------
>>>>> Sequential|1 GB x     |
>>>>> Read      |9 loops    | 193.60
>>>>>        |           | 195.86
>>>>>             |           | 184.77
>>>>>             |           | 193.60
>>>>> -------------------------------------------
>>>>>
>>>>> TXFIFO Depth = 6 max packets
>>>>>
>>>>> Test Case | Data Size | AVG tput (in MB/s)
>>>>> -------------------------------------------
>>>>> Sequential|1 GB x     |
>>>>> Read      |9 loops    | 287.35
>>>>>        |           | 304.94
>>>>>             |           | 289.64
>>>>>             |           | 293.61
>>>>> -------------------------------------------
>>>>>
>>>>> Wesley Cheng (6):
>>>>>     usb: gadget: udc: core: Introduce check_config to verify USB
>>>>>       configuration
>>>>>     usb: gadget: configfs: Check USB configuration before adding
>>>>>     usb: dwc3: Resize TX FIFOs to meet EP bursting requirements
>>>>>     of: Add stub for of_add_property()
>>>>>     usb: dwc3: dwc3-qcom: Enable tx-fifo-resize property by default
>>>>>     dt-bindings: usb: dwc3: Update dwc3 TX fifo properties
>>>>>
>>>>>    .../devicetree/bindings/usb/snps,dwc3.yaml         |  15 +-
>>>>>    drivers/usb/dwc3/core.c                            |   9 +
>>>>>    drivers/usb/dwc3/core.h                            |  15 ++
>>>>>    drivers/usb/dwc3/dwc3-qcom.c                       |   9 +
>>>>>    drivers/usb/dwc3/ep0.c                             |   2 +
>>>>>    drivers/usb/dwc3/gadget.c                          | 212
>>>>> +++++++++++++++++++++
>>>>>    drivers/usb/gadget/configfs.c                      |  22 +++
>>>>>    drivers/usb/gadget/udc/core.c                      |  25 +++
>>>>>    include/linux/of.h                                 |   5 +
>>>>>    include/linux/usb/gadget.h                         |   5 +
>>>>>    10 files changed, 317 insertions(+), 2 deletions(-)
>>>>>
