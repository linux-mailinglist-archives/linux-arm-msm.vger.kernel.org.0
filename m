Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24A0D49108
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2019 22:13:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726378AbfFQUN1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Jun 2019 16:13:27 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:40483 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726048AbfFQUN1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Jun 2019 16:13:27 -0400
Received: by mail-qk1-f195.google.com with SMTP id c70so7033232qkg.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2019 13:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=D9vtTE1uu7WSSe5bzXxeqh5Pv0FUN5RIu6vYbEXrF8A=;
        b=fpd+XlVHxuYShYaEvyip30CxvwKcR0saECXTR4hqh332wfxPDlqHVxiftFD6mMr/+b
         QnrtlgIxMp9OgSi2jCgHZpN2axclpw+fdiqs2nqOjT2k/PSyb7PWQQ10X+19NKoJgcGA
         22XOkETtu7qGUZ0fPveEILO+TxrB6X26yjwYxHpkfAKBYC32FGuuoGCCPW06klLd6tiK
         UT6kFoymg9yakYGmDy4RE0djd0ePY/bYBi0PM5wvHAKDcQlkRkvI3KyDyL/YtnNLrHWX
         1z/tup9VjhNqHhDtRACg8LqF4IiQy1sUR3EVIIMxDFE3ZNCY88qeMHjSbKX2puf18ctg
         bTXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=D9vtTE1uu7WSSe5bzXxeqh5Pv0FUN5RIu6vYbEXrF8A=;
        b=CZ+dWxNIvqp+xbmKbJRZvUOuO34ykoaOE0Y2tFjFD4+iIztV3imWmthyoz/itCc1XU
         iIMUFme2oNCobpStoxx264F7HgGPNr5AqlA/90A6toAN2dNpzg+uNsRsOXTKYTwWfOao
         hBr76Dw6nKYFGf9wVTSMrhnl5xxqgWnsk0Km+FetPOJY9T0VNwghIMD1wmPAKApi3u0P
         5evMrsnpl6OknHOWIqs+Dz0pzHhnXeC6BaajxBLDToWHwl/RGCZKjsRTS0iB5qw6CwWf
         59ejXbH9JiwILm3qnZWuZ2jMUOvWIst4G4+rFL+s0UKF+l3VmIRQQx+TUEmYB9UUXYFb
         zciw==
X-Gm-Message-State: APjAAAXPTflK0CVw+YqQbn7MFpsdqCL7P8cJhqngPD0hBfpexSsravBI
        M9iM/nFbCQZNYagKa5qyYPrJVw==
X-Google-Smtp-Source: APXvYqwRttgaGQFTtNVWoB5PmdoUs3ejqU2sykdk+7qCjJiTQMBg5n+8PdNRbeKOTmjf13lBs2t1qQ==
X-Received: by 2002:a37:e409:: with SMTP id y9mr3320964qkf.109.1560802406629;
        Mon, 17 Jun 2019 13:13:26 -0700 (PDT)
Received: from rosewood.cam.corp.google.com ([100.100.175.19])
        by smtp.gmail.com with ESMTPSA id r36sm7071563qte.71.2019.06.17.13.13.25
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 17 Jun 2019 13:13:26 -0700 (PDT)
From:   Sean Paul <sean@poorly.run>
To:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Cc:     Sean Paul <seanpaul@chromium.org>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org
Subject: [PATCH 06/13] drm/msm: Depopulate platform on probe failure
Date:   Mon, 17 Jun 2019 16:12:51 -0400
Message-Id: <20190617201301.133275-3-sean@poorly.run>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
In-Reply-To: <20190617201301.133275-1-sean@poorly.run>
References: <20190617200405.131843-1-sean@poorly.run>
 <20190617201301.133275-1-sean@poorly.run>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Sean Paul <seanpaul@chromium.org>

add_display_components() calls of_platform_populate, and we depopluate
on pdev remove, but not when probe fails. So if we get a probe deferral
in one of the components, we won't depopulate the platform. This causes
the core to keep references to devices which should be destroyed, which
causes issues when those same devices try to re-initialize on the next
probe attempt.

I think this is the reason we had issues with the gmu's device-managed
resources on deferral (worked around in commit 94e3a17f33a5).

Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 31deb87abfc6..bf99ee138601 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1317,16 +1317,24 @@ static int msm_pdev_probe(struct platform_device *pdev)
 
 	ret = add_gpu_components(&pdev->dev, &match);
 	if (ret)
-		return ret;
+		goto fail;
 
 	/* on all devices that I am aware of, iommu's which can map
 	 * any address the cpu can see are used:
 	 */
 	ret = dma_set_mask_and_coherent(&pdev->dev, ~0);
 	if (ret)
-		return ret;
+		goto fail;
+
+	ret = component_master_add_with_match(&pdev->dev, &msm_drm_ops, match);
+	if (ret)
+		goto fail;
 
-	return component_master_add_with_match(&pdev->dev, &msm_drm_ops, match);
+	return 0;
+
+fail:
+	of_platform_depopulate(&pdev->dev);
+	return ret;
 }
 
 static int msm_pdev_remove(struct platform_device *pdev)
-- 
Sean Paul, Software Engineer, Google / Chromium OS

