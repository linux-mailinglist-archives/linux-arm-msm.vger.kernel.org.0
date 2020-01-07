Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4A611324DB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2020 12:30:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727911AbgAGLaD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jan 2020 06:30:03 -0500
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:27176 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727273AbgAGLaD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jan 2020 06:30:03 -0500
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 07 Jan 2020 17:00:00 +0530
Received: from harigovi-linux.qualcomm.com ([10.204.66.157])
  by ironmsg02-blr.qualcomm.com with ESMTP; 07 Jan 2020 16:59:59 +0530
Received: by harigovi-linux.qualcomm.com (Postfix, from userid 2332695)
        id CB6EA2574; Tue,  7 Jan 2020 16:59:58 +0530 (IST)
From:   Harigovindan P <harigovi@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     Harigovindan P <harigovi@codeaurora.org>, robdclark@gmail.com,
        seanpaul@chromium.org, sean@poorly.run
Subject: [PATCH v2 0/2] Add support for rm69299 Visionox panel driver and add devicetree bindings for visionox panel
Date:   Tue,  7 Jan 2020 16:59:55 +0530
Message-Id: <1578396597-18324-1-git-send-email-harigovi@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Current patchset adds support for rm69299 visionox panel driver used 
in MSM reference platforms. The visionox panel driver supports a 
resolution of 1080x2248 with 4 lanes and supports only single DSI mode.

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
Changes in v2:
	-Removed unwanted properties from description.
	-Creating source files without execute permissions(Rob Herring).
	-Dropping redundant space in Kconfig(Sam Ravnborg).
	-Changing structure for include files(Sam Ravnborg).
	-Removing backlight related code and functions(Sam Ravnborg).
	-Removing repeated printing of error message(Sam Ravnborg).
	-Adding drm_connector as an argument for get_modes function.

Harigovindan P (2):
  dt-bindings: display: add sc7180 panel variant
  drm/panel: add support for rm69299 visionox panel driver

 .../bindings/display/visionox,rm69299.txt          |  48 +++
 drivers/gpu/drm/panel/Kconfig                      |   8 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-visionox-rm69299.c     | 370 +++
 4 files changed, 427 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/visionox,rm69299.txt
 create mode 100644 drivers/gpu/drm/panel/panel-visionox-rm69299.c

-- 
2.7.4

