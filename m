Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62CAE324522
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Feb 2021 21:24:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234741AbhBXUYa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Feb 2021 15:24:30 -0500
Received: from labrats.qualcomm.com ([199.106.110.90]:43036 "EHLO
        labrats.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234496AbhBXUYa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Feb 2021 15:24:30 -0500
IronPort-SDR: q36YWLywSEHxuLviwTlxswEXtwA9rIa6FytR93dBDK0jWFBwkTOEnLJjcYNfoKxTk1T/sW4oLs
 J1Wke3uvzWHc0crFjzoVAOpVPKexyiKHcgVGKj8xEtZINVpLY4FPLzFUoud3lJ9RBaLXDDapl9
 5/YQLRfmRvilN2zNmWoFvlpKqmoDvo5CKD6p4Bd730jkDHHDEaBtmWkOI7tH8o9kgYDYfKdKob
 s1NCgmIZQtOGhCTLzgbw5o09AQxEfD5xq67NPqOJdFAqRQ9C2TriwDBE1rH09OQWeKvGSwIAGd
 b68=
X-IronPort-AV: E=Sophos;i="5.81,203,1610438400"; 
   d="scan'208";a="47789411"
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by labrats.qualcomm.com with ESMTP; 24 Feb 2021 12:23:50 -0800
X-QCInternal: smtphost
Received: from stor-presley.qualcomm.com ([192.168.140.85])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP; 24 Feb 2021 12:23:49 -0800
Received: by stor-presley.qualcomm.com (Postfix, from userid 92687)
        id 38D3C219CE; Wed, 24 Feb 2021 12:23:49 -0800 (PST)
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
Subject: [PATCH v6 0/2] Enable power management for ufs wlun 
Date:   Wed, 24 Feb 2021 12:23:03 -0800
Message-Id: <cover.1614198015.git.asutoshd@codeaurora.org>
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
 drivers/scsi/ufs/ufs-exynos.c      |   2 +
 drivers/scsi/ufs/ufs-hisi.c        |   2 +
 drivers/scsi/ufs/ufs-mediatek.c    |   2 +
 drivers/scsi/ufs/ufs-qcom.c        |   2 +
 drivers/scsi/ufs/ufs-sysfs.c       |  26 +-
 drivers/scsi/ufs/ufshcd-pci.c      |  26 +-
 drivers/scsi/ufs/ufshcd.c          | 530 ++++++++++++++++++++++++++++++-------
 drivers/scsi/ufs/ufshcd.h          |   7 +
 include/trace/events/ufs.h         |  20 ++
 11 files changed, 489 insertions(+), 132 deletions(-)

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

