Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98BDF3B04ED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jun 2021 14:43:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231725AbhFVMp3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Jun 2021 08:45:29 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:46591 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231698AbhFVMp2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Jun 2021 08:45:28 -0400
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 22 Jun 2021 05:43:09 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 22 Jun 2021 05:43:07 -0700
X-QCInternal: smtphost
Received: from rajeevny-linux.qualcomm.com ([10.204.66.121])
  by ironmsg01-blr.qualcomm.com with ESMTP; 22 Jun 2021 18:12:35 +0530
Received: by rajeevny-linux.qualcomm.com (Postfix, from userid 2363605)
        id 5AD7F20FA1; Tue, 22 Jun 2021 18:12:34 +0530 (IST)
From:   Rajeev Nandan <rajeevny@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     Rajeev Nandan <rajeevny@codeaurora.org>,
        linux-kernel@vger.kernel.org, sean@poorly.run, robdclark@gmail.com,
        robh+dt@kernel.org, robh@kernel.org, abhinavk@codeaurora.org,
        kalyan_t@codeaurora.org, mkrishn@codeaurora.org, jonathan@marek.ca,
        dmitry.baryshkov@linaro.org
Subject: [v2 0/3] drm/msm/dsi: Add display DSI support for SC7280 target
Date:   Tue, 22 Jun 2021 18:12:25 +0530
Message-Id: <1624365748-24224-1-git-send-email-rajeevny@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Changes in this series add support for MSM display DSI CTRL & PHY drivers
for the SC7280 SoC, which has DSI controller v2.5.0 and DSI PHY v4.1.

Changes in v2:
- Dropped patch #1 (dt-bindings: msm/dsi: Add yaml schema for 7nm DSI PHY) and
  reused Jonathan's patch [1] (dt-bindings: msm: dsi: add missing 7nm bindings)
- Added new patch (dt-bindings: msm/dsi: Add sc7280 7nm dsi phy)
  Now using <vendor>,<soc>-<block> format for "compatible" property (Rob)
- Fixed clang warning for max_pll_rate as per [2] (Dmitry Baryshkov)
- Fixed num_dsi_phy and io_start (Dmitry Baryshkov)

[1] https://lore.kernel.org/linux-arm-msm/20210617144349.28448-2-jonathan@marek.ca/
[2] https://lore.kernel.org/linux-arm-msm/20210514213032.575161-1-arnd@kernel.org/

Rajeev Nandan (3):
  dt-bindings: msm/dsi: Add sc7280 7nm dsi phy
  drm/msm/dsi: Add PHY configuration for SC7280
  drm/msm/dsi: Add DSI support for SC7280

 .../bindings/display/msm/dsi-phy-7nm.yaml          |  1 +
 drivers/gpu/drm/msm/Kconfig                        |  6 ++---
 drivers/gpu/drm/msm/dsi/dsi_cfg.c                  | 20 +++++++++++++++++
 drivers/gpu/drm/msm/dsi/dsi_cfg.h                  |  1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |  2 ++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |  1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          | 26 ++++++++++++++++++++++
 7 files changed, 54 insertions(+), 3 deletions(-)

-- 
2.7.4

