Return-Path: <linux-arm-msm+bounces-28028-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0D8949A6B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Aug 2024 23:45:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8B73284057
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Aug 2024 21:45:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DDC0171E6E;
	Tue,  6 Aug 2024 21:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IQF3VIoj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F7816FF48;
	Tue,  6 Aug 2024 21:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722980710; cv=none; b=pK6Hzx0jeuZ8nnTMCL9ZVCw3I3rfZVf0i1hLz3sYlePlprn3paUINnSG1E7+rubxRCakgbYnSfljLJzLPV6GfASnXjN3B5zFk0ALXdLzL7ZNO+Iv79lqAfkLa6EaGIHQbUDFAsizmus1ZIti4iCRo1FydAx+W33hNnQnwVvvPfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722980710; c=relaxed/simple;
	bh=XRd7pY9VidXjx9MGbG817zX8Chrnej13ueESbCisVN0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UTMWioGs6d0n3ZbhhWk/c8t7PE1l3b7k9QVVzWTnSYEENwICNBgqq7MXM2hDIOsi/6xGZKQiAV4t47yucIvw0BaeW1Q9CtLzPDXHCurfdw1uMMWI9QelpIGAU2FMsbnxnujAFKIEzmLhvBrZfgpJqHa3qJQxBjR1kxzInC2zUis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IQF3VIoj; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-492a09d4c42so318731137.0;
        Tue, 06 Aug 2024 14:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722980707; x=1723585507; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=miICkqtphbuqoVPCrRUsXPD2jAyziYTMNx3H/IAui6o=;
        b=IQF3VIojmlgDWRNuw+TJTysArVH7VWg3LKEvo2lj3wuw/BuVSLHXqHTe7+nEkvktjD
         FKy791q7bAtCP6kKuPt7ejK9PuLdaq08oKCvt/HQHKFAe51aKZ/uTe4EaSxDcxMp9pnz
         ql2cNytRcl0t7PcMJ4K0pdQDrNYTnixHHgoMEPFUoaqIlenjSnLsowcnYRirUyAUfkih
         3Q+17xjO2dVVz2gRJx7uv2uxCoHZWbmNZADvPZtnXdt/zXxYiyju7UKgrmyLXT0q+bpc
         rZYEkbfiMunts8TigPskffd+0dCbvvzzzKRvMQ6SpIecTZYkIMAMm8U1xI2w46nHIOzS
         2Vqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722980707; x=1723585507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=miICkqtphbuqoVPCrRUsXPD2jAyziYTMNx3H/IAui6o=;
        b=GVM/7NRNkRi4LR0IdbtktdcARNeDf9lja6cK/KH03iQo3EaSOAC/mAbJakG1m/Q+9i
         g/XiRL5Mj/PyMFZB/k5/h5wVamseQ4wnZRXT5sA6ETXHQiP6Puoyt1a2Sse70lvj6fvg
         Cj7Sf61t9mJaQvEiBFeTm4xrLmEbillfA6FHSm/pAFRQzsVJEHGTJN+nNFPLvlv9NN84
         4chOBNdeWFOWJysa3Hx1wRRirJfUNxYtdWbN7iM2r1Ns9kN6SXSd6UAXgQcsEq2OFgV5
         pwznrgACF3X7H4jzcHHsnjBDu7WjYb5o+Jh9qs935aJSM0junxlo++XnhUUOlBjOdn+h
         GLYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlYbSk/VkUhNX2rS0SFVBKSLPRB5U2dHVbmbYxwAgjH4R/W3vW5IgCg7xMvhTJ/57XJ7/CfXJW//n0Lv2mGfBvXz/PncFOGQD+CGqRy+lS/Yme8XgAMfnJARhDwvo6tBs5RxJj6zBvR/uBIXrZgAw/ftGlQJrYN1bzaMRg4GsMVAez91FaVog=
X-Gm-Message-State: AOJu0YyZwtnrwpULkQRG/0ylu1iVqFBDM2cX2Dqyh8w6qSmwTnd3cGhB
	yyPcDEmQrVzHReSI4qtqCFHfzjqLCBXorhNurmb/HL8ZGgeVI357
X-Google-Smtp-Source: AGHT+IE5r8vnEgfmQl8S4kMnDUmuI+D85mg6HCI9z9cAUB9cKYy5kzfXGy5KxXqa2aS2d60cWur+Tg==
X-Received: by 2002:a05:6102:374e:b0:492:99d6:e71a with SMTP id ada2fe7eead31-4945be1d04emr20422152137.18.1722980707286;
        Tue, 06 Aug 2024 14:45:07 -0700 (PDT)
Received: from localhost ([2607:fea8:52a3:d200:324c:b818:b179:79b])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bb9c8631d0sm49722606d6.106.2024.08.06.14.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 14:45:07 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v2 2/4] drm/msm/adreno: add a615 support
Date: Tue,  6 Aug 2024 17:44:56 -0400
Message-ID: <20240806214452.16406-9-mailingradian@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240806214452.16406-7-mailingradian@gmail.com>
References: <20240806214452.16406-7-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Adreno A615 is used in SDM670. Add an entry to support it.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 27 +++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 68ba9aed5506..fc4fa2a9547d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -651,6 +651,33 @@ static const struct adreno_info a6xx_gpus[] = {
 			{ 157, 3 },
 			{ 127, 4 },
 		),
+	}, {
+		.chip_ids = ADRENO_CHIP_IDS(0x06010500),
+		.family = ADRENO_6XX_GEN1,
+		.revn = 615,
+		.fw = {
+			[ADRENO_FW_SQE] = "a630_sqe.fw",
+			[ADRENO_FW_GMU] = "a630_gmu.bin",
+		},
+		.gmem = SZ_512K,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.init = a6xx_gpu_init,
+		.zapfw = "a615_zap.mdt",
+		.a6xx = &(const struct a6xx_info) {
+			.hwcg = a615_hwcg,
+			.protect = &a630_protect,
+		},
+		.speedbins = ADRENO_SPEEDBINS(
+			/*
+			 * The default speed bin (0) has the same values as
+			 * speed bin 90 which goes up to 432 MHz.
+			 */
+			{ 0,   0 },
+			{ 90,  0 },
+			{ 105, 1 },
+			{ 146, 2 },
+			{ 163, 3 },
+		),
 	}, {
 		.machine = "qcom,sm7150",
 		.chip_ids = ADRENO_CHIP_IDS(0x06010800),
-- 
2.46.0


