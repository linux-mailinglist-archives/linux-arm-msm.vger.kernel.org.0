Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76BD029FA5A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Oct 2020 02:12:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726062AbgJ3BMV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Oct 2020 21:12:21 -0400
Received: from z5.mailgun.us ([104.130.96.5]:16138 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725372AbgJ3BMV (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Oct 2020 21:12:21 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1604020340; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=eoV4yNocHGOAoHLt6TuaLMWo9H8LkOELXFUMpaOGpeM=; b=oP898gtZs5kYj/GBp34AOdGAcEQPcG9zO5mG0Fv2y2IUpbp2/RuyEf2mFqVp9yqJ7vs/N7qe
 4QzRYt8HvqdwOBc77s8V7bbujXuo3BIuNOvqs3Wb6Mvva173rgebImcJklymIyUzFweu+nKs
 7lCFGEx5XlmJ9rk68m11TVtoGkc=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5f9b65d5fc3d7f56d0bd11cf (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 30 Oct 2020 01:01:09
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7527AC433FE; Fri, 30 Oct 2020 01:01:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from abhinavk-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 63B34C433C8;
        Fri, 30 Oct 2020 01:01:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 63B34C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=abhinavk@codeaurora.org
From:   Abhinav Kumar <abhinavk@codeaurora.org>
To:     dri-devel@lists.freedesktop.org
Cc:     Abhinav Kumar <abhinavk@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
        nganji@codeaurora.org, aravindh@codeaurora.org,
        tanmay@codeaurora.org, khsieh@codeaurora.org, daniel@ffwll.ch
Subject: [PATCH v2 0/4] Add devcoredump support for DPU
Date:   Thu, 29 Oct 2020 18:00:57 -0700
Message-Id: <20201030010101.4345-1-abhinavk@codeaurora.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series adds support to use devcoredump for DPU driver. It introduces
the dpu_dbg module which assists in the capturing of register dumps during
error scenarios. When a display related error happens, the dpu_dbg module
captures all the relevant register dumps along with the snapshot of the drm
atomic state and triggers a devcoredump.

changes in v2:
 - Fix kbot errors
 - Rename drm_atomic_print_state function and add kernel doc for it
 - Fix multiple dsi registration issue with dpu_dbg

Abhinav Kumar (4):
  drm: allow drm_atomic_print_state() to accept any drm_printer
  drm/msm/dpu: add support to dump dpu registers
  drm/msm: register the base address with dpu_dbg module
  drm/msm/dpu: add dpu_dbg points across dpu driver

 drivers/gpu/drm/drm_atomic.c                  |  29 +-
 drivers/gpu/drm/drm_atomic_uapi.c             |   4 +-
 drivers/gpu/drm/drm_crtc_internal.h           |   4 +-
 drivers/gpu/drm/msm/Makefile                  |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_dbg.c       | 316 ++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_dbg.h       | 273 +++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_dbg_util.c  | 314 +++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  12 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  |   5 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |   5 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c    |   6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c   |   7 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c   |   5 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c   |   6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   |   8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c    |   7 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |   4 +-
 drivers/gpu/drm/msm/dp/dp_catalog.c           |  12 +
 drivers/gpu/drm/msm/dp/dp_catalog.h           |   4 +
 drivers/gpu/drm/msm/dp/dp_display.c           |   2 +
 drivers/gpu/drm/msm/dsi/dsi.c                 |   1 +
 drivers/gpu/drm/msm/dsi/dsi.h                 |   1 +
 drivers/gpu/drm/msm/dsi/dsi_host.c            |  15 +-
 drivers/gpu/drm/msm/msm_drv.c                 |  30 +-
 drivers/gpu/drm/msm/msm_drv.h                 |   3 +-
 .../gpu/drm/selftests/test-drm_framebuffer.c  |   1 +
 28 files changed, 1066 insertions(+), 26 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_dbg.c
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_dbg.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_dbg_util.c

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

