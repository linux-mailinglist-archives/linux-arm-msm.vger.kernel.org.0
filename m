Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6411A322284
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Feb 2021 00:06:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230024AbhBVXFs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Feb 2021 18:05:48 -0500
Received: from labrats.qualcomm.com ([199.106.110.90]:8655 "EHLO
        labrats.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229852AbhBVXFs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Feb 2021 18:05:48 -0500
IronPort-SDR: AoFooxwPHGUao4LQaHzBP9Fbc7zjypQcgH/S09/M9UyJMZGr6xW5EtHZ0GWt/0E3uwtWu7ac6M
 hH8bdCQqt/tfrzxT0Cmzz8c/pJ2sdJSY55wyHdm8GnMUevv1Ql+viEJaE+HbujrVafcI5pMDMS
 249BZCkNC/qfjbCDzDy3MCpXTM0iEIKE9s5VEEpyK55mCAaj0YWZhyFVpDJY4K8cXJ3AjSaI2S
 XyBavAxTdOCxV1Kp0rw6GFWSxqoWMKCfmTKmo4nkirYQ50mZIwWrEmg2XNPrBYL53qLlRxRT/K
 4To=
X-IronPort-AV: E=Sophos;i="5.81,198,1610438400"; 
   d="scan'208";a="47786235"
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by labrats.qualcomm.com with ESMTP; 22 Feb 2021 15:05:07 -0800
X-QCInternal: smtphost
Received: from stor-presley.qualcomm.com ([192.168.140.85])
  by ironmsg03-sd.qualcomm.com with ESMTP; 22 Feb 2021 15:05:02 -0800
Received: by stor-presley.qualcomm.com (Postfix, from userid 92687)
        id E0BA021A19; Mon, 22 Feb 2021 15:05:01 -0800 (PST)
From:   Asutosh Das <asutoshd@codeaurora.org>
To:     cang@codeaurora.org, martin.petersen@oracle.com,
        linux-scsi@vger.kernel.org
Cc:     Asutosh Das <asutoshd@codeaurora.org>,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v4 0/2] Enable power management for ufs wlun 
Date:   Mon, 22 Feb 2021 15:04:48 -0800
Message-Id: <cover.1614034213.git.asutoshd@codeaurora.org>
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

 drivers/scsi/ufs/ufs-sysfs.c |  26 +--
 drivers/scsi/ufs/ufshcd.c    | 455 ++++++++++++++++++++++++++++++++++---------
 drivers/scsi/ufs/ufshcd.h    |   4 +
 include/trace/events/ufs.h   |  20 ++
 4 files changed, 397 insertions(+), 108 deletions(-)

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

