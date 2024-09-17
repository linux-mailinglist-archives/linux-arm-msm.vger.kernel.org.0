Return-Path: <linux-arm-msm+bounces-31905-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9387097AF6E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 13:15:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 501AC283282
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 11:15:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 445B51741D0;
	Tue, 17 Sep 2024 11:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IlJ5nKzB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77AA21714D8;
	Tue, 17 Sep 2024 11:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726571664; cv=none; b=JTHIYENeR7+gnC9GFvUOD32d1vW0i5V0Vo3P305DKUD/K0cnkg3DovLXezepeRjrACn/owvGq62H9WLtD5+hyBRPb4e0drLcoDTiYHJvyoxyDQPXNYfMiSVzId/FBiUTmsNVWK0BVmLKkHHVqfslN87+6jRhMasE26jlJBNSwVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726571664; c=relaxed/simple;
	bh=xA2R7+V+qAfyd3M9fHuSXLIyku8IvZQlPct7Zfu1oEw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Sskh9A3+SgCWGrFQZLmuIxckKVTEN5V+h0+b2PBMNKgJn9FkR1bxbwUSdISXcaW8nZbZib3naoQZhyf9xijwmCtXrwi9+uXfLLvTHAFiMJ/5YtBcEGncRQONZ2pq0YmTaUB0g3AYOsAz4CT4G7wpeFXB7IG07LeogDJW7AbCVnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IlJ5nKzB; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a8d4093722bso778925866b.0;
        Tue, 17 Sep 2024 04:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726571661; x=1727176461; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OJMYlnyS1LZRaHdNncK1wWBqiV76KGsJGAYtBN7J5io=;
        b=IlJ5nKzBNpJqWf7COARMxw936cPesSd/sP+o6OQtDbBCGWmXUqC5Mlp0zGYVzwFf/+
         aZIFG3dskh0TLRAdoYt2D2Tfb1ZEfhOGp4/0d4w/sJIRQ5Vp1Y2Wofue0AJHzD9haXWd
         gNCJPfXDcBtlb3R3XnxQeYhvLikuFgJVDruUBl51OmEsewMbZ6YHwqkErB0TpUtk/bzx
         4m8JGeKOFL3bcwRXrOTRb9n8kZHOb+F9VOjxes8NH1UhLzeHuAwovx+jREQyW12wZeZL
         kdVO4wFRc6xripKAwGMs2q2XxJsVYJo5RaANojMV1inWYz6ySAiEnNeBhFHBbA8dboWc
         0KOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726571661; x=1727176461;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OJMYlnyS1LZRaHdNncK1wWBqiV76KGsJGAYtBN7J5io=;
        b=MBAs4dPPSpXIp4rPhWZ2TsBNvZIReCIogm5dSo92UgUDR4G9kTim4l35sOUTIvhKvO
         gTEduYaqSdHbV1CFtRowU1yyo1CqixSecH0evdzo+6Z177QA7Cy67K+mQWHxlmHJmdmJ
         VK1T9Apv07zjIe73ntdV9fCV0t3bOL6fCa0+V00aTs4Lj+1e7ZC0ohMpM1c7uFeGV00l
         TiPwEkM89WdkSy0eLi5ZUd98RkSRc7xwYu+uDBnf5friZ29gtX6oml9+1tzfwNfcah+4
         LtQoNP0S1DkloE6Kj9zDF+9zUHq/8sgAo3mTVe2tvd52Ljayz4zvqvlKbNCLWmwDAk+o
         V8Gg==
X-Forwarded-Encrypted: i=1; AJvYcCVfqjrqJf4f9CTYWEf6Po/IDwmFGTamK6wnSOq/F2k5DNxPZkwpe+D6+XpwKjwKoHXscqKg17js4ZgZ4VyE@vger.kernel.org, AJvYcCXkal8VG7Dr++WxIi2uaHn5jhC2l0Wo5WtaNLkxPLNITGifkZP9JoLKAQIHxXYw27pAGOlx7apT+GU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDMMshe9j93hRMeHNJILbUn3buLmM9hDz5XZ8ISzDx5tjBBmz0
	okAINqve92DmHLB+OkTuflZYEqqxCXtDUqpLl6PwQWEDecsP/Ryz
X-Google-Smtp-Source: AGHT+IE8z5aVwlOc9iGi4Y4TMmapv34hJLB0tZlzJM+QSdbd9q/583IQr+kTvYfVBfS4mqbYuVvrew==
X-Received: by 2002:a17:907:6e88:b0:a86:7b71:7b74 with SMTP id a640c23a62f3a-a90296789b0mr2225124366b.55.1726571660336;
        Tue, 17 Sep 2024 04:14:20 -0700 (PDT)
Received: from [192.168.1.17] (host-82-51-105-30.retail.telecomitalia.it. [82.51.105.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90612e1a55sm430745166b.157.2024.09.17.04.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2024 04:14:19 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Tue, 17 Sep 2024 13:14:13 +0200
Subject: [PATCH v4 03/11] drm/msm: Add a `preempt_record_size` field
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240917-preemption-a750-t-v4-3-95d48012e0ac@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726571652; l=2182;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=xA2R7+V+qAfyd3M9fHuSXLIyku8IvZQlPct7Zfu1oEw=;
 b=b3QMWPdvUro0RG0S1sUpKNLT+ur6G1ARTv9UYcpbY0iLkKkrGUxFa439U3BXNgLIXwbTC0PSo
 XWvSHZhlz6pAQOtBHxenEOqRHCjGZnCX54zMrv+ISKm4hFx9UZnrvAs
X-Developer-Key: i=antomani103@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

Adds a field to `adreno_info` to store the GPU specific preempt record
size.

Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 4 ++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h   | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 68ba9aed5506..316f23ca9167 100644
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
index 1ab523a163a0..6b1888280a83 100644
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
2.46.0


