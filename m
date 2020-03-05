Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C1F8179CA1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2020 01:11:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388553AbgCEALV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Mar 2020 19:11:21 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:34033 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388389AbgCEALU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Mar 2020 19:11:20 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1583367080; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=a2BtWZbnLlIeYls9VD32J5if+m6tMByoeITpRdRsRjs=; b=DZGtt6dTDqKysgL24E7G1/vtMB9zMyLywOLGVlPKbuxJrljHCjHM/WPSk1I227fa6dm/M5kd
 YZh9pa4o9Fx19nWpfYJjLAnLVSFPRdhQUOC7fxUV12ahr3mNFXeb4x6oVUrwNUCnHj7HiOjH
 Hlv1kNI4QqRkptfnTSbhtGaU3PY=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e60439d.7faad01007d8-smtp-out-n01;
 Thu, 05 Mar 2020 00:11:09 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CE554C4479F; Thu,  5 Mar 2020 00:11:09 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from displaysanity13-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: varar)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9712CC43383;
        Thu,  5 Mar 2020 00:11:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9712CC43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=varar@codeaurora.org
From:   Vara Reddy <varar@codeaurora.org>
To:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, seanpaul@chromium.org
Cc:     Vara Reddy <varar@codeaurora.org>, robdclark@gmail.com,
        abhinavk@codeaurora.org, nganji@codeaurora.org,
        jsanka@codeaurora.org, hoegsberg@google.com,
        aravindh@codeaurora.org, chandanu@codeaurora.org,
        dri-devel@lists.freedesktop.org
Subject: [DPU PATCH v4 0/5] Add support for DisplayPort driver on SnapDragon. 
Date:   Wed,  4 Mar 2020 16:10:23 -0800
Message-Id: <1583367028-19979-1-git-send-email-varar@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

These patches add support for Display-Port driver on SnapDragon hardware. It adds
DP driver and DP PLL driver files along with the needed device-tree bindings.

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


These patches have dependency on clock driver changes mentioned below:
https://patchwork.kernel.org/patch/11245895/ 
https://patchwork.kernel.org/project/linux-clk/list/?series=153657

Chandan Uddaraju (4):
  dt-bindings: msm/dp: add bindings of DP/DP-PLL driver for Snapdragon
  drm: add constant N value in helper file
  drm/msm/dp: add displayPort driver support
  drm/msm/dp: add support for DP PLL driver

Jeykumar Sankaran (1):
  drm/msm/dpu: add display port support in DPU

 .../devicetree/bindings/display/msm/dp.txt         |  252 +++
 .../devicetree/bindings/display/msm/dpu.txt        |   16 +-
 drivers/gpu/drm/i915/display/intel_display.c       |    2 +-
 drivers/gpu/drm/msm/Kconfig                        |   22 +
 drivers/gpu/drm/msm/Makefile                       |   17 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |   28 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |    8 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   65 +-
 drivers/gpu/drm/msm/dp/dp_aux.c                    |  549 +++++++
 drivers/gpu/drm/msm/dp/dp_aux.h                    |   37 +
 drivers/gpu/drm/msm/dp/dp_catalog.c                | 1118 +++++++++++++
 drivers/gpu/drm/msm/dp/dp_catalog.h                |   87 +
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   | 1727 ++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_ctrl.h                   |   35 +
 drivers/gpu/drm/msm/dp/dp_display.c                | 1025 ++++++++++++
 drivers/gpu/drm/msm/dp/dp_display.h                |   31 +
 drivers/gpu/drm/msm/dp/dp_drm.c                    |  176 ++
 drivers/gpu/drm/msm/dp/dp_drm.h                    |   19 +
 drivers/gpu/drm/msm/dp/dp_hpd.c                    |   87 +
 drivers/gpu/drm/msm/dp/dp_hpd.h                    |   81 +
 drivers/gpu/drm/msm/dp/dp_link.c                   | 1246 ++++++++++++++
 drivers/gpu/drm/msm/dp/dp_link.h                   |  140 ++
 drivers/gpu/drm/msm/dp/dp_panel.c                  |  500 ++++++
 drivers/gpu/drm/msm/dp/dp_panel.h                  |   95 ++
 drivers/gpu/drm/msm/dp/dp_parser.c                 |  507 ++++++
 drivers/gpu/drm/msm/dp/dp_parser.h                 |  228 +++
 drivers/gpu/drm/msm/dp/dp_power.c                  |  563 +++++++
 drivers/gpu/drm/msm/dp/dp_power.h                  |   51 +
 drivers/gpu/drm/msm/dp/dp_reg.h                    |  489 ++++++
 drivers/gpu/drm/msm/dp/pll/dp_pll.c                |  136 ++
 drivers/gpu/drm/msm/dp/pll/dp_pll.h                |   57 +
 drivers/gpu/drm/msm/dp/pll/dp_pll_10nm.c           |  406 +++++
 drivers/gpu/drm/msm/dp/pll/dp_pll_10nm.h           |   86 +
 drivers/gpu/drm/msm/dp/pll/dp_pll_10nm_util.c      |  524 ++++++
 drivers/gpu/drm/msm/msm_drv.c                      |    2 +
 drivers/gpu/drm/msm/msm_drv.h                      |   53 +-
 include/drm/drm_dp_helper.h                        |    2 +
 37 files changed, 10444 insertions(+), 23 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/dp.txt
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
 create mode 100644 drivers/gpu/drm/msm/dp/dp_power.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_power.h
 create mode 100644 drivers/gpu/drm/msm/dp/dp_reg.h
 create mode 100644 drivers/gpu/drm/msm/dp/pll/dp_pll.c
 create mode 100644 drivers/gpu/drm/msm/dp/pll/dp_pll.h
 create mode 100644 drivers/gpu/drm/msm/dp/pll/dp_pll_10nm.c
 create mode 100644 drivers/gpu/drm/msm/dp/pll/dp_pll_10nm.h
 create mode 100644 drivers/gpu/drm/msm/dp/pll/dp_pll_10nm_util.c

-- 
$(echo -e 'The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project')
