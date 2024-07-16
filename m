Return-Path: <linux-arm-msm+bounces-26356-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C65DB932D8F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 18:06:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 793141F21407
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 16:06:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F47919EEA5;
	Tue, 16 Jul 2024 16:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L9SRWqOV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEDCF19E7FE;
	Tue, 16 Jul 2024 16:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721145997; cv=none; b=WNAa0p6I5lv+x5sMEdzopXpmemworgRptWj8/1OqCUv9lvFam8+KpMQfHtIdEF6K7lp3+YRcM81IHKtMzrKoTg8rLluucACLI85uHdI3LuaCyCChmU7qMiGWb862loKwZvajV3A5yCl1fgTul4tVpsYknhDFDdXJzgPkWTeRJdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721145997; c=relaxed/simple;
	bh=2kHGF9aiwyDgW0D2tnahFLNXdjvVAK78BFeOpJ7TfOY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pzKOQCv2kmBRBNdVc8RPU9UaLxxmNFu8wZ/o0ymwX3EwLVpTZpjoXoZ/uMtbrFecEuV/9f7tUemmCuuFa2mGCz571tuGFNHB/QQJ8jKZhl+331Fby6mUgwq+2lNdpfysqC3GvzcYOL/CtMCoz1UjMbQh0dE7T8w4aivZ0D3a4Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L9SRWqOV; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1fbfb8e5e0cso38682455ad.0;
        Tue, 16 Jul 2024 09:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721145995; x=1721750795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u6pCZR4wcgR/cYxgBLBcUrNbMm1B/HCdSgGHK6zUJlk=;
        b=L9SRWqOVtzjLa0UTckc7/mS5fHKeYCIQI2OYgpQFQl/2rss7b1gZBLSGKX9XWzAPqS
         8dvfAoxfDfrUQEUJxV25FU5UVelf3iDLv3WLYMRKhZlFHyiu3NnlsEtZFYyZ3kg5RP2+
         bfjx+lAM/vwaCbQUr+za1OqvHsOQHt0GoMZFvmIE9pRU6X+DXny/jAPhuIuAHt5lt0Gz
         Y/xAd0ALQ93i0zmg1WXcXHcTtiOPurFhe3cnc1FloM2i19U4Gt4upfZ7lFB855cTwC8e
         tqDxNP3Tw13++Wu0xESaBF0Pqw18IGR4ROfDTNe7kbmUU0lwgcS+MPphNICzgGMmW0/z
         gGzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721145995; x=1721750795;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u6pCZR4wcgR/cYxgBLBcUrNbMm1B/HCdSgGHK6zUJlk=;
        b=X6u/0zPb7xthmVYp/TI6ocXL+wGk1GowtUyCHP8+zosmqGgegMpDO6r9V4rrI8iZAJ
         Ph25ZyU6D+l1jMQsZM6zvBjagkt5p1qGpRm87EgrJM12WTxJ8TzWwDbXTrz/ir2FL8+9
         mc0xPi7Q9kC9rek0e8HclIBW8yf9JcGjnmKtXYKYAw3yqAtx03jn/e073CX5cGxI4qrf
         1by26uyvmU8Sw8kSyPLBRU8x75/GqfeAxcayQPz517tP7p88b4LM4+AToiFx8xzs+AzC
         tzITWOwBimE2IYD36h3UmSIRYO2lRHG1EbatXauBfl9ShOYWU+DR5ueXTqFX3gHua6SJ
         L41Q==
X-Forwarded-Encrypted: i=1; AJvYcCVmFhGcmRtcUi3Bh0EotiKyjqu2OjRKy5+FpTLgRyEjkBT+AvCsHSIrsMeQBIZlpK+S933u3U06bEXdcUzu/cCcchqAprhCL1f6aiez
X-Gm-Message-State: AOJu0YzDpY/SOFYnVT62MEdNjdvvK4QZPg/RrEfAPKbU203fEp6gTUML
	z3DnMGwRoUIlBbNXkQBuTWpxCmLbM8DLwZxCMdoWsO1V6WkfV1jJ
X-Google-Smtp-Source: AGHT+IFkwji5x3Oqvss0h58aBnzkmVskzoPH352Fb2wsLQBiGDCGTRDaXtszAo6wJdGsjuwge9gzbg==
X-Received: by 2002:a17:902:ea12:b0:1fb:6473:e933 with SMTP id d9443c01a7336-1fc3d989ff7mr21155395ad.41.1721145994814;
        Tue, 16 Jul 2024 09:06:34 -0700 (PDT)
Received: from localhost ([2a00:79e1:2e00:1301:e1c5:6354:b45d:8ffc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bb9befbsm60481865ad.74.2024.07.16.09.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 09:06:34 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Rob Clark <robdclark@chromium.org>,
	Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm/adreno: Fix error return if missing firmware-name
Date: Tue, 16 Jul 2024 09:06:30 -0700
Message-ID: <20240716160631.386713-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

-ENODEV is used to signify that there is no zap shader for the platform,
and the CPU can directly take the GPU out of secure mode.  We want to
use this return code when there is no zap-shader node.  But not when
there is, but without a firmware-name property.  This case we want to
treat as-if the needed fw is not found.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index b46e7e93b3ed..0d84be3be0b7 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -99,7 +99,7 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
 		 * was a bad idea, and is only provided for backwards
 		 * compatibility for older targets.
 		 */
-		return -ENODEV;
+		return -ENOENT;
 	}
 
 	if (IS_ERR(fw)) {
-- 
2.45.2


