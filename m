Return-Path: <linux-arm-msm+bounces-23123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7400D90D9AB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 18:44:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB6FD1F22A9A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 16:44:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 930B914A08F;
	Tue, 18 Jun 2024 16:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bmwe6Dg8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47909145B13;
	Tue, 18 Jun 2024 16:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718729004; cv=none; b=GesOmf/3QfPi8tODTnUW0wzRbVgcc3jFScKt39lNUVzOtCAUg3bvZrhOxMkvFJwmoUZmXHUmdGb5kvw3o0WEBxvrLhIDVThV9Oto/Kd76hrg2w2iIiScNASS6dmZWdZ04SQYdhtP/QsuRm3h+PViZ0gQfNryH5e/3tgT40/5kgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718729004; c=relaxed/simple;
	bh=YDpWyJBLbv8haRBfXK2M9AEeId9a34VJGuP8Pya6L3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xnp50IlxeyjC4FC9n5SfpAva/Km+voMCZ6TZrehQA0BgivbIcyiv7IX8JRTrfsoz7eRG1KRGsQpKtPpIBocDzwn6hl9TwM23pyhYNuhdh1aEa6XHxeTiPLN4Pwjqi4UV44PEeJHz/c+Aor2AC24tkjl9j1qIqxx1RANDURAv/6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bmwe6Dg8; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1f6da06ba24so48744425ad.2;
        Tue, 18 Jun 2024 09:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718729001; x=1719333801; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zSJr+AqUV5Wo4B93ko7KR/nib77xkAGg/itouuyPktc=;
        b=bmwe6Dg85uHRlTnCf09Yolxsbuf0x2/aHoYjlNbph4kNul/nk35XwfqZy0coC6Q8bn
         JnewhyPq6r0Jp7DtmheDnUV7vtIoR1JQvkPosALDI+86wR5Sx3VT6rsAWfbj3J3RDujC
         DTNqTj1IztkZH74muk29Z8Wwyx/NZKBU/yMwWUYtjOoVEmoWKicgJXuuNzCQg6vPK+jG
         iT1l73TyChi68v4gXLeGA6hDtlxCjEQ+bqM8s3unpImmgeNpqKIWr5cGbxc5weUnvT9J
         7HfUG2qwcUWFij+HAKuj3MqfJ7BzkxvF09LZt/fyBPcTO06dUsR6rmXSI204VUm9WZYf
         awsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718729001; x=1719333801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zSJr+AqUV5Wo4B93ko7KR/nib77xkAGg/itouuyPktc=;
        b=dMdIgYWEcU0+zqxb1a772ZmkfSQKcLUuqCRqYUHLYvlRWWC7OL4hbWU93iTXLygT9A
         jg1nSAf06UUihQF2B2tTTefAV1y8AGJmD5B3R8x366wKRuFeVDL/ixSYaKCdeL3oA7fS
         bcsfydPqRPl8Cc60AVM8cwAoN4GvODGxxeT6R2Pqg8ybgZ/s9BlSfCbFnhchLouSKJMC
         xDu45c+U6qwd5rGt1OYZjdVIL4LriZvg+ZYvk45t+cCQY86s8Zy7bfVKJnNLweuROha1
         xYu7iBmomjAq07vQG5mQCkmo7+ioBSxgvLlH+hadpq7uJ9P39UKdV9YK7dhpwbm+GfQn
         T/wg==
X-Forwarded-Encrypted: i=1; AJvYcCWKOzQhYKG/PD5i8p/9RV7vojyeldZcOxJT0QjKRm99JdVi/Y01WXmkw/VvrrLAIs0xg2rZTdgokI/4GREegPmueJ/lNmBSSPVKgzlm
X-Gm-Message-State: AOJu0YxeehCWIifwrpviN8LoDTwEQxeoVd5ShmDVC5Z6O5GLprcmfwOw
	E6o50/3wwSgB4EuhaVKFNF24cW+NcimHnOHZ3LI1ie35Fw3riEWR
X-Google-Smtp-Source: AGHT+IFrFzGP4vCeM2WefUm1bQjxA2NCbvJ2Ifpe3GpeXju33/HkeaaQf4m+rbIRUC2HIbdz14B6Lw==
X-Received: by 2002:a17:902:ea12:b0:1f6:ef4f:19c3 with SMTP id d9443c01a7336-1f9aa3b5138mr1978685ad.1.1718729001228;
        Tue, 18 Jun 2024 09:43:21 -0700 (PDT)
Received: from localhost ([2a00:79e1:2e00:1301:e1c5:6354:b45d:8ffc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e74892sm99460235ad.103.2024.06.18.09.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 09:43:20 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Rob Clark <robdclark@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 5/5] drm/msm/adreno: Move CP_PROTECT settings to hw catalog
Date: Tue, 18 Jun 2024 09:42:51 -0700
Message-ID: <20240618164303.66615-6-robdclark@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240618164303.66615-1-robdclark@gmail.com>
References: <20240618164303.66615-1-robdclark@gmail.com>
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
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 248 +++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 257 +---------------------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |   2 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.h   |  13 ++
 4 files changed, 269 insertions(+), 251 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index b81bcae59ac3..329b88b24b80 100644
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
 static const struct adreno_info a6xx_gpus[] = {
 	{
 		.chip_ids = ADRENO_CHIP_IDS(0x06010000),
@@ -468,6 +635,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.zapfw = "a610_zap.mdt",
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a612_hwcg,
+			.protect = &a630_protect,
 		},
 		/*
 		 * There are (at least) three SoCs implementing A610: SM6125
@@ -498,6 +666,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.zapfw = "a615_zap.mbn",
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a615_hwcg,
+			.protect = &a630_protect,
 		},
 		.speedbins = ADRENO_SPEEDBINS(
 			{ 0,   0 },
@@ -519,6 +688,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
 		.init = a6xx_gpu_init,
 		.a6xx = &(const struct a6xx_info) {
+			.protect = &a630_protect,
 		},
 		.speedbins = ADRENO_SPEEDBINS(
 			{ 0,   0 },
@@ -540,6 +710,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.zapfw = "a615_zap.mdt",
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a615_hwcg,
+			.protect = &a630_protect,
 		},
 		.speedbins = ADRENO_SPEEDBINS(
 			{ 0,   0 },
@@ -561,6 +732,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.zapfw = "a615_zap.mdt",
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a615_hwcg,
+			.protect = &a630_protect,
 		},
 		.speedbins = ADRENO_SPEEDBINS(
 			{ 0,   0 },
@@ -582,6 +754,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.zapfw = "a615_zap.mdt",
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a615_hwcg,
+			.protect = &a630_protect,
 		},
 		.speedbins = ADRENO_SPEEDBINS(
 			{ 0,   0 },
@@ -608,6 +781,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.zapfw = "a630_zap.mdt",
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a630_hwcg,
+			.protect = &a630_protect,
 		},
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x06040001),
@@ -624,6 +798,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.zapfw = "a640_zap.mdt",
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a640_hwcg,
+			.protect = &a630_protect,
 		},
 		.speedbins = ADRENO_SPEEDBINS(
 			{ 0, 0 },
@@ -645,6 +820,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.zapfw = "a650_zap.mdt",
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a650_hwcg,
+			.protect = &a650_protect,
 		},
 		.address_space_size = SZ_16G,
 		.speedbins = ADRENO_SPEEDBINS(
@@ -669,6 +845,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.zapfw = "a660_zap.mdt",
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a660_hwcg,
+			.protect = &a660_protect,
 		},
 		.address_space_size = SZ_16G,
 	}, {
@@ -686,6 +863,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.zapfw = "a660_zap.mbn",
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a660_hwcg,
+			.protect = &a660_protect,
 		},
 		.address_space_size = SZ_16G,
 		.speedbins = ADRENO_SPEEDBINS(
@@ -709,6 +887,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.zapfw = "a640_zap.mdt",
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a640_hwcg,
+			.protect = &a630_protect,
 		},
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x06090000),
@@ -725,6 +904,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.zapfw = "a690_zap.mdt",
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a690_hwcg,
+			.protect = &a690_protect,
 		},
 		.address_space_size = SZ_16G,
 	}
@@ -916,6 +1096,60 @@ static const struct adreno_reglist a740_hwcg[] = {
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
+	/* 0x008d0-0x008dd and 0x008e0-0x008e6 are unprotected on purpose for tools like perfetto */
+	A6XX_PROTECT_NORDWR(0x008de, 0x0001),
+	A6XX_PROTECT_RDONLY(0x008e7, 0x014b),
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
+	/* CP_PROTECT_REG[45, 46] are left untouched! */
+	0,
+	0,
+	A6XX_PROTECT_NORDWR(0x1f8c0, 0x00000),
+};
+DECLARE_ADRENO_PROTECT(a730_protect, 48);
+
 static const struct adreno_info a7xx_gpus[] = {
 	{
 		.chip_ids = ADRENO_CHIP_IDS(0x07000200),
@@ -930,6 +1164,7 @@ static const struct adreno_info a7xx_gpus[] = {
 		.zapfw = "a702_zap.mbn",
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a702_hwcg,
+			.protect = &a650_protect,
 		},
 		.speedbins = ADRENO_SPEEDBINS(
 			{ 0,   0 },
@@ -952,6 +1187,7 @@ static const struct adreno_info a7xx_gpus[] = {
 		.zapfw = "a730_zap.mdt",
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a730_hwcg,
+			.protect = &a730_protect,
 		},
 		.address_space_size = SZ_16G,
 	}, {
@@ -969,6 +1205,7 @@ static const struct adreno_info a7xx_gpus[] = {
 		.zapfw = "a740_zap.mdt",
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a740_hwcg,
+			.protect = &a730_protect,
 		},
 		.address_space_size = SZ_16G,
 	}, {
@@ -985,8 +1222,19 @@ static const struct adreno_info a7xx_gpus[] = {
 		.init = a6xx_gpu_init,
 		.zapfw = "gen70900_zap.mbn",
 		.a6xx = &(const struct a6xx_info) {
+			.protect = &a730_protect,
 		},
 		.address_space_size = SZ_16G,
 	}
 };
 DECLARE_ADRENO_GPULIST(a7xx);
+
+static inline void __build_asserts(void)
+{
+	BUILD_BUG_ON(a630_protect.count > a630_protect.count_max);
+	BUILD_BUG_ON(a650_protect.count > a650_protect.count_max);
+	BUILD_BUG_ON(a660_protect.count > a660_protect.count_max);
+	BUILD_BUG_ON(a690_protect.count > a690_protect.count_max);
+	BUILD_BUG_ON(a730_protect.count > a730_protect.count_max);
+}
+
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 7e01fb551f12..f22a9e8460b3 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -465,256 +465,11 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
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
-	/* 0x008d0-0x008dd and 0x008e0-0x008e6 are unprotected on purpose for tools like perfetto */
-	A6XX_PROTECT_NORDWR(0x008de, 0x0001),
-	A6XX_PROTECT_RDONLY(0x008e7, 0x014b),
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
-	/* CP_PROTECT_REG[45, 46] are left untouched! */
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
-	if (adreno_is_a650(adreno_gpu) || adreno_is_a702(adreno_gpu)) {
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
-	} else if (adreno_is_a730(adreno_gpu) ||
-		   adreno_is_a740(adreno_gpu) ||
-		   adreno_is_a750(adreno_gpu)) {
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
@@ -726,13 +481,13 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
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
 
 static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index 61c51e9c7f06..c206dab8bc08 100644
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
index 13e68222228f..b8ee9320a315 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -143,6 +143,19 @@ const struct adreno_gpulist name ## _gpulist = {      \
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
2.45.2


