Return-Path: <linux-arm-msm+bounces-3491-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E32FC806169
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 23:07:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A1291C20E15
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 22:07:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 046C06FCF9;
	Tue,  5 Dec 2023 22:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jqGukVTT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73FDF171C;
	Tue,  5 Dec 2023 14:06:36 -0800 (PST)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-6ce32821a53so2023755b3a.0;
        Tue, 05 Dec 2023 14:06:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701813996; x=1702418796; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0dgk/eT75sFBEeRGLkYbmCQx0J/nliHCTe+gvQs8InU=;
        b=jqGukVTTydnPfjEuALqj9+gKEdvXIat+xP3Bl/MvKnV7td2x34+smJFFqtVTDH2Kvw
         OVSppLmIAWADbyCFsR2Hdp2/eS8Kw0+2E8j9DdXmiDhyeAg4NAk3/xBYhaW8UQKRKDln
         Wf7ItsA6aPN0b+HfTowBsBd6tITVSV9TKLNiHGSqgmqPfkPHSuD1rsH0kF+nDpRwltha
         saUfzIqHOZ8C0pPerFtNN81FW8m0fqQMTXpbJFjZP3y4BD7ocam90cTrpq3M59nsyl1h
         76v6MMA6AzaOZl32srio0jgm73cYab77qi7w0rOe86SBpKn1TNCWVp5w03tidE6lsv/s
         qH6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701813996; x=1702418796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0dgk/eT75sFBEeRGLkYbmCQx0J/nliHCTe+gvQs8InU=;
        b=CKlpBcnxn5bmbxsY4xJNdQlIbzgGkpLa/wvjHDUWsOFO7JlObnfdUy9fp3B8a6rac9
         bLRIkf8UNEUbXFLOoCKlIPO3UMi+l4pucuA7Sa6Eqj/3mm6SIklaZyWznoMVIJyDI7cK
         /T0DhoSlm65LkRZT/FBYw3uq6Waujmyvj5u74m8rKZ9rIVquJAQafFLdkXIXbcPKXObn
         FW2X1Do28FLcarOXkNvhlq/w5hduyec8eWBNoenkThjvdJDk60FYZllUplQpq7WnglO2
         lUooYazbAX4lF6BHZogJ0ULeLhtkcC2cK3PdNXiGYagurUfva3VHVdw9TS2zvh39hc0Y
         mcHw==
X-Gm-Message-State: AOJu0YxMyFLOBiTMQuE7xdlW+eXxq8dIcP5FmPCcYlP9ZLzgcC/RoPYO
	ipPHjEkQluoPfDqKu38sQ5A=
X-Google-Smtp-Source: AGHT+IGSGmcLyX8QOks/TktgjMYMPYqgwjN74XDKHIUjM25kPjpV8UFr9nsmpdp3GFS1y/G2EZhzGg==
X-Received: by 2002:a05:6a00:198b:b0:6ce:52b1:f9f8 with SMTP id d11-20020a056a00198b00b006ce52b1f9f8mr1652608pfl.27.1701813995527;
        Tue, 05 Dec 2023 14:06:35 -0800 (PST)
Received: from localhost ([2a00:79e1:2e00:1301:e1c5:6354:b45d:8ffc])
        by smtp.gmail.com with ESMTPSA id t7-20020a625f07000000b006cbb582fe6csm10266333pfb.204.2023.12.05.14.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 14:06:35 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Rob Clark <robdclark@chromium.org>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Akhil P Oommen <quic_akhilpo@quicinc.com>,
	Douglas Anderson <dianders@chromium.org>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 5/5] drm/msm/adreno: Move CP_PROTECT settings to hw catalog
Date: Tue,  5 Dec 2023 14:03:31 -0800
Message-ID: <20231205220526.417719-6-robdclark@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231205220526.417719-1-robdclark@gmail.com>
References: <20231205220526.417719-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

Move the CP_PROTECT settings into the hw catalog.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 246 ++++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 255 +---------------------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |   2 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.h   |  13 ++
 4 files changed, 266 insertions(+), 250 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 3fb9e249567a..b56e43282ce6 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -454,6 +454,173 @@ static const struct adreno_reglist a690_hwcg[] = {
 	{}
 };
 
+/* For a615, a616, a618, a619, a630, a640 and a680 */
+static const u32 a630_protect_regs[] = {
+	A6XX_PROTECT_RDONLY(0x00000, 0x04ff),
+	A6XX_PROTECT_RDONLY(0x00501, 0x0005),
+	A6XX_PROTECT_RDONLY(0x0050b, 0x02f4),
+	A6XX_PROTECT_NORDWR(0x0050e, 0x0000),
+	A6XX_PROTECT_NORDWR(0x00510, 0x0000),
+	A6XX_PROTECT_NORDWR(0x00534, 0x0000),
+	A6XX_PROTECT_NORDWR(0x00800, 0x0082),
+	A6XX_PROTECT_NORDWR(0x008a0, 0x0008),
+	A6XX_PROTECT_NORDWR(0x008ab, 0x0024),
+	A6XX_PROTECT_RDONLY(0x008de, 0x00ae),
+	A6XX_PROTECT_NORDWR(0x00900, 0x004d),
+	A6XX_PROTECT_NORDWR(0x0098d, 0x0272),
+	A6XX_PROTECT_NORDWR(0x00e00, 0x0001),
+	A6XX_PROTECT_NORDWR(0x00e03, 0x000c),
+	A6XX_PROTECT_NORDWR(0x03c00, 0x00c3),
+	A6XX_PROTECT_RDONLY(0x03cc4, 0x1fff),
+	A6XX_PROTECT_NORDWR(0x08630, 0x01cf),
+	A6XX_PROTECT_NORDWR(0x08e00, 0x0000),
+	A6XX_PROTECT_NORDWR(0x08e08, 0x0000),
+	A6XX_PROTECT_NORDWR(0x08e50, 0x001f),
+	A6XX_PROTECT_NORDWR(0x09624, 0x01db),
+	A6XX_PROTECT_NORDWR(0x09e70, 0x0001),
+	A6XX_PROTECT_NORDWR(0x09e78, 0x0187),
+	A6XX_PROTECT_NORDWR(0x0a630, 0x01cf),
+	A6XX_PROTECT_NORDWR(0x0ae02, 0x0000),
+	A6XX_PROTECT_NORDWR(0x0ae50, 0x032f),
+	A6XX_PROTECT_NORDWR(0x0b604, 0x0000),
+	A6XX_PROTECT_NORDWR(0x0be02, 0x0001),
+	A6XX_PROTECT_NORDWR(0x0be20, 0x17df),
+	A6XX_PROTECT_NORDWR(0x0f000, 0x0bff),
+	A6XX_PROTECT_RDONLY(0x0fc00, 0x1fff),
+	A6XX_PROTECT_NORDWR(0x11c00, 0x0000), /* note: infinite range */
+};
+DECLARE_ADRENO_PROTECT(a630_protect, 32);
+
+/* These are for a620 and a650 */
+static const u32 a650_protect_regs[] = {
+	A6XX_PROTECT_RDONLY(0x00000, 0x04ff),
+	A6XX_PROTECT_RDONLY(0x00501, 0x0005),
+	A6XX_PROTECT_RDONLY(0x0050b, 0x02f4),
+	A6XX_PROTECT_NORDWR(0x0050e, 0x0000),
+	A6XX_PROTECT_NORDWR(0x00510, 0x0000),
+	A6XX_PROTECT_NORDWR(0x00534, 0x0000),
+	A6XX_PROTECT_NORDWR(0x00800, 0x0082),
+	A6XX_PROTECT_NORDWR(0x008a0, 0x0008),
+	A6XX_PROTECT_NORDWR(0x008ab, 0x0024),
+	A6XX_PROTECT_RDONLY(0x008de, 0x00ae),
+	A6XX_PROTECT_NORDWR(0x00900, 0x004d),
+	A6XX_PROTECT_NORDWR(0x0098d, 0x0272),
+	A6XX_PROTECT_NORDWR(0x00e00, 0x0001),
+	A6XX_PROTECT_NORDWR(0x00e03, 0x000c),
+	A6XX_PROTECT_NORDWR(0x03c00, 0x00c3),
+	A6XX_PROTECT_RDONLY(0x03cc4, 0x1fff),
+	A6XX_PROTECT_NORDWR(0x08630, 0x01cf),
+	A6XX_PROTECT_NORDWR(0x08e00, 0x0000),
+	A6XX_PROTECT_NORDWR(0x08e08, 0x0000),
+	A6XX_PROTECT_NORDWR(0x08e50, 0x001f),
+	A6XX_PROTECT_NORDWR(0x08e80, 0x027f),
+	A6XX_PROTECT_NORDWR(0x09624, 0x01db),
+	A6XX_PROTECT_NORDWR(0x09e60, 0x0011),
+	A6XX_PROTECT_NORDWR(0x09e78, 0x0187),
+	A6XX_PROTECT_NORDWR(0x0a630, 0x01cf),
+	A6XX_PROTECT_NORDWR(0x0ae02, 0x0000),
+	A6XX_PROTECT_NORDWR(0x0ae50, 0x032f),
+	A6XX_PROTECT_NORDWR(0x0b604, 0x0000),
+	A6XX_PROTECT_NORDWR(0x0b608, 0x0007),
+	A6XX_PROTECT_NORDWR(0x0be02, 0x0001),
+	A6XX_PROTECT_NORDWR(0x0be20, 0x17df),
+	A6XX_PROTECT_NORDWR(0x0f000, 0x0bff),
+	A6XX_PROTECT_RDONLY(0x0fc00, 0x1fff),
+	A6XX_PROTECT_NORDWR(0x18400, 0x1fff),
+	A6XX_PROTECT_NORDWR(0x1a800, 0x1fff),
+	A6XX_PROTECT_NORDWR(0x1f400, 0x0443),
+	A6XX_PROTECT_RDONLY(0x1f844, 0x007b),
+	A6XX_PROTECT_NORDWR(0x1f887, 0x001b),
+	A6XX_PROTECT_NORDWR(0x1f8c0, 0x0000), /* note: infinite range */
+};
+DECLARE_ADRENO_PROTECT(a650_protect, 48);
+
+/* These are for a635 and a660 */
+static const u32 a660_protect_regs[] = {
+	A6XX_PROTECT_RDONLY(0x00000, 0x04ff),
+	A6XX_PROTECT_RDONLY(0x00501, 0x0005),
+	A6XX_PROTECT_RDONLY(0x0050b, 0x02f4),
+	A6XX_PROTECT_NORDWR(0x0050e, 0x0000),
+	A6XX_PROTECT_NORDWR(0x00510, 0x0000),
+	A6XX_PROTECT_NORDWR(0x00534, 0x0000),
+	A6XX_PROTECT_NORDWR(0x00800, 0x0082),
+	A6XX_PROTECT_NORDWR(0x008a0, 0x0008),
+	A6XX_PROTECT_NORDWR(0x008ab, 0x0024),
+	A6XX_PROTECT_RDONLY(0x008de, 0x00ae),
+	A6XX_PROTECT_NORDWR(0x00900, 0x004d),
+	A6XX_PROTECT_NORDWR(0x0098d, 0x0272),
+	A6XX_PROTECT_NORDWR(0x00e00, 0x0001),
+	A6XX_PROTECT_NORDWR(0x00e03, 0x000c),
+	A6XX_PROTECT_NORDWR(0x03c00, 0x00c3),
+	A6XX_PROTECT_RDONLY(0x03cc4, 0x1fff),
+	A6XX_PROTECT_NORDWR(0x08630, 0x01cf),
+	A6XX_PROTECT_NORDWR(0x08e00, 0x0000),
+	A6XX_PROTECT_NORDWR(0x08e08, 0x0000),
+	A6XX_PROTECT_NORDWR(0x08e50, 0x001f),
+	A6XX_PROTECT_NORDWR(0x08e80, 0x027f),
+	A6XX_PROTECT_NORDWR(0x09624, 0x01db),
+	A6XX_PROTECT_NORDWR(0x09e60, 0x0011),
+	A6XX_PROTECT_NORDWR(0x09e78, 0x0187),
+	A6XX_PROTECT_NORDWR(0x0a630, 0x01cf),
+	A6XX_PROTECT_NORDWR(0x0ae02, 0x0000),
+	A6XX_PROTECT_NORDWR(0x0ae50, 0x012f),
+	A6XX_PROTECT_NORDWR(0x0b604, 0x0000),
+	A6XX_PROTECT_NORDWR(0x0b608, 0x0006),
+	A6XX_PROTECT_NORDWR(0x0be02, 0x0001),
+	A6XX_PROTECT_NORDWR(0x0be20, 0x015f),
+	A6XX_PROTECT_NORDWR(0x0d000, 0x05ff),
+	A6XX_PROTECT_NORDWR(0x0f000, 0x0bff),
+	A6XX_PROTECT_RDONLY(0x0fc00, 0x1fff),
+	A6XX_PROTECT_NORDWR(0x18400, 0x1fff),
+	A6XX_PROTECT_NORDWR(0x1a400, 0x1fff),
+	A6XX_PROTECT_NORDWR(0x1f400, 0x0443),
+	A6XX_PROTECT_RDONLY(0x1f844, 0x007b),
+	A6XX_PROTECT_NORDWR(0x1f860, 0x0000),
+	A6XX_PROTECT_NORDWR(0x1f887, 0x001b),
+	A6XX_PROTECT_NORDWR(0x1f8c0, 0x0000), /* note: infinite range */
+};
+DECLARE_ADRENO_PROTECT(a660_protect, 48);
+
+/* These are for a690 */
+static const u32 a690_protect_regs[] = {
+	A6XX_PROTECT_RDONLY(0x00000, 0x004ff),
+	A6XX_PROTECT_RDONLY(0x00501, 0x00001),
+	A6XX_PROTECT_RDONLY(0x0050b, 0x002f4),
+	A6XX_PROTECT_NORDWR(0x0050e, 0x00000),
+	A6XX_PROTECT_NORDWR(0x00510, 0x00000),
+	A6XX_PROTECT_NORDWR(0x00534, 0x00000),
+	A6XX_PROTECT_NORDWR(0x00800, 0x00082),
+	A6XX_PROTECT_NORDWR(0x008a0, 0x00008),
+	A6XX_PROTECT_NORDWR(0x008ab, 0x00024),
+	A6XX_PROTECT_RDONLY(0x008de, 0x000ae),
+	A6XX_PROTECT_NORDWR(0x00900, 0x0004d),
+	A6XX_PROTECT_NORDWR(0x0098d, 0x00272),
+	A6XX_PROTECT_NORDWR(0x00e00, 0x00001),
+	A6XX_PROTECT_NORDWR(0x00e03, 0x0000c),
+	A6XX_PROTECT_NORDWR(0x03c00, 0x000c3),
+	A6XX_PROTECT_RDONLY(0x03cc4, 0x01fff),
+	A6XX_PROTECT_NORDWR(0x08630, 0x001cf),
+	A6XX_PROTECT_NORDWR(0x08e00, 0x00000),
+	A6XX_PROTECT_NORDWR(0x08e08, 0x00007),
+	A6XX_PROTECT_NORDWR(0x08e50, 0x0001f),
+	A6XX_PROTECT_NORDWR(0x08e80, 0x0027f),
+	A6XX_PROTECT_NORDWR(0x09624, 0x001db),
+	A6XX_PROTECT_NORDWR(0x09e60, 0x00011),
+	A6XX_PROTECT_NORDWR(0x09e78, 0x00187),
+	A6XX_PROTECT_NORDWR(0x0a630, 0x001cf),
+	A6XX_PROTECT_NORDWR(0x0ae02, 0x00000),
+	A6XX_PROTECT_NORDWR(0x0ae50, 0x0012f),
+	A6XX_PROTECT_NORDWR(0x0b604, 0x00000),
+	A6XX_PROTECT_NORDWR(0x0b608, 0x00006),
+	A6XX_PROTECT_NORDWR(0x0be02, 0x00001),
+	A6XX_PROTECT_NORDWR(0x0be20, 0x0015f),
+	A6XX_PROTECT_NORDWR(0x0d000, 0x005ff),
+	A6XX_PROTECT_NORDWR(0x0f000, 0x00bff),
+	A6XX_PROTECT_RDONLY(0x0fc00, 0x01fff),
+	A6XX_PROTECT_NORDWR(0x11c00, 0x00000), /*note: infiite range */
+};
+DECLARE_ADRENO_PROTECT(a690_protect, 48);
+
 const struct adreno_info a6xx_gpus[] = {
 	{
 		.chip_ids = ADRENO_CHIP_IDS(0x06010000),
@@ -468,6 +635,7 @@ const struct adreno_info a6xx_gpus[] = {
 		.zapfw = "a610_zap.mdt",
 		.a6xx = &(struct a6xx_info) {
 			.hwcg = a612_hwcg,
+			.protect = &a630_protect,
 		},
 		/*
 		 * There are (at least) three SoCs implementing A610: SM6125
@@ -496,6 +664,7 @@ const struct adreno_info a6xx_gpus[] = {
 		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
 		.init = a6xx_gpu_init,
 		.a6xx = &(struct a6xx_info) {
+			.protect = &a630_protect,
 		},
 		.speedbins = ADRENO_SPEEDBINS(
 			{ 0,   0 },
@@ -517,6 +686,7 @@ const struct adreno_info a6xx_gpus[] = {
 		.zapfw = "a615_zap.mdt",
 		.a6xx = &(struct a6xx_info) {
 			.hwcg = a615_hwcg,
+			.protect = &a630_protect,
 		},
 		.speedbins = ADRENO_SPEEDBINS(
 			{ 0,   0 },
@@ -538,6 +708,7 @@ const struct adreno_info a6xx_gpus[] = {
 		.zapfw = "a615_zap.mdt",
 		.a6xx = &(struct a6xx_info) {
 			.hwcg = a615_hwcg,
+			.protect = &a630_protect,
 		},
 		.speedbins = ADRENO_SPEEDBINS(
 			{ 0,   0 },
@@ -559,6 +730,7 @@ const struct adreno_info a6xx_gpus[] = {
 		.zapfw = "a615_zap.mdt",
 		.a6xx = &(struct a6xx_info) {
 			.hwcg = a615_hwcg,
+			.protect = &a630_protect,
 		},
 		.speedbins = ADRENO_SPEEDBINS(
 			{ 0,   0 },
@@ -585,6 +757,7 @@ const struct adreno_info a6xx_gpus[] = {
 		.zapfw = "a630_zap.mdt",
 		.a6xx = &(struct a6xx_info) {
 			.hwcg = a630_hwcg,
+			.protect = &a630_protect,
 		},
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x06040001),
@@ -601,6 +774,7 @@ const struct adreno_info a6xx_gpus[] = {
 		.zapfw = "a640_zap.mdt",
 		.a6xx = &(struct a6xx_info) {
 			.hwcg = a640_hwcg,
+			.protect = &a630_protect,
 		},
 		.speedbins = ADRENO_SPEEDBINS(
 			{ 0, 0 },
@@ -622,6 +796,7 @@ const struct adreno_info a6xx_gpus[] = {
 		.zapfw = "a650_zap.mdt",
 		.a6xx = &(struct a6xx_info) {
 			.hwcg = a650_hwcg,
+			.protect = &a650_protect,
 		},
 		.address_space_size = SZ_16G,
 		.speedbins = ADRENO_SPEEDBINS(
@@ -646,6 +821,7 @@ const struct adreno_info a6xx_gpus[] = {
 		.zapfw = "a660_zap.mdt",
 		.a6xx = &(struct a6xx_info) {
 			.hwcg = a660_hwcg,
+			.protect = &a660_protect,
 		},
 		.address_space_size = SZ_16G,
 	}, {
@@ -663,6 +839,7 @@ const struct adreno_info a6xx_gpus[] = {
 		.zapfw = "a660_zap.mbn",
 		.a6xx = &(struct a6xx_info) {
 			.hwcg = a660_hwcg,
+			.protect = &a660_protect,
 		},
 		.address_space_size = SZ_16G,
 		.speedbins = ADRENO_SPEEDBINS(
@@ -686,6 +863,7 @@ const struct adreno_info a6xx_gpus[] = {
 		.zapfw = "a640_zap.mdt",
 		.a6xx = &(struct a6xx_info) {
 			.hwcg = a640_hwcg,
+			.protect = &a630_protect,
 		},
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x06090000),
@@ -702,6 +880,7 @@ const struct adreno_info a6xx_gpus[] = {
 		.zapfw = "a690_zap.mdt",
 		.a6xx = &(struct a6xx_info) {
 			.hwcg = a690_hwcg,
+			.protect = &a690_protect,
 		},
 		.address_space_size = SZ_16G,
 	}, {
@@ -833,6 +1012,60 @@ static const struct adreno_reglist a740_hwcg[] = {
 	{},
 };
 
+static const u32 a730_protect_regs[] = {
+	A6XX_PROTECT_RDONLY(0x00000, 0x04ff),
+	A6XX_PROTECT_RDONLY(0x0050b, 0x0058),
+	A6XX_PROTECT_NORDWR(0x0050e, 0x0000),
+	A6XX_PROTECT_NORDWR(0x00510, 0x0000),
+	A6XX_PROTECT_NORDWR(0x00534, 0x0000),
+	A6XX_PROTECT_RDONLY(0x005fb, 0x009d),
+	A6XX_PROTECT_NORDWR(0x00699, 0x01e9),
+	A6XX_PROTECT_NORDWR(0x008a0, 0x0008),
+	A6XX_PROTECT_NORDWR(0x008ab, 0x0024),
+	/* 0x008d0-0x008dd are unprotected on purpose for tools like perfetto */
+	A6XX_PROTECT_RDONLY(0x008de, 0x0154),
+	A6XX_PROTECT_NORDWR(0x00900, 0x004d),
+	A6XX_PROTECT_NORDWR(0x0098d, 0x00b2),
+	A6XX_PROTECT_NORDWR(0x00a41, 0x01be),
+	A6XX_PROTECT_NORDWR(0x00df0, 0x0001),
+	A6XX_PROTECT_NORDWR(0x00e01, 0x0000),
+	A6XX_PROTECT_NORDWR(0x00e07, 0x0008),
+	A6XX_PROTECT_NORDWR(0x03c00, 0x00c3),
+	A6XX_PROTECT_RDONLY(0x03cc4, 0x1fff),
+	A6XX_PROTECT_NORDWR(0x08630, 0x01cf),
+	A6XX_PROTECT_NORDWR(0x08e00, 0x0000),
+	A6XX_PROTECT_NORDWR(0x08e08, 0x0000),
+	A6XX_PROTECT_NORDWR(0x08e50, 0x001f),
+	A6XX_PROTECT_NORDWR(0x08e80, 0x0280),
+	A6XX_PROTECT_NORDWR(0x09624, 0x01db),
+	A6XX_PROTECT_NORDWR(0x09e40, 0x0000),
+	A6XX_PROTECT_NORDWR(0x09e64, 0x000d),
+	A6XX_PROTECT_NORDWR(0x09e78, 0x0187),
+	A6XX_PROTECT_NORDWR(0x0a630, 0x01cf),
+	A6XX_PROTECT_NORDWR(0x0ae02, 0x0000),
+	A6XX_PROTECT_NORDWR(0x0ae50, 0x000f),
+	A6XX_PROTECT_NORDWR(0x0ae66, 0x0003),
+	A6XX_PROTECT_NORDWR(0x0ae6f, 0x0003),
+	A6XX_PROTECT_NORDWR(0x0b604, 0x0003),
+	A6XX_PROTECT_NORDWR(0x0ec00, 0x0fff),
+	A6XX_PROTECT_RDONLY(0x0fc00, 0x1fff),
+	A6XX_PROTECT_NORDWR(0x18400, 0x0053),
+	A6XX_PROTECT_RDONLY(0x18454, 0x0004),
+	A6XX_PROTECT_NORDWR(0x18459, 0x1fff),
+	A6XX_PROTECT_NORDWR(0x1a459, 0x1fff),
+	A6XX_PROTECT_NORDWR(0x1c459, 0x1fff),
+	A6XX_PROTECT_NORDWR(0x1f400, 0x0443),
+	A6XX_PROTECT_RDONLY(0x1f844, 0x007b),
+	A6XX_PROTECT_NORDWR(0x1f860, 0x0000),
+	A6XX_PROTECT_NORDWR(0x1f878, 0x002a),
+	/* CP_PROTECT_REG[44, 46] are left untouched! */
+	0,
+	0,
+	0,
+	A6XX_PROTECT_NORDWR(0x1f8c0, 0x00000),
+};
+DECLARE_ADRENO_PROTECT(a730_protect, 48);
+
 const struct adreno_info a7xx_gpus[] = {
 	{
 		.chip_ids = ADRENO_CHIP_IDS(0x07030001),
@@ -849,6 +1082,7 @@ const struct adreno_info a7xx_gpus[] = {
 		.zapfw = "a730_zap.mdt",
 		.a6xx = &(struct a6xx_info) {
 			.hwcg = a730_hwcg,
+			.protect = &a730_protect,
 		},
 		.address_space_size = SZ_16G,
 	}, {
@@ -866,9 +1100,19 @@ const struct adreno_info a7xx_gpus[] = {
 		.zapfw = "a740_zap.mdt",
 		.a6xx = &(struct a6xx_info) {
 			.hwcg = a740_hwcg,
+			.protect = &a730_protect,
 		},
 		.address_space_size = SZ_16G,
 	}, {
 		/* sentinal */
 	}
-};
\ No newline at end of file
+};
+
+static inline void __build_asserts(void)
+{
+	BUILD_BUG_ON(a630_protect.count > a630_protect.count_max);
+	BUILD_BUG_ON(a650_protect.count > a650_protect.count_max);
+	BUILD_BUG_ON(a660_protect.count > a660_protect.count_max);
+	BUILD_BUG_ON(a690_protect.count > a690_protect.count_max);
+	BUILD_BUG_ON(a730_protect.count > a730_protect.count_max);
+}
\ No newline at end of file
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index a064eb42eedd..227149476b24 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -444,254 +444,11 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
 	gpu_write(gpu, REG_A6XX_RBBM_CLOCK_CNTL, state ? clock_cntl_on : 0);
 }
 
-/* For a615, a616, a618, a619, a630, a640 and a680 */
-static const u32 a6xx_protect[] = {
-	A6XX_PROTECT_RDONLY(0x00000, 0x04ff),
-	A6XX_PROTECT_RDONLY(0x00501, 0x0005),
-	A6XX_PROTECT_RDONLY(0x0050b, 0x02f4),
-	A6XX_PROTECT_NORDWR(0x0050e, 0x0000),
-	A6XX_PROTECT_NORDWR(0x00510, 0x0000),
-	A6XX_PROTECT_NORDWR(0x00534, 0x0000),
-	A6XX_PROTECT_NORDWR(0x00800, 0x0082),
-	A6XX_PROTECT_NORDWR(0x008a0, 0x0008),
-	A6XX_PROTECT_NORDWR(0x008ab, 0x0024),
-	A6XX_PROTECT_RDONLY(0x008de, 0x00ae),
-	A6XX_PROTECT_NORDWR(0x00900, 0x004d),
-	A6XX_PROTECT_NORDWR(0x0098d, 0x0272),
-	A6XX_PROTECT_NORDWR(0x00e00, 0x0001),
-	A6XX_PROTECT_NORDWR(0x00e03, 0x000c),
-	A6XX_PROTECT_NORDWR(0x03c00, 0x00c3),
-	A6XX_PROTECT_RDONLY(0x03cc4, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x08630, 0x01cf),
-	A6XX_PROTECT_NORDWR(0x08e00, 0x0000),
-	A6XX_PROTECT_NORDWR(0x08e08, 0x0000),
-	A6XX_PROTECT_NORDWR(0x08e50, 0x001f),
-	A6XX_PROTECT_NORDWR(0x09624, 0x01db),
-	A6XX_PROTECT_NORDWR(0x09e70, 0x0001),
-	A6XX_PROTECT_NORDWR(0x09e78, 0x0187),
-	A6XX_PROTECT_NORDWR(0x0a630, 0x01cf),
-	A6XX_PROTECT_NORDWR(0x0ae02, 0x0000),
-	A6XX_PROTECT_NORDWR(0x0ae50, 0x032f),
-	A6XX_PROTECT_NORDWR(0x0b604, 0x0000),
-	A6XX_PROTECT_NORDWR(0x0be02, 0x0001),
-	A6XX_PROTECT_NORDWR(0x0be20, 0x17df),
-	A6XX_PROTECT_NORDWR(0x0f000, 0x0bff),
-	A6XX_PROTECT_RDONLY(0x0fc00, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x11c00, 0x0000), /* note: infinite range */
-};
-
-/* These are for a620 and a650 */
-static const u32 a650_protect[] = {
-	A6XX_PROTECT_RDONLY(0x00000, 0x04ff),
-	A6XX_PROTECT_RDONLY(0x00501, 0x0005),
-	A6XX_PROTECT_RDONLY(0x0050b, 0x02f4),
-	A6XX_PROTECT_NORDWR(0x0050e, 0x0000),
-	A6XX_PROTECT_NORDWR(0x00510, 0x0000),
-	A6XX_PROTECT_NORDWR(0x00534, 0x0000),
-	A6XX_PROTECT_NORDWR(0x00800, 0x0082),
-	A6XX_PROTECT_NORDWR(0x008a0, 0x0008),
-	A6XX_PROTECT_NORDWR(0x008ab, 0x0024),
-	A6XX_PROTECT_RDONLY(0x008de, 0x00ae),
-	A6XX_PROTECT_NORDWR(0x00900, 0x004d),
-	A6XX_PROTECT_NORDWR(0x0098d, 0x0272),
-	A6XX_PROTECT_NORDWR(0x00e00, 0x0001),
-	A6XX_PROTECT_NORDWR(0x00e03, 0x000c),
-	A6XX_PROTECT_NORDWR(0x03c00, 0x00c3),
-	A6XX_PROTECT_RDONLY(0x03cc4, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x08630, 0x01cf),
-	A6XX_PROTECT_NORDWR(0x08e00, 0x0000),
-	A6XX_PROTECT_NORDWR(0x08e08, 0x0000),
-	A6XX_PROTECT_NORDWR(0x08e50, 0x001f),
-	A6XX_PROTECT_NORDWR(0x08e80, 0x027f),
-	A6XX_PROTECT_NORDWR(0x09624, 0x01db),
-	A6XX_PROTECT_NORDWR(0x09e60, 0x0011),
-	A6XX_PROTECT_NORDWR(0x09e78, 0x0187),
-	A6XX_PROTECT_NORDWR(0x0a630, 0x01cf),
-	A6XX_PROTECT_NORDWR(0x0ae02, 0x0000),
-	A6XX_PROTECT_NORDWR(0x0ae50, 0x032f),
-	A6XX_PROTECT_NORDWR(0x0b604, 0x0000),
-	A6XX_PROTECT_NORDWR(0x0b608, 0x0007),
-	A6XX_PROTECT_NORDWR(0x0be02, 0x0001),
-	A6XX_PROTECT_NORDWR(0x0be20, 0x17df),
-	A6XX_PROTECT_NORDWR(0x0f000, 0x0bff),
-	A6XX_PROTECT_RDONLY(0x0fc00, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x18400, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x1a800, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x1f400, 0x0443),
-	A6XX_PROTECT_RDONLY(0x1f844, 0x007b),
-	A6XX_PROTECT_NORDWR(0x1f887, 0x001b),
-	A6XX_PROTECT_NORDWR(0x1f8c0, 0x0000), /* note: infinite range */
-};
-
-/* These are for a635 and a660 */
-static const u32 a660_protect[] = {
-	A6XX_PROTECT_RDONLY(0x00000, 0x04ff),
-	A6XX_PROTECT_RDONLY(0x00501, 0x0005),
-	A6XX_PROTECT_RDONLY(0x0050b, 0x02f4),
-	A6XX_PROTECT_NORDWR(0x0050e, 0x0000),
-	A6XX_PROTECT_NORDWR(0x00510, 0x0000),
-	A6XX_PROTECT_NORDWR(0x00534, 0x0000),
-	A6XX_PROTECT_NORDWR(0x00800, 0x0082),
-	A6XX_PROTECT_NORDWR(0x008a0, 0x0008),
-	A6XX_PROTECT_NORDWR(0x008ab, 0x0024),
-	A6XX_PROTECT_RDONLY(0x008de, 0x00ae),
-	A6XX_PROTECT_NORDWR(0x00900, 0x004d),
-	A6XX_PROTECT_NORDWR(0x0098d, 0x0272),
-	A6XX_PROTECT_NORDWR(0x00e00, 0x0001),
-	A6XX_PROTECT_NORDWR(0x00e03, 0x000c),
-	A6XX_PROTECT_NORDWR(0x03c00, 0x00c3),
-	A6XX_PROTECT_RDONLY(0x03cc4, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x08630, 0x01cf),
-	A6XX_PROTECT_NORDWR(0x08e00, 0x0000),
-	A6XX_PROTECT_NORDWR(0x08e08, 0x0000),
-	A6XX_PROTECT_NORDWR(0x08e50, 0x001f),
-	A6XX_PROTECT_NORDWR(0x08e80, 0x027f),
-	A6XX_PROTECT_NORDWR(0x09624, 0x01db),
-	A6XX_PROTECT_NORDWR(0x09e60, 0x0011),
-	A6XX_PROTECT_NORDWR(0x09e78, 0x0187),
-	A6XX_PROTECT_NORDWR(0x0a630, 0x01cf),
-	A6XX_PROTECT_NORDWR(0x0ae02, 0x0000),
-	A6XX_PROTECT_NORDWR(0x0ae50, 0x012f),
-	A6XX_PROTECT_NORDWR(0x0b604, 0x0000),
-	A6XX_PROTECT_NORDWR(0x0b608, 0x0006),
-	A6XX_PROTECT_NORDWR(0x0be02, 0x0001),
-	A6XX_PROTECT_NORDWR(0x0be20, 0x015f),
-	A6XX_PROTECT_NORDWR(0x0d000, 0x05ff),
-	A6XX_PROTECT_NORDWR(0x0f000, 0x0bff),
-	A6XX_PROTECT_RDONLY(0x0fc00, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x18400, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x1a400, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x1f400, 0x0443),
-	A6XX_PROTECT_RDONLY(0x1f844, 0x007b),
-	A6XX_PROTECT_NORDWR(0x1f860, 0x0000),
-	A6XX_PROTECT_NORDWR(0x1f887, 0x001b),
-	A6XX_PROTECT_NORDWR(0x1f8c0, 0x0000), /* note: infinite range */
-};
-
-/* These are for a690 */
-static const u32 a690_protect[] = {
-	A6XX_PROTECT_RDONLY(0x00000, 0x004ff),
-	A6XX_PROTECT_RDONLY(0x00501, 0x00001),
-	A6XX_PROTECT_RDONLY(0x0050b, 0x002f4),
-	A6XX_PROTECT_NORDWR(0x0050e, 0x00000),
-	A6XX_PROTECT_NORDWR(0x00510, 0x00000),
-	A6XX_PROTECT_NORDWR(0x00534, 0x00000),
-	A6XX_PROTECT_NORDWR(0x00800, 0x00082),
-	A6XX_PROTECT_NORDWR(0x008a0, 0x00008),
-	A6XX_PROTECT_NORDWR(0x008ab, 0x00024),
-	A6XX_PROTECT_RDONLY(0x008de, 0x000ae),
-	A6XX_PROTECT_NORDWR(0x00900, 0x0004d),
-	A6XX_PROTECT_NORDWR(0x0098d, 0x00272),
-	A6XX_PROTECT_NORDWR(0x00e00, 0x00001),
-	A6XX_PROTECT_NORDWR(0x00e03, 0x0000c),
-	A6XX_PROTECT_NORDWR(0x03c00, 0x000c3),
-	A6XX_PROTECT_RDONLY(0x03cc4, 0x01fff),
-	A6XX_PROTECT_NORDWR(0x08630, 0x001cf),
-	A6XX_PROTECT_NORDWR(0x08e00, 0x00000),
-	A6XX_PROTECT_NORDWR(0x08e08, 0x00007),
-	A6XX_PROTECT_NORDWR(0x08e50, 0x0001f),
-	A6XX_PROTECT_NORDWR(0x08e80, 0x0027f),
-	A6XX_PROTECT_NORDWR(0x09624, 0x001db),
-	A6XX_PROTECT_NORDWR(0x09e60, 0x00011),
-	A6XX_PROTECT_NORDWR(0x09e78, 0x00187),
-	A6XX_PROTECT_NORDWR(0x0a630, 0x001cf),
-	A6XX_PROTECT_NORDWR(0x0ae02, 0x00000),
-	A6XX_PROTECT_NORDWR(0x0ae50, 0x0012f),
-	A6XX_PROTECT_NORDWR(0x0b604, 0x00000),
-	A6XX_PROTECT_NORDWR(0x0b608, 0x00006),
-	A6XX_PROTECT_NORDWR(0x0be02, 0x00001),
-	A6XX_PROTECT_NORDWR(0x0be20, 0x0015f),
-	A6XX_PROTECT_NORDWR(0x0d000, 0x005ff),
-	A6XX_PROTECT_NORDWR(0x0f000, 0x00bff),
-	A6XX_PROTECT_RDONLY(0x0fc00, 0x01fff),
-	A6XX_PROTECT_NORDWR(0x11c00, 0x00000), /*note: infiite range */
-};
-
-static const u32 a730_protect[] = {
-	A6XX_PROTECT_RDONLY(0x00000, 0x04ff),
-	A6XX_PROTECT_RDONLY(0x0050b, 0x0058),
-	A6XX_PROTECT_NORDWR(0x0050e, 0x0000),
-	A6XX_PROTECT_NORDWR(0x00510, 0x0000),
-	A6XX_PROTECT_NORDWR(0x00534, 0x0000),
-	A6XX_PROTECT_RDONLY(0x005fb, 0x009d),
-	A6XX_PROTECT_NORDWR(0x00699, 0x01e9),
-	A6XX_PROTECT_NORDWR(0x008a0, 0x0008),
-	A6XX_PROTECT_NORDWR(0x008ab, 0x0024),
-	/* 0x008d0-0x008dd are unprotected on purpose for tools like perfetto */
-	A6XX_PROTECT_RDONLY(0x008de, 0x0154),
-	A6XX_PROTECT_NORDWR(0x00900, 0x004d),
-	A6XX_PROTECT_NORDWR(0x0098d, 0x00b2),
-	A6XX_PROTECT_NORDWR(0x00a41, 0x01be),
-	A6XX_PROTECT_NORDWR(0x00df0, 0x0001),
-	A6XX_PROTECT_NORDWR(0x00e01, 0x0000),
-	A6XX_PROTECT_NORDWR(0x00e07, 0x0008),
-	A6XX_PROTECT_NORDWR(0x03c00, 0x00c3),
-	A6XX_PROTECT_RDONLY(0x03cc4, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x08630, 0x01cf),
-	A6XX_PROTECT_NORDWR(0x08e00, 0x0000),
-	A6XX_PROTECT_NORDWR(0x08e08, 0x0000),
-	A6XX_PROTECT_NORDWR(0x08e50, 0x001f),
-	A6XX_PROTECT_NORDWR(0x08e80, 0x0280),
-	A6XX_PROTECT_NORDWR(0x09624, 0x01db),
-	A6XX_PROTECT_NORDWR(0x09e40, 0x0000),
-	A6XX_PROTECT_NORDWR(0x09e64, 0x000d),
-	A6XX_PROTECT_NORDWR(0x09e78, 0x0187),
-	A6XX_PROTECT_NORDWR(0x0a630, 0x01cf),
-	A6XX_PROTECT_NORDWR(0x0ae02, 0x0000),
-	A6XX_PROTECT_NORDWR(0x0ae50, 0x000f),
-	A6XX_PROTECT_NORDWR(0x0ae66, 0x0003),
-	A6XX_PROTECT_NORDWR(0x0ae6f, 0x0003),
-	A6XX_PROTECT_NORDWR(0x0b604, 0x0003),
-	A6XX_PROTECT_NORDWR(0x0ec00, 0x0fff),
-	A6XX_PROTECT_RDONLY(0x0fc00, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x18400, 0x0053),
-	A6XX_PROTECT_RDONLY(0x18454, 0x0004),
-	A6XX_PROTECT_NORDWR(0x18459, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x1a459, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x1c459, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x1f400, 0x0443),
-	A6XX_PROTECT_RDONLY(0x1f844, 0x007b),
-	A6XX_PROTECT_NORDWR(0x1f860, 0x0000),
-	A6XX_PROTECT_NORDWR(0x1f878, 0x002a),
-	/* CP_PROTECT_REG[44, 46] are left untouched! */
-	0,
-	0,
-	0,
-	A6XX_PROTECT_NORDWR(0x1f8c0, 0x00000),
-};
-
 static void a6xx_set_cp_protect(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
-	const u32 *regs = a6xx_protect;
-	unsigned i, count, count_max;
-
-	if (adreno_is_a650(adreno_gpu)) {
-		regs = a650_protect;
-		count = ARRAY_SIZE(a650_protect);
-		count_max = 48;
-		BUILD_BUG_ON(ARRAY_SIZE(a650_protect) > 48);
-	} else if (adreno_is_a690(adreno_gpu)) {
-		regs = a690_protect;
-		count = ARRAY_SIZE(a690_protect);
-		count_max = 48;
-		BUILD_BUG_ON(ARRAY_SIZE(a690_protect) > 48);
-	} else if (adreno_is_a660_family(adreno_gpu)) {
-		regs = a660_protect;
-		count = ARRAY_SIZE(a660_protect);
-		count_max = 48;
-		BUILD_BUG_ON(ARRAY_SIZE(a660_protect) > 48);
-	} else if (adreno_is_a730(adreno_gpu) || adreno_is_a740(adreno_gpu)) {
-		regs = a730_protect;
-		count = ARRAY_SIZE(a730_protect);
-		count_max = 48;
-		BUILD_BUG_ON(ARRAY_SIZE(a730_protect) > 48);
-	} else {
-		regs = a6xx_protect;
-		count = ARRAY_SIZE(a6xx_protect);
-		count_max = 32;
-		BUILD_BUG_ON(ARRAY_SIZE(a6xx_protect) > 32);
-	}
+	const struct adreno_protect *protect = adreno_gpu->info->a6xx->protect;
+	unsigned i;
 
 	/*
 	 * Enable access protection to privileged registers, fault on an access
@@ -703,13 +460,13 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
 		  A6XX_CP_PROTECT_CNTL_ACCESS_FAULT_ON_VIOL_EN |
 		  A6XX_CP_PROTECT_CNTL_LAST_SPAN_INF_RANGE);
 
-	for (i = 0; i < count - 1; i++) {
+	for (i = 0; i < protect->count - 1; i++) {
 		/* Intentionally skip writing to some registers */
-		if (regs[i])
-			gpu_write(gpu, REG_A6XX_CP_PROTECT(i), regs[i]);
+		if (protect->regs[i])
+			gpu_write(gpu, REG_A6XX_CP_PROTECT(i), protect->regs[i]);
 	}
 	/* last CP_PROTECT to have "infinite" length on the last entry */
-	gpu_write(gpu, REG_A6XX_CP_PROTECT(count_max - 1), regs[i]);
+	gpu_write(gpu, REG_A6XX_CP_PROTECT(protect->count_max - 1), protect->regs[i]);
 }
 
 static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index 1840c1f3308e..0c433ff0b494 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -16,9 +16,11 @@ extern bool hang_debug;
  * struct a6xx_info - a6xx specific information from device table
  *
  * @hwcg: hw clock gating register sequence
+ * @protect: CP_PROTECT settings
  */
 struct a6xx_info {
 	const struct adreno_reglist *hwcg;
+	const struct adreno_protect *protect;
 };
 
 struct a6xx_gpu {
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index cba53203de98..cacf9e1e399f 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -132,6 +132,19 @@ struct adreno_info {
  */
 #define ADRENO_SPEEDBINS(tbl...) (struct adreno_speedbin[]) { tbl {SHRT_MAX, 0} }
 
+struct adreno_protect {
+	const uint32_t *regs;
+	uint32_t count;
+	uint32_t count_max;
+};
+
+#define DECLARE_ADRENO_PROTECT(name, __count_max)	\
+static const struct adreno_protect name = {		\
+	.regs = name ## _regs,				\
+	.count = ARRAY_SIZE(name ## _regs),		\
+	.count_max = __count_max,			\
+};
+
 struct adreno_gpu {
 	struct msm_gpu base;
 	const struct adreno_info *info;
-- 
2.42.0


