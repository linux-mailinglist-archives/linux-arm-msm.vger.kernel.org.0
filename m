Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6998D292FAA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Oct 2020 22:45:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727536AbgJSUp3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Oct 2020 16:45:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727057AbgJSUp2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Oct 2020 16:45:28 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4444DC0613CE;
        Mon, 19 Oct 2020 13:45:28 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id a200so664657pfa.10;
        Mon, 19 Oct 2020 13:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=epLimpxjmfg48A6fvNBDGIJDBN6SDQ0BNDdD7VaQX6I=;
        b=SEExezQXrfvDTHgWSccdcp/gvDOfomSvUx/EhmMYXS0IDlZooJhzWpqEis4XXOLtbI
         9z7PBHzJI2tIapiVEJh0y75p5MD/7qVLgz/3evgEF9BzYaZznACfuijXTZ9amq3yqp4d
         UXi6O7HupM3BSyoH42XKCyvoPZUpWHuyis51qegcOwIjvWXRYJ8MfK8oeDNQSa9clwHC
         LXwq+PqiniCiFGFpkOis2gHCJBDxt/goRNqpPWlFkPoRVpvS2iRnp6P+x07W13ghgJpI
         dI7Y5OBExERVce0bWgQYQyKCxNk1CbH9IpmNhtwZsYnbjT6OnwuvBo/sfJ2mOJq6pOq0
         XNWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=epLimpxjmfg48A6fvNBDGIJDBN6SDQ0BNDdD7VaQX6I=;
        b=YxHsj1S0EjGVX4mxJF84lcsy7zryLXjzosHEHVKCVMpoP6FvSXNarW5jjjVYzNIOb3
         ooL9HA49y6NonFKHfku1WqKk/p9Ple2HXdgWX6BzNy7hhDRLWkLSc0J6UlWPLdaqU2ub
         P9rX31jUHt0StH24ERwjLPvCSS4ERP/mVosWM5tomeEZUPLRr5ld4SY49z1mhCIEMuTK
         kPIbzYxfIIl6V/rHwStElo9GtDfWzwGA4vJfTkOs0pALxUGPE2SLJQt+YzOSwCxzIytI
         4tER0n4IHC02fNCTsXdSBaPMWc4F3FgbUoaay4uYL+M+WrWYiMZZ4Eyzc9edFoa3eo4/
         oJiQ==
X-Gm-Message-State: AOAM53125lyJIl8cM8oxCTzByXLUyJg2TFZpWrfqKMRfrajqWIk6PGgj
        AexDCwoq1NBewSvqQZsT420=
X-Google-Smtp-Source: ABdhPJzysRtYdn1XV3CyDHBkM3cPbjAkrpWwlxIPIFOXO8xM5YwGuzDxw5OO3Dxg//q+GIixmaFcOw==
X-Received: by 2002:a63:7009:: with SMTP id l9mr1231146pgc.199.1603140327785;
        Mon, 19 Oct 2020 13:45:27 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id mn11sm327738pjb.19.2020.10.19.13.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 13:45:26 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Eric Anholt <eric@anholt.net>,
        Emil Velikov <emil.velikov@collabora.com>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 01/23] drm/msm: Fix a couple incorrect usages of get_vaddr_active()
Date:   Mon, 19 Oct 2020 13:46:02 -0700
Message-Id: <20201019204636.139997-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201019204636.139997-1-robdclark@gmail.com>
References: <20201019204636.139997-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

The microcode bo's should never be madvise(WONTNEED), so these should
not be using msm_gem_get_vaddr_active().

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index d6804a802355..b2593c6bd2ac 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -426,7 +426,7 @@ static int a5xx_preempt_start(struct msm_gpu *gpu)
 static void a5xx_ucode_check_version(struct a5xx_gpu *a5xx_gpu,
 		struct drm_gem_object *obj)
 {
-	u32 *buf = msm_gem_get_vaddr_active(obj);
+	u32 *buf = msm_gem_get_vaddr(obj);
 
 	if (IS_ERR(buf))
 		return;
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 948f3656c20c..0894703a742e 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -522,7 +522,7 @@ static int a6xx_cp_init(struct msm_gpu *gpu)
 static void a6xx_ucode_check_version(struct a6xx_gpu *a6xx_gpu,
 		struct drm_gem_object *obj)
 {
-	u32 *buf = msm_gem_get_vaddr_active(obj);
+	u32 *buf = msm_gem_get_vaddr(obj);
 
 	if (IS_ERR(buf))
 		return;
-- 
2.26.2

