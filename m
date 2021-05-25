Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C1DC38FBB7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 May 2021 09:31:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231601AbhEYHc5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 May 2021 03:32:57 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:8271 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231462AbhEYHc4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 May 2021 03:32:56 -0400
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 25 May 2021 00:31:27 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 25 May 2021 00:31:25 -0700
X-QCInternal: smtphost
Received: from rajeevny-linux.qualcomm.com ([10.204.66.121])
  by ironmsg01-blr.qualcomm.com with ESMTP; 25 May 2021 13:00:35 +0530
Received: by rajeevny-linux.qualcomm.com (Postfix, from userid 2363605)
        id B3B6121440; Tue, 25 May 2021 13:00:34 +0530 (IST)
From:   Rajeev Nandan <rajeevny@codeaurora.org>
To:     y@qualcomm.com, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
Cc:     Rajeev Nandan <rajeevny@codeaurora.org>,
        linux-kernel@vger.kernel.org, thierry.reding@gmail.com,
        sam@ravnborg.org, robdclark@gmail.com, dianders@chromium.org,
        lyude@redhat.com, jani.nikula@intel.com, robh@kernel.org,
        laurent.pinchart@ideasonboard.com, a.hajda@samsung.com,
        daniel.thompson@linaro.org, hoegsberg@chromium.org,
        abhinavk@codeaurora.org, seanpaul@chromium.org,
        kalyan_t@codeaurora.org, mkrishn@codeaurora.org
Subject: [v4 0/4] drm: Support basic DPCD backlight in panel-simple and add a new panel ATNA33XC20
Date:   Tue, 25 May 2021 13:00:27 +0530
Message-Id: <1621927831-29471-1-git-send-email-rajeevny@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series adds the support for the eDP panel that needs the backlight
controlling over the DP AUX channel using DPCD registers of the panel
as per the VESA's standard.

This series also adds support for the Samsung eDP AMOLED panel that
needs DP AUX to control the backlight, and introduces new delays in the
@panel_desc.delay to support this panel.

This patch series depends on the following two series:
- Doug's series [1], exposed the DP AUX channel to the panel-simple.
- Lyude's series [2], introduced new drm helper functions for DPCD
  backlight.

This series is the logical successor to the series [3].

Changes in v1:
- Created dpcd backlight helper with very basic functionality, added
  backlight registration in the ti-sn65dsi86 bridge driver.

Changes in v2:
- Created a new DisplayPort aux backlight driver and moved the code from
  drm_dp_aux_backlight.c (v1) to the new driver.

Changes in v3:
- Fixed module compilation (kernel test bot).

Changes in v4:
- Added basic DPCD backlight support in panel-simple.
- Added support for a new Samsung panel ATNA33XC20 that needs DPCD
  backlight controlling and has a requirement of delays between enable
  GPIO and regulator.

[1] https://lore.kernel.org/dri-devel/20210525000159.3384921-1-dianders@chromium.org/
[2] https://lore.kernel.org/dri-devel/20210514181504.565252-1-lyude@redhat.com/
[3] https://lore.kernel.org/dri-devel/1619416756-3533-1-git-send-email-rajeevny@codeaurora.org/

Rajeev Nandan (4):
  drm/panel-simple: Add basic DPCD backlight support
  drm/panel-simple: Support for delays between GPIO & regulator
  dt-bindings: display: simple: Add Samsung ATNA33XC20
  drm/panel-simple: Add Samsung ATNA33XC20

 .../bindings/display/panel/panel-simple.yaml       |   2 +
 drivers/gpu/drm/panel/panel-simple.c               | 156 ++++++++++++++++++++-
 2 files changed, 155 insertions(+), 3 deletions(-)

-- 
2.7.4

