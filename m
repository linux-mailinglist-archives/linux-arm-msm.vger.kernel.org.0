Return-Path: <linux-arm-msm+bounces-33030-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABF898F3DB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 18:13:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 73788B22F5D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 16:13:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 221DE1A76CF;
	Thu,  3 Oct 2024 16:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i78SLyLR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF441A7266;
	Thu,  3 Oct 2024 16:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727971986; cv=none; b=Va6h7HZlLvTBzxtEmK4gO26sned8V8FscjDH5h2j14P10dcbTN/PtZnDQFXFxpwuq5JWl8oeVF6pj+ihx6k3t742/jREvo34/ukMGpkvDD6MdwkJPILVUu+z6FNRyX5BZ8lastWX6C/C/FCDj2GTaatOcYVO0TNbH1UYt0IkRwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727971986; c=relaxed/simple;
	bh=mw98QEzBIwYx44vG8hfTrLa/RurlCEDImHR+oHkKWF4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RoRQhsGUH8i72EidrAxhOSRz9qdnhqq/NZFHwqEOJx//3bdZMnbm2SLefGwYL0ny9Vscqd5EEZ0mfWMxvm5QIEilg2kqKcpY6775KncAn2ws8ju6nPbKOypBUUhMi/FVnw/pT7utgehVESzdGYg6YfkASRkW+9sVc/2Nidn90Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i78SLyLR; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a93c1cc74fdso197992066b.3;
        Thu, 03 Oct 2024 09:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727971982; x=1728576782; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wyb3geUIdOaiHlo8mwWpCyJKar3stgK5wmtiUF5Pomg=;
        b=i78SLyLRY/PK+TdyA3wqO+OG8a3CvV5MukDpAC2cx6GMQ+XcLVHdvxmKgD0Tz0ZucI
         dP2OkF787bBfCbWdAeDjYy+kfCXPckl5jQZgDAJqZbKdS/YwGs/4XrLgMenx0ZCBr5Br
         KEn/ttMwLPoaiTXy03/S7MUuUdZEqa1zTONU16LgxoEbwueoNBmY+KcTmsdRwMrdEhzp
         16JXHKNp53gwY5x4t25a2TCAH2ui6uRR8AoIwWvE1m2Gv9upsXUIXwtZzLS2F0IfUkbx
         Rq7iDyR89EfMGxHBHVh9H/sxv6qlUz9MfXKZGFazJbdjy40GSPPUePYUYHsUKuw9oJfu
         PqVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727971982; x=1728576782;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wyb3geUIdOaiHlo8mwWpCyJKar3stgK5wmtiUF5Pomg=;
        b=aYHMKilrZ6deW/EkR+o0CG4aHx9PjGXrNCBCkaeLll70dkHaeoZKGgIpxTSdm7J28M
         LJlc8JOaocAF5pHlSVJHYrTRsFg48WF4loGP5iA1kSOJiTFAMqfc9+MAQqXhXiJX34MR
         1EumShzELV8U819ENHOHxej2FDhrkGHJyF6hzVjam2LlESQplBFAcC+mjz/tunmKSluF
         Jxj++wnvYw+yqE8gmEjRNAZnh1xkWIB5yrqw2yvPU4BtFbbIOn/iSGSsV/N/51SMMDOU
         dpWGNW56RNMf093vXxUAgM7CIl+wT2OGCK+YS0y0LIwB2TH54c229xGdCDpXX9tRkWbg
         MgUQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7nOeD4fl6K3R1RamzYZAWCGM4NvXY9IQ03uHNWZK6VaEppGAFA9bmfCqwUCw8tvNFIjrOehE4xZMNhYKO@vger.kernel.org, AJvYcCWiggCsU9yAs4CJcUSzh/JMF9SlgBzGNbo8ZDHDV39hkhm83L0zcj4ESu3l9HifRnQVARU9nwZMm9I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUgSlOVtFpDWWIDZph+OeRi/WFgXSULdIPzvARfOVObSCnAAfO
	eh51F4EzOdwlCf5r3ScCV7jCWLCLPJZXnliz7lxq1cUQ2QcmI/pw
X-Google-Smtp-Source: AGHT+IGfZEdpncoLihfFB8ebzwOnEY+Udb2v0k7UqgH0GTJchQuHmXd0rMuPF5wDpj9ySOR443QKlg==
X-Received: by 2002:a17:907:7fa5:b0:a90:c411:24e0 with SMTP id a640c23a62f3a-a98f8250998mr675116666b.23.1727971982159;
        Thu, 03 Oct 2024 09:13:02 -0700 (PDT)
Received: from [192.168.1.17] (host-79-12-161-203.retail.telecomitalia.it. [79.12.161.203])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99103b314asm102382366b.103.2024.10.03.09.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 09:13:01 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Thu, 03 Oct 2024 18:12:52 +0200
Subject: [PATCH v8 03/12] drm/msm: Add a `preempt_record_size` field
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241003-preemption-a750-t-v8-3-5c6cb9f256e0@gmail.com>
References: <20241003-preemption-a750-t-v8-0-5c6cb9f256e0@gmail.com>
In-Reply-To: <20241003-preemption-a750-t-v8-0-5c6cb9f256e0@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727971975; l=2480;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=mw98QEzBIwYx44vG8hfTrLa/RurlCEDImHR+oHkKWF4=;
 b=z+/TNgc/HPX9gfeh5PlsvknjTcGVNf8DSg7n/ZXpQRoD7DYcCFOy5ZKWUWnxKEuLXuL7m92bs
 92Sdo8PrHFaCVVaxCYxlJoFortKUOrShPVLahPPteVCI9FpX7tfmpvb
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


