Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94AE920FC0D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2020 20:46:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726613AbgF3Sqc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Jun 2020 14:46:32 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:21073 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726596AbgF3Sqa (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Jun 2020 14:46:30 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1593542789; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=JVp6ztFmSfBp/89cC0q1xOFq2wmVMRIfciNQmdrjxII=; b=NNccMzfC1PycIpYTcBSmeTDkuf640mMiTOiONBzsAeG2+chkoCa3wMGWI9o0bdnT1PZRFlbp
 OCmnVGAq2dScXurnvTDQjshkGKkG4tR4ESL9tUzVwRIRuaElfoFtyOVD9YLnAmhgGflucxqW
 L2Tdd1Psg+yh+G/3zOD27DyUQl4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 5efb88783a8a8b20b82641da (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 30 Jun 2020 18:46:16
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id DF39DC433CA; Tue, 30 Jun 2020 18:46:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from linuxdisplay-lab-04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tanmay)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 263F0C433C8;
        Tue, 30 Jun 2020 18:46:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 263F0C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=tanmay@codeaurora.org
From:   Tanmay Shah <tanmay@codeaurora.org>
To:     robh+dt@kernel.org, swboyd@chromium.org, sam@ravnborg.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, seanpaul@chromium.org,
        robdclark@gmail.com, daniel@ffwll.ch, airlied@linux.ie,
        aravindh@codeaurora.org, abhinavk@codeaurora.org,
        chandanu@codeaurora.org, varar@codeaurora.org,
        Tanmay Shah <tanmay@codeaurora.org>
Subject: [PATCH v8 0/6] Add support for DisplayPort driver on SnapDragon
Date:   Tue, 30 Jun 2020 11:45:01 -0700
Message-Id: <20200630184507.15589-1-tanmay@codeaurora.org>
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

Changes in v7:

- Modify cover letter description and fix title.
- Introduce dp-controller.yaml for common bindings across SOC
- Rename dp-sc7180.yaml to dp-controller-sc7180.yaml for SC7180 bindings
- Rename compatible string to qcom,sc7180-dp
- Add assigned-clocks and assigned-clock-parents properties in bindings
- Remove redundant code from driver
- Extend series to include HPD detection logic

Changes in v8:

- Add MDSS AHB clock in bindings 
- Replace mode->vrefresh use with drm_mode_vrefresh API
- Remove redundant aux config code from parser and aux module
- Assign default max lanes if data-lanes property is not available
- Fix use-after-free during DP driver remove
- Unregister hardware clocks during driver cleanup

This series depends-on:
	https://patchwork.freedesktop.org/patch/366159/
	https://patchwork.freedesktop.org/patch/369859/

Chandan Uddaraju (4):
  dt-bindings: msm/dp: add bindings of DP/DP-PLL driver for Snapdragon
  drm: add constant N value in helper file
  drm/msm/dp: add displayPort driver support
  drm/msm/dp: add support for DP PLL driver

Jeykumar Sankaran (1):
  drm/msm/dpu: add display port support in DPU

Tanmay Shah (1):
  drm/msm/dp: Add Display Port HPD feature

 .../display/msm/dp-controller-sc7180.yaml     |  144 ++
 .../bindings/display/msm/dp-controller.yaml   |   61 +
 .../bindings/display/msm/dpu-sc7180.yaml      |   11 +
 drivers/gpu/drm/i915/display/intel_display.c  |    2 +-
 drivers/gpu/drm/msm/Kconfig                   |   16 +
 drivers/gpu/drm/msm/Makefile                  |   14 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |   29 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |    8 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   83 +-
 drivers/gpu/drm/msm/dp/dp_aux.c               |  510 +++++
 drivers/gpu/drm/msm/dp/dp_aux.h               |   29 +
 drivers/gpu/drm/msm/dp/dp_catalog.c           | 1060 ++++++++++
 drivers/gpu/drm/msm/dp/dp_catalog.h           |  104 +
 drivers/gpu/drm/msm/dp/dp_ctrl.c              | 1707 +++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_ctrl.h              |   35 +
 drivers/gpu/drm/msm/dp/dp_display.c           | 1017 ++++++++++
 drivers/gpu/drm/msm/dp/dp_display.h           |   31 +
 drivers/gpu/drm/msm/dp/dp_drm.c               |  168 ++
 drivers/gpu/drm/msm/dp/dp_drm.h               |   18 +
 drivers/gpu/drm/msm/dp/dp_hpd.c               |   69 +
 drivers/gpu/drm/msm/dp/dp_hpd.h               |   79 +
 drivers/gpu/drm/msm/dp/dp_link.c              | 1216 ++++++++++++
 drivers/gpu/drm/msm/dp/dp_link.h              |  132 ++
 drivers/gpu/drm/msm/dp/dp_panel.c             |  490 +++++
 drivers/gpu/drm/msm/dp/dp_panel.h             |   95 +
 drivers/gpu/drm/msm/dp/dp_parser.c            |  267 +++
 drivers/gpu/drm/msm/dp/dp_parser.h            |  138 ++
 drivers/gpu/drm/msm/dp/dp_pll.c               |   99 +
 drivers/gpu/drm/msm/dp/dp_pll.h               |   61 +
 drivers/gpu/drm/msm/dp/dp_pll_10nm.c          |  917 +++++++++
 drivers/gpu/drm/msm/dp/dp_pll_private.h       |  111 ++
 drivers/gpu/drm/msm/dp/dp_power.c             |  392 ++++
 drivers/gpu/drm/msm/dp/dp_power.h             |  103 +
 drivers/gpu/drm/msm/dp/dp_reg.h               |  517 +++++
 drivers/gpu/drm/msm/msm_drv.c                 |    2 +
 drivers/gpu/drm/msm/msm_drv.h                 |   59 +-
 include/drm/drm_dp_helper.h                   |    1 +
 37 files changed, 9776 insertions(+), 19 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/dp-controller-sc7180.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/dp-controller.yaml
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


base-commit: 0a19b068acc47d05212f03e494381926dc0381e2
prerequisite-patch-id: 8058026a54241aa728a91dd1685419afb249959e
prerequisite-patch-id: ed730eb83f84501579332a0f0ab98f7ef649e868
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

