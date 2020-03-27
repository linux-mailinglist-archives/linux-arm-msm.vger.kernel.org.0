Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9587195219
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2020 08:36:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726133AbgC0Hg6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Mar 2020 03:36:58 -0400
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:30087 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725942AbgC0Hg6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Mar 2020 03:36:58 -0400
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 27 Mar 2020 13:06:52 +0530
Received: from harigovi-linux.qualcomm.com ([10.204.66.157])
  by ironmsg01-blr.qualcomm.com with ESMTP; 27 Mar 2020 13:06:39 +0530
Received: by harigovi-linux.qualcomm.com (Postfix, from userid 2332695)
        id DCC5F2973; Fri, 27 Mar 2020 13:06:37 +0530 (IST)
From:   Harigovindan P <harigovi@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     Harigovindan P <harigovi@codeaurora.org>, robdclark@gmail.com,
        seanpaul@chromium.org, sean@poorly.run
Subject: [PATCH v10 0/2] Add support for rm69299 Visionox panel driver and add devicetree bindings for visionox panel
Date:   Fri, 27 Mar 2020 13:06:34 +0530
Message-Id: <20200327073636.13823-1-harigovi@codeaurora.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Adding support for visionox rm69299 panel driver and adding bindings for the same panel.

Harigovindan P (2):
  dt-bindings: display: add visionox rm69299 panel variant
  drm/panel: add support for rm69299 visionox panel driver

 .../display/panel/visionox,rm69299.yaml       |  58 ++++
 drivers/gpu/drm/panel/Kconfig                 |   8 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-visionox-rm69299.c    | 295 ++++++++++++++++++
 4 files changed, 362 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-visionox-rm69299.c

-- 
2.25.1

