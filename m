Return-Path: <linux-arm-msm+bounces-76751-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 981FEBCB0BC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Oct 2025 00:14:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 505074801D0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 22:14:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F40CF2848AF;
	Thu,  9 Oct 2025 22:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ps0RmTM1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3054F283FCE
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 22:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760048060; cv=none; b=T2qWGop9r/+IjEvMpJzRI2NSjADurpu6RdvXesqT97G5y/qd0ZRUq6D8895UI/5Hw3vz7inBssc46E6XZMw/3YHTd2XhrLDW0smLiYffA8Otbv0HsIVpllNyGG94UFG08lFLWEVefJAhuaZfREJ+JheNO9ytAhgPPvQFHn7pWYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760048060; c=relaxed/simple;
	bh=HDcLQ9jItgD9jx1XKHtGXKjYDLot5RODNSnCPekFFbU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=tb0oDscXj/ndPX6D4iz1hjruPhZE2lAuQOKePEv3vN69VaW1t3pQblba8AJBHr8qSbe2A56OVAmJlOAfNdW1z85DQ97rIHq1cHXLl8FPO7vyHWPf/DKnFuBWrXY7tSTZfTLVxs5MMugfz28jbfnR67O0nnl4xfxLOjf8zNVevJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ps0RmTM1; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b463f986f80so327819866b.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 15:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760048057; x=1760652857; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+C1qgBpiLGQ9qb0EvZ/pqN9napeSCut88weJBHDFgWE=;
        b=Ps0RmTM14wbaEyLkVBn4QSwJ+qqFIzxsG996ygp6nTo7jgVz5yVdWKYLdRJMHQPe5i
         OgueF6eYI6tXZ3zkYdDs6I6c4yxwx/tFIGFROgT7KAxgUVC6leQM6iPHaDZNV0NqK68h
         EjshM1M4OUwffiA3CJb0jaqTjB12YnLbZK1L7kBgbI9iSnZ05XKHCKvCMVvYz5pV3LSP
         65vo8MWQjgmv1UItTcVc65mFyT74KkxazayZA26sRz2sR/K9NA7a0GYXuxTEEAq8GBfq
         HBXBuleNloRkWvbH+QHVD1i18ctcDXxwjmWq2FR8A4tHdYcBUU4P5rX+0Jbc6WCNmHXh
         BLbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760048057; x=1760652857;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+C1qgBpiLGQ9qb0EvZ/pqN9napeSCut88weJBHDFgWE=;
        b=DMjQAk/69eT1SjN+G6nb2MLOP97jUtcUhe8QRUORrZtMyCfAWZe8VT8s7/f4H4wnxm
         lxJ1Not4NmJ7cKuRrA+DSsSiHQ+E8cbc6oAJX2F0/taNtmthj4R/319TF08OOsjc3ng2
         GA4HK05xy03hGFrH23hh2pE+U0u7+cdpeyI+aMc3ru8Yt9m3C1DyQ51OrWJ6K4nc/Zgl
         P2opXaI3uz1MD43K990hkveT705ohRDvkSjdhyAd6PmTcVo2VJtqPIo5U7LPkHK8stGW
         5HOalQ8PyXEUG6xRN0CuIucPRc2VhHtkeMgHVEhXWC1U/8AlSV4Qx2d6WTNqgxfeIkDF
         niaw==
X-Gm-Message-State: AOJu0Yx3vJFHnZvW4kAZCA3qcLlR54auai3UUnLd3icQ2x+oJSKRmo5B
	Fdx2kjVj/sg3+NEBKRLPdesNgPHS5Ctkrw+GcGFat+uleSTuy9WSM6I=
X-Gm-Gg: ASbGncuOeOVQmGeUdpgvfOqpmBpPdtownkEbXurgD1SqTxatcaxs46CHXXtUmWChsyI
	s7Rf1o+giVvlns4xTzMwmtd4q3BCXZnn6sWRCNkXxP+UrrjE8h22hh6jotc+NJHwl2wejEgXqmm
	KbOcTVE6IJAfWy04Sag6B2pELw4KWSaDKgr42lQYNjceFpOv6R+lEjnJpDABXx62oYUO5/0SHu6
	3B9xGnjuI8tMZJKZC5eusp93WyKW1LfIEswz+RrR45IE2fq4VTEeBT0RoMrrkidDGDUVjG0W3Nf
	Q1Etzq4N0a7K6IORR/DEuRBv6ryteC7GlsRSx53vaGkKdVnVJVmLu2yjQARoCtDexCG6pdFu6WG
	o/dcDwQ+oImil2qpIOB5WWf7ILyNQM+nxw8Oh5iD+8bgfWSGbQ7RgZrzDIU0YsBQgNrOP4CcN4n
	d1u/puuWIYJtwEaW4EVccVHRsAl82M4OR54Fdtw66qpw==
X-Google-Smtp-Source: AGHT+IGJY2MnbndzBWS/Rpwtary79mPSlYcRrWBWKoF2nGdG3wTBAiynYZRbgnU4c2AkM1DSx73G6Q==
X-Received: by 2002:a17:907:60cb:b0:b3f:f6d:1da7 with SMTP id a640c23a62f3a-b50ac4c4085mr1073754066b.54.1760048057118;
        Thu, 09 Oct 2025 15:14:17 -0700 (PDT)
Received: from [192.168.1.17] (host-79-26-169-51.retail.telecomitalia.it. [79.26.169.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d67c9b68sm69162366b.32.2025.10.09.15.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 15:14:16 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Fri, 10 Oct 2025 00:13:35 +0200
Subject: [PATCH] drm/msm: make sure last_fence is always updated
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251010-close_fence_wait_fix-v1-1-fd3e394dcadd@gmail.com>
X-B4-Tracking: v=1; b=H4sIAI4z6GgC/x2MUQqAIBAFrxL7nbAKftRVIiTsWQuhoVFBdPekz
 xmYeaggCwr1zUMZpxRJsYJuG/LrFBcomSuTYWM1c6f8lgpcQPRw1ySHC3IrZmhvrNEAqKZ7RtX
 /dhjf9wOaWwlrZgAAAA==
X-Change-ID: 20251009-close_fence_wait_fix-00e1c2521eee
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Anna Maniscalco <anna.maniscalco2000@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760048055; l=1780;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=HDcLQ9jItgD9jx1XKHtGXKjYDLot5RODNSnCPekFFbU=;
 b=0XGlKf43ydVDbBU8ka57El68pwGM62R4dn0ImMJ8BTHLNe67KsNIpUaqhZjUzg1QMDFt7U5sG
 PjwlujPkoBdCnP5j5xX/9+hAc74gRAAO00sSJEmhoWgMgetUSoKT4Pd
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

Make sure last_fence is updated in both the kernel managed vm path as
well as the vm-bind path.

This fixes a bug where last_fence is not waited on context close leading
to faults as resources are freed while in use.

Fixes: 92395af63a99 ("drm/msm: Add VM_BIND submitqueue")
---
Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 3ab3b27134f93b01236fec5833a18a6e2ad2cf5e..ae91a5614bf377985ff7875fc36baf174780a250 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -409,6 +409,10 @@ static void submit_attach_object_fences(struct msm_gem_submit *submit)
 	struct msm_gem_vm *vm = to_msm_vm(submit->vm);
 	struct dma_fence *last_fence;
 
+	last_fence = vm->last_fence;
+	vm->last_fence = dma_fence_unwrap_merge(submit->user_fence, last_fence);
+	dma_fence_put(last_fence);
+
 	if (msm_context_is_vmbind(submit->queue->ctx)) {
 		drm_gpuvm_resv_add_fence(submit->vm, &submit->exec,
 					 submit->user_fence,
@@ -427,10 +431,6 @@ static void submit_attach_object_fences(struct msm_gem_submit *submit)
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


