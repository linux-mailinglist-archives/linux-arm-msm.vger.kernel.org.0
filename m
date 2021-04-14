Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C45C35F91A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Apr 2021 18:42:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348303AbhDNQlu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Apr 2021 12:41:50 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:23985 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234281AbhDNQlt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Apr 2021 12:41:49 -0400
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 14 Apr 2021 09:41:28 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 14 Apr 2021 09:41:27 -0700
X-QCInternal: smtphost
Received: from rajeevny-linux.qualcomm.com ([10.204.66.121])
  by ironmsg01-blr.qualcomm.com with ESMTP; 14 Apr 2021 22:11:09 +0530
Received: by rajeevny-linux.qualcomm.com (Postfix, from userid 2363605)
        id 8577221351; Wed, 14 Apr 2021 22:11:08 +0530 (IST)
From:   Rajeev Nandan <rajeevny@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     Rajeev Nandan <rajeevny@codeaurora.org>,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        dianders@chromium.org, mkrishn@codeaurora.org,
        kalyan_t@codeaurora.org, hoegsberg@chromium.org,
        abhinavk@codeaurora.org, seanpaul@chromium.org
Subject: [v1 2/3] dt-bindings: drm/bridge: ti-sn65dsi86: Document use-aux-backlight
Date:   Wed, 14 Apr 2021 22:09:49 +0530
Message-Id: <1618418390-15055-3-git-send-email-rajeevny@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1618418390-15055-1-git-send-email-rajeevny@codeaurora.org>
References: <1618418390-15055-1-git-send-email-rajeevny@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If the panel connected to the bridge supports backlight control
using DPCD registers on the DisplayPort aux channel, setting
"use-aux-backlight" property in the bridge node will enable the
registration of a DP aux backlight device from the bridge driver.

Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>
---
 .../devicetree/bindings/display/bridge/ti,sn65dsi86.yaml          | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
index 26932d2..c8d8c00 100644
--- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
@@ -58,6 +58,12 @@ properties:
   clock-names:
     const: refclk
 
+  use-aux-backlight:
+    type: boolean
+    description:
+      The panel backlight to be controlled using DPCD registers on
+      the DP aux channel.
+
   gpio-controller: true
   '#gpio-cells':
     const: 2
@@ -188,6 +194,8 @@ examples:
 
         no-hpd;
 
+        use-aux-backlight;
+
         ports {
           #address-cells = <1>;
           #size-cells = <0>;
-- 
2.7.4

