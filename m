Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 857E838AEB5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 May 2021 14:43:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241471AbhETMon (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 May 2021 08:44:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242649AbhETMoE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 May 2021 08:44:04 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDD5AC0564A2
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 May 2021 05:03:18 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id z17so17371133wrq.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 May 2021 05:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=d0nOIc1mzt8v7aTq8P9bTAYTfjAP1Kn9fRgBobUfORA=;
        b=ZCHECdMPQ0Pe1h9k9kzuKcqsiVmGcY0RaFk2/Uo7Jd0Oj/FbXRq9cfiLMqHYu5Q50V
         2BaorOWqD5ShyQ6E1DvzyyLfwG8BNwM8i6uSs9LOugICo7o0YWFtBpTjqeQZa5XQ9TJg
         s2yIsIi8JTdiv2VrJ6ErOC84MKKa0+xNvHdb4TyvnPjXdWnI4FtdJBjjjgHgHUtdDCA0
         gAo8ZoMYgSzZ6maczQ+QyihatSrk4GMM41jL+9tFzauV7/+8UM1bSbL7JY468aL2/sYh
         zOYI6p54xXxQREjKWvvbZpMm5wZR7N7BbkFHzHN+Hp1v1P0Nu1bSb2FRKojIsZ1dmJZe
         Ae3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d0nOIc1mzt8v7aTq8P9bTAYTfjAP1Kn9fRgBobUfORA=;
        b=kuqHeFzxWfbLcHgverZonrxBgjCVe4meZlwPO9sIKx7/kZhWqwYRGARE9Vbnphphfg
         R1aS2fv3zo075Vf0Z+CRXJajlDGYNO6Vn3d5C73T3W9oeE9QukSBPmui1U/M3PmdbYWM
         D3YbjJInE7btCjCNKwULYmubmgQWRMBt2nkJpFqzeIH9AZD/9x9+0h7zXG2p5kgS+R70
         soscGE/r0RCb7azhFeFR9D/7b5sCqp/kOaaSMsM+kfjIj9NzX+1gLMSqRnuz+6Zcn2oy
         jwDAzdDe/kvc8oD1XxYkTbIZmC4B22/5gW1nowkCIl3XMILHWAJj1LCI4v8+CECOGz5e
         2qTg==
X-Gm-Message-State: AOAM531fetRc837Ffw8AALx3cAa+jtPki+QU5xprxEplXx+qOJq6u05f
        FqgWSbnM3AR32yWKVkdXE78YMw==
X-Google-Smtp-Source: ABdhPJxogKt9bFNGrmh6EK/JtPm7PPL/+ZIKAX6rKP8QgZWPF6yidqkW2wwqG5YDIrjwdrD88Q4RGA==
X-Received: by 2002:a5d:6381:: with SMTP id p1mr3973571wru.19.1621512197569;
        Thu, 20 May 2021 05:03:17 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id j10sm2886332wrt.32.2021.05.20.05.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 05:03:17 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH 25/38] drm/msm/msm_gem: Demote kernel-doc abuses
Date:   Thu, 20 May 2021 13:02:35 +0100
Message-Id: <20210520120248.3464013-26-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520120248.3464013-1-lee.jones@linaro.org>
References: <20210520120248.3464013-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/msm/msm_gem.c:364: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 drivers/gpu/drm/msm/msm_gem.c:763: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/msm/msm_gem.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 56df86e5f7400..15434deb19334 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -372,7 +372,7 @@ static void del_vma(struct msm_gem_vma *vma)
 	kfree(vma);
 }
 
-/**
+/*
  * If close is true, this also closes the VMA (releasing the allocated
  * iova range) in addition to removing the iommu mapping.  In the eviction
  * case (!close), we keep the iova allocated, but only remove the iommu
@@ -773,7 +773,7 @@ void msm_gem_purge(struct drm_gem_object *obj)
 			0, (loff_t)-1);
 }
 
-/**
+/*
  * Unpin the backing pages and make them available to be swapped out.
  */
 void msm_gem_evict(struct drm_gem_object *obj)
-- 
2.31.1

