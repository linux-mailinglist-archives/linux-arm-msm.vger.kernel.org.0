Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E0D72A999B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Nov 2020 17:39:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726732AbgKFQiy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Nov 2020 11:38:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727313AbgKFQis (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Nov 2020 11:38:48 -0500
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 336E0C0613D2
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2020 08:38:48 -0800 (PST)
Received: by mail-qk1-x742.google.com with SMTP id i21so1587399qka.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2020 08:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8trkRjP9UFPyJqjxFvhkrNselLfEoUHaVtNBCoJ4XCk=;
        b=laDTNhhdkAYgGr6Xrud4Lecf7gNqF0snM2UEQZZjGWky4tYPZf0r3voT2a4dED5KIZ
         cl4pQlYqj6ZgFT7n9Pq4eiXWmZNFws4hQxefJKlftNZEsiS8zzzJN5cqpvrkkYustkYz
         UmdZvFy9WV7LCDt9qMLfXyfswlMlHY0UD1/Tnbp+mJ8+3fI/JRUWVQh0IROzsfvQoBlV
         o1aHMzOOV1GDIyxa1NdiC5cHpVh7Idc03JMhHbew9YEA2phGFO9MOG/KeIPk5Sm9dIt8
         7lo+USi40aetpZWFMU6CvX/+cTRe9g3HzeFt4qYI/TrDdJEBQd5Zv6r4tMICd5nGc1uO
         MXgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8trkRjP9UFPyJqjxFvhkrNselLfEoUHaVtNBCoJ4XCk=;
        b=tBSwb5VTbMVGDsKIPYIRMb3g1JWNUY5XxKO7nSRLEnvSM0Eud4qZ+EQg3RsGWEwDBt
         5AN3WqrSRPoGSM7PFgu5LZYHWSzJTwpaRyr7TAX6Cmtu/YdLSAX7ab2C11cdCwqCZ+I4
         6U+MiNuOyMe2AX8647cAmKke4zD+7y8RuUuv+7Ig9NQA61+843zc7UhExvSwCW1I9dQd
         rW/wU0bfFvXSDZu6FYurKzJ60XGUGHexKa7kduGVUqksYGc3y1NvTSzpFus8N1gbF1w3
         VRR26KJSizlhOnw3q0Akrom8LfihB2P2qNiBi4x2QrLiy0uLYxP7OpimOetM7iZuDCVv
         0BVQ==
X-Gm-Message-State: AOAM532utGKFWtSLiqHHEVekGUXXbNVQRKRIpcsM/u7jRkV7xgeCr3Gn
        OBSiRDSnpBWmfGOVi5Q1xnpu5Q==
X-Google-Smtp-Source: ABdhPJxIHhdp/AKI2KvUFtqY0ovg2l83Re+m5GEneL6YbUxUROsQNG8iXGSoza/7wjV/dd2t5WoU3w==
X-Received: by 2002:a37:7304:: with SMTP id o4mr2450129qkc.351.1604680727479;
        Fri, 06 Nov 2020 08:38:47 -0800 (PST)
Received: from localhost.localdomain (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id s3sm860000qkj.27.2020.11.06.08.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2020 08:38:46 -0800 (PST)
From:   Jonathan Marek <jonathan@marek.ca>
To:     freedreno@lists.freedesktop.org
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 5/5] drm/msm: bump up the uapi version
Date:   Fri,  6 Nov 2020 11:34:34 -0500
Message-Id: <20201106163437.30836-6-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20201106163437.30836-1-jonathan@marek.ca>
References: <20201106163437.30836-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Increase the minor version to indicate the presence of new features.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/msm_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 3f17acdf6594..7230d3c0eee5 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -39,9 +39,10 @@
  *           GEM object's debug name
  * - 1.5.0 - Add SUBMITQUERY_QUERY ioctl
  * - 1.6.0 - Syncobj support
+ * - 1.7.0 - MSM_BO_CACHED_COHERENT and DRM_IOCTL_MSM_GEM_SYNC_CACHE
  */
 #define MSM_VERSION_MAJOR	1
-#define MSM_VERSION_MINOR	6
+#define MSM_VERSION_MINOR	7
 #define MSM_VERSION_PATCHLEVEL	0
 
 static const struct drm_mode_config_funcs mode_config_funcs = {
-- 
2.26.1

