Return-Path: <linux-arm-msm+bounces-33032-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA4098F3E1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 18:14:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 60E24B2377A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 16:14:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 038B71AAE1C;
	Thu,  3 Oct 2024 16:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UAG4qHF+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EDD91A7AD6;
	Thu,  3 Oct 2024 16:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727971988; cv=none; b=CrPy21R7BzS3Alpuko7Y/CtY+xwETdYU3cKiY9hjujeQ0wlAS/y0W/gwC1FB3qY+k7jib/5ZybHRCKM4QWLMrj7AJeatAIWBmpBDdDpBlfaa686nmqal4MU1+bXfKxerafM1RyVUQ3fSdzLOScdvRmAPl0RsFlAlIALqn1oDk4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727971988; c=relaxed/simple;
	bh=7OY9AiaQ19Ia+PqqCV6YZvq+XDpZw+wy+7bMWhQ2Bvs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Eq+nDQ1HYmcT86xF7L65PpzgNgCoqEL4Zu4ovric6S24Nn/uZunhN3Xmn3J7m6EDCi1zqLKloJCsVd9/7V57vM8r9MQCK3LcK98engyahE5VLoPs+hup3L2iI0ghum4B7cwA44Rw7hW/TvcjEcWpCOVuLVZ6S/TYg0XbN8L2M9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UAG4qHF+; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5c5cf26b95aso1462554a12.3;
        Thu, 03 Oct 2024 09:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727971986; x=1728576786; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/V/6a2TW5ipcM35DEEW7Cwm4LM4Qc3jfg/uzlisxQGI=;
        b=UAG4qHF+zUwgKER5ohKa2GLt+0h0qC1Dnf3pnob+Ix+C2YU31aB81prwFZ5DIqJdXl
         GNgpjLwUALCmzKDK8RBF4rqXcaWN0rFW4kE1tyr7cIlievqzHm5jhFoGTmuLiNDnb42q
         K1Jfcr0IX/sOeVU2ZkP/IWH5qbX+QY8SWrg++uBV6WxkFs7q9XJvUsn/KmwePr27dRTv
         1sH8TUAOA8mAocHmWoc2jwcn+P7a/3L7OYdzX93F6TUr1+AXfC0G3j8iAaAKeKkGT7CV
         VDJpJWHcgFSMbbRM7RV4ye4RE1m2e7Judcgjf37eZ1qzwoSrF6wox9OfM+IGkhaQ1mM2
         /liA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727971986; x=1728576786;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/V/6a2TW5ipcM35DEEW7Cwm4LM4Qc3jfg/uzlisxQGI=;
        b=dryLgaxmhkiNCEzNOKW4fVEhvf7p9lFLanKIch+DORJeT1JooWjnV/FkIL2P95yfm3
         t6N1LlwwBf0S/mPIS7YLlviy94BNK8rFTHbQ4MEbk3eihna0TUTd0yM9uZ+CMjcOfrhY
         M4WjKlt6XZZ6TXhmSybJyOtAZWMtRWexyiQzPjvaUT2S8q9TMaFbMeasr7lHP0IcsFOn
         HfhpI/G/JGuOEqT/1lHISFK6p7Q+xVTskoYSFUWQO3mqsKMZK4kVpI4YMBL4J6NLgnpg
         f+YLTnc2mmzY52A9/D12isBA/96BRBez8gjrxgBHQ6nTAlgMfcNo8zwQcuzPJBBi17t0
         FMig==
X-Forwarded-Encrypted: i=1; AJvYcCWoB7alOsZRx/5UWIK+h9HUeMb9LBwTXqKETtYSI8ZySEcBi6k2IS2qZaW2cOcGJ/tpcEq+obDec20=@vger.kernel.org, AJvYcCXjIC2o9z9DLsRm+hEVYxzg4EoZlRFypVvHl4+v6LnG5icAW+xzo/oM0kvuDC58+KYQYQDzBiAP1Fag9sMQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwpnKOw1x4bA0nKpEZedh2Ohp2tZiQZkYPgE+S0bom3Iq4IX7KA
	nS7RPh1CNmj4gdE+Ou0nNKpyItEOA+VXRvwi71yMzXtsc3dBG/Pr8a/dE/QVxKvm5w==
X-Google-Smtp-Source: AGHT+IGDWP3v0Di8kvxDzdey+AWcUqDj4gsqUQxdxWrG+YC8QFPIY1Q5HcSXjl682jM68aq3k1TFHA==
X-Received: by 2002:a17:907:2d88:b0:a86:83f8:f5a2 with SMTP id a640c23a62f3a-a98f823cbc9mr655096566b.19.1727971985501;
        Thu, 03 Oct 2024 09:13:05 -0700 (PDT)
Received: from [192.168.1.17] (host-79-12-161-203.retail.telecomitalia.it. [79.12.161.203])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99103b314asm102382366b.103.2024.10.03.09.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 09:13:05 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Thu, 03 Oct 2024 18:12:54 +0200
Subject: [PATCH v8 05/12] drm/msm/a6xx: Add a pwrup_list field to a6xx_info
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241003-preemption-a750-t-v8-5-5c6cb9f256e0@gmail.com>
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
 linux-doc@vger.kernel.org, Antonino Maniscalco <antomani103@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727971975; l=4169;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=7OY9AiaQ19Ia+PqqCV6YZvq+XDpZw+wy+7bMWhQ2Bvs=;
 b=ZXywTzS1ODfgZc7HTXviCdSKY2foHZWt7a3poRCQsi7lB7WZIDdCZtCtaffDCzVRd8KYC1Euc
 CxBP4/NwGrMCqvKyp2m0N26oXTsRQwGC+C2sPxuUrCW7Yw/cxNmwP65
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


