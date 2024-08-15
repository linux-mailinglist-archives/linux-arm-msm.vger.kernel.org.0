Return-Path: <linux-arm-msm+bounces-28662-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C109539F5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 20:28:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CDD3A1F26D3D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 18:28:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A01980603;
	Thu, 15 Aug 2024 18:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aeLzDect"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F8376026;
	Thu, 15 Aug 2024 18:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723746464; cv=none; b=Zswo9Qn++Wmwywuhr/y6oxEKbfrsYJ5N7PuloOwRD2BL/2/d1q61nSPdFtPUa0VRPQXLNw1WUvfYFtp4CMKNsofwoQJM87LgZ0HjLZNBVaK3STMVY60p1w2j2xdd/RYZw/tHjR9zUus61NmpNvMln6fPwMdbWOnoVZZn6LPDVZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723746464; c=relaxed/simple;
	bh=WIdWkEj6n6EKxeTaGaPrvswEStAjEcIUss+Uq6HmkxU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cD1Acu9SG/2NX8NHmqm7TnIEfikmduMXkYeOPb4effBlmZL/H3hvc7T8qhBHS9/ulKCBxDt+Xxxn1YaQGUB2j6vL0BlJusiET4kaeLuLVCkPhkG0gi+rgcAKXe3z1rS7Fw15KEaL3SLhCMSXPywj13Z33in7t5LHKxggIpqE6RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aeLzDect; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5bec23bf29eso883870a12.1;
        Thu, 15 Aug 2024 11:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723746460; x=1724351260; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=urijkc3f3VRhrpzAWKCHRZEPKCuPoQovMvk9GPz7bsI=;
        b=aeLzDectLd1/RkgTnx9UF/4NwkvSPViiHsi7KuQvbZhz9YObLgC49Wfm1FtU7s9BUT
         Vz84AyHdJUTiurNFmnQv0JdskZ3baK64YjNplrFeBBmzvP2FyIerhLD/KuZZSQ0SWpel
         GYbCaTgwSHtrpICe9Lxi+x4kNnaV2O/ln4bF8U+3CPkN/KfrPXUsLRxXBZM7+ZKAEREB
         vgiay4OqYqLhF7qfvsyYiiyWhkhW/6vZftTyrSdzxVqrfGEQ/Tb2hvKX5rOmS3hkthfF
         cBd0Rp8MOpRLjb+2eM9ojo6aeDRn1PPEZ3m7KviVE6KZB75dhdpgc2sqMn7AS8al+q0u
         7zwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723746460; x=1724351260;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=urijkc3f3VRhrpzAWKCHRZEPKCuPoQovMvk9GPz7bsI=;
        b=IGiyzHP47K96Rhx4YyYEi8qcORpURVTYq3g3QrORgqR8Xs8vhxAlK21+9cveE8FcYR
         3BXkdC/vLMwleIdZ1gTcbCKi3bEkikbGOb3A9j9uYRzCwXp20un3c418WpL2tUzN6ea+
         w0Jkit17jub4Slv2e5bRModGsOTE1TiYF9oS37BhKkYCpaoes/lt+weatiSsWajXeTJ6
         osMvt9dfTPs9E01dkQGpzp1j3KjJdenstIJQQ9Y1MvbYV0BL9goLPMRQGH8AMJWEXiD5
         LTXM/Q+7jOk0TESqScOt5vtsJn4xqmusy6iZoMllbc5Oh5+gayF0a/pKmInTt3j3BU4/
         1M+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVMF5zOvz8qb0PNlrLZtv21IUI/ad+nbgRorlfxnpw3ZF8Z2BTqY2yRMKryNbaJGWNoKfd6xcZe1V/LF5ort6l8q9NTSz68LUCMjnVW
X-Gm-Message-State: AOJu0YyYPhceMWt5i3bb+u5dOenYsKhg2cihjnuG/1NTSQ78Hf466SyW
	zzkRN6hYtp+gQ1qRX0rP8NuQ/WzjSGueSNjqaBasXH5Thx8cXneW
X-Google-Smtp-Source: AGHT+IFPZ04x5q729U6SozDVg01mhTEcXdVagZpRJc7WA7XSPWNkD+YY2Ys5R20/caD9P8YjpOsVag==
X-Received: by 2002:a17:907:2da6:b0:a7a:9144:e23b with SMTP id a640c23a62f3a-a83928d3597mr32453666b.19.1723746460231;
        Thu, 15 Aug 2024 11:27:40 -0700 (PDT)
Received: from [192.168.1.13] (host-79-35-172-29.retail.telecomitalia.it. [79.35.172.29])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8383947187sm133814366b.166.2024.08.15.11.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 11:27:39 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Thu, 15 Aug 2024 20:26:13 +0200
Subject: [PATCH 3/7] drm/msm: Add a `preempt_record_size` field
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240815-preemption-a750-t-v1-3-7bda26c34037@gmail.com>
References: <20240815-preemption-a750-t-v1-0-7bda26c34037@gmail.com>
In-Reply-To: <20240815-preemption-a750-t-v1-0-7bda26c34037@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Antonino Maniscalco <antomani103@gmail.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723746454; l=1771;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=WIdWkEj6n6EKxeTaGaPrvswEStAjEcIUss+Uq6HmkxU=;
 b=cdA5UOeldSfzsfOh+2uPqUWo4UgfkDMyDFPeXHAf7JKUKQafh23+o+lNgxZesuz8HMBjNfJT2
 XbSJ7pdMUM5AcJb2XW8N5sEn/s5iwrMC+/Huel9if6lm001Kp49EV+9
X-Developer-Key: i=antomani103@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

Adds a field to `adreno_info` to store the GPU specific preempt record
size.

Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 3 +++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h   | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 68ba9aed5506..4cee54d57646 100644
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
@@ -1245,6 +1247,7 @@ static const struct adreno_info a7xx_gpus[] = {
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


