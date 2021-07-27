Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 896D33D7D3A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jul 2021 20:14:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229797AbhG0SOg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Jul 2021 14:14:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:55702 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229729AbhG0SOg (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Jul 2021 14:14:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 083F760238;
        Tue, 27 Jul 2021 18:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627409676;
        bh=nn9R7wVKtzsVNQaCXM+thlxjjbgQUZyYdGa8T/TxtpI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=RgkHJxIrDEnFiRnJT387ZWHYx37YvH32Je11nYiuGCoy1AUPkXS/xfw/qpqgLVpox
         WBwD+QBmJ/BrOoxoX6VtheBWZouy/vP+5QRSOP0o4/DWhXvQpPEA23tyn/37VJuwjX
         JSuzjH9S6RdGieKk65F0pyB1MHCxYb+WrWDTHGphVzbU697YcKgD0kj3DUW4TRntwc
         e61treKXiDImGf39DzGJsl+NIXN3dLLjigpeVeBF0KnvBaiJFzdEVP/4Foy4rxUYQi
         g8v4EgpfDcNunxLLsCPJSObph2fmijIZ9gopmcmHk8zA8CTwpjLs1bZBzi/MY1RXr8
         CbTOCilxPPDSw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210727092613.23056-1-shawn.guo@linaro.org>
References: <20210727092613.23056-1-shawn.guo@linaro.org>
Subject: Re: [PATCH] clk: qcom: smd-rpm: Fix MSM8936 RPM_SMD_PCNOC_A_CLK
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Shawn Guo <shawn.guo@linaro.org>
Date:   Tue, 27 Jul 2021 11:14:34 -0700
Message-ID: <162740967472.2368309.11298377107562326191@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Shawn Guo (2021-07-27 02:26:13)
> Commit a0384ecfe2aa ("clk: qcom: smd-rpm: De-duplicate identical
> entries") introduces the following regression on MSM8936/MSM8939, as
> RPM_SMD_PCNOC_A_CLK gets pointed to pcnoc_clk by mistake.  Fix it by
> correcting the clock to pcnoc_a_clk.
>=20
> [    1.307363] Unable to handle kernel NULL pointer dereference at virtua=
l address 0000000000000000
> [    1.313593] Mem abort info:
> [    1.322512]   ESR =3D 0x96000004
> [    1.325132]   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
> [    1.338872]   SET =3D 0, FnV =3D 0
> [    1.355483]   EA =3D 0, S1PTW =3D 0
> [    1.368702]   FSC =3D 0x04: level 0 translation fault
> [    1.383294] Data abort info:
> [    1.398292]   ISV =3D 0, ISS =3D 0x00000004
> [    1.398297]   CM =3D 0, WnR =3D 0
> [    1.398301] [0000000000000000] user address but active_mm is swapper
> [    1.404193] Internal error: Oops: 96000004 [#1] PREEMPT SMP
> [    1.420596] Modules linked in:
> [    1.420604] CPU: 0 PID: 5 Comm: kworker/0:0 Not tainted 5.14.0-rc3+ #1=
98
> [    1.441010] pc : __clk_register+0x48/0x780
> [    1.446045] lr : __clk_register+0x3c/0x780
> [    1.449953] sp : ffff800010063440
> [    1.454031] x29: ffff800010063440 x28: 0000000000000004 x27: 000000000=
0000066
> [    1.457423] x26: 0000000000000001 x25: 000000007fffffff x24: ffff80001=
0f9f388
> [    1.464540] x23: ffff00007fc12a90 x22: ffff0000034b2010 x21: 000000000=
0000000
> [    1.471658] x20: ffff800010f9fff8 x19: ffff00000152a700 x18: 000000000=
0000001
> [    1.478778] x17: ffff00007fbd40c8 x16: 0000000000000460 x15: 000000000=
0000465
> [    1.485895] x14: ffffffffffffffff x13: 746e756f635f7265 x12: 696669746=
f6e5f6b
> [    1.493013] x11: 0000000000000006 x10: 0000000000000000 x9 : 000000000=
0000000
> [    1.500131] x8 : ffff00000152a800 x7 : 0000000000000000 x6 : 000000000=
000003f
> [    1.507249] x5 : 0000000000000040 x4 : 0000000000000000 x3 : 000000000=
0000004
> [    1.514367] x2 : 0000000000000000 x1 : 0000000000000cc0 x0 : ffff00000=
152a700
> [    1.521486] Call trace:
> [    1.528598]  __clk_register+0x48/0x780
> [    1.530855]  clk_hw_register+0x20/0x60
> [    1.534674]  devm_clk_hw_register+0x50/0xa8
> [    1.538408]  rpm_smd_clk_probe+0x1a4/0x260
> [    1.542488]  platform_probe+0x68/0xd8
> [    1.546653]  really_probe+0x140/0x2f8
> [    1.550386]  __driver_probe_device+0x78/0xe0
> [    1.554033]  driver_probe_device+0x80/0x110
> [    1.558373]  __device_attach_driver+0x90/0xe0
> [    1.562280]  bus_for_each_drv+0x78/0xc8
> [    1.566793]  __device_attach+0xf0/0x150
> [    1.570438]  device_initial_probe+0x14/0x20
> [    1.574259]  bus_probe_device+0x9c/0xa8
> [    1.578425]  device_add+0x378/0x870
> [    1.582243]  of_device_add+0x44/0x60
> [    1.585716]  of_platform_device_create_pdata+0xc0/0x110
> [    1.589538]  of_platform_bus_create+0x17c/0x388
> [    1.594485]  of_platform_populate+0x50/0xf0
> [    1.598998]  qcom_smd_rpm_probe+0xd4/0x128
> [    1.603164]  rpmsg_dev_probe+0xbc/0x1a8
> [    1.607330]  really_probe+0x140/0x2f8
> [    1.611063]  __driver_probe_device+0x78/0xe0
> [    1.614883]  driver_probe_device+0x80/0x110
> [    1.619224]  __device_attach_driver+0x90/0xe0
> [    1.623131]  bus_for_each_drv+0x78/0xc8
> [    1.627643]  __device_attach+0xf0/0x150
> [    1.631289]  device_initial_probe+0x14/0x20
> [    1.635109]  bus_probe_device+0x9c/0xa8
> [    1.639275]  device_add+0x378/0x870
> [    1.643095]  device_register+0x20/0x30
> [    1.646567]  rpmsg_register_device+0x54/0x90
> [    1.650387]  qcom_channel_state_worker+0x168/0x288
> [    1.654814]  process_one_work+0x1a0/0x328
> [    1.659415]  worker_thread+0x4c/0x420
> [    1.663494]  kthread+0x150/0x160
> [    1.667138]  ret_from_fork+0x10/0x18
> [    1.670442] Code: 97f56b92 b40034a0 aa0003f3 52819801 (f94002a0)
> [    1.674004] ---[ end trace 412fa6f47384cdfe ]---

Applied to clk-fixes
