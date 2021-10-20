Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA05B434AF7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Oct 2021 14:14:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230182AbhJTMQy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Oct 2021 08:16:54 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:4402 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230117AbhJTMQy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Oct 2021 08:16:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1634732080; x=1666268080;
  h=from:to:cc:subject:date:message-id;
  bh=xee9a9OQlfjI1byPU2DSnr6ScUFGZ5MBgkmQyIdABuM=;
  b=pKBfTQGn9X8rk85RzDFehV7NC5rTOL9pPUzk/tLXTcR/kNUkWZ4KW6lD
   0LCIlNrzLV6omO29hWaxRY25wtDy+kr0UWL10MLPQHofwPGEZ+WWsffvO
   Zv1/XZ9AgtV1MMsnGvlgrsVqCL3AKLm9Orfhg6ixpwUK0yIjkKPPEl9yY
   M=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 20 Oct 2021 05:14:39 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 20 Oct 2021 05:14:38 -0700
X-QCInternal: smtphost
Received: from sbillaka-linux.qualcomm.com ([10.204.66.13])
  by ironmsg01-blr.qualcomm.com with ESMTP; 20 Oct 2021 17:44:21 +0530
Received: by sbillaka-linux.qualcomm.com (Postfix, from userid 2305739)
        id 6D8B520E28; Wed, 20 Oct 2021 17:44:20 +0530 (IST)
From:   Sankeerth Billakanti <quic_sbillaka@quicinc.com>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc:     Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
        kalyan_t@codeaurora.org, abhinavk@codeaurora.org,
        dianders@chromium.org, khsieh@codeaurora.org,
        mkrishn@codeaurora.org, sbillaka@codeaurora.org
Subject: [PATCH v2 0/2] Add support for eDP on SC7280
Date:   Wed, 20 Oct 2021 17:44:09 +0530
Message-Id: <1634732051-31282-1-git-send-email-quic_sbillaka@quicinc.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series will add eDP controller support for Qualcomm SC7280
platform. These patches are baseline changes with which we can enable
eDP display on sc7280. The sc7280 eDP controller can also support
additional features such as which will be enabled in subsequent patch series.

	This is based on Bjorn's changes in the below mentioned series
to support both eDP and DP programming through the same driver:
https://patchwork.kernel.org/project/linux-arm-msm/list/?series=564841

Summary of changes:

Changes in V2:
- Remove gpio programming from DP driver
- Implemented code review comments

Changes in V1:
- Add support for eDP on SC7280 platform.
- Add the new compatible string to documentation.

Sankeerth Billakanti (2):
  drm/msm/dp: Add support for SC7280 eDP
  dt-bindings: Add SC7280 compatible string

 .../bindings/display/msm/dp-controller.yaml          |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c       |  4 ++--
 drivers/gpu/drm/msm/dp/dp_ctrl.c                     | 20 ++++++++++++++++++--
 drivers/gpu/drm/msm/dp/dp_display.c                  | 10 +++++++++-
 4 files changed, 30 insertions(+), 5 deletions(-)

-- 
The Qualcomm Innovatin Center, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project

