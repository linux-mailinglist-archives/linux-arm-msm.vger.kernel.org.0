Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 113FD2F2E95
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Jan 2021 13:03:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731957AbhALMCs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Jan 2021 07:02:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731952AbhALMCs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Jan 2021 07:02:48 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA3F0C061575;
        Tue, 12 Jan 2021 04:02:07 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id c7so2002263edv.6;
        Tue, 12 Jan 2021 04:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=ViI/kYKPhvlpXz68MZFVvOHDtQcyx7g2cldThPMrUMc=;
        b=bcWti4GExhy8+wrDhG6sG9N34ThSCBz9oUiUYdgJT9L3B7FTYXrh/ma2wVZn2g0j13
         /S7ZacoiBlZi691NnQ3wZLJZQm583TkElcsfM37kAE4EbS+m9cjqN1j9gzxiX7fZVd2h
         pP0LXl5U6H82UZbQM7FuxCIMSiuFKYmRlZZER3Wp1ZPAqz9fc52xZfOdd4fGYWp4OPuo
         9FlwJRqNqM6TAJQ+C9sGEXK8wGXAre1MzDuzMlfcrmMABwY1Ybumxj3keH3iefGJQOGi
         6zrwaRuPr1zCqAgDKl/UWCgj6m78/+MArUYyO4ZdvhCECpvdoUCq4gcb6EZ9ivjnRah2
         OWog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=ViI/kYKPhvlpXz68MZFVvOHDtQcyx7g2cldThPMrUMc=;
        b=YaILnI/T0wpPW3NRk30yxRjHXEf6CXVEnjO3SQiwTgNKsYcQtCV2kWzKN2d2/uathB
         +QlD4mlIxbtbJjTZ9Iz9IUQeSJlNZZthDCJs/71GmxuppSCZJ2JwKzwTA5APHittQZiP
         d9Xqj/xJBGLI0bwcUF+az6NQIJ6xp1Y+ISxK4mUa5qNwq2dDndt0n1msDIaksCpDKOzD
         Va1zGotoLVz+QxDMHRsUGiuBFfVeYP7dRBZAnsXhVK0j2bnQ5qVjUkuRywXMpv3nqZj7
         qz1yH1YsRwIUb/ikswdrgYgE2bBUkW3piJOpu8T1wEDTtgqzLonWEOVhMJLcJGeV3AEF
         SDTw==
X-Gm-Message-State: AOAM531AlE/BUCPKZsWfUPLhqLthIrblL2ye5R+1aHmVGGZq0/Ycmtf5
        yNuBR8ZNBFCDtLIhc/F4g3MyYj5DI5M32gPI0xCLAV8cfQw=
X-Google-Smtp-Source: ABdhPJwWzZBtyqr2sKfY7o9Hrjp3nADaydCZuT4iMqdFu+gKKzqNsKc8EHqJ38YA8+pPKIg43FT3mQy7BrE3ja52jUA=
X-Received: by 2002:aa7:d75a:: with SMTP id a26mr3038931eds.230.1610452926015;
 Tue, 12 Jan 2021 04:02:06 -0800 (PST)
MIME-Version: 1.0
From:   Pintu Agarwal <pintu.ping@gmail.com>
Date:   Tue, 12 Jan 2021 17:31:54 +0530
Message-ID: <CAOuPNLiUBhJdsgw9bjQxxhkeBHQFoE_vN_Na6kw3ksr89r+HOg@mail.gmail.com>
Subject: [BUG]: Kernel 4.9: Kernel crash at fs/sysfs/file.c : sysfs_kf_seq_show
To:     open list <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        landy.gross@linaro.org, David Brown <david.brown@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        indranilghsh428@gmail.com, Pintu Kumar <pintu.ping@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

I am using Kernel: 4.9.217 for one of the ARM32 boards for Qualcomm SOC.
https://github.com/android-linux-stable/msm-4.9

But I think this is a general bug applicable to :Kernel 4.9 under
fs/sysfs/file.c
So, I wanted to quickly check here if others are familiar with this
issue and if it is fixed already.
Note, this issue does not occur in 4.14 Kernel.

When I execute below command, the Kernel is crashing.
I tried to add few debug prints to find more details. I see that the
ops->show pointer is not valid (seems corrupted).
So I wanted to understand how this can happen only for this particular node.
Other sysfs entries are working fine.

# cat /sys/power/rpmh_stats/master_stats
[  140.873100] sysfs_kf_seq_show: Enter - 1
[  140.873139] sysfs_kf_seq_show: Enter - 2 : buff: e6aa0e1e,
ops->show: 1482eca6
[  140.876229] sysfs_kf_seq_show: Enter - 3 : Inside ops->show
[  140.885040] Unable to handle kernel paging request at virtual
address db74fd70
[  140.888595] pgd = 29c1de54
[  140.895874] [db74fd70] *pgd=9b60041e(bad)
[  140.902561] Internal error: Oops: 8000000d [#1] PREEMPT ARM
[  140.902650] Modules linked in: bluetooth_power(O) emac_dwc_eqos(O) evdev
[  140.914712] CPU: 0 PID: 1990 Comm: cat Tainted: G        W  O    4.9.217 #22

[  140.922014] task: 4e6f2759 task.stack: bce99fef
[  140.930428] PC is at 0xdb74fd70
[  140.934683] LR is at sysfs_kf_seq_show+0x13c/0x1d8
[  140.937807] pc : [<db74fd70>]    lr : [<c0286028>]    psr: a00f0013
[  140.937807] sp : d8a29cb0  ip : 00000000  fp : 00000000
[  140.942676] r10: db74e880  r9 : d9fef500  r8 : c0c21e38
[  140.954038] r7 : 00001000  r6 : c1f9a000  r5 : d9fef680  r4 : c0399830
[  140.959249] r3 : db74fd70  r2 : c1f9a000  r1 : db74e850  r0 : db74e880
[  140.965847] Flags: NzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
[  140.972357] Control: 10c53c7d  Table: 99f00059  DAC: 00000051
[  140.979559]
[  140.979559] PC: 0xdb74fcf0:
[  140.985285] fcf0  0fe55620 00000000 c0c14990 00000000 00001000
00000000 00000000 00000000
[  140.997604] fd10  c135ea1c 80800052 00004fd6 00000000 00000004
00000000 de1e0410 c0f44926
[  141.005765] fd30  dbcd91a1 00000000 00000000 00000000 555832c2
00000000 00000000 db74fec0
[  141.013924] fd50  de1cf000 00000000 00000000 00000000 db7a4418
41ed0011 00004fd7 00000000
[  141.022084] fd70  00000003 00000000 de3b3000 c0f44926 db890ec0
00000000 00000000 00000000
[  141.030243] fd90  555832c2 00000000 00000001 db74fdd0 de1cf000
00000000 00000000 00000000
[  141.038404] fdb0  db74e840 41ed0011 00004fd8 00000000 00000008
00000000 db74fd70 c0f44926
[  141.046563] fdd0  00000001 00000000 00000000 00000000 555832c2
00000000 00000001 db74ff10
[  141.054724]
[  141.054724] LR: 0xc0285fa8:
[  141.054816] 5fa8  e0427003 23a06000 30866003 e3570a01 3585200c
3a000032 e5983000 e1a02006
[  141.067136] 5fc8  e59f10c4 e59f00dc ebfced74 e3a01a01 e1a00006
eb044487 e3560000 1a000003
[  141.075296] 5fe8  e3a02061 e59f10a0 e59f00bc eaffffc2 e5984000
e3540000 0a00000d e59f1088
[  141.083455] 6008  e59f00a8 ebfced65 e5991000 e5983000 e1a02006
e1a0000a e5911040 e12fff33
[  141.091616] 6028  e3500000 b8bd87f0 e3500a01 ba00000c ea000007
e3a02070 e59f104c e59f0070
[  141.099775] 6048  ebfced56 e3570a01 b5953004 b585300c ba00000b
e59f005c e5981000 ebfbecfc
[  141.107934] 6068  e3000fff e595300c e0800003 e5953004 e1500003
9585000c 9a000001 e7f001f2
[  141.116095] 6088  eaffffc5 e3a00000 e8bd87f0 c0c1484f c0efab69
c0efab84 c0efab9e c0efaaf9
[  141.124256]
[  141.124256] SP: 0xd8a29c30:
[  141.124347] 9c30  00000000 00000000 c1460a0c 0000002f 00000051
bf000000 db74fd70 db74fd70
[  141.136668] 9c50  a00f0013 ffffffff d8a29c94 c010c008 db74e880
db74e850 c1f9a000 db74fd70
[  141.144828] 9c70  c0399830 d9fef680 c1f9a000 00001000 c0c21e38
d9fef500 db74e880 00000000
[  141.152986] 9c90  00000000 d8a29cb0 c0286028 db74fd70 a00f0013
ffffffff 00000051 00000000
[  141.161147] 9cb0  d9fef680 00001000 00000000 00000001 d9fb1000
d8a29de0 d9ffe800 c02409ac
[  141.169307] 9cd0  d9fef6b0 d9ffe808 00000000 00000000 d8a29d20
d9ffe800 d9ffe800 d9ffe800
[  141.177466] 9cf0  00000000 00000000 00001000 d8a29de0 d8a29d20
c02854c0 bf000000 c021f83c
[  141.185626] 9d10  d8a29d1c d8a29d20 c1416c10 d9fef700 00000002
00000000 00010000 d9fef700
[  141.193788] Process cat (pid: 1990, stack limit = 0xcdf38e89)
[  141.193884] Stack: (0xd8a29cb0 to 0xd8a2a000)
[  141.199612] 9ca0:                                     d9fef680
00001000 00000000 00000001
[  141.203959] 9cc0: d9fb1000 d8a29de0 d9ffe800 c02409ac d9fef6b0
d9ffe808 00000000 00000000
[  141.212119] 9ce0: d8a29d20 d9ffe800 d9ffe800 d9ffe800 00000000
00000000 00001000 d8a29de0
[  141.220279] 9d00: d8a29d20 c02854c0 bf000000 c021f83c d8a29d1c
d8a29d20 c1416c10 d9fef700
[  141.228439] 9d20: 00000002 00000000 00010000 d9fef700 00000010
de001e40 d9ffd940 00000040
[  141.236598] 9d40: de001e40 c020cc4c 00000200 064200ca 00000000
0000000f d9f69000 00010000
[  141.244758] 9d60: 00001000 c1416c10 024200c0 c0c103a4 d9f69000
c03a8b9c 00010000 d8a29ddc
[  141.252919] 9d80: d8a29dd8 d8a29de8 d9f69000 d9ffd940 d9ffe800
c03aaef0 00000000 d8a29e00
[  141.261077] 9da0: ffffe000 00000000 00000010 d8a29ec0 d9ffe800
c021f8cc d8a29de0 00000000
[  141.269237] 9dc0: 00000010 c024cb90 00000000 c1ecb000 00000001
d9ffd940 d9ffd940 00000000
[  141.277396] 9de0: 00000000 00000000 00000008 00000000 01000000
d9f69000 00000000 00000000
[  141.285556] 9e00: d9fb1000 00001000 c1b31000 00001000 d9f3a000
00001000 d9fb0000 00001000
[  141.293716] 9e20: d9f48000 00001000 d9fbe000 00001000 d9fb2000
00001000 d9f5a000 00001000
[  141.301877] 9e40: d9f49000 00001000 d9f38000 00001000 d9f39000
00001000 d9f2e000 00001000
[  141.310037] 9e60: d9f2f000 00001000 d9f28000 00001000 d9f29000
00001000 d9f0a000 00001000
[  141.318195] 9e80: d8a29ec0 d8a29ef0 d9f69000 00000000 d9ffe800
01000000 00000000 c024d438
[  141.326355] 9ea0: 00000000 c024c8cc 00000000 c034accc 00000000
00000000 00000002 c19c1c00
[  141.334515] 9ec0: 00000000 00000000 c1055150 d9ffe800 d8a29f40
00000000 00000000 00000000
[  141.342674] 9ee0: c19c1c00 7fffffff 00000000 c024ca38 01000000
01000000 00000000 c19c1c00
[  141.350834] 9f00: 00000000 00000000 d8a29f48 00000000 00000000
00000000 00000000 c19c1c00
[  141.358994] 9f20: d9ffe800 00000000 01000000 c021fd08 01000000
00000000 d9ffe800 c1f9a000
[  141.367154] 9f40: 00000000 00000000 00000000 00000000 00000020
00000000 00000000 01000000
[  141.375313] 9f60: 000000ef 00000000 d8a28000 000000ef be855bb4
c0220688 7fffffff 00000000
[  141.383473] 9f80: 01000000 00000000 01000000 01000000 00000000
01000000 000000ef c0107a84
[  141.391633] 9fa0: d8a28000 c01078c0 01000000 00000000 00000001
00000003 00000000 01000000
[  141.399793] 9fc0: 01000000 00000000 01000000 000000ef 00000001
00000001 00000000 be855bb4
[  141.407952] 9fe0: 7f696ad4 be855ba4 7f5c82fd b6e87358 600f0030
00000001 00000000 00000000
[  141.416126] [<c0286028>] (sysfs_kf_seq_show) from [<c02409ac>]
(seq_read+0x264/0x488)
[  141.424276] [<c02409ac>] (seq_read) from [<c021f83c>]
(do_readv_writev+0x2a0/0x2ec)
[  141.432085] [<c021f83c>] (do_readv_writev) from [<c021f8cc>]
(vfs_readv+0x44/0x4c)
[  141.439550] [<c021f8cc>] (vfs_readv) from [<c024cb90>]
(default_file_splice_read+0x140/0x260)
[  141.447191] [<c024cb90>] (default_file_splice_read) from
[<c024c8cc>] (splice_direct_to_actor+0xe4/0x1c0)
[  141.455785] [<c024c8cc>] (splice_direct_to_actor) from [<c024ca38>]
(do_splice_direct+0x90/0xa8)
[  141.465332] [<c024ca38>] (do_splice_direct) from [<c021fd08>]
(do_sendfile+0x1b8/0x2d8)
[  141.474185] [<c021fd08>] (do_sendfile) from [<c0220688>]
(SyS_sendfile64+0xb0/0x13c)
[  141.481915] [<c0220688>] (SyS_sendfile64) from [<c01078c0>]
(ret_fast_syscall+0x0/0x28)
[  141.489898] Code: db7a4418 41ed0011 00004fd7 00000000 (00000003)
[  141.497619] ---[ end trace 1ad2096094348e6a ]---
[  141.503906] Kernel panic - not syncing: Fatal exception

--------------
Corresponding code is here:
https://github.com/android-linux-stable/msm-4.9/blob/kernel.lnx.4.9.r11-rel/fs/sysfs/file.c

If anybody is familiar with this issue please let us know.


Thanks,
Pintu
