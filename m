Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D062259A02
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Sep 2020 18:46:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731087AbgIAQqW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Sep 2020 12:46:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732042AbgIAQqU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Sep 2020 12:46:20 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29A36C061244;
        Tue,  1 Sep 2020 09:46:20 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id ls14so886259pjb.3;
        Tue, 01 Sep 2020 09:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7KAgNczSpcXSENE7I7HLjPQLwLd/js6kuYT9gLzGMrc=;
        b=MeCm/VYIOe9iYCLfeugzAyL6okJVgG4svLLFNAlw6jwgFSHyxPJTfOhTGLcz+3lmt8
         4Nqb/t7ulGZyBaw+FLZqWnrRTKBHvyy8wk23mtc6mtN1c8ky08w+sHTi6lVuP3a6fRMa
         z6AU4iKXMyPFlrW+d0VSVrr0seFt//Be6gxXDKFsj9k7weplTuaHXFwZvzNqYacw4zb1
         MZoK6jiacE9P6k33ODJiryhUWGzVv8aO5rd2g9ZTMVvwrNpOnaIIPLlHwcAo2RlyKhpw
         d+n7xR/mD2Z78MSBOTKNGKlfBllUivdl7eWaHPAFceBf1i0d+ImM8e50nQfOJw6qsL7c
         0JaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7KAgNczSpcXSENE7I7HLjPQLwLd/js6kuYT9gLzGMrc=;
        b=Wm/RpGYZfSTAo0LVM6IVmPlOLR65kRuU+8ORxGkai+o5jPPveK9kfjFdXUO5ZQ+qAj
         7IlfeMlxnWffAqHeonTd1J0LRs3mYkQXkxNyvH5mgIAFh+dvzKuTA9knJTpULnIl1+DN
         qBzWnPFfTAt7lIWLnEzamCGqjkTCIn0XoXqvWaA+0aHku/MpABPXUE95eWbEr6jxIiT2
         xZ8AZl3+uR4G/igdwxcIEYJW12w3CXljpa5L1RoSz9yB46gGbm5qSDdcFDJnT4xpjtiw
         YxPzYtfxjZ8HXQLW2n03G/rw986wFwDV3E+3RxhCCn0dY5aicsn0ZB7VJjyHJ6xnOjll
         4efw==
X-Gm-Message-State: AOAM530IY0/7iJKrv67RbLnUyQ+a6WSki+mftdPEcbter/HvDSKOqVpo
        qNNLL/S5HCX9uLt3o9EOrp4=
X-Google-Smtp-Source: ABdhPJwjrPAmB1IlUhm3/lAYNFCsGsLfWotZDUGXrh1rk+DjB79F8gK6EHU9pv/Qpy7KR0JW5A12Mg==
X-Received: by 2002:a17:902:8307:: with SMTP id bd7mr2134655plb.159.1598978779659;
        Tue, 01 Sep 2020 09:46:19 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id p20sm1967660pjz.49.2020.09.01.09.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 09:46:18 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
        linux-arm-msm@vger.kernel.org, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v16 01/20] drm/msm: Remove dangling submitqueue references
Date:   Tue,  1 Sep 2020 09:46:18 -0700
Message-Id: <20200901164707.2645413-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200901164707.2645413-1-robdclark@gmail.com>
References: <20200901164707.2645413-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Currently it doesn't matter, since we free the ctx immediately.  But
when we start refcnt'ing the ctx, we don't want old dangling list
entries to hang around.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/gpu/drm/msm/msm_submitqueue.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index a1d94be7883a..90c9d84e6155 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -49,8 +49,10 @@ void msm_submitqueue_close(struct msm_file_private *ctx)
 	 * No lock needed in close and there won't
 	 * be any more user ioctls coming our way
 	 */
-	list_for_each_entry_safe(entry, tmp, &ctx->submitqueues, node)
+	list_for_each_entry_safe(entry, tmp, &ctx->submitqueues, node) {
+		list_del(&entry->node);
 		msm_submitqueue_put(entry);
+	}
 }
 
 int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
-- 
2.26.2

