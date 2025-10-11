Return-Path: <linux-arm-msm+bounces-76835-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE48BCF5CF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Oct 2025 15:45:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C06A3AB95E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Oct 2025 13:45:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A5611C1F02;
	Sat, 11 Oct 2025 13:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gIVrydn9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D55B3A1B5
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Oct 2025 13:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760190344; cv=none; b=Ox8STQ0qAYHiEowe2XUMmP8ScwNrf4+kEdUPamkVE2ZCLE8OJQGeYKxPmQzcwlU5VYv7SXRCfi9iOt7aeD44ic6CVkJI2JkJGtobnJH//hxBbI5U376c2W87Bvc+4t3xt5e405Qig05Pdy/azavQlbayQI47OLvJkqpMirQdgdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760190344; c=relaxed/simple;
	bh=iFYvEtWlC7xxF1kiaqDFQ3ELFe/iyBZgt0MDdURh88Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=oeFWOq/NdmytPWvoShR9jXz/WKVj9fnz5l4fD6ZlhVtyc25UL9p8GoypoGYO1E636TzTOTSmWvk/226znJouksjg+tO/iyON2y3RsfW0hmm7VEprhHPMHWbokw70FDBCtTqdAHIqSa9+fMUMk/XYhs/Z4KrVB3M5GV2Thxez49Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gIVrydn9; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-63963066fb0so5949922a12.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Oct 2025 06:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760190341; x=1760795141; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eSN6YJly2uz/i5kBQYAcGqHNw257xKcldfsRLDm9KbU=;
        b=gIVrydn9Vp8rdlikttMQZ/VHAVdeC374TJBpNu47lZtIwZ/8U1YHoROeRId83IM0XV
         LTeiLNBPF5hT9qJJzKfZbZboG3BBNxqC4XmDHk/ck3I1/oMVf80jbYdnukdG2ZOq3ymq
         8l/QUY1CeTnHhBVySOvStNmCjx6JZo39Pxv+hQmeBHHnWb/npw88EfGVkpZ9ZLSBOwM5
         E4wBaARJ18jFMBo0L/Rd217SaAGWyCv6B/UrTJkllWLwltJKveGyd31uc22beSFrcL8g
         R4iVFLTdUtVH5a4gCworf/7nMvvxfsRyUWhWNeCskLZHzolRktg4Tkw97zi54as7WdeD
         p1vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760190341; x=1760795141;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eSN6YJly2uz/i5kBQYAcGqHNw257xKcldfsRLDm9KbU=;
        b=HklE0JWY2W8AtPu0qGBzTvqlb5pyxDxbuleBUF+fMz/zLPdLpHh1W79VBEv20G1ktG
         2lu/sDDUj8SYjZxCZgX2Fnv/h3MKNCIuC7sZ3DEMJBcENB7sneJDSksk+e3KK/05tffe
         XalYFlBNoLDITmH5sbbmhB5iTZu28p57jBGGDIXX0MPxoepd5NXzLm9jNemyXYXhD586
         BkbpVqJt6r7CzM64zA0QVt2kV0q3yi9mbPtEtbpIM/Nx69oHFI3VDqLzjFxmWtHUb7Ff
         kh1KWnrtL1M0jadjwi2KFfTj+r+m59/xBSGJyhe2yNDU1qO/RtfjHTikOfAULN8iBHTF
         jI7Q==
X-Gm-Message-State: AOJu0YzfhrmRX9fp+75NAm8M8cgvldidwh2d76kevej8PYi0iElgowrR
	2Z+B7GTI9SRjRJejo+YYWWB13I67P89jYV9u4kZQB/dkwyjhanZj/PwLggb/
X-Gm-Gg: ASbGncspHxDmwXLlK7/8eeq+7K7vc9YR9X2/CyQEA6mJgtflqfNV3subD2t4H7dMmrT
	8SHK3A+uTl5n9ptq+dlLVf+UdUB8HMqXp9NhTMqU5Muhm5MR58Awb09rPtyeSEUx6cHftkHFzO0
	2AqbqX/DGX390hYYVJehDAj/5DjTTRB5xJn1MRiZ8X/lE/Lv12md76NTzKitwoB1yPPZnyq6C25
	dO1/ODsluyqWZVLf8qepxosmqgflINe2SrhjeDGgU85THE/lQSS4EdZXVkGIqUM9O88eog1uALu
	TJXxFJouG+6LrcJU+857KeBYIMAC3jibC6b14CDmL4P00sx/HR9PvaYGlfnBCVnx86nztVRphCn
	3iM9lMbljBOWKs1ojKjz2CKxckQwBZfVoiPybeF0QyLFVyn6nHZN1lodmwOg5qDXEPE/pmMPa9B
	1fj1wxWBhTCGfba5tezUQpcYO5/7jvez43NiYTDjc=
X-Google-Smtp-Source: AGHT+IFxwNevxZuakuH1AwVGVUxgynpTEfjH50O/959om/vjv//gOoU0pSJRYKc+s8OpRyguD6wedQ==
X-Received: by 2002:a17:907:3e05:b0:b33:671:8a58 with SMTP id a640c23a62f3a-b50ac0cb5dcmr1592525966b.37.1760190340665;
        Sat, 11 Oct 2025 06:45:40 -0700 (PDT)
Received: from [192.168.1.17] (host-87-19-169-144.retail.telecomitalia.it. [87.19.169.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d61ccb09sm470963166b.19.2025.10.11.06.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 06:45:40 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Sat, 11 Oct 2025 15:45:10 +0200
Subject: [PATCH v3] drm/msm: make sure last_fence is always updated
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251011-close_fence_wait_fix-v3-1-5134787755ff@gmail.com>
X-B4-Tracking: v=1; b=H4sIAGVf6mgC/43NQQrCMBCF4auUrI1kEivUlfcQKWkyaQfapiQlK
 qV3Ny0uXLhw+T+YbxYWMRBGdikWFjBRJD/mUIeCmU6PLXKyuZkUsgQhKm56H7F2OBqsH5rm2tG
 TC4FgZCkBEVk+nQLmeWdv99wdxdmH1/4lwbZ+QBC/wQQcuLMKVXWyRlt7bQdN/dH4gW1gkv8gM
 iPaNkpJ2zh3Lr+RdV3fF0yhQ/0AAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760190339; l=2066;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=iFYvEtWlC7xxF1kiaqDFQ3ELFe/iyBZgt0MDdURh88Y=;
 b=0JggH6t/TIHGmWfFVBv+owfEoMyqVT7mhRAb3nxyr2ha5tqUUZN4EesSAzkWYqalqgfHTvUq8
 DGbonyZztQrCEgdQZF7aL8H5sjt6yJwRvyVXi4tzO0dhOQpo283VE+a
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

Update last_fence in the vm-bind path instead of kernel managed path.

last_fence is used to wait for work to finish in vm_bind contexts but not
used for kernel managed contexts.

This fixes a bug where last_fence is not waited on context close leading
to faults as resources are freed while in use.

Fixes: 92395af63a99 ("drm/msm: Add VM_BIND submitqueue")
Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
Changes in v3:
- Fixed Signed-off-by tag
- Link to v2: https://lore.kernel.org/r/20251010-close_fence_wait_fix-v2-1-adb332dbff65@gmail.com

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


