Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C73A72C3158
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Nov 2020 20:50:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726027AbgKXTsJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Nov 2020 14:48:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726560AbgKXToC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Nov 2020 14:44:02 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0233C061A52
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2020 11:44:01 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id d142so77236wmd.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2020 11:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JwMzTHpk7XI6dg2CwYCxfUcJLWNO9chsHiaVHLyGBfo=;
        b=zEbr7Ie0juCosDDUMsYHBJ5/J0q8CwkxEN4KosAPheneL90V7ZjGXHhrG+nXobFpYY
         jYaSnWMkl4OwkgcwqGU7WhRI01sdKPKoxu+AXz/HhpilIXeYZeBJ6WJO4pq7hgCojSu3
         ljDryijIsewMpHCmf/RA/YCwPkDZHcRWXbe6gkcKK73lBmu7W3r+IBuVJ0LblcnE8cz/
         Z1lxGr6RnUuSwo0Kk2Mt69/tT+ijOYmrhCwDpsO6lWisOUa0K2JbBUePz/XLLuJLIfVy
         2PhiDpl+H2UoO6v6BQ0Cp/CbuFgNJqH/bEj4g2kzVDbSCesxOX1zk6zSLhMRaACpmXJe
         kwgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JwMzTHpk7XI6dg2CwYCxfUcJLWNO9chsHiaVHLyGBfo=;
        b=K1Prr37VuFIc6D25WYU9M7Km4JNblDmzt2oHCi0ASlJi05CxPHe3H3UHEGNi32GOC0
         swq+QJNQHVvFT3OG5fgECEn9BerCiDnG10d/e1F4BG3xvkwEeP75Z4dv59uMYXitbCmm
         /QoHugcJ1cDRl+b/HojErE66ziUFdTnKB79e5ajBGFravJfdq+F8VJ53UDBdS8Wa+ShU
         F562CfRRY/W1A/Zgk3RUUXcvakCrDGTi2GgAWHJVdJtWg0yaACQB3NtXCAkQYdVSKOep
         VFE2YbQynCtqoqi3J6ogw44F1GS+Yr3Q7Nw9a5UUiDS0lvNAEexjndlAl3qVPWl+dSmE
         JZZg==
X-Gm-Message-State: AOAM532squrTtQxIsZ7lC2J5QlNiybjSjTvCRL+wIedXWE2PfBplh+GF
        eNohPXPxlkj8CCX9CjCiOGWYhg==
X-Google-Smtp-Source: ABdhPJyDoOCPHG72jMUWYjVqVYPJywuRT7oeySl5WJow/24UWTk9rV3wClijPpWtjtWY0EN2Oa/1EA==
X-Received: by 2002:a1c:a986:: with SMTP id s128mr7419wme.94.1606247040667;
        Tue, 24 Nov 2020 11:44:00 -0800 (PST)
Received: from dell.default ([91.110.221.235])
        by smtp.gmail.com with ESMTPSA id d134sm200511wmd.8.2020.11.24.11.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 11:44:00 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 01/40] drm/msm/msm_gem_shrinker: Fix descriptions for 'drm_device'
Date:   Tue, 24 Nov 2020 19:37:45 +0000
Message-Id: <20201124193824.1118741-2-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201124193824.1118741-1-lee.jones@linaro.org>
References: <20201124193824.1118741-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/msm/msm_gem_shrinker.c:108: warning: Function parameter or member 'dev' not described in 'msm_gem_shrinker_init'
 drivers/gpu/drm/msm/msm_gem_shrinker.c:108: warning: Excess function parameter 'dev_priv' description in 'msm_gem_shrinker_init'
 drivers/gpu/drm/msm/msm_gem_shrinker.c:126: warning: Function parameter or member 'dev' not described in 'msm_gem_shrinker_cleanup'
 drivers/gpu/drm/msm/msm_gem_shrinker.c:126: warning: Excess function parameter 'dev_priv' description in 'msm_gem_shrinker_cleanup'

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/msm/msm_gem_shrinker.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
index 6f4b1355725f4..caf032e5bf2f1 100644
--- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
+++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
@@ -100,7 +100,7 @@ msm_gem_shrinker_vmap(struct notifier_block *nb, unsigned long event, void *ptr)
 
 /**
  * msm_gem_shrinker_init - Initialize msm shrinker
- * @dev_priv: msm device
+ * @dev: drm device
  *
  * This function registers and sets up the msm shrinker.
  */
@@ -118,7 +118,7 @@ void msm_gem_shrinker_init(struct drm_device *dev)
 
 /**
  * msm_gem_shrinker_cleanup - Clean up msm shrinker
- * @dev_priv: msm device
+ * @dev: drm device
  *
  * This function unregisters the msm shrinker.
  */
-- 
2.25.1

