Return-Path: <linux-arm-msm+bounces-76795-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id B8203BCD8F5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Oct 2025 16:39:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3D5783472C5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Oct 2025 14:39:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2F6E2F3601;
	Fri, 10 Oct 2025 14:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hEW/ICgG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6322F3C20
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Oct 2025 14:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760107192; cv=none; b=iLuhMjumCuoEfUEa/fGxgr8DpNRi8M7sFF7NNK0jcdamBYf8U57kWOHlPs0ohHkLQ0H8IXjy82yPiqV5QN4SxGp+kbKp5SW96NZ3k0t7G4GjfGOyJc5DHiu0VvIYmDsI0Agm3YK6sjJteZvKOdo+DaD04Zl+Dkdzl2hy+89oGIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760107192; c=relaxed/simple;
	bh=JLP84YwDYtnkcXuPlWz/96ycTDjsV2Qn2l1fDXZT63Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=uhe1fOG3RZ35+Ao1Z2eLQlSrC450FYMcILpjQMhdDh8FcxFpElySRQssvvBnA+bK5hmZXgqMYPblD5pM0DjzjBOsxY8rw+Us2JoqTY+xAxm4uR5wrIv0mQBWoVTcTSGQxqO6o/nSN94jI2CstcMrpubNOoz+hiC7iPcP964YTmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hEW/ICgG; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-639102bba31so4276963a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Oct 2025 07:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760107189; x=1760711989; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FwwnIs4n2nwe2j9PHCbA/jSqUczTe3Hq9okgytcenuo=;
        b=hEW/ICgGgkkqUIBz6ZImRyOhnF8jcM3w2AmlQ4mAwVAN09pifbFLGkCdlYGVjHc7aw
         cHopX6hMOz6C3ayn4+l4UXo49TsoK8gIrsH5yWKIxZvPNFozPWzN1YwhP+/3tUXjmnKI
         ZXQnQvn5zmgdfnJ12+jvaWxTVjPiYObL7uzrjHGEvAm1HaML1/gFcvlWceQKbuDTJy6S
         S8OhGawr/DH+vO4RqVEzQwdEv2svHrquyNoM/ggPAtlHuy1a4RvqeImYw1/FNOFzUYKk
         QtswCFkY/ItSIXRh71LySNRRmG+YNba6eRM2gTsSrWxJ3YYzuneBsmmXWtBKcMbZuXyi
         bVnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760107189; x=1760711989;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FwwnIs4n2nwe2j9PHCbA/jSqUczTe3Hq9okgytcenuo=;
        b=u0kkI7YlT6N3hqqba26PmZNxIfwiATUZcTcaaGEM7xSBPFBifMucQUS84bWvcMBYBw
         AD81I2VMo88g0YkJ5aAP97HOsVauZ9bBuKqr6f4INOZftStpREQEB6QMZ60wOylbPk+K
         tc/E9vvqK5qyAbGR/zDG6DJ536uDjfW+UHbg8/57Q4HDsI8nK+pePhuErt6tRl48tdcg
         +2xBSucd9aJU4vUoCR1BA2mScN7yK+sGFvYIVz5K3iBcGVHgvirBKiGFI5RTgL0UzXyF
         lY979AktJDS3e//59Os9n5tdiwT8qTnpo93hIIM9OdDT/k0CCjAWuvILzXU76BbCw9/3
         2Y8Q==
X-Gm-Message-State: AOJu0YxSNA1joYNGKCsKIZyJFM67QpvpKjuOeexYHTqeBXOSRVvBGTQJ
	O0VI5e4D7mAo7eNwgzCmI9snVUw+eCI+8R+cB8KorJEyeAQPcLVavz4=
X-Gm-Gg: ASbGncvmJ8Pzsuz/w1lGAmWmYn+CWX3QjV6VyBAv5a3CEjHLME+/DyNGx0H6VNZqxGY
	kMsKCF+0rIJMKbUob3zMwT4PL1baZB/PDUfgH0qkH6R5B8SIXqYVOHgOGWbmxj6QEc+kRSFSe/s
	rwoistyPXnNd9mxTDKTXoWl5EOxJA6dk11AjuXPVqoYAAyDvxw4/fLF0u7jbSMifgpVKrq2GeBb
	9JIXkWtEsp1lP4jWLx0kBQmqLIyN0yJOSkvAF72MAxCLDwemN/laj9lMsEUnEsedFO+u3lpXreM
	J7/Oo5ngHCHMlj8hUEStqsmdjPFkm4Ul9sKHnKR8YScKZJD6mxfcn36/3lmfEpXM08BV2GNqtss
	ZuU+6H2IU/On0YyULdtK+QXfn8K0LlPQpbBaQl+KM0ZFs8frPeB+c4wv+pNs9xLed0oMojCRZIa
	XQ3M8YSIwu6iItoE7qbVMamkh1p5IHNjBTn0IBbxz/y/Ugv2E=
X-Google-Smtp-Source: AGHT+IGOxrusc6smb8SBR5+x6xl3cRKldjSb/YyljGP/mQFy81n104iuywGj7F8eOKDVZgA1+4ttoA==
X-Received: by 2002:a05:6402:50d1:b0:634:a32f:abbc with SMTP id 4fb4d7f45d1cf-639d5c53171mr10356947a12.25.1760107188733;
        Fri, 10 Oct 2025 07:39:48 -0700 (PDT)
Received: from [192.168.1.17] (host-79-26-169-51.retail.telecomitalia.it. [79.26.169.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a5c321453sm2488482a12.39.2025.10.10.07.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 07:39:48 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Fri, 10 Oct 2025 16:39:13 +0200
Subject: [PATCH v2] drm/msm: make sure last_fence is always updated
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251010-close_fence_wait_fix-v2-1-adb332dbff65@gmail.com>
X-B4-Tracking: v=1; b=H4sIAJAa6WgC/22NQQqDMBREryJ/3ZT8WBd21XsUkZCM+kFNScS2i
 HdvKl12+R7Mm40SoiDRtdgoYpUkYc5gTgW5wc49lPjMZLSpWOtauTEktB1mh/ZpZWk7eSmtwc5
 UhgFQnj4isj6y9ybzIGkJ8X28rPy1vyDr/8GVFavOlyjri3fW+1s/WRnPLkzU7Pv+AXHhIvu4A
 AAA
X-Change-ID: 20251009-close_fence_wait_fix-00e1c2521eee
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Antonino Maniscalco <antomani103@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Anna Maniscalco <anna.maniscalco2000@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760107187; l=1927;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=JLP84YwDYtnkcXuPlWz/96ycTDjsV2Qn2l1fDXZT63Y=;
 b=r93EYYuxOS7qVpQn9TokcRRHfgbS1UN9XfMZSXufiJ35KVgn9pUtggYZJti3JgShe7zze7EqV
 sbCZEmnUlg6CLUfVvrDIgKLtFk5jdMJy033dsQQyz3R0nViU5K6XefK
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

Update last_fence in the vm-bind path instead of kernel managed path.

last_fence is used to wait for work to finish in vm_bind contexts but not
used for kernel managed contexts.

This fixes a bug where last_fence is not waited on context close leading
to faults as resources are freed while in use.

Fixes: 92395af63a99 ("drm/msm: Add VM_BIND submitqueue")
---
Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
Changes in v2:
- Only update last_fence on vm_bind path
- Link to v1: https://lore.kernel.org/r/20251010-close_fence_wait_fix-v1-1-fd3e394dcadd@gmail.com
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 3ab3b27134f93b01236fec5833a18a6e2ad2cf5e..75d9f357437006ff261db148901e176eae670d41 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -414,6 +414,11 @@ static void submit_attach_object_fences(struct msm_gem_submit *submit)
 					 submit->user_fence,
 					 DMA_RESV_USAGE_BOOKKEEP,
 					 DMA_RESV_USAGE_BOOKKEEP);
+
+		last_fence = vm->last_fence;
+		vm->last_fence = dma_fence_unwrap_merge(submit->user_fence, last_fence);
+		dma_fence_put(last_fence);
+
 		return;
 	}
 
@@ -427,10 +432,6 @@ static void submit_attach_object_fences(struct msm_gem_submit *submit)
 			dma_resv_add_fence(obj->resv, submit->user_fence,
 					   DMA_RESV_USAGE_READ);
 	}
-
-	last_fence = vm->last_fence;
-	vm->last_fence = dma_fence_unwrap_merge(submit->user_fence, last_fence);
-	dma_fence_put(last_fence);
 }
 
 static int submit_bo(struct msm_gem_submit *submit, uint32_t idx,

---
base-commit: b5bad77e1e3c7249e4c0c88f98477e1ee7669b63
change-id: 20251009-close_fence_wait_fix-00e1c2521eee

Best regards,
-- 
Anna Maniscalco <anna.maniscalco2000@gmail.com>


