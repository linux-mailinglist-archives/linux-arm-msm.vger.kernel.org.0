Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57860306B97
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Jan 2021 04:27:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229849AbhA1D1X (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Jan 2021 22:27:23 -0500
Received: from labrats.qualcomm.com ([199.106.110.90]:4012 "EHLO
        labrats.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229831AbhA1D1X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Jan 2021 22:27:23 -0500
IronPort-SDR: KDua15ydidQfEjOjrO8ttasyrVcsa0C4rykBFxQuHJe67T1OkTLEp5JuvVLJ4L24H+Uhu1cBl2
 d1nrVodD0oTBVHb/74vrWbKMp4dwiiAxUSx1NSU+bHtPy+kdtFj0qsug47KP4Fg98H9YSG7o1I
 RvwHeFIgPs9T7cCaEqeRMxKbS8ZPVlPgdgdEBdZX2TIRuEOal+cB/8V3Pnr5VwY6LS8IpMvcq7
 okfrH/EHCAvRIq7rNl1jEko37pM+v/gFU+0trxQgiwp82/1kJ7DqTpDYKNHQR54Y0XBBLZfRad
 7v4=
X-IronPort-AV: E=Sophos;i="5.79,381,1602572400"; 
   d="scan'208";a="29571241"
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by labrats.qualcomm.com with ESMTP; 27 Jan 2021 19:26:43 -0800
X-QCInternal: smtphost
Received: from wsp769891wss.qualcomm.com (HELO stor-presley.qualcomm.com) ([192.168.140.85])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP; 27 Jan 2021 19:26:42 -0800
Received: by stor-presley.qualcomm.com (Postfix, from userid 92687)
        id 60182219A2; Wed, 27 Jan 2021 19:26:42 -0800 (PST)
From:   Asutosh Das <asutoshd@codeaurora.org>
To:     cang@codeaurora.org, martin.petersen@oracle.com,
        linux-scsi@vger.kernel.org
Cc:     Asutosh Das <asutoshd@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, stern@rowland.harvard.edu
Subject: [RFC PATCH v2 0/2] Fix deadlock in ufs 
Date:   Wed, 27 Jan 2021 19:26:36 -0800
Message-Id: <cover.1611719814.git.asutoshd@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

v1 -> v2
Use pm_runtime_get/put APIs.
Assuming that all bsg devices are scsi devices may break.

This patchset attempts to fix a deadlock in ufs.
This deadlock occurs because the ufs host driver tries to resume
its child (wlun scsi device) to send SSU to it during its suspend.

Asutosh Das (2):
  block: bsg: resume scsi device before accessing
  scsi: ufs: Fix deadlock while suspending ufs host

 block/bsg.c               |  8 ++++++++
 drivers/scsi/ufs/ufshcd.c | 18 ++----------------
 2 files changed, 10 insertions(+), 16 deletions(-)

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

