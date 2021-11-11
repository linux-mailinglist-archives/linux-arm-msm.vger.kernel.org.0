Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3318E44DE04
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Nov 2021 23:57:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230348AbhKKW77 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Nov 2021 17:59:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234240AbhKKW75 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Nov 2021 17:59:57 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9181BC061766;
        Thu, 11 Nov 2021 14:57:07 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id gt5so5208289pjb.1;
        Thu, 11 Nov 2021 14:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p0ib5mh0m9IgYQvAbwkxu2Vd7F/N58zy9lwbLSe3RPQ=;
        b=Ck7r2yklLFFbeh+El7AOfStAtNR1McHufDCIj1lNpnxb4iC9a+Zi7zIbawxSOoS0yj
         C+0TqFNmVPIP+Dn/6IcBxuRksJY/F5A+t29G27UwPUzPVxh42r4xRkQiBGH16ylT4DXP
         ev2H9WhPhuyrdVSUde1Z86pVvL3CPgdIONyzFWYHnz8LsYy6bBycCH/xS/Chn8sRp5dv
         zkizdbi4TaINVMB0Qv2qY+oB7Jy41nGT08OwT0xCohBhZUPLxdoWfB0yHpahkkk+dNcf
         7TA9jseEAVir9Z6OsR5mnixg7vWaWwY0gzkSzXtI0RsHljCRJG+t8dvJb4MwccSPFRQD
         xy9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p0ib5mh0m9IgYQvAbwkxu2Vd7F/N58zy9lwbLSe3RPQ=;
        b=jfuwMNnoJtzAQSsfV/8u5CxYKi1NuQOdnlWgej1b1p8hl33xE3wDBc5KHsLIGM26mu
         KxVnAunGPFL0ge7+xcvfHZTvkcyYu19yfrrDd9L9+nOTBKrFW5FBowD2USO197VfUQMO
         7sTxe9hA59B+LBeiyBmmmiZXWFHBiqpa7+aGaJ45HsIPavTrbk0ZoUAX0vJ0HAvEpypF
         zK9mkeEfCKZpzz/n7oJm6EOpXS3zN/QQXG642GAQs8bEtA88fe6y/y2XacwzVQFRAAz4
         1yRmw8xm+9bPlt0S/L7T8E1sFaALLRbGz9segc8f+kQDgRKbPFW3NBCWOkbX21Ql9xAk
         eQ2A==
X-Gm-Message-State: AOAM53051ymQ46yaBGbYr4f95iTb58616EUSMAXgqVUI1fnaX/aeTpLK
        TRIyMoz1OyeV7+GtNQWO5fj5xMs069o=
X-Google-Smtp-Source: ABdhPJwXxuqHiQ7wn6wlrhogFUw/YurkDkkM2WprlH3tc0LxKT/qyGi84rHA8R+cDX5t11sdnb3H0g==
X-Received: by 2002:a17:90b:3850:: with SMTP id nl16mr30708953pjb.10.1636671427093;
        Thu, 11 Nov 2021 14:57:07 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id c5sm3165352pjm.52.2021.11.11.14.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 14:57:06 -0800 (PST)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm: Demote debug message
Date:   Thu, 11 Nov 2021 15:02:14 -0800
Message-Id: <20211111230214.765476-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Mesa attempts to allocate a cached-coherent buffer in order to determine
if cached-coherent is supported.  Resulting in seeing this error message
once per process with newer mesa.  But no reason for this to be more
than a debug msg.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 6b03e00cc5f2..27c3ece4d146 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -1121,7 +1121,7 @@ static int msm_gem_new_impl(struct drm_device *dev,
 			break;
 		fallthrough;
 	default:
-		DRM_DEV_ERROR(dev->dev, "invalid cache flag: %x\n",
+		DRM_DEV_DEBUG(dev->dev, "invalid cache flag: %x\n",
 				(flags & MSM_BO_CACHE_MASK));
 		return -EINVAL;
 	}
-- 
2.31.1

