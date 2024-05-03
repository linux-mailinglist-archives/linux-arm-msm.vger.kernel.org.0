Return-Path: <linux-arm-msm+bounces-19182-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C84D8BADF2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 May 2024 15:43:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D79C3282EA3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 May 2024 13:43:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 963CF153BCB;
	Fri,  3 May 2024 13:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dm3zscjp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E124A1474BF
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 May 2024 13:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714743802; cv=none; b=LO90EuP77CDSyhpCq9egMoocO9E6rkRZwKkYIAtgIq3JrA+OzuDQ048ZeX2cSCUP0pwk5dcQgbtIDqbhQLt9kPS+YrSnKQSY14bI/2BNb0MHoMWY9wUaAsfgYT75yljgAIiHxgxyeO97jzS6HY6M0wyeGkSUPUH9rPizzQwWx2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714743802; c=relaxed/simple;
	bh=LuKMs/s1slVC/kyDSGH6sgbY2zVFyGlCylWtp2VHAhg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Uk0HnTnvTOshFI9szILtyTVLIE4OjRexhLnby32uev83ZGgQZYgWvL/enKK1bTq2saQI/DyfDBKV1ftI6ZJSdARaZmDsgYUGzn9yG8BKDhzpNY/VIw8S94qoHiZ6lNzAJe59wJ/YH4M8G6JrQ7vXflXP+Y7i1LoLIf+vkdpcOYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dm3zscjp; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-34d8d11a523so2192611f8f.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 May 2024 06:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714743797; x=1715348597; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=msDxwSC/SotNBIly95F5q8e9l2Kfum4zGmw9VjDicH0=;
        b=dm3zscjpzfY9QkZb8FKUpxwK3ATUqmRnbymWz64wOMR7HzdMvyNBznrTrAjwDo2xog
         9xQgUfiVajJ0Jgc4n5+PKUd51KkS/1DL/1K8MRQzpC6bqmf7YrerL8IGcccd4/YMsqdS
         lU+ASS9TYyYtwa1by9558T9Y8MfSdWgqvv3QAXggYzA7F7KaE1Jy13FZbQvrQ44foCvh
         Oh3v4NeH3cdb0bfNqa0d1B5z4mUqPwtFJY6Ko0d2hEi7nqEuAMZMQOUYno9bLWVRxoO1
         jEjI0ma3Js2HDL0zmpTY+KbZDBiUkrorC+7THzCrr3iHF3ca+/DWjHCwFOyADaL0weSP
         nTbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714743797; x=1715348597;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=msDxwSC/SotNBIly95F5q8e9l2Kfum4zGmw9VjDicH0=;
        b=Zg6c6lzWwuySQrjp0/1ujSkkPftFNVpLz++dEbrG0knJ5bwxUcsK0Lawco9kp24zQ5
         UG+1DQHnivLKIZpIU6x7rDntwlsEiZ3NCU/ZW3RT84EVJxEPYJXSs61hY+QRj3vIAYON
         1frkecaLTST5d3ZoX6t+BZKyZueMDbILRLqxdzCEdNQ7zbp85QqvRqy2GtT5ej5qe5cR
         GP+KrGr+q9OS72MtpCE3o0yRnziBXpgagKvKofgHvLgSAbE7Uap25EOxe/biI0q7S7DO
         nfRLICRgfQ2tKf1i1Ke9lgwviBwpJ7odOd8Vksqrj4C0VbFnxvItnOxHCsCsT4t/pSjK
         9+hA==
X-Gm-Message-State: AOJu0YzLt6xWfUu1FicMv338TJnK/H6I3jjLiU7cgJ8HoVYJMrja1isa
	LsgTDwp5sVUvxPzdXYOXBm1JD1Q07bfw7WcWwOOEq+BxCzSKrNFE
X-Google-Smtp-Source: AGHT+IGBt3TubmP8TPldfXNhLixdb9DUlJK2c2OtRw0+kTvQOUMV/mZ6JBtSh7nprxuyrrs5uqBFOg==
X-Received: by 2002:a5d:5610:0:b0:34c:e2f:ceeb with SMTP id l16-20020a5d5610000000b0034c0e2fceebmr1851173wrv.17.1714743796912;
        Fri, 03 May 2024 06:43:16 -0700 (PDT)
Received: from [192.168.0.20] (cpc115152-dals23-2-0-cust532.20-2.cable.virginm.net. [86.12.82.21])
        by smtp.gmail.com with ESMTPSA id z18-20020adff1d2000000b0034df178a9acsm3782482wro.99.2024.05.03.06.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 06:43:15 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Fri, 03 May 2024 14:42:31 +0100
Subject: [PATCH 2/5] drm/msm: Fix imported a750 snapshot header for
 upstream
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240503-a750-devcoredump-v1-2-04e669e2c3f7@gmail.com>
References: <20240503-a750-devcoredump-v1-0-04e669e2c3f7@gmail.com>
In-Reply-To: <20240503-a750-devcoredump-v1-0-04e669e2c3f7@gmail.com>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714743792; l=59257;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=LuKMs/s1slVC/kyDSGH6sgbY2zVFyGlCylWtp2VHAhg=;
 b=cTn1VO7zt3Ko+UTwN/8IcCdqtp/FtZMqVa8varDtDVoTFwQIyqYryiuEiSuKBHnSHenNVCWSi
 +NBvThBLSzBD7+al3fmhE3jSCJNhGFOsy1Bs4+w2cGWt8dkW/DYocpT
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=

Add A7XX prefixes necessary because we use the same code for dumping
a6xx and a7xx, fix register name prefixes for upstream, and use the
upstream header.
---
 .../gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h  | 888 +++++++++++----------
 1 file changed, 454 insertions(+), 434 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h b/drivers/gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h
index 80b3238df76c..260d66eccfec 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h
@@ -6,209 +6,209 @@
 #ifndef __ADRENO_GEN7_9_0_SNAPSHOT_H
 #define __ADRENO_GEN7_9_0_SNAPSHOT_H
 
-#include "adreno_gen7_snapshot.h"
+#include "a6xx_gpu_state.h"
 
 static const u32 gen7_9_0_debugbus_blocks[] = {
-	DEBUGBUS_CP_0_0,
-	DEBUGBUS_CP_0_1,
-	DEBUGBUS_RBBM,
-	DEBUGBUS_HLSQ,
-	DEBUGBUS_UCHE_0,
-	DEBUGBUS_UCHE_1,
-	DEBUGBUS_TESS_BR,
-	DEBUGBUS_TESS_BV,
-	DEBUGBUS_PC_BR,
-	DEBUGBUS_PC_BV,
-	DEBUGBUS_VFDP_BR,
-	DEBUGBUS_VFDP_BV,
-	DEBUGBUS_VPC_BR,
-	DEBUGBUS_VPC_BV,
-	DEBUGBUS_TSE_BR,
-	DEBUGBUS_TSE_BV,
-	DEBUGBUS_RAS_BR,
-	DEBUGBUS_RAS_BV,
-	DEBUGBUS_VSC,
-	DEBUGBUS_COM_0,
-	DEBUGBUS_LRZ_BR,
-	DEBUGBUS_LRZ_BV,
-	DEBUGBUS_UFC_0,
-	DEBUGBUS_UFC_1,
-	DEBUGBUS_GMU_GX,
-	DEBUGBUS_DBGC,
-	DEBUGBUS_GPC_BR,
-	DEBUGBUS_GPC_BV,
-	DEBUGBUS_LARC,
-	DEBUGBUS_HLSQ_SPTP,
-	DEBUGBUS_RB_0,
-	DEBUGBUS_RB_1,
-	DEBUGBUS_RB_2,
-	DEBUGBUS_RB_3,
-	DEBUGBUS_RB_4,
-	DEBUGBUS_RB_5,
-	DEBUGBUS_UCHE_WRAPPER,
-	DEBUGBUS_CCU_0,
-	DEBUGBUS_CCU_1,
-	DEBUGBUS_CCU_2,
-	DEBUGBUS_CCU_3,
-	DEBUGBUS_CCU_4,
-	DEBUGBUS_CCU_5,
-	DEBUGBUS_VFD_BR_0,
-	DEBUGBUS_VFD_BR_1,
-	DEBUGBUS_VFD_BR_2,
-	DEBUGBUS_VFD_BV_0,
-	DEBUGBUS_VFD_BV_1,
-	DEBUGBUS_VFD_BV_2,
-	DEBUGBUS_USP_0,
-	DEBUGBUS_USP_1,
-	DEBUGBUS_USP_2,
-	DEBUGBUS_USP_3,
-	DEBUGBUS_USP_4,
-	DEBUGBUS_USP_5,
-	DEBUGBUS_TP_0,
-	DEBUGBUS_TP_1,
-	DEBUGBUS_TP_2,
-	DEBUGBUS_TP_3,
-	DEBUGBUS_TP_4,
-	DEBUGBUS_TP_5,
-	DEBUGBUS_TP_6,
-	DEBUGBUS_TP_7,
-	DEBUGBUS_TP_8,
-	DEBUGBUS_TP_9,
-	DEBUGBUS_TP_10,
-	DEBUGBUS_TP_11,
-	DEBUGBUS_USPTP_0,
-	DEBUGBUS_USPTP_1,
-	DEBUGBUS_USPTP_2,
-	DEBUGBUS_USPTP_3,
-	DEBUGBUS_USPTP_4,
-	DEBUGBUS_USPTP_5,
-	DEBUGBUS_USPTP_6,
-	DEBUGBUS_USPTP_7,
-	DEBUGBUS_USPTP_8,
-	DEBUGBUS_USPTP_9,
-	DEBUGBUS_USPTP_10,
-	DEBUGBUS_USPTP_11,
-	DEBUGBUS_CCHE_0,
-	DEBUGBUS_CCHE_1,
-	DEBUGBUS_CCHE_2,
-	DEBUGBUS_VPC_DSTR_0,
-	DEBUGBUS_VPC_DSTR_1,
-	DEBUGBUS_VPC_DSTR_2,
-	DEBUGBUS_HLSQ_DP_STR_0,
-	DEBUGBUS_HLSQ_DP_STR_1,
-	DEBUGBUS_HLSQ_DP_STR_2,
-	DEBUGBUS_HLSQ_DP_STR_3,
-	DEBUGBUS_HLSQ_DP_STR_4,
-	DEBUGBUS_HLSQ_DP_STR_5,
-	DEBUGBUS_UFC_DSTR_0,
-	DEBUGBUS_UFC_DSTR_1,
-	DEBUGBUS_UFC_DSTR_2,
-	DEBUGBUS_CGC_SUBCORE,
-	DEBUGBUS_CGC_CORE,
+	A7XX_DBGBUS_CP_0_0,
+	A7XX_DBGBUS_CP_0_1,
+	A7XX_DBGBUS_RBBM,
+	A7XX_DBGBUS_HLSQ,
+	A7XX_DBGBUS_UCHE_0,
+	A7XX_DBGBUS_UCHE_1,
+	A7XX_DBGBUS_TESS_BR,
+	A7XX_DBGBUS_TESS_BV,
+	A7XX_DBGBUS_PC_BR,
+	A7XX_DBGBUS_PC_BV,
+	A7XX_DBGBUS_VFDP_BR,
+	A7XX_DBGBUS_VFDP_BV,
+	A7XX_DBGBUS_VPC_BR,
+	A7XX_DBGBUS_VPC_BV,
+	A7XX_DBGBUS_TSE_BR,
+	A7XX_DBGBUS_TSE_BV,
+	A7XX_DBGBUS_RAS_BR,
+	A7XX_DBGBUS_RAS_BV,
+	A7XX_DBGBUS_VSC,
+	A7XX_DBGBUS_COM_0,
+	A7XX_DBGBUS_LRZ_BR,
+	A7XX_DBGBUS_LRZ_BV,
+	A7XX_DBGBUS_UFC_0,
+	A7XX_DBGBUS_UFC_1,
+	A7XX_DBGBUS_GMU_GX,
+	A7XX_DBGBUS_DBGC,
+	A7XX_DBGBUS_GPC_BR,
+	A7XX_DBGBUS_GPC_BV,
+	A7XX_DBGBUS_LARC,
+	A7XX_DBGBUS_HLSQ_SPTP,
+	A7XX_DBGBUS_RB_0,
+	A7XX_DBGBUS_RB_1,
+	A7XX_DBGBUS_RB_2,
+	A7XX_DBGBUS_RB_3,
+	A7XX_DBGBUS_RB_4,
+	A7XX_DBGBUS_RB_5,
+	A7XX_DBGBUS_UCHE_WRAPPER,
+	A7XX_DBGBUS_CCU_0,
+	A7XX_DBGBUS_CCU_1,
+	A7XX_DBGBUS_CCU_2,
+	A7XX_DBGBUS_CCU_3,
+	A7XX_DBGBUS_CCU_4,
+	A7XX_DBGBUS_CCU_5,
+	A7XX_DBGBUS_VFD_BR_0,
+	A7XX_DBGBUS_VFD_BR_1,
+	A7XX_DBGBUS_VFD_BR_2,
+	A7XX_DBGBUS_VFD_BV_0,
+	A7XX_DBGBUS_VFD_BV_1,
+	A7XX_DBGBUS_VFD_BV_2,
+	A7XX_DBGBUS_USP_0,
+	A7XX_DBGBUS_USP_1,
+	A7XX_DBGBUS_USP_2,
+	A7XX_DBGBUS_USP_3,
+	A7XX_DBGBUS_USP_4,
+	A7XX_DBGBUS_USP_5,
+	A7XX_DBGBUS_TP_0,
+	A7XX_DBGBUS_TP_1,
+	A7XX_DBGBUS_TP_2,
+	A7XX_DBGBUS_TP_3,
+	A7XX_DBGBUS_TP_4,
+	A7XX_DBGBUS_TP_5,
+	A7XX_DBGBUS_TP_6,
+	A7XX_DBGBUS_TP_7,
+	A7XX_DBGBUS_TP_8,
+	A7XX_DBGBUS_TP_9,
+	A7XX_DBGBUS_TP_10,
+	A7XX_DBGBUS_TP_11,
+	A7XX_DBGBUS_USPTP_0,
+	A7XX_DBGBUS_USPTP_1,
+	A7XX_DBGBUS_USPTP_2,
+	A7XX_DBGBUS_USPTP_3,
+	A7XX_DBGBUS_USPTP_4,
+	A7XX_DBGBUS_USPTP_5,
+	A7XX_DBGBUS_USPTP_6,
+	A7XX_DBGBUS_USPTP_7,
+	A7XX_DBGBUS_USPTP_8,
+	A7XX_DBGBUS_USPTP_9,
+	A7XX_DBGBUS_USPTP_10,
+	A7XX_DBGBUS_USPTP_11,
+	A7XX_DBGBUS_CCHE_0,
+	A7XX_DBGBUS_CCHE_1,
+	A7XX_DBGBUS_CCHE_2,
+	A7XX_DBGBUS_VPC_DSTR_0,
+	A7XX_DBGBUS_VPC_DSTR_1,
+	A7XX_DBGBUS_VPC_DSTR_2,
+	A7XX_DBGBUS_HLSQ_DP_STR_0,
+	A7XX_DBGBUS_HLSQ_DP_STR_1,
+	A7XX_DBGBUS_HLSQ_DP_STR_2,
+	A7XX_DBGBUS_HLSQ_DP_STR_3,
+	A7XX_DBGBUS_HLSQ_DP_STR_4,
+	A7XX_DBGBUS_HLSQ_DP_STR_5,
+	A7XX_DBGBUS_UFC_DSTR_0,
+	A7XX_DBGBUS_UFC_DSTR_1,
+	A7XX_DBGBUS_UFC_DSTR_2,
+	A7XX_DBGBUS_CGC_SUBCORE,
+	A7XX_DBGBUS_CGC_CORE,
 };
 
 static const u32 gen7_9_0_gbif_debugbus_blocks[] = {
-	DEBUGBUS_GBIF_GX,
+	A7XX_DBGBUS_GBIF_GX,
 };
 
 static const u32 gen7_9_0_cx_debugbus_blocks[] = {
-	DEBUGBUS_CX,
-	DEBUGBUS_GMU_CX,
-	DEBUGBUS_GBIF_CX,
+	A7XX_DBGBUS_CX,
+	A7XX_DBGBUS_GMU_CX,
+	A7XX_DBGBUS_GBIF_CX,
 };
 
 static struct gen7_shader_block gen7_9_0_shader_blocks[] = {
-	{ TP0_TMO_DATA, 0x0200, 6, 2, PIPE_BR, USPTP },
-	{ TP0_SMO_DATA, 0x0080, 6, 2, PIPE_BR, USPTP },
-	{ TP0_MIPMAP_BASE_DATA, 0x03C0, 6, 2, PIPE_BR, USPTP },
-	{ SP_INST_DATA, 0x0800, 6, 2, PIPE_BR, USPTP },
-	{ SP_INST_DATA_1, 0x0800, 6, 2, PIPE_BR, USPTP },
-	{ SP_LB_0_DATA, 0x0800, 6, 2, PIPE_BR, USPTP },
-	{ SP_LB_1_DATA, 0x0800, 6, 2, PIPE_BR, USPTP },
-	{ SP_LB_2_DATA, 0x0800, 6, 2, PIPE_BR, USPTP },
-	{ SP_LB_3_DATA, 0x0800, 6, 2, PIPE_BR, USPTP },
-	{ SP_LB_4_DATA, 0x0800, 6, 2, PIPE_BR, USPTP },
-	{ SP_LB_5_DATA, 0x0800, 6, 2, PIPE_BR, USPTP },
-	{ SP_LB_6_DATA, 0x0800, 6, 2, PIPE_BR, USPTP },
-	{ SP_LB_7_DATA, 0x0800, 6, 2, PIPE_BR, USPTP },
-	{ SP_CB_RAM, 0x0390, 6, 2, PIPE_BR, USPTP },
-	{ SP_LB_13_DATA, 0x0800, 6, 2, PIPE_BR, USPTP },
-	{ SP_LB_14_DATA, 0x0800, 6, 2, PIPE_BR, USPTP },
-	{ SP_INST_TAG, 0x00C0, 6, 2, PIPE_BR, USPTP },
-	{ SP_INST_DATA_2, 0x0800, 6, 2, PIPE_BR, USPTP },
-	{ SP_TMO_TAG, 0x0080, 6, 2, PIPE_BR, USPTP },
-	{ SP_SMO_TAG, 0x0080, 6, 2, PIPE_BR, USPTP },
-	{ SP_STATE_DATA, 0x0040, 6, 2, PIPE_BR, USPTP },
-	{ SP_HWAVE_RAM, 0x0100, 6, 2, PIPE_BR, USPTP },
-	{ SP_L0_INST_BUF, 0x0050, 6, 2, PIPE_BR, USPTP },
-	{ SP_LB_8_DATA, 0x0800, 6, 2, PIPE_BR, USPTP },
-	{ SP_LB_9_DATA, 0x0800, 6, 2, PIPE_BR, USPTP },
-	{ SP_LB_10_DATA, 0x0800, 6, 2, PIPE_BR, USPTP },
-	{ SP_LB_11_DATA, 0x0800, 6, 2, PIPE_BR, USPTP },
-	{ SP_LB_12_DATA, 0x0800, 6, 2, PIPE_BR, USPTP },
-	{ HLSQ_DATAPATH_DSTR_META, 0x0010, 1, 1, PIPE_BR, HLSQ_STATE },
-	{ HLSQ_DATAPATH_DSTR_META, 0x0010, 1, 1, PIPE_BV, HLSQ_STATE },
-	{ HLSQ_L2STC_TAG_RAM, 0x0200, 1, 1, PIPE_BR, HLSQ_STATE },
-	{ HLSQ_L2STC_INFO_CMD, 0x0474, 1, 1, PIPE_BR, HLSQ_STATE },
-	{ HLSQ_CVS_BE_CTXT_BUF_RAM_TAG, 0x0080, 1, 1, PIPE_BR, HLSQ_STATE },
-	{ HLSQ_CVS_BE_CTXT_BUF_RAM_TAG, 0x0080, 1, 1, PIPE_BV, HLSQ_STATE },
-	{ HLSQ_CPS_BE_CTXT_BUF_RAM_TAG, 0x0080, 1, 1, PIPE_BR, HLSQ_STATE },
-	{ HLSQ_GFX_CVS_BE_CTXT_BUF_RAM, 0x0400, 1, 1, PIPE_BR, HLSQ_STATE },
-	{ HLSQ_GFX_CVS_BE_CTXT_BUF_RAM, 0x0400, 1, 1, PIPE_BV, HLSQ_STATE },
-	{ HLSQ_GFX_CPS_BE_CTXT_BUF_RAM, 0x0400, 1, 1, PIPE_BR, HLSQ_STATE },
-	{ HLSQ_CHUNK_CVS_RAM, 0x01C0, 1, 1, PIPE_BR, HLSQ_STATE },
-	{ HLSQ_CHUNK_CVS_RAM, 0x01C0, 1, 1, PIPE_BV, HLSQ_STATE },
-	{ HLSQ_CHUNK_CPS_RAM, 0x0300, 1, 1, PIPE_BR, HLSQ_STATE },
-	{ HLSQ_CHUNK_CPS_RAM, 0x0180, 1, 1, PIPE_LPAC, HLSQ_STATE },
-	{ HLSQ_CHUNK_CVS_RAM_TAG, 0x0040, 1, 1, PIPE_BR, HLSQ_STATE },
-	{ HLSQ_CHUNK_CVS_RAM_TAG, 0x0040, 1, 1, PIPE_BV, HLSQ_STATE },
-	{ HLSQ_CHUNK_CPS_RAM_TAG, 0x0040, 1, 1, PIPE_BR, HLSQ_STATE },
-	{ HLSQ_CHUNK_CPS_RAM_TAG, 0x0040, 1, 1, PIPE_LPAC, HLSQ_STATE },
-	{ HLSQ_ICB_CVS_CB_BASE_TAG, 0x0010, 1, 1, PIPE_BR, HLSQ_STATE },
-	{ HLSQ_ICB_CVS_CB_BASE_TAG, 0x0010, 1, 1, PIPE_BV, HLSQ_STATE },
-	{ HLSQ_ICB_CPS_CB_BASE_TAG, 0x0010, 1, 1, PIPE_BR, HLSQ_STATE },
-	{ HLSQ_ICB_CPS_CB_BASE_TAG, 0x0010, 1, 1, PIPE_LPAC, HLSQ_STATE },
-	{ HLSQ_CVS_MISC_RAM, 0x0540, 1, 1, PIPE_BR, HLSQ_STATE },
-	{ HLSQ_CVS_MISC_RAM, 0x0540, 1, 1, PIPE_BV, HLSQ_STATE },
-	{ HLSQ_CPS_MISC_RAM, 0x0640, 1, 1, PIPE_BR, HLSQ_STATE },
-	{ HLSQ_CPS_MISC_RAM, 0x00B0, 1, 1, PIPE_LPAC, HLSQ_STATE },
-	{ HLSQ_CPS_MISC_RAM_1, 0x0800, 1, 1, PIPE_BR, HLSQ_STATE },
-	{ HLSQ_INST_RAM, 0x0800, 1, 1, PIPE_BR, HLSQ_STATE },
-	{ HLSQ_INST_RAM, 0x0800, 1, 1, PIPE_BV, HLSQ_STATE },
-	{ HLSQ_INST_RAM, 0x0200, 1, 1, PIPE_LPAC, HLSQ_STATE },
-	{ HLSQ_GFX_CVS_CONST_RAM, 0x0800, 1, 1, PIPE_BR, HLSQ_STATE },
-	{ HLSQ_GFX_CVS_CONST_RAM, 0x0800, 1, 1, PIPE_BV, HLSQ_STATE },
-	{ HLSQ_GFX_CPS_CONST_RAM, 0x0800, 1, 1, PIPE_BR, HLSQ_STATE },
-	{ HLSQ_GFX_CPS_CONST_RAM, 0x0800, 1, 1, PIPE_LPAC, HLSQ_STATE },
-	{ HLSQ_CVS_MISC_RAM_TAG, 0x0050, 1, 1, PIPE_BR, HLSQ_STATE },
-	{ HLSQ_CVS_MISC_RAM_TAG, 0x0050, 1, 1, PIPE_BV, HLSQ_STATE },
-	{ HLSQ_CPS_MISC_RAM_TAG, 0x0050, 1, 1, PIPE_BR, HLSQ_STATE },
-	{ HLSQ_CPS_MISC_RAM_TAG, 0x0008, 1, 1, PIPE_LPAC, HLSQ_STATE },
-	{ HLSQ_INST_RAM_TAG, 0x0014, 1, 1, PIPE_BR, HLSQ_STATE },
-	{ HLSQ_INST_RAM_TAG, 0x0010, 1, 1, PIPE_BV, HLSQ_STATE },
-	{ HLSQ_INST_RAM_TAG, 0x0004, 1, 1, PIPE_LPAC, HLSQ_STATE },
-	{ HLSQ_GFX_CVS_CONST_RAM_TAG, 0x0040, 1, 1, PIPE_BR, HLSQ_STATE },
-	{ HLSQ_GFX_CVS_CONST_RAM_TAG, 0x0040, 1, 1, PIPE_BV, HLSQ_STATE },
-	{ HLSQ_GFX_CPS_CONST_RAM_TAG, 0x0040, 1, 1, PIPE_BR, HLSQ_STATE },
-	{ HLSQ_GFX_CPS_CONST_RAM_TAG, 0x0020, 1, 1, PIPE_LPAC, HLSQ_STATE },
-	{ HLSQ_GFX_LOCAL_MISC_RAM, 0x03C0, 1, 1, PIPE_BR, HLSQ_STATE },
-	{ HLSQ_GFX_LOCAL_MISC_RAM, 0x0280, 1, 1, PIPE_BV, HLSQ_STATE },
-	{ HLSQ_GFX_LOCAL_MISC_RAM, 0x0050, 1, 1, PIPE_LPAC, HLSQ_STATE },
-	{ HLSQ_GFX_LOCAL_MISC_RAM_TAG, 0x0010, 1, 1, PIPE_BR, HLSQ_STATE },
-	{ HLSQ_GFX_LOCAL_MISC_RAM_TAG, 0x0008, 1, 1, PIPE_BV, HLSQ_STATE },
-	{ HLSQ_INST_RAM_1, 0x0800, 1, 1, PIPE_BR, HLSQ_STATE },
-	{ HLSQ_STPROC_META, 0x0010, 1, 1, PIPE_BR, HLSQ_STATE },
-	{ HLSQ_BV_BE_META, 0x0018, 1, 1, PIPE_BR, HLSQ_STATE },
-	{ HLSQ_BV_BE_META, 0x0018, 1, 1, PIPE_BV, HLSQ_STATE },
-	{ HLSQ_INST_RAM_2, 0x0800, 1, 1, PIPE_BR, HLSQ_STATE },
-	{ HLSQ_DATAPATH_META, 0x0020, 1, 1, PIPE_BR, HLSQ_STATE },
-	{ HLSQ_FRONTEND_META, 0x0080, 1, 1, PIPE_BR, HLSQ_STATE },
-	{ HLSQ_FRONTEND_META, 0x0080, 1, 1, PIPE_BV, HLSQ_STATE },
-	{ HLSQ_FRONTEND_META, 0x0080, 1, 1, PIPE_LPAC, HLSQ_STATE },
-	{ HLSQ_INDIRECT_META, 0x0010, 1, 1, PIPE_BR, HLSQ_STATE },
-	{ HLSQ_BACKEND_META, 0x0040, 1, 1, PIPE_BR, HLSQ_STATE },
-	{ HLSQ_BACKEND_META, 0x0040, 1, 1, PIPE_BV, HLSQ_STATE },
-	{ HLSQ_BACKEND_META, 0x0040, 1, 1, PIPE_LPAC, HLSQ_STATE },
+	{ A7XX_TP0_TMO_DATA, 0x0200, 6, 2, A7XX_PIPE_BR, A7XX_USPTP },
+	{ A7XX_TP0_SMO_DATA, 0x0080, 6, 2, A7XX_PIPE_BR, A7XX_USPTP },
+	{ A7XX_TP0_MIPMAP_BASE_DATA, 0x03C0, 6, 2, A7XX_PIPE_BR, A7XX_USPTP },
+	{ A7XX_SP_INST_DATA, 0x0800, 6, 2, A7XX_PIPE_BR, A7XX_USPTP },
+	{ A7XX_SP_INST_DATA_1, 0x0800, 6, 2, A7XX_PIPE_BR, A7XX_USPTP },
+	{ A7XX_SP_LB_0_DATA, 0x0800, 6, 2, A7XX_PIPE_BR, A7XX_USPTP },
+	{ A7XX_SP_LB_1_DATA, 0x0800, 6, 2, A7XX_PIPE_BR, A7XX_USPTP },
+	{ A7XX_SP_LB_2_DATA, 0x0800, 6, 2, A7XX_PIPE_BR, A7XX_USPTP },
+	{ A7XX_SP_LB_3_DATA, 0x0800, 6, 2, A7XX_PIPE_BR, A7XX_USPTP },
+	{ A7XX_SP_LB_4_DATA, 0x0800, 6, 2, A7XX_PIPE_BR, A7XX_USPTP },
+	{ A7XX_SP_LB_5_DATA, 0x0800, 6, 2, A7XX_PIPE_BR, A7XX_USPTP },
+	{ A7XX_SP_LB_6_DATA, 0x0800, 6, 2, A7XX_PIPE_BR, A7XX_USPTP },
+	{ A7XX_SP_LB_7_DATA, 0x0800, 6, 2, A7XX_PIPE_BR, A7XX_USPTP },
+	{ A7XX_SP_CB_RAM, 0x0390, 6, 2, A7XX_PIPE_BR, A7XX_USPTP },
+	{ A7XX_SP_LB_13_DATA, 0x0800, 6, 2, A7XX_PIPE_BR, A7XX_USPTP },
+	{ A7XX_SP_LB_14_DATA, 0x0800, 6, 2, A7XX_PIPE_BR, A7XX_USPTP },
+	{ A7XX_SP_INST_TAG, 0x00C0, 6, 2, A7XX_PIPE_BR, A7XX_USPTP },
+	{ A7XX_SP_INST_DATA_2, 0x0800, 6, 2, A7XX_PIPE_BR, A7XX_USPTP },
+	{ A7XX_SP_TMO_TAG, 0x0080, 6, 2, A7XX_PIPE_BR, A7XX_USPTP },
+	{ A7XX_SP_SMO_TAG, 0x0080, 6, 2, A7XX_PIPE_BR, A7XX_USPTP },
+	{ A7XX_SP_STATE_DATA, 0x0040, 6, 2, A7XX_PIPE_BR, A7XX_USPTP },
+	{ A7XX_SP_HWAVE_RAM, 0x0100, 6, 2, A7XX_PIPE_BR, A7XX_USPTP },
+	{ A7XX_SP_L0_INST_BUF, 0x0050, 6, 2, A7XX_PIPE_BR, A7XX_USPTP },
+	{ A7XX_SP_LB_8_DATA, 0x0800, 6, 2, A7XX_PIPE_BR, A7XX_USPTP },
+	{ A7XX_SP_LB_9_DATA, 0x0800, 6, 2, A7XX_PIPE_BR, A7XX_USPTP },
+	{ A7XX_SP_LB_10_DATA, 0x0800, 6, 2, A7XX_PIPE_BR, A7XX_USPTP },
+	{ A7XX_SP_LB_11_DATA, 0x0800, 6, 2, A7XX_PIPE_BR, A7XX_USPTP },
+	{ A7XX_SP_LB_12_DATA, 0x0800, 6, 2, A7XX_PIPE_BR, A7XX_USPTP },
+	{ A7XX_HLSQ_DATAPATH_DSTR_META, 0x0010, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_DATAPATH_DSTR_META, 0x0010, 1, 1, A7XX_PIPE_BV, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_L2STC_TAG_RAM, 0x0200, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_L2STC_INFO_CMD, 0x0474, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_CVS_BE_CTXT_BUF_RAM_TAG, 0x0080, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_CVS_BE_CTXT_BUF_RAM_TAG, 0x0080, 1, 1, A7XX_PIPE_BV, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_CPS_BE_CTXT_BUF_RAM_TAG, 0x0080, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_GFX_CVS_BE_CTXT_BUF_RAM, 0x0400, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_GFX_CVS_BE_CTXT_BUF_RAM, 0x0400, 1, 1, A7XX_PIPE_BV, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_GFX_CPS_BE_CTXT_BUF_RAM, 0x0400, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_CHUNK_CVS_RAM, 0x01C0, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_CHUNK_CVS_RAM, 0x01C0, 1, 1, A7XX_PIPE_BV, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_CHUNK_CPS_RAM, 0x0300, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_CHUNK_CPS_RAM, 0x0180, 1, 1, A7XX_PIPE_LPAC, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_CHUNK_CVS_RAM_TAG, 0x0040, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_CHUNK_CVS_RAM_TAG, 0x0040, 1, 1, A7XX_PIPE_BV, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_CHUNK_CPS_RAM_TAG, 0x0040, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_CHUNK_CPS_RAM_TAG, 0x0040, 1, 1, A7XX_PIPE_LPAC, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_ICB_CVS_CB_BASE_TAG, 0x0010, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_ICB_CVS_CB_BASE_TAG, 0x0010, 1, 1, A7XX_PIPE_BV, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_ICB_CPS_CB_BASE_TAG, 0x0010, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_ICB_CPS_CB_BASE_TAG, 0x0010, 1, 1, A7XX_PIPE_LPAC, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_CVS_MISC_RAM, 0x0540, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_CVS_MISC_RAM, 0x0540, 1, 1, A7XX_PIPE_BV, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_CPS_MISC_RAM, 0x0640, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_CPS_MISC_RAM, 0x00B0, 1, 1, A7XX_PIPE_LPAC, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_CPS_MISC_RAM_1, 0x0800, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_INST_RAM, 0x0800, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_INST_RAM, 0x0800, 1, 1, A7XX_PIPE_BV, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_INST_RAM, 0x0200, 1, 1, A7XX_PIPE_LPAC, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_GFX_CVS_CONST_RAM, 0x0800, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_GFX_CVS_CONST_RAM, 0x0800, 1, 1, A7XX_PIPE_BV, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_GFX_CPS_CONST_RAM, 0x0800, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_GFX_CPS_CONST_RAM, 0x0800, 1, 1, A7XX_PIPE_LPAC, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_CVS_MISC_RAM_TAG, 0x0050, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_CVS_MISC_RAM_TAG, 0x0050, 1, 1, A7XX_PIPE_BV, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_CPS_MISC_RAM_TAG, 0x0050, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_CPS_MISC_RAM_TAG, 0x0008, 1, 1, A7XX_PIPE_LPAC, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_INST_RAM_TAG, 0x0014, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_INST_RAM_TAG, 0x0010, 1, 1, A7XX_PIPE_BV, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_INST_RAM_TAG, 0x0004, 1, 1, A7XX_PIPE_LPAC, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_GFX_CVS_CONST_RAM_TAG, 0x0040, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_GFX_CVS_CONST_RAM_TAG, 0x0040, 1, 1, A7XX_PIPE_BV, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_GFX_CPS_CONST_RAM_TAG, 0x0040, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_GFX_CPS_CONST_RAM_TAG, 0x0020, 1, 1, A7XX_PIPE_LPAC, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_GFX_LOCAL_MISC_RAM, 0x03C0, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_GFX_LOCAL_MISC_RAM, 0x0280, 1, 1, A7XX_PIPE_BV, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_GFX_LOCAL_MISC_RAM, 0x0050, 1, 1, A7XX_PIPE_LPAC, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_GFX_LOCAL_MISC_RAM_TAG, 0x0010, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_GFX_LOCAL_MISC_RAM_TAG, 0x0008, 1, 1, A7XX_PIPE_BV, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_INST_RAM_1, 0x0800, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_STPROC_META, 0x0010, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_BV_BE_META, 0x0018, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_BV_BE_META, 0x0018, 1, 1, A7XX_PIPE_BV, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_INST_RAM_2, 0x0800, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_DATAPATH_META, 0x0020, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_FRONTEND_META, 0x0080, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_FRONTEND_META, 0x0080, 1, 1, A7XX_PIPE_BV, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_FRONTEND_META, 0x0080, 1, 1, A7XX_PIPE_LPAC, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_INDIRECT_META, 0x0010, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_BACKEND_META, 0x0040, 1, 1, A7XX_PIPE_BR, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_BACKEND_META, 0x0040, 1, 1, A7XX_PIPE_BV, A7XX_HLSQ_STATE },
+	{ A7XX_HLSQ_BACKEND_META, 0x0040, 1, 1, A7XX_PIPE_LPAC, A7XX_HLSQ_STATE },
 };
 
 /*
@@ -226,7 +226,7 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_pre_crashdumper_gpu_registers), 8));
  * Block   : ['BROADCAST', 'CP', 'GRAS', 'GXCLKCTL']
  * Block   : ['PC', 'RBBM', 'RDVM', 'UCHE']
  * Block   : ['VFD', 'VPC', 'VSC']
- * Pipeline: PIPE_NONE
+ * Pipeline: A7XX_PIPE_NONE
  * pairs   : 196 (Regs:1778)
  */
 static const u32 gen7_9_0_gpu_registers[] = {
@@ -290,7 +290,7 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_gxclkctl_registers), 8));
 
 /*
  * Block   : ['GMUAO', 'GMUCX', 'GMUCX_RAM']
- * Pipeline: PIPE_NONE
+ * Pipeline: A7XX_PIPE_NONE
  * pairs   : 134 (Regs:429)
  */
 static const u32 gen7_9_0_gmu_registers[] = {
@@ -334,7 +334,7 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_gmu_registers), 8));
 
 /*
  * Block   : ['GMUGX']
- * Pipeline: PIPE_NONE
+ * Pipeline: A7XX_PIPE_NONE
  * pairs   : 44 (Regs:454)
  */
 static const u32 gen7_9_0_gmugx_registers[] = {
@@ -355,7 +355,7 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_gmugx_registers), 8));
 
 /*
  * Block   : ['CX_MISC']
- * Pipeline: PIPE_NONE
+ * Pipeline: A7XX_PIPE_NONE
  * pairs   : 7 (Regs:56)
  */
 static const u32 gen7_9_0_cx_misc_registers[] = {
@@ -367,7 +367,7 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_cx_misc_registers), 8));
 
 /*
  * Block   : ['DBGC']
- * Pipeline: PIPE_NONE
+ * Pipeline: A7XX_PIPE_NONE
  * pairs   : 19 (Regs:155)
  */
 static const u32 gen7_9_0_dbgc_registers[] = {
@@ -382,7 +382,7 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_dbgc_registers), 8));
 
 /*
  * Block   : ['CX_DBGC']
- * Pipeline: PIPE_NONE
+ * Pipeline: A7XX_PIPE_NONE
  * pairs   : 7 (Regs:75)
  */
 static const u32 gen7_9_0_cx_dbgc_registers[] = {
@@ -396,8 +396,8 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_cx_dbgc_registers), 8));
  * Block   : ['BROADCAST', 'CP', 'CX_DBGC', 'CX_MISC', 'DBGC', 'GBIF']
  * Block   : ['GMUAO', 'GMUCX', 'GMUGX', 'GRAS', 'GXCLKCTL', 'PC']
  * Block   : ['RBBM', 'RDVM', 'UCHE', 'VFD', 'VPC', 'VSC']
- * Pipeline: PIPE_BR
- * Cluster : CLUSTER_NONE
+ * Pipeline: A7XX_PIPE_BR
+ * Cluster : A7XX_CLUSTER_NONE
  * pairs   : 29 (Regs:573)
  */
 static const u32 gen7_9_0_non_context_pipe_br_registers[] = {
@@ -417,8 +417,8 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_non_context_pipe_br_registers), 8));
  * Block   : ['BROADCAST', 'CP', 'CX_DBGC', 'CX_MISC', 'DBGC', 'GBIF']
  * Block   : ['GMUAO', 'GMUCX', 'GMUGX', 'GRAS', 'GXCLKCTL', 'PC']
  * Block   : ['RBBM', 'RDVM', 'UCHE', 'VFD', 'VPC', 'VSC']
- * Pipeline: PIPE_BV
- * Cluster : CLUSTER_NONE
+ * Pipeline: A7XX_PIPE_BV
+ * Cluster : A7XX_CLUSTER_NONE
  * pairs   : 29 (Regs:573)
  */
 static const u32 gen7_9_0_non_context_pipe_bv_registers[] = {
@@ -438,8 +438,8 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_non_context_pipe_bv_registers), 8));
  * Block   : ['BROADCAST', 'CP', 'CX_DBGC', 'CX_MISC', 'DBGC', 'GBIF']
  * Block   : ['GMUAO', 'GMUCX', 'GMUGX', 'GRAS', 'GXCLKCTL', 'PC']
  * Block   : ['RBBM', 'RDVM', 'UCHE', 'VFD', 'VPC', 'VSC']
- * Pipeline: PIPE_LPAC
- * Cluster : CLUSTER_NONE
+ * Pipeline: A7XX_PIPE_LPAC
+ * Cluster : A7XX_CLUSTER_NONE
  * pairs   : 2 (Regs:7)
  */
 static const u32 gen7_9_0_non_context_pipe_lpac_registers[] = {
@@ -450,8 +450,8 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_non_context_pipe_lpac_registers), 8));
 
 /*
  * Block   : ['RB']
- * Pipeline: PIPE_BR
- * Cluster : CLUSTER_NONE
+ * Pipeline: A7XX_PIPE_BR
+ * Cluster : A7XX_CLUSTER_NONE
  * pairs   : 5 (Regs:37)
  */
 static const u32 gen7_9_0_non_context_rb_pipe_br_rac_registers[] = {
@@ -463,8 +463,8 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_non_context_rb_pipe_br_rac_registers),
 
 /*
  * Block   : ['RB']
- * Pipeline: PIPE_BR
- * Cluster : CLUSTER_NONE
+ * Pipeline: A7XX_PIPE_BR
+ * Cluster : A7XX_CLUSTER_NONE
  * pairs   : 15 (Regs:66)
  */
 static const u32 gen7_9_0_non_context_rb_pipe_br_rbp_registers[] = {
@@ -478,9 +478,9 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_non_context_rb_pipe_br_rbp_registers),
 
 /*
  * Block   : ['SP']
- * Pipeline: PIPE_BR
- * Cluster : CLUSTER_NONE
- * Location: HLSQ_STATE
+ * Pipeline: A7XX_PIPE_BR
+ * Cluster : A7XX_CLUSTER_NONE
+ * Location: A7XX_HLSQ_STATE
  * pairs   : 4 (Regs:28)
  */
 static const u32 gen7_9_0_non_context_sp_pipe_br_hlsq_state_registers[] = {
@@ -491,9 +491,9 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_non_context_sp_pipe_br_hlsq_state_regis
 
 /*
  * Block   : ['SP']
- * Pipeline: PIPE_BR
- * Cluster : CLUSTER_NONE
- * Location: SP_TOP
+ * Pipeline: A7XX_PIPE_BR
+ * Cluster : A7XX_CLUSTER_NONE
+ * Location: A7XX_SP_TOP
  * pairs   : 10 (Regs:61)
  */
 static const u32 gen7_9_0_non_context_sp_pipe_br_sp_top_registers[] = {
@@ -506,9 +506,9 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_non_context_sp_pipe_br_sp_top_registers
 
 /*
  * Block   : ['SP']
- * Pipeline: PIPE_BR
- * Cluster : CLUSTER_NONE
- * Location: USPTP
+ * Pipeline: A7XX_PIPE_BR
+ * Cluster : A7XX_CLUSTER_NONE
+ * Location: A7XX_USPTP
  * pairs   : 12 (Regs:62)
  */
 static const u32 gen7_9_0_non_context_sp_pipe_br_usptp_registers[] = {
@@ -521,9 +521,9 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_non_context_sp_pipe_br_usptp_registers)
 
 /*
  * Block   : ['SP']
- * Pipeline: PIPE_BR
- * Cluster : CLUSTER_NONE
- * Location: HLSQ_DP_STR
+ * Pipeline: A7XX_PIPE_BR
+ * Cluster : A7XX_CLUSTER_NONE
+ * Location: A7XX_HLSQ_DP_STR
  * pairs   : 2 (Regs:5)
  */
 static const u32 gen7_9_0_non_context_sp_pipe_br_hlsq_dp_str_registers[] = {
@@ -534,9 +534,9 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_non_context_sp_pipe_br_hlsq_dp_str_regi
 
 /*
  * Block   : ['SP']
- * Pipeline: PIPE_LPAC
- * Cluster : CLUSTER_NONE
- * Location: HLSQ_STATE
+ * Pipeline: A7XX_PIPE_LPAC
+ * Cluster : A7XX_CLUSTER_NONE
+ * Location: A7XX_HLSQ_STATE
  * pairs   : 1 (Regs:5)
  */
 static const u32 gen7_9_0_non_context_sp_pipe_lpac_hlsq_state_registers[] = {
@@ -547,9 +547,9 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_non_context_sp_pipe_lpac_hlsq_state_reg
 
 /*
  * Block   : ['SP']
- * Pipeline: PIPE_LPAC
- * Cluster : CLUSTER_NONE
- * Location: SP_TOP
+ * Pipeline: A7XX_PIPE_LPAC
+ * Cluster : A7XX_CLUSTER_NONE
+ * Location: A7XX_SP_TOP
  * pairs   : 1 (Regs:6)
  */
 static const u32 gen7_9_0_non_context_sp_pipe_lpac_sp_top_registers[] = {
@@ -560,9 +560,9 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_non_context_sp_pipe_lpac_sp_top_registe
 
 /*
  * Block   : ['SP']
- * Pipeline: PIPE_LPAC
- * Cluster : CLUSTER_NONE
- * Location: USPTP
+ * Pipeline: A7XX_PIPE_LPAC
+ * Cluster : A7XX_CLUSTER_NONE
+ * Location: A7XX_USPTP
  * pairs   : 2 (Regs:9)
  */
 static const u32 gen7_9_0_non_context_sp_pipe_lpac_usptp_registers[] = {
@@ -573,9 +573,9 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_non_context_sp_pipe_lpac_usptp_register
 
 /*
  * Block   : ['TPL1']
- * Pipeline: PIPE_NONE
- * Cluster : CLUSTER_NONE
- * Location: USPTP
+ * Pipeline: A7XX_PIPE_NONE
+ * Cluster : A7XX_CLUSTER_NONE
+ * Location: A7XX_USPTP
  * pairs   : 5 (Regs:29)
  */
 static const u32 gen7_9_0_non_context_tpl1_pipe_none_usptp_registers[] = {
@@ -587,9 +587,9 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_non_context_tpl1_pipe_none_usptp_regist
 
 /*
  * Block   : ['TPL1']
- * Pipeline: PIPE_BR
- * Cluster : CLUSTER_NONE
- * Location: USPTP
+ * Pipeline: A7XX_PIPE_BR
+ * Cluster : A7XX_CLUSTER_NONE
+ * Location: A7XX_USPTP
  * pairs   : 1 (Regs:1)
  */
 static const u32 gen7_9_0_non_context_tpl1_pipe_br_usptp_registers[] = {
@@ -600,9 +600,9 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_non_context_tpl1_pipe_br_usptp_register
 
 /*
  * Block   : ['TPL1']
- * Pipeline: PIPE_LPAC
- * Cluster : CLUSTER_NONE
- * Location: USPTP
+ * Pipeline: A7XX_PIPE_LPAC
+ * Cluster : A7XX_CLUSTER_NONE
+ * Location: A7XX_USPTP
  * pairs   : 1 (Regs:1)
  */
 static const u32 gen7_9_0_non_context_tpl1_pipe_lpac_usptp_registers[] = {
@@ -613,8 +613,8 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_non_context_tpl1_pipe_lpac_usptp_regist
 
 /*
  * Block   : ['GRAS']
- * Pipeline: PIPE_BR
- * Cluster : CLUSTER_GRAS
+ * Pipeline: A7XX_PIPE_BR
+ * Cluster : A7XX_CLUSTER_GRAS
  * pairs   : 14 (Regs:293)
  */
 static const u32 gen7_9_0_gras_pipe_br_cluster_gras_registers[] = {
@@ -628,8 +628,8 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_gras_pipe_br_cluster_gras_registers), 8
 
 /*
  * Block   : ['GRAS']
- * Pipeline: PIPE_BV
- * Cluster : CLUSTER_GRAS
+ * Pipeline: A7XX_PIPE_BV
+ * Cluster : A7XX_CLUSTER_GRAS
  * pairs   : 14 (Regs:293)
  */
 static const u32 gen7_9_0_gras_pipe_bv_cluster_gras_registers[] = {
@@ -643,8 +643,8 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_gras_pipe_bv_cluster_gras_registers), 8
 
 /*
  * Block   : ['PC']
- * Pipeline: PIPE_BR
- * Cluster : CLUSTER_FE
+ * Pipeline: A7XX_PIPE_BR
+ * Cluster : A7XX_CLUSTER_FE
  * pairs   : 6 (Regs:31)
  */
 static const u32 gen7_9_0_pc_pipe_br_cluster_fe_registers[] = {
@@ -656,8 +656,8 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_pc_pipe_br_cluster_fe_registers), 8));
 
 /*
  * Block   : ['PC']
- * Pipeline: PIPE_BV
- * Cluster : CLUSTER_FE
+ * Pipeline: A7XX_PIPE_BV
+ * Cluster : A7XX_CLUSTER_FE
  * pairs   : 6 (Regs:31)
  */
 static const u32 gen7_9_0_pc_pipe_bv_cluster_fe_registers[] = {
@@ -669,8 +669,8 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_pc_pipe_bv_cluster_fe_registers), 8));
 
 /*
  * Block   : ['VFD']
- * Pipeline: PIPE_BR
- * Cluster : CLUSTER_FE
+ * Pipeline: A7XX_PIPE_BR
+ * Cluster : A7XX_CLUSTER_FE
  * pairs   : 2 (Regs:236)
  */
 static const u32 gen7_9_0_vfd_pipe_br_cluster_fe_registers[] = {
@@ -681,8 +681,8 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_vfd_pipe_br_cluster_fe_registers), 8));
 
 /*
  * Block   : ['VFD']
- * Pipeline: PIPE_BV
- * Cluster : CLUSTER_FE
+ * Pipeline: A7XX_PIPE_BV
+ * Cluster : A7XX_CLUSTER_FE
  * pairs   : 2 (Regs:236)
  */
 static const u32 gen7_9_0_vfd_pipe_bv_cluster_fe_registers[] = {
@@ -693,8 +693,8 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_vfd_pipe_bv_cluster_fe_registers), 8));
 
 /*
  * Block   : ['VPC']
- * Pipeline: PIPE_BR
- * Cluster : CLUSTER_FE
+ * Pipeline: A7XX_PIPE_BR
+ * Cluster : A7XX_CLUSTER_FE
  * pairs   : 2 (Regs:18)
  */
 static const u32 gen7_9_0_vpc_pipe_br_cluster_fe_registers[] = {
@@ -705,8 +705,8 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_vpc_pipe_br_cluster_fe_registers), 8));
 
 /*
  * Block   : ['VPC']
- * Pipeline: PIPE_BR
- * Cluster : CLUSTER_PC_VS
+ * Pipeline: A7XX_PIPE_BR
+ * Cluster : A7XX_CLUSTER_PC_VS
  * pairs   : 3 (Regs:30)
  */
 static const u32 gen7_9_0_vpc_pipe_br_cluster_pc_vs_registers[] = {
@@ -717,8 +717,8 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_vpc_pipe_br_cluster_pc_vs_registers), 8
 
 /*
  * Block   : ['VPC']
- * Pipeline: PIPE_BR
- * Cluster : CLUSTER_VPC_PS
+ * Pipeline: A7XX_PIPE_BR
+ * Cluster : A7XX_CLUSTER_VPC_PS
  * pairs   : 5 (Regs:76)
  */
 static const u32 gen7_9_0_vpc_pipe_br_cluster_vpc_ps_registers[] = {
@@ -730,8 +730,8 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_vpc_pipe_br_cluster_vpc_ps_registers),
 
 /*
  * Block   : ['VPC']
- * Pipeline: PIPE_BV
- * Cluster : CLUSTER_FE
+ * Pipeline: A7XX_PIPE_BV
+ * Cluster : A7XX_CLUSTER_FE
  * pairs   : 2 (Regs:18)
  */
 static const u32 gen7_9_0_vpc_pipe_bv_cluster_fe_registers[] = {
@@ -742,8 +742,8 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_vpc_pipe_bv_cluster_fe_registers), 8));
 
 /*
  * Block   : ['VPC']
- * Pipeline: PIPE_BV
- * Cluster : CLUSTER_PC_VS
+ * Pipeline: A7XX_PIPE_BV
+ * Cluster : A7XX_CLUSTER_PC_VS
  * pairs   : 3 (Regs:30)
  */
 static const u32 gen7_9_0_vpc_pipe_bv_cluster_pc_vs_registers[] = {
@@ -754,8 +754,8 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_vpc_pipe_bv_cluster_pc_vs_registers), 8
 
 /*
  * Block   : ['VPC']
- * Pipeline: PIPE_BV
- * Cluster : CLUSTER_VPC_PS
+ * Pipeline: A7XX_PIPE_BV
+ * Cluster : A7XX_CLUSTER_VPC_PS
  * pairs   : 5 (Regs:76)
  */
 static const u32 gen7_9_0_vpc_pipe_bv_cluster_vpc_ps_registers[] = {
@@ -767,8 +767,8 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_vpc_pipe_bv_cluster_vpc_ps_registers),
 
 /*
  * Block   : ['RB']
- * Pipeline: PIPE_BR
- * Cluster : CLUSTER_PS
+ * Pipeline: A7XX_PIPE_BR
+ * Cluster : A7XX_CLUSTER_PS
  * pairs   : 39 (Regs:133)
  */
 static const u32 gen7_9_0_rb_pipe_br_cluster_ps_rac_registers[] = {
@@ -788,8 +788,8 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_rb_pipe_br_cluster_ps_rac_registers), 8
 
 /*
  * Block   : ['RB']
- * Pipeline: PIPE_BR
- * Cluster : CLUSTER_PS
+ * Pipeline: A7XX_PIPE_BR
+ * Cluster : A7XX_CLUSTER_PS
  * pairs   : 34 (Regs:100)
  */
 static const u32 gen7_9_0_rb_pipe_br_cluster_ps_rbp_registers[] = {
@@ -808,9 +808,9 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_rb_pipe_br_cluster_ps_rbp_registers), 8
 
 /*
  * Block   : ['SP']
- * Pipeline: PIPE_BR
- * Cluster : CLUSTER_SP_VS
- * Location: HLSQ_STATE
+ * Pipeline: A7XX_PIPE_BR
+ * Cluster : A7XX_CLUSTER_SP_VS
+ * Location: A7XX_HLSQ_STATE
  * pairs   : 29 (Regs:215)
  */
 static const u32 gen7_9_0_sp_pipe_br_cluster_sp_vs_hlsq_state_registers[] = {
@@ -828,9 +828,9 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_sp_pipe_br_cluster_sp_vs_hlsq_state_reg
 
 /*
  * Block   : ['SP']
- * Pipeline: PIPE_BR
- * Cluster : CLUSTER_SP_VS
- * Location: SP_TOP
+ * Pipeline: A7XX_PIPE_BR
+ * Cluster : A7XX_CLUSTER_SP_VS
+ * Location: A7XX_SP_TOP
  * pairs   : 22 (Regs:73)
  */
 static const u32 gen7_9_0_sp_pipe_br_cluster_sp_vs_sp_top_registers[] = {
@@ -846,9 +846,9 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_sp_pipe_br_cluster_sp_vs_sp_top_registe
 
 /*
  * Block   : ['SP']
- * Pipeline: PIPE_BR
- * Cluster : CLUSTER_SP_VS
- * Location: USPTP
+ * Pipeline: A7XX_PIPE_BR
+ * Cluster : A7XX_CLUSTER_SP_VS
+ * Location: A7XX_USPTP
  * pairs   : 16 (Regs:269)
  */
 static const u32 gen7_9_0_sp_pipe_br_cluster_sp_vs_usptp_registers[] = {
@@ -862,9 +862,9 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_sp_pipe_br_cluster_sp_vs_usptp_register
 
 /*
  * Block   : ['SP']
- * Pipeline: PIPE_BR
- * Cluster : CLUSTER_SP_PS
- * Location: HLSQ_STATE
+ * Pipeline: A7XX_PIPE_BR
+ * Cluster : A7XX_CLUSTER_SP_PS
+ * Location: A7XX_HLSQ_STATE
  * pairs   : 21 (Regs:334)
  */
 static const u32 gen7_9_0_sp_pipe_br_cluster_sp_ps_hlsq_state_registers[] = {
@@ -880,9 +880,9 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_sp_pipe_br_cluster_sp_ps_hlsq_state_reg
 
 /*
  * Block   : ['SP']
- * Pipeline: PIPE_BR
- * Cluster : CLUSTER_SP_PS
- * Location: HLSQ_DP
+ * Pipeline: A7XX_PIPE_BR
+ * Cluster : A7XX_CLUSTER_SP_PS
+ * Location: A7XX_HLSQ_DP
  * pairs   : 3 (Regs:19)
  */
 static const u32 gen7_9_0_sp_pipe_br_cluster_sp_ps_hlsq_dp_registers[] = {
@@ -893,9 +893,9 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_sp_pipe_br_cluster_sp_ps_hlsq_dp_regist
 
 /*
  * Block   : ['SP']
- * Pipeline: PIPE_BR
- * Cluster : CLUSTER_SP_PS
- * Location: SP_TOP
+ * Pipeline: A7XX_PIPE_BR
+ * Cluster : A7XX_CLUSTER_SP_PS
+ * Location: A7XX_SP_TOP
  * pairs   : 18 (Regs:77)
  */
 static const u32 gen7_9_0_sp_pipe_br_cluster_sp_ps_sp_top_registers[] = {
@@ -910,9 +910,9 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_sp_pipe_br_cluster_sp_ps_sp_top_registe
 
 /*
  * Block   : ['SP']
- * Pipeline: PIPE_BR
- * Cluster : CLUSTER_SP_PS
- * Location: USPTP
+ * Pipeline: A7XX_PIPE_BR
+ * Cluster : A7XX_CLUSTER_SP_PS
+ * Location: A7XX_USPTP
  * pairs   : 17 (Regs:333)
  */
 static const u32 gen7_9_0_sp_pipe_br_cluster_sp_ps_usptp_registers[] = {
@@ -927,9 +927,9 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_sp_pipe_br_cluster_sp_ps_usptp_register
 
 /*
  * Block   : ['SP']
- * Pipeline: PIPE_BR
- * Cluster : CLUSTER_SP_PS
- * Location: HLSQ_DP_STR
+ * Pipeline: A7XX_PIPE_BR
+ * Cluster : A7XX_CLUSTER_SP_PS
+ * Location: A7XX_HLSQ_DP_STR
  * pairs   : 1 (Regs:6)
  */
 static const u32 gen7_9_0_sp_pipe_br_cluster_sp_ps_hlsq_dp_str_registers[] = {
@@ -940,9 +940,9 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_sp_pipe_br_cluster_sp_ps_hlsq_dp_str_re
 
 /*
  * Block   : ['SP']
- * Pipeline: PIPE_BV
- * Cluster : CLUSTER_SP_VS
- * Location: HLSQ_STATE
+ * Pipeline: A7XX_PIPE_BV
+ * Cluster : A7XX_CLUSTER_SP_VS
+ * Location: A7XX_HLSQ_STATE
  * pairs   : 28 (Regs:213)
  */
 static const u32 gen7_9_0_sp_pipe_bv_cluster_sp_vs_hlsq_state_registers[] = {
@@ -959,9 +959,9 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_sp_pipe_bv_cluster_sp_vs_hlsq_state_reg
 
 /*
  * Block   : ['SP']
- * Pipeline: PIPE_BV
- * Cluster : CLUSTER_SP_VS
- * Location: SP_TOP
+ * Pipeline: A7XX_PIPE_BV
+ * Cluster : A7XX_CLUSTER_SP_VS
+ * Location: A7XX_SP_TOP
  * pairs   : 21 (Regs:71)
  */
 static const u32 gen7_9_0_sp_pipe_bv_cluster_sp_vs_sp_top_registers[] = {
@@ -977,9 +977,9 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_sp_pipe_bv_cluster_sp_vs_sp_top_registe
 
 /*
  * Block   : ['SP']
- * Pipeline: PIPE_BV
- * Cluster : CLUSTER_SP_VS
- * Location: USPTP
+ * Pipeline: A7XX_PIPE_BV
+ * Cluster : A7XX_CLUSTER_SP_VS
+ * Location: A7XX_USPTP
  * pairs   : 16 (Regs:266)
  */
 static const u32 gen7_9_0_sp_pipe_bv_cluster_sp_vs_usptp_registers[] = {
@@ -993,9 +993,9 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_sp_pipe_bv_cluster_sp_vs_usptp_register
 
 /*
  * Block   : ['SP']
- * Pipeline: PIPE_LPAC
- * Cluster : CLUSTER_SP_PS
- * Location: HLSQ_STATE
+ * Pipeline: A7XX_PIPE_LPAC
+ * Cluster : A7XX_CLUSTER_SP_PS
+ * Location: A7XX_HLSQ_STATE
  * pairs   : 14 (Regs:299)
  */
 static const u32 gen7_9_0_sp_pipe_lpac_cluster_sp_ps_hlsq_state_registers[] = {
@@ -1009,9 +1009,9 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_sp_pipe_lpac_cluster_sp_ps_hlsq_state_r
 
 /*
  * Block   : ['SP']
- * Pipeline: PIPE_LPAC
- * Cluster : CLUSTER_SP_PS
- * Location: HLSQ_DP
+ * Pipeline: A7XX_PIPE_LPAC
+ * Cluster : A7XX_CLUSTER_SP_PS
+ * Location: A7XX_HLSQ_DP
  * pairs   : 2 (Regs:13)
  */
 static const u32 gen7_9_0_sp_pipe_lpac_cluster_sp_ps_hlsq_dp_registers[] = {
@@ -1022,9 +1022,9 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_sp_pipe_lpac_cluster_sp_ps_hlsq_dp_regi
 
 /*
  * Block   : ['SP']
- * Pipeline: PIPE_LPAC
- * Cluster : CLUSTER_SP_PS
- * Location: SP_TOP
+ * Pipeline: A7XX_PIPE_LPAC
+ * Cluster : A7XX_CLUSTER_SP_PS
+ * Location: A7XX_SP_TOP
  * pairs   : 9 (Regs:34)
  */
 static const u32 gen7_9_0_sp_pipe_lpac_cluster_sp_ps_sp_top_registers[] = {
@@ -1037,9 +1037,9 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_sp_pipe_lpac_cluster_sp_ps_sp_top_regis
 
 /*
  * Block   : ['SP']
- * Pipeline: PIPE_LPAC
- * Cluster : CLUSTER_SP_PS
- * Location: USPTP
+ * Pipeline: A7XX_PIPE_LPAC
+ * Cluster : A7XX_CLUSTER_SP_PS
+ * Location: A7XX_USPTP
  * pairs   : 11 (Regs:279)
  */
 static const u32 gen7_9_0_sp_pipe_lpac_cluster_sp_ps_usptp_registers[] = {
@@ -1052,9 +1052,9 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_sp_pipe_lpac_cluster_sp_ps_usptp_regist
 
 /*
  * Block   : ['TPL1']
- * Pipeline: PIPE_BR
- * Cluster : CLUSTER_SP_VS
- * Location: USPTP
+ * Pipeline: A7XX_PIPE_BR
+ * Cluster : A7XX_CLUSTER_SP_VS
+ * Location: A7XX_USPTP
  * pairs   : 3 (Regs:10)
  */
 static const u32 gen7_9_0_tpl1_pipe_br_cluster_sp_vs_usptp_registers[] = {
@@ -1065,9 +1065,9 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_tpl1_pipe_br_cluster_sp_vs_usptp_regist
 
 /*
  * Block   : ['TPL1']
- * Pipeline: PIPE_BR
- * Cluster : CLUSTER_SP_PS
- * Location: USPTP
+ * Pipeline: A7XX_PIPE_BR
+ * Cluster : A7XX_CLUSTER_SP_PS
+ * Location: A7XX_USPTP
  * pairs   : 6 (Regs:42)
  */
 static const u32 gen7_9_0_tpl1_pipe_br_cluster_sp_ps_usptp_registers[] = {
@@ -1079,9 +1079,9 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_tpl1_pipe_br_cluster_sp_ps_usptp_regist
 
 /*
  * Block   : ['TPL1']
- * Pipeline: PIPE_BV
- * Cluster : CLUSTER_SP_VS
- * Location: USPTP
+ * Pipeline: A7XX_PIPE_BV
+ * Cluster : A7XX_CLUSTER_SP_VS
+ * Location: A7XX_USPTP
  * pairs   : 3 (Regs:10)
  */
 static const u32 gen7_9_0_tpl1_pipe_bv_cluster_sp_vs_usptp_registers[] = {
@@ -1092,9 +1092,9 @@ static_assert(IS_ALIGNED(sizeof(gen7_9_0_tpl1_pipe_bv_cluster_sp_vs_usptp_regist
 
 /*
  * Block   : ['TPL1']
- * Pipeline: PIPE_LPAC
- * Cluster : CLUSTER_SP_PS
- * Location: USPTP
+ * Pipeline: A7XX_PIPE_LPAC
+ * Cluster : A7XX_CLUSTER_SP_PS
+ * Location: A7XX_USPTP
  * pairs   : 5 (Regs:7)
  */
 static const u32 gen7_9_0_tpl1_pipe_lpac_cluster_sp_ps_usptp_registers[] = {
@@ -1105,216 +1105,236 @@ static const u32 gen7_9_0_tpl1_pipe_lpac_cluster_sp_ps_usptp_registers[] = {
 static_assert(IS_ALIGNED(sizeof(gen7_9_0_tpl1_pipe_lpac_cluster_sp_ps_usptp_registers), 8));
 
 static const struct gen7_sel_reg gen7_9_0_rb_rac_sel = {
-	.host_reg = GEN7_RB_SUB_BLOCK_SEL_CNTL_HOST,
-	.cd_reg = GEN7_RB_SUB_BLOCK_SEL_CNTL_CD,
+	.host_reg = REG_A6XX_RB_RB_SUB_BLOCK_SEL_CNTL_HOST,
+	.cd_reg = REG_A6XX_RB_RB_SUB_BLOCK_SEL_CNTL_CD,
 	.val = 0,
 };
 
 static const struct gen7_sel_reg gen7_9_0_rb_rbp_sel = {
-	.host_reg = GEN7_RB_SUB_BLOCK_SEL_CNTL_HOST,
-	.cd_reg = GEN7_RB_SUB_BLOCK_SEL_CNTL_CD,
+	.host_reg = REG_A6XX_RB_RB_SUB_BLOCK_SEL_CNTL_HOST,
+	.cd_reg = REG_A6XX_RB_RB_SUB_BLOCK_SEL_CNTL_CD,
 	.val = 0x9,
 };
 
 static struct gen7_cluster_registers gen7_9_0_clusters[] = {
-	{ CLUSTER_NONE, PIPE_BR, STATE_NON_CONTEXT,
+	{ A7XX_CLUSTER_NONE, A7XX_PIPE_BR, STATE_NON_CONTEXT,
 		gen7_9_0_non_context_pipe_br_registers,  },
-	{ CLUSTER_NONE, PIPE_BV, STATE_NON_CONTEXT,
+	{ A7XX_CLUSTER_NONE, A7XX_PIPE_BV, STATE_NON_CONTEXT,
 		gen7_9_0_non_context_pipe_bv_registers,  },
-	{ CLUSTER_NONE, PIPE_LPAC, STATE_NON_CONTEXT,
+	{ A7XX_CLUSTER_NONE, A7XX_PIPE_LPAC, STATE_NON_CONTEXT,
 		gen7_9_0_non_context_pipe_lpac_registers,  },
-	{ CLUSTER_NONE, PIPE_BR, STATE_NON_CONTEXT,
+	{ A7XX_CLUSTER_NONE, A7XX_PIPE_BR, STATE_NON_CONTEXT,
 		gen7_9_0_non_context_rb_pipe_br_rac_registers, &gen7_9_0_rb_rac_sel, },
-	{ CLUSTER_NONE, PIPE_BR, STATE_NON_CONTEXT,
+	{ A7XX_CLUSTER_NONE, A7XX_PIPE_BR, STATE_NON_CONTEXT,
 		gen7_9_0_non_context_rb_pipe_br_rbp_registers, &gen7_9_0_rb_rbp_sel, },
-	{ CLUSTER_PS, PIPE_BR, STATE_FORCE_CTXT_0,
+	{ A7XX_CLUSTER_PS, A7XX_PIPE_BR, STATE_FORCE_CTXT_0,
 		gen7_9_0_rb_pipe_br_cluster_ps_rac_registers, &gen7_9_0_rb_rac_sel, },
-	{ CLUSTER_PS, PIPE_BR, STATE_FORCE_CTXT_1,
+	{ A7XX_CLUSTER_PS, A7XX_PIPE_BR, STATE_FORCE_CTXT_1,
 		gen7_9_0_rb_pipe_br_cluster_ps_rac_registers, &gen7_9_0_rb_rac_sel, },
-	{ CLUSTER_PS, PIPE_BR, STATE_FORCE_CTXT_0,
+	{ A7XX_CLUSTER_PS, A7XX_PIPE_BR, STATE_FORCE_CTXT_0,
 		gen7_9_0_rb_pipe_br_cluster_ps_rbp_registers, &gen7_9_0_rb_rbp_sel, },
-	{ CLUSTER_PS, PIPE_BR, STATE_FORCE_CTXT_1,
+	{ A7XX_CLUSTER_PS, A7XX_PIPE_BR, STATE_FORCE_CTXT_1,
 		gen7_9_0_rb_pipe_br_cluster_ps_rbp_registers, &gen7_9_0_rb_rbp_sel, },
-	{ CLUSTER_GRAS, PIPE_BR, STATE_FORCE_CTXT_0,
+	{ A7XX_CLUSTER_GRAS, A7XX_PIPE_BR, STATE_FORCE_CTXT_0,
 		gen7_9_0_gras_pipe_br_cluster_gras_registers,  },
-	{ CLUSTER_GRAS, PIPE_BR, STATE_FORCE_CTXT_1,
+	{ A7XX_CLUSTER_GRAS, A7XX_PIPE_BR, STATE_FORCE_CTXT_1,
 		gen7_9_0_gras_pipe_br_cluster_gras_registers,  },
-	{ CLUSTER_GRAS, PIPE_BV, STATE_FORCE_CTXT_0,
+	{ A7XX_CLUSTER_GRAS, A7XX_PIPE_BV, STATE_FORCE_CTXT_0,
 		gen7_9_0_gras_pipe_bv_cluster_gras_registers,  },
-	{ CLUSTER_GRAS, PIPE_BV, STATE_FORCE_CTXT_1,
+	{ A7XX_CLUSTER_GRAS, A7XX_PIPE_BV, STATE_FORCE_CTXT_1,
 		gen7_9_0_gras_pipe_bv_cluster_gras_registers,  },
-	{ CLUSTER_FE, PIPE_BR, STATE_FORCE_CTXT_0,
+	{ A7XX_CLUSTER_FE, A7XX_PIPE_BR, STATE_FORCE_CTXT_0,
 		gen7_9_0_pc_pipe_br_cluster_fe_registers,  },
-	{ CLUSTER_FE, PIPE_BR, STATE_FORCE_CTXT_1,
+	{ A7XX_CLUSTER_FE, A7XX_PIPE_BR, STATE_FORCE_CTXT_1,
 		gen7_9_0_pc_pipe_br_cluster_fe_registers,  },
-	{ CLUSTER_FE, PIPE_BV, STATE_FORCE_CTXT_0,
+	{ A7XX_CLUSTER_FE, A7XX_PIPE_BV, STATE_FORCE_CTXT_0,
 		gen7_9_0_pc_pipe_bv_cluster_fe_registers,  },
-	{ CLUSTER_FE, PIPE_BV, STATE_FORCE_CTXT_1,
+	{ A7XX_CLUSTER_FE, A7XX_PIPE_BV, STATE_FORCE_CTXT_1,
 		gen7_9_0_pc_pipe_bv_cluster_fe_registers,  },
-	{ CLUSTER_FE, PIPE_BR, STATE_FORCE_CTXT_0,
+	{ A7XX_CLUSTER_FE, A7XX_PIPE_BR, STATE_FORCE_CTXT_0,
 		gen7_9_0_vfd_pipe_br_cluster_fe_registers,  },
-	{ CLUSTER_FE, PIPE_BR, STATE_FORCE_CTXT_1,
+	{ A7XX_CLUSTER_FE, A7XX_PIPE_BR, STATE_FORCE_CTXT_1,
 		gen7_9_0_vfd_pipe_br_cluster_fe_registers,  },
-	{ CLUSTER_FE, PIPE_BV, STATE_FORCE_CTXT_0,
+	{ A7XX_CLUSTER_FE, A7XX_PIPE_BV, STATE_FORCE_CTXT_0,
 		gen7_9_0_vfd_pipe_bv_cluster_fe_registers,  },
-	{ CLUSTER_FE, PIPE_BV, STATE_FORCE_CTXT_1,
+	{ A7XX_CLUSTER_FE, A7XX_PIPE_BV, STATE_FORCE_CTXT_1,
 		gen7_9_0_vfd_pipe_bv_cluster_fe_registers,  },
-	{ CLUSTER_FE, PIPE_BR, STATE_FORCE_CTXT_0,
+	{ A7XX_CLUSTER_FE, A7XX_PIPE_BR, STATE_FORCE_CTXT_0,
 		gen7_9_0_vpc_pipe_br_cluster_fe_registers,  },
-	{ CLUSTER_FE, PIPE_BR, STATE_FORCE_CTXT_1,
+	{ A7XX_CLUSTER_FE, A7XX_PIPE_BR, STATE_FORCE_CTXT_1,
 		gen7_9_0_vpc_pipe_br_cluster_fe_registers,  },
-	{ CLUSTER_PC_VS, PIPE_BR, STATE_FORCE_CTXT_0,
+	{ A7XX_CLUSTER_PC_VS, A7XX_PIPE_BR, STATE_FORCE_CTXT_0,
 		gen7_9_0_vpc_pipe_br_cluster_pc_vs_registers,  },
-	{ CLUSTER_PC_VS, PIPE_BR, STATE_FORCE_CTXT_1,
+	{ A7XX_CLUSTER_PC_VS, A7XX_PIPE_BR, STATE_FORCE_CTXT_1,
 		gen7_9_0_vpc_pipe_br_cluster_pc_vs_registers,  },
-	{ CLUSTER_VPC_PS, PIPE_BR, STATE_FORCE_CTXT_0,
+	{ A7XX_CLUSTER_VPC_PS, A7XX_PIPE_BR, STATE_FORCE_CTXT_0,
 		gen7_9_0_vpc_pipe_br_cluster_vpc_ps_registers,  },
-	{ CLUSTER_VPC_PS, PIPE_BR, STATE_FORCE_CTXT_1,
+	{ A7XX_CLUSTER_VPC_PS, A7XX_PIPE_BR, STATE_FORCE_CTXT_1,
 		gen7_9_0_vpc_pipe_br_cluster_vpc_ps_registers,  },
-	{ CLUSTER_FE, PIPE_BV, STATE_FORCE_CTXT_0,
+	{ A7XX_CLUSTER_FE, A7XX_PIPE_BV, STATE_FORCE_CTXT_0,
 		gen7_9_0_vpc_pipe_bv_cluster_fe_registers,  },
-	{ CLUSTER_FE, PIPE_BV, STATE_FORCE_CTXT_1,
+	{ A7XX_CLUSTER_FE, A7XX_PIPE_BV, STATE_FORCE_CTXT_1,
 		gen7_9_0_vpc_pipe_bv_cluster_fe_registers,  },
-	{ CLUSTER_PC_VS, PIPE_BV, STATE_FORCE_CTXT_0,
+	{ A7XX_CLUSTER_PC_VS, A7XX_PIPE_BV, STATE_FORCE_CTXT_0,
 		gen7_9_0_vpc_pipe_bv_cluster_pc_vs_registers,  },
-	{ CLUSTER_PC_VS, PIPE_BV, STATE_FORCE_CTXT_1,
+	{ A7XX_CLUSTER_PC_VS, A7XX_PIPE_BV, STATE_FORCE_CTXT_1,
 		gen7_9_0_vpc_pipe_bv_cluster_pc_vs_registers,  },
-	{ CLUSTER_VPC_PS, PIPE_BV, STATE_FORCE_CTXT_0,
+	{ A7XX_CLUSTER_VPC_PS, A7XX_PIPE_BV, STATE_FORCE_CTXT_0,
 		gen7_9_0_vpc_pipe_bv_cluster_vpc_ps_registers,  },
-	{ CLUSTER_VPC_PS, PIPE_BV, STATE_FORCE_CTXT_1,
+	{ A7XX_CLUSTER_VPC_PS, A7XX_PIPE_BV, STATE_FORCE_CTXT_1,
 		gen7_9_0_vpc_pipe_bv_cluster_vpc_ps_registers,  },
 };
 
 static struct gen7_sptp_cluster_registers gen7_9_0_sptp_clusters[] = {
-	{ CLUSTER_NONE, SP_NCTX_REG, PIPE_BR, 0, HLSQ_STATE,
+	{ A7XX_CLUSTER_NONE, A7XX_SP_NCTX_REG, A7XX_PIPE_BR, 0, A7XX_HLSQ_STATE,
 		gen7_9_0_non_context_sp_pipe_br_hlsq_state_registers, 0xae00},
-	{ CLUSTER_NONE, SP_NCTX_REG, PIPE_BR, 0, SP_TOP,
+	{ A7XX_CLUSTER_NONE, A7XX_SP_NCTX_REG, A7XX_PIPE_BR, 0, A7XX_SP_TOP,
 		gen7_9_0_non_context_sp_pipe_br_sp_top_registers, 0xae00},
-	{ CLUSTER_NONE, SP_NCTX_REG, PIPE_BR, 0, USPTP,
+	{ A7XX_CLUSTER_NONE, A7XX_SP_NCTX_REG, A7XX_PIPE_BR, 0, A7XX_USPTP,
 		gen7_9_0_non_context_sp_pipe_br_usptp_registers, 0xae00},
-	{ CLUSTER_NONE, SP_NCTX_REG, PIPE_BR, 0, HLSQ_DP_STR,
+	{ A7XX_CLUSTER_NONE, A7XX_SP_NCTX_REG, A7XX_PIPE_BR, 0, A7XX_HLSQ_DP_STR,
 		gen7_9_0_non_context_sp_pipe_br_hlsq_dp_str_registers, 0xae00},
-	{ CLUSTER_NONE, SP_NCTX_REG, PIPE_LPAC, 0, HLSQ_STATE,
+	{ A7XX_CLUSTER_NONE, A7XX_SP_NCTX_REG, A7XX_PIPE_LPAC, 0, A7XX_HLSQ_STATE,
 		gen7_9_0_non_context_sp_pipe_lpac_hlsq_state_registers, 0xaf80},
-	{ CLUSTER_NONE, SP_NCTX_REG, PIPE_LPAC, 0, SP_TOP,
+	{ A7XX_CLUSTER_NONE, A7XX_SP_NCTX_REG, A7XX_PIPE_LPAC, 0, A7XX_SP_TOP,
 		gen7_9_0_non_context_sp_pipe_lpac_sp_top_registers, 0xaf80},
-	{ CLUSTER_NONE, SP_NCTX_REG, PIPE_LPAC, 0, USPTP,
+	{ A7XX_CLUSTER_NONE, A7XX_SP_NCTX_REG, A7XX_PIPE_LPAC, 0, A7XX_USPTP,
 		gen7_9_0_non_context_sp_pipe_lpac_usptp_registers, 0xaf80},
-	{ CLUSTER_NONE, TP0_NCTX_REG, PIPE_NONE, 0, USPTP,
+	{ A7XX_CLUSTER_NONE, A7XX_TP0_NCTX_REG, A7XX_PIPE_NONE, 0, A7XX_USPTP,
 		gen7_9_0_non_context_tpl1_pipe_none_usptp_registers, 0xb600},
-	{ CLUSTER_NONE, TP0_NCTX_REG, PIPE_BR, 0, USPTP,
+	{ A7XX_CLUSTER_NONE, A7XX_TP0_NCTX_REG, A7XX_PIPE_BR, 0, A7XX_USPTP,
 		gen7_9_0_non_context_tpl1_pipe_br_usptp_registers, 0xb600},
-	{ CLUSTER_NONE, TP0_NCTX_REG, PIPE_LPAC, 0, USPTP,
+	{ A7XX_CLUSTER_NONE, A7XX_TP0_NCTX_REG, A7XX_PIPE_LPAC, 0, A7XX_USPTP,
 		gen7_9_0_non_context_tpl1_pipe_lpac_usptp_registers, 0xb780},
-	{ CLUSTER_SP_VS, SP_CTX0_3D_CVS_REG, PIPE_BR, 0, HLSQ_STATE,
+	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX0_3D_CVS_REG, A7XX_PIPE_BR, 0, A7XX_HLSQ_STATE,
 		gen7_9_0_sp_pipe_br_cluster_sp_vs_hlsq_state_registers, 0xa800},
-	{ CLUSTER_SP_VS, SP_CTX0_3D_CVS_REG, PIPE_BR, 0, SP_TOP,
+	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX0_3D_CVS_REG, A7XX_PIPE_BR, 0, A7XX_SP_TOP,
 		gen7_9_0_sp_pipe_br_cluster_sp_vs_sp_top_registers, 0xa800},
-	{ CLUSTER_SP_VS, SP_CTX0_3D_CVS_REG, PIPE_BR, 0, USPTP,
+	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX0_3D_CVS_REG, A7XX_PIPE_BR, 0, A7XX_USPTP,
 		gen7_9_0_sp_pipe_br_cluster_sp_vs_usptp_registers, 0xa800},
-	{ CLUSTER_SP_VS, SP_CTX0_3D_CVS_REG, PIPE_BV, 0, HLSQ_STATE,
+	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX0_3D_CVS_REG, A7XX_PIPE_BV, 0, A7XX_HLSQ_STATE,
 		gen7_9_0_sp_pipe_bv_cluster_sp_vs_hlsq_state_registers, 0xa800},
-	{ CLUSTER_SP_VS, SP_CTX0_3D_CVS_REG, PIPE_BV, 0, SP_TOP,
+	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX0_3D_CVS_REG, A7XX_PIPE_BV, 0, A7XX_SP_TOP,
 		gen7_9_0_sp_pipe_bv_cluster_sp_vs_sp_top_registers, 0xa800},
-	{ CLUSTER_SP_VS, SP_CTX0_3D_CVS_REG, PIPE_BV, 0, USPTP,
+	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX0_3D_CVS_REG, A7XX_PIPE_BV, 0, A7XX_USPTP,
 		gen7_9_0_sp_pipe_bv_cluster_sp_vs_usptp_registers, 0xa800},
-	{ CLUSTER_SP_VS, SP_CTX1_3D_CVS_REG, PIPE_BR, 1, HLSQ_STATE,
+	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX1_3D_CVS_REG, A7XX_PIPE_BR, 1, A7XX_HLSQ_STATE,
 		gen7_9_0_sp_pipe_br_cluster_sp_vs_hlsq_state_registers, 0xa800},
-	{ CLUSTER_SP_VS, SP_CTX1_3D_CVS_REG, PIPE_BR, 1, SP_TOP,
+	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX1_3D_CVS_REG, A7XX_PIPE_BR, 1, A7XX_SP_TOP,
 		gen7_9_0_sp_pipe_br_cluster_sp_vs_sp_top_registers, 0xa800},
-	{ CLUSTER_SP_VS, SP_CTX1_3D_CVS_REG, PIPE_BR, 1, USPTP,
+	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX1_3D_CVS_REG, A7XX_PIPE_BR, 1, A7XX_USPTP,
 		gen7_9_0_sp_pipe_br_cluster_sp_vs_usptp_registers, 0xa800},
-	{ CLUSTER_SP_VS, SP_CTX1_3D_CVS_REG, PIPE_BV, 1, HLSQ_STATE,
+	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX1_3D_CVS_REG, A7XX_PIPE_BV, 1, A7XX_HLSQ_STATE,
 		gen7_9_0_sp_pipe_bv_cluster_sp_vs_hlsq_state_registers, 0xa800},
-	{ CLUSTER_SP_VS, SP_CTX1_3D_CVS_REG, PIPE_BV, 1, SP_TOP,
+	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX1_3D_CVS_REG, A7XX_PIPE_BV, 1, A7XX_SP_TOP,
 		gen7_9_0_sp_pipe_bv_cluster_sp_vs_sp_top_registers, 0xa800},
-	{ CLUSTER_SP_VS, SP_CTX1_3D_CVS_REG, PIPE_BV, 1, USPTP,
+	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX1_3D_CVS_REG, A7XX_PIPE_BV, 1, A7XX_USPTP,
 		gen7_9_0_sp_pipe_bv_cluster_sp_vs_usptp_registers, 0xa800},
-	{ CLUSTER_SP_PS, SP_CTX0_3D_CPS_REG, PIPE_BR, 0, HLSQ_STATE,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX0_3D_CPS_REG, A7XX_PIPE_BR, 0, A7XX_HLSQ_STATE,
 		gen7_9_0_sp_pipe_br_cluster_sp_ps_hlsq_state_registers, 0xa800},
-	{ CLUSTER_SP_PS, SP_CTX0_3D_CPS_REG, PIPE_BR, 0, HLSQ_DP,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX0_3D_CPS_REG, A7XX_PIPE_BR, 0, A7XX_HLSQ_DP,
 		gen7_9_0_sp_pipe_br_cluster_sp_ps_hlsq_dp_registers, 0xa800},
-	{ CLUSTER_SP_PS, SP_CTX0_3D_CPS_REG, PIPE_BR, 0, SP_TOP,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX0_3D_CPS_REG, A7XX_PIPE_BR, 0, A7XX_SP_TOP,
 		gen7_9_0_sp_pipe_br_cluster_sp_ps_sp_top_registers, 0xa800},
-	{ CLUSTER_SP_PS, SP_CTX0_3D_CPS_REG, PIPE_BR, 0, USPTP,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX0_3D_CPS_REG, A7XX_PIPE_BR, 0, A7XX_USPTP,
 		gen7_9_0_sp_pipe_br_cluster_sp_ps_usptp_registers, 0xa800},
-	{ CLUSTER_SP_PS, SP_CTX0_3D_CPS_REG, PIPE_BR, 0, HLSQ_DP_STR,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX0_3D_CPS_REG, A7XX_PIPE_BR, 0, A7XX_HLSQ_DP_STR,
 		gen7_9_0_sp_pipe_br_cluster_sp_ps_hlsq_dp_str_registers, 0xa800},
-	{ CLUSTER_SP_PS, SP_CTX0_3D_CPS_REG, PIPE_LPAC, 0, HLSQ_STATE,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX0_3D_CPS_REG, A7XX_PIPE_LPAC, 0, A7XX_HLSQ_STATE,
 		gen7_9_0_sp_pipe_lpac_cluster_sp_ps_hlsq_state_registers, 0xa800},
-	{ CLUSTER_SP_PS, SP_CTX0_3D_CPS_REG, PIPE_LPAC, 0, HLSQ_DP,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX0_3D_CPS_REG, A7XX_PIPE_LPAC, 0, A7XX_HLSQ_DP,
 		gen7_9_0_sp_pipe_lpac_cluster_sp_ps_hlsq_dp_registers, 0xa800},
-	{ CLUSTER_SP_PS, SP_CTX0_3D_CPS_REG, PIPE_LPAC, 0, SP_TOP,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX0_3D_CPS_REG, A7XX_PIPE_LPAC, 0, A7XX_SP_TOP,
 		gen7_9_0_sp_pipe_lpac_cluster_sp_ps_sp_top_registers, 0xa800},
-	{ CLUSTER_SP_PS, SP_CTX0_3D_CPS_REG, PIPE_LPAC, 0, USPTP,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX0_3D_CPS_REG, A7XX_PIPE_LPAC, 0, A7XX_USPTP,
 		gen7_9_0_sp_pipe_lpac_cluster_sp_ps_usptp_registers, 0xa800},
-	{ CLUSTER_SP_PS, SP_CTX1_3D_CPS_REG, PIPE_BR, 1, HLSQ_STATE,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX1_3D_CPS_REG, A7XX_PIPE_BR, 1, A7XX_HLSQ_STATE,
 		gen7_9_0_sp_pipe_br_cluster_sp_ps_hlsq_state_registers, 0xa800},
-	{ CLUSTER_SP_PS, SP_CTX1_3D_CPS_REG, PIPE_BR, 1, HLSQ_DP,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX1_3D_CPS_REG, A7XX_PIPE_BR, 1, A7XX_HLSQ_DP,
 		gen7_9_0_sp_pipe_br_cluster_sp_ps_hlsq_dp_registers, 0xa800},
-	{ CLUSTER_SP_PS, SP_CTX1_3D_CPS_REG, PIPE_BR, 1, SP_TOP,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX1_3D_CPS_REG, A7XX_PIPE_BR, 1, A7XX_SP_TOP,
 		gen7_9_0_sp_pipe_br_cluster_sp_ps_sp_top_registers, 0xa800},
-	{ CLUSTER_SP_PS, SP_CTX1_3D_CPS_REG, PIPE_BR, 1, USPTP,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX1_3D_CPS_REG, A7XX_PIPE_BR, 1, A7XX_USPTP,
 		gen7_9_0_sp_pipe_br_cluster_sp_ps_usptp_registers, 0xa800},
-	{ CLUSTER_SP_PS, SP_CTX1_3D_CPS_REG, PIPE_BR, 1, HLSQ_DP_STR,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX1_3D_CPS_REG, A7XX_PIPE_BR, 1, A7XX_HLSQ_DP_STR,
 		gen7_9_0_sp_pipe_br_cluster_sp_ps_hlsq_dp_str_registers, 0xa800},
-	{ CLUSTER_SP_PS, SP_CTX2_3D_CPS_REG, PIPE_BR, 2, HLSQ_DP,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX2_3D_CPS_REG, A7XX_PIPE_BR, 2, A7XX_HLSQ_DP,
 		gen7_9_0_sp_pipe_br_cluster_sp_ps_hlsq_dp_registers, 0xa800},
-	{ CLUSTER_SP_PS, SP_CTX2_3D_CPS_REG, PIPE_BR, 2, SP_TOP,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX2_3D_CPS_REG, A7XX_PIPE_BR, 2, A7XX_SP_TOP,
 		gen7_9_0_sp_pipe_br_cluster_sp_ps_sp_top_registers, 0xa800},
-	{ CLUSTER_SP_PS, SP_CTX2_3D_CPS_REG, PIPE_BR, 2, USPTP,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX2_3D_CPS_REG, A7XX_PIPE_BR, 2, A7XX_USPTP,
 		gen7_9_0_sp_pipe_br_cluster_sp_ps_usptp_registers, 0xa800},
-	{ CLUSTER_SP_PS, SP_CTX2_3D_CPS_REG, PIPE_BR, 2, HLSQ_DP_STR,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX2_3D_CPS_REG, A7XX_PIPE_BR, 2, A7XX_HLSQ_DP_STR,
 		gen7_9_0_sp_pipe_br_cluster_sp_ps_hlsq_dp_str_registers, 0xa800},
-	{ CLUSTER_SP_PS, SP_CTX3_3D_CPS_REG, PIPE_BR, 3, HLSQ_DP,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX3_3D_CPS_REG, A7XX_PIPE_BR, 3, A7XX_HLSQ_DP,
 		gen7_9_0_sp_pipe_br_cluster_sp_ps_hlsq_dp_registers, 0xa800},
-	{ CLUSTER_SP_PS, SP_CTX3_3D_CPS_REG, PIPE_BR, 3, SP_TOP,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX3_3D_CPS_REG, A7XX_PIPE_BR, 3, A7XX_SP_TOP,
 		gen7_9_0_sp_pipe_br_cluster_sp_ps_sp_top_registers, 0xa800},
-	{ CLUSTER_SP_PS, SP_CTX3_3D_CPS_REG, PIPE_BR, 3, USPTP,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX3_3D_CPS_REG, A7XX_PIPE_BR, 3, A7XX_USPTP,
 		gen7_9_0_sp_pipe_br_cluster_sp_ps_usptp_registers, 0xa800},
-	{ CLUSTER_SP_PS, SP_CTX3_3D_CPS_REG, PIPE_BR, 3, HLSQ_DP_STR,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX3_3D_CPS_REG, A7XX_PIPE_BR, 3, A7XX_HLSQ_DP_STR,
 		gen7_9_0_sp_pipe_br_cluster_sp_ps_hlsq_dp_str_registers, 0xa800},
-	{ CLUSTER_SP_VS, TP0_CTX0_3D_CVS_REG, PIPE_BR, 0, USPTP,
+	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX0_3D_CVS_REG, A7XX_PIPE_BR, 0, A7XX_USPTP,
 		gen7_9_0_tpl1_pipe_br_cluster_sp_vs_usptp_registers, 0xb000},
-	{ CLUSTER_SP_VS, TP0_CTX0_3D_CVS_REG, PIPE_BV, 0, USPTP,
+	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX0_3D_CVS_REG, A7XX_PIPE_BV, 0, A7XX_USPTP,
 		gen7_9_0_tpl1_pipe_bv_cluster_sp_vs_usptp_registers, 0xb000},
-	{ CLUSTER_SP_VS, TP0_CTX1_3D_CVS_REG, PIPE_BR, 1, USPTP,
+	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX1_3D_CVS_REG, A7XX_PIPE_BR, 1, A7XX_USPTP,
 		gen7_9_0_tpl1_pipe_br_cluster_sp_vs_usptp_registers, 0xb000},
-	{ CLUSTER_SP_VS, TP0_CTX1_3D_CVS_REG, PIPE_BV, 1, USPTP,
+	{ A7XX_CLUSTER_SP_VS, A7XX_SP_CTX1_3D_CVS_REG, A7XX_PIPE_BV, 1, A7XX_USPTP,
 		gen7_9_0_tpl1_pipe_bv_cluster_sp_vs_usptp_registers, 0xb000},
-	{ CLUSTER_SP_PS, TP0_CTX0_3D_CPS_REG, PIPE_BR, 0, USPTP,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX0_3D_CPS_REG, A7XX_PIPE_BR, 0, A7XX_USPTP,
 		gen7_9_0_tpl1_pipe_br_cluster_sp_ps_usptp_registers, 0xb000},
-	{ CLUSTER_SP_PS, TP0_CTX0_3D_CPS_REG, PIPE_LPAC, 0, USPTP,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX0_3D_CPS_REG, A7XX_PIPE_LPAC, 0, A7XX_USPTP,
 		gen7_9_0_tpl1_pipe_lpac_cluster_sp_ps_usptp_registers, 0xb000},
-	{ CLUSTER_SP_PS, TP0_CTX1_3D_CPS_REG, PIPE_BR, 1, USPTP,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX1_3D_CPS_REG, A7XX_PIPE_BR, 1, A7XX_USPTP,
 		gen7_9_0_tpl1_pipe_br_cluster_sp_ps_usptp_registers, 0xb000},
-	{ CLUSTER_SP_PS, TP0_CTX2_3D_CPS_REG, PIPE_BR, 2, USPTP,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX2_3D_CPS_REG, A7XX_PIPE_BR, 2, A7XX_USPTP,
 		gen7_9_0_tpl1_pipe_br_cluster_sp_ps_usptp_registers, 0xb000},
-	{ CLUSTER_SP_PS, TP0_CTX3_3D_CPS_REG, PIPE_BR, 3, USPTP,
+	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX3_3D_CPS_REG, A7XX_PIPE_BR, 3, A7XX_USPTP,
 		gen7_9_0_tpl1_pipe_br_cluster_sp_ps_usptp_registers, 0xb000},
 };
 
-static struct gen7_cp_indexed_reg gen7_9_0_cp_indexed_reg_list[] = {
-	{ GEN7_CP_SQE_STAT_ADDR, GEN7_CP_SQE_STAT_DATA, 0x00040},
-	{ GEN7_CP_DRAW_STATE_ADDR, GEN7_CP_DRAW_STATE_DATA, 0x00200},
-	{ GEN7_CP_ROQ_DBG_ADDR, GEN7_CP_ROQ_DBG_DATA, 0x00800},
-	{ GEN7_CP_SQE_UCODE_DBG_ADDR, GEN7_CP_SQE_UCODE_DBG_DATA, 0x08000},
-	{ GEN7_CP_BV_DRAW_STATE_ADDR, GEN7_CP_BV_DRAW_STATE_DATA, 0x00200},
-	{ GEN7_CP_BV_ROQ_DBG_ADDR, GEN7_CP_BV_ROQ_DBG_DATA, 0x00800},
-	{ GEN7_CP_BV_SQE_UCODE_DBG_ADDR, GEN7_CP_BV_SQE_UCODE_DBG_DATA, 0x08000},
-	{ GEN7_CP_BV_SQE_STAT_ADDR, GEN7_CP_BV_SQE_STAT_DATA, 0x00040},
-	{ GEN7_CP_RESOURCE_TABLE_DBG_ADDR, GEN7_CP_RESOURCE_TABLE_DBG_DATA, 0x04100},
-	{ GEN7_CP_LPAC_DRAW_STATE_ADDR, GEN7_CP_LPAC_DRAW_STATE_DATA, 0x00200},
-	{ GEN7_CP_LPAC_ROQ_DBG_ADDR, GEN7_CP_LPAC_ROQ_DBG_DATA, 0x00200},
-	{ GEN7_CP_SQE_AC_UCODE_DBG_ADDR, GEN7_CP_SQE_AC_UCODE_DBG_DATA, 0x08000},
-	{ GEN7_CP_SQE_AC_STAT_ADDR, GEN7_CP_SQE_AC_STAT_DATA, 0x00040},
-	{ GEN7_CP_LPAC_FIFO_DBG_ADDR, GEN7_CP_LPAC_FIFO_DBG_DATA, 0x00040},
-	{ GEN7_CP_AQE_ROQ_DBG_ADDR_0, GEN7_CP_AQE_ROQ_DBG_DATA_0, 0x00100},
-	{ GEN7_CP_AQE_ROQ_DBG_ADDR_1, GEN7_CP_AQE_ROQ_DBG_DATA_1, 0x00100},
-	{ GEN7_CP_AQE_UCODE_DBG_ADDR_0, GEN7_CP_AQE_UCODE_DBG_DATA_0, 0x08000},
-	{ GEN7_CP_AQE_UCODE_DBG_ADDR_1, GEN7_CP_AQE_UCODE_DBG_DATA_1, 0x08000},
-	{ GEN7_CP_AQE_STAT_ADDR_0, GEN7_CP_AQE_STAT_DATA_0, 0x00040},
-	{ GEN7_CP_AQE_STAT_ADDR_1, GEN7_CP_AQE_STAT_DATA_1, 0x00040},
+static struct a6xx_indexed_registers gen7_9_0_cp_indexed_reg_list[] = {
+	{ "CP_SQE_STAT", REG_A6XX_CP_SQE_STAT_ADDR,
+		REG_A6XX_CP_SQE_STAT_DATA, 0x00040},
+	{ "CP_DRAW_STATE", REG_A6XX_CP_DRAW_STATE_ADDR,
+		REG_A6XX_CP_DRAW_STATE_DATA, 0x00200},
+	{ "CP_ROQ", REG_A6XX_CP_ROQ_DBG_ADDR,
+		REG_A6XX_CP_ROQ_DBG_DATA, 0x00800},
+	{ "CP_UCODE_DBG_DATA", REG_A6XX_CP_SQE_UCODE_DBG_ADDR,
+		REG_A6XX_CP_SQE_UCODE_DBG_DATA, 0x08000},
+	{ "CP_BV_SQE_STAT_ADDR", REG_A7XX_CP_BV_DRAW_STATE_ADDR,
+		REG_A7XX_CP_BV_DRAW_STATE_DATA, 0x00200},
+	{ "CP_BV_ROQ_DBG_ADDR", REG_A7XX_CP_BV_ROQ_DBG_ADDR,
+		REG_A7XX_CP_BV_ROQ_DBG_DATA, 0x00800},
+	{ "CP_BV_SQE_UCODE_DBG_ADDR", REG_A7XX_CP_BV_SQE_UCODE_DBG_ADDR,
+		REG_A7XX_CP_BV_SQE_UCODE_DBG_DATA, 0x08000},
+	{ "CP_BV_SQE_STAT_ADDR", REG_A7XX_CP_BV_SQE_STAT_ADDR,
+		REG_A7XX_CP_BV_SQE_STAT_DATA, 0x00040},
+	{ "CP_RESOURCE_TBL", REG_A7XX_CP_RESOURCE_TBL_DBG_ADDR,
+		REG_A7XX_CP_RESOURCE_TBL_DBG_DATA, 0x04100},
+	{ "CP_LPAC_DRAW_STATE_ADDR", REG_A7XX_CP_LPAC_DRAW_STATE_ADDR,
+		REG_A7XX_CP_LPAC_DRAW_STATE_DATA, 0x00200},
+	{ "CP_LPAC_ROQ", REG_A7XX_CP_LPAC_ROQ_DBG_ADDR,
+		REG_A7XX_CP_LPAC_ROQ_DBG_DATA, 0x00200},
+	{ "CP_SQE_AC_UCODE_DBG_ADDR", REG_A7XX_CP_SQE_AC_UCODE_DBG_ADDR,
+		REG_A7XX_CP_SQE_AC_UCODE_DBG_DATA, 0x08000},
+	{ "CP_SQE_AC_STAT_ADDR", REG_A7XX_CP_SQE_AC_STAT_ADDR,
+		REG_A7XX_CP_SQE_AC_STAT_DATA, 0x00040},
+	{ "CP_LPAC_FIFO_DBG_ADDR", REG_A7XX_CP_LPAC_FIFO_DBG_ADDR,
+		REG_A7XX_CP_LPAC_FIFO_DBG_DATA, 0x00040},
+	{ "CP_AQE_ROQ_0", REG_A7XX_CP_AQE_ROQ_DBG_ADDR_0,
+		REG_A7XX_CP_AQE_ROQ_DBG_DATA_0, 0x00100},
+	{ "CP_AQE_ROQ_1", REG_A7XX_CP_AQE_ROQ_DBG_ADDR_1,
+		REG_A7XX_CP_AQE_ROQ_DBG_DATA_1, 0x00100},
+	{ "CP_AQE_UCODE_DBG_0", REG_A7XX_CP_AQE_UCODE_DBG_ADDR_0,
+		REG_A7XX_CP_AQE_UCODE_DBG_DATA_0, 0x08000},
+	{ "CP_AQE_UCODE_DBG_1", REG_A7XX_CP_AQE_UCODE_DBG_ADDR_1,
+		REG_A7XX_CP_AQE_UCODE_DBG_DATA_1, 0x08000},
+	{ "CP_AQE_STAT_0", REG_A7XX_CP_AQE_STAT_ADDR_0,
+		REG_A7XX_CP_AQE_STAT_DATA_0, 0x00040},
+	{ "CP_AQE_STAT_1", REG_A7XX_CP_AQE_STAT_ADDR_1,
+		REG_A7XX_CP_AQE_STAT_DATA_1, 0x00040},
 };
 
 static struct gen7_reg_list gen7_9_0_reg_list[] = {

-- 
2.31.1


