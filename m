Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC4703628E1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Apr 2021 21:49:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243072AbhDPTtx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Apr 2021 15:49:53 -0400
Received: from labrats.qualcomm.com ([199.106.110.90]:5152 "EHLO
        labrats.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239187AbhDPTtx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Apr 2021 15:49:53 -0400
IronPort-SDR: yEGHPUEBsQUrfeshkypGDcZ3MLRjnQ4C12LgtraP4KrN/CXA14X8ldsEXILpdWit7bTAPUmZCG
 aJv282gaN3RD3dXwQ2PnqWmH61b533qHD/niNXA+mQcRGqKH1Ag+WEgwpWQC7XfC702QJ1AWMO
 UUUelnT+2rHFMfL/baeOMrWnfKVZJlKf7g3LrwW5uJlluqydnWlSkd7yj8SdFZmldsZqRiLpyx
 gwo54iykIomtX1aew43a33gATq/sV/uSzN8MCdGGhu4Ps9H4sUfHMIVxTFF+Z6YdVjzRxyADvc
 vNw=
X-IronPort-AV: E=Sophos;i="5.82,228,1613462400"; 
   d="scan'208";a="29752530"
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
  by labrats.qualcomm.com with ESMTP; 16 Apr 2021 12:49:28 -0700
X-QCInternal: smtphost
Received: from wsp769891wss.qualcomm.com (HELO stor-presley.qualcomm.com) ([192.168.140.85])
  by ironmsg02-sd.qualcomm.com with ESMTP; 16 Apr 2021 12:49:28 -0700
Received: by stor-presley.qualcomm.com (Postfix, from userid 92687)
        id 34BD5213F9; Fri, 16 Apr 2021 12:49:28 -0700 (PDT)
From:   Asutosh Das <asutoshd@codeaurora.org>
To:     cang@codeaurora.org, martin.petersen@oracle.com,
        adrian.hunter@intel.com, linux-scsi@vger.kernel.org
Cc:     Asutosh Das <asutoshd@codeaurora.org>,
        linux-arm-msm@vger.kernel.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC
        support),
        linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC
        support)
Subject: [PATCH v20 0/2] Enable power management for ufs wlun 
Date:   Fri, 16 Apr 2021 12:49:24 -0700
Message-Id: <cover.1618600985.git.asutoshd@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch attempts to fix a deadlock in ufs while sending SSU.
Recently, blk_queue_enter() added a check to not process requests if the
queue is suspended. That leads to a resume of the associated device which
is suspended. In ufs, that device is ufs device wlun and it's parent is
ufs_hba. This resume tries to resume ufs device wlun which in turn tries
to resume ufs_hba, which is already in the process of suspending, thus
causing a deadlock.

This patch takes care of:
* Suspending the ufs device lun only after all other luns are suspended
* Sending SSU during ufs device wlun suspend
* Clearing uac for rpmb and ufs device wlun
* Not sending commands to the device during host suspend

v19 -> v20:
- Addressed Adrian's comments
- Addressed Bart's comments

v18 -> v19:
- Addressed Adrian's comments
- Fixed smatch warnings

v17 -> v18:
- Addressed Adrian's comments

v16 -> v17:
- Addressed Adrian's & Daejun's comments

v15 -> v16:
- Brought back the missing changes
  * Added scsi_autopm_[get/put] to ufs_debugfs[get/put]_user_access()
  * Fix ufshcd_wl_poweroff()

v14 -> v15:
- Rebased on 5.13/scsi-staging

v13 -> v14:
- Addressed Adrian's comments
  * Rebased it on top of scsi-next
  * Added scsi_autopm_[get/put] to ufs_debugfs[get/put]_user_access()
  * Resume the device in ufshcd_remove()
  * Unregister ufs_rpmb_wlun before ufs_dev_wlun
  * hba->shutting_down moved to ufshcd_wl_shutdown()

v12 -> v13:
- Addressed Adrian's comments
  * Paired pm_runtime_get_noresume() with pm_runtime_put()
  * no rpm_autosuspend for ufs device wlun
  * Moved runtime-pm init functionality to ufshcd_wl_probe()
- Addressed Bart's comments
  * Expanded abbrevs in commit message

v11 -> v12:
- Addressed Adrian's comments
  * Fixed ahit for Mediatek driver
  * Fixed error handling in ufshcd_core_init()
  * Tested this patch and the issue is still seen.

v10 -> v11:
- Fixed supplier suspending before consumer race
- Addressed Adrian's comments
  * Added proper resume/suspend cb to ufshcd_auto_hibern8_update()
  * Cosmetic changes to ufshcd-pci.c
  * Cleaned up ufshcd_system_suspend()
  * Added ufshcd_debugfs_eh_exit to ufshcd_core_init()

v9 -> v10:
- Addressed Adrian's comments
  * Moved suspend/resume vops to __ufshcd_wl_[suspend/resume]()
  * Added correct resume in ufs_bsg

v8 -> v9:
- Addressed Adrian's comments
  * Moved link transition to __ufshcd_wl_[suspend/resume]()
  * Fixed the other minor comments

v7 -> v8:
- Addressed Adrian's comments
  * Removed separate autosuspend delay for ufs-device lun
  * Fixed the ee handler getting scheduled during pm
  * Always runtime resume in suspend_prepare()
  * Added CONFIG_PM_SLEEP where needed
  
v6 -> v7:
  * Resume the ufs device before shutting it down

v5 -> v6:
- Addressed Adrian's comments
  * Added complete() cb
  * Added suspend_prepare() and complete() to all drivers
  * Moved suspend_prepare() and complete() to ufshcd
  * .poweroff() uses ufhcd_wl_poweroff()
  * Removed several forward declarations
  * Moved scsi_register_driver() to ufshcd_core_init()

v4 -> v5:
- Addressed Adrian's comments
  * Used the rpmb driver contributed by Adrian
  * Runtime-resume the ufs device during suspend to honor spm-lvl
  * Unregister the scsi_driver in ufshcd_remove()
  * Currently shutdown() puts the ufs device to power-down mode
    so, just removed ufshcd_pci_poweroff()
  * Quiesce the scsi device during shutdown instead of remove

v3 RFC -> v4:
- Addressed Bart's comments
  * Except that I didn't get any checkpatch failures
- Addressed Avri's comments
- Addressed Adrian's comments
  * Added a check for deepsleep power mode
  * Removed a couple of forward declarations
  * Didn't separate the scsi drivers because in rpmb case it just sends uac
    in resume and it seemed pretty neat to me.
- Added sysfs changes to resume the devices before accessing


Asutosh Das (2):
  scsi: ufs: Enable power management for wlun
  ufs: sysfs: Resume the proper scsi device

 drivers/scsi/ufs/cdns-pltfrm.c     |   2 +
 drivers/scsi/ufs/tc-dwc-g210-pci.c |   2 +
 drivers/scsi/ufs/ufs-debugfs.c     |   6 +-
 drivers/scsi/ufs/ufs-debugfs.h     |   2 +-
 drivers/scsi/ufs/ufs-exynos.c      |   2 +
 drivers/scsi/ufs/ufs-hisi.c        |   2 +
 drivers/scsi/ufs/ufs-mediatek.c    |  12 +-
 drivers/scsi/ufs/ufs-qcom.c        |   2 +
 drivers/scsi/ufs/ufs-sysfs.c       |  24 +-
 drivers/scsi/ufs/ufs_bsg.c         |   6 +-
 drivers/scsi/ufs/ufshcd-pci.c      |  36 +-
 drivers/scsi/ufs/ufshcd.c          | 719 ++++++++++++++++++++++++++-----------
 drivers/scsi/ufs/ufshcd.h          |  21 ++
 include/trace/events/ufs.h         |  20 ++
 14 files changed, 592 insertions(+), 264 deletions(-)

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

