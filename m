Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A8D8A2156
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2019 18:51:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727388AbfH2QvD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Aug 2019 12:51:03 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:41225 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726973AbfH2QvD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Aug 2019 12:51:03 -0400
Received: by mail-wr1-f67.google.com with SMTP id j16so4142344wrr.8;
        Thu, 29 Aug 2019 09:51:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=00lufN6/yFhKzY8yCZ1Zaqb6ynWRRTw3i9KZWm+zVP8=;
        b=E2qga6MNpOWB1suPx/dJQ2joS9HN2DV3ByjIAFh9U0ImDr24pUDSqrbMMNQCFfKnik
         +fS5wijei9QlCpT06019cOW+3Fjkt2Pwvip+15ddu0hLucrwh4hyxPlijH40EItvAzW5
         b16+f+8FrskE9C0zg0gI/XY9q/pfuu1m7Z6cIxfyiP+NlYzFEYeO/LGkaGVsYN9TL9E9
         E3FNtEbpF41RmS3/CXqYNreE7K3/zG6Q3iwmRTVzo5nxOToZZk+VmLg64aOYDnVNcadu
         2R48oNKIC5gYb7QtUM5/Q4rNanulJ6S45EfThH2I7/TuoOdI6CVO8Qhk23Min7u96CBG
         RM9A==
X-Gm-Message-State: APjAAAUHv+QlYO1jizub1iZZ2WxstWh01vB+JENmVX5ZnE4GsqMmq6DA
        seLc3PAYc+qjipyvATGHRySejp75
X-Google-Smtp-Source: APXvYqyPKtvs3/y+/g1peheuDwssaBYOP5BrKJo6vn3H4ALHasc8rVAIQIAnrElN3DD1/7ZpOTFEnQ==
X-Received: by 2002:a5d:6a45:: with SMTP id t5mr10701889wrw.228.1567097460777;
        Thu, 29 Aug 2019 09:51:00 -0700 (PDT)
Received: from green.intra.ispras.ru (bran.ispras.ru. [83.149.199.196])
        by smtp.googlemail.com with ESMTPSA id o14sm8340770wrg.64.2019.08.29.09.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 09:51:00 -0700 (PDT)
From:   Denis Efremov <efremov@linux.com>
To:     linux-kernel@vger.kernel.org
Cc:     Denis Efremov <efremov@linux.com>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, Joe Perches <joe@perches.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v3 02/11] drm/msm: remove unlikely() from WARN_ON() conditions
Date:   Thu, 29 Aug 2019 19:50:16 +0300
Message-Id: <20190829165025.15750-2-efremov@linux.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190829165025.15750-1-efremov@linux.com>
References: <20190829165025.15750-1-efremov@linux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

"unlikely(WARN_ON(x))" is excessive. WARN_ON() already uses unlikely()
internally.

Signed-off-by: Denis Efremov <efremov@linux.com>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Joe Perches <joe@perches.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c | 4 ++--
 drivers/gpu/drm/msm/disp/mdp_format.c    | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c
index 4804cf40de14..030279d7b64b 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c
@@ -253,7 +253,7 @@ int mdp5_ctl_set_cursor(struct mdp5_ctl *ctl, struct mdp5_pipeline *pipeline,
 	u32 blend_cfg;
 	struct mdp5_hw_mixer *mixer = pipeline->mixer;
 
-	if (unlikely(WARN_ON(!mixer))) {
+	if (WARN_ON(!mixer)) {
 		DRM_DEV_ERROR(ctl_mgr->dev->dev, "CTL %d cannot find LM",
 			ctl->id);
 		return -EINVAL;
@@ -695,7 +695,7 @@ struct mdp5_ctl_manager *mdp5_ctlm_init(struct drm_device *dev,
 		goto fail;
 	}
 
-	if (unlikely(WARN_ON(ctl_cfg->count > MAX_CTL))) {
+	if (WARN_ON(ctl_cfg->count > MAX_CTL)) {
 		DRM_DEV_ERROR(dev->dev, "Increase static pool size to at least %d\n",
 				ctl_cfg->count);
 		ret = -ENOSPC;
diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
index 8afb0f9c04bb..5495d8b3f5b9 100644
--- a/drivers/gpu/drm/msm/disp/mdp_format.c
+++ b/drivers/gpu/drm/msm/disp/mdp_format.c
@@ -174,7 +174,7 @@ const struct msm_format *mdp_get_format(struct msm_kms *kms, uint32_t format,
 
 struct csc_cfg *mdp_get_default_csc_cfg(enum csc_type type)
 {
-	if (unlikely(WARN_ON(type >= CSC_MAX)))
+	if (WARN_ON(type >= CSC_MAX))
 		return NULL;
 
 	return &csc_convert[type];
-- 
2.21.0

