Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C187354C70
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Apr 2021 08:02:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243897AbhDFGCJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Apr 2021 02:02:09 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:60186 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231751AbhDFGCI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Apr 2021 02:02:08 -0400
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 05 Apr 2021 23:02:01 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 05 Apr 2021 23:01:59 -0700
X-QCInternal: smtphost
Received: from mkrishn-linux.qualcomm.com ([10.204.66.35])
  by ironmsg02-blr.qualcomm.com with ESMTP; 06 Apr 2021 11:31:39 +0530
Received: by mkrishn-linux.qualcomm.com (Postfix, from userid 438394)
        id 0459B21B31; Tue,  6 Apr 2021 11:31:37 +0530 (IST)
From:   Krishna Manikandan <mkrishn@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Cc:     Krishna Manikandan <mkrishn@codeaurora.org>,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        kalyan_t@codeaurora.org, dianders@chromium.org
Subject: [PATCH v1 0/3] Add irq support to accommodate SC7280 target 
Date:   Tue,  6 Apr 2021 11:31:32 +0530
Message-Id: <1617688895-26275-1-git-send-email-mkrishn@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The changes in this series adds all the irq related changes which are needed to
support EDP interface coming on sc7280 target.

Changes in this series:
        - Currently each interrupt register has a range of 32 indexes only.
          But with the introduction of VSYNC and UNDERRUN irq for INTF_5,
          the number of irqs under INTR_STATUS will exceed this value.
          Increase the range of each interrupt register to 64 indexes
          to handle this.

        - Changes are added to enable the vsync and underrun irqs for INTF_5 which
          is required for edp panel.

        - Some irqs which are applicable for sdm845 target are obsolete for sc7180
          and sc7280 targets. Support is added to skip all the obsolete irqs based on
          the target.

Krishna Manikandan (3):
  drm/msm/disp/dpu1: increase the range of interrupts in dpu_irq_map
  drm/msm/disp/dpu1: add vsync and underrun irqs for INTF_5
  drm/msm/disp/dpu1: add flags to indicate obsolete irqs

 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c      |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |   9 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 773 +++++++++++++++++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |   5 +-
 5 files changed, 692 insertions(+), 101 deletions(-)

-- 
2.7.4

