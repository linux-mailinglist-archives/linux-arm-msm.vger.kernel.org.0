Return-Path: <linux-arm-msm+bounces-22948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7436890BF48
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 00:51:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F16F51F22F01
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 22:51:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F54F199EBC;
	Mon, 17 Jun 2024 22:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lCJj0WMn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3AE31993BE;
	Mon, 17 Jun 2024 22:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718664700; cv=none; b=mOEvJz7rJP5xffz/NpkbEyz+RHfm9cspiKY2KwmcegiPYCPrJeZ++HIZNkTgt+SeIMSxDBfRYtOEiWzbhJWe+TP1kPqoJbpTCDvm7zrzZMp15bE0TyvIQXixdk2uO9eAlMThB4PiWgmyQ5SChHny5WcVvOZXKHccivCKvRCxlg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718664700; c=relaxed/simple;
	bh=t9QQq/ypX72F9EpmHhKGNpH16FRikjtgi0n8xDu4BQ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J1Nwq4H309mKtDZ9Exlhlg1LlU/rttoqnntzUyWCON5zkFjGV/cpvN1YQKxjgzuHRtzfFWhPa7cVe//VJPpWDiLQ+Zp3gAraoPBO0RLEuOPG0nF0eWvbaqTbp73qcbVnxSKA9gKHCqqmeEMgcJ5hMQ1QZp7iI/yDuha1bSgtKb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lCJj0WMn; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2c2dee9d9a1so3960199a91.3;
        Mon, 17 Jun 2024 15:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718664698; x=1719269498; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qs2LRDL25XC0eQkz6GWFbApIQSCbebyxejk4WZxajq8=;
        b=lCJj0WMnKWjgssTHPDZbAYg4FcdA/Eu8KK9LbDe7k1nyyVkabF9x3y00gbgWUYheQ0
         uPPMlopqdP0FaHRJAz1QKRRJ2Ihbw6q5fSCfzCovIIUuRRePfn8sYkcJHYghcQNVGWYn
         a4vpXYkzpVF9KU50LPuMJFhtrIiJbz34U82TNtnFZqCO/R7orlo53snxxZIc0IOhfCGl
         WXMefI7b3qYhOM5LBsID81qWe4puxDKETmUSZG1Rmp+TVY6NfGdSC18IMQGS+ci80jps
         y2heQVc5WhxVgDXm5kRVD7TYF8rbrAIjy/nC3YzfG1h1/HS18kd/wySnk425V8TrVtrj
         eKOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718664698; x=1719269498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qs2LRDL25XC0eQkz6GWFbApIQSCbebyxejk4WZxajq8=;
        b=tRoN/LMOcXjn8BZ4yTLXfSWMT+JUWLNJ/QzR9ErYIOld3UnZPPjGNTNl5KhqaqTMsS
         /3kkFOUS0Ux5NRhTAA8fLXsWiN8XyaQMu6xCFtPxm6ehpKz9YPDk339PAiAcVVj6Imy9
         h+jFJM6LP9kEzPtwTu/U95YLSjqeJq8qSCzRqpevd4I23nUL3RoJqCcvcZic8j41z2oO
         cVI+o/CN7XjZTTchjZ3GVbe19toe9JC3snjNgyLUVIThsUsBNPR3niXNbXK8vgMa+1SN
         FlXiIfIxwpBP3GQaMgmdVfm5vfSRAJcSUVByqJw9T9vyoq6pu85+KwdJqTqdyJD9AVtk
         X72Q==
X-Forwarded-Encrypted: i=1; AJvYcCVyAIMyPR6DEaVZDS1cS6Vyp2iPhrwqSUxmSpAeYghR7dyQtu0z2hYbFtPEAQjUlnSEwAdWFXlhEUbBH5aggxe0VuErkVJe9j7WMLp3
X-Gm-Message-State: AOJu0YyEA04SYtL3IC7nMm10QVs2tP3ia1ClD1BViDvxvB6pAwKEvcPQ
	ruX9z4GJDxrZ8LU29RWaMGcRM3yiO3PT3BIfZ6bOOVb7y1B9eMKl
X-Google-Smtp-Source: AGHT+IEaAiKjYNf7072YC2nmsUK+DKB2ZdSAsLbwIvU5u9RYMSEOAnGoHZPtrxLuWdXPMpVXDZ7x1g==
X-Received: by 2002:a17:90a:da01:b0:2c2:deda:8561 with SMTP id 98e67ed59e1d1-2c4dbd44edemr9586647a91.41.1718664697116;
        Mon, 17 Jun 2024 15:51:37 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c6fa904db7sm200904a91.27.2024.06.17.15.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 15:51:36 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Rob Clark <robdclark@chromium.org>,
	Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 1/5] drm/msm/adreno: Split up giant device table
Date: Mon, 17 Jun 2024 15:51:11 -0700
Message-ID: <20240617225127.23476-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240617225127.23476-1-robdclark@gmail.com>
References: <20240617225127.23476-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

Split into a separate table per generation, in preparation to move each
gen's device table to it's own file.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 67 +++++++++++++++++-----
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    | 10 ++++
 2 files changed, 63 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index c3703a51287b..a57659eaddc2 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -20,7 +20,7 @@ bool allow_vram_carveout = false;
 MODULE_PARM_DESC(allow_vram_carveout, "Allow using VRAM Carveout, in place of IOMMU");
 module_param_named(allow_vram_carveout, allow_vram_carveout, bool, 0600);
 
-static const struct adreno_info gpulist[] = {
+static const struct adreno_info a2xx_gpus[] = {
 	{
 		.chip_ids = ADRENO_CHIP_IDS(0x02000000),
 		.family = ADRENO_2XX_GEN1,
@@ -54,7 +54,12 @@ static const struct adreno_info gpulist[] = {
 		.gmem  = SZ_512K,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.init  = a2xx_gpu_init,
-	}, {
+	}
+};
+DECLARE_ADRENO_GPULIST(a2xx);
+
+static const struct adreno_info a3xx_gpus[] = {
+	{
 		.chip_ids = ADRENO_CHIP_IDS(0x03000512),
 		.family = ADRENO_3XX,
 		.fw = {
@@ -116,7 +121,12 @@ static const struct adreno_info gpulist[] = {
 		.gmem  = SZ_1M,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.init  = a3xx_gpu_init,
-	}, {
+	}
+};
+DECLARE_ADRENO_GPULIST(a3xx);
+
+static const struct adreno_info a4xx_gpus[] = {
+	{
 		.chip_ids = ADRENO_CHIP_IDS(0x04000500),
 		.family = ADRENO_4XX,
 		.revn  = 405,
@@ -149,7 +159,12 @@ static const struct adreno_info gpulist[] = {
 		.gmem  = (SZ_1M + SZ_512K),
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.init  = a4xx_gpu_init,
-	}, {
+	}
+};
+DECLARE_ADRENO_GPULIST(a4xx);
+
+static const struct adreno_info a5xx_gpus[] = {
+	{
 		.chip_ids = ADRENO_CHIP_IDS(0x05000600),
 		.family = ADRENO_5XX,
 		.revn = 506,
@@ -274,7 +289,12 @@ static const struct adreno_info gpulist[] = {
 		.quirks = ADRENO_QUIRK_LMLOADKILL_DISABLE,
 		.init = a5xx_gpu_init,
 		.zapfw = "a540_zap.mdt",
-	}, {
+	}
+};
+DECLARE_ADRENO_GPULIST(a5xx);
+
+static const struct adreno_info a6xx_gpus[] = {
+	{
 		.chip_ids = ADRENO_CHIP_IDS(0x06010000),
 		.family = ADRENO_6XX_GEN1,
 		.revn = 610,
@@ -520,7 +540,12 @@ static const struct adreno_info gpulist[] = {
 		.zapfw = "a690_zap.mdt",
 		.hwcg = a690_hwcg,
 		.address_space_size = SZ_16G,
-	}, {
+	}
+};
+DECLARE_ADRENO_GPULIST(a6xx);
+
+static const struct adreno_info a7xx_gpus[] = {
+	{
 		.chip_ids = ADRENO_CHIP_IDS(0x07000200),
 		.family = ADRENO_6XX_GEN1, /* NOT a mistake! */
 		.fw = {
@@ -582,7 +607,17 @@ static const struct adreno_info gpulist[] = {
 		.init = a6xx_gpu_init,
 		.zapfw = "gen70900_zap.mbn",
 		.address_space_size = SZ_16G,
-	},
+	}
+};
+DECLARE_ADRENO_GPULIST(a7xx);
+
+static const struct adreno_gpulist *gpulists[] = {
+	&a2xx_gpulist,
+	&a3xx_gpulist,
+	&a4xx_gpulist,
+	&a5xx_gpulist,
+	&a6xx_gpulist,
+	&a6xx_gpulist,
 };
 
 MODULE_FIRMWARE("qcom/a300_pm4.fw");
@@ -617,13 +652,17 @@ MODULE_FIRMWARE("qcom/yamato_pm4.fw");
 static const struct adreno_info *adreno_info(uint32_t chip_id)
 {
 	/* identify gpu: */
-	for (int i = 0; i < ARRAY_SIZE(gpulist); i++) {
-		const struct adreno_info *info = &gpulist[i];
-		if (info->machine && !of_machine_is_compatible(info->machine))
-			continue;
-		for (int j = 0; info->chip_ids[j]; j++)
-			if (info->chip_ids[j] == chip_id)
-				return info;
+	for (int i = 0; i < ARRAY_SIZE(gpulists); i++) {
+		for (int j = 0; j < gpulists[i]->gpus_count; j++) {
+			const struct adreno_info *info = &gpulists[i]->gpus[j];
+
+			if (info->machine && !of_machine_is_compatible(info->machine))
+				continue;
+
+			for (int k = 0; info->chip_ids[k]; k++)
+				if (info->chip_ids[k] == chip_id)
+					return info;
+		}
 	}
 
 	return NULL;
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 77526892eb8c..17aba8c58f3d 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -114,6 +114,16 @@ struct adreno_info {
 
 #define ADRENO_CHIP_IDS(tbl...) (uint32_t[]) { tbl, 0 }
 
+struct adreno_gpulist {
+	const struct adreno_info *gpus;
+	unsigned gpus_count;
+};
+
+#define DECLARE_ADRENO_GPULIST(name)                  \
+const struct adreno_gpulist name ## _gpulist = {      \
+	name ## _gpus, ARRAY_SIZE(name ## _gpus)      \
+}
+
 /*
  * Helper to build a speedbin table, ie. the table:
  *      fuse | speedbin
-- 
2.45.2


