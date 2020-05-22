Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C91F1DE78B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2020 15:02:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729344AbgEVNCJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 May 2020 09:02:09 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:47069 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729334AbgEVNCI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 May 2020 09:02:08 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1590152527; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=aZcjMzyQhmF408KAg+aRhNzpY4xzo8oNxhr6p1nbQUY=; b=xV1/xTIpd6GiytgwzC3Ns1UZXI6nMlrP67slC4FHVvZ2pUz5Aa7195kowF1wM0CEcw0xJRAB
 0zh85nb15ZMDIRK9PVyDQdFtK3//v+VSL0/88nMEUTbzHitQ2wCM3DVr7O2Ig16TnZ6S2+o0
 l1RG/sY2E7DGLx9amJHdB0uTEdg=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ec7cd47.7f12840a2c38-smtp-out-n05;
 Fri, 22 May 2020 13:01:59 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1EAC6C433CB; Fri, 22 May 2020 13:01:59 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-311.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 29C5BC433C6;
        Fri, 22 May 2020 13:01:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 29C5BC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Joerg Roedel <jroedel@suse.de>
Cc:     iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Evan Green <evgreen@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCH] iommu: Fix group refcount in iommu_alloc_default_domain()
Date:   Fri, 22 May 2020 18:31:45 +0530
Message-Id: <20200522130145.30067-1-saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Since the change to move default domain allocation to probe,
there is a refcount decrement missing for the group in
iommu_alloc_default_domain(). Because of this missing
refcount decrement, the device is never released from the
group as the devices_kobj refcount never reaches 0 in
iommu_group_remove_device() leading to a lot of issues.
One such case is that this will lead to a different group
allocation on every reload of the module which configures
iommu such as the ath10k module which then finally fails
to attach this device to the SMMU with -ENOSPC error in
__arm_smmu_alloc_bitmap() once the count of module reload
crosses the number of context banks. This will then lead
to NULL pointer deference in the next reload of the module.
Add the missing refcount decrement(iommu_group_put()) in
iommu_alloc_default_domain() to fix this issue.

Call trace:

<snip>...
  platform wifi-firmware.0: Adding to iommu group 82
  ath10k_snoc 18800000.wifi: could not attach device: -28
  platform wifi-firmware.0: Removing from iommu group 82
  ath10k_snoc 18800000.wifi: failed to initialize firmware: -28
  ath10k_snoc: probe of 18800000.wifi failed with error -28
  platform wifi-firmware.0: Adding to iommu group 83
  Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
  Mem abort info:
    ESR = 0x96000006
    EC = 0x25: DABT (current EL), IL = 32 bits
    SET = 0, FnV = 0
    EA = 0, S1PTW = 0
  Data abort info:
    ISV = 0, ISS = 0x00000006
    CM = 0, WnR = 0
  user pgtable: 4k pages, 39-bit VAs, pgdp=0000000177a53000
  [0000000000000000] pgd=00000001e74f5003, pud=00000001e74f5003, pmd=0000000000000000
  Internal error: Oops: 96000006 [#1] PREEMPT SMP
  pstate: 60400009 (nZCv daif +PAN -UAO)
  arm_smmu_flush_iotlb_all+0x20/0x6c
  iommu_create_device_direct_mappings+0x17c/0x1d8
  iommu_probe_device+0xc0/0x100
  of_iommu_configure+0x108/0x240
  of_dma_configure+0x130/0x1d0
  ath10k_fw_init+0xc4/0x1c4 [ath10k_snoc]
  ath10k_snoc_probe+0x5cc/0x678 [ath10k_snoc]
  platform_drv_probe+0x90/0xb0
  really_probe+0x134/0x2ec
  driver_probe_device+0x64/0xfc
  device_driver_attach+0x4c/0x6c
  __driver_attach+0xac/0xc0
  bus_for_each_dev+0x8c/0xd4
  driver_attach+0x2c/0x38
  bus_add_driver+0xfc/0x1d0
  driver_register+0x64/0xf8
  __platform_driver_register+0x4c/0x58
  init_module+0x20/0x1000 [ath10k_snoc]
  do_one_initcall+0x13c/0x2d0
  do_init_module+0x58/0x1dc
  load_module+0xde0/0xf10
  __arm64_sys_finit_module+0xb0/0xe0
  el0_svc_common+0xa4/0x154
  el0_svc_compat_handler+0x2c/0x38
  el0_svc_compat+0x8/0x10
 Code: d503201f f85b8268 b4000248 f8560e74 (f9400280)
 ---[ end trace e5c1470a584952a0 ]---
 Kernel panic - not syncing: Fatal exception

Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---
 drivers/iommu/iommu.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index a4c2f122eb8b..05f7b77c432f 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -1491,6 +1491,7 @@ static int iommu_alloc_default_domain(struct device *dev)
 {
 	struct iommu_group *group;
 	unsigned int type;
+	int ret;
 
 	group = iommu_group_get(dev);
 	if (!group)
@@ -1501,7 +1502,11 @@ static int iommu_alloc_default_domain(struct device *dev)
 
 	type = iommu_get_def_domain_type(dev);
 
-	return iommu_group_alloc_default_domain(dev->bus, group, type);
+	ret = iommu_group_alloc_default_domain(dev->bus, group, type);
+
+	iommu_group_put(group);
+
+	return ret;
 }
 
 /**
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
