Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22C373E9B79
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Aug 2021 02:08:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232909AbhHLAJU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Aug 2021 20:09:20 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:3966 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232704AbhHLAJT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Aug 2021 20:09:19 -0400
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 11 Aug 2021 17:08:55 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 11 Aug 2021 17:08:54 -0700
X-QCInternal: smtphost
Received: from sbillaka-linux.qualcomm.com ([10.204.66.13])
  by ironmsg01-blr.qualcomm.com with ESMTP; 12 Aug 2021 05:38:20 +0530
Received: by sbillaka-linux.qualcomm.com (Postfix, from userid 2305739)
        id D1693220EC; Thu, 12 Aug 2021 05:38:18 +0530 (IST)
From:   Sankeerth Billakanti <sbillaka@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc:     Sankeerth Billakanti <sbillaka@codeaurora.org>,
        robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
        kalyan_t@codeaurora.org, abhinavk@codeaurora.org,
        dianders@chromium.org, khsieh@codeaurora.org,
        mkrishn@codeaurora.org
Subject: [PATCH v1 0/2] Add support for eDP on SC7280
Date:   Thu, 12 Aug 2021 05:38:00 +0530
Message-Id: <1628726882-27841-1-git-send-email-sbillaka@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

	This series will add eDP controller support for Qualcomm SC7280
platform. These patches are baseline changes with which we can enable
eDP display on sc7280. The sc7280 eDP controller can also support
additional features such as backlight control, PSR etc. which will be
enabled in subsequent patch series.

	This is based on Bjorn's changes in the below mentioned series
to support both eDP and DP programming through the same driver:
v1 of https://patchwork.freedesktop.org/series/92860/
v1 of https://patchwork.freedesktop.org/series/92992/

Summary of changes:
Add support for eDP on SC7280 platform.
Add the new compatible string to documentation.


Sankeerth Billakanti (2):
  drm/msm/dp: Add support for SC7280 eDP
  dt-bindings: Add SC7280 compatible string

 .../bindings/display/msm/dp-controller.yaml        |  3 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  4 +--
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   | 19 +++++++++++++
 drivers/gpu/drm/msm/dp/dp_display.c                | 32 ++++++++++++++++++++--
 drivers/gpu/drm/msm/dp/dp_parser.c                 | 31 +++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_parser.h                 |  5 ++++
 6 files changed, 90 insertions(+), 4 deletions(-)

-- 
The Qualcomm Innovatin Center, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project

