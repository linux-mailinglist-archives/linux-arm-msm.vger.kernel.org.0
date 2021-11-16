Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D90D45365F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Nov 2021 16:50:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238469AbhKPPxi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Nov 2021 10:53:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238685AbhKPPxg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Nov 2021 10:53:36 -0500
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B3D4C061570;
        Tue, 16 Nov 2021 07:50:39 -0800 (PST)
Received: by mail-pg1-x529.google.com with SMTP id m15so14070347pgu.11;
        Tue, 16 Nov 2021 07:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KtfEqCr30iA7CSbncggiXye/6RodNxBCEnJUOFYB8K0=;
        b=IM7wabwBiOjulh9VwKrHrDiT65SYc++4r2UMHoBHenax/cb57+ZyKJ0jpw/vIrb2ul
         sEAjDmUHi6px5Ooh2jrzHV6NZpj5PMn8Dulz55oeggjfz4Lvye+crp4pRyBrW1KywGUI
         E7+M0EwhSiON5RuzR74bf14Ufj0qTTkHbQOyle2L1qakbABY3B6jP8v7MnsJ5gnslNl2
         XWdUTFCmpOqtiXeFB2lcM+nzUxVRydpAsYh9rZ7LhD0h8xbfFdT1Eu8pG7D9A/ITuLVW
         Z8+4EEHmpeVSvySbdcQvGWOz8HJWTtt+OqDOZN2hzE0K4YfxVWXDfpiifeKzuLtPYrMZ
         T1Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KtfEqCr30iA7CSbncggiXye/6RodNxBCEnJUOFYB8K0=;
        b=a4aE5kzbjHjhQW881cipVklB06YvSN/9E0KNG9rnPHS9SMA6e4tpHpnjT880F+Xfdx
         h4TVNc/1ECu9GQyYXJBsG+B9raSfqZzF7yT3CC3HBJAnbaHlexhXyQ0Nxvbo9f8n1hpi
         0kP/w9f9ZBnPDITMfFSBmiNAY8ugRhpObjatMSLmUVRKtOqY904m2ipNDx+RNM2tpCnC
         NFIOqqL+aanDSDvoOHnmzqFgWwP6XvCTcPG/LjQl2zBn6wkxKHLHQ1h+S3MUg2PvPGLH
         g1tO3v1daaCDmZniqNP7T/es7ShHWYQbz7O+AY2UHYldy1AckigR1YizUjTf9NREbd2z
         vnSA==
X-Gm-Message-State: AOAM5309Iod9JYta8KaJqUVQRWpGJFv2Awj5yKj6ASImGCH9MZA1aR30
        aP4yxsS/7gFoJTSP8ZpfFEM=
X-Google-Smtp-Source: ABdhPJw74w48ZhhsMARMJaXax3jPMXN0iCXXUdMoqDID4avl3jcfqFCetqPHCPQl5OnAwnF8tBJlSQ==
X-Received: by 2002:a63:e614:: with SMTP id g20mr5304045pgh.159.1637077838713;
        Tue, 16 Nov 2021 07:50:38 -0800 (PST)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id lx12sm3054318pjb.5.2021.11.16.07.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Nov 2021 07:50:37 -0800 (PST)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
        David Airlie <airlied@linux.ie>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/scheduler: fix drm_sched_job_add_implicit_dependencies harder
Date:   Tue, 16 Nov 2021 07:55:45 -0800
Message-Id: <20211116155545.473311-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

drm_sched_job_add_dependency() could drop the last ref, so we need to do
the dma_fence_get() first.

Cc: Christian König <christian.koenig@amd.com>
Fixes: 9c2ba265352a drm/scheduler: ("use new iterator in drm_sched_job_add_implicit_dependencies v2")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
Applies on top of "drm/scheduler: fix drm_sched_job_add_implicit_dependencies"
but I don't think that has a stable commit sha yet.

 drivers/gpu/drm/scheduler/sched_main.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 94fe51b3caa2..f91fb31ab7a7 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -704,12 +704,13 @@ int drm_sched_job_add_implicit_dependencies(struct drm_sched_job *job,
 	int ret;
 
 	dma_resv_for_each_fence(&cursor, obj->resv, write, fence) {
-		ret = drm_sched_job_add_dependency(job, fence);
-		if (ret)
-			return ret;
-
 		/* Make sure to grab an additional ref on the added fence */
 		dma_fence_get(fence);
+		ret = drm_sched_job_add_dependency(job, fence);
+		if (ret) {
+			dma_fence_put(fence);
+			return ret;
+		}
 	}
 	return 0;
 }
-- 
2.33.1

