Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8761E3F50DC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Aug 2021 20:54:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230192AbhHWSzk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Aug 2021 14:55:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230326AbhHWSzj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Aug 2021 14:55:39 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AEC7C061575;
        Mon, 23 Aug 2021 11:54:56 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id z19so3183993edi.9;
        Mon, 23 Aug 2021 11:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zyCDyWZRX0Z9GEuGkA5rE6/1Vqq4bZiHaEhicn47atE=;
        b=OJoEUX7AUM2GjF9QjFAgqL1YuheJeZp+6ETi9gpCTd9IvPW4/Z7xMrjax45PeflR/8
         Zqh5vdnQCRJV3eBfYLr2Tk6fVuWqPEwPrsz08xYWZSMn5AwTDRGHv1bLXHKLaH9pAlX/
         NNH5mZHIqvajyohk3n6ocA028mAQ2ucmGYug/GFQNmq5a2CiSCEl/e6Hyfuc8EueqSWc
         MNZCpOUrysgKjEQntHSeJT4FvGB2sSitYIKyHqTtA5hPxPXCmM8yNP6hvzacDeHc3MpW
         sQPx3X9hyv/ErZpn3XfP4MdmGVsdoehyq216UYLL2oRKIA7pciX5fnMmocbsU/SIeS+y
         8y1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zyCDyWZRX0Z9GEuGkA5rE6/1Vqq4bZiHaEhicn47atE=;
        b=CwlHoABYr6qXoKYiMfyU4z6jxIoJvF5/5eieJONIgql9hSwzDCGXovisuplQkw5Aj+
         EPhAqLZvs0lr3GILHwftHDqfdB5EMNlfA07BD+kpYBFzNOVqEV04EEMAUHIVaLt0tYoA
         1whFEihclToKLPx/SfIAAmF7gp4DnfKcKN34djphu2JeobyoemKh8dG3RRH+ZfJII1xO
         vOVVh4wFThZs++HUv48mAxTkzFiNXpVuC+i9u1unuMPgmNgJ2zT/gL1/a9q+v3UlAJRk
         ic//t33XU8nTI0lIF/b1enMt059NN1xVrl/odv7rHd0wyCWtrcW1g8Lk2N7eaNcI2OtS
         Hyuw==
X-Gm-Message-State: AOAM532ZRyRdyJnXiJzQKnTyntMvoG32z0sb91OIhrvFf7CxHNxJuhrD
        fukzK1PNe6nGVKBUJnS6TmQ=
X-Google-Smtp-Source: ABdhPJybHkZinMKRcRgOr6dtwz0uBkXlKzHJ6SD3csZmIIS+D1oO2+BelvyZvYA7kfgkv4jGFWrTSQ==
X-Received: by 2002:a05:6402:220f:: with SMTP id cq15mr17221179edb.142.1629744894621;
        Mon, 23 Aug 2021 11:54:54 -0700 (PDT)
Received: from ?IPv6:2001:981:6fec:1:a848:fb8b:9faa:5e40? ([2001:981:6fec:1:a848:fb8b:9faa:5e40])
        by smtp.gmail.com with ESMTPSA id se22sm1867813ejb.32.2021.08.23.11.54.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Aug 2021 11:54:54 -0700 (PDT)
Subject: Re: [PATCH v10 0/6] Re-introduce TX FIFO resize for larger EP
 bursting
To:     Pavel Hofman <pavel.hofman@ivitera.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Wesley Cheng <wcheng@codeaurora.org>,
        gregkh@linuxfoundation.org, robh+dt@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, frowand.list@gmail.com,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        jackp@codeaurora.org, heikki.krogerus@linux.intel.com,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>
References: <1623923899-16759-1-git-send-email-wcheng@codeaurora.org>
 <87v951ldlt.fsf@kernel.org> <d9aef50c-4bd1-4957-13d8-0b6a14b9fcd0@gmail.com>
 <87pmv9l1dv.fsf@kernel.org> <9dc6cd83-17b9-7075-0934-6b9d41b6875d@gmail.com>
 <87a6mbudvc.fsf@kernel.org> <6e8bb4ad-fe68-ad36-7416-2b8e10b6ae96@gmail.com>
 <877dhev68a.fsf@kernel.org> <cca69e90-b0ef-00b8-75d3-3bf959a93b45@gmail.com>
 <874kchvcq0.fsf@kernel.org> <e59f1201-2aa2-9075-1f94-a6ae7a046dc1@gmail.com>
 <8735raj766.fsf@kernel.org> <b3417c2c-613b-8ef6-2e2d-6e2cf9a5d5fd@gmail.com>
 <b3e820f0-9c94-7cba-a248-3b2ec5378ab0@gmail.com>
 <d298df65-417b-f318-9374-b463a15d8308@ivitera.com>
 <a7d7f0dd-dfbb-5eef-d1da-8cbdab5fc4a7@gmail.com>
 <c4e29ac0-1df1-3c64-1218-3687f07e7f77@ivitera.com>
 <1fb52c92-9319-c035-722f-695ab34723dd@gmail.com>
 <702c72cd-40e4-e641-797a-764e7e611afb@ivitera.com>
 <CAHp75VeZBLgf8YhEjdOV1Hva_dJh_=VHRGyVb=r44yh-9n+F4A@mail.gmail.com>
 <d1fb0ad5-e304-8864-a2e4-42d5f652a6a7@ivitera.com>
From:   Ferry Toth <fntoth@gmail.com>
Message-ID: <5f69cd06-f040-fdd2-1ea5-6bde28beb9fa@gmail.com>
Date:   Mon, 23 Aug 2021 20:54:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d1fb0ad5-e304-8864-a2e4-42d5f652a6a7@ivitera.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Op 23-08-2021 om 17:34 schreef Pavel Hofman:
> 
> 
> Dne 23. 08. 21 v 17:21 Andy Shevchenko napsal(a):
>> On Mon, Aug 23, 2021 at 5:59 PM Pavel Hofman 
>> <pavel.hofman@ivitera.com> wrote:
>>> Dne 22. 08. 21 v 21:43 Ferry Toth napsal(a):
>>>> Op 19-08-2021 om 23:04 schreef Pavel Hofman:
>>>>> Dne 19. 08. 21 v 22:10 Ferry Toth napsal(a):
>>>>>> Op 19-08-2021 om 09:51 schreef Pavel Hofman:
>>>>>>> Dne 18. 08. 21 v 21:07 Ferry Toth napsal(a):
>>>>>>>> Op 18-08-2021 om 00:00 schreef Ferry Toth:
>>
>> ...
>>
>>>>>>>> So, where do we go from here?
>>>>>>>
>>>>>>> I know the patches have been tested on dwc2 (by me and others).  I
>>>>>>> do not know if Ruslan or Jerome tested them on dwc3 but probably
>>>>>>> not. Ruslan has talked about RPi (my case too) and BeagleboneBlack,
>>>>>>> both with dwc2. Perhaps the dwc2 behaves a bit differently than 
>>>>>>> dwc3?
>>>>>>>
>>>>>>> The patches add a new EP-IN for async feedback. I am sorry I have
>>>>>>> not followed your long thread (it started as unrelated to uac). Does
>>>>>>> the problem appear with f_uac1 or f_uac2? Please how have you
>>>>>>> reached the above problem?
>>>>>>
>>>>>> I'm sorry too. I first believed the issue was related to the patch
>>>>>> mentioned in the subject line.
>>>>>>
>>>>>> The problem appaers with f_uac2. I bost Edison_Arduino board in host
>>>>>> mode (there is a switch allowing to select host/device mode). When
>>>>>> flipping the switch to device mode udev run a script:
>>>>>> But as I am using configfs (excerpt follows) and just disabling the
>>>>>> last 2 line resolves the issue, I'm guessing uac2 is the issue. Or
>>>>>> exceeding the available resources.
>>>>>>
>>>>>> # Create directory structure
>>>>>> mkdir "${GADGET_BASE_DIR}"
>>>>>> cd "${GADGET_BASE_DIR}"
>>>>>> mkdir -p configs/c.1/strings/0x409
>>>>>> mkdir -p strings/0x409
>>>>>>
>>>>>> # Serial device
>>>>>> mkdir functions/gser.usb0
>>>>>> ln -s functions/gser.usb0 configs/c.1/
>>>>>> ###
>>>>>>
>>>>>> # Ethernet device
>>>>>> mkdir functions/eem.usb0
>>>>>> echo "${DEV_ETH_ADDR}" > functions/eem.usb0/dev_addr
>>>>>> echo "${HOST_ETH_ADDR}" > functions/eem.usb0/host_addr
>>>>>> ln -s functions/eem.usb0 configs/c.1/
>>>>>>
>>>>>> # Mass Storage device
>>>>>> mkdir functions/mass_storage.usb0
>>>>>> echo 1 > functions/mass_storage.usb0/stall
>>>>>> echo 0 > functions/mass_storage.usb0/lun.0/cdrom
>>>>>> echo 0 > functions/mass_storage.usb0/lun.0/ro
>>>>>> echo 0 > functions/mass_storage.usb0/lun.0/nofua
>>>>>> echo "${USBDISK}" > functions/mass_storage.usb0/lun.0/file
>>>>>> ln -s functions/mass_storage.usb0 configs/c.1/
>>>>>>
>>>>>> # UAC2 device
>>>>>> mkdir functions/uac2.usb0
>>>>>> ln -s functions/uac2.usb0 configs/c.1
>>>>>> ....
>>>>>
>>>>> As you say, could perhaps the reason be that the extra EP-IN added in
>>>>> those patches (previously 1, now 2 with the default config you use)
>>>>> exceeds your EP-IN max count or available fifos somehow?  You have a
>>>>> number of functions initialized. If you change the load order of the
>>>>> functions, do you get the error later with a different function? Just
>>>>> guessing...
>>>>>
>>>>> You should be able to switch the default async EP-OUT (which
>>>>> configures the new feedback EP-IN ) to adaptive EP-OUT (which requires
>>>>> no feedback EP) with c_sync=8 parameter of f_uac2.
>>>>>
>>>>> https://elixir.bootlin.com/linux/v5.14-rc6/source/drivers/usb/gadget/function/f_uac2.c#L47 
>>>>>
>>>>>
>>>>> https://elixir.bootlin.com/linux/v5.14-rc6/source/drivers/usb/gadget/function/f_uac2.c#L830 
>>>>>
>>>>>
>>>>> https://elixir.bootlin.com/linux/v5.14-rc6/source/include/uapi/linux/usb/ch9.h#L453 
>>>>>
>>>>>
>>>>> Does that fix the problem?
>>>>
>>>> Not sure how to do that. Do you mean the module should have a parameter
>>>> called c_sync? `modinfo` list no parameters for usb_f_uac2.
>>>
>>> Those are configfs params, not available in modinfo.
>>>
>>> I checked and the value is "adaptive"
>>> https://elixir.bootlin.com/linux/v5.14-rc7/source/drivers/usb/gadget/function/f_uac2.c#L1312 
>>>
>>
>>> In your configfs script:
>>
>> Kernel shouldn't crash with any available set of configuration
>> parameters, right? So, even if the parameter would fix the crash the
>> series is buggy and has to be reverted in my opinion.

I will send in reverts tomorrow, unless someone has a better idea.

> Sure, no problem with reverting. I am just trying to start up some 
> troubleshooting. A resource exhaustion was mentioned here, that's why I 
> suggested a way to test the patch with the original number of endpoints 
> allocated. I do not get any crashes on my setup which uses fewer gadget 
> functions. That's why I asked what happens if the functions load order 
> is changed. I am afraid this thread is so complex that the actual 
> problem has been burried in the history.

I found some time to test your suggestions. So below 3 cases on rc6 with 
the reverts removed again:
1) the original configfs setup script
2) with uac2 moved to the top so it is created first (I hope)
3) same as 1) but with c_sync = adaptive

Summary:
1) still shows the crash as expected
2) has no effect
3) resolves the issue as you expect

1) Normal configfs order (uac2 last)
------------------------------------

root@yuna:~# [   50.975986] BUG: kernel NULL pointer dereference, 
address: 0000000000000008
[   50.983125] #PF: supervisor write access in kernel mode
[   50.988470] #PF: error_code(0x0002) - not-present page
[   50.993723] PGD 0 P4D 0
[   50.996327] Oops: 0002 [#1] SMP PTI
[   50.999899] CPU: 0 PID: 596 Comm: irq/14-dwc3 Tainted: G        W 
      5.14.0-rc6-edison-acpi-standard #1
[   51.009948] Hardware name: Intel Corporation Merrifield/BODEGA BAY, 
BIOS 542 2015.01.21:18.19.48
[   51.018922] RIP: 0010:dwc3_gadget_del_and_unmap_request+0x19/0xe0
[   51.025169] Code: 8b 78 08 e8 89 d6 ff ff 48 89 ef 5d e9 f0 61 a6 ff 
41 54 55 48 89 f5 53 48 8b 46 68 48 89 fb 48 8b 4e 60 4c 8b a7 90 00 00 
00 <48> 89 41 08 48 89 08 48 b8 00 01 00 00
00 00 ad de 80 a6 b4 00 00
[   51.044345] RSP: 0000:ffffb2ea40313c10 EFLAGS: 00010093
[   51.049692] RAX: ffff94dc03aa2c48 RBX: ffff94dc03aa2c00 RCX: 
0000000000000000
[   51.056985] RDX: 00000000ffffff94 RSI: ffff94dc02303d80 RDI: 
ffff94dc03aa2c00
[   51.064278] RBP: ffff94dc02303d80 R08: 0000000000000014 R09: 
0000000000000001
[   51.071572] R10: ffff94dc02303d80 R11: 0000000000000001 R12: 
ffff94dc08b43028
[   51.078864] R13: ffff94dc03aa2c48 R14: 0000000000000000 R15: 
ffff94dc031b3c00
[   51.086159] FS:  0000000000000000(0000) GS:ffff94dc3e200000(0000) 
knlGS:0000000000000000
[   51.094429] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   51.100304] CR2: 0000000000000008 CR3: 0000000007e20000 CR4: 
00000000001006f0
[   51.107596] Call Trace:
[   51.110103]  dwc3_remove_requests.constprop.0+0x12f/0x170
[   51.115637]  __dwc3_gadget_ep_disable+0x7a/0x160
[   51.120366]  dwc3_gadget_ep_disable+0x3d/0xd0
[   51.124827]  usb_ep_disable+0x1c/0x70
[   51.128586]  u_audio_stop_capture+0x79/0x120 [u_audio]
[   51.133857]  afunc_set_alt+0x73/0x80 [usb_f_uac2]
[   51.138683]  composite_setup+0x224/0x1b90 [libcomposite]
[   51.144137]  ? __dwc3_gadget_kick_transfer+0x160/0x400
[   51.149404]  ? configfs_composite_setup+0x6b/0x90 [libcomposite]
[   51.155562]  configfs_composite_setup+0x6b/0x90 [libcomposite]
[   51.161544]  dwc3_ep0_interrupt+0x466/0xa70
[   51.165831]  dwc3_thread_interrupt+0x829/0xe90
[   51.170379]  ? __schedule+0x235/0x6c0
[   51.174138]  ? disable_irq_nosync+0x10/0x10
[   51.178425]  irq_thread_fn+0x1b/0x60
[   51.182092]  irq_thread+0xc0/0x160
[   51.185580]  ? irq_thread_check_affinity+0x70/0x70
[   51.190486]  ? irq_forced_thread_fn+0x70/0x70
[   51.194948]  kthread+0x122/0x140
[   51.198259]  ? set_kthread_struct+0x40/0x40
[   51.202545]  ret_from_fork+0x22/0x30
[   51.206214] Modules linked in: usb_f_uac2 u_audio usb_f_mass_storage 
usb_f_eem u_ether usb_f_serial u_serial libcomposite rfcomm iptable_nat 
bnep spi_pxa2xx_platform snd_sof_nocodec dw_dmac smsc smsc95xx 
intel_mrfld_pwrbtn intel_mrfld_adc dw_dmac_pci pwm_lpss_pci dw_dmac_core 
pwm_lpss snd_sof_pci_intel_tng snd_sof_pci snd_sof_intel_ipc 
snd_sof_intel_atom snd_sof snd_sof_xtensa_dsp snd_soc_acpi 
spi_pxa2xx_pci brcmfmac brcmutil hci_uart btbcm ti_ads7950 
industrialio_triggered_buffer kfifo_buf leds_gpio ledtrig_timer 
ledtrig_heartbeat mmc_block extcon_intel_mrfld sdhci_pci cqhci sdhci 
led_class mmc_core intel_soc_pmic_mrfld btrfs libcrc32c xor 
zstd_compress zlib_deflate raid6_pq
[   51.267592] CR2: 0000000000000008
[   51.270981] ---[ end trace 135abe76b19414cc ]---

ferry@delfion:~$ cat /proc/asound/Gadget/stream0
USBArmory USBArmory Gadget at usb-0000:00:14.0-5, high speed : USB Audio

Playback:
   Status: Stop
   Interface 4
     Altset 1
     Format: S16_LE
     Channels: 2
     Endpoint: 0x04 (4 OUT) (ASYNC)
     Rates: 64000
     Data packet interval: 1000 us
     Bits: 16
     Channel map: FL FR
     Sync Endpoint: 0x85 (5 IN)
     Sync EP Interface: 4
     Sync EP Altset: 1
     Implicit Feedback Mode: No

Capture:
   Status: Stop
   Interface 5
     Altset 1
     Format: S16_LE
     Channels: 2
     Endpoint: 0x86 (6 IN) (ASYNC)
     Rates: 48000
     Data packet interval: 1000 us
     Bits: 16
     Channel map: FL FR

root@delfion:~# lsusb -v -d 1d6b:0104 | grep EP.*IN
         bEndpointAddress     0x82  EP 2 IN
         bEndpointAddress     0x83  EP 3 IN
         bEndpointAddress     0x84  EP 4 IN
         bEndpointAddress     0x85  EP 5 IN
         bEndpointAddress     0x86  EP 6 IN
can't get debug descriptor: Resource temporarily unavailable
cannot read device status, Resource temporarily unavailable (11)

2) uac2 first in configfs
-------------------------

root@yuna:~# [  172.094997] BUG: kernel NULL pointer dereference, 
address: 0000000000000008
[  172.102136] #PF: supervisor write access in kernel mode
[  172.107480] #PF: error_code(0x0002) - not-present page
[  172.112733] PGD 0 P4D 0
[  172.115338] Oops: 0002 [#1] SMP PTI
[  172.118909] CPU: 0 PID: 604 Comm: irq/14-dwc3 Tainted: G        W 
      5.14.0-rc6-edison-acpi-standard #1
[  172.128958] Hardware name: Intel Corporation Merrifield/BODEGA BAY, 
BIOS 542 2015.01.21:18.19.48
[  172.137931] RIP: 0010:dwc3_gadget_del_and_unmap_request+0x19/0xe0
[  172.144175] Code: 8b 78 08 e8 89 d6 ff ff 48 89 ef 5d e9 f0 61 a6 ff 
41 54 55 48 89 f5 53 48 8b 46 68 48 89 fb 48 8b 4e 60 4c 8b a7 90 00 00 
00 <48> 89 41 08 48 89 08 48 b8 00 01 00 00
00 00 ad de 80 a6 b4 00 00
[  172.163352] RSP: 0018:ffffa1438053bc10 EFLAGS: 00010097
[  172.168698] RAX: ffff9b76c7ec3848 RBX: ffff9b76c7ec3800 RCX: 
0000000000000000
[  172.175990] RDX: 00000000ffffff94 RSI: ffff9b76c79ffc00 RDI: 
ffff9b76c7ec3800
[  172.183283] RBP: ffff9b76c79ffc00 R08: 0000000000000014 R09: 
0000000000000001
[  172.190577] R10: ffff9b76c79ffc00 R11: 0000000000000002 R12: 
ffff9b76c8a66028
[  172.197870] R13: ffff9b76c7ec3848 R14: 0000000000000000 R15: 
ffff9b76c7255c00
[  172.205163] FS:  0000000000000000(0000) GS:ffff9b76fe200000(0000) 
knlGS:0000000000000000
[  172.213436] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  172.219309] CR2: 0000000000000008 CR3: 000000001360c000 CR4: 
00000000001006f0
[  172.226600] Call Trace:
[  172.229107]  dwc3_remove_requests.constprop.0+0x12f/0x170
[  172.234640]  __dwc3_gadget_ep_disable+0x7a/0x160
[  172.239372]  dwc3_gadget_ep_disable+0x3d/0xd0
[  172.243834]  usb_ep_disable+0x1c/0x70
[  172.247590]  u_audio_stop_capture+0x79/0x120 [u_audio]
[  172.252862]  afunc_set_alt+0x73/0x80 [usb_f_uac2]
[  172.257688]  composite_setup+0x224/0x1b90 [libcomposite]
[  172.263143]  ? __dwc3_gadget_kick_transfer+0x160/0x400
[  172.268410]  ? configfs_composite_setup+0x6b/0x90 [libcomposite]
[  172.274568]  configfs_composite_setup+0x6b/0x90 [libcomposite]
[  172.280551]  dwc3_ep0_interrupt+0x466/0xa70
[  172.284834]  ? newidle_balance.constprop.0+0xfa/0x380
[  172.290008]  dwc3_thread_interrupt+0x829/0xe90
[  172.294561]  ? __schedule+0x235/0x6c0
[  172.298316]  ? disable_irq_nosync+0x10/0x10
[  172.302606]  irq_thread_fn+0x1b/0x60
[  172.306272]  irq_thread+0xc0/0x160
[  172.309761]  ? irq_thread_check_affinity+0x70/0x70
[  172.314666]  ? irq_forced_thread_fn+0x70/0x70
[  172.319128]  kthread+0x122/0x140
[  172.322440]  ? set_kthread_struct+0x40/0x40
[  172.326724]  ret_from_fork+0x22/0x30
[  172.330390] Modules linked in: usb_f_mass_storage usb_f_eem u_ether 
usb_f_serial u_serial usb_f_uac2 u_audio libcomposite rfcomm iptable_nat 
bnep snd_sof_nocodec spi_pxa2xx_platform dw_dmac smsc smsc95xx 
pwm_lpss_pci pwm_lpss snd_sof_pci_intel_tng snd_sof_pci 
snd_sof_intel_ipc intel_mrfld_pwrbtn snd_sof_intel_atom intel_mrfld_adc 
dw_dmac_pci dw_dmac_core snd_sof snd_sof_xtensa_dsp snd_soc_acpi 
spi_pxa2xx_pci brcmfmac brcmutil hci_uart leds_gpio btbcm ti_ads7950 
industrialio_triggered_buffer kfifo_buf ledtrig_timer ledtrig_heartbeat 
mmc_block extcon_intel_mrfld sdhci_pci cqhci sdhci led_class mmc_core 
intel_soc_pmic_mrfld btrfs libcrc32c xor zstd_compress zlib_deflate raid6_pq
[  172.391766] CR2: 0000000000000008
[  172.395157] ---[ end trace 8272319264d5a2c0 ]---

3) With c_sync = adaptive
-------------------------
# UAC2 device
mkdir functions/uac2.usb0
echo "adaptive" > functions/uac2.usb0/c_sync
ln -s functions/uac2.usb0 configs/c.1

(No BUG)

root@delfion:~# cat /proc/asound/Gadget/stream0
USBArmory USBArmory Gadget at usb-0000:00:14.0-5, high speed : USB Audio

Playback:
   Status: Stop
   Interface 4
     Altset 1
     Format: S16_LE
     Channels: 2
     Endpoint: 0x04 (4 OUT) (ADAPTIVE)
     Rates: 64000
     Data packet interval: 1000 us
     Bits: 16
     Channel map: FL FR

Capture:
   Status: Stop
   Interface 5
     Altset 1
     Format: S16_LE
     Channels: 2
     Endpoint: 0x85 (5 IN) (ASYNC)
     Rates: 48000
     Data packet interval: 1000 us
     Bits: 16
     Channel map: FL FR


root@delfion:~# lsusb -v -d 1d6b:0104 |  grep EP.*IN
         bEndpointAddress     0x82  EP 2 IN
         bEndpointAddress     0x83  EP 3 IN
         bEndpointAddress     0x84  EP 4 IN
         bEndpointAddress     0x85  EP 5 IN
can't get debug descriptor: Resource temporarily unavailable

> Again, I am not the author of the patches, my USB knowledge is way 
> unsufficient for that. I am trying to make them work as they are 
> important and make the existing audio gadget actually usable.

Thanks for the suggestions, I didn't think to set params through configfs.

Maybe this will help in tracing the root cause, although that's way over 
my head.

> Thanks,
> 
> Pavel.

