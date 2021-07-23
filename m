Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2FCB3D3961
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jul 2021 13:23:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234231AbhGWKnS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Jul 2021 06:43:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:34320 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231848AbhGWKnS (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Jul 2021 06:43:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id EBC78608FE;
        Fri, 23 Jul 2021 11:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627039431;
        bh=sep4PyPFWFTV1G73N7CdN+qNWYDhfdkSBOFjBh0oYkU=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=R6MI/WJ4vElrqZoGqWHmJCK8Rcli5o9G3c4wT33/ezTsgyN/qu2AhGPqXuetLZ3O5
         Df6moxTD16ngcV++Y0QxZa2NNZLBuFI9ufHHBZfJB5+UU6JUX15YiV7uW9sG6d9kgv
         q3+z+UhXyx09bvbBR6sEEg/iglFfzE8PaUTRKy4ZyaIPtKUS9kjR+zea6d98mLVa7f
         Lj4xD90vokCiOtGRx52Dj4k+2pDWvl5TUSDqK0An/AyIS8TEbNe47jPwCcdzawML6T
         2RwCCVbZ3Ve6h10lDV0Px52jwl/Ptd/ZVfX37GhmtDrzxdsr3P8rCpmbOQGNCtjwYT
         Fgnbdjxz1JSdA==
From:   Felipe Balbi <balbi@kernel.org>
To:     Ferry Toth <fntoth@gmail.com>,
        Wesley Cheng <wcheng@codeaurora.org>,
        gregkh@linuxfoundation.org, robh+dt@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, frowand.list@gmail.com
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        jackp@codeaurora.org, heikki.krogerus@linux.intel.com,
        andy.shevchenko@gmail.com
Subject: Re: [PATCH v10 0/6] Re-introduce TX FIFO resize for larger EP bursting
In-Reply-To: <d9aef50c-4bd1-4957-13d8-0b6a14b9fcd0@gmail.com>
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
Date:   Fri, 23 Jul 2021 14:23:40 +0300
Message-ID: <87pmv9l1dv.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Ferry Toth <fntoth@gmail.com> writes:

> Hi
>
> Op 23-07-2021 om 08:59 schreef Felipe Balbi:
>> Hi,
>>
>> Ferry Toth <fntoth@gmail.com> writes:
>>>>> kernel: configfs-gadget gadget: u_audio_start_playback:451 Error!
>>>>> kernel: configfs-gadget gadget: u_audio_start_playback:451 Error!
>>>>> kernel: dwc3 dwc3.0.auto: request 00000000fbc71244 was not queued to =
ep5in
>>>>> kernel: dwc3 dwc3.0.auto: request 00000000ad1b8c18 was not queued to =
ep5in
>>>>> kernel: dwc3 dwc3.0.auto: Fifosize(2154) > RAM size(2022) ep5in
>>>>> depth:115540359
>>>>> kernel: configfs-gadget gadget: u_audio_start_playback:451 Error!
>>>>> kernel: configfs-gadget gadget: u_audio_start_playback:451 Error!
>>>>> kernel: dwc3 dwc3.0.auto: request 000000003c32dcc5 was not queued to =
ep5in
>>>>> kernel: dwc3 dwc3.0.auto: request 00000000b2512aa9 was not queued to =
ep5in
>>>>>
>>>>> Removing uac2 from the config makes the call trace go away, but the R=
/W
>>>>> speed does not change.
>>> I am testing with 5.14.0-rc2 and now related error appears (not in rc1).
>>> Disabling uac2 solves it still. Any idea what it could be?
>>>
>>> BUG: unable to handle page fault for address: 0000000500000000
>>> #PF: supervisor instruction fetch in kernel mode
>>> #PF: error_code(0x0010) - not-present page
>>> PGD 0 P4D 0
>>> Oops: 0010 [#1] SMP PTI
>>> CPU: 0 PID: 494 Comm: irq/14-dwc3 Not tainted
>>> 5.14.0-rc2-edison-acpi-standard #1
>> (cool that you're running on ACPI heh)
> Thanks to Andy this is Edison-Arduino board with ACPI.
>>> Hardware name: Intel Corporation Merrifield/BODEGA BAY, BIOS 542
>>> 2015.01.21:18.19.48
>>> RIP: 0010:0x500000000
>>> Code: Unable to access opcode bytes at RIP 0x4ffffffd6.
>>> RSP: 0018:ffffa4d00045fc28 EFLAGS: 00010046
>>> RAX: 0000000500000000 RBX: ffff8cd546aed200 RCX: 0000000000000000
>>> RDX: 0000000000000000 RSI: ffff8cd547bfcae0 RDI: ffff8cd546aed200
>>> RBP: ffff8cd547bfcae0 R08: 0000000000000000 R09: 0000000000000001
>>> R10: ffff8cd541fd28c0 R11: 0000000000000000 R12: ffff8cd547342828
>>> R13: ffff8cd546aed248 R14: 0000000000000000 R15: ffff8cd548b1d000
>>> FS:  0000000000000000(0000) GS:ffff8cd57e200000(0000) knlGS:00000000000=
00000
>>> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>> CR2: 0000000500000000 CR3: 000000000311e000 CR4: 00000000001006f0
>>> Call Trace:
>>>    ? dwc3_remove_requests.constprop.0+0x14d/0x170
>>>    ? __dwc3_gadget_ep_disable+0x7a/0x160
>>>    ? dwc3_gadget_ep_disable+0x3d/0xd0
>>>    ? usb_ep_disable+0x1c/0x
>>>    ? u_audio_stop_capture+0x79/0x120 [u_audio]
>>>    ? afunc_set_alt+0x73/0x80 [usb_f_uac2]
>>>    ? composite_setup+0x224/0x1b90 [libcomposite]
>>>    ? __dwc3_gadget_kick_transfer+0x160/0x400
>>>    ? dwc3_gadget_ep_queue+0xf3/0x1a0
>>>    ? configfs_composite_setup+0x6b/0x90 [libcomposite]
>>>    ? configfs_composite_setup+0x6b/0x90 [libcomposite]
>>>    ? dwc3_ep0_interrupt+0x459/0xa40
>>>    ? dwc3_thread_interrupt+0x8ee/0xf40
>>>    ? __schedule+0x235/0x6c0
>>>    ? disable_irq_nosync+0x10/0x10
>>>    ? irq_thread_fn+0x1b/0x60
>>>    ? irq_thread+0xc0/0x160
>>>    ? irq_thread_check_affinity+0x70/0x70
>>>    ? irq_forced_thread_fn+0x70/0x70
>>>    ? kthread+0x122/0x140
>>>    ? set_kthread_struct+0x40/0x40
>>>    ? ret_from_fork+0x22/0x30
>> Do you mind enabling dwc3 traces and collecting them? Trying to figure
>> out how we got here.
>>
> I'll try if I can get the same error by booting with USB in host mode=20
> and then switch to device mode. If so I can enable traces and collect as=
=20
> you explained me before.
>
> I'll try before monday, as then I fly for a holiday and will not be=20
> available before rc5.

you can enable all of those with kernel cmdline :-)

https://www.kernel.org/doc/html/latest/admin-guide/kernel-parameters.html

you need ftrace_dump_on_oops=3D1 and also need the correct options on
trace_buf_size and trace_event.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFFBAEBCAAvFiEE9DumQ60WEZ09LIErzlfNM9wDzUgFAmD6prwRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzlfNM9wDzUi2CAf+Kz5z/Z388lfY844QMLR/DnG2Wiw1RNBe
XiTA8qSzwKgB55ZtO17uVK8GFMMYpvv4I7dnSlSltlaSzEBT3ZWPs3dqVUrjPktq
7q31dOcRB0DcFIaIxKG6Ip4xe6juQ76T6UmkcnN5c92v6z1YslokrjOiN/KCyVbv
eXo7dq1q5L6r3zX2ABIxA7JbGghOUWGQb8o7/F/AsdZWJ127KHb+vUNKjmjqHGcw
ztr2GE4/+DersZ5mm9yyqTKMSs3JrjSctXSDK+xceujIUjRl1Noz3+npvCu22XsD
7YSQnek9lcTT6W68zgWDPGNbCfGY143d1Yh3D+G2/EEmm6FTArAVPQ==
=XlmN
-----END PGP SIGNATURE-----
--=-=-=--
