Return-Path: <linux-arm-msm+bounces-32778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A765F98A611
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 15:53:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 62C2C283F37
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 13:53:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD18F191F79;
	Mon, 30 Sep 2024 13:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F9y5QTTs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E523519067A;
	Mon, 30 Sep 2024 13:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727704368; cv=none; b=t/HT5sbfDFyb7ro/kL8fhLdRWjajK/CSTGRwVcRd68i7Mj2D5k7YV0LXumzU4ddxGXsQv0GE+8VXC77JY1ATypd9qStwP5DSATGLjNADAhWFJK8dhb4w7orXie50UvLccTAyM6QmXiToAvIsIWTvM4qOWC0Q4JWcxEpM7B/lJ/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727704368; c=relaxed/simple;
	bh=mw98QEzBIwYx44vG8hfTrLa/RurlCEDImHR+oHkKWF4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GdxCu1dBnbNJTCjadP3b4vNltsAvG2qGb66HDTy/U/KZu+TXnIlHVV6EjPe+xcPKjObuzBzxymiRJqQA1NbQrWfFsDDn6tqGXRqX1MUNSTdxSvdiMrmC5rgGecdpyeK8B8b0lgqt9ukEA/YumWf2HLf+aYNmxCpWjEaFmbxIKpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F9y5QTTs; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5c896b9b4e0so1961174a12.3;
        Mon, 30 Sep 2024 06:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727704365; x=1728309165; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wyb3geUIdOaiHlo8mwWpCyJKar3stgK5wmtiUF5Pomg=;
        b=F9y5QTTssphUv/tOrmNaNNgsOUy64hT4Ynk5r5VzFju2sggGoNOHGPjyC02iKWEuiu
         DLktwD3m2JV59QhDXfFcJ22vMd7ujvKbAt2QGIF3Bq6k/Dps6wj/Eybs1U8hXQbYQNG+
         v5bV2Qm2m1cdpMm5I2IB2ceIffppEwoB97JOojIa/XE8RRGmV5tF8+VbSfP+pQ7mEP4J
         sVsewBtkSGbWIzaDx/0kyEpVfQ3h/KF0WqA5WKi/7EFR/uB2L6iw9e6IelgvzKMeg1+v
         7jjVxVqNkAngV1TBodTCTAjg3D30CFKkRvUmRLhRmffZHc2l8UqU1bUlukZ7kNI7to/j
         YBoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727704365; x=1728309165;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wyb3geUIdOaiHlo8mwWpCyJKar3stgK5wmtiUF5Pomg=;
        b=Q8aMjFltr/m9qH7Mna95NqQl2gNsLLQTaVBjvvJikqzoLdHOaLvRxPIcQukhL4b6CI
         x6rP9h++scgfUR958aiuoDbjKcjk46dTOjdCxaKQHaR5k2Ty/4Ik3PGJQBWG3KRi5+I8
         SeklmGwN47C3RaicVgnQzvhw/At/JJNj/upw+bbgQd1G+RVxevQtnIWLPsnNYIxOE3Sz
         Qg5a6b7P20Rw3y3aRe0p29cAcun49VBA78mt7f4+DFEiMylWrCkOusP6dGvUJxjmSctA
         EMiwfqgjR4SRLcEdAMactfjpFCbA71KZO/Z/RrKZMkDTGvwBxRksnitixGopcLmCWL0g
         iqGA==
X-Forwarded-Encrypted: i=1; AJvYcCVItt8YanAUamEhtqzOfIJ/VwqpWLQvLZJYf+gmfZXw/GcLb1zTRpbAE/zLLoVIqL9lwHOK4hzsuCc=@vger.kernel.org, AJvYcCWJu1f1nZkjkuenipf6aBNd5bxxgpjoVfDMTB6PxB3m1aJCuxJbtUtTaxzhNgydw0UdyEz75ft/tSntEGm+@vger.kernel.org
X-Gm-Message-State: AOJu0YxyBca6Hy2Gj1v/UCwnbWVDrkMT8QZ+XqdA8IRocNVJDf8jfc1n
	WP5XOPV5nYY461xEcQPbmQ/XcMtNjDOsdvmNBErvth3Uf5Fl0aiesIPZyhNV
X-Google-Smtp-Source: AGHT+IGTeHDATKcDuVJkAlYhRG53MODRQ/p+tRk29qkIyg/dqn9ovQDdtmiJ5QOZiPHQDuGxMOcuvA==
X-Received: by 2002:a05:6402:2425:b0:5c7:227f:3a5b with SMTP id 4fb4d7f45d1cf-5c8826035e5mr12035835a12.26.1727704365016;
        Mon, 30 Sep 2024 06:52:45 -0700 (PDT)
Received: from [192.168.1.17] (host-95-250-55-22.retail.telecomitalia.it. [95.250.55.22])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c88245ea57sm4507540a12.55.2024.09.30.06.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 06:52:44 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Mon, 30 Sep 2024 15:52:38 +0200
Subject: [PATCH v7 03/12] drm/msm: Add a `preempt_record_size` field
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-preemption-a750-t-v7-3-47803c7a5a64@gmail.com>
References: <20240930-preemption-a750-t-v7-0-47803c7a5a64@gmail.com>
In-Reply-To: <20240930-preemption-a750-t-v7-0-47803c7a5a64@gmail.com>
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
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727704357; l=2480;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=mw98QEzBIwYx44vG8hfTrLa/RurlCEDImHR+oHkKWF4=;
 b=og/agVTW9E09HAuOJIvQI1XqSludyePluz9FVZDA7lFv7IrrkDYKFjq9owaaLYx2jnHfnFAc8
 SjZSH6hyj3YC15gvuFH09l6O9vT7KbmtLfnTyRh+zUqIa4LVk8IWu5d
X-Developer-Key: i=antomani103@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

Adds a field to `adreno_info` to store the GPU specific preempt record
size.

Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
Tested-by: Rob Clark <robdclark@gmail.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8450-HDK
Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 4 ++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h   | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 68ba9aed5506ea2f367ff0282a73fdd1122f2526..316f23ca91671d973797f2a5b69344f376707325 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1190,6 +1190,7 @@ static const struct adreno_info a7xx_gpus[] = {
 			.protect = &a730_protect,
 		},
 		.address_space_size = SZ_16G,
+		.preempt_record_size = 2860 * SZ_1K,
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x43050a01), /* "C510v2" */
 		.family = ADRENO_7XX_GEN2,
@@ -1209,6 +1210,7 @@ static const struct adreno_info a7xx_gpus[] = {
 			.gmu_chipid = 0x7020100,
 		},
 		.address_space_size = SZ_16G,
+		.preempt_record_size = 4192 * SZ_1K,
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x43050c01), /* "C512v2" */
 		.family = ADRENO_7XX_GEN2,
@@ -1227,6 +1229,7 @@ static const struct adreno_info a7xx_gpus[] = {
 			.gmu_chipid = 0x7050001,
 		},
 		.address_space_size = SZ_256G,
+		.preempt_record_size = 4192 * SZ_1K,
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x43051401), /* "C520v2" */
 		.family = ADRENO_7XX_GEN3,
@@ -1245,6 +1248,7 @@ static const struct adreno_info a7xx_gpus[] = {
 			.gmu_chipid = 0x7090100,
 		},
 		.address_space_size = SZ_16G,
+		.preempt_record_size = 3572 * SZ_1K,
 	}
 };
 DECLARE_ADRENO_GPULIST(a7xx);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 1ab523a163a00b333a85b099e9eb9209e6a2e646..6b1888280a83e6288c4b071733d5d6097afe3a99 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -111,6 +111,7 @@ struct adreno_info {
 	 * {SHRT_MAX, 0} sentinal.
 	 */
 	struct adreno_speedbin *speedbins;
+	u64 preempt_record_size;
 };
 
 #define ADRENO_CHIP_IDS(tbl...) (uint32_t[]) { tbl, 0 }

-- 
2.46.1


