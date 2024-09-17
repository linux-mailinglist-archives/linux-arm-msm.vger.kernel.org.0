Return-Path: <linux-arm-msm+bounces-31903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D80397AF6C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 13:14:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3636CB2489F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 11:14:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 426E516B75B;
	Tue, 17 Sep 2024 11:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IbgCSRTp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79EC816131A;
	Tue, 17 Sep 2024 11:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726571660; cv=none; b=rKyhv6o6YzxK8jpRwZJ3Y78RXB7p9by5viscdRCsOCnwwSYUF/EQhg/DZQxExnvbOJZaDViCX6rNHHKu+sFYGvoYXTtUslvRftnoL5YLKR/3LkXaAj5DU+HTigjlMoVUtra6hFHPfCV8o+X3Gk0XAr9iQNLNOdMRFR/vuEjPWhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726571660; c=relaxed/simple;
	bh=V6jkAeJmIPNRJFej3NR/GIrK2ICQj0XykO4lOq0cjkM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dDWPJeEVdpn/9wrv4sg4ec0WbPsB0zRRmiFnCsz1RGURerf+ZZp8n1/fuKub6rMTi0Bcu12SVM5ZMUnagv/HydAbLlsDiuFcI7FgceD7OGkeur5WlPNqqJdZlinIJR2DVzAvthxXpalLmhV49keR7OtlXCr+qjEePRmEZY6L8mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IbgCSRTp; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5c42e7adbe0so2941958a12.2;
        Tue, 17 Sep 2024 04:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726571657; x=1727176457; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ow4BKSNXeJuwl4BWibh52xw/cDIJ4gXhuaEoDSj5CrM=;
        b=IbgCSRTpvtXbOBFHhUywVi2J4dM5zX9yrBVJWggjaK5KIvHJwPb1vFBUaQLH0eE7QI
         qqesrdl+O5H5EKQnsnUZh0U+egnux6zOnp5b+7+5ADV+TNrDqOcqOdHOAQlBlv/hb1PN
         it24ZwLtPuEBeErRRvs+WSZFJ7ntXCLSQMdxGSZ4wOY9wUPbEIGKvfjjObSZUOHKDo2k
         UsfB5NIdrcZGadGuLoCdz691NrXeJdeSTrvdDrH6DcDsG9zqgYXVpMuLpaIVV36depdo
         mTABl5+F/N+UECDjICcI7xHSCr2odqz3iga/UNDOIVXxeopFjXUJv9dsguG746ZkiPju
         Du3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726571657; x=1727176457;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ow4BKSNXeJuwl4BWibh52xw/cDIJ4gXhuaEoDSj5CrM=;
        b=T4E148rxqvnYDW0RGzhipMbkqcF0wJpuDTcsyarLim3RQtth0JGIKLck+cZ6ouAWyi
         WoQuj8rPYxK71Wcl8he6OKhxPkKDdJEiBqt2GFXFk/QVOdoTRpiVXkCETOg0AYe8ROyP
         sdl2XMfDLdQk2OpehUApmRIJPTXPJ755ej4xHaCJxt8yyNI3Fr9xS/c3nB7A7+yLXEUG
         PkpHdbJk9TpAJ89VDWp8DASLNfd+D+2YPysmeL39o/tLREL8zQ6Wz6CpM9r6t4NN6n8c
         z6VHnbzzpp/pcfZDFLnkTfmAT2QvLmTZ9Hd223+YS1tNjIvJEA3r2FD1pD68td+gADrb
         q1PA==
X-Forwarded-Encrypted: i=1; AJvYcCX/qERPUJA18kRaCTQiAF7QY/o3GcFJ1AF02ROdAvI7QXEdBKwcpRUL+XkbgX4ZlhlBxd1fFM1K+xs=@vger.kernel.org, AJvYcCX8ejJIEU3Q7W9gm00OWPhfa1+u2ghsFwAPCbF3picPl/mnrsMOXkcNotZmvgur3F5pgQuwgtK5vf12YVcV@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5p6k9wpXj2lru/TxNMWucyUdThdt2L4vdwtfbv44wdkL15E0m
	XzvEgtzZu1ajYfqwq4cdvv3lHnYFxSjlDXrq4jNsSVKU7BDPGBeN
X-Google-Smtp-Source: AGHT+IE/JEdEsep3i02jeqUmwx8Ak/gIHQRnh0eocuiJyK9cVkQdx3+N5Uy2ilhfE2iIYQdc8HcBSw==
X-Received: by 2002:a17:907:d2e4:b0:a8d:3705:4115 with SMTP id a640c23a62f3a-a90294ae850mr1696024066b.32.1726571656667;
        Tue, 17 Sep 2024 04:14:16 -0700 (PDT)
Received: from [192.168.1.17] (host-82-51-105-30.retail.telecomitalia.it. [82.51.105.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90612e1a55sm430745166b.157.2024.09.17.04.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2024 04:14:16 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Tue, 17 Sep 2024 13:14:11 +0200
Subject: [PATCH v4 01/11] drm/msm: Fix bv_fence being used as bv_rptr
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240917-preemption-a750-t-v4-1-95d48012e0ac@gmail.com>
References: <20240917-preemption-a750-t-v4-0-95d48012e0ac@gmail.com>
In-Reply-To: <20240917-preemption-a750-t-v4-0-95d48012e0ac@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Antonino Maniscalco <antomani103@gmail.com>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726571652; l=1564;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=V6jkAeJmIPNRJFej3NR/GIrK2ICQj0XykO4lOq0cjkM=;
 b=8uPB0FH7LZTwiL8pSn6PqMzESFVVqmDiWrjTqy1UsNfeHhJZtkUQjX2qg/TP5hSTOR21VRZt3
 PoACEWqiaVkDSINz8O8HZp/5pkQ4sALnF7Cly9ae5qbgXuvdV9ZgOE3
X-Developer-Key: i=antomani103@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

The bv_fence field of rbmemptrs was being used incorrectly as the BV
rptr shadow pointer in some places.

Add a bv_rptr field and change the code to use that instead.

Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
 drivers/gpu/drm/msm/msm_ringbuffer.h  | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index bcaec86ac67a..32a4faa93d7f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1132,7 +1132,7 @@ static int hw_init(struct msm_gpu *gpu)
 	/* ..which means "always" on A7xx, also for BV shadow */
 	if (adreno_is_a7xx(adreno_gpu)) {
 		gpu_write64(gpu, REG_A7XX_CP_BV_RB_RPTR_ADDR,
-			    rbmemptr(gpu->rb[0], bv_fence));
+			    rbmemptr(gpu->rb[0], bv_rptr));
 	}
 
 	/* Always come up on rb 0 */
diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.h b/drivers/gpu/drm/msm/msm_ringbuffer.h
index 0d6beb8cd39a..40791b2ade46 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.h
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.h
@@ -31,6 +31,7 @@ struct msm_rbmemptrs {
 	volatile uint32_t rptr;
 	volatile uint32_t fence;
 	/* Introduced on A7xx */
+	volatile uint32_t bv_rptr;
 	volatile uint32_t bv_fence;
 
 	volatile struct msm_gpu_submit_stats stats[MSM_GPU_SUBMIT_STATS_COUNT];

-- 
2.46.0


