Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 055093B31FD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jun 2021 16:57:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232285AbhFXPAM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Jun 2021 11:00:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232300AbhFXPAK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Jun 2021 11:00:10 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FD44C061760
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jun 2021 07:57:50 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id u2so2881879ljo.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jun 2021 07:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4naGYo6Q7vXKVyJFMwcq6Oq3/UZm+MxRt8NyXrzXPuc=;
        b=b5Hb6gwlVgE7E9fxC+jhksQM3CacT3Ee6wIxCO13yES6cmq1+Bbv8XdeJS2xvX0KPy
         PTYO7f78kcfA0heSnreu8XuKWPgKbl7iEKlkD5RvKvvJRv0lamgXKusE7aVtr1qjnKhJ
         ze//Csgb+Kr0zTp5r+ucjAUc1M0ds+SPafSqVCK2jy2aRJcO1vnPxOseAQYVI9yFAeM1
         ton8nZ1ywugAr93GNZ7VE0XdWX4nK/n8lAKqZ1henNgcloTJapbya73DBZpJa8/HuKEa
         OP79Ki8flUDDReVM+sAbi3vKmG1O+PxbSslsfbUTAtZMGffedlNEDWK7BR133009ENE2
         eUgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4naGYo6Q7vXKVyJFMwcq6Oq3/UZm+MxRt8NyXrzXPuc=;
        b=cvJ5l7gTICXOEtiVgcbfDrOTImdeFpy8YJfYgSmbOcmKysVqR0fDkxXGYYoqacYU1h
         3Z5FtU1wuEXBwWz9yj8S09gFtWp4JIQRRyKb7nzaBgnk5WEr81Mt/UKjGclfPkx59GZX
         eHKdqkkdRcB7ivLTafx0J3tvSzZDV5Fu84u/ou7VbYvMwdgzOxvjN4h7/fXEdg++wZ9N
         Gvnui/duPxkckwvdot4fiTIFbuQYwwnGYzmv3yK3/avj48ai29daFnCJF7MawHqUheBH
         q35wtwYQYyKSAQShh9danA9XW8AeLGCg0LCF5uOtfJAwRGrSDvRKhWxSaw3f7uuBlsfX
         180Q==
X-Gm-Message-State: AOAM5331aFg11Ma0qOKY2Ff32tVASiAxO7mA+bbfYHXLGzV4H5GJPjE/
        slyaWWTTsiwp+MgVfM2qKSyuZQ==
X-Google-Smtp-Source: ABdhPJxUoVSVazVY3Zn8HYTwVgBxA3JQEQAxELpvDBRiC5HLPvm4PS/M8kT8Xo2G3ecdzf4RsM23sQ==
X-Received: by 2002:a2e:8748:: with SMTP id q8mr891051ljj.508.1624546668845;
        Thu, 24 Jun 2021 07:57:48 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id e17sm306329ljn.125.2021.06.24.07.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 07:57:48 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 14/17] drm/msm/dpu: do not limit the zpos property
Date:   Thu, 24 Jun 2021 17:57:30 +0300
Message-Id: <20210624145733.2561992-15-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210624145733.2561992-1-dmitry.baryshkov@linaro.org>
References: <20210624145733.2561992-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Stop limiting zpos property values, we use normalized_zpos anyway. And
nothing stops userspace from assigning several planes to a single zpos
(it is a userspace bug, but the kernel is forgiving about it).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 4658410eedfb..8a8727ff7645 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -44,7 +44,6 @@
 #define DPU_NAME_SIZE  12
 
 #define DPU_PLANE_COLOR_FILL_FLAG	BIT(31)
-#define DPU_ZPOS_MAX 255
 
 /* multirect rect index */
 enum {
@@ -1375,7 +1374,6 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 	struct dpu_plane *pdpu;
 	struct msm_drm_private *priv = dev->dev_private;
 	struct dpu_kms *kms = to_dpu_kms(priv->kms);
-	int zpos_max = DPU_ZPOS_MAX;
 	uint32_t num_formats;
 	int ret = -EINVAL;
 
@@ -1413,14 +1411,7 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 
 	pdpu->catalog = kms->catalog;
 
-	if (kms->catalog->mixer_count &&
-		kms->catalog->mixer[0].sblk->maxblendstages) {
-		zpos_max = kms->catalog->mixer[0].sblk->maxblendstages - 1;
-		if (zpos_max > DPU_STAGE_MAX - DPU_STAGE_0 - 1)
-			zpos_max = DPU_STAGE_MAX - DPU_STAGE_0 - 1;
-	}
-
-	ret = drm_plane_create_zpos_property(plane, 0, 0, zpos_max);
+	ret = drm_plane_create_zpos_property(plane, 0, 0, 255);
 	if (ret)
 		DPU_ERROR("failed to install zpos property, rc = %d\n", ret);
 
-- 
2.30.2

