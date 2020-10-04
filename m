Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47EA0282CFD
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Oct 2020 21:21:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726444AbgJDTVJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Oct 2020 15:21:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726085AbgJDTVI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Oct 2020 15:21:08 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C928BC0613CE;
        Sun,  4 Oct 2020 12:21:08 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id x2so3965607pjk.0;
        Sun, 04 Oct 2020 12:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FnpkgYe/O9d4AYRxVVe1vBP2PhvVSTJl2AUFDqH2Sr0=;
        b=uPzD5q/NxoE6HKNg2DFVLhsSXAZj0DE+mtFzQRf6G2zWukz4iQSzK9wUbdC0TJm3Ef
         ZcdAgaySLaTGI+egOnLuIYt7zGMMNcIC08NYLySh2d9xXf0DHKLDT6M0xBg5bFAuEBAl
         4EgLfm7iGvcXpyUd+aP+J2eBy0IdF43H+l73+OmYDi+I2Pbgm84sTA0eqKkBmT0GwsWf
         r9lQ5qzPWFi9f682LcpKC1hmcZUcNOdqWR52nBobQOcxi9iP+YKQ1wqMHr/CKUDQ5m3F
         XTIZ6qvKzy5DQmYVjLmoHRHv23fYZHLYwP5xEW1u71TMjQta/UHiIY03dL54s1qt5z0T
         q7bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FnpkgYe/O9d4AYRxVVe1vBP2PhvVSTJl2AUFDqH2Sr0=;
        b=UHyHbG9lKZa2gs3SvReviEd9YGQ55erIj6KLUvkczJP3VZDn9ljBj7EWQsd+4ERqmv
         NlOvJPZMMk5InkvpVYNyiWhHtLcLhzIltFGPVQMiRU27dfizvCVCKXIsAmMZ+JdWJwt4
         M5SdyfxdazRIRUzdUw4MKwEN3Rx3ZJXM5JxizXAr2MWJUI3geERhEPDKfhFb/86QTufZ
         Sj5o2GcTtwUA4RtFm1MwCRGD0XwH5rMDpO8aY9/U4P2tCsJPpKxMnHwg1aPaZnIXMHmo
         R488UnCfzAIHIspQRiiiFKIYpB/AtG4QydNcgF4YU2q4AeBu8GdTimPltERE3E0QLOSE
         Z2Qw==
X-Gm-Message-State: AOAM530z0ZvfWawvPU0gM5XZz8QooiqnnRGnr0KSQmWg6Gbn4BbTChKs
        iziyssXCH4j+tJ32x9UupWg=
X-Google-Smtp-Source: ABdhPJyvMoILH6fXhmvKYFY3fZRjizG0TlgbGLt5UeUM7ybLbxyQePkCzvg/Qnastn4ThulWDj2NDQ==
X-Received: by 2002:a17:90b:3103:: with SMTP id gc3mr11011474pjb.158.1601839268350;
        Sun, 04 Oct 2020 12:21:08 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id m13sm9436279pfd.65.2020.10.04.12.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2020 12:21:07 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 01/14] drm/msm: Use correct drm_gem_object_put() in fail case
Date:   Sun,  4 Oct 2020 12:21:33 -0700
Message-Id: <20201004192152.3298573-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201004192152.3298573-1-robdclark@gmail.com>
References: <20201004192152.3298573-1-robdclark@gmail.com>
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
index 14e14caf90f9..a870b3ad129d 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -1115,7 +1115,11 @@ static struct drm_gem_object *_msm_gem_new(struct drm_device *dev,
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

