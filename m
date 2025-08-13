Return-Path: <linux-arm-msm+bounces-68987-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2E5B24A69
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 15:17:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F1E116B210
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 13:13:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98B1C2E717C;
	Wed, 13 Aug 2025 13:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GI5aCqOx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784E123D2B8;
	Wed, 13 Aug 2025 13:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755090795; cv=none; b=tTp7T+v478p0Co7Dt17BIVhNpsgOIpDql2iHK+mMmjqzsX6O32OKM/eyh8tD0PBrsi0hprmPoCbJWGsXr9tlA5d7uWQ8KDRJFvir4leLFrA6UAQAQWcuonARiq2jqsj3WDZlFa7zcuUxtiYqk5+wNbiWT6gSqsRDlVtlKPnS5zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755090795; c=relaxed/simple;
	bh=xQsf6dXU9C0LhRZCky8V9fz3sqI9Jm9JjLobbEzFe3c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=XB9qbAh8YTI/lCdO9pu/9Ddp9/aJ+eqbN4CPvI4amGr4n6+4y0EiTTUZ60+6C1xrUOcznQB4Mq90lNAoyfavTRnSpcchqNYjZgMmbHysVAH9VUHVxhNh+iFzSlwt0v4NLWFZnMaFNpUv/b+bJamlHl8slqqQksUMp15SdddAzgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GI5aCqOx; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-615460d9897so7441629a12.0;
        Wed, 13 Aug 2025 06:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755090791; x=1755695591; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zFdLFCkq6BKJvmfth9X/kq+wVTjql7oBUHjNEfqADVY=;
        b=GI5aCqOxmvaWYqDXf9KiGGmDrzvrqXJPL6aiDs6qiyauyrU3yCcW9PlosSCsgislAA
         Iifo3YcCKK3OkvLyEV3uPl1nvqEyzoqviiozLpN8oHsCFb2SYPj8UTgFcQQbCrwmOpWp
         5sTVETZdaOB/SRMEhhpbB8S/u7bhsZS98fntZ4rQNySb1yzs6WktDr8VOMVGDApmyNxI
         xf9i/e1sRuVCesiHpdUYCb5JweaaGDDRQ8fAa/HxVZeFtRpZ/jTl7wz/9JWt6OsqSFHD
         lyrpkNo0p0WDgv0crKAvZDI+967/5lmKGPFFF0jM2Cqu2WnJkkfPOrYV22gBuLYcI0oK
         UQlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755090791; x=1755695591;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zFdLFCkq6BKJvmfth9X/kq+wVTjql7oBUHjNEfqADVY=;
        b=QHCWu/dXngNj2DvSGXSIxbtpN4fUBzUyIMR1AIqYhiYrPkYyKl4x2BEBSkgvs+wsZw
         W3qfujIimNaBiIJFz8C0g81jh/r+ycD3ia3Rs/RHGW0gKbQw5X50z28Bzs4XTUrZdhmK
         SknKQw4m1r5yqZNcEaLi8aE2xBHWi6qTeVkvaW0ZmxPBp2K+4ep3whD1CoKoyqn4/QjZ
         yrwi9y5zIyHqPC5HIJqljzeybkMVtYS/p6dA9XS+SmtF/nYQMfCFmubKWav5FMF0Vt6c
         usnwZOhjhEVwWr+r70mVsMgxaDNt29khYafsyr+1aZK3i4QJHvw3e8Rw+ElqtSNmWAqE
         No4A==
X-Forwarded-Encrypted: i=1; AJvYcCVFF41km47V8EySGlVFzRUlNFZKWOyPaYLGF5yNNKjBlLpmnoUMDA945VXRZJevff3aI4GPdxZqww85bD0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs422eq4Db3BbGRnCUfvnWg5CUSbHBz6P19Xzvftpopp+jH0MO
	zEo5bsE/KfeM7nbmCsvu81qMdFMwONsvUQOIY28qOYY53or/Oj7OwJ/X5FzoTjwL
X-Gm-Gg: ASbGncs7btts8u0PPzKnQqyc8T3UDFUGFqiPQouN+5OrNdWi+WIdyVqIysmB+KmdfPM
	2t9/QK9sUDtLuieyFufxvIYJrQyALKY5eXuFze/VtQ6B+8XlcSuXYKB6uv6EYTKatOr1Eol6bDG
	KF3sNrIcjAF41HWBHBSCcXxedxkxVu6mUtl7mh9OsiqNTcI77L9oDbzSy1Is/r6AhkZz22sgUa2
	wLnRgFYrwWjXFRWHgDnKYTHf2eNw1gjapL/MRbu6oI4iLxNVvxww8B/jIUjrbzgc0NqMq/6aBDu
	8TKzKfOnNXId8+BweqAslvHRzN6a24J4fF/Z0UOj8xKCX0lsC3oOi8WxW0U5v+vdh7ONCGWVAL5
	s4THDCJbbCGWJUGgoFg7cU2frIJnzEBh1E2QEexBjBeDX2Q51SOP2lrXjnpi2MGUmchwQ9FqMQw
	s=
X-Google-Smtp-Source: AGHT+IFbOKjKDZzd6E4UUe1XMBuIL0ISjeH8uTqctsugShVQgQI4ZEs3ZUukQzl02z7akc9cs6hJXQ==
X-Received: by 2002:a05:6402:1e8f:b0:618:1f67:ae62 with SMTP id 4fb4d7f45d1cf-6186b78c09emr2732398a12.7.1755090790546;
        Wed, 13 Aug 2025 06:13:10 -0700 (PDT)
Received: from [192.168.1.17] (host-79-36-162-144.retail.telecomitalia.it. [79.36.162.144])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8f15d9fsm21681132a12.17.2025.08.13.06.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 06:13:10 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Wed, 13 Aug 2025 15:04:44 +0200
Subject: [PATCH] drm/msm: skip re-emitting IBs for unusable VMs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-unusable_fix_b4-v1-1-3218d166b8a8@gmail.com>
X-B4-Tracking: v=1; b=H4sIAGuNnGgC/x2MWwqAIBAAryL7neAjK7pKhGhttRAWihFEd0/6H
 IaZBxJGwgQ9eyDiRYmOUEBWDKbNhRU5zYVBCWVEJzXPISfnd7QL3dbXXAo/Y7No35oGSnVGLOY
 /DuP7fiTyvVphAAAA
X-Change-ID: 20250813-unusable_fix_b4-10bde6f3b756
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Antonino Maniscalco <antomani103@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755090789; l=1446;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=xQsf6dXU9C0LhRZCky8V9fz3sqI9Jm9JjLobbEzFe3c=;
 b=LAy/fzSqsj0WmX2lkecW7V/9WveJcaE+t5N6j5SppkV9Ia3LRzHbmGnBG/o8CgGdj7YjYiZbc
 VckHvI/kO1tDzpbSGTryP9xcfWank44ijGoXsmzszWpnjK5ls1Ku//7
X-Developer-Key: i=antomani103@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

When a VM is marked as an usuable we disallow new submissions from it,
however submissions that where already scheduled on the ring would still
be re-sent.

Since this can lead to further hangs, avoid emitting the actual IBs.

Fixes: 6a4d287a1ae6 ("drm/msm: Mark VM as unusable on GPU hangs")
Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_gpu.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index c317b25a8162edba0d594f61427eac4440871b73..e6cd85c810bd2314c8bba53644a622464713b7f2 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -553,8 +553,15 @@ static void recover_worker(struct kthread_work *work)
 			unsigned long flags;
 
 			spin_lock_irqsave(&ring->submit_lock, flags);
-			list_for_each_entry(submit, &ring->submits, node)
+			list_for_each_entry(submit, &ring->submits, node) {
+				/*
+				 * If the submit uses an unusable vm make sure
+				 * we don't actually run it
+				 */
+				if (to_msm_vm(submit->vm)->unusable)
+					submit->nr_cmds = 0;
 				gpu->funcs->submit(gpu, submit);
+			}
 			spin_unlock_irqrestore(&ring->submit_lock, flags);
 		}
 	}

---
base-commit: 8290d37ad2b087bbcfe65fa5bcaf260e184b250a
change-id: 20250813-unusable_fix_b4-10bde6f3b756

Best regards,
-- 
Antonino Maniscalco <antomani103@gmail.com>


