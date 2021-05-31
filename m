Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE2FA395CE9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 May 2021 15:38:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231960AbhEaNkI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 May 2021 09:40:08 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:31603 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232179AbhEaNgW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 May 2021 09:36:22 -0400
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 31 May 2021 06:34:42 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 31 May 2021 06:34:41 -0700
X-QCInternal: smtphost
Received: from rajeevny-linux.qualcomm.com ([10.204.66.121])
  by ironmsg01-blr.qualcomm.com with ESMTP; 31 May 2021 19:04:06 +0530
Received: by rajeevny-linux.qualcomm.com (Postfix, from userid 2363605)
        id EAB3321485; Mon, 31 May 2021 19:04:04 +0530 (IST)
From:   Rajeev Nandan <rajeevny@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     Rajeev Nandan <rajeevny@codeaurora.org>,
        linux-kernel@vger.kernel.org, sean@poorly.run, robdclark@gmail.com,
        robh+dt@kernel.org, abhinavk@codeaurora.org,
        kalyan_t@codeaurora.org, mkrishn@codeaurora.org, jonathan@marek.ca
Subject: [v1 0/3] drm/msm/dsi: Add display DSI support for SC7280 target
Date:   Mon, 31 May 2021 19:03:52 +0530
Message-Id: <1622468035-8453-1-git-send-email-rajeevny@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Changes in this series add support for MSM display DSI CTRL & PHY drivers
for the SC7280 SoC, which has DSI controller v2.5.0 and DSI PHY v4.1.

This series also updates the missing bindings (yaml) for the 7nm DSI PHY
driver on "msm-next" branch.

Rajeev Nandan (3):
  dt-bindings: msm/dsi: Add yaml schema for 7nm DSI PHY
  drm/msm/dsi: Add PHY configuration for SC7280
  drm/msm/dsi: Add DSI support for SC7280

 .../bindings/display/msm/dsi-phy-7nm.yaml          | 68 ++++++++++++++++++++++
 drivers/gpu/drm/msm/Kconfig                        |  6 +-
 drivers/gpu/drm/msm/dsi/dsi_cfg.c                  | 20 +++++++
 drivers/gpu/drm/msm/dsi/dsi_cfg.h                  |  1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |  2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |  1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          | 22 +++++++
 7 files changed, 117 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml

-- 
2.7.4

