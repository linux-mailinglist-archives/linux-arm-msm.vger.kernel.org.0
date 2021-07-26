Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 300EE3D5BBE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jul 2021 16:34:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233206AbhGZNxf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Jul 2021 09:53:35 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:64808 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233939AbhGZNxf (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Jul 2021 09:53:35 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1627310044; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=ifEQbfw/Z5nQUK2noIvo9koLrE1T7Aj6yMUuIe5E8R0=; b=OSyDXLll2BV33aYfOlgarqOvcdJLgtsKZiLnLb/hlx4zmhQeLR/umvuiQlRmje2N5Llk106w
 vkg91M/53Ej39V+OvGbbzti58JmA7QH2DnZKoeC2TMCjkY06T3N1IKd45GqCN3X1WFeCtBQT
 G8oTAgDw8OR+y6Q2vAgd57MI690=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 60fec7dae31d882d18aa9525 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 26 Jul 2021 14:34:02
 GMT
Sender: wcheng=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id F40FFC43217; Mon, 26 Jul 2021 14:34:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [10.110.37.24] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 67B60C433F1;
        Mon, 26 Jul 2021 14:33:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 67B60C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=wcheng@codeaurora.org
Subject: Re: [PATCH v10 0/6] Re-introduce TX FIFO resize for larger EP
 bursting
To:     Felipe Balbi <balbi@kernel.org>, Ferry Toth <fntoth@gmail.com>
Cc:     gregkh@linuxfoundation.org, robh+dt@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, frowand.list@gmail.com,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
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
 <bafa93bb-11e3-c8a5-e14a-b0a6d5695055@gmail.com> <87v951ldlt.fsf@kernel.org>
 <d9aef50c-4bd1-4957-13d8-0b6a14b9fcd0@gmail.com> <87pmv9l1dv.fsf@kernel.org>
 <9dc6cd83-17b9-7075-0934-6b9d41b6875d@gmail.com> <87a6mbudvc.fsf@kernel.org>
 <6e8bb4ad-fe68-ad36-7416-2b8e10b6ae96@gmail.com> <877dhev68a.fsf@kernel.org>
 <cca69e90-b0ef-00b8-75d3-3bf959a93b45@gmail.com> <874kchvcq0.fsf@kernel.org>
From:   Wesley Cheng <wcheng@codeaurora.org>
Message-ID: <e8c4bc81-85f7-93d5-dbd9-af8ee4ebbe43@codeaurora.org>
Date:   Mon, 26 Jul 2021 07:33:58 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <874kchvcq0.fsf@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Ferry,

On 7/25/2021 10:57 PM, Felipe Balbi wrote:
> 
> Hi,
> 
> Ferry Toth <fntoth@gmail.com> writes:
>>>>> Ferry Toth <fntoth@gmail.com> writes:
>>>>>>>>>> Hardware name: Intel Corporation Merrifield/BODEGA BAY, BIOS 542
>>>>>>>>>> 2015.01.21:18.19.48
>>>>>>>>>> RIP: 0010:0x500000000
>>>>>>>>>> Code: Unable to access opcode bytes at RIP 0x4ffffffd6.
>>>>>>>>>> RSP: 0018:ffffa4d00045fc28 EFLAGS: 00010046
>>>>>>>>>> RAX: 0000000500000000 RBX: ffff8cd546aed200 RCX: 0000000000000000
>>>>>>>>>> RDX: 0000000000000000 RSI: ffff8cd547bfcae0 RDI: ffff8cd546aed200
>>>>>>>>>> RBP: ffff8cd547bfcae0 R08: 0000000000000000 R09: 0000000000000001
>>>>>>>>>> R10: ffff8cd541fd28c0 R11: 0000000000000000 R12: ffff8cd547342828
>>>>>>>>>> R13: ffff8cd546aed248 R14: 0000000000000000 R15: ffff8cd548b1d000
>>>>>>>>>> FS:  0000000000000000(0000) GS:ffff8cd57e200000(0000) knlGS:0000000000000000
>>>>>>>>>> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>>>>>>>>> CR2: 0000000500000000 CR3: 000000000311e000 CR4: 00000000001006f0
>>>>>>>>>> Call Trace:
>>>>>>>>>>       ? dwc3_remove_requests.constprop.0+0x14d/0x170
>>>>>>>>>>       ? __dwc3_gadget_ep_disable+0x7a/0x160
>>>>>>>>>>       ? dwc3_gadget_ep_disable+0x3d/0xd0
>>>>>>>>>>       ? usb_ep_disable+0x1c/0x
>>>>>>>>>>       ? u_audio_stop_capture+0x79/0x120 [u_audio]
>>>>>>>>>>       ? afunc_set_alt+0x73/0x80 [usb_f_uac2]
>>> So this is triggered by a SetInterface request...
>>>
>>>>>>>>>>       ? composite_setup+0x224/0x1b90 [libcomposite]
>>>>>>>>>>       ? __dwc3_gadget_kick_transfer+0x160/0x400
>>>>>>>>>>       ? dwc3_gadget_ep_queue+0xf3/0x1a0
>>>>>>>>>>       ? configfs_composite_setup+0x6b/0x90 [libcomposite]
>>>>>>>>>>       ? configfs_composite_setup+0x6b/0x90 [libcomposite]
>>>>>>>>>>       ? dwc3_ep0_interrupt+0x459/0xa40
>>>>>>>>>>       ? dwc3_thread_interrupt+0x8ee/0xf40
>>>>>>>>>>       ? __schedule+0x235/0x6c0
>>>>>>>>>>       ? disable_irq_nosync+0x10/0x10
>>>>>>>>>>       ? irq_thread_fn+0x1b/0x60
>>>>>>>>>>       ? irq_thread+0xc0/0x160
>>>>>>>>>>       ? irq_thread_check_affinity+0x70/0x70
>>>>>>>>>>       ? irq_forced_thread_fn+0x70/0x70
>>>>>>>>>>       ? kthread+0x122/0x140
>>>>>>>>>>       ? set_kthread_struct+0x40/0x40
>>>>>>>>>>       ? ret_from_fork+0x22/0x30
>>>>>>>>> Do you mind enabling dwc3 traces and collecting them? Trying to figure
>>>>>>>>> out how we got here.
>>>>>>>>>
>>>>>>>> I'll try if I can get the same error by booting with USB in host mode
>>>>>>>> and then switch to device mode. If so I can enable traces and collect as
>>>>>>>> you explained me before.
>>>>>>>>
>>>>>>>> I'll try before monday, as then I fly for a holiday and will not be
>>>>>>>> available before rc5.
>>>>>>> you can enable all of those with kernel cmdline :-)
>>>>>>>
>>>>>>> https://www.kernel.org/doc/html/latest/admin-guide/kernel-parameters.html
>>>>>>>
>>>>>>> you need ftrace_dump_on_oops=1 and also need the correct options on
>>>>>>> trace_buf_size and trace_event.
>>>>>>>
>>>>>> On Edison-Arduino I have a switch to go to device mode, after which
>>>>>> udev triggers a script configure gadgets through configfs.
>>>>>>
>>>>>> I tried to log following these instructions:
>>>>>>
>>>>>> https://www.kernel.org/doc/html/latest/driver-api/usb/dwc3.html#reporting-bugs  <https://www.kernel.org/doc/html/latest/driver-api/usb/dwc3.html#reporting-bugs>
>>>>>>
>>>>>> Unfortunately the kernel crashes so badly I can not get to the ` cp
>>>>>> /t/trace /root/trace.txt` line (after a while the watchdog kicks).
>>>>>>
>>>>>> What to do next?
>>>>> Pass ftrace_dump_on_oops to kernel cmdline.
>>>>>
>>>> No sure if I did this right, on oops everything is pushed to console
>>>> (115k2 serial), I hope nothing essential is lost.
>>>>
>>>> I copied the screen buffer to file see attached.
>>> Thank you, I bet it took quite a some time :-) Anyway, looking at
>>> the logs around Set Interface requests, we can track every endpoint
>>> that's disabled. I'll take a guess and assume we're failing at the last
>>> Set Interface, that means we should have something odd with ep6in, but
>>> everything looks fine in the trace output:
>>>
>>> [   75.823107] irq/14-d-596       0d... 42789194us : dwc3_gadget_ep_enable: ep6in: mps 192/346 streams 16 burst 0 ring 0/0 flags E:swbp:<
>>> [   75.835472] irq/14-d-596       0d... 42789198us : dwc3_alloc_request: ep6in: req 0000000002c71409 length 0/0 zsI ==> 0
>>> [   75.846416] irq/14-d-596       0d... 42789202us : dwc3_ep_queue: ep6in: req 0000000002c71409 length 0/192 zsI ==> -115
>>> [   75.857360] irq/14-d-596       0d... 42789204us : dwc3_alloc_request: ep6in: req 00000000a324f5d0 length 0/0 zsI ==> 0
>>> [   75.868301] irq/14-d-596       0d... 42789206us : dwc3_ep_queue: ep6in: req 00000000a324f5d0 length 0/192 zsI ==> -115
>>> [   75.879244] irq/14-d-596       0d... 42789209us : dwc3_event: event (000020c2): ep0in: Transfer Not Ready [0] (Not Active) [Status Phase]
>>> [   75.891880] irq/14-d-596       0d... 42789211us : dwc3_prepare_trb: ep0in: trb 000000004c0ae319 (E0:D0) buf 000000001bded000 size 0 ctrl 00000c33 (HLcs:SC:status2)
>>> [   75.989131] irq/14-d-596       0d... 42789224us : dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 1bded000 00000000 --> status: Successful
>>> [   76.096261] irq/14-d-596       0d... 42789272us : dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Status Phase]
>>> [   76.107834] irq/14-d-596       0d... 42789275us : dwc3_complete_trb: ep0out: trb 000000004c0ae319 (E0:D0) buf 000000001bded000 size 0 ctrl 00000c32 (hLcs:SC:status2)
>>> [   76.122944] irq/14-d-596       0d... 42789277us : dwc3_gadget_giveback: ep0out: req 00000000cb1bd3cd length 0/0 zsI ==> 0
>>> [   76.134160] irq/14-d-596       0d... 42789280us : dwc3_prepare_trb: ep0out: trb 000000004c0ae319 (E0:D0) buf 000000001bded000 size 8 ctrl 00000c23 (HLcs:SC:setup)
>>> [   76.231322] irq/14-d-596       0d... 42789292us : dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 1bded000 00000000 --> status: Successful
>>> [   76.297418] kworker/-23        0d... 42789670us : dwc3_ep_queue: ep3in: req 0000000029586135 length 0/96 ZsI ==> -115
>>> [   76.308278] kworker/-23        0d... 42789695us : dwc3_prepare_trb: ep3in: trb 00000000b81213d6 (E1:D0) buf 0000000003b7a800 size 96 ctrl 00000811 (Hlcs:sC:normal)
>>> [   76.395294] kworker/-23        0d... 42789707us : dwc3_gadget_ep_cmd: ep3in: cmd 'Update Transfer' [60007] params 00000000 00000000 00000000 --> status: Successful
>>> [   76.471900] irq/14-d-596       0d... 42789842us : dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
>>> [   76.489308] irq/14-d-596       0d... 42789845us : dwc3_ctrl_req: Set Interface(Intf = 5, Alt.Setting = 0)
>>> [   76.505650] irq/14-d-596       0d... 42789851us : dwc3_ep_dequeue: ep6in: req 0000000002c71409 length 0/192 zsI ==> -115
>>> [   76.523315] irq/14-d-596       0d... 42789854us : dwc3_gadget_giveback: ep6in: req 0000000002c71409 length 0/192 zsI ==> -104
>>> [   76.541427] irq/14-d-596       0d... 42789857us : dwc3_free_request: ep6in: req 0000000002c71409 length 0/192 zsI ==> -104
>>> [   76.559267] irq/14-d-596       0d... 42789859us : dwc3_ep_dequeue: ep6in: req 00000000a324f5d0 length 0/192 zsI ==> -115
>>> [   76.576937] irq/14-d-596       0d... 42789861us : dwc3_gadget_giveback: ep6in: req 00000000a324f5d0 length 0/192 zsI ==> -104
>>> [   76.595046] irq/14-d-596       0d... 42789862us : dwc3_free_request: ep6in: req 00000000a324f5d0 length 0/192 zsI ==> -104
>>> [   76.612892] irq/14-d-596       0d... 42789865us : dwc3_gadget_ep_disable: ep6in: mps 192/346 streams 16 burst 0 ring 0/0 flags E:swbp:<
>>> [   76.665535] irq/14-d-596       0d... 42789873us : dwc3_event: event (000020c2): ep0in: Transfer Not Ready [0] (Not Active) [Status Phase]
>>> [   76.684716] irq/14-d-596       0d... 42789875us : dwc3_prepare_trb: ep0in: trb 000000004c0ae319 (E0:D0) buf 000000001bded000 size 0 ctrl 00000c33 (HLcs:SC:status2)
>>> [   76.819195] irq/14-d-596       0d... 42789886us : dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 1bded000 00000000 --> status: Successful
>>> [   76.926324] irq/14-d-596       0d... 42789930us : dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Status Phase]
>>> [   76.937892] irq/14-d-596       0d... 42789933us : dwc3_complete_trb: ep0out: trb 000000004c0ae319 (E0:D0) buf 000000001bded000 size 0 ctrl 00000c32 (hLcs:SC:status2)
>>> [   76.953003] irq/14-d-596       0d... 42789935us : dwc3_gadget_giveback: ep0out: req 00000000cb1bd3cd length 0/0 zsI ==> 0
>>> [   76.964217] irq/14-d-596       0d... 42789938us : dwc3_prepare_trb: ep0out: trb 000000004c0ae319 (E0:D0) buf 000000001bded000 size 8 ctrl 00000c23 (HLcs:SC:setup)
>>> [   77.061379] irq/14-d-596       0d... 42789950us : dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 1bded000 00000000 --> status: Successful
>>> [   77.168595] irq/14-d-596       0d... 42790509us : dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
>>> [   77.180159] irq/14-d-596       0d... 42790512us : dwc3_ctrl_req: Get String Descriptor(Index = 18, Length = 255)
>>> [   77.190578] irq/14-d-596       0d... 42790537us : dwc3_prepare_trb: ep0in: trb 000000004c0ae319 (E0:D0) buf 0000000003b68000 size 36 ctrl 00000c53 (HLcs:SC:data)
>>> [   77.287648] irq/14-d-596       0d... 42790550us : dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 1bded000 00000000 --> status: Successful
>>> [   77.333107] irq/14-d-596       0d... 42790557us : dwc3_event: event (000010c2): ep0in: Transfer Not Ready [0] (Not Active) [Data Phase]
>>> [   77.407223] irq/14-d-596       0d... 42790575us : dwc3_event: event (000090c2): ep0in: Transfer Not Ready [0] (Active) [Data Phase]
>>> [   77.480985] irq/14-d-596       0d... 42790588us : dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
>>> [   77.492376] irq/14-d-596       0d... 42790590us : dwc3_complete_trb: ep0out: trb 000000004c0ae319 (E0:D0) buf 0000000003b68000 size 0 ctrl 00000c52 (hLcs:SC:data)
>>> [   77.507221] irq/14-d-596       0d... 42790595us : dwc3_gadget_giveback: ep0out: req 00000000cb1bd3cd length 36/36 ZsI ==> 0
>>> [   77.518609] irq/14-d-596       0d... 42790597us : dwc3_event: event (000020c0): ep0out: Transfer Not Ready [0] (Not Active) [Status Phase]
>>> [   77.531332] irq/14-d-596       0d... 42790598us : dwc3_prepare_trb: ep0out: trb 000000004c0ae319 (E0:D0) buf 000000001bded000 size 0 ctrl 00000c43 (HLcs:SC:status3)
>>> [   77.628669] irq/14-d-596       0d... 42790609us : dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 1bded000 00000000 --> status: Successful
>>>
>>> Do you mind adding a few prints in dwc3_remove_requests to tell us which
>>> endpoint is being processed? Then we'll know for sure which one caused
>>> the crash.
>>>
>> I wouldn't mind but am leaving on a holiday, won't have time until 6 aug.
> 
> not a problem, we'll still be here when you're back :-)
> 
>> But as I am using configfs (excerpt follows) and just disabling the
>> last 2 line resolves the issue, I'm guessing uac2 is the issue. Or
>> exceeding the available resources.
>>
>> # Create directory structure
>> mkdir "${GADGET_BASE_DIR}"
>> cd "${GADGET_BASE_DIR}"
>> mkdir -p configs/c.1/strings/0x409
>> mkdir -p strings/0x409
>>
>> # Serial device
>> mkdir functions/gser.usb0
>> ln -s functions/gser.usb0 configs/c.1/
>> ###
>>
>> # Ethernet device
>> mkdir functions/eem.usb0
>> echo "${DEV_ETH_ADDR}" > functions/eem.usb0/dev_addr
>> echo "${HOST_ETH_ADDR}" > functions/eem.usb0/host_addr
>> ln -s functions/eem.usb0 configs/c.1/
>>
>> # Mass Storage device
>> mkdir functions/mass_storage.usb0
>> echo 1 > functions/mass_storage.usb0/stall
>> echo 0 > functions/mass_storage.usb0/lun.0/cdrom
>> echo 0 > functions/mass_storage.usb0/lun.0/ro
>> echo 0 > functions/mass_storage.usb0/lun.0/nofua
>> echo "${USBDISK}" > functions/mass_storage.usb0/lun.0/file
>> ln -s functions/mass_storage.usb0 configs/c.1/
>>
>> # UAC2 device
>> mkdir functions/uac2.usb0
>> ln -s functions/uac2.usb0 configs/c.1
> 
> Right, either there's an actual bug in uac2, or we're running out of
> FIFO space.
> 

Are you enabling the TXFIFO flag here again?  If we suspect that we're
running out of FIFO space, then:
- First, making sure we're explicitly enabling the TXFIFO resize flag.
- Second, we should see the same warning we saw previously:
	dwc3 dwc3.0.auto: Fifosize(2154) > RAM size(2022) ep5in
depth:115540359


Thanks
Wesley Cheng

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
