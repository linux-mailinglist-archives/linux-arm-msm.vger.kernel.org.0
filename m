Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F589292FCC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Oct 2020 22:46:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728869AbgJSUp4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Oct 2020 16:45:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728770AbgJSUpx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Oct 2020 16:45:53 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D9C5C0613D0;
        Mon, 19 Oct 2020 13:45:52 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id gm14so427965pjb.2;
        Mon, 19 Oct 2020 13:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EJxa0Y7nCs3Tf2gPtGPuKCLZyL3rYvU42pja/POPnYw=;
        b=ry6AqElEvEpY7ozJUzanUkr157xTcDW84vk1uqXe5KioXVcwLPw5jalHV1s0pWC2Af
         rriDWA/Zu7wUv5gHyqX9eXg6WRCK5RElbGpmxCRVi2vW57GeJQ3SMeFO2qMYj8FcxZLR
         o0m+6eFDETpO+n1tIu1lrgv3dtNTu5x5cfpY9GrMlEPs9+TSVIA42/UEQI43UfmpjrkV
         2Hw9XRE0TnlkXbC7x6+JI4L4SaY7eFt3JPDy6pjBUA59rPSTjzxjkfn45iZheO+MtECk
         DV2wknIBeq28KtNVQnc7YJv1N8kDWSLw35D3mSqi7pPHLc4LVdKiwVVQkNqG8KFcc1t5
         HYHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EJxa0Y7nCs3Tf2gPtGPuKCLZyL3rYvU42pja/POPnYw=;
        b=NGqHx2GgsKCJv9LfwaLhpWQUURMqAqZxaUY9epKrswC3sMSU+Zy/2IzmqCZ8g1ZjD/
         J/aiTeZ6zJY5toQe6MVF/UBar0ikdLgndhSw/DK5IzaZQ9h4t+rkaXVCtLKAF85qfqUj
         R99Z6H6kq1/yqCnnImjSkB6K8rlbqD2p15HCi/ga/pGyEyGfPAWK0qFIHivPTvrtKcS0
         y7mykp2sVyaXrrDLai6vGvUVcSg1hMq8zbT+pveZzDh0hZgv3SYFOACKmoPWdN4Zldwm
         U5RZcT8fPyg+UnR/8oO5kd1g6JlE/5GsotsJ+0je8JtA6X5edV1SNUZKAe0qphaoEnJi
         b4KA==
X-Gm-Message-State: AOAM531SxYSz4O+w+MH5jA2vbA1VztEhusqwHYYSz2At979rqrGGhgAg
        SfPoO21A1tCsSmwMBZUHd0+9cl23ouuu3g==
X-Google-Smtp-Source: ABdhPJwU2P1f6KBpJt/desSFYsQHS6iPfuSxa2BxK+skgo0A6H4N08swifB4YFHe+Ekvo2BsbH5YPw==
X-Received: by 2002:a17:90a:d584:: with SMTP id v4mr1272342pju.194.1603140352056;
        Mon, 19 Oct 2020 13:45:52 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id q13sm660996pfg.3.2020.10.19.13.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 13:45:51 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 10/23] drm/msm: Use correct drm_gem_object_put() in fail case
Date:   Mon, 19 Oct 2020 13:46:11 -0700
Message-Id: <20201019204636.139997-11-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201019204636.139997-1-robdclark@gmail.com>
References: <20201019204636.139997-1-robdclark@gmail.com>
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
index 6abcf9fe480d..3dcb2ef4740f 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -1135,7 +1135,11 @@ static struct drm_gem_object *_msm_gem_new(struct drm_device *dev,
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

