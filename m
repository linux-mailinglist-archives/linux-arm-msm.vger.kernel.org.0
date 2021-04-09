Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53C9C3591F9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Apr 2021 04:28:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232770AbhDIC3F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Apr 2021 22:29:05 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:58023 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232616AbhDIC3F (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Apr 2021 22:29:05 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1617935333; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=eC7W0m1KmzQZ5WyLiYa0BIRlhpzjt5ATSFHCAg3dHH8=; b=SQowG2WVHbyKRxOUUYzNvmljPyuXWCLTRMXe1wr9DXxmRMqWU3XtySBnMZvAxtWLrkItE5KC
 azn+7TrllbknCfu+6DTQIbxsatG2mE1HWhgd8f5Hrf5p9CSA3lirKIvGPpqnzJLMT0cVGrPI
 LRaPM2P+DaB73C+/RmtpTTYrpXs=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 606fbbdd74f773a664116579 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 09 Apr 2021 02:28:45
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 99DDFC43464; Fri,  9 Apr 2021 02:28:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from abhinavk-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6AA2AC433C6;
        Fri,  9 Apr 2021 02:28:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6AA2AC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=abhinavk@codeaurora.org
From:   Abhinav Kumar <abhinavk@codeaurora.org>
To:     dri-devel@lists.freedesktop.org
Cc:     Abhinav Kumar <abhinavk@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
        nganji@codeaurora.org, aravindh@codeaurora.org,
        khsieh@codeaurora.org, daniel@ffwll.ch
Subject: [PATCH v3 0/3] Add devcoredump support for DPU
Date:   Thu,  8 Apr 2021 19:28:34 -0700
Message-Id: <1617935317-15571-1-git-send-email-abhinavk@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series adds support to use devcoredump for DPU driver. It introduces
the dpu_dbg module which assists in the capturing of register dumps during
error scenarios. When a display related error happens, the dpu_dbg module
captures all the relevant register dumps along with the snapshot of the drm
atomic state and triggers a devcoredump.

changes in v3:
 - Get rid of registration mechanism for sub-modules and instead get
   this information from the dpu catalog itself
 - Get rid of global dpu_dbg struct and instead store it in dpu_kms
 - delegate the power management of the sub-modules to the resp drivers
 - refactor and remove the linked list logic and simplify it to have
   just an array


Abhinav Kumar (3):
  drm: allow drm_atomic_print_state() to accept any drm_printer
  drm/msm/dpu: add support to dump dpu registers
  drm/msm/dpu: add dpu_dbg points across dpu driver

 drivers/gpu/drm/drm_atomic.c                       |  28 ++-
 drivers/gpu/drm/drm_atomic_uapi.c                  |   4 +-
 drivers/gpu/drm/drm_crtc_internal.h                |   4 +-
 drivers/gpu/drm/msm/Makefile                       |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_dbg.c            | 221 ++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_dbg.h            | 200 ++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_dbg_util.c       | 257 +++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  18 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |  14 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |   8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  86 +++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |   5 +
 drivers/gpu/drm/msm/dp/dp_catalog.c                |  10 +
 drivers/gpu/drm/msm/dp/dp_catalog.h                |   5 +
 drivers/gpu/drm/msm/dp/dp_display.c                |  37 +++
 drivers/gpu/drm/msm/dp/dp_display.h                |   1 +
 drivers/gpu/drm/msm/dsi/dsi.c                      |   5 +
 drivers/gpu/drm/msm/dsi/dsi.h                      |   4 +
 drivers/gpu/drm/msm/dsi/dsi_host.c                 |  25 ++
 drivers/gpu/drm/msm/msm_drv.c                      |  29 ++-
 drivers/gpu/drm/msm/msm_drv.h                      |   2 +
 drivers/gpu/drm/selftests/test-drm_framebuffer.c   |   1 +
 23 files changed, 950 insertions(+), 18 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_dbg.c
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_dbg.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_dbg_util.c

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

