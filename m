Return-Path: <linux-arm-msm+bounces-30266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 908219665AE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 17:35:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48160282D58
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 15:35:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 553CF1BA86D;
	Fri, 30 Aug 2024 15:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BVyP0noc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779551B9B39;
	Fri, 30 Aug 2024 15:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725032002; cv=none; b=LMg18AzKq/ebRHiJ1hCWqUc6zwq63JfLzAB6kmkKDewbQEx6YYvNnpffDdrFh8dGfS7qbq95XU0ngWwSShUd3VdMNxgJSYUZ7nwg7YpTfsXxXMOSjKJY9tEeIQJ1NfhKEHsZFTztHQH1AdxLu/J02BeEsqlR3V+9C0j6YYV5mD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725032002; c=relaxed/simple;
	bh=xA2R7+V+qAfyd3M9fHuSXLIyku8IvZQlPct7Zfu1oEw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qVnO/yOEuTn2D5Vbp1agjWTH/YxWnZmC6fvM834mJIGMfaxBMGXmGeP+qDv5ZHIlko8siM4Mjwz1G4XaCy4+c9/xeljRmANs570hWzyAip+AcMJNs7cEp0gCh+XYOrd9wvGtSwNKGuMXS+YyQXqmq/jSo8v7GWXhcN2WE7HnodQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BVyP0noc; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-533488ffaf7so2722880e87.0;
        Fri, 30 Aug 2024 08:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725031998; x=1725636798; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OJMYlnyS1LZRaHdNncK1wWBqiV76KGsJGAYtBN7J5io=;
        b=BVyP0noccQ0eedXhAtmuYnYbX5G8044XrdcfWou6wJdSAc9rxkZnNse4aBicL7rhdY
         b1uLk6bcJC/Cv95aoYgBvEsMQMoqzAxDo4es/VG9ViVHTMB2KLdtGOKV7SvFTbmOC36j
         MjUL8wHSV95jIM65DcJf60za5BI+QtzVKf4KygWKUKQvtJnENsLPP44BfM3cCy+9TPXO
         97rnQ4g7mE0DGcd3fyRHPgP3iWLR4jmpgqvrdpCjpf1tq1Grpr3xjZtbcTmnbtl/DK+y
         bZLr9XkvNBSeUW/wGSHBtGZDKRHj+v7ovWr1gRvWJnabUHeiqm8cVnZb70j732b+6yHd
         4V1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725031998; x=1725636798;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OJMYlnyS1LZRaHdNncK1wWBqiV76KGsJGAYtBN7J5io=;
        b=pCj/vcWOe0mMvYzqSTIHGMUg/eq6YLN6IR72jifxdg2RiS9PgkevmAQSf7ubFrMnW7
         g8T0N38kItlxIKNy//EPwMhO1DebvimkNyoPRNW3lJoyMdPYI0zaJEAAOzUJ3iOa3QTY
         VQdt+K+boJg7JvXpTpw3YlWBu0Y6ufOhMjXMlPzsfzWIiVYlzO1Qgoq3zZFhx/0xHc+V
         vU9KGfn+OrN8LtX97Xh72HF+UEzMXXLYua7QNi2PJOLA3vtSdPBH/wTsAxoIavkT+fl7
         s0k+IPLm1HlQFk+d0w3QgIGewjVhOqAsS3tKWTjTp62Wq05CKcwR+apDzDoO1XeT25+O
         Zo8A==
X-Forwarded-Encrypted: i=1; AJvYcCVVOsQkTHMPDenT+CFwX6IPLBscSqAtKVR+lIJgLPcYYiCQ7DNY04mYrSOhKyevccjj5IxyMzEVMqThoEo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjIu0rGHGBMZL/H8GbIbm/4bGpGc9gV73jshWb+SgalLyXLM36
	oFCzIruy51dxblYOoQ6vtKbXCoCSp9AMFrMZDFfX+8LDKdF/1oJlQaJwbsBP
X-Google-Smtp-Source: AGHT+IHVzKJjjau1YX5D/R6NXoVqmoPHNrdgnb5Vhew/1ITeQsHilR11Y6xO5cENXrrOHtQV72ZwWw==
X-Received: by 2002:a05:6512:acc:b0:52c:d819:517e with SMTP id 2adb3069b0e04-53546b3f189mr1978180e87.30.1725031997872;
        Fri, 30 Aug 2024 08:33:17 -0700 (PDT)
Received: from [192.168.1.14] (host-95-234-170-37.retail.telecomitalia.it. [95.234.170.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8988ff4233sm227157866b.25.2024.08.30.08.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 08:33:17 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Fri, 30 Aug 2024 17:32:45 +0200
Subject: [PATCH v2 3/9] drm/msm: Add a `preempt_record_size` field
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240830-preemption-a750-t-v2-3-86aeead2cd80@gmail.com>
References: <20240830-preemption-a750-t-v2-0-86aeead2cd80@gmail.com>
In-Reply-To: <20240830-preemption-a750-t-v2-0-86aeead2cd80@gmail.com>
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
 Antonino Maniscalco <antomani103@gmail.com>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725031992; l=2182;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=xA2R7+V+qAfyd3M9fHuSXLIyku8IvZQlPct7Zfu1oEw=;
 b=NmZj50l6q+AKolTIQ2/tsKBba9mU/Fvfpwq9OAhRDPxjkjz1HgKdOVNVb2bJTb3kPlclLI+Db
 09kPMNPosk8AQ5nkWYpJj/jmcH65v/556+kD+4oWOmoVCYYPITldU9e
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


