Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA8263D4C44
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jul 2021 08:06:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229538AbhGYFZe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 25 Jul 2021 01:25:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:39924 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229460AbhGYFZe (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 25 Jul 2021 01:25:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1F24660F11;
        Sun, 25 Jul 2021 06:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627193164;
        bh=ZwACYUIuv3VQ3Zylln4xFkQ+c4zLUmOSSX/7oAfYllI=;
        h=References:From:To:Cc:Subject:In-reply-to:Date:From;
        b=aXX31zvkZ/ZwRtrJ3CgF6K3/zuHt5yQO2YeSv/tJ/DR+fOp6ZMReR+VNh3ZYF5HnU
         RaNG+olL1p6swrh0aV8wmrB4R57fUbAQHwAvow+G5lqm6TLHb3b9oFHipbEkzKUJhc
         Wf6tdusC/te0KJOoNTy7juJyeCmZYUNQCu0OhHunIGiUl85Kf8NdnWzP/aXSepfyWx
         5bzaRtu6vo4zaIxS4hUPGvJrknWPlTjUlMz2+qc17d0fGgPGFIdbqcYaldE5aGglrb
         6qv7w8IyLelLmXtQbxPeCj7F7qfIkWHYaZb5VgNEMHnUkR2t4UCEu57te1A2B7ZHzS
         pd/KUfAmlIqMQ==
References: <1623923899-16759-1-git-send-email-wcheng@codeaurora.org>
 <cfb83fe4-369c-ec72-7887-3bcb0f20fe15@gmail.com>
 <ec8050c5-c013-4af6-b39e-69779c009a9c@codeaurora.org>
 <f5ed0ee7-e333-681f-0f1a-d0227562204b@gmail.com>
 <2e01c435-9ecc-4e3b-f55c-612a86667020@codeaurora.org>
 <2ae9fa6a-3bb1-3742-0dd3-59678bdd8643@gmail.com>
 <ebea75fe-5334-197b-f67a-cb6e1e30b39e@codeaurora.org>
 <bafa93bb-11e3-c8a5-e14a-b0a6d5695055@gmail.com>
 <87v951ldlt.fsf@kernel.org>
 <d9aef50c-4bd1-4957-13d8-0b6a14b9fcd0@gmail.com>
 <87pmv9l1dv.fsf@kernel.org>
 <9dc6cd83-17b9-7075-0934-6b9d41b6875d@gmail.com>
User-agent: mu4e 1.4.15; emacs 27.2
From:   Felipe Balbi <balbi@kernel.org>
To:     Ferry Toth <fntoth@gmail.com>
Cc:     Wesley Cheng <wcheng@codeaurora.org>, gregkh@linuxfoundation.org,
        robh+dt@kernel.org, agross@kernel.org, bjorn.andersson@linaro.org,
        frowand.list@gmail.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, jackp@codeaurora.org,
        heikki.krogerus@linux.intel.com, andy.shevchenko@gmail.com
Subject: Re: [PATCH v10 0/6] Re-introduce TX FIFO resize for larger EP bursting
In-reply-to: <9dc6cd83-17b9-7075-0934-6b9d41b6875d@gmail.com>
Date:   Sun, 25 Jul 2021 09:05:59 +0300
Message-ID: <87a6mbudvc.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


Hi,

Ferry Toth <fntoth@gmail.com> writes:
>>>>> Hardware name: Intel Corporation Merrifield/BODEGA BAY, BIOS 542
>>>>> 2015.01.21:18.19.48
>>>>> RIP: 0010:0x500000000
>>>>> Code: Unable to access opcode bytes at RIP 0x4ffffffd6.
>>>>> RSP: 0018:ffffa4d00045fc28 EFLAGS: 00010046
>>>>> RAX: 0000000500000000 RBX: ffff8cd546aed200 RCX: 0000000000000000
>>>>> RDX: 0000000000000000 RSI: ffff8cd547bfcae0 RDI: ffff8cd546aed200
>>>>> RBP: ffff8cd547bfcae0 R08: 0000000000000000 R09: 0000000000000001
>>>>> R10: ffff8cd541fd28c0 R11: 0000000000000000 R12: ffff8cd547342828
>>>>> R13: ffff8cd546aed248 R14: 0000000000000000 R15: ffff8cd548b1d000
>>>>> FS:  0000000000000000(0000) GS:ffff8cd57e200000(0000) knlGS:0000000000000000
>>>>> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>>>> CR2: 0000000500000000 CR3: 000000000311e000 CR4: 00000000001006f0
>>>>> Call Trace:
>>>>>     ? dwc3_remove_requests.constprop.0+0x14d/0x170
>>>>>     ? __dwc3_gadget_ep_disable+0x7a/0x160
>>>>>     ? dwc3_gadget_ep_disable+0x3d/0xd0
>>>>>     ? usb_ep_disable+0x1c/0x
>>>>>     ? u_audio_stop_capture+0x79/0x120 [u_audio]
>>>>>     ? afunc_set_alt+0x73/0x80 [usb_f_uac2]
>>>>>     ? composite_setup+0x224/0x1b90 [libcomposite]
>>>>>     ? __dwc3_gadget_kick_transfer+0x160/0x400
>>>>>     ? dwc3_gadget_ep_queue+0xf3/0x1a0
>>>>>     ? configfs_composite_setup+0x6b/0x90 [libcomposite]
>>>>>     ? configfs_composite_setup+0x6b/0x90 [libcomposite]
>>>>>     ? dwc3_ep0_interrupt+0x459/0xa40
>>>>>     ? dwc3_thread_interrupt+0x8ee/0xf40
>>>>>     ? __schedule+0x235/0x6c0
>>>>>     ? disable_irq_nosync+0x10/0x10
>>>>>     ? irq_thread_fn+0x1b/0x60
>>>>>     ? irq_thread+0xc0/0x160
>>>>>     ? irq_thread_check_affinity+0x70/0x70
>>>>>     ? irq_forced_thread_fn+0x70/0x70
>>>>>     ? kthread+0x122/0x140
>>>>>     ? set_kthread_struct+0x40/0x40
>>>>>     ? ret_from_fork+0x22/0x30
>>>> Do you mind enabling dwc3 traces and collecting them? Trying to figure
>>>> out how we got here.
>>>>
>>> I'll try if I can get the same error by booting with USB in host mode
>>> and then switch to device mode. If so I can enable traces and collect as
>>> you explained me before.
>>>
>>> I'll try before monday, as then I fly for a holiday and will not be
>>> available before rc5.
>> you can enable all of those with kernel cmdline :-)
>>
>> https://www.kernel.org/doc/html/latest/admin-guide/kernel-parameters.html
>>
>> you need ftrace_dump_on_oops=1 and also need the correct options on
>> trace_buf_size and trace_event.
>>
> On Edison-Arduino I have a switch to go to device mode, after which
> udev triggers a script configure gadgets through configfs.
>
> I tried to log following these instructions:
>
> https://www.kernel.org/doc/html/latest/driver-api/usb/dwc3.html#reporting-bugs  <https://www.kernel.org/doc/html/latest/driver-api/usb/dwc3.html#reporting-bugs>
>
> Unfortunately the kernel crashes so badly I can not get to the ` cp
> /t/trace /root/trace.txt` line (after a while the watchdog kicks).
>
> What to do next?

Pass ftrace_dump_on_oops to kernel cmdline.

-- 
balbi
