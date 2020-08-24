Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABC2E2507F4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Aug 2020 20:41:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726502AbgHXSlu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Aug 2020 14:41:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725780AbgHXSlp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Aug 2020 14:41:45 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D0E1C061573;
        Mon, 24 Aug 2020 11:41:45 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id l191so2883240pgd.5;
        Mon, 24 Aug 2020 11:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fFdgtfwZrc/kVc+fLHaAXwOBlYLh1Scshg8PrDPV2cA=;
        b=JMBfFYqJssdNSpKeUnYwIYl16ci2D3KflwOOxfvM3CU9HPQiYllCH5sZjJPFSv7cRc
         1fmivhMx1dEE/3e/XzIlSNWneWOqC/cCvVnVehH+9VJW3f5N31ucofST7kI3KW1XQgdB
         XiVWya9r4ICUQOX0+77Xay6fR0AFrkVucVF5OuTzI33dNbktUe5Hebd1IK78Ddv7K0IA
         r7LUfRXepbKvcNwNwlw/U1uBZVkJDUrROyPnBnj5pJvPHyQFrEl4PjqHT/hYiP/4sZTq
         cb39WH8a6lTBuxtGkHAJ5OuHyeEqK5qDSMvNljF0qeTrTb0JeWGON4CMxhGVL+tnWK7m
         EGsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fFdgtfwZrc/kVc+fLHaAXwOBlYLh1Scshg8PrDPV2cA=;
        b=a79Fj1kvf0jCRWDzyZxn6m4qhxCU+UM/ZNldsMdW5dM2ARSwfjv93dOfa3mljtqBRZ
         DIMxE22dvgUpR9mD9RccuiJBG1NgQeVW+5XCUZzfw9O6P4+aO9Pkcnssv+qJym7uzFl8
         tIBe9XVLPopNvilGBLHtmlU+vG7v14/bLxmUXnMcbbMirK1299JbKcScmsnJbrz75K2J
         O8ZqUzkpHtwpPWDCR2qYpU6TbIMgnjjMbFXFxKH1qcQnc5WkwOgtnFSJueBw7o+iAdhy
         TJstUDbf2NWh0IXxXpVST4vl0ibCb4rDf1IZ46a/Ik46qp9yQybMEoTzz3Bou7gogpc3
         XFMQ==
X-Gm-Message-State: AOAM530XwdI952C/F00l+Hjb6tfFYJAnKgYGJoFUxJxgxnfGMMLCH44i
        d3zFrZA2wiyZ7LfkjjI7SMk=
X-Google-Smtp-Source: ABdhPJzrk/w8HSHD4F2CriYbzO3IkcbXkvduywKAs1ONUCGEOtsuxUrphk9jrVQS3ajL5jYLaF+wQw==
X-Received: by 2002:a63:f44d:: with SMTP id p13mr4124438pgk.363.1598294504582;
        Mon, 24 Aug 2020 11:41:44 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id b23sm11949461pfo.12.2020.08.24.11.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2020 11:41:43 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org
Cc:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Will Deacon <will@kernel.org>, freedreno@lists.freedesktop.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Clark <robdclark@chromium.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Ben Dooks <ben.dooks@codethink.co.uk>,
        Brian Masney <masneyb@onstation.org>,
        Eric Anholt <eric@anholt.net>, Joerg Roedel <jroedel@suse.de>,
        John Stultz <john.stultz@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 01/20] drm/msm: remove dangling submitqueue references
Date:   Mon, 24 Aug 2020 11:37:35 -0700
Message-Id: <20200824183825.1778810-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200824183825.1778810-1-robdclark@gmail.com>
References: <20200824183825.1778810-1-robdclark@gmail.com>
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

