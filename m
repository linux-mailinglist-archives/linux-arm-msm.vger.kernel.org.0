Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7A2E1B65EB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2020 23:10:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726287AbgDWVK3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Apr 2020 17:10:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726060AbgDWVKZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Apr 2020 17:10:25 -0400
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com [IPv6:2607:f8b0:4864:20::f42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5ECBC09B042
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2020 14:10:24 -0700 (PDT)
Received: by mail-qv1-xf42.google.com with SMTP id fb4so3659137qvb.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2020 14:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OznIskxLEmtu/QkMuofbi8Hv/l/O/vY0LWIonX2v6/0=;
        b=HDWmhCXgHFsTLLcphP+WIWEuRTazXG+nj2IFryAZzi3LaKFikQ/kbEw/1eYYlc2EAu
         rlP4a8T01kvPycC/L1jIKc1649iugOK8bkpJ8pGnag6+oQL5Q/t4g6X9wJdyYVgs4E6Q
         Wm89DH254gNh0jJN8vwAhwNU2+uZklXZ9Fb13437bsjht89uyP7lAJFiu7Q0CoFky9pO
         6mXRG6P3x8paQ6Px1wteHecOTrIUk5c6xnkkyvJeZWos/i8VAYVMIRLwMDNi/s4Y+tjf
         ERiDEtmWqdrLzkzQMZlgPFqaKz6de/3Yepocg8K0oqllyqj6P8aj2p4rppkWcFpIOnUV
         iU8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OznIskxLEmtu/QkMuofbi8Hv/l/O/vY0LWIonX2v6/0=;
        b=dnzK2/VbAn3aOppPPXsrdxE+rm08CtM+DIUJ3WRQaTn7XCGZU3nNgJFgi4RvLkimn6
         /QFFvF+oK3Dyppn5ZhBeSLdBM/Lr5a0LumbaYSCxCvlxXHFSL500iOQly8E9sC8A4eaN
         sfTTjFKdGHD0MggZQavdvZu/8hRLtCCPQDisBj+NF0p3u6bEMPR9nHdmhdPa2ccgSvrK
         772znr69LVjXGfEsRCdbqxJ31nPaQAzFBrNL3gQJkWjXkFsdBJvsfQLvQiHh/l5SP8pO
         ChZxqx2I8AVFOtkxt5rEx7pizXbPhedTc812MJa1uh78tGNGwbl0Cly6TACwD8dMl2Zd
         R+Fg==
X-Gm-Message-State: AGi0Pua2e3Hw+6vhmhC+g1d3R2Kxk7/bHt4EgkJqOHuCYJqJ1jTJT6pF
        hv0NZ8d1S9S58Ap8aO0Pn2jncw==
X-Google-Smtp-Source: APiQypJlblvSwiOiCVaavRDtMFgfWWKA5keisrxO/bk8aKribOb5caIEKhyujQ4BrBPl7LSzI8qjCg==
X-Received: by 2002:a05:6214:530:: with SMTP id x16mr6061009qvw.55.1587676223869;
        Thu, 23 Apr 2020 14:10:23 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id n4sm2341495qkh.38.2020.04.23.14.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2020 14:10:23 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     freedreno@lists.freedesktop.org
Cc:     Jordan Crouse <jcrouse@codeauorora.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 2/9] drm/msm: add internal MSM_BO_MAP_PRIV flag
Date:   Thu, 23 Apr 2020 17:09:14 -0400
Message-Id: <20200423210946.28867-3-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200423210946.28867-1-jonathan@marek.ca>
References: <20200423210946.28867-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This flag sets IOMMU_PRIV, which is required for some a6xx GMU objects.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Jordan Crouse <jcrouse@codeauorora.org>
---
 drivers/gpu/drm/msm/msm_gem.c | 3 +++
 drivers/gpu/drm/msm/msm_gem.h | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index d8f56a34c117..6277fde13df9 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -428,6 +428,9 @@ static int msm_gem_pin_iova(struct drm_gem_object *obj,
 	if (!(msm_obj->flags & MSM_BO_GPU_READONLY))
 		prot |= IOMMU_WRITE;
 
+	if (msm_obj->flags & MSM_BO_MAP_PRIV)
+		prot |= IOMMU_PRIV;
+
 	WARN_ON(!mutex_is_locked(&msm_obj->lock));
 
 	if (WARN_ON(msm_obj->madv != MSM_MADV_WILLNEED))
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 30584eaf8cc8..972490b14ba5 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -13,6 +13,7 @@
 
 /* Additional internal-use only BO flags: */
 #define MSM_BO_STOLEN        0x10000000    /* try to use stolen/splash memory */
+#define MSM_BO_MAP_PRIV      0x20000000    /* use IOMMU_PRIV when mapping */
 
 struct msm_gem_address_space {
 	const char *name;
-- 
2.26.1

