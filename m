Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC5A01EE28F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2020 12:36:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725905AbgFDKgf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Jun 2020 06:36:35 -0400
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:34402 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725601AbgFDKgf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Jun 2020 06:36:35 -0400
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 04 Jun 2020 16:05:04 +0530
Received: from harigovi-linux.qualcomm.com ([10.204.66.157])
  by ironmsg02-blr.qualcomm.com with ESMTP; 04 Jun 2020 16:04:42 +0530
Received: by harigovi-linux.qualcomm.com (Postfix, from userid 2332695)
        id 9892115FE; Thu,  4 Jun 2020 16:04:41 +0530 (IST)
From:   Harigovindan P <harigovi@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     Harigovindan P <harigovi@codeaurora.org>,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        seanpaul@chromium.org, hoegsberg@chromium.org,
        kalyan_t@codeaurora.org, nganji@codeaurora.org, sam@ravnborg.org
Subject: [v2] drm/bridge: ti-sn65dsi86: ensure bridge suspend happens during PM sleep
Date:   Thu,  4 Jun 2020 16:04:38 +0530
Message-Id: <20200604103438.23667-1-harigovi@codeaurora.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

ti-sn65dsi86 bridge is enumerated as a runtime device.

Adding sleep ops to force runtime_suspend when PM suspend is
requested on the device.

Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
---
Changes in v2:
	- Include bridge name in the commit message and 
	remove dependent patchwork link from the commit
	text as bridge is independent of OEM(Stephen Boyd)

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 6ad688b320ae..2eef755b2917 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -159,6 +159,8 @@ static int __maybe_unused ti_sn_bridge_suspend(struct device *dev)
 
 static const struct dev_pm_ops ti_sn_bridge_pm_ops = {
 	SET_RUNTIME_PM_OPS(ti_sn_bridge_suspend, ti_sn_bridge_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
 };
 
 static int status_show(struct seq_file *s, void *data)
-- 
2.27.0

