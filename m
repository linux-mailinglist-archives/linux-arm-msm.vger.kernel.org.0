Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8396E3BE88B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jul 2021 15:09:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231551AbhGGNLs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Jul 2021 09:11:48 -0400
Received: from ixit.cz ([94.230.151.217]:41768 "EHLO ixit.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229829AbhGGNLs (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Jul 2021 09:11:48 -0400
Received: from newone.lan (unknown [94.230.151.217])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ixit.cz (Postfix) with ESMTPSA id 1561B23B1D;
        Wed,  7 Jul 2021 15:09:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
        t=1625663346;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=9Fquc6eq6ynC231amDZ+0x8KbvmH+e3fTNVu3tYCrHo=;
        b=0cYXtXJCDo1IEXYJzd6sqLB7bnz4IiWDw8e4GFFsu9fs6SnF5tBMPCvr4BsR78w6yJctEP
        SKejhXPVBz52rsVktXZhq/MOJchC9mSrTHOeyG7eh7FEEZ4nC+p5a/bBVw2uWhzTaYuZPw
        QcCfmIEbtNaY4z1sMiDQ+/lhQJJd1dA=
From:   David Heidelberg <david@ixit.cz>
To:     Sean Paul <seanpaul@chromium.org>, robdclark <robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, David Heidelberg <david@ixit.cz>
Subject: [PATCH] drm/msi/mdp4: populate priv->kms in mdp4_kms_init
Date:   Wed,  7 Jul 2021 15:08:20 +0200
Message-Id: <20210707130820.22777-1-david@ixit.cz>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Without this fix boot throws NULL ptr exception at msm_dsi_manager_setup_encoder
on devices like Nexus 7 2013 (MDP4 v4.4).

Tested on Nexus 7 2013, kernels LTS 5.10 and 5.4.

Fixes: 03436e3ec69c ("drm/msm/dsi: Move setup_encoder to modeset_init")

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 0712752742f4..94b64e82666d 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -412,6 +412,7 @@ struct msm_kms *mdp4_kms_init(struct drm_device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev->dev);
 	struct mdp4_platform_config *config = mdp4_get_config(pdev);
+	struct msm_drm_private *priv = dev->dev_private;
 	struct mdp4_kms *mdp4_kms;
 	struct msm_kms *kms = NULL;
 	struct msm_gem_address_space *aspace;
@@ -431,7 +432,8 @@ struct msm_kms *mdp4_kms_init(struct drm_device *dev)
 		goto fail;
 	}
 
-	kms = &mdp4_kms->base.base;
+	priv->kms = &mdp4_kms->base.base;
+	kms = priv->kms;
 
 	mdp4_kms->dev = dev;
 
-- 
2.30.2

