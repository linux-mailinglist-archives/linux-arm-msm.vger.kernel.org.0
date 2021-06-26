Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CF8A3B4F8C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Jun 2021 18:52:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230288AbhFZQyb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Jun 2021 12:54:31 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:44926 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230215AbhFZQy2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Jun 2021 12:54:28 -0400
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 26 Jun 2021 09:52:05 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 26 Jun 2021 09:52:04 -0700
X-QCInternal: smtphost
Received: from rajeevny-linux.qualcomm.com ([10.204.66.121])
  by ironmsg01-blr.qualcomm.com with ESMTP; 26 Jun 2021 22:21:28 +0530
Received: by rajeevny-linux.qualcomm.com (Postfix, from userid 2363605)
        id CFE6321478; Sat, 26 Jun 2021 22:21:25 +0530 (IST)
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
        kalyan_t@codeaurora.org, mkrishn@codeaurora.org
Subject: [v8 4/6] drm/panel-simple: Update validation warnings for eDP panel description
Date:   Sat, 26 Jun 2021 22:21:06 +0530
Message-Id: <1624726268-14869-5-git-send-email-rajeevny@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1624726268-14869-1-git-send-email-rajeevny@codeaurora.org>
References: <1624726268-14869-1-git-send-email-rajeevny@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Do not give a warning for the eDP panels if the "bus_format" is
not specified, since most eDP panels can support more than one
bus formats and this can be auto-detected.
Also, update the check to include bpc=10 for the eDP panel.

Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>
---

Changes in v8:
- New patch, to address the review comments of Sam Ravnborg [1]

[1] https://lore.kernel.org/dri-devel/20210621184157.GB918146@ravnborg.org/

 drivers/gpu/drm/panel/panel-simple.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 86e5a45..f966b562 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -772,10 +772,8 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc,
 			desc->bpc != 8);
 		break;
 	case DRM_MODE_CONNECTOR_eDP:
-		if (desc->bus_format == 0)
-			dev_warn(dev, "Specify missing bus_format\n");
-		if (desc->bpc != 6 && desc->bpc != 8)
-			dev_warn(dev, "Expected bpc in {6,8} but got: %u\n", desc->bpc);
+		if (desc->bpc != 6 && desc->bpc != 8 && desc->bpc != 10)
+			dev_warn(dev, "Expected bpc in {6,8,10} but got: %u\n", desc->bpc);
 		break;
 	case DRM_MODE_CONNECTOR_DSI:
 		if (desc->bpc != 6 && desc->bpc != 8)
-- 
2.7.4

