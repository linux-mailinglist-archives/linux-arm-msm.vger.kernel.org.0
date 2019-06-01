Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC4A731917
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Jun 2019 04:43:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726708AbfFACnh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 May 2019 22:43:37 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:39046 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726634AbfFACnh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 May 2019 22:43:37 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id AB47860AD1; Sat,  1 Jun 2019 02:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1559357016;
        bh=EIGdHRTGMSH8BrR4fNTW/L7YHCj/dHmkgWPz/8baTkk=;
        h=From:To:Cc:Subject:Date:From;
        b=kzjqUEITrbZXR8nDM/ieBr3arNCD85iak0qOLuY92dXcPaNvKxX+Erwn5ygm+JQ7n
         neSiKTiSVcdphc/E3JsaM4mbLcU+Bv/Mi90VrG5Jz+xGVuRrZlF+PQN1J2C5qILLEy
         hU2+eNlNXaIYyLux0nz5I+X0n5HUylmh4ErqFrA4=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from abhinavk-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8CFBB60312;
        Sat,  1 Jun 2019 02:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1559357015;
        bh=EIGdHRTGMSH8BrR4fNTW/L7YHCj/dHmkgWPz/8baTkk=;
        h=From:To:Cc:Subject:Date:From;
        b=FaulWKHrxQedjqxTPLe7lPVM3Ogjdr7ayPTSHSYQ9X/dQs5BadNcsH14fFIEFH2E1
         P+h8Q4MiYuATcH54SupiS9EeHuQlCYuiahOVeqh9EkWryU7B+w+t+Ac8Ol5CwGb+et
         CIV57FL+ART+JjJa95Jbtpw3gR7uyXSKfOJ4UgKs=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8CFBB60312
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=abhinavk@codeaurora.org
From:   Abhinav Kumar <abhinavk@codeaurora.org>
To:     dri-devel@lists.freedesktop.org
Cc:     Abhinav Kumar <abhinavk@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, robdclark@gmail.com,
        jsanka@codeaurora.org, seanpaul@chromium.org,
        nganji@codeaurora.org, chandanu@codeaurora.org,
        hoegsberg@google.com
Subject: [PATCH v2] drm/msm/dsi: add protection against NULL dsi device
Date:   Fri, 31 May 2019 19:43:27 -0700
Message-Id: <1559357007-21004-1-git-send-email-abhinavk@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When panel probe happens after DSI probe, the DSI probe is deferred as
per current design. In the probe defer path dsi device is destroyed.
This NULL dsi device could be deferenced by the panel probe in the
mipi_dsi_attach path.

Check for NULL dsi device before accessing it.

Changes in v2:
 - Add more comments on how this NULL pointer situation will be hit

Reported-by: Jeffrey Hugo <jhugo@codeaurora.org>
Tested-by: Jeffrey Hugo <jhugo@codeaurora.org>
Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 80aa634..8fcb13f 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -769,7 +769,7 @@ bool msm_dsi_manager_cmd_xfer_trigger(int id, u32 dma_base, u32 len)
 void msm_dsi_manager_attach_dsi_device(int id, u32 device_flags)
 {
 	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
-	struct drm_device *dev = msm_dsi->dev;
+	struct drm_device *dev;
 	struct msm_drm_private *priv;
 	struct msm_kms *kms;
 	struct drm_encoder *encoder;
@@ -781,7 +781,17 @@ void msm_dsi_manager_attach_dsi_device(int id, u32 device_flags)
 	 * (generally the case when we're connected to a drm_panel of the type
 	 * mipi_dsi_device), this would be NULL. In such cases, try to set the
 	 * encoder mode in the DSI connector's detect() op.
+	 *
+	 * msm_dsi pointer is assigned to a valid dsi device only when
+	 * msm_dsi_manager_register() succeeds. When panel hasnt probed yet
+	 * dsi_mgr_setup_components() could potentially return -EDEFER and
+	 * assign the msm_dsi->dev to NULL. When the panel now probes and calls
+	 * mipi_dsi_attach(), this will call msm_dsi_manager_attach_dsi_device()
+	 * which will result in a NULL pointer dereference
 	 */
+
+	dev = msm_dsi ? msm_dsi->dev : NULL;
+
 	if (!dev)
 		return;
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

