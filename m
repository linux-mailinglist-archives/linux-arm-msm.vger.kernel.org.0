Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6580A354C18
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Apr 2021 07:23:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242477AbhDFFK1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Apr 2021 01:10:27 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:26087 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230073AbhDFFK1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Apr 2021 01:10:27 -0400
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 05 Apr 2021 22:10:19 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 05 Apr 2021 22:10:18 -0700
X-QCInternal: smtphost
Received: from mkrishn-linux.qualcomm.com ([10.204.66.35])
  by ironmsg02-blr.qualcomm.com with ESMTP; 06 Apr 2021 10:39:58 +0530
Received: by mkrishn-linux.qualcomm.com (Postfix, from userid 438394)
        id 7B1C021B31; Tue,  6 Apr 2021 10:39:56 +0530 (IST)
From:   Krishna Manikandan <mkrishn@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Cc:     Krishna Manikandan <mkrishn@codeaurora.org>,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        kalyan_t@codeaurora.org, dianders@chromium.org
Subject: [PATCH v1 0/4] Add display support for SC7280 target 
Date:   Tue,  6 Apr 2021 10:39:48 +0530
Message-Id: <1617685792-14376-1-git-send-email-mkrishn@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The changes in this series adds all the required support for display driver for
SC7280 target. In addition to the basic catalog changes, changes are added to
accommodate new registers for SC7280 target.

SC7280 target comes under next generation targets. The register differences in
SC7280 when compared to SC7180 are mentioned below:

        - SC7280 uses UBWC3.0 and changes are added to program the ubwc static
          registers properly

        - Pingpong dither block offset value has changed for SC7280 family. Separate
          sub block is defined for sc7280 pingpong block and changes are added to
          handle this.

        - Interface offsets are different for SC7280 family. These offset values are
          used to access the interface irq registers. Changes are added to handle
          this based on the target.

        - A new register called CTL_FETCH_PIPE_ACTIVE is introduced in SC7280 family,
          which tells the HW about the active pipes in the CTL path. Changes are
          added to program this register based on the active pipes in the
          current composition.

        - Changes are added to program INTF_CONFIG2 properly since the reset value
          of this register has changed in SC7280 family and we need to explicitly program
          it with correct values to avoid wrong interface configuration.

        - INTF_5 is added to intf configuration to support EDP.

Krishna Manikandan (4):
  drm/msm/disp/dpu1: add support for display for SC7280 target
  drm/msm/disp/dpu1: add intf offsets for SC7280 target
  drm/msm/disp/dpu1: add support to program fetch active in ctl path
  drm/msm/disp/dpu1: enable DATA_HCTL_EN for sc7280 target

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c          |   7 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 176 ++++++++++++++++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c        |  27 ++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h        |   3 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c |  20 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c       |  11 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c           |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c          |   6 +-
 drivers/gpu/drm/msm/msm_drv.c                     |   4 +-
 10 files changed, 242 insertions(+), 24 deletions(-)

-- 
2.7.4

