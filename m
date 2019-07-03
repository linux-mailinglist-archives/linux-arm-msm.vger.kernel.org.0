Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E01755DEB5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2019 09:19:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727006AbfGCHSq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Jul 2019 03:18:46 -0400
Received: from m15-111.126.com ([220.181.15.111]:37509 "EHLO m15-111.126.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726490AbfGCHSp (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Jul 2019 03:18:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=HZ4Vk
        pL6aGo6U7cksnhAK8oRn4iP7jzv9EJrkIAr4t0=; b=oA/QlhYjeEn0Z1HQw0XQ+
        huyWWaN9BkIeoWVA7RUdKJ0j1vrEAJdPSQYlqEXWSVgn07nC1zIQMJnZyTBTtUG4
        s2gE+os/XIldlOEFsALMRIlADKcS+sTi5Zv0M7LTluBUMIr0lCyAtzgMbqMBWuy7
        Zi+aA4B1HYjJU/Y+6G+ikc=
Received: from localhost.localdomain (unknown [159.226.223.206])
        by smtp1 (Coremail) with SMTP id C8mowAA3O2+wVhxd6QiWEQ--.47747S2;
        Wed, 03 Jul 2019 15:18:08 +0800 (CST)
From:   Lu Shuaibing <shuaibinglu@126.com>
To:     andy.gross@linaro.org
Cc:     david.brown@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lu Shuaibing <shuaibinglu@126.com>
Subject: [PATCH] soc: qcom: msm_bus: initialize cldata->handle field
Date:   Wed,  3 Jul 2019 15:18:06 +0800
Message-Id: <20190703071806.15896-1-shuaibinglu@126.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: C8mowAA3O2+wVhxd6QiWEQ--.47747S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3AF1kZw1UKrWkCF4UGryrCrg_yoWxWF13p3
        98X3yIkF48A3y7Aa1UCr1rXw1vyF4UCay8Ar9YqF1DArWUGwnrtw1UJF1rJr4q9FW5A3W7
        Ja4DKr48tryUJw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jxJ5OUUUUU=
X-Originating-IP: [159.226.223.206]
X-CM-SenderInfo: 5vkxtxpelqwzbx6rjloofrz/1tbi2RDmq1pD8+CQygAAsU
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The initialize cldata->handle in msm_bus_dbg_client_data() or this
field could be used uninitialized in msm_bus_dbg_rec_transaction().
KUMSAN(KernelUninitializedMemorySantizer, a new error detection tool)
reports this bug.

[  435.087052] ==================================================================
[  435.087086] BUG: KUMSAN: uninit-use in msm_bus_dbg_rec_transaction+0x7c/0x50c
[  435.087106] Read of size 8 at addr ffffffc0d1338008 by task kworker/7:0/3039
[  435.087119]
[  435.087141] CPU: 7 PID: 3039 Comm: kworker/7:0 Tainted: G    B           4.9.124-dirty #83
[  435.087157] Hardware name: Google Inc. MSM sdm670 B4 PVT v1.0 (DT)
[  435.087180] Workqueue: pm pm_runtime_work
[  435.087193] Call trace:
[  435.087213] [<ffffff900808eaa0>] dump_backtrace+0x0/0x3b4
[  435.087234] [<ffffff900808ee70>] show_stack+0x1c/0x24
[  435.087255] [<ffffff900866b52c>] dump_stack+0xb8/0xe8
[  435.087276] [<ffffff90082f1398>] kasan_report+0x2a8/0x630
[  435.087297] [<ffffff90082ef1b4>] __asan_load8+0x190/0x198
[  435.087317] [<ffffff9008817f1c>] msm_bus_dbg_rec_transaction+0x7c/0x50c
[  435.087338] [<ffffff900880bfe4>] update_bw_adhoc+0x74/0x2ec
[  435.087359] [<ffffff9008800e1c>] msm_bus_scale_update_bw+0x44/0x84
[  435.087382] [<ffffff9009469e84>] geni_se_rmv_ab_ib+0x258/0x3c0
[  435.087403] [<ffffff900946a0ac>] se_geni_clks_off+0xc0/0x160
[  435.087425] [<ffffff9008ed9878>] geni_i2c_runtime_suspend+0x40/0x84
[  435.087446] [<ffffff9008b8bee8>] pm_generic_runtime_suspend+0x58/0x8c
[  435.087467] [<ffffff9008b8f5fc>] rpm_callback+0x160/0x1bc
[  435.087488] [<ffffff9008b8f820>] rpm_suspend+0x1c8/0xa04
[  435.087507] [<ffffff9008b922b0>] pm_runtime_work+0x12c/0x148
[  435.087527] [<ffffff90080eb7d4>] process_one_work+0x288/0x830
[  435.087547] [<ffffff90080ebe1c>] worker_thread+0xa0/0x818
[  435.087566] [<ffffff90080f660c>] kthread+0x128/0x148
[  435.087585] [<ffffff9008083980>] ret_from_fork+0x10/0x50
[  435.087597]
[  435.087611] Allocated by task 1:
[  435.087631] kasan_kmalloc+0x12c/0x1e0
[  435.087649] kmem_cache_alloc_trace+0x138/0x290
[  435.087667] msm_bus_dbg_client_data+0x898/0xad4
[  435.087687] register_client_adhoc+0x5c0/0x670
[  435.087705] msm_bus_scale_register_client+0x2c/0x68
[  435.087725] arm_smmu_init_power_resources+0x43c/0x4cc
[  435.087743] qsmmuv500_tbu_probe+0x17c/0x1f0
[  435.087762] platform_drv_probe+0x7c/0x140
[  435.087781] driver_probe_device+0x170/0x710
[  435.087800] __device_attach_driver+0x10c/0x1f0
[  435.087818] bus_for_each_drv+0xbc/0x11c
[  435.087836] __device_attach+0x174/0x21c
[  435.087854] device_initial_probe+0x1c/0x24
[  435.087872] bus_probe_device+0xfc/0x10c
[  435.087889] device_add+0x718/0x990
[  435.087909] of_device_add+0x68/0x94
[  435.087928] of_platform_device_create_pdata+0xe4/0x150
[  435.087947] of_platform_bus_create+0x1f0/0x62c
[  435.087966] of_platform_populate+0x8c/0x154
[  435.087983] qsmmuv500_arch_init+0x40c/0x474
[  435.088001] arm_smmu_device_dt_probe+0x1b40/0x1ec4
[  435.088020] platform_drv_probe+0x7c/0x140
[  435.088039] driver_probe_device+0x170/0x710
[  435.088057] __driver_attach+0x1c4/0x1c8
[  435.088074] bus_for_each_dev+0xc4/0x124
[  435.088092] driver_attach+0x34/0x40
[  435.088110] bus_add_driver+0x260/0x3f4
[  435.088128] driver_register+0x108/0x214
[  435.088147] __platform_driver_register+0x84/0x90
[  435.088168] arm_smmu_init.part.60+0x4c/0x1bc
[  435.088186] arm_smmu_init+0x24/0x38
[  435.088203] do_one_initcall+0x64/0x1c0
[  435.088223] kernel_init_freeable+0x26c/0x344
[  435.088244] kernel_init+0x18/0x19c
[  435.088261] ret_from_fork+0x10/0x50
[  435.088272]
[  435.088286] Freed by task 0:
[  435.088298] (stack is not available)
[  435.088309]
[  435.088327] The buggy address belongs to the object at ffffffc0d1338000\x0a which belongs to the cache kmalloc-8192 of size 8192
[  435.088355] The buggy address is located 8 bytes inside of\x0a 8192-byte region [ffffffc0d1338000, ffffffc0d133a000)
[  435.088378] The buggy address belongs to the page:
[  435.088397] page:ffffffbf0344ce00 count:1 mapcount:0 mapping:          (null) index:0x0 compound_mapcount: 0
[  435.088420] flags: 0x4000000000004080(slab|head)
[  435.088434] page dumped because: kasan: bad access detected
[  435.088446]
[  435.088459] Memory state around the buggy address:
[  435.088479] ffffffc0d1337fe0: 20 ea 01 05 27 49 04 aa 03 ab 20 46 29 f0 7a fa
[  435.088497] ffffffc0d1337ff0: 04 98 03 9a a0 f5 fa 60 04 90 d9 f8 04 10 45 ea
[  435.088516] >ffffffc0d1338000: 18 a3 32 d1 c0 ff ff ff aa aa aa aa aa aa aa aa
[  435.088531] ________________________________________________________^__________
[  435.088549] ffffffc0d1338010: ff ff ff ff 06 00 00 00 00 00 00 00 aa aa aa aa
[  435.088568] ffffffc0d1338020: 00 d4 d3 c7 c0 ff ff ff 28 a1 33 d1 c0 ff ff ff
[  435.088580]
[  435.088593] Memory state around the buggy address:
[  435.088610] ffffffc0d1337f00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[  435.088629] ffffffc0d1337f80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[  435.088647] >ffffffc0d1338000: 00 ff 00 0f 00 00 00 ff ff ff ff ff ff ff ff ff
[  435.088662] _______________________^___________________________________________
[  435.088680] ffffffc0d1338080: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[  435.088698] ffffffc0d1338100: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[  435.088713] ==================================================================

Signed-off-by: Lu Shuaibing <shuaibinglu@126.com>
---
 drivers/soc/qcom/msm_bus/msm_bus_dbg.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/msm_bus/msm_bus_dbg.c b/drivers/soc/qcom/msm_bus/msm_bus_dbg.c
index df292336f08b..7ef82ba997f7 100644
--- a/drivers/soc/qcom/msm_bus/msm_bus_dbg.c
+++ b/drivers/soc/qcom/msm_bus/msm_bus_dbg.c
@@ -446,6 +446,7 @@ static int msm_bus_dbg_record_client(const struct msm_bus_scale_pdata *pdata,
 	cldata->clid = clid;
 	cldata->file = file;
 	cldata->size = 0;
+	cldata->handle = NULL;
 	rt_mutex_lock(&msm_bus_dbg_cllist_lock);
 	list_add_tail(&cldata->list, &cl_list);
 	rt_mutex_unlock(&msm_bus_dbg_cllist_lock);
-- 
2.19.1

