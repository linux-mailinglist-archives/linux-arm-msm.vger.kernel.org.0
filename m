Return-Path: <linux-arm-msm+bounces-22952-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 115CA90BF52
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 00:52:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B81F280EB8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 22:52:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DDEB19AD6A;
	Mon, 17 Jun 2024 22:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HldKkAwg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E3619AD55;
	Mon, 17 Jun 2024 22:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718664712; cv=none; b=I57vCiYMfzu5v0ST32oil0iAa8BvW+UjCOEKkIMISuk8oX/7EgY8MT7TWsbQSvup1WIyzMaK4XOSnYPPBc8IUmp15hNCaj4cwBK5rwiFCbgJjzWCWR/4k5gwN8OJIgkgRRek4zgsAim95QaZmfxnu1hnPuqeZCh9Zbc2LJ8oOus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718664712; c=relaxed/simple;
	bh=jtS8uJ4UqN1zjGIwVPYkk6rbQ3H/12LBMlmhEyv1a30=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GnmqhYKeyL6lKopaA+25ZfLLTqWizC6WYdSbnaQGJSHY9Cx2M/r97y+1OuVQ9M/vW4uWX8eEnig+P32iM1bJVlgI35OYyrmULwapzLlcC5t7DZygOdngjxDebvWkW3P+XK8MY5SJO16PGHGHLruIUma2h+Tlok6lC+71Ty1dgKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HldKkAwg; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2c508ea0cc5so1540306a91.1;
        Mon, 17 Jun 2024 15:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718664710; x=1719269510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Ju8moSe3sOApsh6AmNaY/zDh1ZxDhdsPFyZ3UzdJvA=;
        b=HldKkAwgWSiVv+vfCGFlFzCiGL/LFkEcs+UXc7SK68L4nfFjNNNc7ZT+OjuO1cGb0r
         D9KW/E/RGusgP8cBt/5pZH//69g39INSE1Oc6CuHyTwq+BSHjKKt/AObxgfEkwzBZ0Zk
         0qIl/F2UKo9WctzLnQUXfTRnpNx4npO+mxqxi1Q3oyoer7CCoUNL5Yvi6NK0/E+EFieT
         iX6OzAd1/yVqhJjA1UwgTRk1/Y/LLyj+00yvDk7e8397uMcOCYGAS5bsbWcpfj6OsbWI
         Z1ESvy9nt3aYiuaHjTbbzlSTfM1krGXJc9nJ4c0A/u9jr1PuxNdIkh5elT/80afToi/Q
         D5+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718664710; x=1719269510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Ju8moSe3sOApsh6AmNaY/zDh1ZxDhdsPFyZ3UzdJvA=;
        b=jLg9sVVkq2CCoGXST3M1SPy+E02aqJvSEjrF7S5Qj/0Xkw5zFsdvOrN90qMMwPKeDd
         wzelsGIa6jlgHBcBb7H/oJwYAg4HQ8gLzBYCXfQKfZ/u4ScHs3nZCBe6jxdThyMPp5VY
         W7sINX2uTy68XOklaTlueAsDNABjXGUxeBGPD0BiU4bHit6LeFjCnGTYftb4ThIANbSh
         RFXNFVHskAkS+mhhHCfCriE/9MKbhE4AkTwdPDoj6O8hGtWL2HG4g0NQEvzXtCLc2Xdx
         T/GltTwy1rfog+axrRTZqqP2RD97bqXEYVWRWYb5SoqkUHmQHF370pzkLNcx0wmK6pMn
         qsWw==
X-Forwarded-Encrypted: i=1; AJvYcCUhxmKqQ5bvTq/YOWioKcPTj9JGLVwXSH5VPkcHsCe/MSiwfbXwm2XAHco8XoL8TeHV+uwlYwlrT7uqYEnBPP1Sd2bUFvr5R/AqtoYJ
X-Gm-Message-State: AOJu0YzhcEiE6r+CYJK2njRBvgdXGMexKvgcqeNj1FZQTk5HpPED/SQW
	qT7VCISkkKSzp/VLYePCoZNVjhtHV00GBz4NPQfapLrMJ9i1LPH8
X-Google-Smtp-Source: AGHT+IEycSrViZYFCiPEYtHw/VoiiQdNwa9pPzOBh8JH5yhJDlJFR8YxLnoVxK4Ud4lMq+0Pnsa/XQ==
X-Received: by 2002:a17:90a:9c6:b0:2c2:e9c5:dca2 with SMTP id 98e67ed59e1d1-2c4db24d0d6mr10077970a91.16.1718664709884;
        Mon, 17 Jun 2024 15:51:49 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c4a75ee6fasm11883322a91.21.2024.06.17.15.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 15:51:49 -0700 (PDT)
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
Subject: [PATCH v3 5/5] drm/msm/adreno: Move CP_PROTECT settings to hw catalog
Date: Mon, 17 Jun 2024 15:51:15 -0700
Message-ID: <20240617225127.23476-6-robdclark@gmail.com>
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

Move the CP_PROTECT settings into the hw catalog.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 247 +++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 257 +---------------------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |   2 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.h   |  13 ++
 4 files changed, 268 insertions(+), 251 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 96d93251fdd6..f64b5a7e86c9 100644
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
 		.a6xx = &(struct a6xx_info) {
 			.hwcg = a612_hwcg,
+			.protect = &a630_protect,
 		},
 		/*
 		 * There are (at least) three SoCs implementing A610: SM6125
@@ -498,6 +666,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.zapfw = "a615_zap.mbn",
 		.a6xx = &(struct a6xx_info) {
 			.hwcg = a615_hwcg,
+			.protect = &a630_protect,
 		},
 		.speedbins = ADRENO_SPEEDBINS(
 			{ 0,   0 },
@@ -519,6 +688,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
 		.init = a6xx_gpu_init,
 		.a6xx = &(struct a6xx_info) {
+			.protect = &a630_protect,
 		},
 		.speedbins = ADRENO_SPEEDBINS(
 			{ 0,   0 },
@@ -540,6 +710,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.zapfw = "a615_zap.mdt",
 		.a6xx = &(struct a6xx_info) {
 			.hwcg = a615_hwcg,
+			.protect = &a630_protect,
 		},
 		.speedbins = ADRENO_SPEEDBINS(
 			{ 0,   0 },
@@ -561,6 +732,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.zapfw = "a615_zap.mdt",
 		.a6xx = &(struct a6xx_info) {
 			.hwcg = a615_hwcg,
+			.protect = &a630_protect,
 		},
 		.speedbins = ADRENO_SPEEDBINS(
 			{ 0,   0 },
@@ -582,6 +754,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.zapfw = "a615_zap.mdt",
 		.a6xx = &(struct a6xx_info) {
 			.hwcg = a615_hwcg,
+			.protect = &a630_protect,
 		},
 		.speedbins = ADRENO_SPEEDBINS(
 			{ 0,   0 },
@@ -608,6 +781,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.zapfw = "a630_zap.mdt",
 		.a6xx = &(struct a6xx_info) {
 			.hwcg = a630_hwcg,
+			.protect = &a630_protect,
 		},
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x06040001),
@@ -624,6 +798,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.zapfw = "a640_zap.mdt",
 		.a6xx = &(struct a6xx_info) {
 			.hwcg = a640_hwcg,
+			.protect = &a630_protect,
 		},
 		.speedbins = ADRENO_SPEEDBINS(
 			{ 0, 0 },
@@ -645,6 +820,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.zapfw = "a650_zap.mdt",
 		.a6xx = &(struct a6xx_info) {
 			.hwcg = a650_hwcg,
+			.protect = &a650_protect,
 		},
 		.address_space_size = SZ_16G,
 		.speedbins = ADRENO_SPEEDBINS(
@@ -669,6 +845,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.zapfw = "a660_zap.mdt",
 		.a6xx = &(struct a6xx_info) {
 			.hwcg = a660_hwcg,
+			.protect = &a660_protect,
 		},
 		.address_space_size = SZ_16G,
 	}, {
@@ -686,6 +863,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.zapfw = "a660_zap.mbn",
 		.a6xx = &(struct a6xx_info) {
 			.hwcg = a660_hwcg,
+			.protect = &a660_protect,
 		},
 		.address_space_size = SZ_16G,
 		.speedbins = ADRENO_SPEEDBINS(
@@ -709,6 +887,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.zapfw = "a640_zap.mdt",
 		.a6xx = &(struct a6xx_info) {
 			.hwcg = a640_hwcg,
+			.protect = &a630_protect,
 		},
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x06090000),
@@ -725,6 +904,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.zapfw = "a690_zap.mdt",
 		.a6xx = &(struct a6xx_info) {
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
@@ -952,6 +1186,7 @@ static const struct adreno_info a7xx_gpus[] = {
 		.zapfw = "a730_zap.mdt",
 		.a6xx = &(struct a6xx_info) {
 			.hwcg = a730_hwcg,
+			.protect = &a730_protect,
 		},
 		.address_space_size = SZ_16G,
 	}, {
@@ -969,6 +1204,7 @@ static const struct adreno_info a7xx_gpus[] = {
 		.zapfw = "a740_zap.mdt",
 		.a6xx = &(struct a6xx_info) {
 			.hwcg = a740_hwcg,
+			.protect = &a730_protect,
 		},
 		.address_space_size = SZ_16G,
 	}, {
@@ -985,8 +1221,19 @@ static const struct adreno_info a7xx_gpus[] = {
 		.init = a6xx_gpu_init,
 		.zapfw = "gen70900_zap.mbn",
 		.a6xx = &(struct a6xx_info) {
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


