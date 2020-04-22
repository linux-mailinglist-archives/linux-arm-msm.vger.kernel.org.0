Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E72591B4F83
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2020 23:41:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726476AbgDVVl4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Apr 2020 17:41:56 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:1927 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726168AbgDVVlz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Apr 2020 17:41:55 -0400
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 22 Apr 2020 14:41:55 -0700
Received: from asutoshd-linux1.qualcomm.com ([10.46.160.39])
  by ironmsg03-sd.qualcomm.com with ESMTP; 22 Apr 2020 14:41:55 -0700
Received: by asutoshd-linux1.qualcomm.com (Postfix, from userid 92687)
        id 126BA20AA6; Wed, 22 Apr 2020 14:41:54 -0700 (PDT)
From:   Asutosh Das <asutoshd@codeaurora.org>
To:     cang@codeaurora.org, martin.petersen@oracle.com,
        Avri.Altman@wdc.com, linux-scsi@vger.kernel.org
Cc:     Asutosh Das <asutoshd@codeaurora.org>,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 0/3] WriteBooster Feature Support 
Date:   Wed, 22 Apr 2020 14:41:41 -0700
Message-Id: <cover.1586374414.git.asutoshd@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

v2 -> v3:
- Addressed Comments on refactoring
- Corrected the commit message

v1 -> v2:
- Refactor WriteBooster initialization, introduce ufshcd_wb_probe()
- Refactor ufshcd_wb_keep_vcc_on() and introduce a new function
  ufshcd_wb_presrv_usrspc_keep_vcc_on()
- Get the WriteBooster configuration by reading
  bWriteBoosterBufferPreserveUserSpaceEn

RFC -> v1:
- Added platform capability for WriteBooster 

RFC-:
v1 -> v2:
- Addressed comments on v1

- Supports shared buffer mode only

- Didn't use exception event as suggested.
  The reason being while testing I saw that the WriteBooster
  available buffer remains at 0x1 for a longer time if flush is
  enabled all the time as compared to an event-based enablement.
  This essentially means that writes go to the WriteBooster buffer
  more. Spec says that the if flush is enabled, the device would
  flush when it sees the command queue empty. So I guess that'd trigger
  flush more than an event based approach.
  Anyway the Vcc would be turned-off during system suspend, so flush
  would stop anyway.
  In this patchset, I never turn-off flush.
  Hence the RFC.

Asutosh Das (3):
  scsi: ufs: add write booster feature support
  ufs-qcom: scsi: configure write booster type
  ufs: sysfs: add sysfs entries for write booster

 drivers/scsi/ufs/ufs-qcom.c  |   8 ++
 drivers/scsi/ufs/ufs-sysfs.c |  39 ++++++-
 drivers/scsi/ufs/ufs.h       |  37 ++++++-
 drivers/scsi/ufs/ufshcd.c    | 241 ++++++++++++++++++++++++++++++++++++++++++-
 drivers/scsi/ufs/ufshcd.h    |  43 ++++++++
 5 files changed, 362 insertions(+), 6 deletions(-)

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

