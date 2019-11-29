Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DAEE810D199
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2019 07:56:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726653AbfK2G4S (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Nov 2019 01:56:18 -0500
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:4027 "EHLO
        alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725856AbfK2G4S (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Nov 2019 01:56:18 -0500
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA; 29 Nov 2019 12:26:15 +0530
Received: from harigovi-linux.qualcomm.com ([10.204.66.147])
  by ironmsg01-blr.qualcomm.com with ESMTP; 29 Nov 2019 12:25:53 +0530
Received: by harigovi-linux.qualcomm.com (Postfix, from userid 2332695)
        id 9E3F22346; Fri, 29 Nov 2019 12:25:52 +0530 (IST)
From:   Harigovindan P <harigovi@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     Harigovindan P <harigovi@codeaurora.org>,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        seanpaul@chromium.org, hoegsberg@chromium.org,
        abhinavk@codeaurora.org, jsanka@codeaurora.org,
        chandanu@codeaurora.org, nganji@codeaurora.org
Subject: [PATCH v1 0/2] Add suppport for rm69299 Visionox panel driver and add devicetree bindings for visionox panel.
Date:   Fri, 29 Nov 2019 12:25:43 +0530
Message-Id: <1575010545-25971-1-git-send-email-harigovi@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Current patchset adds support for rm69299 visionox panel driver used in MSM reference platforms.
The visionox panel driver supports a resolution of 1080x2248 with 4 lanes and supports only single DSI mode.

Current patchset is tested on actual panel.

Changes in v1:
	-add devicetree bindings for visionox panel.
	-Split out panel driver patch from dsi config changes(Rob Clark).
        -Remove unrelated code(Stephen Boyd).
        -Remove static arrays to make regulator setup
         open coded in probe(Stephen Boyd).
        -Remove pre-assigning variables(Stephen Boyd).
        -Inline panel_add function into probe(Stephen Boyd).
        -Use mipi_dsi_dcs_write directly(Rob Clark).
	-Remove qcom_rm69299_1080p_panel_magic_cmds array(Rob Clark).

Harigovindan P (2):
  dt-bindings: display: add sc7180 panel variant
  drm/panel: add support for rm69299 visionox panel driver

 .../bindings/display/visionox,rm69299.txt          |  68 ++++
 drivers/gpu/drm/panel/Kconfig                      |   9 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-visionox-rm69299.c     | 412 +++++++++++++++++++++
 4 files changed, 490 insertions(+)
 create mode 100755 Documentation/devicetree/bindings/display/visionox,rm69299.txt
 create mode 100755 drivers/gpu/drm/panel/panel-visionox-rm69299.c

-- 
2.7.4

