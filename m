Return-Path: <linux-arm-msm+bounces-67170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B8414B162CE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 16:29:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE359167C82
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 14:29:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 289F122A817;
	Wed, 30 Jul 2025 14:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cUPWoHH4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A6714F70;
	Wed, 30 Jul 2025 14:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753885784; cv=none; b=AkcVHPE6WTTSNUYN6zokGT10FtjEiwc0KHrC3ldBaJpFuEp9S3WlgWpXeaG0OntcFvcWaJEW9o95X4UAlauOYG3rZS61IwFeMntiLYobvZACqh9tDI6/LZY8vK5latv27l3Bi8iQKaCyX6jwi2Ul00/zk8oYYv3VGzA3+r0UTXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753885784; c=relaxed/simple;
	bh=8ADkRjqjuN5vohfHGdPq/PNNlSy0iV6Gdob2XuiQer4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Qe2WE5tDriiMMkY9yqkEDRL+wYraFJgEUhJr8wTE/w0j/MxyWbxeydcjRukrJn4AmIyHRJQp8LSaf2lQ3xrmXcf85KboV5LQCMqTZOiKLnX6s+5MU173fjTKt1Tvoa5y/NN3GyyDi3ylzlVao9E5V9hPjHUZmwaisGz0Xsjsrfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cUPWoHH4; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45896cf24ebso6012095e9.1;
        Wed, 30 Jul 2025 07:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753885781; x=1754490581; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7AlJVmOGzAKicB8PmUMEgldR0Po2jcqiFiRrgkUSQyY=;
        b=cUPWoHH4V15X4eM7j8XBIaYy0A4ACfAWSxIur9PXVqvEJzMeev/vXwvSbGZHWXuYtM
         RC+MV2znPIgkPfZOvajolG/MVcOyO1rdE96j8vKN+CqsRBzykYooXLcIHGeiQ0Oa98bq
         hDIFP0bEY8BtB9HCvxBMh6ucaQjJ5HDPHj3PKjGkNhQJY9kdtf4Efxl/Tu93qVbpbF0a
         6FlqCEZ2nAD0ULcJA1vOhrVru4KO3drTksk6MFbneNgb0THhXbkm5ekdDbv8bQizIhel
         kKs/IT5Lr7Tz6fBk+10ZwHmHylKL2Az8GS2eJhT2UVjvybHQS8HtgZbvvGWyGfGl3t/f
         8atQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753885781; x=1754490581;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7AlJVmOGzAKicB8PmUMEgldR0Po2jcqiFiRrgkUSQyY=;
        b=EQsHGyVWyaDw0uBjfgLsgNWggFjNq3smP1Y8wM+GkD06GzSm+RKNbf7/YLyFEb44sE
         HcCFNzfaY/Etdin8PTzoBLM8ai4H5v62cSfvvYD44IkZ0Es7Pdzp6lDG92x/GfF5wvcj
         NOJOqYxPvweCcHVuVQ0SMy0/Mbt9GsdpNzcQAQJQFNJHjypkfXJiLk+MDFg63IHhEVvr
         kWbNZMdHJ/hfctThQ/sGbMUkb4K+SuYgE0dfl4WQh0/ELD5WjtdiiT0XmyIt9/Z4RlCE
         jeWlCnMZ8lRj6z8c6ic71ckaOA2vRifqAltUCUCMxjdBqnRYSimsiWjSkBIbooBp6jpH
         bIlA==
X-Forwarded-Encrypted: i=1; AJvYcCVLZ/OiRmu0rZp2Oxo7vJiY62XYWGdjRc0MRxswDOPUblbrZVqvHAh5lMyyuezynOT3jRuBOsQO2GVxO7Mb@vger.kernel.org, AJvYcCVteddVi7upzRDvfMFxricET5uU5EQ/VDZykgjsIL5pZsA7UDPnAuPWJnZ1KpgOlGsVQGfJidLiCm0fGgPC@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj7Wo6h8ur+aIZIc8a6kKHdrqqj8dEud47ayGUH5EVpiLF1CAD
	QRjhs3aHNIUedOiCnkSFjwA7M6eRrY1shzJwvGVSJ8enG2PoVX/u0dt3
X-Gm-Gg: ASbGnctf0+y0J8utXcw5Kk2wVeoYbmBKJpy7LIhAkYM6QX9gbvs74nAq3nQdBg7woOA
	ssem8CZUdP142VAwrcZBP9wW6y7YZqehg3iUXUcgYwo0SK+xDlLIidYXzlxdFy4oQ8pHK+OjE73
	eXPJge8sCA9RvqNap2RVXC9J0kVbLuiI99vKWgs0pvD8cqfSpWm/Aqu/y+3tAI1qYcdWhdeTlX7
	pRving/bNcN45/89Db3jCMzTrFS9uQiFJq1F/98jzUEX+dUSNBeBLeBDUS6JI+w+1UjaSKK05rq
	Z6TKd/ydk3zaDLKrPi3mCyrbJAh/7j1/M3RMvvjrVBuCXA/pds2hYAxAP5YWXlCluOqU5zZsF4Z
	IBfDcILvBcQ5P3KRNfAZq
X-Google-Smtp-Source: AGHT+IF5QJ37jWg7fCnJbb/VaKNBhipzgn5fvN5Soc3F0FylcMx9EfIgS05bdT263onDGTvzEzsZGA==
X-Received: by 2002:a05:600c:5391:b0:456:58:1114 with SMTP id 5b1f17b1804b1-45892b9d05cmr33734855e9.9.1753885780632;
        Wed, 30 Jul 2025 07:29:40 -0700 (PDT)
Received: from localhost ([87.254.0.133])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4588dda59cfsm38833425e9.3.2025.07.30.07.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 07:29:40 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/msm: Fix dereference of pointer minor before null check
Date: Wed, 30 Jul 2025 15:29:05 +0100
Message-ID: <20250730142905.2080035-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Currently the pointer minor is being dereferenced before it is null
checked, leading to a potential null pointer dereference issue. Fix this
by dereferencing the pointer only after it has been null checked. Also
Replace minor->dev with dev.

Fixes: 4f89cf40d01e ("drm/msm: bail out late_init_minor() if it is not a GPU device")
Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/msm/msm_debugfs.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index bbda865addae..97dc70876442 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -325,25 +325,28 @@ static struct drm_info_list msm_debugfs_list[] = {
 
 static int late_init_minor(struct drm_minor *minor)
 {
-	struct drm_device *dev = minor->dev;
-	struct msm_drm_private *priv = dev->dev_private;
+	struct drm_device *dev;
+	struct msm_drm_private *priv;
 	int ret;
 
 	if (!minor)
 		return 0;
 
+	dev = minor->dev;
+	priv = dev->dev_private;
+
 	if (!priv->gpu_pdev)
 		return 0;
 
 	ret = msm_rd_debugfs_init(minor);
 	if (ret) {
-		DRM_DEV_ERROR(minor->dev->dev, "could not install rd debugfs\n");
+		DRM_DEV_ERROR(dev->dev, "could not install rd debugfs\n");
 		return ret;
 	}
 
 	ret = msm_perf_debugfs_init(minor);
 	if (ret) {
-		DRM_DEV_ERROR(minor->dev->dev, "could not install perf debugfs\n");
+		DRM_DEV_ERROR(dev->dev, "could not install perf debugfs\n");
 		return ret;
 	}
 
-- 
2.50.0


