Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7B37315204
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Feb 2021 15:50:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232323AbhBIOtF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Feb 2021 09:49:05 -0500
Received: from mail29.static.mailgun.info ([104.130.122.29]:22603 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232319AbhBIOs7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Feb 2021 09:48:59 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1612882117; h=Content-Type: MIME-Version: Message-ID: Date:
 Subject: Cc: To: From: Sender;
 bh=5rFTjCDDx10wsWcvhYmGGGTp3wlfU4cX3CTsMlApCb4=; b=ATGIb9vZAzZZe3oGszTtfZag/7zO9Mbc63th3Y69NCLZWsVmE32Dudnpdd+V5wJerbs7Rfpl
 IDWjvbBIdC0yf2ZLWrRIGX6QkbvaNrjNiDvvm0fZPYydYf44QfPL1h4t1p5OmRYWEElTih54
 95DDd+LAdDp3/ue9GH/yGdlWqWE=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 6022a0a8e4842e91289cfeff (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 09 Feb 2021 14:48:08
 GMT
Sender: kvalo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 68ED5C433C6; Tue,  9 Feb 2021 14:48:07 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi [88.114.240.156])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: kvalo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DB641C433CA;
        Tue,  9 Feb 2021 14:48:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DB641C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=kvalo@codeaurora.org
From:   Kalle Valo <kvalo@codeaurora.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Bhaumik Bhatt <bbhatt@codeaurora.org>,
        ath11k@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Hemant Kumar <hemantk@codeaurora.org>
Subject: [regression] mhi: rmmod ath11k_pci crashing on v5.11
Date:   Tue, 09 Feb 2021 16:48:01 +0200
Message-ID: <8735y5uwke.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Loic,

I noticed that v5.11-rc6 was crashing on my ath11k test box with
QCA6390. The box was down for few weeks so I only noticed it late in the
cycle. After some manual testing I found out that reverting this commit
fixes the issue:

a7f422f2f89e bus: mhi: Fix channel close issue on driver remove

The crash happens when I issue 'sudo rmmod ath11k_pci' and it happens
every time. Through netconsole I get:

Feb  9 16:43:30 nuc1 [  313.202778] ath11k_pci 0000:06:00.0: qmi failed set mode request, mode: 4, err = -110
Feb  9 16:43:30 nuc1 [  313.202932] ath11k_pci 0000:06:00.0: qmi failed to send wlan mode off
Feb  9 16:43:30 nuc1 [  313.225017] ------------[ cut here ]------------
Feb  9 16:43:30 nuc1 [  313.225118] DMA-API: ath11k_pci 0000:06:00.0: device driver tries to free DMA memory it has not allocated [device address=0x00000000fffbc000] [size=2047 bytes]
Feb  9 16:43:30 nuc1 [  313.225146] WARNING: CPU: 2 PID: 94 at kernel/dma/debug.c:963 check_unmap+0x54a/0x8b0
Feb  9 16:43:30 nuc1 [  313.225173] Modules linked in: ath11k_pci(-) ath11k mac80211 libarc4 cfg80211 qmi_helpers qrtr_mhi mhi qrtr ns mos7840 usbserial nvme nvme_core
Feb  9 16:43:30 nuc1 [  313.225222] CPU: 2 PID: 94 Comm: kworker/u17:0 Not tainted 5.11.0-rc6 #362
Feb  9 16:43:30 nuc1 [  313.225243] Hardware name: Intel(R) Client Systems NUC8i7HVK/NUC8i7HVB, BIOS HNKBLi70.86A.0049.2018.0801.1601 08/01/2018
Feb  9 16:43:30 nuc1 [  313.225263] Workqueue: mhi_hiprio_wq mhi_pm_st_worker [mhi]
Feb  9 16:43:30 nuc1 [  313.225290] RIP: 0010:check_unmap+0x54a/0x8b0
Feb  9 16:43:30 nuc1 [  313.225312] Code: 4d 85 e4 75 03 4c 8b 27 4c 89 04 24 e8 8f 78 66 00 4c 8b 04 24 48 89 c6 4c 89 e9 4c 89 e2 48 c7 c7 c8 be 16 8f e8 26 39 ae 00 <0f> 0b 44 8b 1d 6d c2 9b 01 45 85 db 0f 84 5f 02 00 00 48 83 c4 18
Feb  9 16:43:30 nuc1 [  313.225333] RSP: 0018:ffffbab5c08f3ab0 EFLAGS: 00010282
Feb  9 16:43:30 nuc1 [  313.225355] RAX: 0000000000000000 RBX: 00000000fffbc000 RCX: ffff99dbf55d9fb8
Feb  9 16:43:30 nuc1 [  313.225375] RDX: 00000000ffffffd8 RSI: 0000000000000027 RDI: ffff99dbf55d9fb0
Feb  9 16:43:30 nuc1 [  313.225395] RBP: ffffbab5c08f3b00 R08: 0000000000000001 R09: 0000000000000000
Feb  9 16:43:30 nuc1 [  313.225415] R10: 0000000000000003 R11: 3fffffffffffffff R12: ffff99da84c525d0
Feb  9 16:43:30 nuc1 [  313.225434] R13: 00000000fffbc000 R14: ffffffff90b96c90 R15: 0000000000000000
Feb  9 16:43:30 nuc1 [  313.225453] FS:  0000000000000000(0000) GS:ffff99dbf5400000(0000) knlGS:0000000000000000
Feb  9 16:43:30 nuc1 [  313.225479] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Feb  9 16:43:30 nuc1 [  313.225500] CR2: 0000556d03a34250 CR3: 000000010d9e2003 CR4: 00000000003706e0
Feb  9 16:43:30 nuc1 [  313.225520] Call Trace:
Feb  9 16:43:30 nuc1 [  313.225541]  ? __lock_acquire+0x3bd/0x6d0
Feb  9 16:43:30 nuc1 [  313.225565]  debug_dma_free_coherent+0xb0/0xf0
Feb  9 16:43:30 nuc1 [  313.225594]  ? mhi_driver_remove+0x11d/0x290 [mhi]
Feb  9 16:43:30 nuc1 [  313.225620]  ? __mutex_lock+0x6ca/0x8f0
Feb  9 16:43:30 nuc1 [  313.225643]  ? qcom_mhi_qrtr_remove+0x18/0x30 [qrtr_mhi]
Feb  9 16:43:30 nuc1 [  313.225668]  dma_free_attrs+0x48/0xb0
Feb  9 16:43:30 nuc1 [  313.225710]  mhi_driver_remove+0x21e/0x290 [mhi]
Feb  9 16:43:30 nuc1 [  313.225742]  __device_release_driver+0x17b/0x230
Feb  9 16:43:30 nuc1 [  313.225767]  device_release_driver+0x21/0x30
Feb  9 16:43:30 nuc1 [  313.225797]  bus_remove_device+0xed/0x160
Feb  9 16:43:30 nuc1 [  313.225829]  device_del+0x187/0x3e0
Feb  9 16:43:30 nuc1 [  313.225858]  ? kobject_cleanup+0x4f/0x140
Feb  9 16:43:30 nuc1 [  313.225892]  mhi_destroy_device+0x5e/0x90 [mhi]
Feb  9 16:43:30 nuc1 [  313.225927]  ? mhi_unmap_single_use_bb+0x50/0x50 [mhi]
Feb  9 16:43:30 nuc1 [  313.225962]  device_for_each_child+0x53/0x90
Feb  9 16:43:30 nuc1 [  313.225996]  mhi_pm_disable_transition+0xe4/0x4c0 [mhi]
Feb  9 16:43:30 nuc1 [  313.226034]  ? do_wait_intr_irq+0xc0/0xc0
Feb  9 16:43:30 nuc1 [  313.226072]  mhi_pm_st_worker+0x178/0x260 [mhi]
Feb  9 16:43:30 nuc1 [  313.226115]  process_one_work+0x279/0x5b0
Feb  9 16:43:30 nuc1 [  313.226155]  worker_thread+0x1c5/0x300
Feb  9 16:43:30 nuc1 [  313.226182]  ? process_one_work+0x5b0/0x5b0
Feb  9 16:43:30 nuc1 [  313.226205]  kthread+0x135/0x150
Feb  9 16:43:30 nuc1 [  313.226227]  ? __kthread_bind_mask+0x60/0x60
Feb  9 16:43:30 nuc1 [  313.226252]  ret_from_fork+0x22/0x30
Feb  9 16:43:30 nuc1 [  313.226282] irq event stamp: 22013
Feb  9 16:43:30 nuc1 [  313.226302] hardirqs last  enabled at (22021): [<ffffffff8dcdac78>] console_unlock+0x368/0x440
Feb  9 16:43:30 nuc1 [  313.226324] hardirqs last disabled at (22028): [<ffffffff8dcdac6e>] console_unlock+0x35e/0x440
Feb  9 16:43:30 nuc1 [  313.226345] softirqs last  enabled at (21486): [<ffffffffc0446263>] __mhi_unprepare_channel+0x173/0x1b0 [mhi]
Feb  9 16:43:30 nuc1 [  313.226368] softirqs last disabled at (21482): [<ffffffffc044608d>] mhi_reset_chan+0x2d/0x90 [mhi]
Feb  9 16:43:30 nuc1 [  313.226391] ---[ end trace 7ed7d298f27ad9e8 ]---
Feb  9 16:43:30 nuc1 [  313.226415] page:00000000c0d397ee refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x173bec
Feb  9 16:43:30 nuc1 [  313.226439] flags: 0x200000000000000()
Feb  9 16:43:30 nuc1 [  313.226462] raw: 0200000000000000 ffffdb57c58ff808 ffffdb57c5cf1888 0000000000000000
Feb  9 16:43:30 nuc1 [  313.226485] raw: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000000
Feb  9 16:43:30 nuc1 [  313.226506] page dumped because: VM_BUG_ON_PAGE(page_ref_count(page) == 0)
Feb  9 16:43:30 nuc1 [  313.226532] ------------[ cut here ]------------
Feb  9 16:43:30 nuc1 [  313.226554] kernel BUG at include/linux/mm.h:723!
Feb  9 16:43:30 nuc1 [  313.226578] invalid opcode: 0000 [#1] SMP DEBUG_PAGEALLOC PTI
Feb  9 16:43:30 nuc1 [  313.226594] CPU: 2 PID: 94 Comm: kworker/u17:0 Tainted: G        W         5.11.0-rc6 #362
Feb  9 16:43:30 nuc1 [  313.226607] Hardware name: Intel(R) Client Systems NUC8i7HVK/NUC8i7HVB, BIOS HNKBLi70.86A.0049.2018.0801.1601 08/01/2018
Feb  9 16:43:30 nuc1 [  313.226621] Workqueue: mhi_hiprio_wq mhi_pm_st_worker [mhi]
Feb  9 16:43:30 nuc1 [  313.226638] RIP: 0010:__free_pages+0x7e/0x90
Feb  9 16:43:30 nuc1 [  313.226651] Code: 28 d8 ff ff eb d1 85 f6 75 09 5b 5d 41 5c e9 b9 fe ff ff 5b 31 d2 5d 41 5c e9 0e d8 ff ff 48 c7 c6 30 b5 14 8f e8 c2 9d fd ff <0f> 0b 5b 5d 41 5c c3 66 66 2e 0f 1f 84 00 00 00 00 00 48 85 ff 75
Feb  9 16:43:30 nuc1 [  313.226665] RSP: 0018:ffffbab5c08f3c20 EFLAGS: 00010246
Feb  9 16:43:30 nuc1 [  313.226683] RAX: 000000000000003e RBX: ffff99dade8bd028 RCX: ffff99dbf55d9fb8
Feb  9 16:43:30 nuc1 [  313.226700] RDX: 0000000000000000 RSI: 0000000000000027 RDI: ffff99dbf55d9fb0
Feb  9 16:43:30 nuc1 [  313.226712] RBP: ffffdb57c5cefb00 R08: 0000000000000001 R09: 0000000000000000
Feb  9 16:43:30 nuc1 [  313.226725] R10: 0000000000000003 R11: 3fffffffffffffff R12: ffff99dade8bd000
Feb  9 16:43:30 nuc1 [  313.226736] R13: ffffbab5c1ec8480 R14: ffffbab5c1ec8420 R15: ffffbab5c1ec85a0
Feb  9 16:43:30 nuc1 [  313.226747] FS:  0000000000000000(0000) GS:ffff99dbf5400000(0000) knlGS:0000000000000000
Feb  9 16:43:30 nuc1 [  313.226760] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Feb  9 16:43:30 nuc1 [  313.226774] CR2: 0000556d03a34250 CR3: 000000010d9e2003 CR4: 00000000003706e0
Feb  9 16:43:30 nuc1 [  313.226788] Call Trace:
Feb  9 16:43:30 nuc1 [  313.226801]  mhi_driver_remove+0x21e/0x290 [mhi]
Feb  9 16:43:30 nuc1 [  313.226818]  __device_release_driver+0x17b/0x230
Feb  9 16:43:30 nuc1 [  313.226833]  device_release_driver+0x21/0x30
Feb  9 16:43:30 nuc1 [  313.226845]  bus_remove_device+0xed/0x160
Feb  9 16:43:30 nuc1 [  313.226859]  device_del+0x187/0x3e0
Feb  9 16:43:30 nuc1 [  313.226871]  ? kobject_cleanup+0x4f/0x140
Feb  9 16:43:30 nuc1 [  313.226884]  mhi_destroy_device+0x5e/0x90 [mhi]
Feb  9 16:43:30 nuc1 [  313.226901]  ? mhi_unmap_single_use_bb+0x50/0x50 [mhi]
Feb  9 16:43:30 nuc1 [  313.226917]  device_for_each_child+0x53/0x90
Feb  9 16:43:30 nuc1 [  313.226931]  mhi_pm_disable_transition+0xe4/0x4c0 [mhi]
Feb  9 16:43:30 nuc1 [  313.226947]  ? do_wait_intr_irq+0xc0/0xc0
Feb  9 16:43:30 nuc1 [  313.226962]  mhi_pm_st_worker+0x178/0x260 [mhi]
Feb  9 16:43:30 nuc1 [  313.226978]  process_one_work+0x279/0x5b0
Feb  9 16:43:30 nuc1 [  313.226993]  worker_thread+0x1c5/0x300
Feb  9 16:43:30 nuc1 [  313.227007]  ? process_one_work+0x5b0/0x5b0
Feb  9 16:43:30 nuc1 [  313.227022]  kthread+0x135/0x150
Feb  9 16:43:30 nuc1 [  313.227036]  ? __kthread_bind_mask+0x60/0x60
Feb  9 16:43:30 nuc1 [  313.227049]  ret_from_fork+0x22/0x30
Feb  9 16:43:30 nuc1 [  313.227064] Modules linked in: ath11k_pci(-) ath11k mac80211 libarc4 cfg80211 qmi_helpers qrtr_mhi mhi qrtr ns mos7840 usbserial nvme nvme_core
Feb  9 16:43:30 nuc1 [  313.227242] ---[ end trace 7ed7d298f27ad9e9 ]---
Feb  9 16:43:30 nuc1 [  313.227263] RIP: 0010:__free_pages+0x7e/0x90
Feb  9 16:43:30 nuc1 [  313.227282] Code: 28 d8 ff ff eb d1 85 f6 75 09 5b 5d 41 5c e9 b9 fe ff ff 5b 31 d2 5d 41 5c e9 0e d8 ff ff 48 c7 c6 30 b5 14 8f e8 c2 9d fd ff <0f> 0b 5b 5d 41 5c c3 66 66 2e 0f 1f 84 00 00 00 00 00 48 85 ff 75
Feb  9 16:43:30 nuc1 [  313.227300] RSP: 0018:ffffbab5c08f3c20 EFLAGS: 00010246
Feb  9 16:43:30 nuc1 [  313.227318] RAX: 000000000000003e RBX: ffff99dade8bd028 RCX: ffff99dbf55d9fb8
Feb  9 16:43:30 nuc1 [  313.227336] RDX: 0000000000000000 RSI: 0000000000000027 RDI: ffff99dbf55d9fb0
Feb  9 16:43:30 nuc1 [  313.227353] RBP: ffffdb57c5cefb00 R08: 0000000000000001 R09: 0000000000000000
Feb  9 16:43:30 nuc1 [  313.227370] R10: 0000000000000003 R11: 3fffffffffffffff R12: ffff99dade8bd000
Feb  9 16:43:30 nuc1 [  313.227388] R13: ffffbab5c1ec8480 R14: ffffbab5c1ec8420 R15: ffffbab5c1ec85a0
Feb  9 16:43:30 nuc1 [  313.227414] FS:  0000000000000000(0000) GS:ffff99dbf5400000(0000) knlGS:0000000000000000
Feb  9 16:43:30 nuc1 [  313.227432] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Feb  9 16:43:30 nuc1 [  313.227446] CR2: 0000556d03a34250 CR3: 000000010d9e2003 CR4: 00000000003706e0
Feb  9 16:43:30 nuc1 [  313.227463] Kernel panic - not syncing: Fatal exception
Feb  9 16:43:30 nuc1 [  313.228478] Kernel Offset: 0xcc00000 from 0xffffffff81000000 (relocation range: 0xffffffff80000000-0xffffffffbfffffff)
Feb  9 16:43:30 nuc1 [  313.228492] Rebooting in 10 seconds..

And this is the commit in question:

commit a7f422f2f89e7d48aa66e6488444a4c7f01269d5
Author:     Loic Poulain <loic.poulain@linaro.org>
AuthorDate: Fri Oct 9 11:07:14 2020 +0200
Commit:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CommitDate: Wed Nov 18 15:20:34 2020 +0530

    bus: mhi: Fix channel close issue on driver remove
    
    Some MHI device drivers need to stop the channels in their driver
    remove callback (e.g. module unloading), but the unprepare function
    is aborted because MHI core moved the channels to suspended state
    prior calling driver remove callback. This prevents the driver to
    send a proper MHI RESET CHAN command to the device. Device is then
    unaware of the stopped state of these channels.
    
    This causes issue when driver tries to start the channels again (e.g.
    module is reloaded), since device considers channels as already
    started (inconsistent state).
    
    Fix this by allowing channel reset when channel is suspended.
    
    Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
    Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
    Reviewed-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
    Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
