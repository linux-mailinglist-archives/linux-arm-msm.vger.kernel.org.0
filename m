Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0B543A4E8E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Jun 2021 14:09:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231320AbhFLMLO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 12 Jun 2021 08:11:14 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:29689 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231288AbhFLMLL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 12 Jun 2021 08:11:11 -0400
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 12 Jun 2021 05:09:11 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 12 Jun 2021 05:09:09 -0700
X-QCInternal: smtphost
Received: from rajeevny-linux.qualcomm.com ([10.204.66.121])
  by ironmsg02-blr.qualcomm.com with ESMTP; 12 Jun 2021 17:38:32 +0530
Received: by rajeevny-linux.qualcomm.com (Postfix, from userid 2363605)
        id 4425721465; Sat, 12 Jun 2021 17:38:31 +0530 (IST)
From:   Rajeev Nandan <rajeevny@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     Rajeev Nandan <rajeevny@codeaurora.org>,
        linux-kernel@vger.kernel.org, thierry.reding@gmail.com,
        sam@ravnborg.org, robdclark@gmail.com, dianders@chromium.org,
        lyude@redhat.com, jani.nikula@intel.com, robh@kernel.org,
        laurent.pinchart@ideasonboard.com, a.hajda@samsung.com,
        daniel.thompson@linaro.org, hoegsberg@chromium.org,
        abhinavk@codeaurora.org, seanpaul@chromium.org,
        kalyan_t@codeaurora.org, mkrishn@codeaurora.org,
        lee.jones@linaro.org, jingoohan1@gmail.com,
        linux-fbdev@vger.kernel.org
Subject: [v6 2/5] drm/panel-simple: Support DP AUX backlight
Date:   Sat, 12 Jun 2021 17:37:59 +0530
Message-Id: <1623499682-2140-3-git-send-email-rajeevny@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1623499682-2140-1-git-send-email-rajeevny@codeaurora.org>
References: <1623499682-2140-1-git-send-email-rajeevny@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If there is no backlight specified in the device tree and the panel
has access to the DP AUX channel then create a DP AUX backlight if
supported by the panel.

Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v5)

This patch depends on the previous patch (2/5) of this series.

Changes in v4:
- New

Changes in v5:
- Address review comments and move backlight functions to drm_panel.c (Douglas)
- Create and register DP AUX backlight if there is no backlight specified in the
  device tree and panel has the DP AUX channel. (Douglas)
- The new drm_panel_dp_aux_backlight() will do the drm_edp_backlight_supported() check.

 drivers/gpu/drm/panel/panel-simple.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index df6fbd1..26555ec 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -800,6 +800,12 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc,
 	if (err)
 		goto disable_pm_runtime;
 
+	if (!panel->base.backlight && panel->aux) {
+		err = drm_panel_dp_aux_backlight(&panel->base, panel->aux);
+		if (err)
+			goto disable_pm_runtime;
+	}
+
 	drm_panel_add(&panel->base);
 
 	return 0;
-- 
2.7.4

