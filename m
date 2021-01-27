Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1FC330516A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Jan 2021 05:49:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232974AbhA0Eo6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Jan 2021 23:44:58 -0500
Received: from labrats.qualcomm.com ([199.106.110.90]:48333 "EHLO
        labrats.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238236AbhA0EJ2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Jan 2021 23:09:28 -0500
IronPort-SDR: P3r96C4snBGTzGnv6Brv1PLENwoP0HaSpZgU3qP++ho5Gz9p476W5rVVvvlqjXjOVepDwZpMim
 fDbCs8WPwPQw9lLPkcdQkjySunkO9rLfUPr3k8epfWCKpiWV5JR4Gk8F4zN44gd5YwFK6/hOXg
 2oEPI36Z81HYUXQsBq5l2ssVZF9KpjXdQrKlham5y7zvbXIV+ttOYCrlxxqkiZfNJ0XC2E6EIN
 4vemxJgNxL27dyEvfVnWhuGtpvFMjSoZI4iDG+qesn5uoFx8r9fk3HO0Z0MR08gbvW5FRybhJz
 C6I=
X-IronPort-AV: E=Sophos;i="5.79,378,1602572400"; 
   d="scan'208";a="47711301"
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by labrats.qualcomm.com with ESMTP; 26 Jan 2021 20:00:42 -0800
X-QCInternal: smtphost
Received: from wsp769891wss.qualcomm.com (HELO stor-presley.qualcomm.com) ([192.168.140.85])
  by ironmsg03-sd.qualcomm.com with ESMTP; 26 Jan 2021 20:00:26 -0800
Received: by stor-presley.qualcomm.com (Postfix, from userid 92687)
        id 2616321901; Tue, 26 Jan 2021 20:00:26 -0800 (PST)
From:   Asutosh Das <asutoshd@codeaurora.org>
To:     cang@codeaurora.org, martin.petersen@oracle.com,
        linux-scsi@vger.kernel.org
Cc:     Asutosh Das <asutoshd@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, stern@rowland.harvard.edu
Subject: [RFC PATCH v1 0/2] Fix deadlock in ufs 
Date:   Tue, 26 Jan 2021 20:00:21 -0800
Message-Id: <cover.1611719814.git.asutoshd@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

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

