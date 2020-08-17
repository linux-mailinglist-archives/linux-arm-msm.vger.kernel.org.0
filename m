Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80CFA247972
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Aug 2020 00:02:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728238AbgHQWCG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Aug 2020 18:02:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728131AbgHQWB7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Aug 2020 18:01:59 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 717E1C061389;
        Mon, 17 Aug 2020 15:01:59 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id u20so8925838pfn.0;
        Mon, 17 Aug 2020 15:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1FUoAbvyEKIH5lQKuzluOyz2/ynwOKVUIX8AS+w28WA=;
        b=h6YW9JuqbTq3TVlabwhWg4aAs/38VC0PkSQiYw06ptTsQl3LD5i77zZ+MuC3Pl0b3D
         MKzgD/leyspk69W2ODEpbH7hnzzoSWLmb/ybePpwsl359AQQN7Hb/yV2qgLPnZCrIo4K
         pQbagMAISi+rGuZeV9gGyVKBf3hqVW8hNFkAbcoGs5xWfz6MmEQYRt/vfhiGnW1gbQps
         SqcMH6r+kTFmgfpgUm2HlNhlpLJjfOLZGCSsPtVXizkudwJi6QfH73qJdSeR0H4Thl80
         PW1sQ23avxHUkoq/c+5W5Xh5UwZno0uOtf+ivkbhFSQU/VR5+PtvY2IRX9Who+KKY6Eu
         Nt2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1FUoAbvyEKIH5lQKuzluOyz2/ynwOKVUIX8AS+w28WA=;
        b=VAlHvYMLyCxmVbIKDtcmUvP8BoxUAq5lELIm8lgCuSXxIuZgS6MTNo3pWtAnG7/XV7
         ZDODM/U1QulLP1Sl6UhZoTNe8RVmVO2KBk207sXKGGIfv2CsYWSzqTDww2610Cv/lUHa
         MI1Hym3aunQTqt/t176uDlhcclkdCPN3EMSj1i7O21BWPM5jvJDmbPn83SS8VdNdY9EO
         lFhCMT+w3CB3y6WHJ6dQlDX3mVYJMfEAhS/q9a1zkUn1oCUpn6yihKoctx21IdLWySot
         +KNZ5XTtxW9zPvjO7gIwdQv+Xdl11gPv5+fvz/asFQ/lEM5UMHx/KGtHSQU1ZadyWbKW
         Rl9w==
X-Gm-Message-State: AOAM532R9mkByw5H3AUaCMULXv8O+jZ0kE+xqI51GT/SaSrQbUxOoKVI
        Derx9clePs6CVyiy/JFg2o8=
X-Google-Smtp-Source: ABdhPJwfBXHxP+FFJVxeGXrje9tQpj2dyq/Q74AQSixL9Uv0RglMKQZR9H8ViHvx/RDZCaxe40EtUw==
X-Received: by 2002:a62:fc08:: with SMTP id e8mr12486387pfh.208.1597701718956;
        Mon, 17 Aug 2020 15:01:58 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id j8sm21721753pfh.90.2020.08.17.15.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 15:01:57 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
        linux-arm-msm@vger.kernel.org
Cc:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Will Deacon <will@kernel.org>, freedreno@lists.freedesktop.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 01/20] drm/msm: remove dangling submitqueue references
Date:   Mon, 17 Aug 2020 15:01:26 -0700
Message-Id: <20200817220238.603465-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200817220238.603465-1-robdclark@gmail.com>
References: <20200817220238.603465-1-robdclark@gmail.com>
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

