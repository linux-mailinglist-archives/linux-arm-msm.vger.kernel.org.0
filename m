Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 362E22974EA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Oct 2020 18:50:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751383AbgJWQuL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Oct 2020 12:50:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750451AbgJWQuJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Oct 2020 12:50:09 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52D39C0613CE;
        Fri, 23 Oct 2020 09:50:09 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id o3so1673732pgr.11;
        Fri, 23 Oct 2020 09:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1uXztMV6CzErC+X0CDm8LCTZKP5rxlBSqn7eAJozNsI=;
        b=f0Nn5WiLyLBtBxH07Z9KBRTJuSLzWCs+jTGy/kU049U9jAp1fbqipW8NChPvmCBk5N
         lWnSy3bfxYTWE3jsWTRMmCoQ8/U5cTpVg2GCPNjrk25U2NI6dYzLpFx/lOJjBrxKHali
         f++Qdrl157RCb1AdmylhtXZBcvDOR2Xh2W5DR7iWMlQ6GJJMLl2+NJnFLxKTrQjvd0Y1
         schytKj7YWHlSE+cufg0h632swvX1BkmTsJ9RFNoplDrCnN0SUCT9qEeu5yFrlehHshh
         Cws4ljZt39NK7mYHS0sZ8Q0Ct4kmBFJguGCNSvnqcaf0uuDyc0cq+MJQAIYUhzt8u6bZ
         8S5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1uXztMV6CzErC+X0CDm8LCTZKP5rxlBSqn7eAJozNsI=;
        b=SEm/WD+ppB+1Q7KtGhtmlqsgq61ZAtIPDVFgZ3IwO0YKmzn0TBN5nN+BHVFJlhMVPq
         IbAy46Rs+rQaZnJSZ1SRJ0vZT9FNta5L7v4eR3FN3dsohv+ibjA9eTckrkXAf7S2Bkq9
         syw2mO9WwPeTlfbQAdbA/kafJm/SHsvDjS79R41s3MKmw13K0dMvirbIQsbLbrUaIaku
         0uFKBrgw7la8OG6jKAcJGJV+kVGe9u6iXN4Abhq8u8od7y1zyHoFgMytfjIwxNMAv2JE
         OMz7xnoGDTpt+2v/a/vaOFyLPdIlB/uhYm35NPxlH4WPkQEUv3chwkTZ7JNAF0CcpTu3
         rSLw==
X-Gm-Message-State: AOAM5327G/VmnaFqj1oexHgRbZgsGnwobfBrHwQmdYuG+Il8tpPJ0mHy
        jMXIJNSXVRmzPEv2p0e+oqg=
X-Google-Smtp-Source: ABdhPJyfs5XJq4nPYCeSegrbmFk0k/QvCb6Z1uDuv3fx+Xwxb1dtd3NqyOCeA+6v6xG1aXlkHid0XQ==
X-Received: by 2002:a63:2547:: with SMTP id l68mr2716807pgl.241.1603471808809;
        Fri, 23 Oct 2020 09:50:08 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id c187sm2922270pfc.153.2020.10.23.09.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 09:50:07 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        "Kristian H . Kristensen" <hoegsberg@google.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Eric Anholt <eric@anholt.net>, Sam Ravnborg <sam@ravnborg.org>,
        Emil Velikov <emil.velikov@collabora.com>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Sharat Masetty <smasetty@codeaurora.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 01/23] drm/msm: Fix a couple incorrect usages of get_vaddr_active()
Date:   Fri, 23 Oct 2020 09:51:02 -0700
Message-Id: <20201023165136.561680-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201023165136.561680-1-robdclark@gmail.com>
References: <20201023165136.561680-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

The microcode bo's should never be madvise(WONTNEED), so these should
not be using msm_gem_get_vaddr_active().

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Kristian H. Kristensen <hoegsberg@google.com>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index c941c8138f25..2180650a03bc 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -426,7 +426,7 @@ static int a5xx_preempt_start(struct msm_gpu *gpu)
 static void a5xx_ucode_check_version(struct a5xx_gpu *a5xx_gpu,
 		struct drm_gem_object *obj)
 {
-	u32 *buf = msm_gem_get_vaddr_active(obj);
+	u32 *buf = msm_gem_get_vaddr(obj);
 
 	if (IS_ERR(buf))
 		return;
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 8915882e4444..16eaaf0804ca 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -522,7 +522,7 @@ static int a6xx_cp_init(struct msm_gpu *gpu)
 static void a6xx_ucode_check_version(struct a6xx_gpu *a6xx_gpu,
 		struct drm_gem_object *obj)
 {
-	u32 *buf = msm_gem_get_vaddr_active(obj);
+	u32 *buf = msm_gem_get_vaddr(obj);
 
 	if (IS_ERR(buf))
 		return;
-- 
2.26.2

