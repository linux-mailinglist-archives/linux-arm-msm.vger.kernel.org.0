Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0AEB99A79F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2019 08:35:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404458AbfHWGdB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Aug 2019 02:33:01 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:38402 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404394AbfHWGdA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Aug 2019 02:33:00 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 244F0608FF; Fri, 23 Aug 2019 06:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1566541980;
        bh=yvPPEbiA0dO2JM5eqiWWwHAyED2F4hy53lfw9rvMlI8=;
        h=From:To:Cc:Subject:Date:From;
        b=P9VVZsT/URkSpKPusCTly8oVRG3d9TG/6fumN6hrX9jNOxVYfbXZjDFtZsRYzTtgv
         emP0M6HPxUVWiFPvJ8Z27rFHBTaHti55xw4kIIswrAIgzY0UudrTgcPm3NrAEIJyXy
         x/87EUVGojb3DyUf58hTyTxume35xUMyy9N164EA=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from blr-ubuntu-41.ap.qualcomm.com (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vivek.gautam@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id EC270608FF;
        Fri, 23 Aug 2019 06:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1566541978;
        bh=yvPPEbiA0dO2JM5eqiWWwHAyED2F4hy53lfw9rvMlI8=;
        h=From:To:Cc:Subject:Date:From;
        b=fjrbc7sUIUIuysAgmzvyibBauRWbxHgy3Y/FY6IJukmgCcdPm+y2P+TdgqtoFX6o7
         ueezJLwhR2iXnlApYYEKrMr+GZFL4nUj0yTtszWLoWRyvpRDudcsyiWq/VpyAyueyG
         UMWB8zaUuOJVzADTSJfNKeEBsCXN+anEONPjWPuU=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EC270608FF
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=vivek.gautam@codeaurora.org
From:   Vivek Gautam <vivek.gautam@codeaurora.org>
To:     joro@8bytes.org, agross@kernel.org, will.deacon@arm.com,
        robin.murphy@arm.com, iommu@lists.linux-foundation.org
Cc:     bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vivek Gautam <vivek.gautam@codeaurora.org>
Subject: [PATCH v4 0/3] Qcom smmu-500 wait-for-safe handling for sdm845
Date:   Fri, 23 Aug 2019 12:02:45 +0530
Message-Id: <20190823063248.13295-1-vivek.gautam@codeaurora.org>
X-Mailer: git-send-email 2.16.1.72.g5be1f00a9a70
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Previous version of the patches are at [1]:

Qcom's implementation of smmu-500 on sdm845 adds a hardware logic called
wait-for-safe. This logic helps in meeting the invalidation requirements
from 'real-time clients', such as display and camera. This wait-for-safe
logic ensures that the invalidations happen after getting an ack from these
devices.
In this patch-series we are disabling this wait-for-safe logic from the
arm-smmu driver's probe as with this enabled the hardware tries to
throttle invalidations from 'non-real-time clients', such as USB and UFS.

For detailed information please refer to patch [3/4] in this series.
I have included the device tree patch too in this series for someone who
would like to test out this. Here's a branch [2] that gets display on MTP
SDM845 device.

This patch series is inspired from downstream work to handle under-performance
issues on real-time clients on sdm845. In downstream we add separate page table
ops to handle TLB maintenance and toggle wait-for-safe in tlb_sync call so that
achieve required performance for display and camera [3, 4].

Changes since v3:
 * Based on arm-smmu implementation cleanup series [5] by Robin Murphy which is
   already merged in Will's tree [6].
 * Implemented the sdm845 specific reset hook which does arm_smmu_device_reset()
   followed by making SCM call to disable the wait-for-safe logic.
 * Removed depedency for SCM call on any dt flag. We invariably try to disable
   the wait-for-safe logic on sdm845. The platforms such as mtp845, and db845
   that implement handlers for this particular SCM call should be able disable
   wait-for-safe logic.
   Other platforms such as cheza don't enable the wait-for-safe logic at all
   from their bootloaders. So there's no need to disable the same.
 * No change in SCM call patches 1 & 2.

Changes since v2:
 * Dropped the patch to add atomic io_read/write scm API.
 * Removed support for any separate page table ops to handle wait-for-safe.
   Currently just disabling this wait-for-safe logic from arm_smmu_device_probe()
   to achieve performance on USB/UFS on sdm845.
 * Added a device tree patch to add smmu option for fw-implemented support
   for SCM call to take care of SAFE toggling.

Changes since v1:
 * Addressed Will and Robin's comments:
    - Dropped the patch[4] that forked out __arm_smmu_tlb_inv_range_nosync(),
      and __arm_smmu_tlb_sync().
    - Cleaned up the errata patch further to use downstream polling mechanism
      for tlb sync.
 * No change in SCM call patches - patches 1 to 3.

[1] https://lore.kernel.org/patchwork/cover/1087453/
[2] https://github.com/vivekgautam1/linux/tree/v5.2-rc4/sdm845-display-working
[3] https://source.codeaurora.org/quic/la/kernel/msm-4.9/commit/drivers/iommu/arm-smmu.c?h=CogSystems-msm-49/msm-4.9&id=da765c6c75266b38191b38ef086274943f353ea7
[4] https://source.codeaurora.org/quic/la/kernel/msm-4.9/commit/drivers/iommu/arm-smmu.c?h=CogSystems-msm-49/msm-4.9&id=8696005aaaf745de68f57793c1a534a34345c30a
[5] https://patchwork.kernel.org/patch/11096265/
[6] https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/

Vivek Gautam (3):
  firmware: qcom_scm-64: Add atomic version of qcom_scm_call
  firmware/qcom_scm: Add scm call to handle smmu errata
  iommu: arm-smmu-impl: Add sdm845 implementation hook

 drivers/firmware/qcom_scm-32.c |   5 ++
 drivers/firmware/qcom_scm-64.c | 149 +++++++++++++++++++++++++++++------------
 drivers/firmware/qcom_scm.c    |   6 ++
 drivers/firmware/qcom_scm.h    |   5 ++
 drivers/iommu/arm-smmu-impl.c  |  27 +++++++-
 include/linux/qcom_scm.h       |   2 +
 6 files changed, 149 insertions(+), 45 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

