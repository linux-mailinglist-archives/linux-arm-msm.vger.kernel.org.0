Return-Path: <linux-arm-msm+bounces-113028-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Yln5LK1LLmrjswQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113028-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 08:35:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE246807B6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 08:35:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=appspotmail.com (policy=none);
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113028-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113028-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 882D7300A134
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 06:35:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06F80313534;
	Sun, 14 Jun 2026 06:35:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A783233939
	for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 06:35:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781418922; cv=none; b=O9ni+IZp30t38C94JzW26f+sIFHXwSmUIPxGOid+CNQyJROZouYlPwK0FxEBJeqyG5NMzqbZb8qzWjGKdW+ohpAEN/uXXTkvShw/84+VxROQxMKabWEKhz31lOvwrphXxeR130HWPT0k8E+TtK1LzlV4wlqAeCTnyHm7T2IZmgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781418922; c=relaxed/simple;
	bh=EZZyW2ZU93TbBJhrcX7GgGo0IIldE2RPsm73CxcqY0A=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=VDRHny8uFJBCLDXqNxfgqckAr5CZZjW/muYVrWPzvf3WxpGc47brctN9yD1P4mSRS9hyKzu5Y0R30TgAHwnmo4cWDwnGC8Qh11QVtR4FM8wzGGJApLfbU7UC7au1u7L5GDoAA5B5w2zHNq0MGNo0tgza1Km6GH8JGrMmEw1RXtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-486db2bf46eso3022762b6e.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 23:35:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781418920; x=1782023720;
        h=cc:to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2r4zfjzZDA4KbiiIFggzjIxr+jx1S4GN8osZMKExG8M=;
        b=K9Ofj2xSjjiwnHXPvTJy0n8xqDqngfArOnU/dZNK/j0QMhS/H4nHzXY0OP1aYrATUt
         d4cf2z3GCtP1l7s8v2/nbXYli6AmsMHZwEOKN7VS/FUA8V/u1f6lxhIfN3GRQhEy9Vxn
         NElitD8GJZLRj/AsYDPikqrzr0R6Z8T8jRtkpu2KHduzE3zRZiEqpDqG+u2WYTimEaa5
         KZ+KIzt1rDNooK4Mqll84+D7h1MXspoZGxahukLBofQd2adDYSswBPyFvO6mntgKgI5O
         vR8aYaNjsSlePeV8UqMolqlMncibqBb+pL1LbgAF2mwOY/uOqI6Fczh7bFynIxQnBEvQ
         C9KQ==
X-Forwarded-Encrypted: i=1; AFNElJ/MR8RlD47ndh2p4H8vcCqvb8thAgOu/jcJfjz2JhNM1ErYyQ8XoK0leJhGJFEWy1nUMN76ASzghS4nnJiN@vger.kernel.org
X-Gm-Message-State: AOJu0YxXayyKzeiiRW5H0UIJyLTCqoUklq6+K7Rny7u1ZFUSp9IIVvlA
	LOe1kz3LqdDHKjtiK0nXd74hN0nnGuyq7mnzEBHwWzIX3bLTeJJPqedqUIH7+N8OVOIWeI9DpZ1
	qSou4dkHn0E1mEPdWoL7E4brE+9xyvSEWrWZvjhxVSVOdGlXABUiz2o50YMM=
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:15a9:b0:479:f7e7:4a81 with SMTP id
 5614622812f47-487416dc1d4mr3871956b6e.0.1781418920603; Sat, 13 Jun 2026
 23:35:20 -0700 (PDT)
Date: Sat, 13 Jun 2026 23:35:20 -0700
In-Reply-To: <20260613-vmalloc_maple-v1-0-0aa740bb944b@oss.qualcomm.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a2e4ba8.8812e0fc.3c3fa4.000f.GAE@google.com>
Subject: [syzbot ci] Re: mm/vmalloc: migrate vmap_area indexing from rb-tree
 to maple-tree
From: syzbot ci <syzbot+ciff8167f913c663d5@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, aliceryhl@google.com, andrewjballance@gmail.com, 
	balbirs@nvidia.com, dev.jain@arm.com, dvyukov@google.com, elver@google.com, 
	glider@google.com, jackmanb@google.com, liam@infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, ljs@kernel.org, maple-tree@lists.infradead.org, 
	neil.armstrong@linaro.org, praan@google.com, pranjal.arya@oss.qualcomm.com, 
	puranjay@kernel.org, santosh.shukla@amd.com, shuah@kernel.org, 
	smostafa@google.com, sudeep.holla@kernel.org, surenb@google.com, 
	suzuki.poulose@arm.com, urezki@gmail.com, will@kernel.org, wkarny@gmail.com
Cc: syzbot@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:akpm@linux-foundation.org,m:aliceryhl@google.com,m:andrewjballance@gmail.com,m:balbirs@nvidia.com,m:dev.jain@arm.com,m:dvyukov@google.com,m:elver@google.com,m:glider@google.com,m:jackmanb@google.com,m:liam@infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:ljs@kernel.org,m:maple-tree@lists.infradead.org,m:neil.armstrong@linaro.org,m:praan@google.com,m:pranjal.arya@oss.qualcomm.com,m:puranjay@kernel.org,m:santosh.shukla@amd.com,m:shuah@kernel.org,m:smostafa@google.com,m:sudeep.holla@kernel.org,m:surenb@google.com,m:suzuki.poulose@arm.com,m:urezki@gmail.com,m:will@kernel.org,m:wkarny@gmail.com,m:syzbot@lists.linux.dev,m:syzkaller-bugs@googlegroups.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[linux-foundation.org,google.com,gmail.com,nvidia.com,arm.com,infradead.org,vger.kernel.org,kvack.org,kernel.org,lists.infradead.org,linaro.org,oss.qualcomm.com,amd.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-113028-lists,linux-arm-msm=lfdr.de,ciff8167f913c663d5];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[syzbot@syzkaller.appspotmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,googlegroups.com:email,syzbot.org:url,googlesource.com:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EFE246807B6

syzbot ci has tested the following series

[v1] mm/vmalloc: migrate vmap_area indexing from rb-tree to maple-tree
https://lore.kernel.org/all/20260613-vmalloc_maple-v1-0-0aa740bb944b@oss.qualcomm.com
* [PATCH RFC 01/12] mm/vmalloc: introduce maple_tree-based indexing for vmap_area
* [PATCH RFC 02/12] mm/vmalloc: convert allocation-side gap finding and insertion to maple_tree
* [PATCH RFC 03/12] mm/vmalloc: convert free, purge, and pcpu paths to maple_tree
* [PATCH RFC 04/12] mm/vmalloc: finalize maple-only indexing and shrink struct vmap_area
* [PATCH RFC 05/12] mm/vmalloc: tighten failure handling under memory pressure
* [PATCH RFC 06/12] mm/vmalloc: tighten alloc/free hot paths
* [PATCH RFC 07/12] mm/vmalloc: consolidate occupied tree as authoritative index on hot path
* [PATCH RFC 08/12] mm/vmalloc: track lazy-purge queue as a list_head
* [PATCH RFC 09/12] mm/vmalloc: collapse busy-tree find-then-unlink into a single mas_erase
* [PATCH RFC 10/12] mm/vmalloc: per-CPU caching of free ranges from the maple_tree allocator
* [PATCH RFC 11/12] mm/vmalloc: O(1) lookup of cached vmap_areas with bounded fast-reject
* [PATCH RFC 12/12] mm/vmalloc: harden bump-allocator alloc/free against UBSAN array bounds

and found the following issue:
WARNING in alloc_vmap_area

Full report is available here:
https://ci.syzbot.org/series/45e14120-bbb8-4a0c-b5c6-0aaf3b421101

***

WARNING in alloc_vmap_area

tree:      linux-next
URL:       https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next
base:      c425609d6ac4012c8bbf01ec2e10e801b1923a7b
arch:      amd64
compiler:  Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8
config:    https://ci.syzbot.org/builds/481f4f4b-8d55-4e3c-b96c-1de7b763686d/config
syz repro: https://ci.syzbot.org/findings/ae02a227-b4c3-476a-826b-3bbf18bdbfe4/syz_repro

------------[ cut here ]------------
(*left)->va_end > start
WARNING: mm/vmalloc.c:1371 at find_vmap_area_insert_neighbors_mt_locked mm/vmalloc.c:1371 [inline], CPU#0: syz.0.17/5834
WARNING: mm/vmalloc.c:1371 at validate_vmap_area_range_insert_mt_locked mm/vmalloc.c:1388 [inline], CPU#0: syz.0.17/5834
WARNING: mm/vmalloc.c:1371 at insert_vmap_area_busy_locked mm/vmalloc.c:1480 [inline], CPU#0: syz.0.17/5834
WARNING: mm/vmalloc.c:1371 at alloc_vmap_area+0x5458/0x87f0 mm/vmalloc.c:2917, CPU#0: syz.0.17/5834
Modules linked in:
CPU: 0 UID: 0 PID: 5834 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
RIP: 0010:find_vmap_area_insert_neighbors_mt_locked mm/vmalloc.c:1371 [inline]
RIP: 0010:validate_vmap_area_range_insert_mt_locked mm/vmalloc.c:1388 [inline]
RIP: 0010:insert_vmap_area_busy_locked mm/vmalloc.c:1480 [inline]
RIP: 0010:alloc_vmap_area+0x5458/0x87f0 mm/vmalloc.c:2917
Code: a5 ff e9 fc 0f 00 00 e8 e6 80 a5 ff 4c 8b 74 24 18 e9 ed 17 00 00 e8 d7 80 a5 ff 90 0f 0b 90 e9 34 e5 ff ff e8 c9 80 a5 ff 90 <0f> 0b 90 4c 8b 74 24 18 eb 09 e8 b9 80 a5 ff 90 0f 0b 90 49 bf 00
RSP: 0018:ffffc90031ade360 EFLAGS: 00010293
RAX: ffffffff82200aa7 RBX: ffffffffa0000000 RCX: ffff888109e2bb80
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: ffffc90031adf4f8 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000100 R11: 0000000000000003 R12: ffff88810007d888
R13: ffffffffa0002000 R14: ffffffffa0401000 R15: ffffc90031adeb80
FS:  00007f97268b66c0(0000) GS:ffff88818e8af000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f9727132780 CR3: 000000010cd9e000 CR4: 00000000000006f0
Call Trace:
 <TASK>
 __get_vm_area_node+0x1f8/0x300 mm/vmalloc.c:4214
 __vmalloc_node_range_noprof+0x36a/0x1750 mm/vmalloc.c:5030
 execmem_vmalloc+0xa7/0x1d0 mm/execmem.c:41
 bpf_dispatcher_change_prog+0x25d/0xd70 kernel/bpf/dispatcher.c:151
 bpf_prog_test_run_xdp+0x794/0x1160 net/bpf/test_run.c:1464
 bpf_prog_test_run+0x2cd/0x340 kernel/bpf/syscall.c:4859
 __sys_bpf+0xa20/0xd90 kernel/bpf/syscall.c:6436
 __do_sys_bpf kernel/bpf/syscall.c:6537 [inline]
 __se_sys_bpf kernel/bpf/syscall.c:6534 [inline]
 __x64_sys_bpf+0xba/0xd0 kernel/bpf/syscall.c:6534
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f972725ce59
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f97268b6028 EFLAGS: 00000246 ORIG_RAX: 0000000000000141
RAX: ffffffffffffffda RBX: 00007f97274d5fa0 RCX: 00007f972725ce59
RDX: 0000000000000050 RSI: 0000200000000b80 RDI: 000000000000000a
RBP: 00007f97272f2d6f R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f97274d6038 R14: 00007f97274d5fa0 R15: 00007ffd7848c2a8
 </TASK>


***

If these findings have caused you to resend the series or submit a
separate fix, please add the following tag to your commit message:
  Tested-by: syzbot@syzkaller.appspotmail.com

---
This report is generated by a bot. It may contain errors.
syzbot ci engineers can be reached at syzkaller@googlegroups.com.

To test a patch for this bug, please reply with `#syz test`
(should be on a separate line).

The patch should be attached to the email.
Note: arguments like custom git repos and branches are not supported.

