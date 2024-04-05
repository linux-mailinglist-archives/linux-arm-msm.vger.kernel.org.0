Return-Path: <linux-arm-msm+bounces-16567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3B289A267
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Apr 2024 18:23:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB60328109A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Apr 2024 16:23:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1105716F82C;
	Fri,  5 Apr 2024 16:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E5Yg9tat"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B74416F917
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Apr 2024 16:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712334190; cv=none; b=XYhEzt6QqnhEfhdTMXlsIi1g1kv8c80q4yoP2B4At0LcBxqJvCNIUL0/2oBSlSOXeJ7dDsis8saPYi/HCk45GiQlJmw4b06SN9NTOofgwojKq3yB2Xmguh73YNF+XnYdffGjGHjO4Fo0elFTdR8wIZAqtX7nBw2tIilXOKX4HuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712334190; c=relaxed/simple;
	bh=XQM08lZSS+lEN8K6IX/WD8kjG/lSfxF1PVtiCkKq2yU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cabmoobz76AE4ur/EDag1PQGFKmmbKRdNgiJabetbNSbkZpc7MEjSA4JSf16tEYGD9DSfhnjhWLEUVXbEpIGYE2XIS49RUDzufBXPsB0YNDF0d83sHMFXZUucwk5ZpzUzzze/Yuw8+veKBDDxHtjNU4cbjs4a/ErJRkPsMA95RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E5Yg9tat; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-41632010478so4121365e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Apr 2024 09:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712334187; x=1712938987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N8PzygG9Cw15gnOEntIevKKPgEJjvGsvt2OjZdp/aRw=;
        b=E5Yg9tat1D0nz9AhN8E/2PGXr8SSIT4rP9UTOVapEnxJZiAkJBKZfTYvVzZP7tBPjS
         goRjhDQS6D9xrEMdVqkN6qW40ULa3PG2aASERarpGtWWMaayC+a1VPPnX6w3tEZIYfdq
         DLZ1PJZ6svDhYgf+BWz3ox8fXde7D9Hkm4SyshT+ez9yxtgRvTZL6GYsC4Ye7JV8MFOM
         EgZv6szGd/euTnMqptl6l1PlA7IJw9QKBvZBHbJ3PcIem3EYlKXVy9k7xXN1qYHkmEaD
         XG2Z+5QBWEx8hV5CKIUKOusMFgmbKT4jzKHElFhKh1aWAM/GZnay2E7p/M+y4Yl2lUOk
         oLPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712334187; x=1712938987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N8PzygG9Cw15gnOEntIevKKPgEJjvGsvt2OjZdp/aRw=;
        b=xNbpBBQxu9/LpFtU7vzW+KSjZM5nsXTKO7IXJoF/RSmwXOk5LAXMuu4Pt1VXkwBniy
         FDuI/JQE5I3WQwePdpAXwlPK+xXMvxblxI6rbrN66IEw2tkMcMMibYEC7z89J8LPFipx
         nOj4C5tLBsM9Vv9dH+oC4DjHLRmMfYxW6jbc0+4SJz5a/KbcQWnd9nQGr/eWrJHiTAd8
         Syth+uYb84cvrP2ckTty6tsoZzpdh8+k/0lnD0swL11GkLlU51kX7FiyFzoBsmMwyUl6
         7pRiZl1ZiNfj4t/B0m/zJDvxvaftWItAFv43Vo3NVQ0IcFSMIR2Pfh+g6MiKtaDdJRK+
         6wBQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6pgAIjYO15MAk3vQP+YCPdZQPKd51sysbH7hq7NHlbocWnt4R5IA3m7SQvnxvgIlLkImu4ivneuiezvuNTM3XNI4HriZPYlGxR3+M5Q==
X-Gm-Message-State: AOJu0Yw2KDXeU3K0ka+cUDFIf4fYaQGYUpBV6wOzFiibTmwGbqlnGVYt
	x27mybrA+SHepiQJjVEQ4GZ5KyRk3YPdzJ2F8SOiAl9yig1zuRYmdmJCKwNaEjG97IaT
X-Google-Smtp-Source: AGHT+IFN+qMN3zmW7DAcrfH0TMBfbZ8NmNq2xPimNi5AHkM4Y5HFw7O9qarVnZ2/x1mgTpiZvg7CqQ==
X-Received: by 2002:a05:600c:4f41:b0:416:1df0:7c06 with SMTP id m1-20020a05600c4f4100b004161df07c06mr1898228wmq.6.1712334186394;
        Fri, 05 Apr 2024 09:23:06 -0700 (PDT)
Received: from kali.localhost ([46.164.87.152])
        by smtp.gmail.com with ESMTPSA id hi23-20020a05600c535700b004146a1bf590sm6725202wmb.32.2024.04.05.09.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 09:23:05 -0700 (PDT)
From: Kiarash Hajian <kiarash8112hajian@gmail.com>
To: dmitry.baryshkov@linaro.org
Cc: robdclark@gmail.com,
	quic_abhinavk@quicinc.com,
	tzimmermann@suse.de,
	sean@poorly.run,
	marijn.suijten@somainline.org,
	linux-arm-msm@vger.kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	Kiarash Hajian <kiarash8112hajian@gmail.com>
Subject: [PATCH 1/1] drm/msm: request memory region
Date: Fri,  5 Apr 2024 12:22:07 -0400
Message-ID: <20240405162213.28263-2-kiarash8112hajian@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240405162213.28263-1-kiarash8112hajian@gmail.com>
References: <20240405162213.28263-1-kiarash8112hajian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver's memory regions are currently just ioremap()ed, but not
reserved through a request. That's not a bug, but having the request is
a little more robust.

Implement the region-request through the corresponding managed
devres-function.

Signed-off-by: Kiarash Hajian <kiarash8112hajian@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 2 +-
 drivers/gpu/drm/msm/msm_io_utils.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 8bea8ef26f77..e4f7c282799b 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1503,7 +1503,7 @@ static void __iomem *a6xx_gmu_get_mmio(struct platform_device *pdev,
 		return ERR_PTR(-EINVAL);
 	}
 
-	ret = ioremap(res->start, resource_size(res));
+	ret = devm_ioremap_resource(&pdev->dev, res);
 	if (!ret) {
 		DRM_DEV_ERROR(&pdev->dev, "Unable to map the %s registers\n", name);
 		return ERR_PTR(-EINVAL);
diff --git a/drivers/gpu/drm/msm/msm_io_utils.c b/drivers/gpu/drm/msm/msm_io_utils.c
index afedd61c3e28..34e598ce869a 100644
--- a/drivers/gpu/drm/msm/msm_io_utils.c
+++ b/drivers/gpu/drm/msm/msm_io_utils.c
@@ -83,7 +83,7 @@ static void __iomem *_msm_ioremap(struct platform_device *pdev, const char *name
 
 	size = resource_size(res);
 
-	ptr = devm_ioremap(&pdev->dev, res->start, size);
+	ptr = devm_ioremap_resource(&pdev->dev, res);
 	if (!ptr) {
 		if (!quiet)
 			DRM_DEV_ERROR(&pdev->dev, "failed to ioremap: %s\n", name);
-- 
2.43.0


