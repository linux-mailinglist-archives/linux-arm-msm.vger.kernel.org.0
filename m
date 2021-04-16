Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51EBE3629AD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Apr 2021 22:57:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242924AbhDPU6D (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Apr 2021 16:58:03 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:56947 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234312AbhDPU6C (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Apr 2021 16:58:02 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1618606657; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=GCfFzX1kUe6vn7VTgr+YdeFG/no1qsZaCVnZ9Z2+7jA=; b=etQ9VnOkwJ2dquqqQO79+moRJ+Zme1xlJjHIdwC/AgfH1UAN5HcMO+ot9j1BF3q3k9ugmmXe
 cy+/UFyHzohjOcI4B/JHzjvu9/oDej9XVzpqVGr9qxN1lnsjzi+2ZZ4BW/5DhxoCgODybTfY
 GN33HiQbszsAnsXxKY3e3iuZl/o=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 6079fa3c2cbba88980c21847 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 16 Apr 2021 20:57:32
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 57E83C43466; Fri, 16 Apr 2021 20:57:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from abhinavk-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DC823C433CA;
        Fri, 16 Apr 2021 20:57:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DC823C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=abhinavk@codeaurora.org
From:   Abhinav Kumar <abhinavk@codeaurora.org>
To:     dri-devel@lists.freedesktop.org
Cc:     Abhinav Kumar <abhinavk@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
        nganji@codeaurora.org, aravindh@codeaurora.org,
        khsieh@codeaurora.org, daniel@ffwll.ch, dmitry.baryshkov@linaro.org
Subject: [PATCH v5 0/7] Add devcoredump support for DPU
Date:   Fri, 16 Apr 2021 13:57:18 -0700
Message-Id: <1618606645-19695-1-git-send-email-abhinavk@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series adds support to use devcoredump for DPU driver. It introduces
the msm_disp_snapshot module which assists in the capturing of register dumps during
error scenarios. When a display related error happens, the msm_disp_snapshot module
captures all the relevant register dumps along with the snapshot of the drm
atomic state and triggers a devcoredump.

changes in v5:
 - move the storage of disp_state from dpu_kms to msm_kms
 - absorb snprintf into the snapshot core by accepting var args
 - initialize disp snapshot module even for non-DPU targets
 - split up the patches into dpu, dsi and dp pieces for easier review
 - get rid of MSM_DISP_SNAPSHOT_IN_* macros by simplifying function


Abhinav Kumar (7):
  drm: allow drm_atomic_print_state() to accept any drm_printer
  drm/msm: add support to take dpu snapshot
  drm/msm/dsi: add API to take DSI register snapshot
  drm/msm/dp: add API to take DP register snapshot
  drm/msm/disp/dpu1: add API to take DPU register snapshot
  drm/msm: add support to take dsi, dp and dpu snapshot
  drm/msm: add disp snapshot points across dpu driver

 drivers/gpu/drm/drm_atomic.c                       |  28 ++-
 drivers/gpu/drm/drm_atomic_uapi.c                  |   4 +-
 drivers/gpu/drm/drm_crtc_internal.h                |   4 +-
 drivers/gpu/drm/msm/Makefile                       |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  16 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |  14 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |   8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  50 ++++++
 drivers/gpu/drm/msm/disp/msm_disp_snapshot.c       | 161 +++++++++++++++++
 drivers/gpu/drm/msm/disp/msm_disp_snapshot.h       | 154 ++++++++++++++++
 drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c  | 195 +++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_catalog.c                |   9 +
 drivers/gpu/drm/msm/dp/dp_catalog.h                |   4 +
 drivers/gpu/drm/msm/dp/dp_display.c                |  29 +++
 drivers/gpu/drm/msm/dp/dp_display.h                |   1 +
 drivers/gpu/drm/msm/dsi/dsi.c                      |   5 +
 drivers/gpu/drm/msm/dsi/dsi.h                      |   5 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c                 |  16 ++
 drivers/gpu/drm/msm/msm_drv.c                      |  27 ++-
 drivers/gpu/drm/msm/msm_drv.h                      |   2 +
 drivers/gpu/drm/msm/msm_kms.h                      |   7 +
 drivers/gpu/drm/selftests/test-drm_framebuffer.c   |   1 +
 23 files changed, 725 insertions(+), 19 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
 create mode 100644 drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
 create mode 100644 drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

