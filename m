Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FBE928ABF6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Oct 2020 04:10:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729736AbgJLCJf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 11 Oct 2020 22:09:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727218AbgJLCJL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 11 Oct 2020 22:09:11 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77CD6C0613D7;
        Sun, 11 Oct 2020 19:09:07 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id y14so12115853pfp.13;
        Sun, 11 Oct 2020 19:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lsQ9N+apQGOcHYXFGYjFIayjQSXunpwI7ZmJDjhbJNE=;
        b=JUgmYERxIKERmHzyVxJYNyCIKZCW4l6H9/iNSMbxyEj6wSVpDicXKDpGflFnL2TBaf
         cqLULbhM01JjAPrqcvuuxRpCs1qwPO/0FL+1lgWwcUAn39pXTOolxgBnccrv7mB+ttaq
         84tG+Hkx+WnjvDC+UHIvltYeG2zWffdK7lJ3CvDMGyFY9SKFXkcJ7vCoKxazGWoR5D8L
         KnzM7uSX8nnH22mrySu0Zf2aKaujqsnmCw9yimWnGESy3wwvQuYi8xJA40PqI1G4SNoB
         gVPbpHg+LyGsPA+rIQ5IrXrkvYcq1elmkbRst1dV6bWWeaiACWBfes2YF3AJp1daR8Fr
         3CiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lsQ9N+apQGOcHYXFGYjFIayjQSXunpwI7ZmJDjhbJNE=;
        b=CaKUxuI7jHyGcGBR0xruyPjaR82jSo1nN/r4VnhrFqwoSs1X3hnRM/oygsrKw1FMIS
         XWINgxZqrVUQJQOzhEzmBRxnzhDskzJOmFNVF8zeMSr4WeU0GldX1LThX6ku4wM/zNBD
         4CGoLPKO6G4rsLa+NLzj6Tj8P+Q5JfOmJMguH6SwIpIkU2ueumHHskR/MSQZpDIUuXL4
         HC7E/7EG96r8/UAz87QASPYXxmg0rRWBeS2E6hDzJvki6lw9Q8XnZKTuOygkOa3zfip9
         KVQoNvNKvwt2FOLoMDz1dDUsuH2ghUfcU6lWk2HwPnhwobYIdT909cgH9wJuOwGIyM8k
         mhHg==
X-Gm-Message-State: AOAM533VgtZ3qojJxdAkEUYl0zTeN5OJgZL3ymHzYSBfuzyTo3hJKd0i
        6g8kv1u/u96+T6M7WTek8sc=
X-Google-Smtp-Source: ABdhPJzWL0w2g4Ew/5WKB5u0zWmvJb22AOeLQlFsz2hwOWA3PxPUbRr1+f7sEMnI2Tb4VxTDFsJJkA==
X-Received: by 2002:a17:90a:46c2:: with SMTP id x2mr17574218pjg.60.1602468546995;
        Sun, 11 Oct 2020 19:09:06 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id j25sm17648278pfn.212.2020.10.11.19.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2020 19:09:06 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 09/22] drm/msm: Use correct drm_gem_object_put() in fail case
Date:   Sun, 11 Oct 2020 19:09:36 -0700
Message-Id: <20201012020958.229288-10-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201012020958.229288-1-robdclark@gmail.com>
References: <20201012020958.229288-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

We only want to use the _unlocked() variant in the unlocked case.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 210bf5c9c2dd..833e3d3c6e8c 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -1120,7 +1120,11 @@ static struct drm_gem_object *_msm_gem_new(struct drm_device *dev,
 	return obj;
 
 fail:
-	drm_gem_object_put(obj);
+	if (struct_mutex_locked) {
+		drm_gem_object_put_locked(obj);
+	} else {
+		drm_gem_object_put(obj);
+	}
 	return ERR_PTR(ret);
 }
 
-- 
2.26.2

