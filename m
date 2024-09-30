Return-Path: <linux-arm-msm+bounces-32780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C7498A61A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 15:54:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 64D011C2254D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 13:54:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DCC6192B85;
	Mon, 30 Sep 2024 13:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aBfXwHxG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED211922E4;
	Mon, 30 Sep 2024 13:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727704372; cv=none; b=Y0oZlpGH6U1jI1BkK3WL0n7Ul3M7ZVn+WLWWSdqHX3IAiMXHzT6w3e7bK5OTAW24w5v1Jbe9aMsgCVaN/ppHuyP3NKL/rIb5YVHRw4aqd9Klz0jsKRd8emYGl5NZ4VhKXNmlZ2AMl9GEYjG2nZpxXAPGCWo71CcF0XW2V6oZhN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727704372; c=relaxed/simple;
	bh=7OY9AiaQ19Ia+PqqCV6YZvq+XDpZw+wy+7bMWhQ2Bvs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KVCeYEWr3sRf4YoxNyGW+MoYQukmxZjBaIjj0+HzhMgtdT+UR7qXzHIXfmBWhelrzW6P+lan45byVnLCK8SD5VLnp/x3s9rvB5ibsjvdA59Q06GQdChc8MS6mem+T+p0+ZimZHxqJSe0Hv0tXmCEYPqiUhqN235QdZyKaHLxk78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aBfXwHxG; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5c5bca6603aso5183356a12.1;
        Mon, 30 Sep 2024 06:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727704368; x=1728309168; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/V/6a2TW5ipcM35DEEW7Cwm4LM4Qc3jfg/uzlisxQGI=;
        b=aBfXwHxGL39VaRR9EO4gUUGLQTLE4qhkH1Bs/RAMkk8w3dhWxsw+LiylWv95z9ts1e
         pvfJM65a1jD4H/JGxI+CVBi4uOJNLHIGblOQSIQZJjvRN494PgcixLZ164qVplY/pCi+
         +9VyDh9ek9l5MDJQCpD06SGIj1psifucNzMazcNb03/4RcD5fJXLV8nu4exZLifvaBAJ
         /UYXuz1DS+SY1IjuxOxX1BcovU7oArXk+vpkiwWsG/rva9aatoxp+3X07eD8cQPHIqKF
         95joaLClKcBLNEQcRNutUuE6uL3ZxpjanKuqr7nTS8HhmzillInDkrcSRHRlS5HFh0d8
         1UBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727704368; x=1728309168;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/V/6a2TW5ipcM35DEEW7Cwm4LM4Qc3jfg/uzlisxQGI=;
        b=PPFjWGwiptTQRcE+0J5bGkoC0ogYopOe8GR9FTWk4VaEGUWIYJIzzcwNhfe8m9iTIT
         7vLlh/Gk43Uyl0kUnvbAWFzV6SGR8+k04tgKHa1dz9UeoEsm6inE5GnSTfOcugXDj6dY
         8ulbKpymySfrqcbyC8bS9FvnrT31qKY6qliPM5bZ/90O6HcjfQQhjbth0M6ae+hXxbNs
         5JIa9w/+0bwbR0Iy34tOB+qSJtdkLd3TzSGgjG/7g/RjPeYV3am5ygK9qhJRr5nvNS9p
         dwZQ0CipXhp1dg2cTFgCCNiLUOAN+hjjK3+VyJGzCra9WMyUX1xFadcKKxOjbAZKemFB
         cMIA==
X-Forwarded-Encrypted: i=1; AJvYcCUry7y0PSSpJeeTJlYYg44DxhspD5SBq78eemVG1sOk40n8GnNd7vsGFPm/hBKZaWhTEwJmsJnLBh+53dOC@vger.kernel.org, AJvYcCV5A43m2tC3sOKMYzcYV6kRbeIXKHWLDVyia7QG53sVM6l1h/+qevX+sje+cFgTrDNo7DHJPSiYuWg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOswRKcoRJLpE1NNpgzN/7CrfMZQhrgkgEkAvTnGac9qBgz94D
	IV9IuQ5fvElI3QcR1g2S2Z7Y/4GixJFgrB2hwe136Sq25Cme/IBu
X-Google-Smtp-Source: AGHT+IH2aChTJSUVF3XESy19JSmQKMiEKzpArEt+3XVCFugQyJajyfAyptI74iVTiYJ0M9Lxu6TJkQ==
X-Received: by 2002:a05:6402:34d6:b0:5c8:8668:e564 with SMTP id 4fb4d7f45d1cf-5c88668e6ccmr7847854a12.30.1727704368209;
        Mon, 30 Sep 2024 06:52:48 -0700 (PDT)
Received: from [192.168.1.17] (host-95-250-55-22.retail.telecomitalia.it. [95.250.55.22])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c88245ea57sm4507540a12.55.2024.09.30.06.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 06:52:47 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Mon, 30 Sep 2024 15:52:40 +0200
Subject: [PATCH v7 05/12] drm/msm/a6xx: Add a pwrup_list field to a6xx_info
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-preemption-a750-t-v7-5-47803c7a5a64@gmail.com>
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
 linux-doc@vger.kernel.org, Antonino Maniscalco <antomani103@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727704357; l=4169;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=7OY9AiaQ19Ia+PqqCV6YZvq+XDpZw+wy+7bMWhQ2Bvs=;
 b=Z9vJl6mXetFLxPDYS9eNlCYXOWz7jjXIDUi6wzwP7IWRkBvq8tuFHo0j6a61bkHl0fKUQ8rcx
 sJ+3DQpAAd3B+WaLXO8oqY7Q2XRbkH4E3wsnKpPCg0RzHqjHK8krxjK
X-Developer-Key: i=antomani103@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

Add a field to contain the pwup_reglist needed for preemption.

Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 26 ++++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  2 ++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h   | 13 +++++++++++++
 3 files changed, 41 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 316f23ca91671d973797f2a5b69344f376707325..e4d271fa89cc66f188be04206e267fabd83cca83 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1150,6 +1150,28 @@ static const u32 a730_protect_regs[] = {
 };
 DECLARE_ADRENO_PROTECT(a730_protect, 48);
 
+static const uint32_t a7xx_pwrup_reglist_regs[] = {
+	REG_A6XX_UCHE_TRAP_BASE,
+	REG_A6XX_UCHE_TRAP_BASE + 1,
+	REG_A6XX_UCHE_WRITE_THRU_BASE,
+	REG_A6XX_UCHE_WRITE_THRU_BASE + 1,
+	REG_A6XX_UCHE_GMEM_RANGE_MIN,
+	REG_A6XX_UCHE_GMEM_RANGE_MIN + 1,
+	REG_A6XX_UCHE_GMEM_RANGE_MAX,
+	REG_A6XX_UCHE_GMEM_RANGE_MAX + 1,
+	REG_A6XX_UCHE_CACHE_WAYS,
+	REG_A6XX_UCHE_MODE_CNTL,
+	REG_A6XX_RB_NC_MODE_CNTL,
+	REG_A6XX_RB_CMP_DBG_ECO_CNTL,
+	REG_A7XX_GRAS_NC_MODE_CNTL,
+	REG_A6XX_RB_CONTEXT_SWITCH_GMEM_SAVE_RESTORE,
+	REG_A6XX_UCHE_GBIF_GX_CONFIG,
+	REG_A6XX_UCHE_CLIENT_PF,
+	REG_A6XX_TPL1_DBG_ECO_CNTL1,
+};
+
+DECLARE_ADRENO_REGLIST_LIST(a7xx_pwrup_reglist);
+
 static const struct adreno_info a7xx_gpus[] = {
 	{
 		.chip_ids = ADRENO_CHIP_IDS(0x07000200),
@@ -1188,6 +1210,7 @@ static const struct adreno_info a7xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a730_hwcg,
 			.protect = &a730_protect,
+			.pwrup_reglist = &a7xx_pwrup_reglist,
 		},
 		.address_space_size = SZ_16G,
 		.preempt_record_size = 2860 * SZ_1K,
@@ -1207,6 +1230,7 @@ static const struct adreno_info a7xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a740_hwcg,
 			.protect = &a730_protect,
+			.pwrup_reglist = &a7xx_pwrup_reglist,
 			.gmu_chipid = 0x7020100,
 		},
 		.address_space_size = SZ_16G,
@@ -1226,6 +1250,7 @@ static const struct adreno_info a7xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a740_hwcg,
 			.protect = &a730_protect,
+			.pwrup_reglist = &a7xx_pwrup_reglist,
 			.gmu_chipid = 0x7050001,
 		},
 		.address_space_size = SZ_256G,
@@ -1245,6 +1270,7 @@ static const struct adreno_info a7xx_gpus[] = {
 		.zapfw = "gen70900_zap.mbn",
 		.a6xx = &(const struct a6xx_info) {
 			.protect = &a730_protect,
+			.pwrup_reglist = &a7xx_pwrup_reglist,
 			.gmu_chipid = 0x7090100,
 		},
 		.address_space_size = SZ_16G,
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index e3e5c53ae8af2cc59a21160f05c59fd125cb94b1..2f5f307ac3b6845197b06ca3754abc88d698007c 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -17,10 +17,12 @@ extern bool hang_debug;
  *
  * @hwcg: hw clock gating register sequence
  * @protect: CP_PROTECT settings
+ * @pwrup_reglist pwrup reglist for preemption
  */
 struct a6xx_info {
 	const struct adreno_reglist *hwcg;
 	const struct adreno_protect *protect;
+	const struct adreno_reglist_list *pwrup_reglist;
 	u32 gmu_chipid;
 };
 
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 6b1888280a83e6288c4b071733d5d6097afe3a99..58c63d0fbbff9818393fc62ee3cf2703365bec23 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -157,6 +157,19 @@ static const struct adreno_protect name = {		\
 	.count_max = __count_max,			\
 };
 
+struct adreno_reglist_list {
+	/** @reg: List of register **/
+	const u32 *regs;
+	/** @count: Number of registers in the list **/
+	u32 count;
+};
+
+#define DECLARE_ADRENO_REGLIST_LIST(name)	\
+static const struct adreno_reglist_list name = {		\
+	.regs = name ## _regs,				\
+	.count = ARRAY_SIZE(name ## _regs),		\
+};
+
 struct adreno_gpu {
 	struct msm_gpu base;
 	const struct adreno_info *info;

-- 
2.46.1


