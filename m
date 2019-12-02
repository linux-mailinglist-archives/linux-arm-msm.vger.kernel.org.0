Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6601E10EB0D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2019 14:47:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727386AbfLBNre (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Dec 2019 08:47:34 -0500
Received: from a27-56.smtp-out.us-west-2.amazonses.com ([54.240.27.56]:35760
        "EHLO a27-56.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727364AbfLBNre (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Dec 2019 08:47:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1575294453;
        h=From:To:Cc:Subject:Date:Message-Id;
        bh=OW2q1sVUWZgGeEP+Xq9b7eg+2UOMnXSgiI+AizLDBYw=;
        b=KCUAgesIP5oXKZZTS079gv4kQ9rT3WJ26fx9x7s3vtphzgG0Ksg91PxP2kMqYwLt
        YAgkl6Sl9nHrh7VDj8VQoqxxBKIXYIXVNH9lR5Bcn93ygkif4jAWh3nuEo82kElfJTY
        UCTaUJmFe7FUrP4BVWxVGlEdSzGSHTGwH3LbvKDw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1575294453;
        h=From:To:Cc:Subject:Date:Message-Id:Feedback-ID;
        bh=OW2q1sVUWZgGeEP+Xq9b7eg+2UOMnXSgiI+AizLDBYw=;
        b=fhc0iPDrWTZHaf4h1xh0HlGy/qmVFpoJbRDctsBJAdCqO9g6qQoIH+gqWX2VAS87
        6TX4k1J6bnh8uljA6V0trIn5Ojqc9nYQCFelDCclN4NYhYiHHPDOGGnwTJw0YhHomD6
        bYKSSy5Dtvskhs9VSABZ0n5wTBve9PVUjaV8UjwA=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 36E76C447AC
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=chandanu@codeaurora.org
From:   Chandan Uddaraju <chandanu@codeaurora.org>
To:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, seanpaul@chromium.org
Cc:     Chandan Uddaraju <chandanu@codeaurora.org>, robdclark@gmail.com,
        abhinavk@codeaurora.org, nganji@codeaurora.org,
        jsanka@codeaurora.org, hoegsberg@google.com,
        dri-devel@lists.freedesktop.org
Subject: [DPU PATCH v3 0/5] List of patches for DP drivers on SnapDragon
Date:   Mon, 2 Dec 2019 13:47:33 +0000
Message-ID: <0101016ec6ddc61a-98995cfb-9a89-4d94-9ff1-264e7984c942-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 1.9.1
X-SES-Outgoing: 2019.12.02-54.240.27.56
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

These patches are to enable DisplayPort driver on SanpDragon.

These patches have dependency on clock driver changes that
provide DP clock support.

Changes in V2:
  Core Dp driver:
     -- Update copyright markings on all relevant files.
     -- Change pr_err() to DRM_ERROR()
     -- Use APIs directly instead of function pointers.
     -- Use drm_display_mode structure to store link parameters in the driver.
     -- Use macros for register definitions instead of hardcoded values in dp_catalog.c file.
     -- Replace writel_relaxed/readl_relaxed with writel/readl and remove memory barriers.
     -- Remove unnecessary NULL checks.
     -- Use drm helper functions for dpcd read/write.
     -- Use DRM_DEBUG_DP for debug msgs.
  DP PLL driver:
     -- Update copyright markings on all relevant files.
     -- Use DRM_DEBUG_DP for debug msgs.

Changes in V3:
  Core Dp Driver:
    -- Removed changes in dpu_io_util.[ch]
    -- Added locking around "is_connected" flag and removed atomic_set()
    -- Removed the argument validation checks in all the static functions
       except initialization functions and few API calls across msm/dp files
    -- Removed hardcoded values for register reads/writes
    -- Removed vreg related generic structures.
    -- Added return values where ever necessary.
    -- Updated dp_ctrl_on function.
    -- Calling the ctrl specific catalog functions directly instead of
       function pointers.
    -- Added seperate change that adds standard value in drm_dp_helper file.
    -- Added separate change in this list that is used to initialize
       displayport in DPU driver.
    -- Added change to use drm_dp_get_adjust_request_voltage() function.


Chandan Uddaraju (4):
  dt-bindings: msm/dp: add bindings of DP/DP-PLL driver for Snapdragon
    845
  drm: add constant N value in helper file
  drm/msm/dp: add displayPort driver support
  drm/msm/dp: add support for DP PLL driver

Jeykumar Sankaran (1):
  drm/msm/dpu: add display port support in DPU

 .../devicetree/bindings/display/msm/dp.txt         |  249 +++
 .../devicetree/bindings/display/msm/dpu.txt        |   16 +-
 drivers/gpu/drm/i915/display/intel_display.c       |    2 +-
 drivers/gpu/drm/msm/Kconfig                        |   22 +
 drivers/gpu/drm/msm/Makefile                       |   17 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |   28 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   65 +-
 drivers/gpu/drm/msm/dp/dp_aux.c                    |  548 +++++++
 drivers/gpu/drm/msm/dp/dp_aux.h                    |   37 +
 drivers/gpu/drm/msm/dp/dp_catalog.c                |  841 +++++++++++
 drivers/gpu/drm/msm/dp/dp_catalog.h                |   84 ++
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   | 1590 ++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_ctrl.h                   |   34 +
 drivers/gpu/drm/msm/dp/dp_display.c                |  997 ++++++++++++
 drivers/gpu/drm/msm/dp/dp_display.h                |   32 +
 drivers/gpu/drm/msm/dp/dp_drm.c                    |  173 +++
 drivers/gpu/drm/msm/dp/dp_drm.h                    |   20 +
 drivers/gpu/drm/msm/dp/dp_extcon.c                 |  216 +++
 drivers/gpu/drm/msm/dp/dp_extcon.h                 |   84 ++
 drivers/gpu/drm/msm/dp/dp_link.c                   | 1185 +++++++++++++++
 drivers/gpu/drm/msm/dp/dp_link.h                   |  132 ++
 drivers/gpu/drm/msm/dp/dp_panel.c                  |  450 ++++++
 drivers/gpu/drm/msm/dp/dp_panel.h                  |   92 ++
 drivers/gpu/drm/msm/dp/dp_parser.c                 |  496 ++++++
 drivers/gpu/drm/msm/dp/dp_parser.h                 |  226 +++
 drivers/gpu/drm/msm/dp/dp_power.c                  |  558 +++++++
 drivers/gpu/drm/msm/dp/dp_power.h                  |   51 +
 drivers/gpu/drm/msm/dp/dp_reg.h                    |  488 ++++++
 drivers/gpu/drm/msm/dp/pll/dp_pll.c                |  135 ++
 drivers/gpu/drm/msm/dp/pll/dp_pll.h                |   57 +
 drivers/gpu/drm/msm/dp/pll/dp_pll_10nm.c           |  401 +++++
 drivers/gpu/drm/msm/dp/pll/dp_pll_10nm.h           |   86 ++
 drivers/gpu/drm/msm/dp/pll/dp_pll_10nm_util.c      |  494 ++++++
 drivers/gpu/drm/msm/msm_drv.c                      |    2 +
 drivers/gpu/drm/msm/msm_drv.h                      |   42 +
 include/drm/drm_dp_helper.h                        |    1 +
 36 files changed, 9931 insertions(+), 20 deletions(-)
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
 create mode 100644 drivers/gpu/drm/msm/dp/dp_extcon.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_extcon.h
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
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

