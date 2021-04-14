Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D91E935FE3C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Apr 2021 01:11:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231786AbhDNXMP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Apr 2021 19:12:15 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:50599 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231859AbhDNXMN (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Apr 2021 19:12:13 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1618441911; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=fwodgzOCL8qGE9ma8LbsgVs6uWRw/97IInh7NLij6oI=; b=TyiCgOen/6mndXEYQnkJYZ17jaI5B9704J+b+5KVMcJayaou/R6NeO073csKgEJ4CVd/C4GJ
 TbEVVAevO5iLXVXOScBg6GCKhDMdIR8E+rLFm+uxWY7H45o9XVkyn3o5yY4QE0gdWvfRfqVy
 yhtsXVur8EkaJjkTPTEsVUn/Uv4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 607776b187ce1fbb5606c67c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 14 Apr 2021 23:11:45
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 52601C43464; Wed, 14 Apr 2021 23:11:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from abhinavk-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0DFDBC433C6;
        Wed, 14 Apr 2021 23:11:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0DFDBC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=abhinavk@codeaurora.org
From:   Abhinav Kumar <abhinavk@codeaurora.org>
To:     dri-devel@lists.freedesktop.org
Cc:     Abhinav Kumar <abhinavk@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
        nganji@codeaurora.org, aravindh@codeaurora.org,
        khsieh@codeaurora.org, daniel@ffwll.ch
Subject: [PATCH v4 0/3] Add devcoredump support for DPU
Date:   Wed, 14 Apr 2021 16:11:34 -0700
Message-Id: <1618441897-17123-1-git-send-email-abhinavk@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series adds support to use devcoredump for DPU driver. It introduces
the msm_disp_snapshot module which assists in the capturing of register dumps during
error scenarios. When a display related error happens, the msm_disp_snapshot module
captures all the relevant register dumps along with the snapshot of the drm
atomic state and triggers a devcoredump.

changes in v4:
 - rename dpu_dbg to msm_disp_snapshot and move it to msm/disp
 - start using a list of blocks to store the hardware block information
 - cleanup block allocation and freeing logic to simplify it

Abhinav Kumar (3):
  drm: allow drm_atomic_print_state() to accept any drm_printer
  drm/msm: add support to take dpu snapshot
  drm/msm: add disp snapshot points across dpu driver

 drivers/gpu/drm/drm_atomic.c                       |  28 +++-
 drivers/gpu/drm/drm_atomic_uapi.c                  |   4 +-
 drivers/gpu/drm/drm_crtc_internal.h                |   4 +-
 drivers/gpu/drm/msm/Makefile                       |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  18 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |  14 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |   8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  61 +++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |   5 +
 drivers/gpu/drm/msm/disp/msm_disp_snapshot.c       | 161 ++++++++++++++++++
 drivers/gpu/drm/msm/disp/msm_disp_snapshot.h       | 167 +++++++++++++++++++
 drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c  | 181 +++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_catalog.c                |  12 ++
 drivers/gpu/drm/msm/dp/dp_catalog.h                |   4 +
 drivers/gpu/drm/msm/dp/dp_display.c                |  29 ++++
 drivers/gpu/drm/msm/dp/dp_display.h                |   1 +
 drivers/gpu/drm/msm/dsi/dsi.c                      |   5 +
 drivers/gpu/drm/msm/dsi/dsi.h                      |   4 +
 drivers/gpu/drm/msm/dsi/dsi_host.c                 |  19 +++
 drivers/gpu/drm/msm/msm_drv.c                      |  29 +++-
 drivers/gpu/drm/msm/msm_drv.h                      |   2 +
 drivers/gpu/drm/selftests/test-drm_framebuffer.c   |   1 +
 23 files changed, 743 insertions(+), 18 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
 create mode 100644 drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
 create mode 100644 drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

