Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABF2932D5C8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Mar 2021 16:01:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232804AbhCDPAE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Mar 2021 10:00:04 -0500
Received: from z11.mailgun.us ([104.130.96.11]:25627 "EHLO z11.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232829AbhCDPAD (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Mar 2021 10:00:03 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1614869985; h=Content-Type: MIME-Version: Message-ID: Date:
 Subject: Cc: To: From: Sender;
 bh=Mp4y3XuQs2v0QqRomuzbqm4+HVvWzdxfT00QrRzr04M=; b=MWzR4Ieugmv95TPf5TOnEbN6NE3aOw2DW2wt+Na0tDv9jwlgWH3Qa/TiTTZNd8ZFjR6EGf+7
 gj7ynKWhlfL0C8TzK4b7Kn24wLxCr7yFEll1p05DNI7EvlilgbpRepOcha4bdQP4Auql78aN
 qjWbL5+4blShQ5RMosZdBg8pdZU=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 6040f5dac862e1b9fd0854f6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 04 Mar 2021 14:59:38
 GMT
Sender: kvalo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 22D11C43464; Thu,  4 Mar 2021 14:59:38 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi [88.114.240.156])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: kvalo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 56864C433C6;
        Thu,  4 Mar 2021 14:59:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 56864C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=kvalo@codeaurora.org
From:   Kalle Valo <kvalo@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org,
        Hemant Kumar <hemantk@codeaurora.org>,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, ath11k@lists.infradead.org
Subject: [regression] mhi: mhi_pm_st_worker blocked for more than 61 seconds.
Date:   Thu, 04 Mar 2021 16:59:33 +0200
Message-ID: <87im6755ii.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi MHI folks,

I upgraded my QCA6390 x86 test box to v5.12-rc1 and started seeing
kernel crashes when testing ath11k. I don't recall seeing this on v5.11
so it looks like a new problem, but I cannot be 100% sure. Netconsole
output is below. I have most of the kernel debug functionality enabled
(KASAN etc).

I can fairly easy reproduce this by looping insmod and rmmod of mhi,
wireless and ath11k modules. It does not happen every time, but I would
say I can reproduce the problem within 10 test loops or so.

Any ideas what could cause this? I have not bisected this due to lack of
time, but I can test patches etc.

Kalle

[  385.427842] ath11k_pci 0000:06:00.0: BAR 0: assigned [mem 0xdb000000-0xdbffffff 64bit]
[  385.513269] mhi mhi0: Requested to power ON
[  385.519621] mhi mhi0: Power on setup success
[  386.754217] rmmod ath11k_pci
[  554.714680] INFO: task kworker/u17:0:94 blocked for more than 61 seconds.
[  554.714745]       Tainted: G    B             5.12.0-rc1+ #412
[  554.714785] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[  554.714824] task:kworker/u17:0   state:D stack:23960 pid:   94 ppid:     2 flags:0x00004000
[  554.714870] Workqueue: mhi_hiprio_wq mhi_pm_st_worker [mhi]
[  554.714923] Call Trace:
[  554.714963]  __schedule+0x555/0x1250
[  554.715005]  ? io_schedule_timeout+0x140/0x140
[  554.715045]  ? trace_hardirqs_on+0x1c/0x120
[  554.715086]  schedule+0xcb/0x270
[  554.715124]  schedule_timeout+0x116/0x200
[  554.715162]  ? usleep_range+0x140/0x140
[  554.715200]  ? __next_timer_interrupt+0x160/0x160
[  554.715239]  ? __wake_up_locked_sync_key+0x20/0x20
[  554.715279]  ? trace_hardirqs_on+0x1c/0x120
[  554.715319]  mhi_fw_load_bhie+0x4bd/0x5c0 [mhi]
[  554.715363]  ? __mhi_download_rddm_in_panic+0x560/0x560 [mhi]
[  554.715405]  ? finish_wait+0xb2/0x260
[  554.715444]  ? finish_wait+0x260/0x260
[  554.715483]  ? _raw_spin_lock_irqsave+0x55/0x80
[  554.715525]  mhi_fw_load_handler+0x67a/0xd90 [mhi]
[  554.715569]  ? mhi_alloc_bhie_table+0x4c0/0x4c0 [mhi]
[  554.715613]  ? finish_wait+0x260/0x260
[  554.715652]  ? mhi_register_controller+0x11f0/0x11f0 [mhi]
[  554.715709]  mhi_pm_st_worker+0x425/0x720 [mhi]
[  554.715758]  ? mhi_pm_mission_mode_transition.isra.0+0x710/0x710 [mhi]
[  554.715803]  ? lock_acquire+0x19d/0x200
[  554.715842]  ? process_one_work+0x77f/0x1370
[  554.715885]  process_one_work+0x833/0x1370
[  554.715925]  ? pwq_dec_nr_in_flight+0x260/0x260
[  554.715964]  ? lock_acquire+0x19d/0x200
[  554.716004]  ? worker_thread+0x23d/0xc90
[  554.716044]  worker_thread+0xd5/0xc90
[  554.716083]  ? process_one_work+0x1370/0x1370
[  554.716123]  kthread+0x361/0x430
[  554.716162]  ? _raw_spin_unlock_irq+0x1f/0x30
[  554.716199]  ? __kthread_bind_mask+0x90/0x90
[  554.716241]  ret_from_fork+0x22/0x30
[  554.716337] INFO: lockdep is turned off.
[  554.716374] Kernel panic - not syncing: hung_task: blocked tasks
[  554.716411] CPU: 0 PID: 53 Comm: khungtaskd Tainted: G    B             5.12.0-rc1+ #412
[  554.716451] Hardware name: Intel(R) Client Systems NUC8i7HVK/NUC8i7HVB, BIOS HNKBLi70.86A.0049.2018.0801.1601 08/01/2018
[  554.716488] Call Trace:
[  554.716524]  dump_stack+0xa5/0xe6
[  554.716564]  panic+0x211/0x459
[  554.716601]  ? __warn_printk+0xee/0xee
[  554.716639]  ? memcpy+0x39/0x60
[  554.716680]  check_hung_uninterruptible_tasks.cold+0x11/0x11
[  554.716719]  watchdog+0xef/0x120
[  554.716757]  ? check_hung_uninterruptible_tasks+0x490/0x490
[  554.716795]  kthread+0x361/0x430
[  554.716832]  ? _raw_spin_unlock_irq+0x1f/0x30
[  554.716868]  ? __kthread_bind_mask+0x90/0x90
[  554.716906]  ret_from_fork+0x22/0x30
[  554.717950] Kernel Offset: 0x2e200000 from 0xffffffff81000000 (relocation range: 0xffffffff80000000-0xffffffffbfffffff)
[  554.717993] Rebooting in 10 seconds..
[  564.791281] list_add double add: new=ffffffffb26a8520, prev=ffffffffb2684f88, next=ffffffffb26a8520.
[  564.791331] ------------[ cut here ]------------
[  564.791365] kernel BUG at lib/list_debug.c:29!
[  564.791403] invalid opcode: 0000 [#1] SMP DEBUG_PAGEALLOC KASAN PTI
[  564.791439] CPU: 0 PID: 53 Comm: khungtaskd Tainted: G    B             5.12.0-rc1+ #412
[  564.791476] Hardware name: Intel(R) Client Systems NUC8i7HVK/NUC8i7HVB, BIOS HNKBLi70.86A.0049.2018.0801.1601 08/01/2018
[  564.791511] RIP: 0010:__list_add_valid.cold+0x26/0x3c
[  564.791547] Code: fb ed 8e fe 4c 89 e1 48 c7 c7 a0 ec db b1 e8 aa 5b fe ff 0f 0b 48 89 f2 4c 89 e1 48 89 ee 48 c7 c7 e0 ed db b1 e8 93 5b fe ff <0f> 0b 48 89 f1 48 c7 c7 60 ed db b1 4c 89 e6 e8 7f 5b fe ff 0f 0b
[  564.791794] RSP: 0018:ffffc90000477c98 EFLAGS: 00010082
[  564.791831] RAX: 0000000000000058 RBX: ffffffffb26a8520 RCX: 0000000000000000
[  564.791865] RDX: 0000000000000027 RSI: 0000000000000004 RDI: fffff5200008ef86
[  564.791899] RBP: ffffffffb26a8520 R08: 0000000000000058 R09: ffff88822dde57bb
[  564.791951] R10: ffffed1045bbcaf7 R11: 0000000000000001 R12: ffffffffb26a8520
[  564.792010] R13: 0000000000000048 R14: 0000000000000046 R15: ffffffffb2684f40
[  564.792061] FS:  0000000000000000(0000) GS:ffff88822dc00000(0000) knlGS:0000000000000000
[  564.792112] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  564.792163] CR2: 00005645180f8d58 CR3: 000000011e83a006 CR4: 00000000003706f0
[  564.792399] Call Trace:
[  564.792450]  __register_nmi_handler+0x1f4/0x370
[  564.792506]  nmi_shootdown_cpus+0x91/0x100
[  564.792558]  native_machine_emergency_restart+0x405/0x4f0
[  564.792609]  ? nmi_shootdown_cpus+0x100/0x100
[  564.792657]  ? kmsg_dump+0x3d/0x350
[  564.792707]  ? kmsg_dump+0x250/0x350
[  564.792756]  panic+0x3bc/0x459
[  564.792804]  ? __warn_printk+0xee/0xee
[  564.792853]  ? memcpy+0x39/0x60
[  564.792903]  check_hung_uninterruptible_tasks.cold+0x11/0x11
[  564.792953]  watchdog+0xef/0x120
[  564.793001]  ? check_hung_uninterruptible_tasks+0x490/0x490
[  564.793050]  kthread+0x361/0x430
[  564.793099]  ? _raw_spin_unlock_irq+0x1f/0x30
[  564.793149]  ? __kthread_bind_mask+0x90/0x90
[  564.793199]  ret_from_fork+0x22/0x30
[  564.793250] Modules linked in: ath11k_pci(-) ath11k mac80211 libarc4 cfg80211 qmi_helpers qrtr_mhi mhi qrtr ns mos7840 usbserial nvme nvme_core [last unloaded: mhi]
[  564.793326] ---[ end trace 71395487ba9b6a13 ]---
[  564.793376] RIP: 0010:__list_add_valid.cold+0x26/0x3c
[  564.793427] Code: fb ed 8e fe 4c 89 e1 48 c7 c7 a0 ec db b1 e8 aa 5b fe ff 0f 0b 48 89 f2 4c 89 e1 48 89 ee 48 c7 c7 e0 ed db b1 e8 93 5b fe ff <0f> 0b 48 89 f1 48 c7 c7 60 ed db b1 4c 89 e6 e8 7f 5b fe ff 0f 0b
[  564.793490] RSP: 0018:ffffc90000477c98 EFLAGS: 00010082
[  564.793540] RAX: 0000000000000058 RBX: ffffffffb26a8520 RCX: 0000000000000000
[  564.793589] RDX: 0000000000000027 RSI: 0000000000000004 RDI: fffff5200008ef86
[  564.794009] RBP: ffffffffb26a8520 R08: 0000000000000058 R09: ffff88822dde57bb
[  564.794061] R10: ffffed1045bbcaf7 R11: 0000000000000001 R12: ffffffffb26a8520
[  564.794111] R13: 0000000000000048 R14: 0000000000000046 R15: ffffffffb2684f40
[  564.794159] FS:  0000000000000000(0000) GS:ffff88822dc00000(0000) knlGS:0000000000000000
[  564.794208] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  564.794257] CR2: 00005645180f8d58 CR3: 000000011e83a006 CR4: 00000000003706f0
[  564.794306] Kernel panic - not syncing: Fatal exception
[  564.794356] Kernel Offset: 0x2e200000 from 0xffffffff81000000 (relocation range: 0xffffffff80000000-0xffffffffbfffffff)
[  564.794412] Rebooting in 10 seconds..
