Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8B873F463A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Aug 2021 09:57:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235455AbhHWH6c (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Aug 2021 03:58:32 -0400
Received: from cable.insite.cz ([84.242.75.189]:60488 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235243AbhHWH6a (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Aug 2021 03:58:30 -0400
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 2C192A1A3D403;
        Mon, 23 Aug 2021 09:57:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1629705465; bh=L38Aen5r0xsTbLpgr1HRpJ19Yo2MGbe6ITN880ZsdE4=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=DTwwohZvU1wRxeMPOOwxnWsLAe9Xf/ifVExpjq9xJP77wY7GRjZexDyL6JziwSc+E
         g0amaPFP2NmcmphFiAiv07XGk7NUgdlp+9r2TN6wHcaiSuMbdv3RygVQU1WwOkwyyB
         21AMTLgqasDqIcndZsPDVsh1glBe79FTTTbqn3Vo=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 3TWUuRcLy6hv; Mon, 23 Aug 2021 09:57:38 +0200 (CEST)
Received: from [192.168.105.22] (dustin.pilsfree.net [81.201.58.138])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 3AEC0A1A3D400;
        Mon, 23 Aug 2021 09:57:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1629705458; bh=L38Aen5r0xsTbLpgr1HRpJ19Yo2MGbe6ITN880ZsdE4=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=K4fSWoB6Y5GLEOhAcpLDEz4y2J4JaYFo0RoRXR8YC46G/JTMPbn7dwBBJ+eNRxhjA
         qRmZdtrzJqrkZCu0zVOwWp5N0RoMRzvUkVxgrFELFMdVxSRjTkGGXB9TLm8k+OsMre
         PSz//QQT+DIj3YrH8ohmp7iJtYpt/hIv+Elg/CG4=
Subject: Re: [PATCH v10 0/6] Re-introduce TX FIFO resize for larger EP
 bursting
To:     Ferry Toth <fntoth@gmail.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Felipe Balbi <balbi@kernel.org>
Cc:     Wesley Cheng <wcheng@codeaurora.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "agross@kernel.org" <agross@kernel.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "frowand.list@gmail.com" <frowand.list@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "jackp@codeaurora.org" <jackp@codeaurora.org>,
        "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
        "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Jerome Brunet <jbrunet@baylibre.com>
References: <1623923899-16759-1-git-send-email-wcheng@codeaurora.org>
 <2ae9fa6a-3bb1-3742-0dd3-59678bdd8643@gmail.com>
 <ebea75fe-5334-197b-f67a-cb6e1e30b39e@codeaurora.org>
 <bafa93bb-11e3-c8a5-e14a-b0a6d5695055@gmail.com> <87v951ldlt.fsf@kernel.org>
 <d9aef50c-4bd1-4957-13d8-0b6a14b9fcd0@gmail.com> <87pmv9l1dv.fsf@kernel.org>
 <9dc6cd83-17b9-7075-0934-6b9d41b6875d@gmail.com> <87a6mbudvc.fsf@kernel.org>
 <6e8bb4ad-fe68-ad36-7416-2b8e10b6ae96@gmail.com> <877dhev68a.fsf@kernel.org>
 <cca69e90-b0ef-00b8-75d3-3bf959a93b45@gmail.com> <874kchvcq0.fsf@kernel.org>
 <e59f1201-2aa2-9075-1f94-a6ae7a046dc1@gmail.com> <8735raj766.fsf@kernel.org>
 <b3417c2c-613b-8ef6-2e2d-6e2cf9a5d5fd@gmail.com>
 <b3e820f0-9c94-7cba-a248-3b2ec5378ab0@gmail.com>
 <d298df65-417b-f318-9374-b463a15d8308@ivitera.com>
 <a7d7f0dd-dfbb-5eef-d1da-8cbdab5fc4a7@gmail.com>
 <c4e29ac0-1df1-3c64-1218-3687f07e7f77@ivitera.com>
 <60e57455-3768-ab1c-efad-b6a64e592b36@synopsys.com>
 <9c97fa38-e66e-5b31-a79a-2b5d24f3cc66@gmail.com>
From:   Pavel Hofman <pavel.hofman@ivitera.com>
Message-ID: <0e35cf2a-b042-db7f-b775-15a40c21d275@ivitera.com>
Date:   Mon, 23 Aug 2021 09:57:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <9c97fa38-e66e-5b31-a79a-2b5d24f3cc66@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



Dne 22. 08. 21 v 22:10 Ferry Toth napsal(a):
> Op 21-08-2021 om 04:57 schreef Thinh Nguyen:
>> Pavel Hofman wrote:
>>>
>>> Dne 19. 08. 21 v 22:10 Ferry Toth napsal(a):
>>>> Hi
>>>>
>>>> Op 19-08-2021 om 09:51 schreef Pavel Hofman:
>>>>> Hi,
>>>>>
>>>>> Dne 18. 08. 21 v 21:07 Ferry Toth napsal(a):
>>>>>> Hi,
>>>>>>
>>>>>> Op 18-08-2021 om 00:00 schreef Ferry Toth:
>>>>>>> Hi,
>>>>>>>
>>>>>>> Op 16-08-2021 om 07:18 schreef Felipe Balbi:
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>> Ferry Toth <fntoth@gmail.com> writes:
>>>>>>>>>> Ferry Toth <fntoth@gmail.com> writes:
>>>>>>>>>>>>>> Ferry Toth <fntoth@gmail.com> writes:
>>>>>>>>>>>>>>>>>>> Hardware name: Intel Corporation Merrifield/BODEGA BAY,
>>>>>>>>>>>>>>>>>>> BIOS 542
>>>>>>>>>>>>>>>>>>> 2015.01.21:18.19.48
>>>>>>>>>>>>>>>>>>> RIP: 0010:0x500000000
>>>>>>>>>>>>>>>>>>> Code: Unable to access opcode bytes at RIP 0x4ffffffd6.
>>>>>>>>>>>>>>>>>>> RSP: 0018:ffffa4d00045fc28 EFLAGS: 00010046
>>>>>>>>>>>>>>>>>>> RAX: 0000000500000000 RBX: ffff8cd546aed200 RCX:
>>>>>>>>>>>>>>>>>>> 0000000000000000
>>>>>>>>>>>>>>>>>>> RDX: 0000000000000000 RSI: ffff8cd547bfcae0 RDI:
>>>>>>>>>>>>>>>>>>> ffff8cd546aed200
>>>>>>>>>>>>>>>>>>> RBP: ffff8cd547bfcae0 R08: 0000000000000000 R09:
>>>>>>>>>>>>>>>>>>> 0000000000000001
>>>>>>>>>>>>>>>>>>> R10: ffff8cd541fd28c0 R11: 0000000000000000 R12:
>>>>>>>>>>>>>>>>>>> ffff8cd547342828
>>>>>>>>>>>>>>>>>>> R13: ffff8cd546aed248 R14: 0000000000000000 R15:
>>>>>>>>>>>>>>>>>>> ffff8cd548b1d000
>>>>>>>>>>>>>>>>>>> FS:  0000000000000000(0000) GS:ffff8cd57e200000(0000)
>>>>>>>>>>>>>>>>>>> knlGS:0000000000000000
>>>>>>>>>>>>>>>>>>> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>>>>>>>>>>>>>>>>>> CR2: 0000000500000000 CR3: 000000000311e000 CR4:
>>>>>>>>>>>>>>>>>>> 00000000001006f0
>>>>>>>>>>>>>>>>>>> Call Trace:
>>>>>>>>>>>>>>>>>>>          ? dwc3_remove_requests.constprop.0+0x14d/0x170
>>>>>>>>>>>>>>>>>>>          ? __dwc3_gadget_ep_disable+0x7a/0x160
>>>>>>>>>>>>>>>>>>>          ? dwc3_gadget_ep_disable+0x3d/0xd0
>>>>>>>>>>>>>>>>>>>          ? usb_ep_disable+0x1c/0x
>>>>>>>>>>>>>>>>>>>          ? u_audio_stop_capture+0x79/0x120 [u_audio]
>>>>>>>>>>>>>>>>>>>          ? afunc_set_alt+0x73/0x80 [usb_f_uac2]
>>>>>>>>>>>> So this is triggered by a SetInterface request...
>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>          ? composite_setup+0x224/0x1b90 [libcomposite]
>>>>>>>>>>>>>>>>>>>          ? __dwc3_gadget_kick_transfer+0x160/0x400
>>>>>>>>>>>>>>>>>>>          ? dwc3_gadget_ep_queue+0xf3/0x1a0
>>>>>>>>>>>>>>>>>>>          ? configfs_composite_setup+0x6b/0x90
>>>>>>>>>>>>>>>>>>> [libcomposite]
>>>>>>>>>>>>>>>>>>>          ? configfs_composite_setup+0x6b/0x90
>>>>>>>>>>>>>>>>>>> [libcomposite]
>>>>>>>>>>>>>>>>>>>          ? dwc3_ep0_interrupt+0x459/0xa40
>>>>>>>>>>>>>>>>>>>          ? dwc3_thread_interrupt+0x8ee/0xf40
>>>>>>>>>>>>>>>>>>>          ? __schedule+0x235/0x6c0
>>>>>>>>>>>>>>>>>>>          ? disable_irq_nosync+0x10/0x10
>>>>>>>>>>>>>>>>>>>          ? irq_thread_fn+0x1b/0x60
>>>>>>>>>>>>>>>>>>>          ? irq_thread+0xc0/0x160
>>>>>>>>>>>>>>>>>>>          ? irq_thread_check_affinity+0x70/0x70
>>>>>>>>>>>>>>>>>>>          ? irq_forced_thread_fn+0x70/0x70
>>>>>>>>>>>>>>>>>>>          ? kthread+0x122/0x140
>>>>>>>>>>>>>>>>>>>          ? set_kthread_struct+0x40/0x40
>>>>>>>>>>>>>>>>>>>          ? ret_from_fork+0x22/0x30
>>>>>>>>>>>>>>>>>> Do you mind enabling dwc3 traces and collecting them?
>>>>>>>>>>>>>>>>>> Trying to figure
>>>>>>>>>>>>>>>>>> out how we got here.
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>> I'll try if I can get the same error by booting with USB
>>>>>>>>>>>>>>>>> in host mode
>>>>>>>>>>>>>>>>> and then switch to device mode. If so I can enable traces
>>>>>>>>>>>>>>>>> and collect as
>>>>>>>>>>>>>>>>> you explained me before.
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>> I'll try before monday, as then I fly for a holiday and
>>>>>>>>>>>>>>>>> will not be
>>>>>>>>>>>>>>>>> available before rc5.
>>>>>>>>>>>>>>>> you can enable all of those with kernel cmdline :-)
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> https://urldefense.com/v3/__https://www.kernel.org/doc/html/latest/admin-guide/kernel-parameters.html__;!!A4F2R9G_pg!PZHOWnH3HDs-9a9bz4KLDShZpsubSfG84fu3wEZyK4Q_Wvv2lhHKuk7LJpWPAPch0qja$ 
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> you need ftrace_dump_on_oops=1 and also need the correct
>>>>>>>>>>>>>>>> options on
>>>>>>>>>>>>>>>> trace_buf_size and trace_event.
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> On Edison-Arduino I have a switch to go to device mode,
>>>>>>>>>>>>>>> after which
>>>>>>>>>>>>>>> udev triggers a script configure gadgets through configfs.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> I tried to log following these instructions:
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> https://urldefense.com/v3/__https://www.kernel.org/doc/html/latest/driver-api/usb/dwc3.html*reporting-bugs__;Iw!!A4F2R9G_pg!PZHOWnH3HDs-9a9bz4KLDShZpsubSfG84fu3wEZyK4Q_Wvv2lhHKuk7LJpWPAG64agnA$ 
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> <https://urldefense.com/v3/__https://www.kernel.org/doc/html/latest/driver-api/usb/dwc3.html*reporting-bugs__;Iw!!A4F2R9G_pg!PZHOWnH3HDs-9a9bz4KLDShZpsubSfG84fu3wEZyK4Q_Wvv2lhHKuk7LJpWPAG64agnA$ 
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> Unfortunately the kernel crashes so badly I can not get to
>>>>>>>>>>>>>>> the ` cp
>>>>>>>>>>>>>>> /t/trace /root/trace.txt` line (after a while the watchdog
>>>>>>>>>>>>>>> kicks).
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> What to do next?
>>>>>>>>>>>>>> Pass ftrace_dump_on_oops to kernel cmdline.
>>>>>>>>>>>>>>
>>>>>>>>>>>>> No sure if I did this right, on oops everything is pushed to
>>>>>>>>>>>>> console
>>>>>>>>>>>>> (115k2 serial), I hope nothing essential is lost.
>>>>>>>>>>>>>
>>>>>>>>>>>>> I copied the screen buffer to file see attached.
>>>>>>>>>>>> Thank you, I bet it took quite a some time :-) Anyway, 
>>>>>>>>>>>> looking at
>>>>>>>>>>>> the logs around Set Interface requests, we can track every
>>>>>>>>>>>> endpoint
>>>>>>>>>>>> that's disabled. I'll take a guess and assume we're failing at
>>>>>>>>>>>> the last
>>>>>>>>>>>> Set Interface, that means we should have something odd with
>>>>>>>>>>>> ep6in, but
>>>>>>>>>>>> everything looks fine in the trace output:
>>>>>>>>>>>>
>>>>>>>>>>>> [   75.823107] irq/14-d-596       0d... 42789194us :
>>>>>>>>>>>> dwc3_gadget_ep_enable: ep6in: mps 192/346 streams 16 burst 0
>>>>>>>>>>>> ring 0/0 flags E:swbp:<
>>>>>>>>>>>> [   75.835472] irq/14-d-596       0d... 42789198us :
>>>>>>>>>>>> dwc3_alloc_request: ep6in: req 0000000002c71409 length 0/0 zsI
>>>>>>>>>>>> ==> 0
>>>>>>>>>>>> [   75.846416] irq/14-d-596       0d... 42789202us :
>>>>>>>>>>>> dwc3_ep_queue: ep6in: req 0000000002c71409 length 0/192 zsI
>>>>>>>>>>>> ==> -115
>>>>>>>>>>>> [   75.857360] irq/14-d-596       0d... 42789204us :
>>>>>>>>>>>> dwc3_alloc_request: ep6in: req 00000000a324f5d0 length 0/0 zsI
>>>>>>>>>>>> ==> 0
>>>>>>>>>>>> [   75.868301] irq/14-d-596       0d... 42789206us :
>>>>>>>>>>>> dwc3_ep_queue: ep6in: req 00000000a324f5d0 length 0/192 zsI
>>>>>>>>>>>> ==> -115
>>>>>>>>>>>> [   75.879244] irq/14-d-596       0d... 42789209us :
>>>>>>>>>>>> dwc3_event: event (000020c2): ep0in: Transfer Not Ready [0]
>>>>>>>>>>>> (Not Active) [Status Phase]
>>>>>>>>>>>> [   75.891880] irq/14-d-596       0d... 42789211us :
>>>>>>>>>>>> dwc3_prepare_trb: ep0in: trb 000000004c0ae319 (E0:D0) buf
>>>>>>>>>>>> 000000001bded000 size 0 ctrl 00000c33 (HLcs:SC:status2)
>>>>>>>>>>>> [   75.989131] irq/14-d-596       0d... 42789224us :
>>>>>>>>>>>> dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params
>>>>>>>>>>>> 00000000 1bded000 00000000 --> status: Successful
>>>>>>>>>>>> [   76.096261] irq/14-d-596       0d... 42789272us :
>>>>>>>>>>>> dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL)
>>>>>>>>>>>> [Status Phase]
>>>>>>>>>>>> [   76.107834] irq/14-d-596       0d... 42789275us :
>>>>>>>>>>>> dwc3_complete_trb: ep0out: trb 000000004c0ae319 (E0:D0) buf
>>>>>>>>>>>> 000000001bded000 size 0 ctrl 00000c32 (hLcs:SC:status2)
>>>>>>>>>>>> [   76.122944] irq/14-d-596       0d... 42789277us :
>>>>>>>>>>>> dwc3_gadget_giveback: ep0out: req 00000000cb1bd3cd length 0/0
>>>>>>>>>>>> zsI ==> 0
>>>>>>>>>>>> [   76.134160] irq/14-d-596       0d... 42789280us :
>>>>>>>>>>>> dwc3_prepare_trb: ep0out: trb 000000004c0ae319 (E0:D0) buf
>>>>>>>>>>>> 000000001bded000 size 8 ctrl 00000c23 (HLcs:SC:setup)
>>>>>>>>>>>> [   76.231322] irq/14-d-596       0d... 42789292us :
>>>>>>>>>>>> dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params
>>>>>>>>>>>> 00000000 1bded000 00000000 --> status: Successful
>>>>>>>>>>>> [   76.297418] kworker/-23        0d... 42789670us :
>>>>>>>>>>>> dwc3_ep_queue: ep3in: req 0000000029586135 length 0/96 ZsI ==>
>>>>>>>>>>>> -115
>>>>>>>>>>>> [   76.308278] kworker/-23        0d... 42789695us :
>>>>>>>>>>>> dwc3_prepare_trb: ep3in: trb 00000000b81213d6 (E1:D0) buf
>>>>>>>>>>>> 0000000003b7a800 size 96 ctrl 00000811 (Hlcs:sC:normal)
>>>>>>>>>>>> [   76.395294] kworker/-23        0d... 42789707us :
>>>>>>>>>>>> dwc3_gadget_ep_cmd: ep3in: cmd 'Update Transfer' [60007]
>>>>>>>>>>>> params 00000000 00000000 00000000 --> status: Successful
>>>>>>>>>>>> [   76.471900] irq/14-d-596       0d... 42789842us :
>>>>>>>>>>>> dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL)
>>>>>>>>>>>> [Setup Phase]
>>>>>>>>>>>> [   76.489308] irq/14-d-596       0d... 42789845us :
>>>>>>>>>>>> dwc3_ctrl_req: Set Interface(Intf = 5, Alt.Setting = 0)
>>>>>>>>>>>> [   76.505650] irq/14-d-596       0d... 42789851us :
>>>>>>>>>>>> dwc3_ep_dequeue: ep6in: req 0000000002c71409 length 0/192 zsI
>>>>>>>>>>>> ==> -115
>>>>>>>>>>>> [   76.523315] irq/14-d-596       0d... 42789854us :
>>>>>>>>>>>> dwc3_gadget_giveback: ep6in: req 0000000002c71409 length 0/192
>>>>>>>>>>>> zsI ==> -104
>>>>>>>>>>>> [   76.541427] irq/14-d-596       0d... 42789857us :
>>>>>>>>>>>> dwc3_free_request: ep6in: req 0000000002c71409 length 0/192
>>>>>>>>>>>> zsI ==> -104
>>>>>>>>>>>> [   76.559267] irq/14-d-596       0d... 42789859us :
>>>>>>>>>>>> dwc3_ep_dequeue: ep6in: req 00000000a324f5d0 length 0/192 zsI
>>>>>>>>>>>> ==> -115
>>>>>>>>>>>> [   76.576937] irq/14-d-596       0d... 42789861us :
>>>>>>>>>>>> dwc3_gadget_giveback: ep6in: req 00000000a324f5d0 length 0/192
>>>>>>>>>>>> zsI ==> -104
>>>>>>>>>>>> [   76.595046] irq/14-d-596       0d... 42789862us :
>>>>>>>>>>>> dwc3_free_request: ep6in: req 00000000a324f5d0 length 0/192
>>>>>>>>>>>> zsI ==> -104
>>>>>>>>>>>> [   76.612892] irq/14-d-596       0d... 42789865us :
>>>>>>>>>>>> dwc3_gadget_ep_disable: ep6in: mps 192/346 streams 16 burst 0
>>>>>>>>>>>> ring 0/0 flags E:swbp:<
>>>>>>>>>>>> [   76.665535] irq/14-d-596       0d... 42789873us :
>>>>>>>>>>>> dwc3_event: event (000020c2): ep0in: Transfer Not Ready [0]
>>>>>>>>>>>> (Not Active) [Status Phase]
>>>>>>>>>>>> [   76.684716] irq/14-d-596       0d... 42789875us :
>>>>>>>>>>>> dwc3_prepare_trb: ep0in: trb 000000004c0ae319 (E0:D0) buf
>>>>>>>>>>>> 000000001bded000 size 0 ctrl 00000c33 (HLcs:SC:status2)
>>>>>>>>>>>> [   76.819195] irq/14-d-596       0d... 42789886us :
>>>>>>>>>>>> dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params
>>>>>>>>>>>> 00000000 1bded000 00000000 --> status: Successful
>>>>>>>>>>>> [   76.926324] irq/14-d-596       0d... 42789930us :
>>>>>>>>>>>> dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL)
>>>>>>>>>>>> [Status Phase]
>>>>>>>>>>>> [   76.937892] irq/14-d-596       0d... 42789933us :
>>>>>>>>>>>> dwc3_complete_trb: ep0out: trb 000000004c0ae319 (E0:D0) buf
>>>>>>>>>>>> 000000001bded000 size 0 ctrl 00000c32 (hLcs:SC:status2)
>>>>>>>>>>>> [   76.953003] irq/14-d-596       0d... 42789935us :
>>>>>>>>>>>> dwc3_gadget_giveback: ep0out: req 00000000cb1bd3cd length 0/0
>>>>>>>>>>>> zsI ==> 0
>>>>>>>>>>>> [   76.964217] irq/14-d-596       0d... 42789938us :
>>>>>>>>>>>> dwc3_prepare_trb: ep0out: trb 000000004c0ae319 (E0:D0) buf
>>>>>>>>>>>> 000000001bded000 size 8 ctrl 00000c23 (HLcs:SC:setup)
>>>>>>>>>>>> [   77.061379] irq/14-d-596       0d... 42789950us :
>>>>>>>>>>>> dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params
>>>>>>>>>>>> 00000000 1bded000 00000000 --> status: Successful
>>>>>>>>>>>> [   77.168595] irq/14-d-596       0d... 42790509us :
>>>>>>>>>>>> dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL)
>>>>>>>>>>>> [Setup Phase]
>>>>>>>>>>>> [   77.180159] irq/14-d-596       0d... 42790512us :
>>>>>>>>>>>> dwc3_ctrl_req: Get String Descriptor(Index = 18, Length = 255)
>>>>>>>>>>>> [   77.190578] irq/14-d-596       0d... 42790537us :
>>>>>>>>>>>> dwc3_prepare_trb: ep0in: trb 000000004c0ae319 (E0:D0) buf
>>>>>>>>>>>> 0000000003b68000 size 36 ctrl 00000c53 (HLcs:SC:data)
>>>>>>>>>>>> [   77.287648] irq/14-d-596       0d... 42790550us :
>>>>>>>>>>>> dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params
>>>>>>>>>>>> 00000000 1bded000 00000000 --> status: Successful
>>>>>>>>>>>> [   77.333107] irq/14-d-596       0d... 42790557us :
>>>>>>>>>>>> dwc3_event: event (000010c2): ep0in: Transfer Not Ready [0]
>>>>>>>>>>>> (Not Active) [Data Phase]
>>>>>>>>>>>> [   77.407223] irq/14-d-596       0d... 42790575us :
>>>>>>>>>>>> dwc3_event: event (000090c2): ep0in: Transfer Not Ready [0]
>>>>>>>>>>>> (Active) [Data Phase]
>>>>>>>>>>>> [   77.480985] irq/14-d-596       0d... 42790588us :
>>>>>>>>>>>> dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL)
>>>>>>>>>>>> [Data Phase]
>>>>>>>>>>>> [   77.492376] irq/14-d-596       0d... 42790590us :
>>>>>>>>>>>> dwc3_complete_trb: ep0out: trb 000000004c0ae319 (E0:D0) buf
>>>>>>>>>>>> 0000000003b68000 size 0 ctrl 00000c52 (hLcs:SC:data)
>>>>>>>>>>>> [   77.507221] irq/14-d-596       0d... 42790595us :
>>>>>>>>>>>> dwc3_gadget_giveback: ep0out: req 00000000cb1bd3cd length
>>>>>>>>>>>> 36/36 ZsI ==> 0
>>>>>>>>>>>> [   77.518609] irq/14-d-596       0d... 42790597us :
>>>>>>>>>>>> dwc3_event: event (000020c0): ep0out: Transfer Not Ready [0]
>>>>>>>>>>>> (Not Active) [Status Phase]
>>>>>>>>>>>> [   77.531332] irq/14-d-596       0d... 42790598us :
>>>>>>>>>>>> dwc3_prepare_trb: ep0out: trb 000000004c0ae319 (E0:D0) buf
>>>>>>>>>>>> 000000001bded000 size 0 ctrl 00000c43 (HLcs:SC:status3)
>>>>>>>>>>>> [   77.628669] irq/14-d-596       0d... 42790609us :
>>>>>>>>>>>> dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params
>>>>>>>>>>>> 00000000 1bded000 00000000 --> status: Successful
>>>>>>>>>>>>
>>>>>>>>>>>> Do you mind adding a few prints in dwc3_remove_requests to
>>>>>>>>>>>> tell us which
>>>>>>>>>>>> endpoint is being processed? Then we'll know for sure which
>>>>>>>>>>>> one caused
>>>>>>>>>>>> the crash.
>>>>>>>>>>>>
>>>>>>>>>>> I wouldn't mind but am leaving on a holiday, won't have time
>>>>>>>>>>> until 6 aug.
>>>>>>>>>> not a problem, we'll still be here when you're back :-)
>>>>>>>>> Well, let's go then :-)
>>>>>>>>>
>>>>>>>>> To get back in the mood I have retested 5.13.0, 5.14.0-rc1,
>>>>>>>>> 5.14.0-rc2
>>>>>>>>> and 5.14.0-rc5.
>>>>>>>>>
>>>>>>>>> I find that 5.13.0 works fine, and the issue starts from 
>>>>>>>>> 5.14.0-rc1.
>>>>>>>> That's great finding. We have a bisection point. There are a 
>>>>>>>> total of
>>>>>>>> 13764 commits between v5.13 and v5.14-rc1
>>>>>>>>
>>>>>>>>      $ git rev-list  --count v5.13..v5.14-rc1
>>>>>>>>      13764
>>>>>>>>
>>>>>>>> git bisect should find the offending commit in at most 14 tries.
>>>>>>>> That's
>>>>>>>> not too bad.
>>>>>>> I correctly guesstimated that the problem got introduced by the usb
>>>>>>> merge 79160a60
>>>>>>>
>>>>>>> "Merge tag 'usb-5.14-rc1' of
>>>>>>> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb"
>>>>>>>
>>>>>>> 116 commits(7 bisects).
>>>>>>>
>>>>>>> 24f779dac8f3efb9629adc0e486914d93dc45517 is the first bad commit
>>>>>>>
>>>>>>> "usb: gadget: f_uac2/u_audio: add feedback endpoint support"
>>>>>>>
>>>>>>> Ruslan's 3 patches are related to each other so I reverted all
>>>>>>> three 24f779da...e89bb428 and applied the reverts to rc1.
>>>>>>>
>>>>>>> I can confirm this indeed resolves the problem in rc1.
>>>>>>>
>>>>>>> Is late now, tomorrow evening I will apply the reverts to rc6.
>>>>>>
>>>>>> With these reverts rc6 works fine as well.
>>>>>>
>>>>>> So, where do we go from here?
>>>>>>
>>>>>
>>>>> I know the patches have been tested on dwc2 (by me and others).  I do
>>>>> not know if Ruslan or Jerome tested them on dwc3 but probably not.
>>>>> Ruslan has talked about RPi (my case too) and BeagleboneBlack, both
>>>>> with dwc2. Perhaps the dwc2 behaves a bit differently than dwc3?
>>>>>
>>>>> The patches add a new EP-IN for async feedback. I am sorry I have not
>>>>> followed your long thread (it started as unrelated to uac). Does the
>>>>> problem appear with f_uac1 or f_uac2? Please how have you reached the
>>>>> above problem?
>>>>
>>>> I'm sorry too. I first believed the issue was related to the patch
>>>> mentioned in the subject line.
>>>>
>>>> The problem appaers with f_uac2. I bost Edison_Arduino board in host
>>>> mode (there is a switch allowing to select host/device mode). When
>>>> flipping the switch to device mode udev run a script:
>>>> But as I am using configfs (excerpt follows) and just disabling the
>>>> last 2 line resolves the issue, I'm guessing uac2 is the issue. Or
>>>> exceeding the available resources.
>>>>
>>>> # Create directory structure
>>>> mkdir "${GADGET_BASE_DIR}"
>>>> cd "${GADGET_BASE_DIR}"
>>>> mkdir -p configs/c.1/strings/0x409
>>>> mkdir -p strings/0x409
>>>>
>>>> # Serial device
>>>> mkdir functions/gser.usb0
>>>> ln -s functions/gser.usb0 configs/c.1/
>>>> ###
>>>>
>>>> # Ethernet device
>>>> mkdir functions/eem.usb0
>>>> echo "${DEV_ETH_ADDR}" > functions/eem.usb0/dev_addr
>>>> echo "${HOST_ETH_ADDR}" > functions/eem.usb0/host_addr
>>>> ln -s functions/eem.usb0 configs/c.1/
>>>>
>>>> # Mass Storage device
>>>> mkdir functions/mass_storage.usb0
>>>> echo 1 > functions/mass_storage.usb0/stall
>>>> echo 0 > functions/mass_storage.usb0/lun.0/cdrom
>>>> echo 0 > functions/mass_storage.usb0/lun.0/ro
>>>> echo 0 > functions/mass_storage.usb0/lun.0/nofua
>>>> echo "${USBDISK}" > functions/mass_storage.usb0/lun.0/file
>>>> ln -s functions/mass_storage.usb0 configs/c.1/
>>>>
>>>> # UAC2 device
>>>> mkdir functions/uac2.usb0
>>>> ln -s functions/uac2.usb0 configs/c.1
>>>> ....
>>>>
>>>
>>> As you say, could perhaps the reason be that the extra EP-IN added in
>>> those patches (previously 1, now 2 with the default config you use)
>>> exceeds your EP-IN max count or available fifos somehow?  You have a
>>> number of functions initialized. If you change the load order of the
>>> functions, do you get the error later with a different function? Just
>>> guessing...
>>>
>>> You should be able to switch the default async EP-OUT (which configures
>>> the new feedback EP-IN ) to adaptive EP-OUT (which requires no feedback
>>> EP) with c_sync=8 parameter of f_uac2.
>>>
>>> https://urldefense.com/v3/__https://elixir.bootlin.com/linux/v5.14-rc6/source/drivers/usb/gadget/function/f_uac2.c*L47__;Iw!!A4F2R9G_pg!PZHOWnH3HDs-9a9bz4KLDShZpsubSfG84fu3wEZyK4Q_Wvv2lhHKuk7LJpWPAHQ6Lj4y$ 
>>>
>>>
>>> https://urldefense.com/v3/__https://elixir.bootlin.com/linux/v5.14-rc6/source/drivers/usb/gadget/function/f_uac2.c*L830__;Iw!!A4F2R9G_pg!PZHOWnH3HDs-9a9bz4KLDShZpsubSfG84fu3wEZyK4Q_Wvv2lhHKuk7LJpWPAC7mfgo7$ 
>>>
>>>
>>> https://urldefense.com/v3/__https://elixir.bootlin.com/linux/v5.14-rc6/source/include/uapi/linux/usb/ch9.h*L453__;Iw!!A4F2R9G_pg!PZHOWnH3HDs-9a9bz4KLDShZpsubSfG84fu3wEZyK4Q_Wvv2lhHKuk7LJpWPANdeuGIx$ 
>>>
>>>
>>> Does that fix the problem?
>>>
>>
>> Hi Pavel,
>>
>> I took a look at 24f779dac8f3 ("usb: gadget: f_uac2/u_audio: add
>> feedback endpoint support") that Ferry reported the issue from
>> bisection. I see at least a couple problems in the new UAC2 changes.
>>
>> 1) usb_ep_dequeue() is asynchronous. Don't free requests before the
>> controller driver give them back.
>>
>> 2) Did you test with SuperSpeed? I don't see companion descriptor.
>>
>> Please fix them.
> 
> Given it's late in the cycle I agree with Andy it would be best to 
> revert the series now.
> 
> I will be happy to test on dwc3 when a fixed series arrives.

Yes, I agree it's the best solution now. I have asked the patch devs 
Ruslan and Jerome for help with these issues, I am mostly a tester of 
the UAC2 gadget changes (with dwc2 USB2 only available for now).

Best regards,

Pavel.
