Return-Path: <linux-arm-msm+bounces-34012-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF9D999C13
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 07:24:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A00B6B22128
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 05:24:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5842C1F7062;
	Fri, 11 Oct 2024 05:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b="HAGQ+XYF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE6D8F58
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2024 05:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728624268; cv=none; b=Cdvi05JR4Z/bQKJhCNNQKMPXo4nOSws4LL3alXZCYH/L8jsY57q9PGqK6HkX8BE2A7yd1q3vmuY+4O3SHNXewU8A7BAwP7vnleRMxeL1ff48KaFlGMiS4h5i5zQRwggBPGvkQs8C08QrU594nZ+LROK9ka5BL4b7WaeCbzM7mAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728624268; c=relaxed/simple;
	bh=Eu5/Sx/8t4BbSYZ/Y0H81EOkKHldJwz4fE4MOrm/MkY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hq7IH0azi0anjB9mgkUeNa/4jhhju0pcbKv0YzhUXHau36P86jH42B1nz/IK5uFd2YXKfLe5tzt8bhrVJO1ZDfBMihAKJUmIT1D6e+tNhiJslX7LT8ocvj+3Xvrr/tWhGzAwn5+Wzsz43jJvg5ZQzFOyY/KTXq3KGR/6tpxllNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=everestkc.com.np; spf=pass smtp.mailfrom=everestkc.com.np; dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b=HAGQ+XYF; arc=none smtp.client-ip=209.85.216.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everestkc.com.np
Received: by mail-pj1-f65.google.com with SMTP id 98e67ed59e1d1-2e18856feb4so1575408a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 22:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everestkc-com-np.20230601.gappssmtp.com; s=20230601; t=1728624265; x=1729229065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2BGOKIsMg4QP3m6tKk3FDK1aa5VlkpqPKb0X90CWsAo=;
        b=HAGQ+XYFbq7tdQ3f25KCFGUKTML1YKfvlNBrxAbzIzN0eSPhMj6bPHzuOgRlkLTl0s
         smTxTYskW6Bc+jaOq3xjXhrm+g7ZftDTYV44sbA48NYU5Xwd2PTw+7QLIm1ch8yrqt0W
         OQE6FWSTxj+HDgx+QQ0oi/z03yzy2WGDZvJU+TrwdmfPt3CJQ7V1WncYYGHfojc8YvPF
         KzISOqvQ6601/hhLS1rO9DfvDBJyWOUiOI798vKGPMu5xJo6ljPyW705qZo+KomK5eIq
         5ATbBdVHc0mNUtDqZ7dc4PSL1hCGaZpgGenUovu12+h/ZYdI18PfNFT7ipjqwD+u+XIU
         0y1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728624265; x=1729229065;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2BGOKIsMg4QP3m6tKk3FDK1aa5VlkpqPKb0X90CWsAo=;
        b=I19rHghBry1zY02RLk/+TvEvQfKZyADrkxCqyIdyFkI1GgaFqNm3oSYoiMTEYxlmyQ
         UGy0myM9B8DStqeThcXOT+6kAm+XyCPowHU+dapj4z7AzGEaAVkoMivPshOnybwarcYm
         o3tKdYMEN+Du6tV6m7BiW5jn/CSHjAIVqAsdXO5+ZbWRFl/M0FF9cr+eX5trAerO8Yoq
         +OeL0LcTJFdQ2EmYRQRLyUz7jZm3ukwnVMhQNuXn7zs8MR2qxc7dMi9CP2ql3Kzko4/Y
         8Nh9K0g4arOQh/SoaArgw6NER/TgITtpTod30EC9OwV+RDN9onsfem9d0dUJU6N1pjAA
         VrvA==
X-Forwarded-Encrypted: i=1; AJvYcCWUdx6MgJX8G0qiSKeULZ6vzavGRtRo6XBcEB0o/b/YZ63Ulc0vlx5gtXIadsrCeulsrxUG7tDl5MWu5DwG@vger.kernel.org
X-Gm-Message-State: AOJu0YwR7b/C33/0ZfXUTAk3+DMy7hB1FtwZbpZiodM3ZJ2r1wq5dFLv
	AC4AT2jTcKN0uomvZlOU7uUgezosODGCBV59jJ9YfKfkTs2Hbq6c12dniswZZYM=
X-Google-Smtp-Source: AGHT+IH//kLRhYfrjYGsfIlcKbHS3xoQNKhRAMnMq31mnsU+jdE6aFHUT5rih9UTGv4Vs6virTNbVA==
X-Received: by 2002:a17:90b:3844:b0:2e2:8472:c350 with SMTP id 98e67ed59e1d1-2e2f0ad156dmr2213900a91.17.1728624265466;
        Thu, 10 Oct 2024 22:24:25 -0700 (PDT)
Received: from localhost.localdomain ([91.196.220.222])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2e2d5df1133sm2380070a91.15.2024.10.10.22.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 22:24:24 -0700 (PDT)
From: "Everest K.C." <everestkc@everestkc.com.np>
To: robdclark@gmail.com,
	sean@poorly.run,
	konradybcio@kernel.org,
	quic_abhinavk@quicinc.com,
	dmitry.baryshkov@linaro.org,
	marijn.suijten@somainline.org,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: "Everest K.C." <everestkc@everestkc.com.np>,
	skhan@linuxfoundation.org,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/msm/a6xx: Remove logically deadcode in a6xx_preempt.c
Date: Thu, 10 Oct 2024 23:23:14 -0600
Message-ID: <20241011052315.4713-1-everestkc@everestkc.com.np>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ternary operator never returns -1 as `ring` will never be NULL.
Thus, the ternary operator is not needed.
Fix this by removing the ternary operation and only including the
value it will return when the `ring` is not NULL.

This was reported by Coverity Scan.
https://scan7.scan.coverity.com/#/project-view/51525/11354?selectedIssue=1600286

Fixes: 35d36dc1692f ("drm/msm/a6xx: Add traces for preemption")
Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
---
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
index 6803d5af60cc..2fd4e39f618f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
@@ -297,8 +297,7 @@ void a6xx_preempt_trigger(struct msm_gpu *gpu)
 	 */
 	ring->restore_wptr = false;
 
-	trace_msm_gpu_preemption_trigger(a6xx_gpu->cur_ring->id,
-		ring ? ring->id : -1);
+	trace_msm_gpu_preemption_trigger(a6xx_gpu->cur_ring->id, ring->id);
 
 	spin_unlock_irqrestore(&ring->preempt_lock, flags);
 
-- 
2.43.0


