Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 255D23BC421
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jul 2021 01:37:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229698AbhGEXkD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Jul 2021 19:40:03 -0400
Received: from [94.230.151.217] ([94.230.151.217]:58626 "EHLO ixit.cz"
        rhost-flags-FAIL-FAIL-OK-OK) by vger.kernel.org with ESMTP
        id S229686AbhGEXkD (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Jul 2021 19:40:03 -0400
Received: from newone.lan (ixit.cz [94.230.151.217])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ixit.cz (Postfix) with ESMTPSA id 7C13B23B1D;
        Tue,  6 Jul 2021 01:37:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
        t=1625528244;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=rG80caWGeTUbJZKID/uQRb/1vflEBoUd4LT+hXPL6oc=;
        b=xODJsAnnxia9rfe2qeinqiethJnCK+iPI3St6i41UoQGqL2zR+xgerHkJMyBi0cqkMTgRQ
        JpyCt5ijYROUB2p6HX8B/qZFQoHqDonrouZFTJDOY3+PS86yZzyUCJ9UiAISo/+Mzf1hZI
        ZtZb7+N/Dt/O2jX+oH/+LhJNeG2MzEE=
From:   David Heidelberg <david@ixit.cz>
To:     Sean Paul <seanpaul@chromium.org>, robdclark <robdclark@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, David Heidelberg <david@ixit.cz>
Subject: [PATCH v2] drm/msm/dsi: do not use uninitialized kms
Date:   Tue,  6 Jul 2021 01:36:39 +0200
Message-Id: <20210705233639.335951-1-david@ixit.cz>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Without this patch boot ends at NULL ptr exception at msm_dsi_manager_setup_encoder
on devices like Nexus 7 with MDP4 version 4.4.

Fixes: 03436e3ec69c ("drm/msm/dsi: Move setup_encoder to modeset_init")

Signed-off-by: David Heidelberg <david@ixit.cz>
---

v2: typo in Fixes commit reference

 drivers/gpu/drm/msm/dsi/dsi_manager.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 4ebfedc4a9ac..8114612b34b0 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -230,7 +230,7 @@ void msm_dsi_manager_setup_encoder(int id)
 	struct msm_kms *kms = priv->kms;
 	struct drm_encoder *encoder = msm_dsi_get_encoder(msm_dsi);
 
-	if (encoder && kms->funcs->set_encoder_mode)
+	if (encoder && kms && kms->funcs->set_encoder_mode)
 		kms->funcs->set_encoder_mode(kms, encoder,
 					     dsi_mgr_is_cmd_mode(msm_dsi));
 }
-- 
2.30.2

