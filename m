Return-Path: <linux-arm-msm+bounces-19181-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BFAEB8BADF1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 May 2024 15:43:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7AA602825A3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 May 2024 13:43:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 467F0153BE8;
	Fri,  3 May 2024 13:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CCTU+NO7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95630153BD0
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 May 2024 13:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714743802; cv=none; b=ezpiAUpAC4UDbrjLzj52pn/MRDE0QUMchY7Hn7oMyPOcn4y9lvHjzVaFvmF/iJquwbXRYTIieD/qd89O7Ms2VOIGCHmgtr7ZUeYMgfA5SA9yAwGATwIpxOejg1CUpag0IOUWMEUgFy8kFzAHuvuaY8TcPqG7VOoxqqnE3U6Xby4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714743802; c=relaxed/simple;
	bh=N2zmFSrGkT9c6ndL5IyvUHusS/s0yaPn2YlVkfAC70k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qIzJ63yI+rlOv44L6B2Pmzeor62a4y2i+oQIwDqaBF9N9udbydAQhgLzmfsUjAW3bmWhp+tSDTYPOZUMsFqJlxisujro9h8sgj+A2CfBT9Bsi0qd8Dge6XDUFKTBRmufJUG6DI0XHdUpb0DjQyynSgFNpA6deSSiPoIBoRKT4lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CCTU+NO7; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-34d96054375so2265822f8f.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 May 2024 06:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714743799; x=1715348599; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xcHUSvDafYk1Lqx0PWx0+St6SGzNG91ywDaPuVgmcx4=;
        b=CCTU+NO7Kic7R3rbaWXHQhnFa4Fubb+Ixwo6TgpDdOsFpIXXaCaeGWwdmXBJI4E8Bs
         Zxw0WThHBmIbQSqN2AZMvMV6yAXrN16/fjE4gcoRjxFD2CU1M7ae9SZqnfZ0+zG9TDWK
         abX2Xd+b9iU8rUlCwSF5SYM6C1kmZ5pJ+y8MMLSef9yZU4GcW6HScwqNEI7XStW1uAtA
         BggrkpbeFW5wIe2AhFgZQaCQGTfSb8+TDsxTGTj/r48PHxOLY8eeSh6WjP3UDFACUpYV
         UK4SmgwchAaUfYEOFUFmTB9JfyT/NN7tuhb1Kd2obHgBAKjnulDFQQ5+YJRFUjbpb2Qd
         KzDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714743799; x=1715348599;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xcHUSvDafYk1Lqx0PWx0+St6SGzNG91ywDaPuVgmcx4=;
        b=OJ3tnFajDxMcH933fTDXDQvo1rt6Xd5kdd/PvTrQGyNeRkMFrq1pWkd598Cxkqin8I
         u/Ge5Wt2kLsp18a/FPuaYyEEqGzvJp/dNwKpCP9ofZaP51xAZLLOejofQE3ylNkJdRDX
         chrfO1PvtUavEyRNimmSLkRBB9AtX5AN/5VyLttifU2wN6usgtAHezokHFIy874OXZvn
         KxKeo0sxO7ZC6+6a0YemiPzvagENfQaNMmomzJtPNJu/Y8z2tMIRmGd79E30Oks4Evv6
         nhTpfpww88DU+qLpBG3z5mdRi1kAFnRzIJ1GjzTjYRO1zAv09Dc0z08abTdTnnmm1tNj
         8YDQ==
X-Gm-Message-State: AOJu0Yzqa7Pz3NmTQVN5KMRa0z92fHelRu0cDJBaX9vfgVOR4uHCRbX2
	qI2ipUnglsA8hcVI54gsIGFgMHc2GrmT7MD7b9/wEr193b7/QqN4
X-Google-Smtp-Source: AGHT+IFgy007nk4lwb9+qHzM3LIhRX8TQ3+slmruBxYUerkFj8FXxv6jcBOgqHiLgfIkoy1KO67PCg==
X-Received: by 2002:a5d:6449:0:b0:34b:e446:3e6 with SMTP id d9-20020a5d6449000000b0034be44603e6mr1937761wrw.3.1714743798954;
        Fri, 03 May 2024 06:43:18 -0700 (PDT)
Received: from [192.168.0.20] (cpc115152-dals23-2-0-cust532.20-2.cable.virginm.net. [86.12.82.21])
        by smtp.gmail.com with ESMTPSA id z18-20020adff1d2000000b0034df178a9acsm3782482wro.99.2024.05.03.06.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 06:43:18 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Fri, 03 May 2024 14:42:33 +0100
Subject: [PATCH 4/5] drm/msm: Adjust a7xx GBIF debugbus dumping
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240503-a750-devcoredump-v1-4-04e669e2c3f7@gmail.com>
References: <20240503-a750-devcoredump-v1-0-04e669e2c3f7@gmail.com>
In-Reply-To: <20240503-a750-devcoredump-v1-0-04e669e2c3f7@gmail.com>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714743792; l=1650;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=N2zmFSrGkT9c6ndL5IyvUHusS/s0yaPn2YlVkfAC70k=;
 b=qzN/0XhCAE9mT9rvz/hZiZh4o/gIsgeE9ZFcVkQqAiTF6dBe2y4ARJG9oS9a9lqFW9PEZEFaP
 JOxEQgTtpxdArWtzQxiBst7/VnYQtBbqVtgAFS0qzxfFkSqbLrmb88e
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=

Use the kgsl-style list of indices, because this is about to change for
a750 and we want to reuse the downstream header directly.
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index 83d7ee01c944..bb0592af41f3 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -412,7 +412,7 @@ static void a7xx_get_debugbus_blocks(struct msm_gpu *gpu,
 
 		for (i = 0; i < ARRAY_SIZE(a7xx_gbif_debugbus_blocks); i++) {
 			a6xx_get_debugbus_block(gpu,
-				a6xx_state, &a7xx_gbif_debugbus_blocks[i],
+				a6xx_state, &a7xx_debugbus_blocks[a7xx_gbif_debugbus_blocks[i]],
 				&a6xx_state->debugbus[i + debugbus_blocks_count]);
 		}
 	}
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
index 5ddd32063bcc..3b1ba514e8ee 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
@@ -517,9 +517,9 @@ static const struct a6xx_debugbus_block a650_debugbus_blocks[] = {
 	DEBUGBUS(A6XX_DBGBUS_SPTP_5, 0x100),
 };
 
-static const struct a6xx_debugbus_block a7xx_gbif_debugbus_blocks[] = {
-	DEBUGBUS(A7XX_DBGBUS_GBIF_CX, 0x100),
-	DEBUGBUS(A7XX_DBGBUS_GBIF_GX, 0x100),
+static const u32 a7xx_gbif_debugbus_blocks[] = {
+	A7XX_DBGBUS_GBIF_CX,
+	A7XX_DBGBUS_GBIF_GX,
 };
 
 static const struct a6xx_debugbus_block a7xx_cx_debugbus_blocks[] = {

-- 
2.31.1


