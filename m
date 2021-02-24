Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EEBA323A3B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Feb 2021 11:12:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234847AbhBXKLs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Feb 2021 05:11:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234736AbhBXKLb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Feb 2021 05:11:31 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CA33C06178B
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Feb 2021 02:10:50 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id u14so1310647wri.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Feb 2021 02:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=kbJk7tq43BRyWvJinE05TJ4mSI+ELnADk05hlGwtqSg=;
        b=f6wzAN4Uqe457G6MdkYs7Zq5JVpUfKDTVQajk16YBxrEZJDuj0sjoQMRskfrsm7g6g
         r3Ypv5vDdlju0sd1+o02h3TOkp0LjyOphX9A7caA7R97gesU5JvVnsLkv48Gg13RN3Uu
         xY0RhN+YmVD/23gGgz2F5H6axShNQccBSq+whPs8oV7buop2S2KCKAdJUtRPOb+o//AU
         G1EtfMXniIGUvACwV7TKoD25FNi4dfMFA0o51fjtQ5I6Kdw8VzH0ugZqh+XfQkrbjNGD
         vkXeBOk/M9ie9gZNNKpkpOMp7NYBp2gETkDlRGmP36koUiI8fyPoVT8Ze9uarAXTgouq
         UdiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=kbJk7tq43BRyWvJinE05TJ4mSI+ELnADk05hlGwtqSg=;
        b=Jo3Nq+dcHt8U8BzZ/1Ob0BFBnwiFbVYwc6y1iHN5CkwN4+TJVqBkAVekJR70bIBUsR
         qjgX+s94Wq4KZ6n58V22tn5syjMjK4IHklEu8sSnc7Y6nOrUi1a+1r06TW4DrvFigW0N
         /F0cpRrtN/NOy+o1LGQv8T/QtS0xT9allBNtffTH24H8ogSweWiQSv7lSD/ZCsd8p4Gy
         xLHN05RLEvGKrgppDK+qiwb050xMtTHmFPZad2IPtfyDpp5r8CdW4kVbtlIHiwgBzOtc
         N5W05ljS2mcup5eZdq8BqDjc0Kl2wOiuvjsNIJp29CMM6kGRjYEi4mEB1WBuPk1f7LUo
         C76w==
X-Gm-Message-State: AOAM5315CsyKqi0IqTaiNQydIHwDQQEvrX5sWwyumGAfodcTiDJEZoDn
        6M5nsywn+2yvxt9rKWp03pWG4/fPOLkvKBEK
X-Google-Smtp-Source: ABdhPJx4j4if8mWmGRr5W2kP5GRHlzlHhBff29G0Iio18nYmbA3sQCputHpC6mYhyjHPIBsZ1O8ZzA==
X-Received: by 2002:adf:b611:: with SMTP id f17mr30068282wre.8.1614161449346;
        Wed, 24 Feb 2021 02:10:49 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:82c:5f0:80e4:8084:68e5:90f])
        by smtp.gmail.com with ESMTPSA id 4sm3454728wrr.27.2021.02.24.02.10.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 24 Feb 2021 02:10:48 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, bbhatt@codeaurora.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH] mhi: pci_generic: Remove WQ_MEM_RECLAIM flag from state workqueue
Date:   Wed, 24 Feb 2021 11:18:50 +0100
Message-Id: <1614161930-8513-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

A recent change created a dedicated workqueue for the state-change work
with WQ_HIGHPRI (no strong reason for that) and WQ_MEM_RECLAIM flags,
but the state-change work (mhi_pm_st_worker) does not guarantee forward
progress under memory pressure, and will even wait on various memory
allocations when e.g. creating devices, loading firmware, etc... The
work is then not part of a memory reclaim path...

Moreover, this causes a warning in check_flush_dependency() since we end
up in code that flushes a non-reclaim workqueue:

[   40.969601] workqueue: WQ_MEM_RECLAIM mhi_hiprio_wq:mhi_pm_st_worker [mhi] is flushing !WQ_MEM_RECLAIM events_highpri:flush_backlog
[   40.969612] WARNING: CPU: 4 PID: 158 at kernel/workqueue.c:2607 check_flush_dependency+0x11c/0x140
[   40.969733] Call Trace:
[   40.969740]  __flush_work+0x97/0x1d0
[   40.969745]  ? wake_up_process+0x15/0x20
[   40.969749]  ? insert_work+0x70/0x80
[   40.969750]  ? __queue_work+0x14a/0x3e0
[   40.969753]  flush_work+0x10/0x20
[   40.969756]  rollback_registered_many+0x1c9/0x510
[   40.969759]  unregister_netdevice_queue+0x94/0x120
[   40.969761]  unregister_netdev+0x1d/0x30
[   40.969765]  mhi_net_remove+0x1a/0x40 [mhi_net]
[   40.969770]  mhi_driver_remove+0x124/0x250 [mhi]
[   40.969776]  device_release_driver_internal+0xf0/0x1d0
[   40.969778]  device_release_driver+0x12/0x20
[   40.969782]  bus_remove_device+0xe1/0x150
[   40.969786]  device_del+0x17b/0x3e0
[   40.969791]  mhi_destroy_device+0x9a/0x100 [mhi]
[   40.969796]  ? mhi_unmap_single_use_bb+0x50/0x50 [mhi]
[   40.969799]  device_for_each_child+0x5e/0xa0
[   40.969804]  mhi_pm_st_worker+0x921/0xf50 [mhi]

Fixes: 8f7039787687 ("bus: mhi: core: Move to using high priority workqueue")
Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/bus/mhi/core/init.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index 32eb90f..03ddd6e 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -890,8 +890,7 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
 	INIT_WORK(&mhi_cntrl->st_worker, mhi_pm_st_worker);
 	init_waitqueue_head(&mhi_cntrl->state_event);
 
-	mhi_cntrl->hiprio_wq = alloc_ordered_workqueue
-				("mhi_hiprio_wq", WQ_MEM_RECLAIM | WQ_HIGHPRI);
+	mhi_cntrl->hiprio_wq = alloc_ordered_workqueue("mhi_hiprio_wq", WQ_HIGHPRI);
 	if (!mhi_cntrl->hiprio_wq) {
 		dev_err(mhi_cntrl->cntrl_dev, "Failed to allocate workqueue\n");
 		ret = -ENOMEM;
-- 
2.7.4

