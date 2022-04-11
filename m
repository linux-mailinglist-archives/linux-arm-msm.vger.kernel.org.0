Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21B554FC702
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Apr 2022 23:58:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350263AbiDKWAj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Apr 2022 18:00:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350264AbiDKWAj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Apr 2022 18:00:39 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 187B511C02;
        Mon, 11 Apr 2022 14:58:24 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id c23so15077721plo.0;
        Mon, 11 Apr 2022 14:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tAkFR+6vhq0o/UUKOqeWc9uPJoN5WXdSoZFQuuhB/hI=;
        b=BVAdqHYdjgRDHToJmUjlWr1WJiW8u4kwQFY6dwLmE9EMWP13SbsQQdQGBdhzMJxAyo
         BPxrqDtdxL3W3u35q0PXTqfgpXcoRJ4MzivwkAtgqY3uw7PaAnpUbSWi7t1ISrnW+HSJ
         pjmiLq2iiiuIzKhKZJIa316Mlfk773qV7x9biGJX54TQMn4HpNetx9cbPn3JVupXmoR8
         t4W/4kY99yX4BsD5BB/25GZBg4EFdILkT2TXgGziKg3mir6RWhCHXyBUjxnafbH9BSps
         Ag2iCEdxn7EqSl4fYVM5ODa4776/3AGho+7h1A6cAOgoqtg0cvcfVNfVabLGIgSAWUo6
         PTWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tAkFR+6vhq0o/UUKOqeWc9uPJoN5WXdSoZFQuuhB/hI=;
        b=DaUcTuhKO/T/dOtEcQ0YxG76qIlX+JPm54RhCiAoJ9cinSfsHFXThb4b2p0vPlcldA
         fvDiIdgMDw2FngzojSWNl9vK2aChsIUP1/mbYQyLUZd4sbyC+mxjXrCUp0VfrRTwN9tQ
         9yrUKvJ1FDPicFXLL6PkAAjZl+vwg2vV3cyEJsmsljgAquaKFTzB5B5fSusr1CWlKXkW
         icIy/nEp1tUHKaFMLGX7VtwP/8gaoLg2kHFdsKq8YclAN6yyB5nTrms5ofAkFwf8fWd7
         fVvkBnncfsXaRH5sR6CunNFDyUZHjr6xBZfPyJUCDiRyvQUX9g1FqWWjS/u+fCB4wIj1
         0ZRA==
X-Gm-Message-State: AOAM530bRg4ToUgHpAJQEWfNPetsk1ts+ujhFk/7e9oorLjHxTBZ2Vgu
        RNqYEvR767jCbS5ToJbc1aY=
X-Google-Smtp-Source: ABdhPJxNCwWDB9v3U/Ie32ovHq1HTYiwkwWYce1aYR2ERIaJqRWChN3IzYNAaPnGp53xn1g5gZmoGQ==
X-Received: by 2002:a17:903:41c2:b0:158:83f7:f8a9 with SMTP id u2-20020a17090341c200b0015883f7f8a9mr1442985ple.146.1649714303486;
        Mon, 11 Apr 2022 14:58:23 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
        by smtp.gmail.com with ESMTPSA id k15-20020a63ab4f000000b00381eef69bfbsm652869pgp.3.2022.04.11.14.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 14:58:22 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 04/10] drm/msm/gem: Split out inuse helper
Date:   Mon, 11 Apr 2022 14:58:33 -0700
Message-Id: <20220411215849.297838-5-robdclark@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220411215849.297838-1-robdclark@gmail.com>
References: <20220411215849.297838-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Prep for a following patch, where it gets a bit more complicated.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c     | 2 +-
 drivers/gpu/drm/msm/msm_gem.h     | 1 +
 drivers/gpu/drm/msm/msm_gem_vma.c | 9 +++++++--
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index a4f61972667b..f96d1dc72021 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -938,7 +938,7 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m,
 				name, comm ? ":" : "", comm ? comm : "",
 				vma->aspace, vma->iova,
 				vma->mapped ? "mapped" : "unmapped",
-				vma->inuse);
+				msm_gem_vma_inuse(vma));
 			kfree(comm);
 		}
 
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 947ff7d9b471..1b7f0f0b88bf 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -61,6 +61,7 @@ struct msm_gem_vma {
 int msm_gem_init_vma(struct msm_gem_address_space *aspace,
 		struct msm_gem_vma *vma, int npages,
 		u64 range_start, u64 range_end);
+bool msm_gem_vma_inuse(struct msm_gem_vma *vma);
 void msm_gem_purge_vma(struct msm_gem_address_space *aspace,
 		struct msm_gem_vma *vma);
 void msm_gem_unmap_vma(struct msm_gem_address_space *aspace,
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 64906594fc65..dc2ae097805e 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -37,6 +37,11 @@ msm_gem_address_space_get(struct msm_gem_address_space *aspace)
 	return aspace;
 }
 
+bool msm_gem_vma_inuse(struct msm_gem_vma *vma)
+{
+	return !!vma->inuse;
+}
+
 /* Actually unmap memory for the vma */
 void msm_gem_purge_vma(struct msm_gem_address_space *aspace,
 		struct msm_gem_vma *vma)
@@ -44,7 +49,7 @@ void msm_gem_purge_vma(struct msm_gem_address_space *aspace,
 	unsigned size = vma->node.size << PAGE_SHIFT;
 
 	/* Print a message if we try to purge a vma in use */
-	if (GEM_WARN_ON(vma->inuse > 0))
+	if (GEM_WARN_ON(msm_gem_vma_inuse(vma)))
 		return;
 
 	/* Don't do anything if the memory isn't mapped */
@@ -100,7 +105,7 @@ msm_gem_map_vma(struct msm_gem_address_space *aspace,
 void msm_gem_close_vma(struct msm_gem_address_space *aspace,
 		struct msm_gem_vma *vma)
 {
-	if (GEM_WARN_ON(vma->inuse > 0 || vma->mapped))
+	if (GEM_WARN_ON(msm_gem_vma_inuse(vma) || vma->mapped))
 		return;
 
 	spin_lock(&aspace->lock);
-- 
2.35.1

