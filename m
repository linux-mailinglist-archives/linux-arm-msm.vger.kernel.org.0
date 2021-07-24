Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1050A3D4A00
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Jul 2021 22:59:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229510AbhGXUTJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Jul 2021 16:19:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbhGXUTI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Jul 2021 16:19:08 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0613C061575;
        Sat, 24 Jul 2021 13:59:38 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id hb6so9129768ejc.8;
        Sat, 24 Jul 2021 13:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=rvvUJyaCqBkbqv9/eHX0uGjXEOtX3B96Btw/zLrT0/I=;
        b=VYIIAsBUT/ZfNGsBLFnI+6dNgC4tQmNnValZ/on7IGnpaciLUMiKKgy5v25/Boyhy8
         9wI+Y2+IxgRcMYbeD0r83kZS2SFocOK63zhgY9Nw0A895LCYMdu9D30iHSCVH0uIcb1K
         7m2zwqaZmbyavgvLtwHnyI899YXIrPfIC+HoxX0h5Qm2Z5iJVf8D0vUEPhSRVYJ7bhH+
         qqi1q0qNp3DHATJIkLxBVz5EabrCyRUimYf4ce7tIdei8Fe4sKjip7ffhaLG52AsRJ9K
         hiN/682Q+BDjILfz+7Zf6iO02HCix6E1ySsRjthKzz2uYLYbXqc+Z86xicBd3YQdpHcT
         5hcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=rvvUJyaCqBkbqv9/eHX0uGjXEOtX3B96Btw/zLrT0/I=;
        b=p7wDjjS4YP0/WJeUmJOTN55AeBjX499c3tgNSWY7NQzrDRKAR91cQgP8KAnTP9uO7g
         Sg6MpSWLCvyJLrqOBW0TLTYkzvW52YDqfuuR1e4ZLbmUtoJMZ6rNsXLWZgn+uAwUPiaA
         ovQpOOxoNG1BYeHt9uWc3xDg17ShU5VDCM8meOpwPY9QsUrg7RPCPaGITz578cTqJy3C
         JPYuNY0h8VC6WzBNMoYeUwY0QM/l+/e/5ifgtgWCrVDQMFh7kTHnLnBTsAO+Vqw+BPis
         mXhpc0DQQ7MBodQZciOTMh09RL2SdAyf0778rjy0Fpbb2TObForfDeSALOteQmWYSlYn
         Uddw==
X-Gm-Message-State: AOAM533NCLZvkMk+z3yQ/3MRUjKyzTwFlxaC12uvNex61FM/ij49OgjW
        Uh8xpH8q+SEeuCnRz8kXYrbUUAUj1oJofg==
X-Google-Smtp-Source: ABdhPJweFwWlEG8Sty+xt0dNxBTckuIYUEZ33E0Q15IaKnn1zBWiGOV0Wo7HZg98zXLZNaDUmvvnPw==
X-Received: by 2002:a17:906:fb12:: with SMTP id lz18mr10679875ejb.324.1627160377517;
        Sat, 24 Jul 2021 13:59:37 -0700 (PDT)
Received: from ?IPv6:2001:981:6fec:1:652f:ed8b:8adb:341b? ([2001:981:6fec:1:652f:ed8b:8adb:341b])
        by smtp.gmail.com with ESMTPSA id bd24sm2578385edb.56.2021.07.24.13.59.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jul 2021 13:59:37 -0700 (PDT)
Subject: Re: [PATCH v10 0/6] Re-introduce TX FIFO resize for larger EP
 bursting
To:     Felipe Balbi <balbi@kernel.org>,
        Wesley Cheng <wcheng@codeaurora.org>,
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
 <bafa93bb-11e3-c8a5-e14a-b0a6d5695055@gmail.com> <87v951ldlt.fsf@kernel.org>
 <d9aef50c-4bd1-4957-13d8-0b6a14b9fcd0@gmail.com> <87pmv9l1dv.fsf@kernel.org>
From:   Ferry Toth <fntoth@gmail.com>
Message-ID: <9dc6cd83-17b9-7075-0934-6b9d41b6875d@gmail.com>
Date:   Sat, 24 Jul 2021 22:59:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87pmv9l1dv.fsf@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

Op 23-07-2021 om 13:23 schreef Felipe Balbi:
> Ferry Toth <fntoth@gmail.com> writes:
>
>> Hi
>>
>> Op 23-07-2021 om 08:59 schreef Felipe Balbi:
>>> Hi,
>>>
>>> Ferry Toth <fntoth@gmail.com> writes:
>>>>>> kernel: configfs-gadget gadget: u_audio_start_playback:451 Error!
>>>>>> kernel: configfs-gadget gadget: u_audio_start_playback:451 Error!
>>>>>> kernel: dwc3 dwc3.0.auto: request 00000000fbc71244 was not queued to ep5in
>>>>>> kernel: dwc3 dwc3.0.auto: request 00000000ad1b8c18 was not queued to ep5in
>>>>>> kernel: dwc3 dwc3.0.auto: Fifosize(2154) > RAM size(2022) ep5in
>>>>>> depth:115540359
>>>>>> kernel: configfs-gadget gadget: u_audio_start_playback:451 Error!
>>>>>> kernel: configfs-gadget gadget: u_audio_start_playback:451 Error!
>>>>>> kernel: dwc3 dwc3.0.auto: request 000000003c32dcc5 was not queued to ep5in
>>>>>> kernel: dwc3 dwc3.0.auto: request 00000000b2512aa9 was not queued to ep5in
>>>>>>
>>>>>> Removing uac2 from the config makes the call trace go away, but the R/W
>>>>>> speed does not change.
>>>> I am testing with 5.14.0-rc2 and now related error appears (not in rc1).
>>>> Disabling uac2 solves it still. Any idea what it could be?
>>>>
>>>> BUG: unable to handle page fault for address: 0000000500000000
>>>> #PF: supervisor instruction fetch in kernel mode
>>>> #PF: error_code(0x0010) - not-present page
>>>> PGD 0 P4D 0
>>>> Oops: 0010 [#1] SMP PTI
>>>> CPU: 0 PID: 494 Comm: irq/14-dwc3 Not tainted
>>>> 5.14.0-rc2-edison-acpi-standard #1
>>> (cool that you're running on ACPI heh)
>> Thanks to Andy this is Edison-Arduino board with ACPI.
>>>> Hardware name: Intel Corporation Merrifield/BODEGA BAY, BIOS 542
>>>> 2015.01.21:18.19.48
>>>> RIP: 0010:0x500000000
>>>> Code: Unable to access opcode bytes at RIP 0x4ffffffd6.
>>>> RSP: 0018:ffffa4d00045fc28 EFLAGS: 00010046
>>>> RAX: 0000000500000000 RBX: ffff8cd546aed200 RCX: 0000000000000000
>>>> RDX: 0000000000000000 RSI: ffff8cd547bfcae0 RDI: ffff8cd546aed200
>>>> RBP: ffff8cd547bfcae0 R08: 0000000000000000 R09: 0000000000000001
>>>> R10: ffff8cd541fd28c0 R11: 0000000000000000 R12: ffff8cd547342828
>>>> R13: ffff8cd546aed248 R14: 0000000000000000 R15: ffff8cd548b1d000
>>>> FS:  0000000000000000(0000) GS:ffff8cd57e200000(0000) knlGS:0000000000000000
>>>> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>>> CR2: 0000000500000000 CR3: 000000000311e000 CR4: 00000000001006f0
>>>> Call Trace:
>>>>     ? dwc3_remove_requests.constprop.0+0x14d/0x170
>>>>     ? __dwc3_gadget_ep_disable+0x7a/0x160
>>>>     ? dwc3_gadget_ep_disable+0x3d/0xd0
>>>>     ? usb_ep_disable+0x1c/0x
>>>>     ? u_audio_stop_capture+0x79/0x120 [u_audio]
>>>>     ? afunc_set_alt+0x73/0x80 [usb_f_uac2]
>>>>     ? composite_setup+0x224/0x1b90 [libcomposite]
>>>>     ? __dwc3_gadget_kick_transfer+0x160/0x400
>>>>     ? dwc3_gadget_ep_queue+0xf3/0x1a0
>>>>     ? configfs_composite_setup+0x6b/0x90 [libcomposite]
>>>>     ? configfs_composite_setup+0x6b/0x90 [libcomposite]
>>>>     ? dwc3_ep0_interrupt+0x459/0xa40
>>>>     ? dwc3_thread_interrupt+0x8ee/0xf40
>>>>     ? __schedule+0x235/0x6c0
>>>>     ? disable_irq_nosync+0x10/0x10
>>>>     ? irq_thread_fn+0x1b/0x60
>>>>     ? irq_thread+0xc0/0x160
>>>>     ? irq_thread_check_affinity+0x70/0x70
>>>>     ? irq_forced_thread_fn+0x70/0x70
>>>>     ? kthread+0x122/0x140
>>>>     ? set_kthread_struct+0x40/0x40
>>>>     ? ret_from_fork+0x22/0x30
>>> Do you mind enabling dwc3 traces and collecting them? Trying to figure
>>> out how we got here.
>>>
>> I'll try if I can get the same error by booting with USB in host mode
>> and then switch to device mode. If so I can enable traces and collect as
>> you explained me before.
>>
>> I'll try before monday, as then I fly for a holiday and will not be
>> available before rc5.
> you can enable all of those with kernel cmdline :-)
>
> https://www.kernel.org/doc/html/latest/admin-guide/kernel-parameters.html
>
> you need ftrace_dump_on_oops=1 and also need the correct options on
> trace_buf_size and trace_event.
>
On Edison-Arduino I have a switch to go to device mode, after which udev 
triggers a script configure gadgets through configfs.

I tried to log following these instructions:

https://www.kernel.org/doc/html/latest/driver-api/usb/dwc3.html#reporting-bugs  <https://www.kernel.org/doc/html/latest/driver-api/usb/dwc3.html#reporting-bugs>

Unfortunately the kernel crashes so badly I can not get to the ` cp 
/t/trace /root/trace.txt` line (after a while the watchdog kicks).

What to do next?


BTW there is a secondary problem not related to dwc3: the console is not 
working well and loosing chars. I can connect through wifi/ssh though.

