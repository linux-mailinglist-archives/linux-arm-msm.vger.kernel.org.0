Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4F02369C42
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Apr 2021 23:55:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232429AbhDWV4Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Apr 2021 17:56:24 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:61827 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231881AbhDWV4X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Apr 2021 17:56:23 -0400
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 23 Apr 2021 14:55:46 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 23 Apr 2021 14:55:44 -0700
X-QCInternal: smtphost
Received: from rajeevny-linux.qualcomm.com ([10.204.66.121])
  by ironmsg02-blr.qualcomm.com with ESMTP; 24 Apr 2021 03:25:12 +0530
Received: by rajeevny-linux.qualcomm.com (Postfix, from userid 2363605)
        id 7ED1D212C3; Sat, 24 Apr 2021 03:25:11 +0530 (IST)
From:   Rajeev Nandan <rajeevny@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     Rajeev Nandan <rajeevny@codeaurora.org>,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        dianders@chromium.org, mkrishn@codeaurora.org,
        kalyan_t@codeaurora.org, hoegsberg@chromium.org,
        abhinavk@codeaurora.org, seanpaul@chromium.org
Subject: [v2 0/2] drm: Add support for backlight control of eDP panel on ti-sn65dsi86 bridge
Date:   Sat, 24 Apr 2021 03:25:02 +0530
Message-Id: <1619214904-10218-1-git-send-email-rajeevny@codeaurora.org>
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

Anderson's patch series [1] exposed the DDC bus from ti-sn65dsi86 bridge,
that gives an option to move the backlight control out of the bridge and
to create a separate backlight driver.

Changes in v2:
- Created a new DisplayPort aux backlight driver and moved the code from
  drm_dp_aux_backlight.c (v1) to the new driver.
- Removed the changes done in ti-sn65dsi86 bridge. (Rob Herring)

[1] https://lore.kernel.org/dri-devel/20210416223950.3586967-1-dianders@chromium.org/

Rajeev Nandan (2):
  dt-bindings: backlight: add DisplayPort aux backlight
  backlight: Add DisplayPort aux backlight driver

 .../bindings/leds/backlight/dp-aux-backlight.yaml  |  49 +++++
 drivers/video/backlight/Kconfig                    |   7 +
 drivers/video/backlight/Makefile                   |   1 +
 drivers/video/backlight/dp_aux_backlight.c         | 245 +++++++++++++++++++++
 4 files changed, 302 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/dp-aux-backlight.yaml
 create mode 100644 drivers/video/backlight/dp_aux_backlight.c

-- 
2.7.4

