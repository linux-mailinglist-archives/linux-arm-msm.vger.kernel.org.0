Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F214735462F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Apr 2021 19:42:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239169AbhDERmT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Apr 2021 13:42:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239180AbhDERmR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Apr 2021 13:42:17 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C94CCC061756;
        Mon,  5 Apr 2021 10:42:09 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id l76so8560183pga.6;
        Mon, 05 Apr 2021 10:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KzM5ykbDnSnt9IUX0aCvytu48YxBoDL+JwZURK1Yqus=;
        b=Z0xSUkgI/WnrPAodBPqs+x45wcrk9D0f0oyWOT/WBVmpPS2gFwzXSmuqpv9fgM+CCK
         bOBmmjpJteJ4x2fRDhs/jGyki8WpaRuMhQV5O2QwlCyETHmPgm/q6NaaM7t5nUl5oFP9
         QyEzWAsMLPd3i36askiG7v8AbWGkTHS16PKij6lgBQN6yXcLlcHnYZcZ5zGTucCKqtfq
         brZLla4UxnvNcmosZ1INhprIw8wlgvprJyzwcSWJdbushazMjhtWxHrlwZ1h4yrP12XX
         XNsOcF2N74c7FeyccETZN8JespLGqUPuPjE/K9I3Olf8fqEXlQQHi9SIYRFCYTWhbWuC
         GZgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KzM5ykbDnSnt9IUX0aCvytu48YxBoDL+JwZURK1Yqus=;
        b=Hw8tpY6OQQwNTZtuyVE6jBXx51CUmsEXJf/3BFg7P86VZ1VjiVV9A3wXdTAl3WjmJO
         LopzNQFTH6CXMr7wbs7L4afEu9ndGqu9zfEQlew+y9lL0xxLn7qOscRht/GSWoBMH8zY
         aSU/LslC3HsMNbAQViGvnzO3WDScCaMnn/FBvj9I+LtkOl0R2e6T9lkoypxsG+H+l59m
         AUUg/JJlQ86x5K098lRHDcg5Zka8BnOBeKCTfBhge8NN0aiohGHA+ahAYC3QgphZI2CS
         yodv+Lpb6srJey1aUaPfFzC4JTl6fA3L/Xv2mLt3pMAMM3YfMn6mncUH0dh82rrbe1V6
         FhVg==
X-Gm-Message-State: AOAM532DY3i38U8EWw0DcsrkLXl4ACZnfFjHkFOhDP+6hEbnT/xphsvU
        e5WY0D/PF2Q/3eqXK7ZaCw3KnWSG1G1fOQ==
X-Google-Smtp-Source: ABdhPJzQJZ7Z8aP6IlzpwDtucp4npu08KOLRLatwk+FA1xci/wuxVncqz9GxQBRoFBJhqtMILWq4pA==
X-Received: by 2002:a65:5b47:: with SMTP id y7mr24029635pgr.119.1617644529404;
        Mon, 05 Apr 2021 10:42:09 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id b84sm16959829pfb.162.2021.04.05.10.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 10:42:08 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Jordan Crouse <jordan@cosmicpenguin.net>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 3/8] drm/msm: Clear msm_obj->sgt in put_pages()
Date:   Mon,  5 Apr 2021 10:45:26 -0700
Message-Id: <20210405174532.1441497-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210405174532.1441497-1-robdclark@gmail.com>
References: <20210405174532.1441497-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Currently this doesn't matter since we keep the pages pinned until the
object is destroyed.  But when we start unpinning pages to allow objects
to be evicted to swap, it will.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index d5abe8aa9978..71530a89b675 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -162,6 +162,7 @@ static void put_pages(struct drm_gem_object *obj)
 
 			sg_free_table(msm_obj->sgt);
 			kfree(msm_obj->sgt);
+			msm_obj->sgt = NULL;
 		}
 
 		if (use_pages(obj))
-- 
2.30.2

