Return-Path: <linux-arm-msm+bounces-3796-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62EE58097AB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 01:52:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 93ACD1C20C73
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 00:52:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FA77ED0;
	Fri,  8 Dec 2023 00:52:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 164F61717
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Dec 2023 16:52:33 -0800 (PST)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-1ef4f8d294eso2730974fac.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Dec 2023 16:52:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701996752; x=1702601552;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q+lLU4UeUFRuZ1hTtp7No7qPuCAeUchRtyaBvI4kxJM=;
        b=lWTB3ZLoHcp7BWpc+lSofQDIvoMNgR8lAkKTOuOaU7gxUiDZjfSNp+TfW7wT0HFWWL
         CrPkRJ/Y55PPPT20rti7MxkMjvqNNFy+j1YM6V77+lH1rXiIS5Ku5Lz0dvmUqS9RXbrm
         MutXO13lA453N3B0Eat+sK+S0veuOzlBuvHkr6Fizdw26X82T6/PmQt08s/JPv6UMvgu
         wjrUKUPL4SLo8YWZ4g/AyhcBgYw8k6Ik+v8ajGS4aiLukzK3UQJEyAMrtQtq6Z0TCRLE
         07YjYRO4B7ORB7xxjteFx0De8kKY7DZxF0gvWsH5E9zCHoUXBS0/qDdikc+OYd26g75p
         S+5A==
X-Gm-Message-State: AOJu0Yzzec00hgY6K426MniGrhvp85SyoSmizehhZJ6Nk78GP/tleHpm
	+xxi6y8cfti9J0Lfk/Ui0eYxntIMQewlJlkRSl25lq5nu8B3
X-Google-Smtp-Source: AGHT+IHz0t9HDTwTPbGcqm3L8DilUF699lfVq5Ys0NNmRQ6uTy+NWhRg9XN2Fhdsp7k1S/luzO0oYbl3gzkK+eX+bo/rEqdhdt3s
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6870:fba2:b0:1fb:1176:50ff with SMTP id
 kv34-20020a056870fba200b001fb117650ffmr4228508oab.6.1701996750942; Thu, 07
 Dec 2023 16:52:30 -0800 (PST)
Date: Thu, 07 Dec 2023 16:52:30 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000bfba3a060bf4ffcf@google.com>
Subject: [syzbot] [arm-msm?] [net?] memory leak in radix_tree_insert (2)
From: syzbot <syzbot+006987d1be3586e13555@syzkaller.appspotmail.com>
To: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, mani@kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    33cc938e65a9 Linux 6.7-rc4
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16ddf83ce80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=37d1b8bb20150e6
dashboard link: https://syzkaller.appspot.com/bug?extid=006987d1be3586e13555
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10276ebae80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=128c50d2e80000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/bd6d7a5ff2af/disk-33cc938e.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/ce91b40ecddb/vmlinux-33cc938e.xz
kernel image: https://storage.googleapis.com/syzbot-assets/5507257fe99e/bzImage-33cc938e.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+006987d1be3586e13555@syzkaller.appspotmail.com

write to /proc/sys/kernel/hung_task_check_interval_secs failed: No such file or directory
write to /proc/sys/kernel/softlockup_all_cpu_backtrace failed: No such file or directory
BUG: memory leak
unreferenced object 0xffff88810bbf56d8 (size 576):
  comm "syz-executor250", pid 5051, jiffies 4294951219 (age 12.920s)
  hex dump (first 32 bytes):
    3c 00 01 00 00 00 00 00 00 00 00 00 00 00 00 00  <...............
    f0 a9 2d 0c 81 88 ff ff f0 56 bf 0b 81 88 ff ff  ..-......V......
  backtrace:
    [<ffffffff81631398>] kmemleak_alloc_recursive include/linux/kmemleak.h:42 [inline]
    [<ffffffff81631398>] slab_post_alloc_hook mm/slab.h:766 [inline]
    [<ffffffff81631398>] slab_alloc_node mm/slub.c:3478 [inline]
    [<ffffffff81631398>] slab_alloc mm/slub.c:3486 [inline]
    [<ffffffff81631398>] __kmem_cache_alloc_lru mm/slub.c:3493 [inline]
    [<ffffffff81631398>] kmem_cache_alloc+0x298/0x430 mm/slub.c:3502
    [<ffffffff84b5094c>] radix_tree_node_alloc.constprop.0+0x7c/0x1a0 lib/radix-tree.c:276
    [<ffffffff84b524cf>] __radix_tree_create lib/radix-tree.c:624 [inline]
    [<ffffffff84b524cf>] radix_tree_insert+0x14f/0x360 lib/radix-tree.c:712
    [<ffffffff84ae105d>] qrtr_tx_wait net/qrtr/af_qrtr.c:277 [inline]
    [<ffffffff84ae105d>] qrtr_node_enqueue+0x57d/0x630 net/qrtr/af_qrtr.c:348
    [<ffffffff84ae26f6>] qrtr_bcast_enqueue+0x66/0xd0 net/qrtr/af_qrtr.c:891
    [<ffffffff84ae32d2>] qrtr_sendmsg+0x232/0x450 net/qrtr/af_qrtr.c:992
    [<ffffffff83ec3c32>] sock_sendmsg_nosec net/socket.c:730 [inline]
    [<ffffffff83ec3c32>] __sock_sendmsg+0x52/0xa0 net/socket.c:745
    [<ffffffff83ec3d7b>] sock_write_iter+0xfb/0x180 net/socket.c:1158
    [<ffffffff816961a7>] call_write_iter include/linux/fs.h:2020 [inline]
    [<ffffffff816961a7>] new_sync_write fs/read_write.c:491 [inline]
    [<ffffffff816961a7>] vfs_write+0x327/0x590 fs/read_write.c:584
    [<ffffffff816966fb>] ksys_write+0x13b/0x170 fs/read_write.c:637
    [<ffffffff84b6ddcf>] do_syscall_x64 arch/x86/entry/common.c:51 [inline]
    [<ffffffff84b6ddcf>] do_syscall_64+0x3f/0x110 arch/x86/entry/common.c:82
    [<ffffffff84c0008b>] entry_SYSCALL_64_after_hwframe+0x63/0x6b

BUG: memory leak
unreferenced object 0xffff88810bbf5920 (size 576):
  comm "syz-executor250", pid 5051, jiffies 4294951219 (age 12.920s)
  hex dump (first 32 bytes):
    36 0f 01 00 00 00 00 00 d8 56 bf 0b 81 88 ff ff  6........V......
    f0 a9 2d 0c 81 88 ff ff 38 59 bf 0b 81 88 ff ff  ..-.....8Y......
  backtrace:
    [<ffffffff81631398>] kmemleak_alloc_recursive include/linux/kmemleak.h:42 [inline]
    [<ffffffff81631398>] slab_post_alloc_hook mm/slab.h:766 [inline]
    [<ffffffff81631398>] slab_alloc_node mm/slub.c:3478 [inline]
    [<ffffffff81631398>] slab_alloc mm/slub.c:3486 [inline]
    [<ffffffff81631398>] __kmem_cache_alloc_lru mm/slub.c:3493 [inline]
    [<ffffffff81631398>] kmem_cache_alloc+0x298/0x430 mm/slub.c:3502
    [<ffffffff84b5094c>] radix_tree_node_alloc.constprop.0+0x7c/0x1a0 lib/radix-tree.c:276
    [<ffffffff84b524cf>] __radix_tree_create lib/radix-tree.c:624 [inline]
    [<ffffffff84b524cf>] radix_tree_insert+0x14f/0x360 lib/radix-tree.c:712
    [<ffffffff84ae105d>] qrtr_tx_wait net/qrtr/af_qrtr.c:277 [inline]
    [<ffffffff84ae105d>] qrtr_node_enqueue+0x57d/0x630 net/qrtr/af_qrtr.c:348
    [<ffffffff84ae26f6>] qrtr_bcast_enqueue+0x66/0xd0 net/qrtr/af_qrtr.c:891
    [<ffffffff84ae32d2>] qrtr_sendmsg+0x232/0x450 net/qrtr/af_qrtr.c:992
    [<ffffffff83ec3c32>] sock_sendmsg_nosec net/socket.c:730 [inline]
    [<ffffffff83ec3c32>] __sock_sendmsg+0x52/0xa0 net/socket.c:745
    [<ffffffff83ec3d7b>] sock_write_iter+0xfb/0x180 net/socket.c:1158
    [<ffffffff816961a7>] call_write_iter include/linux/fs.h:2020 [inline]
    [<ffffffff816961a7>] new_sync_write fs/read_write.c:491 [inline]
    [<ffffffff816961a7>] vfs_write+0x327/0x590 fs/read_write.c:584
    [<ffffffff816966fb>] ksys_write+0x13b/0x170 fs/read_write.c:637
    [<ffffffff84b6ddcf>] do_syscall_x64 arch/x86/entry/common.c:51 [inline]
    [<ffffffff84b6ddcf>] do_syscall_64+0x3f/0x110 arch/x86/entry/common.c:82
    [<ffffffff84c0008b>] entry_SYSCALL_64_after_hwframe+0x63/0x6b

BUG: memory leak
unreferenced object 0xffff88810c832000 (size 576):
  comm "syz-executor250", pid 5051, jiffies 4294951219 (age 12.920s)
  hex dump (first 32 bytes):
    30 3f 01 00 00 00 00 00 20 59 bf 0b 81 88 ff ff  0?...... Y......
    f0 a9 2d 0c 81 88 ff ff 18 20 83 0c 81 88 ff ff  ..-...... ......
  backtrace:
    [<ffffffff81631398>] kmemleak_alloc_recursive include/linux/kmemleak.h:42 [inline]
    [<ffffffff81631398>] slab_post_alloc_hook mm/slab.h:766 [inline]
    [<ffffffff81631398>] slab_alloc_node mm/slub.c:3478 [inline]
    [<ffffffff81631398>] slab_alloc mm/slub.c:3486 [inline]
    [<ffffffff81631398>] __kmem_cache_alloc_lru mm/slub.c:3493 [inline]
    [<ffffffff81631398>] kmem_cache_alloc+0x298/0x430 mm/slub.c:3502
    [<ffffffff84b5094c>] radix_tree_node_alloc.constprop.0+0x7c/0x1a0 lib/radix-tree.c:276
    [<ffffffff84b524cf>] __radix_tree_create lib/radix-tree.c:624 [inline]
    [<ffffffff84b524cf>] radix_tree_insert+0x14f/0x360 lib/radix-tree.c:712
    [<ffffffff84ae105d>] qrtr_tx_wait net/qrtr/af_qrtr.c:277 [inline]
    [<ffffffff84ae105d>] qrtr_node_enqueue+0x57d/0x630 net/qrtr/af_qrtr.c:348
    [<ffffffff84ae26f6>] qrtr_bcast_enqueue+0x66/0xd0 net/qrtr/af_qrtr.c:891
    [<ffffffff84ae32d2>] qrtr_sendmsg+0x232/0x450 net/qrtr/af_qrtr.c:992
    [<ffffffff83ec3c32>] sock_sendmsg_nosec net/socket.c:730 [inline]
    [<ffffffff83ec3c32>] __sock_sendmsg+0x52/0xa0 net/socket.c:745
    [<ffffffff83ec3d7b>] sock_write_iter+0xfb/0x180 net/socket.c:1158
    [<ffffffff816961a7>] call_write_iter include/linux/fs.h:2020 [inline]
    [<ffffffff816961a7>] new_sync_write fs/read_write.c:491 [inline]
    [<ffffffff816961a7>] vfs_write+0x327/0x590 fs/read_write.c:584
    [<ffffffff816966fb>] ksys_write+0x13b/0x170 fs/read_write.c:637
    [<ffffffff84b6ddcf>] do_syscall_x64 arch/x86/entry/common.c:51 [inline]
    [<ffffffff84b6ddcf>] do_syscall_64+0x3f/0x110 arch/x86/entry/common.c:82
    [<ffffffff84c0008b>] entry_SYSCALL_64_after_hwframe+0x63/0x6b

BUG: memory leak
unreferenced object 0xffff88810c832248 (size 576):
  comm "syz-executor250", pid 5051, jiffies 4294951219 (age 12.920s)
  hex dump (first 32 bytes):
    2a 3f 00 00 00 00 00 00 00 20 83 0c 81 88 ff ff  *?....... ......
    f0 a9 2d 0c 81 88 ff ff 60 22 83 0c 81 88 ff ff  ..-.....`"......
  backtrace:
    [<ffffffff81631398>] kmemleak_alloc_recursive include/linux/kmemleak.h:42 [inline]
    [<ffffffff81631398>] slab_post_alloc_hook mm/slab.h:766 [inline]
    [<ffffffff81631398>] slab_alloc_node mm/slub.c:3478 [inline]
    [<ffffffff81631398>] slab_alloc mm/slub.c:3486 [inline]
    [<ffffffff81631398>] __kmem_cache_alloc_lru mm/slub.c:3493 [inline]
    [<ffffffff81631398>] kmem_cache_alloc+0x298/0x430 mm/slub.c:3502
    [<ffffffff84b5094c>] radix_tree_node_alloc.constprop.0+0x7c/0x1a0 lib/radix-tree.c:276
    [<ffffffff84b524cf>] __radix_tree_create lib/radix-tree.c:624 [inline]
    [<ffffffff84b524cf>] radix_tree_insert+0x14f/0x360 lib/radix-tree.c:712
    [<ffffffff84ae105d>] qrtr_tx_wait net/qrtr/af_qrtr.c:277 [inline]
    [<ffffffff84ae105d>] qrtr_node_enqueue+0x57d/0x630 net/qrtr/af_qrtr.c:348
    [<ffffffff84ae26f6>] qrtr_bcast_enqueue+0x66/0xd0 net/qrtr/af_qrtr.c:891
    [<ffffffff84ae32d2>] qrtr_sendmsg+0x232/0x450 net/qrtr/af_qrtr.c:992
    [<ffffffff83ec3c32>] sock_sendmsg_nosec net/socket.c:730 [inline]
    [<ffffffff83ec3c32>] __sock_sendmsg+0x52/0xa0 net/socket.c:745
    [<ffffffff83ec3d7b>] sock_write_iter+0xfb/0x180 net/socket.c:1158
    [<ffffffff816961a7>] call_write_iter include/linux/fs.h:2020 [inline]
    [<ffffffff816961a7>] new_sync_write fs/read_write.c:491 [inline]
    [<ffffffff816961a7>] vfs_write+0x327/0x590 fs/read_write.c:584
    [<ffffffff816966fb>] ksys_write+0x13b/0x170 fs/read_write.c:637
    [<ffffffff84b6ddcf>] do_syscall_x64 arch/x86/entry/common.c:51 [inline]
    [<ffffffff84b6ddcf>] do_syscall_64+0x3f/0x110 arch/x86/entry/common.c:82
    [<ffffffff84c0008b>] entry_SYSCALL_64_after_hwframe+0x63/0x6b

write to /proc/sys/kernel/hung_task_check_interval_secs failed: No such file or directory
write to /proc/sys/kernel/softlockup_all_cpu_backtrace failed: No such file or directory


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

