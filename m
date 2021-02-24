Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 642CC323699
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Feb 2021 06:14:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232000AbhBXFOk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Feb 2021 00:14:40 -0500
Received: from labrats.qualcomm.com ([199.106.110.90]:53087 "EHLO
        labrats.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229466AbhBXFOk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Feb 2021 00:14:40 -0500
IronPort-SDR: cRVMrvwArk4MIYvqzRgkaaNxbEsJ1YoYpUEwc2U9Zk8+hnl8ISOpAc9dkxGInbdkHhW8GasYki
 JjRtTt9td9hL5+wqiOapCKLoPfReeziWMLft8AGv2ZB6oah5WVKxiGDYbfqHbRJMf7xfXgvYwo
 Cw0kJORh8rHJrqVockS5tnx8hx8dlbFApsoFLgUaT7Bo5W15yCzXtDxQAn/ilOE9Hca+ItbToE
 NZNvafTVAdTHQzopP7mclb1Rz3KRXy3OBKkke0HsM6IKvRENc2nWu8l02JqvVN76HvoYwi1RzG
 dQw=
X-IronPort-AV: E=Sophos;i="5.81,201,1610438400"; 
   d="scan'208";a="29674152"
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
  by labrats.qualcomm.com with ESMTP; 23 Feb 2021 21:13:59 -0800
X-QCInternal: smtphost
Received: from wsp769891wss.qualcomm.com (HELO stor-presley.qualcomm.com) ([192.168.140.85])
  by ironmsg05-sd.qualcomm.com with ESMTP; 23 Feb 2021 21:13:59 -0800
Received: by stor-presley.qualcomm.com (Postfix, from userid 92687)
        id 1977D21A10; Tue, 23 Feb 2021 21:13:59 -0800 (PST)
From:   Asutosh Das <asutoshd@codeaurora.org>
To:     cang@codeaurora.org, martin.petersen@oracle.com,
        linux-scsi@vger.kernel.org
Cc:     Asutosh Das <asutoshd@codeaurora.org>,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v5 0/2] Enable power management for ufs wlun 
Date:   Tue, 23 Feb 2021 21:13:53 -0800
Message-Id: <cover.1614142928.git.asutoshd@codeaurora.org>
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

 drivers/scsi/ufs/ufs-qcom.c      |   2 +
 drivers/scsi/ufs/ufs-sysfs.c     |  26 ++-
 drivers/scsi/ufs/ufshcd-pci.c    |  24 --
 drivers/scsi/ufs/ufshcd-pltfrm.c |  29 +++
 drivers/scsi/ufs/ufshcd-pltfrm.h |   4 +
 drivers/scsi/ufs/ufshcd.c        | 491 +++++++++++++++++++++++++++++++--------
 drivers/scsi/ufs/ufshcd.h        |   5 +
 include/trace/events/ufs.h       |  20 ++
 8 files changed, 469 insertions(+), 132 deletions(-)

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

