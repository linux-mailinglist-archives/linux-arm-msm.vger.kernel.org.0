Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 842322A11FC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Oct 2020 01:37:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725959AbgJaAha (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Oct 2020 20:37:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725960AbgJaAh3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Oct 2020 20:37:29 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1BDEC0613D5
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2020 17:37:27 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id g12so6540957pgm.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2020 17:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=hvoWVjH5MrvJlNL+Wpvlrvtr/qdzZEjizkDpZ+3TUPw=;
        b=bRnUkU5QJDdovKB+3Oe64UD9XdGDPdwmEL0e6homqfsQ1GrFivNaT1ceK4jr1G1+hD
         Xbxz4vWZTuO7moh7D/gW1/RgAf7UfMkBg5sT/9tzH5t5cDLLDpZNgMsiPjipAuG9JU9a
         /oJaZOVt49Hshtnxjyt3fN+2HhvC0sdg9XYHDTDLnfWn+9GFau6SbOzuehTkD9sXpeyz
         QlOOZ+vBKupPhbBvtMsR2abFGbElx1JBNuqPQLrDA9LsFD3PRpg7o6cZ3fdIr5sdZqZ0
         TkQ+0OvYEwaPH/hljQjozd5Ynr4RR/vYgr5LS3ISaJs/vgJmazLuhn6jX01hFMa3nbZm
         s4Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=hvoWVjH5MrvJlNL+Wpvlrvtr/qdzZEjizkDpZ+3TUPw=;
        b=rvxCr5xLkz8okW/HptaN7hUqTqMl0scz6p+4FdmnsOKxCXERbkBIeIQ5QMQrVoypLO
         og/CGhd4q+xfVVvq1fbsQ4tV5w/OfGeEhEPTwfFZqRoe6VbxQaSzooHswKmx8ioeNNI1
         8LMULoD74GZ1NXiRHy5YuEKWDBFKG/Y8ddtcArziCx4K+KRCsxScpNTeIawlmNEpv1Rz
         bK0e5AZ4zXL7pTrse9S/YzU/pCyIyEnqKDcFUHv/qhA/KdDKjrM9rCAkUO3cRR+/4/Il
         vucpFexWPW8d1mxr7n173UWt1q8X8E09Gqz/FlVv5L2sHp4DniOIXK+yPVPo+3mT3UZ8
         v+rQ==
X-Gm-Message-State: AOAM530g2xCq0MGgs0wM/sBvgXboTFPSzKSesHOThi6uMIj/AkUU7X/9
        FD3FjwvWv4YOtrN0tXQEVwRWXQ==
X-Google-Smtp-Source: ABdhPJxeqhaBAC7zYRx5xaemqM+o7fL8zXijASb2rLhquYgoiO/uJc+BWuRhrzTtrM6vCX+g3MXc8A==
X-Received: by 2002:aa7:9095:0:b029:164:75c4:5d15 with SMTP id i21-20020aa790950000b029016475c45d15mr11561202pfa.49.1604104647290;
        Fri, 30 Oct 2020 17:37:27 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id 3sm7011935pfv.92.2020.10.30.17.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 17:37:26 -0700 (PDT)
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
Subject: [RFC][PATCH 2/2] iommu: Avoid crash if iommu_group is null
Date:   Sat, 31 Oct 2020 00:37:21 +0000
Message-Id: <20201031003721.40973-2-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201031003721.40973-1-john.stultz@linaro.org>
References: <20201031003721.40973-1-john.stultz@linaro.org>
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
index 8c470f451a323..44639b88e77db 100644
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

