Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7001398D0C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jun 2021 16:34:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231737AbhFBOgK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Jun 2021 10:36:10 -0400
Received: from mail-wr1-f47.google.com ([209.85.221.47]:39814 "EHLO
        mail-wr1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231542AbhFBOgH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Jun 2021 10:36:07 -0400
Received: by mail-wr1-f47.google.com with SMTP id l2so2552430wrw.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jun 2021 07:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=d0nOIc1mzt8v7aTq8P9bTAYTfjAP1Kn9fRgBobUfORA=;
        b=tSzVDkn4KcWdhzDzNsZip5cu2zKF7f0SGaGpOeWTuwCH+0fxCugizjmJtvChNK7t+V
         mpDrlynprH5KJmIgn42ZQ/o5zYEvQ4vWLMnvKG8Ed2o7L7HWVaFJG8hn368YWJ1nd2LW
         4c746lB6R99b2g91Dwsihqjq/phbUmYHQmENAbEMiWVDBCMX5qsuKWp4lY775RukY5Di
         uubL1YluRv3Cs1hoU2hG30XhYEZtvTNlISLKXEeHvgS3XyefTL9FQKHXjDCT7eCskiWG
         9o1d7XI5noxEdG5lRVRx1J+GyQyt0ikUWamSHmpNQxwryL3VHl6CqkIFjXJbXNLc7HxC
         kqLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d0nOIc1mzt8v7aTq8P9bTAYTfjAP1Kn9fRgBobUfORA=;
        b=CAdFL4AWAhOSTV1OLpZG+zoBskmK7hPXcDwj6/vtQLoKV0A2v309r5NpeRuJIOUzUR
         s4mwncZs0OLrhLHzjL+9ztqeTcnioMY2f5/3YtiLbHcLzL1ECtxrWUYUW/it/i0WFr0K
         L2MNLWlDYYzN0wUnDURVXiXsfrNS/dPa5acrdUs4Zkar+OTahR/zi4QDLh821JHQe/9A
         OlIFEU3wcGjDsTevyxSkx+cXra4F9lRABjmzah3Dq7GHGC82AN19+Scihi/1nDvYtZC6
         9W4XX3ZB+ZUd78YIt62JBjnSALA1KMQyj7VXLgCKoCdYi1/Hf4RjtJLpe+UP+T4XTnJd
         KWiw==
X-Gm-Message-State: AOAM530dTNit/JwDDxqfKSwrAwuAFq3QJywUQS5awzr0l3BcSJNnTK3B
        4ceBmUapsyckYaNIG7ieT22oUg==
X-Google-Smtp-Source: ABdhPJyuJWVPFCq8ke4Ux8r5rzSxfpfkMshp25BkWH+joTfvu5tLeJqfuuvJvUX1vOUfItFxxByl1Q==
X-Received: by 2002:adf:ef06:: with SMTP id e6mr22764784wro.393.1622644403125;
        Wed, 02 Jun 2021 07:33:23 -0700 (PDT)
Received: from dell.default ([91.110.221.214])
        by smtp.gmail.com with ESMTPSA id o11sm132315wrq.93.2021.06.02.07.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 07:33:22 -0700 (PDT)
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
Subject: [RESEND 12/26] drm/msm/msm_gem: Demote kernel-doc abuses
Date:   Wed,  2 Jun 2021 15:32:46 +0100
Message-Id: <20210602143300.2330146-13-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210602143300.2330146-1-lee.jones@linaro.org>
References: <20210602143300.2330146-1-lee.jones@linaro.org>
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

