Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A028635F918
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Apr 2021 18:42:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234136AbhDNQls (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Apr 2021 12:41:48 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:23985 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234065AbhDNQlr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Apr 2021 12:41:47 -0400
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 14 Apr 2021 09:41:26 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 14 Apr 2021 09:41:24 -0700
X-QCInternal: smtphost
Received: from rajeevny-linux.qualcomm.com ([10.204.66.121])
  by ironmsg01-blr.qualcomm.com with ESMTP; 14 Apr 2021 22:10:49 +0530
Received: by rajeevny-linux.qualcomm.com (Postfix, from userid 2363605)
        id DA47121351; Wed, 14 Apr 2021 22:10:47 +0530 (IST)
From:   Rajeev Nandan <rajeevny@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     Rajeev Nandan <rajeevny@codeaurora.org>,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        dianders@chromium.org, mkrishn@codeaurora.org,
        kalyan_t@codeaurora.org, hoegsberg@chromium.org,
        abhinavk@codeaurora.org, seanpaul@chromium.org
Subject: [v1 0/3] drm: Add support for backlight control of eDP panel on ti-sn65dsi86 bridge
Date:   Wed, 14 Apr 2021 22:09:47 +0530
Message-Id: <1618418390-15055-1-git-send-email-rajeevny@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The backlight level of an eDP panel can be controlled through the AUX
channel using DPCD registers of the panel.

The capability for the Source device to adjust backlight characteristics
within the panel, using the Sink device DPCD registers is indicated by
the TCON_BACKLIGHT_ADJUSTMENT_CAPABLE bit in the EDP_GENERAL_CAPABILITY_1
register (DPCD Address 701h, bit0). In this configuration, the eDP TCON
receives the backlight level information from the host, through the AUX
channel.

The changes in this patch series do the following:
- Add drm_dp_aux_backlight_ APIs to support backlight control using DPCD
  registers on the DisplayPort AUX channel.
  The current version only supports backlight brightness control by the
  EDP_BACKLIGHT_BRIGHTNESS_MSB/LSB registers (DPCD Addresses 722h-723h).
- Add support for backlight control of the eDP panel connected to the
  ti-sn65dsi86 bridge.

Rajeev Nandan (3):
  drm/dp: Add DisplayPort aux backlight control support
  dt-bindings: drm/bridge: ti-sn65dsi86: Document use-aux-backlight
  drm/bridge: ti-sn65dsi86: Add DisplayPort aux backlight support

 .../bindings/display/bridge/ti,sn65dsi86.yaml      |   8 +
 drivers/gpu/drm/Kconfig                            |   8 +
 drivers/gpu/drm/Makefile                           |   1 +
 drivers/gpu/drm/bridge/Kconfig                     |   1 +
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              |  26 +++
 drivers/gpu/drm/drm_dp_aux_backlight.c             | 191 +++++++++++++++++++++
 include/drm/drm_dp_aux_backlight.h                 |  29 ++++
 7 files changed, 264 insertions(+)
 create mode 100644 drivers/gpu/drm/drm_dp_aux_backlight.c
 create mode 100644 include/drm/drm_dp_aux_backlight.h

-- 
2.7.4

