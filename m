Return-Path: <linux-arm-msm+bounces-30955-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DE50B96DC80
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 16:52:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0DEAD1C2091C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 14:52:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B15581ADA;
	Thu,  5 Sep 2024 14:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U5bd2Clw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A441E179654;
	Thu,  5 Sep 2024 14:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725547894; cv=none; b=KznRLzdUx52znvPkmsKE8UcGmizDjTuAdhFoB+tdR5BKhdCUIZwsFwmiI8o9LueNIWJKoaQAmwCGDXsadp7qksJoytO70nBL6gTVGM2Kiih3ZZJn3zFcwvM2tjJHfAd3sYVPaCnBIccaVcNIh9XtKddTVjFTU6+E7tpLoNNfAPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725547894; c=relaxed/simple;
	bh=xA2R7+V+qAfyd3M9fHuSXLIyku8IvZQlPct7Zfu1oEw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aLnfGliqU4EkqYSdNMoj9z1Re5fVXiCVrVX2tHMIUI5995RzPYnnGDGAuE6AFR9PR0dFTDvDilJGZDnMhytujH0+4P8TEdpZOnPQ7Iju6aHWANpvgJZBejdBaN+G/AnGvzZ28ZB7XTFwTLTcet9uhvCy1h24uPP+rET5hkcu3EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U5bd2Clw; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5c245c62362so1168826a12.0;
        Thu, 05 Sep 2024 07:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725547890; x=1726152690; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OJMYlnyS1LZRaHdNncK1wWBqiV76KGsJGAYtBN7J5io=;
        b=U5bd2ClwPI74jVCwIo38kmh/jzvHGKf7vzq1tbzpqXLMN4rN37Z+gjCMz3t4Vfl8f8
         HVhrmO/8EnjwkZuvAqC5dMknpt5+fC/MwCG4OjcnQF9Own5u6GOgZ1xoFmZHEZPae2Qo
         sCJ1OyUEqZSq1S+w1+0RaUo3rKzB1RAIf0AaMZP85EKfsmFlmx5ewHxBX9nmR5S9SFpl
         mXxGFQL+AlPOU7mj7Swb6d3mwvhU4qomrINE1o8X1IKIviQR6ub23juQPZk5fpA+gxDx
         zqhLwY/ug7boj9RfrJ8iwYPa9pzyYBjpWJuEI9l08cpnFvBJvmkkm1JYJHIWaWTlfD85
         dGcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725547890; x=1726152690;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OJMYlnyS1LZRaHdNncK1wWBqiV76KGsJGAYtBN7J5io=;
        b=pLVn5EMxq6YxHwpvWsGyE+6m+aCcezRgXSTxwixlsbHVRIXOhASUq9NnrNQ1V4oYXr
         /dDyIr67QjW+oz/ujsV+VskWIqhIT9T+Xw5xR9hMrZyICN3FBvuTGUtOb7dR1OBtEZWL
         xt6SgqnkbXkHEp0ka8g77ac8Z9JgJHrq6RykK00CNaCfc3jOJvyZqWQqNnLM2F5PJJ2C
         D0jy4hRTUY8xS9BW8jb6+l7WzDOjT0DilcbrUsTua9CBlELN2n9ES8Az3P/I3ZvSCSFk
         Z0V5bY5Wyh8qUKnUQ1+RL7WnVQZ1Mb4quyasBblpO3+/EtqfTAWJiubt9sX1rReRi8iT
         Iilw==
X-Forwarded-Encrypted: i=1; AJvYcCU0UEqRudy/EakAxQJA9W1c1Bjp+fWcIzYhGk+Ev1hPDY4pxTlvCMOaoSNkR3RpftjZEMLfh68n6IU=@vger.kernel.org, AJvYcCXOHTWnKvFEIeyoM4bum8+86BFL6j8LHUUC1tgx6lrtvAuL0oPD+x0VkHW1pAxNeYnotBx+TZGazGmZSpf5@vger.kernel.org
X-Gm-Message-State: AOJu0YwKe/o4Yl0NCD94eRe1lA1fRojGt2MzakAn/BuHTn1ea+B4aYej
	tjpvznQqqFdd+IL3DPTFiC7nNoyf9Nk0TUWs23RtqAYPje7ymaCq
X-Google-Smtp-Source: AGHT+IGdnG7dj/5Tshtbk3mhz2YNXaa/23+G//BXf7FfdlMZtjcrVX+UjO/SvoF8PF7ftj0ON7Qt7A==
X-Received: by 2002:a05:6402:2809:b0:5c3:c543:aa12 with SMTP id 4fb4d7f45d1cf-5c3c543aacbmr4078105a12.0.1725547889146;
        Thu, 05 Sep 2024 07:51:29 -0700 (PDT)
Received: from [192.168.1.17] (host-87-16-167-153.retail.telecomitalia.it. [87.16.167.153])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3cc52b376sm1320732a12.7.2024.09.05.07.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 07:51:27 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Thu, 05 Sep 2024 16:51:20 +0200
Subject: [PATCH v3 02/10] drm/msm: Add a `preempt_record_size` field
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240905-preemption-a750-t-v3-2-fd947699f7bc@gmail.com>
References: <20240905-preemption-a750-t-v3-0-fd947699f7bc@gmail.com>
In-Reply-To: <20240905-preemption-a750-t-v3-0-fd947699f7bc@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725547882; l=2182;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=xA2R7+V+qAfyd3M9fHuSXLIyku8IvZQlPct7Zfu1oEw=;
 b=QpK2MFB9mTSoRExGE4vT1AK7PoDs+4vH4tw6W/j0/E3WEinYYwvw1yBeQM3PAAip0T6RTmIRj
 +vmQTNXEAzlBIHnXdoRgnlST9t6rsCgC7kdNf2b52TaRU9pLHb3aG1Y
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


