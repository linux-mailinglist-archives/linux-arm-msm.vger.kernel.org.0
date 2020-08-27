Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21C73255068
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Aug 2020 23:17:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726706AbgH0VRU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Aug 2020 17:17:20 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:18950 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726120AbgH0VRT (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Aug 2020 17:17:19 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1598563037; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=DsmXnN/MuGNri8lOWzauI1ZvsawKQMh8iP5bdecIJRc=; b=CjaNdl1OrGnRg4D5zaKIBcIEN6+7Qo2djCnrG0m7TT2yphnqKj0ErahCG3L7zdQWrzPz/1F7
 AOhSS47AcnAm2fKnRAIPkG5pjQAZDADZ/sCzh17j2gkyq6UH+9gosdzA8SbE8bWZYgG6dFva
 sSGN8hhWvp0Ec1vF5yXqL3LvrJs=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5f4822dd2fd6d21f0a1e52b9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 27 Aug 2020 21:17:17
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id AD671C433CA; Thu, 27 Aug 2020 21:17:16 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from linuxdisplay-lab-04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tanmay)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2D168C433CA;
        Thu, 27 Aug 2020 21:17:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2D168C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=tanmay@codeaurora.org
From:   Tanmay Shah <tanmay@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Cc:     swboyd@chromium.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, seanpaul@chromium.org,
        robdclark@gmail.com, daniel@ffwll.ch, airlied@linux.ie,
        aravindh@codeaurora.org, abhinavk@codeaurora.org,
        khsieh@codeaurora.org, Tanmay Shah <tanmay@codeaurora.org>
Subject: [PATCH v12 0/5] Add support for DisplayPort driver on SnapDragon
Date:   Thu, 27 Aug 2020 14:16:53 -0700
Message-Id: <20200827211658.27479-1-tanmay@codeaurora.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

These patches add Display-Port driver on SnapDragon/msm hardware.
This series also contains device-tree bindings for msm DP driver.
It also contains Makefile and Kconfig changes to compile msm DP driver.

The block diagram of DP driver is shown below:


                 +-------------+
                 |DRM FRAMEWORK|
                 +------+------+
                        |
                   +----v----+
                   | DP DRM  |
                   +----+----+
                        |
                   +----v----+
     +------------+|   DP    +----------++------+
     +        +---+| DISPLAY |+---+      |      |
     |        +    +-+-----+-+    |      |      |
     |        |      |     |      |      |      |
     |        |      |     |      |      |      |
     |        |      |     |      |      |      |
     v        v      v     v      v      v      v
 +------+ +------+ +---+ +----+ +----+ +---+ +-----+
 |  DP  | |  DP  | |DP | | DP | | DP | |DP | | DP  |
 |PARSER| | HPD  | |AUX| |LINK| |CTRL| |PHY| |POWER|
 +--+---+ +---+--+ +---+ +----+ +--+-+ +-+-+ +-----+
    |                              |     |
 +--v---+                         +v-----v+
 |DEVICE|                         |  DP   |
 | TREE |                         |CATALOG|
 +------+                         +---+---+
                                      |
                                  +---v----+
                                  |CTRL/PHY|
                                  |   HW   |
                                  +--------+

Changes in v12:

-- Add support of pm ops in display port driver
-- Clear bpp depth bits before writing to MISC register
-- Fix edid read

Previous change log:
https://lkml.kernel.org/lkml/20200818051137.21478-1-tanmay@codeaurora.org/

Chandan Uddaraju (4):
  dt-bindings: msm/dp: add bindings of DP/DP-PLL driver for Snapdragon
  drm: add constant N value in helper file
  drm/msm/dp: add displayPort driver support
  drm/msm/dp: add support for DP PLL driver

Jeykumar Sankaran (1):
  drm/msm/dpu: add display port support in DPU

Tanmay Shah (1):
  drm/msm/dp: Add Display Port HPD feature

 drivers/gpu/drm/i915/display/intel_display.c  |    2 +-
 drivers/gpu/drm/msm/Kconfig                   |    9 +
 drivers/gpu/drm/msm/Makefile                  |   14 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |   27 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |    8 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   83 +-
 drivers/gpu/drm/msm/dp/dp_aux.c               |  535 ++++++
 drivers/gpu/drm/msm/dp/dp_aux.h               |   30 +
 drivers/gpu/drm/msm/dp/dp_catalog.c           | 1045 ++++++++++
 drivers/gpu/drm/msm/dp/dp_catalog.h           |  105 +
 drivers/gpu/drm/msm/dp/dp_ctrl.c              | 1693 +++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_ctrl.h              |   35 +
 drivers/gpu/drm/msm/dp/dp_display.c           | 1046 ++++++++++
 drivers/gpu/drm/msm/dp/dp_display.h           |   31 +
 drivers/gpu/drm/msm/dp/dp_drm.c               |  168 ++
 drivers/gpu/drm/msm/dp/dp_drm.h               |   18 +
 drivers/gpu/drm/msm/dp/dp_hpd.c               |   69 +
 drivers/gpu/drm/msm/dp/dp_hpd.h               |   79 +
 drivers/gpu/drm/msm/dp/dp_link.c              | 1214 ++++++++++++
 drivers/gpu/drm/msm/dp/dp_link.h              |  132 ++
 drivers/gpu/drm/msm/dp/dp_panel.c             |  486 +++++
 drivers/gpu/drm/msm/dp/dp_panel.h             |   95 +
 drivers/gpu/drm/msm/dp/dp_parser.c            |  267 +++
 drivers/gpu/drm/msm/dp/dp_parser.h            |  138 ++
 drivers/gpu/drm/msm/dp/dp_pll.c               |   99 +
 drivers/gpu/drm/msm/dp/dp_pll.h               |   61 +
 drivers/gpu/drm/msm/dp/dp_pll_10nm.c          |  930 +++++++++
 drivers/gpu/drm/msm/dp/dp_pll_private.h       |   89 +
 drivers/gpu/drm/msm/dp/dp_power.c             |  373 ++++
 drivers/gpu/drm/msm/dp/dp_power.h             |  103 +
 drivers/gpu/drm/msm/dp/dp_reg.h               |  518 +++++
 drivers/gpu/drm/msm/msm_drv.c                 |    2 +
 drivers/gpu/drm/msm/msm_drv.h                 |   59 +-
 include/drm/drm_dp_helper.h                   |    1 +
 34 files changed, 9545 insertions(+), 19 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/dp/dp_aux.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_aux.h
 create mode 100644 drivers/gpu/drm/msm/dp/dp_catalog.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_catalog.h
 create mode 100644 drivers/gpu/drm/msm/dp/dp_ctrl.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_ctrl.h
 create mode 100644 drivers/gpu/drm/msm/dp/dp_display.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_display.h
 create mode 100644 drivers/gpu/drm/msm/dp/dp_drm.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_drm.h
 create mode 100644 drivers/gpu/drm/msm/dp/dp_hpd.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_hpd.h
 create mode 100644 drivers/gpu/drm/msm/dp/dp_link.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_link.h
 create mode 100644 drivers/gpu/drm/msm/dp/dp_panel.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_panel.h
 create mode 100644 drivers/gpu/drm/msm/dp/dp_parser.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_parser.h
 create mode 100644 drivers/gpu/drm/msm/dp/dp_pll.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_pll.h
 create mode 100644 drivers/gpu/drm/msm/dp/dp_pll_10nm.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_pll_private.h
 create mode 100644 drivers/gpu/drm/msm/dp/dp_power.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_power.h
 create mode 100644 drivers/gpu/drm/msm/dp/dp_reg.h


base-commit: d012a7190fc1fd72ed48911e77ca97ba4521bccd
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

