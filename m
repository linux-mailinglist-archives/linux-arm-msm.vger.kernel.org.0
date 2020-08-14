Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 080E8244328
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Aug 2020 04:40:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726609AbgHNCkq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Aug 2020 22:40:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726564AbgHNCkq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Aug 2020 22:40:46 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21A64C061757;
        Thu, 13 Aug 2020 19:40:46 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id c10so5031882pjn.1;
        Thu, 13 Aug 2020 19:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1FUoAbvyEKIH5lQKuzluOyz2/ynwOKVUIX8AS+w28WA=;
        b=C+xR5/svYbw49MY4CeW82SJXbGnX+JNhURW4NRg8W+6hzAFLpOU/my1FRJ5O0gHGWf
         VAlVdoW2esbR7vWEeQUWFH0Jq7GcD+xFsBOUjeG2U9x2SHmPNLxwcvV97RwA1l4fh+i2
         +M/34tH1Wr6XkBaaDg/Jg9eqhDsR+jDTIVk5lXr0M35SPbUSBzfRDX4MI+XsXjmJW5q3
         2sEOICZBbL04zS1AtXchQpXCRnUiNeCTzSTTANAy4nkzofNJgX+QaKLbSAkfsbvzqzyZ
         VjlfYKMGh7pJgaTph9vg4QVkl+kXKsVtraG0hRt1hw5/JDgmMZiwZUh0UUrRcksHgXH1
         Jdiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1FUoAbvyEKIH5lQKuzluOyz2/ynwOKVUIX8AS+w28WA=;
        b=kzGcHTxgQulXn17RgvPvY7LiL3zhIOuVMJbt1Oqh9D95xOxXEG+k1ntXE51dC0Es4c
         yJQfcn3Wn8ch9ghivQCcuPjpPLK/TfPjUTIvxvVwvRRAQ8/pUsP5YABk4OIzLO03Hae7
         lNu3gS5E7Cj4bUhPdzw8T1wqcYNXy7Nc26Wr/hw1oF6H0I0SJ5FxgQWOFe0rqpGXyfD2
         AAFB8g0GXvZsx5U52EIUrugKLAgtLWMqd6TROOBT1LgUse7JKEaWLYHcHVOUCNcMZwLX
         KMwIo7DLHOGFJTMyjmwstp9SfsXaJFZCHVN24RHAnWzpLLfiSuBhDaGy8DhCoQ01llcA
         v5zA==
X-Gm-Message-State: AOAM533D8ckQ4QxeeEMF1KeGv7zMGPAx72ZMeD5z7oFy1mzptI4yO6FU
        DK/S8yDEjxAhB7we6OKGlno=
X-Google-Smtp-Source: ABdhPJyTjSmkPtRA6/sXaKkEFWxaxBkZ4HL8mupIi9HzpilQYOPzsg6o2GqsZMiPbcCB0VR+sfOnTg==
X-Received: by 2002:a17:90a:6fc5:: with SMTP id e63mr497592pjk.200.1597372845667;
        Thu, 13 Aug 2020 19:40:45 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id a19sm7294660pfn.10.2020.08.13.19.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2020 19:40:44 -0700 (PDT)
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
        linux-arm-kernel@lists.infradead.org,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 01/19] drm/msm: remove dangling submitqueue references
Date:   Thu, 13 Aug 2020 19:40:56 -0700
Message-Id: <20200814024114.1177553-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200810222657.1841322-1-jcrouse@codeaurora.org>
References: <20200810222657.1841322-1-jcrouse@codeaurora.org>
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

