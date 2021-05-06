Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70909374F85
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 May 2021 08:47:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230382AbhEFGsO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 May 2021 02:48:14 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:32255 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229929AbhEFGsN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 May 2021 02:48:13 -0400
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 05 May 2021 23:47:16 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 05 May 2021 23:47:14 -0700
X-QCInternal: smtphost
Received: from sbillaka-linux.qualcomm.com ([10.204.66.13])
  by ironmsg02-blr.qualcomm.com with ESMTP; 06 May 2021 12:16:43 +0530
Received: by sbillaka-linux.qualcomm.com (Postfix, from userid 2305739)
        id CE47D21D6F; Thu,  6 May 2021 12:16:41 +0530 (IST)
From:   Sankeerth Billakanti <sbillaka@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc:     Sankeerth Billakanti <sbillaka@codeaurora.org>,
        robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
        kalyan_t@codeaurora.org, abhinavk@codeaurora.org,
        dianders@chromium.org, khsieh@codeaurora.org,
        mkrishn@codeaurora.org
Subject: [PATCH v1 0/3] Add support for next gen eDP driver on sc7280
Date:   Thu,  6 May 2021 12:16:32 +0530
Message-Id: <1620283595-30471-1-git-send-email-sbillaka@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

These patches add support for the next generation eDP driver on SnapDragon
with dpu support. The existing eDP driver cannot support the new eDP
hardware. So, to maintain backward compatibility, the older eDP driver is
moved to v200 folder and the new generation eDP driver is added in
the v510 folder.

These are baseline changes with which we can enable display. The new eDP
controller can also support additional features such as backlight control,
PSR etc. which will be enabled in subsequent patch series.

Summary of changes:
DPU driver interface to the new eDP v510 display driver.
New generation eDP controller and phy driver implementation.
A common interface to choose enable the required eDP driver.

Sankeerth Billakanti (3):
  drm/msm/edp: support multiple generations of edp hardware
  drm/msm/edp: add support for next gen edp
  drm/msm/disp/dpu1: add support for edp encoder

 drivers/gpu/drm/msm/Makefile                      |   19 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c       |    7 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c           |   33 +
 drivers/gpu/drm/msm/edp/edp.c                     |  198 ---
 drivers/gpu/drm/msm/edp/edp.h                     |   78 -
 drivers/gpu/drm/msm/edp/edp.xml.h                 |  380 -----
 drivers/gpu/drm/msm/edp/edp_aux.c                 |  264 ----
 drivers/gpu/drm/msm/edp/edp_bridge.c              |  111 --
 drivers/gpu/drm/msm/edp/edp_common.c              |   38 +
 drivers/gpu/drm/msm/edp/edp_common.h              |   47 +
 drivers/gpu/drm/msm/edp/edp_connector.c           |  132 --
 drivers/gpu/drm/msm/edp/edp_ctrl.c                | 1375 ------------------
 drivers/gpu/drm/msm/edp/edp_phy.c                 |   98 --
 drivers/gpu/drm/msm/edp/v200/edp.xml.h            |  380 +++++
 drivers/gpu/drm/msm/edp/v200/edp_v200.c           |  210 +++
 drivers/gpu/drm/msm/edp/v200/edp_v200.h           |   70 +
 drivers/gpu/drm/msm/edp/v200/edp_v200_aux.c       |  264 ++++
 drivers/gpu/drm/msm/edp/v200/edp_v200_bridge.c    |  111 ++
 drivers/gpu/drm/msm/edp/v200/edp_v200_connector.c |  132 ++
 drivers/gpu/drm/msm/edp/v200/edp_v200_ctrl.c      | 1375 ++++++++++++++++++
 drivers/gpu/drm/msm/edp/v200/edp_v200_phy.c       |   98 ++
 drivers/gpu/drm/msm/edp/v510/edp_v510.c           |  220 +++
 drivers/gpu/drm/msm/edp/v510/edp_v510.h           |  151 ++
 drivers/gpu/drm/msm/edp/v510/edp_v510_aux.c       |  268 ++++
 drivers/gpu/drm/msm/edp/v510/edp_v510_bridge.c    |  111 ++
 drivers/gpu/drm/msm/edp/v510/edp_v510_connector.c |  117 ++
 drivers/gpu/drm/msm/edp/v510/edp_v510_ctrl.c      | 1583 +++++++++++++++++++++
 drivers/gpu/drm/msm/edp/v510/edp_v510_phy.c       |  641 +++++++++
 drivers/gpu/drm/msm/edp/v510/edp_v510_reg.h       |  339 +++++
 29 files changed, 6207 insertions(+), 2643 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/edp/edp.c
 delete mode 100644 drivers/gpu/drm/msm/edp/edp.h
 delete mode 100644 drivers/gpu/drm/msm/edp/edp.xml.h
 delete mode 100644 drivers/gpu/drm/msm/edp/edp_aux.c
 delete mode 100644 drivers/gpu/drm/msm/edp/edp_bridge.c
 create mode 100644 drivers/gpu/drm/msm/edp/edp_common.c
 create mode 100644 drivers/gpu/drm/msm/edp/edp_common.h
 delete mode 100644 drivers/gpu/drm/msm/edp/edp_connector.c
 delete mode 100644 drivers/gpu/drm/msm/edp/edp_ctrl.c
 delete mode 100644 drivers/gpu/drm/msm/edp/edp_phy.c
 create mode 100644 drivers/gpu/drm/msm/edp/v200/edp.xml.h
 create mode 100644 drivers/gpu/drm/msm/edp/v200/edp_v200.c
 create mode 100644 drivers/gpu/drm/msm/edp/v200/edp_v200.h
 create mode 100644 drivers/gpu/drm/msm/edp/v200/edp_v200_aux.c
 create mode 100644 drivers/gpu/drm/msm/edp/v200/edp_v200_bridge.c
 create mode 100644 drivers/gpu/drm/msm/edp/v200/edp_v200_connector.c
 create mode 100644 drivers/gpu/drm/msm/edp/v200/edp_v200_ctrl.c
 create mode 100644 drivers/gpu/drm/msm/edp/v200/edp_v200_phy.c
 create mode 100644 drivers/gpu/drm/msm/edp/v510/edp_v510.c
 create mode 100644 drivers/gpu/drm/msm/edp/v510/edp_v510.h
 create mode 100644 drivers/gpu/drm/msm/edp/v510/edp_v510_aux.c
 create mode 100644 drivers/gpu/drm/msm/edp/v510/edp_v510_bridge.c
 create mode 100644 drivers/gpu/drm/msm/edp/v510/edp_v510_connector.c
 create mode 100644 drivers/gpu/drm/msm/edp/v510/edp_v510_ctrl.c
 create mode 100644 drivers/gpu/drm/msm/edp/v510/edp_v510_phy.c
 create mode 100644 drivers/gpu/drm/msm/edp/v510/edp_v510_reg.h

-- 
The Qualcomm Innovatin Center, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project

