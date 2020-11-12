Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC08F2B10F8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Nov 2020 23:05:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727214AbgKLWF0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Nov 2020 17:05:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727236AbgKLWF0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Nov 2020 17:05:26 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CF7DC0613D6
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2020 14:05:25 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id b63so2209534pfg.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2020 14:05:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=+LawQ4KJDTzVq+QOpbpG8odPiP4w40hrHWLf6v+3rmE=;
        b=htWCDbEmACJ9y+gah7nI9tft5RVJ1CtHVOlcXXga1UkmUIpP9KRR5X9vpAxLidVOJ+
         sdq/Xg+NeKMAvmba9Gtv6CViADwOh7abi/n1hb4BkHkhcwW1EiPvt/XYcOA4mAFy22Do
         mltLfXPtS/WR61qc7e1YXL/nmxRzktg/JXPxJGU8sZLF6Dt+ZGk+4w1PoRbPUP8fSlB7
         5A1/dgpbToPP4R4JXa4X3wZ0rG9+zYR+pR9EBWnVi+HD4lDfgJcZDcO2jmQ/6xTM/k8G
         +ODdG/qgThRGrXEqzbhbvVX0RAhfKg3sPxwXCos9bmxxNWNUgQd/qoyafic/F1MCBDIm
         zSlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=+LawQ4KJDTzVq+QOpbpG8odPiP4w40hrHWLf6v+3rmE=;
        b=NZ4pW96wb4qVlWqyb0Ls+Qq+DLKAzdOYW3YAyf5TljYGWFiW7Wky54jN4yAgUVWBfJ
         lxBlf3MfUR0DYJRdixQOrJPmoFdC/KATe1KOwLyeBaYHXGp37ZiQPRTPPfNZeq/xlm5t
         QFh0Ge2cB+qdFKjj1kmjgLDzdgctBh/ZzlotWIIPmTlFhdsdos4g1CvypUjiHNyTbNyt
         UD2arUkn1FzTWp3vYT+jFprsAUHPYgd9Dk5qGwY4ZhPe7DvHfPRnu6NwdiQPeMkZ2z6D
         mZBz/r+eweQnT8hAsvU2JPMB4melDGz8z0FMN4p6n1Gu/IgrRlcice7KRvLGiLfAxhki
         zYmQ==
X-Gm-Message-State: AOAM531Ah4b55uD3Avvy5b0Ddkpwkcdscl65NG1p9hfcR4Jg1auAd/3C
        62pRVuYVpVTF1H0zimTY42m/KQ==
X-Google-Smtp-Source: ABdhPJzGwfTtv0eKnetksxwmqcLkLuFLyfkWvoLi4homYAQ4vpAhKHsccreAGTDL0qxC/sv1A2nKeQ==
X-Received: by 2002:aa7:80c9:0:b029:164:4ca1:fff with SMTP id a9-20020aa780c90000b02901644ca10fffmr1432340pfn.11.1605218725223;
        Thu, 12 Nov 2020 14:05:25 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id mv5sm7638976pjb.42.2020.11.12.14.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 14:05:24 -0800 (PST)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Will Deacon <will@kernel.org>, Andy Gross <agross@kernel.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Saravana Kannan <saravanak@google.com>,
        Marc Zyngier <maz@kernel.org>,
        Lina Iyer <ilina@codeaurora.org>,
        iommu@lists.linux-foundation.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: [RESEND][PATCH 2/2] iommu: Avoid crash if iommu_group is null
Date:   Thu, 12 Nov 2020 22:05:20 +0000
Message-Id: <20201112220520.48159-2-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201112220520.48159-1-john.stultz@linaro.org>
References: <20201112220520.48159-1-john.stultz@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In trying to handle a possible driver probe ordering issue
brought up by Robin Murphy, I ran across a separate null pointer
crash in the iommu core in iommu_group_remove_device():
[    2.732803] dwc3-qcom a6f8800.usb: failed to get usb-ddr path: -517
[    2.739281] Unable to handle kernel NULL pointer dereference at virtual address 00000000000000c0
...
[    2.775619] [00000000000000c0] user address but active_mm is swapper
[    2.782039] Internal error: Oops: 96000005 [#1] PREEMPT SMP
[    2.787670] Modules linked in:
[    2.790769] CPU: 6 PID: 1 Comm: swapper/0 Tainted: G        W         5.10.0-rc1-mainline-00025-g272a618fc36-dirty #3973
[    2.801719] Hardware name: Thundercomm Dragonboard 845c (DT)
[    2.807431] pstate: 00c00005 (nzcv daif +PAN +UAO -TCO BTYPE=--)
[    2.813508] pc : iommu_group_remove_device+0x30/0x1b0
[    2.818611] lr : iommu_release_device+0x4c/0x78
[    2.823189] sp : ffffffc01005b950
...
[    2.907082] Call trace:
[    2.909566]  iommu_group_remove_device+0x30/0x1b0
[    2.914323]  iommu_release_device+0x4c/0x78
[    2.918559]  iommu_bus_notifier+0xe8/0x108
[    2.922708]  blocking_notifier_call_chain+0x78/0xb8
[    2.927641]  device_del+0x2ac/0x3d0
[    2.931177]  platform_device_del.part.9+0x20/0x98
[    2.935933]  platform_device_unregister+0x2c/0x40
[    2.940694]  of_platform_device_destroy+0xd8/0xe0
[    2.945450]  device_for_each_child_reverse+0x58/0xb0
[    2.950471]  of_platform_depopulate+0x4c/0x78
[    2.954886]  dwc3_qcom_probe+0x93c/0xcb8
[    2.958858]  platform_drv_probe+0x58/0xa8
[    2.962917]  really_probe+0xec/0x398
[    2.966531]  driver_probe_device+0x5c/0xb8
[    2.970677]  device_driver_attach+0x74/0x98
[    2.974911]  __driver_attach+0x60/0xe8
[    2.978700]  bus_for_each_dev+0x84/0xd8
[    2.982581]  driver_attach+0x30/0x40
[    2.986194]  bus_add_driver+0x160/0x208
[    2.990076]  driver_register+0x64/0x110
[    2.993957]  __platform_driver_register+0x58/0x68
[    2.998716]  dwc3_qcom_driver_init+0x20/0x28
[    3.003041]  do_one_initcall+0x6c/0x2d0
[    3.006925]  kernel_init_freeable+0x214/0x268
[    3.011339]  kernel_init+0x18/0x118
[    3.014876]  ret_from_fork+0x10/0x18
[    3.018495] Code: d0006a21 f9417295 91130021 910162b6 (b940c2a2)

In the case above, the arm-smmu driver fails to probe with
EPROBE_DEFER, and I'm guessing I'm guessing that causes
iommu_group_add_device() to fail and sets the
dev->iommu_group = NULL, then somehow we hit
iommu_group_remove_device() and trip over the null value?
I'm not really sure...

Anyway, adding the null check seems to avoid the issue and the
system boots fine after the arm-smmu driver later reprobed.

Feedback or better ideas for a solution would be appreciated!

Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Andy Gross <agross@kernel.org>
Cc: Maulik Shah <mkshah@codeaurora.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Saravana Kannan <saravanak@google.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Lina Iyer <ilina@codeaurora.org>
Cc: iommu@lists.linux-foundation.org
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 drivers/iommu/iommu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index b53446bb8c6b4..28229f7ef7d5a 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -877,6 +877,10 @@ void iommu_group_remove_device(struct device *dev)
 	struct iommu_group *group = dev->iommu_group;
 	struct group_device *tmp_device, *device = NULL;
 
+	/* Avoid crash if iommu_group value is null */
+	if (!group)
+		return;
+
 	dev_info(dev, "Removing from iommu group %d\n", group->id);
 
 	/* Pre-notify listeners that a device is being removed. */
-- 
2.17.1

