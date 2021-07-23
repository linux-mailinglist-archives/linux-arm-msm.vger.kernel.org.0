Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36E763D34F1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jul 2021 08:59:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234140AbhGWGTT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Jul 2021 02:19:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:57102 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234104AbhGWGTT (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Jul 2021 02:19:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3471B60EE2;
        Fri, 23 Jul 2021 06:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627023593;
        bh=XYXQf54lUe46euwLN+ychiYT/41gupoCm+Yy3SMr++o=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=qbcZApT3+5FbOvXnlYHTrFqZr3N3Cuf9+FeQ3FSheY/40atppQ0s2oW0mtHp+Rxca
         nh6krXtoyK6eMO7jcvbnBIiiSh+QRuroPUoKFVJyc2Ogbsxv6w3JgyRk+ITOa31aQ+
         qPdzfOrjvr9MgWSP5wHDbJgyiISNIQv3we2mqj/DW14tKQ0PaWdfpTTwSXnNuSMOrP
         JYXAhSw3QUElXdhyKBkznGrVCrqbHkOtK4OkbaFjl3lgwiNE5JeIjPAiRxF61GeKl7
         62tIEhQg02v+sn3VeKkDEZCJ7R+PMFd61XuAO8HA3XfFyjmLN9hFwjVNHrcDQl169T
         UUAmyIrAtaPKQ==
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
In-Reply-To: <bafa93bb-11e3-c8a5-e14a-b0a6d5695055@gmail.com>
References: <1623923899-16759-1-git-send-email-wcheng@codeaurora.org>
 <cfb83fe4-369c-ec72-7887-3bcb0f20fe15@gmail.com>
 <ec8050c5-c013-4af6-b39e-69779c009a9c@codeaurora.org>
 <f5ed0ee7-e333-681f-0f1a-d0227562204b@gmail.com>
 <2e01c435-9ecc-4e3b-f55c-612a86667020@codeaurora.org>
 <2ae9fa6a-3bb1-3742-0dd3-59678bdd8643@gmail.com>
 <ebea75fe-5334-197b-f67a-cb6e1e30b39e@codeaurora.org>
 <bafa93bb-11e3-c8a5-e14a-b0a6d5695055@gmail.com>
Date:   Fri, 23 Jul 2021 09:59:42 +0300
Message-ID: <87v951ldlt.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Ferry Toth <fntoth@gmail.com> writes:
>>> kernel: configfs-gadget gadget: u_audio_start_playback:451 Error!
>>> kernel: configfs-gadget gadget: u_audio_start_playback:451 Error!
>>> kernel: dwc3 dwc3.0.auto: request 00000000fbc71244 was not queued to ep=
5in
>>> kernel: dwc3 dwc3.0.auto: request 00000000ad1b8c18 was not queued to ep=
5in
>>> kernel: dwc3 dwc3.0.auto: Fifosize(2154) > RAM size(2022) ep5in
>>> depth:115540359
>>> kernel: configfs-gadget gadget: u_audio_start_playback:451 Error!
>>> kernel: configfs-gadget gadget: u_audio_start_playback:451 Error!
>>> kernel: dwc3 dwc3.0.auto: request 000000003c32dcc5 was not queued to ep=
5in
>>> kernel: dwc3 dwc3.0.auto: request 00000000b2512aa9 was not queued to ep=
5in
>>>
>>> Removing uac2 from the config makes the call trace go away, but the R/W
>>> speed does not change.
>
> I am testing with 5.14.0-rc2 and now related error appears (not in rc1).=
=20
> Disabling uac2 solves it still. Any idea what it could be?
>
> BUG: unable to handle page fault for address: 0000000500000000
> #PF: supervisor instruction fetch in kernel mode
> #PF: error_code(0x0010) - not-present page
> PGD 0 P4D 0
> Oops: 0010 [#1] SMP PTI
> CPU: 0 PID: 494 Comm: irq/14-dwc3 Not tainted=20
> 5.14.0-rc2-edison-acpi-standard #1

(cool that you're running on ACPI heh)

> Hardware name: Intel Corporation Merrifield/BODEGA BAY, BIOS 542=20
> 2015.01.21:18.19.48
> RIP: 0010:0x500000000
> Code: Unable to access opcode bytes at RIP 0x4ffffffd6.
> RSP: 0018:ffffa4d00045fc28 EFLAGS: 00010046
> RAX: 0000000500000000 RBX: ffff8cd546aed200 RCX: 0000000000000000
> RDX: 0000000000000000 RSI: ffff8cd547bfcae0 RDI: ffff8cd546aed200
> RBP: ffff8cd547bfcae0 R08: 0000000000000000 R09: 0000000000000001
> R10: ffff8cd541fd28c0 R11: 0000000000000000 R12: ffff8cd547342828
> R13: ffff8cd546aed248 R14: 0000000000000000 R15: ffff8cd548b1d000
> FS:  0000000000000000(0000) GS:ffff8cd57e200000(0000) knlGS:0000000000000=
000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000000500000000 CR3: 000000000311e000 CR4: 00000000001006f0
> Call Trace:
>   ? dwc3_remove_requests.constprop.0+0x14d/0x170
>   ? __dwc3_gadget_ep_disable+0x7a/0x160
>   ? dwc3_gadget_ep_disable+0x3d/0xd0
>   ? usb_ep_disable+0x1c/0x70
>   ? u_audio_stop_capture+0x79/0x120 [u_audio]
>   ? afunc_set_alt+0x73/0x80 [usb_f_uac2]
>   ? composite_setup+0x224/0x1b90 [libcomposite]
>   ? __dwc3_gadget_kick_transfer+0x160/0x400
>   ? dwc3_gadget_ep_queue+0xf3/0x1a0
>   ? configfs_composite_setup+0x6b/0x90 [libcomposite]
>   ? configfs_composite_setup+0x6b/0x90 [libcomposite]
>   ? dwc3_ep0_interrupt+0x459/0xa40
>   ? dwc3_thread_interrupt+0x8ee/0xf40
>   ? __schedule+0x235/0x6c0
>   ? disable_irq_nosync+0x10/0x10
>   ? irq_thread_fn+0x1b/0x60
>   ? irq_thread+0xc0/0x160
>   ? irq_thread_check_affinity+0x70/0x70
>   ? irq_forced_thread_fn+0x70/0x70
>   ? kthread+0x122/0x140
>   ? set_kthread_struct+0x40/0x40
>   ? ret_from_fork+0x22/0x30

Do you mind enabling dwc3 traces and collecting them? Trying to figure
out how we got here.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFFBAEBCAAvFiEE9DumQ60WEZ09LIErzlfNM9wDzUgFAmD6aN4RHGJhbGJpQGtl
cm5lbC5vcmcACgkQzlfNM9wDzUi3NQf6AqLgWuOZCCcgUr2dWldDdGcKPZS9EQVq
ybt4YcNSonpVM8/E7znv/MjHG3nQFdGlA97oxE6KUPYjRKyiW7QMuCAEZQ3uPZPA
6dvewAZkO9zlV1gBd7GTZjuluTU2idc9ee0KwlAN08xIkwV0/ZhDhg21NtwInw56
BKNONvmAKkJCTshzQAIc6/4ONLhb8oggreJMlCmb7MSaVkfz2BSn6NzoayoyaCjK
TXq0omJjggBm0gC26eD1xW2wftFdxfqJ28dTWtMPM4gdb41e9izENa18JytD0lkR
HXNXm0V8AxHgF7HOUQ2TP8crCFsMTn4zVRm3YLVhR0iYlddO627vMA==
=nekZ
-----END PGP SIGNATURE-----
--=-=-=--
