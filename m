Return-Path: <linux-arm-msm+bounces-28094-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B834394A83D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2024 15:05:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CDE1F1C20EDC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2024 13:05:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3B2A1E6751;
	Wed,  7 Aug 2024 13:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eOqIRT8L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64AE91DF666
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Aug 2024 13:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723035917; cv=none; b=FQeN+IgqqIw0FcxagFZS67kStatAna3jvjRN2ER58GB1wQhKMyNkTerZASfQl0FYoFHIbDo6g4VLmAA+/b3QTG/II+6nU5NZe+cwAN/nsQPpnSc6N0wd/6f4Ft2/g/TDGvfTTqs3WuwKSqwNcKzYw3zr/rP/ycyCluR0jzZgWHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723035917; c=relaxed/simple;
	bh=g87yKteYDNXoajJhT2qvRJsBf575zGjp8Jp8HDpL0hQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z+extWEifUQiPyb/wgc8crsJG702vDutx7d0nu2a16qyV5Wz6fQavbYI1SEJw+iJ+B16ZN/1UpNtLceXuR/dWk1nbLuUHawp6ubqU37foiT2if4P/iFFrZe0Ss7FejovXnMzrvolxZ9/4a7oP9kOV3U8URDnFoI/SP0JOBJ26kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eOqIRT8L; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3683329f787so959255f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Aug 2024 06:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723035912; x=1723640712; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PSlHR/K166/M5/5IJUHQx8t5BFqXwChBMKqvB1qeIyw=;
        b=eOqIRT8LWDBheUDwyiR+WlNuUek9QaCjqsFwsqn2RTF6z/hfwF9xhRNrm+tJBG3OMc
         UrlcdGd8RL8d5UAcPkHDJFsw1QVOgEfc5PnM35vibRviDqiOiTEV97xcNgjii1VJN4N5
         1VNZFnWIJG5gHm4cgh9Qb+5PD/HL/hUC9WOMRMia3LAiyTbEJU5kZE7cqN2SWxUMysBH
         oMUeVSK2B6BxeSqMxpM1xWVp+JdIxO1eojtcX/BZJiJRqNERtvjkdrLo15psQ5T2nTSb
         9RNdHes/IjJB5Cb06XTrpA8wSai3r/8ia4rRM74C5xI240R+iYA+0uKsPOoT4qMQ3dNl
         ACqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723035912; x=1723640712;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PSlHR/K166/M5/5IJUHQx8t5BFqXwChBMKqvB1qeIyw=;
        b=VpvNe1U9w1FoXC1QSXRRRlnkKihBevOzVRlPrmhcvIOWUssI4FHcwBu93lKuVOj6DL
         YYIrdg2pchl7Jz9uz040W0q7c1BP5/PtbVaugUp6cEYwDlxQz6/zCE2QFBNjp6EVZXBr
         c5peBwIkrxvpGvvoi3q8/eCpZg4GlT1ShIzMzvJPghy5M5qk7FKb3UZGavEwWufgNR5a
         Cvqr7pMqNdUy6DJohRd7vt2kMoTND0uX0lHZR4uY5KPPmLYYPzmeUbYFuAS+jxUaBHX/
         u/GRSEHQ7vOgkvOcUyz/wpvHNA2NfNymBJNy/Pmo+Y+kSw46ck/rNwYQaB3DLpkl8WCy
         4xtw==
X-Gm-Message-State: AOJu0YyiQM79uGQN2MNvlvb+uq/PWLlHZDQIcw67I43G9rWImDgQ1PHp
	mwhvt7PmRP323xfHSjxMLtuKM+4+NH/6454CoA6LdO64RI5Dz4Tx
X-Google-Smtp-Source: AGHT+IEoCeZbDVXEjxeFj4utC1j2kkGhVc79qhGSe29Qsd2dnJVlC3Zuna9zae4cPaZ7fon5DuhhpQ==
X-Received: by 2002:adf:e644:0:b0:365:980c:d281 with SMTP id ffacd0b85a97d-36bbc1bcce8mr10627262f8f.45.1723035911493;
        Wed, 07 Aug 2024 06:05:11 -0700 (PDT)
Received: from [192.168.0.12] (cpc115152-dals23-2-0-cust532.20-2.cable.virginm.net. [86.12.82.21])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36bbd05980csm16072849f8f.76.2024.08.07.06.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 06:05:11 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Wed, 07 Aug 2024 14:04:56 +0100
Subject: [PATCH v3 1/4] drm/msm: Update a6xx register XML
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240807-msm-tiling-config-v3-1-ef1bc26efb4c@gmail.com>
References: <20240807-msm-tiling-config-v3-0-ef1bc26efb4c@gmail.com>
In-Reply-To: <20240807-msm-tiling-config-v3-0-ef1bc26efb4c@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723035909; l=75814;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=g87yKteYDNXoajJhT2qvRJsBf575zGjp8Jp8HDpL0hQ=;
 b=zNKWGA0aKm3E8aa22akVU5cwB6rXMASsUSypk049akK4p3kk1Q+ENyCEEqMrTIbq2bjPK8DNV
 Vd4clXwzuFDAgykx4kZYK8C32HOC7ppgird12/kBvGhVwp1ryfucsuu
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=

Update to Mesa commit 36a13d2b3b0 ("freedreno: fix a7xx perfcntr
countables").

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 1118 ++++++++++++++++++++++++-
 1 file changed, 1097 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
index 2dfe6913ab4f..97608603ea62 100644
--- a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
@@ -1198,6 +1198,1027 @@ to upconvert to 32b float internally?
 	<value value="0x3" name="TESS_CCW_TRIS"/>
 </enum>
 
+<enum name="a7xx_cp_perfcounter_select">
+	<value value="0" name="A7XX_PERF_CP_ALWAYS_COUNT"/>
+	<value value="1" name="A7XX_PERF_CP_BUSY_GFX_CORE_IDLE"/>
+	<value value="2" name="A7XX_PERF_CP_BUSY_CYCLES"/>
+	<value value="3" name="A7XX_PERF_CP_NUM_PREEMPTIONS"/>
+	<value value="4" name="A7XX_PERF_CP_PREEMPTION_REACTION_DELAY"/>
+	<value value="5" name="A7XX_PERF_CP_PREEMPTION_SWITCH_OUT_TIME"/>
+	<value value="6" name="A7XX_PERF_CP_PREEMPTION_SWITCH_IN_TIME"/>
+	<value value="7" name="A7XX_PERF_CP_DEAD_DRAWS_IN_BIN_RENDER"/>
+	<value value="8" name="A7XX_PERF_CP_PREDICATED_DRAWS_KILLED"/>
+	<value value="9" name="A7XX_PERF_CP_MODE_SWITCH"/>
+	<value value="10" name="A7XX_PERF_CP_ZPASS_DONE"/>
+	<value value="11" name="A7XX_PERF_CP_CONTEXT_DONE"/>
+	<value value="12" name="A7XX_PERF_CP_CACHE_FLUSH"/>
+	<value value="13" name="A7XX_PERF_CP_LONG_PREEMPTIONS"/>
+	<value value="14" name="A7XX_PERF_CP_SQE_I_CACHE_STARVE"/>
+	<value value="15" name="A7XX_PERF_CP_SQE_IDLE"/>
+	<value value="16" name="A7XX_PERF_CP_SQE_PM4_STARVE_RB_IB"/>
+	<value value="17" name="A7XX_PERF_CP_SQE_PM4_STARVE_SDS"/>
+	<value value="18" name="A7XX_PERF_CP_SQE_MRB_STARVE"/>
+	<value value="19" name="A7XX_PERF_CP_SQE_RRB_STARVE"/>
+	<value value="20" name="A7XX_PERF_CP_SQE_VSD_STARVE"/>
+	<value value="21" name="A7XX_PERF_CP_VSD_DECODE_STARVE"/>
+	<value value="22" name="A7XX_PERF_CP_SQE_PIPE_OUT_STALL"/>
+	<value value="23" name="A7XX_PERF_CP_SQE_SYNC_STALL"/>
+	<value value="24" name="A7XX_PERF_CP_SQE_PM4_WFI_STALL"/>
+	<value value="25" name="A7XX_PERF_CP_SQE_SYS_WFI_STALL"/>
+	<value value="26" name="A7XX_PERF_CP_SQE_T4_EXEC"/>
+	<value value="27" name="A7XX_PERF_CP_SQE_LOAD_STATE_EXEC"/>
+	<value value="28" name="A7XX_PERF_CP_SQE_SAVE_SDS_STATE"/>
+	<value value="29" name="A7XX_PERF_CP_SQE_DRAW_EXEC"/>
+	<value value="30" name="A7XX_PERF_CP_SQE_CTXT_REG_BUNCH_EXEC"/>
+	<value value="31" name="A7XX_PERF_CP_SQE_EXEC_PROFILED"/>
+	<value value="32" name="A7XX_PERF_CP_MEMORY_POOL_EMPTY"/>
+	<value value="33" name="A7XX_PERF_CP_MEMORY_POOL_SYNC_STALL"/>
+	<value value="34" name="A7XX_PERF_CP_MEMORY_POOL_ABOVE_THRESH"/>
+	<value value="35" name="A7XX_PERF_CP_AHB_WR_STALL_PRE_DRAWS"/>
+	<value value="36" name="A7XX_PERF_CP_AHB_STALL_SQE_GMU"/>
+	<value value="37" name="A7XX_PERF_CP_AHB_STALL_SQE_WR_OTHER"/>
+	<value value="38" name="A7XX_PERF_CP_AHB_STALL_SQE_RD_OTHER"/>
+	<value value="39" name="A7XX_PERF_CP_CLUSTER0_EMPTY"/>
+	<value value="40" name="A7XX_PERF_CP_CLUSTER1_EMPTY"/>
+	<value value="41" name="A7XX_PERF_CP_CLUSTER2_EMPTY"/>
+	<value value="42" name="A7XX_PERF_CP_CLUSTER3_EMPTY"/>
+	<value value="43" name="A7XX_PERF_CP_CLUSTER4_EMPTY"/>
+	<value value="44" name="A7XX_PERF_CP_CLUSTER5_EMPTY"/>
+	<value value="45" name="A7XX_PERF_CP_PM4_DATA"/>
+	<value value="46" name="A7XX_PERF_CP_PM4_HEADERS"/>
+	<value value="47" name="A7XX_PERF_CP_VBIF_READ_BEATS"/>
+	<value value="48" name="A7XX_PERF_CP_VBIF_WRITE_BEATS"/>
+	<value value="49" name="A7XX_PERF_CP_SQE_INSTR_COUNTER"/>
+	<value value="50" name="A7XX_PERF_CP_RESERVED_50"/>
+	<value value="51" name="A7XX_PERF_CP_RESERVED_51"/>
+	<value value="52" name="A7XX_PERF_CP_RESERVED_52"/>
+	<value value="53" name="A7XX_PERF_CP_RESERVED_53"/>
+	<value value="54" name="A7XX_PERF_CP_RESERVED_54"/>
+	<value value="55" name="A7XX_PERF_CP_RESERVED_55"/>
+	<value value="56" name="A7XX_PERF_CP_RESERVED_56"/>
+	<value value="57" name="A7XX_PERF_CP_RESERVED_57"/>
+	<value value="58" name="A7XX_PERF_CP_RESERVED_58"/>
+	<value value="59" name="A7XX_PERF_CP_RESERVED_59"/>
+	<value value="60" name="A7XX_PERF_CP_CLUSTER0_FULL"/>
+	<value value="61" name="A7XX_PERF_CP_CLUSTER1_FULL"/>
+	<value value="62" name="A7XX_PERF_CP_CLUSTER2_FULL"/>
+	<value value="63" name="A7XX_PERF_CP_CLUSTER3_FULL"/>
+	<value value="64" name="A7XX_PERF_CP_CLUSTER4_FULL"/>
+	<value value="65" name="A7XX_PERF_CP_CLUSTER5_FULL"/>
+	<value value="66" name="A7XX_PERF_CP_CLUSTER6_FULL"/>
+	<value value="67" name="A7XX_PERF_CP_CLUSTER6_EMPTY"/>
+	<value value="68" name="A7XX_PERF_CP_ICACHE_MISSES"/>
+	<value value="69" name="A7XX_PERF_CP_ICACHE_HITS"/>
+	<value value="70" name="A7XX_PERF_CP_ICACHE_STALL"/>
+	<value value="71" name="A7XX_PERF_CP_DCACHE_MISSES"/>
+	<value value="72" name="A7XX_PERF_CP_DCACHE_HITS"/>
+	<value value="73" name="A7XX_PERF_CP_DCACHE_STALLS"/>
+	<value value="74" name="A7XX_PERF_CP_AQE_SQE_STALL"/>
+	<value value="75" name="A7XX_PERF_CP_SQE_AQE_STARVE"/>
+	<value value="76" name="A7XX_PERF_CP_PREEMPT_LATENCY"/>
+	<value value="77" name="A7XX_PERF_CP_SQE_MD8_STALL_CYCLES"/>
+	<value value="78" name="A7XX_PERF_CP_SQE_MESH_EXEC_CYCLES"/>
+	<value value="79" name="A7XX_PERF_CP_AQE_NUM_AS_CHUNKS"/>
+	<value value="80" name="A7XX_PERF_CP_AQE_NUM_MS_CHUNKS"/>
+</enum>
+
+<enum name="a7xx_rbbm_perfcounter_select">
+	<value value="0" name="A7XX_PERF_RBBM_ALWAYS_COUNT"/>
+	<value value="1" name="A7XX_PERF_RBBM_ALWAYS_ON"/>
+	<value value="2" name="A7XX_PERF_RBBM_TSE_BUSY"/>
+	<value value="3" name="A7XX_PERF_RBBM_RAS_BUSY"/>
+	<value value="4" name="A7XX_PERF_RBBM_PC_DCALL_BUSY"/>
+	<value value="5" name="A7XX_PERF_RBBM_PC_VSD_BUSY"/>
+	<value value="6" name="A7XX_PERF_RBBM_STATUS_MASKED"/>
+	<value value="7" name="A7XX_PERF_RBBM_COM_BUSY"/>
+	<value value="8" name="A7XX_PERF_RBBM_DCOM_BUSY"/>
+	<value value="9" name="A7XX_PERF_RBBM_VBIF_BUSY"/>
+	<value value="10" name="A7XX_PERF_RBBM_VSC_BUSY"/>
+	<value value="11" name="A7XX_PERF_RBBM_TESS_BUSY"/>
+	<value value="12" name="A7XX_PERF_RBBM_UCHE_BUSY"/>
+	<value value="13" name="A7XX_PERF_RBBM_HLSQ_BUSY"/>
+</enum>
+
+<enum name="a7xx_pc_perfcounter_select">
+	<value value="0" name="A7XX_PERF_PC_BUSY_CYCLES"/>
+	<value value="1" name="A7XX_PERF_PC_WORKING_CYCLES"/>
+	<value value="2" name="A7XX_PERF_PC_STALL_CYCLES_VFD"/>
+	<value value="3" name="A7XX_PERF_PC_RESERVED"/>
+	<value value="4" name="A7XX_PERF_PC_STALL_CYCLES_VPC"/>
+	<value value="5" name="A7XX_PERF_PC_STALL_CYCLES_UCHE"/>
+	<value value="6" name="A7XX_PERF_PC_STALL_CYCLES_TESS"/>
+	<value value="7" name="A7XX_PERF_PC_STALL_CYCLES_VFD_ONLY"/>
+	<value value="8" name="A7XX_PERF_PC_STALL_CYCLES_VPC_ONLY"/>
+	<value value="9" name="A7XX_PERF_PC_PASS1_TF_STALL_CYCLES"/>
+	<value value="10" name="A7XX_PERF_PC_STARVE_CYCLES_FOR_INDEX"/>
+	<value value="11" name="A7XX_PERF_PC_STARVE_CYCLES_FOR_TESS_FACTOR"/>
+	<value value="12" name="A7XX_PERF_PC_STARVE_CYCLES_FOR_VIZ_STREAM"/>
+	<value value="13" name="A7XX_PERF_PC_STARVE_CYCLES_DI"/>
+	<value value="14" name="A7XX_PERF_PC_VIS_STREAMS_LOADED"/>
+	<value value="15" name="A7XX_PERF_PC_INSTANCES"/>
+	<value value="16" name="A7XX_PERF_PC_VPC_PRIMITIVES"/>
+	<value value="17" name="A7XX_PERF_PC_DEAD_PRIM"/>
+	<value value="18" name="A7XX_PERF_PC_LIVE_PRIM"/>
+	<value value="19" name="A7XX_PERF_PC_VERTEX_HITS"/>
+	<value value="20" name="A7XX_PERF_PC_IA_VERTICES"/>
+	<value value="21" name="A7XX_PERF_PC_IA_PRIMITIVES"/>
+	<value value="22" name="A7XX_PERF_PC_RESERVED_22"/>
+	<value value="23" name="A7XX_PERF_PC_HS_INVOCATIONS"/>
+	<value value="24" name="A7XX_PERF_PC_DS_INVOCATIONS"/>
+	<value value="25" name="A7XX_PERF_PC_VS_INVOCATIONS"/>
+	<value value="26" name="A7XX_PERF_PC_GS_INVOCATIONS"/>
+	<value value="27" name="A7XX_PERF_PC_DS_PRIMITIVES"/>
+	<value value="28" name="A7XX_PERF_PC_3D_DRAWCALLS"/>
+	<value value="29" name="A7XX_PERF_PC_2D_DRAWCALLS"/>
+	<value value="30" name="A7XX_PERF_PC_NON_DRAWCALL_GLOBAL_EVENTS"/>
+	<value value="31" name="A7XX_PERF_PC_TESS_BUSY_CYCLES"/>
+	<value value="32" name="A7XX_PERF_PC_TESS_WORKING_CYCLES"/>
+	<value value="33" name="A7XX_PERF_PC_TESS_STALL_CYCLES_PC"/>
+	<value value="34" name="A7XX_PERF_PC_TESS_STARVE_CYCLES_PC"/>
+	<value value="35" name="A7XX_PERF_PC_TESS_SINGLE_PRIM_CYCLES"/>
+	<value value="36" name="A7XX_PERF_PC_TESS_PC_UV_TRANS"/>
+	<value value="37" name="A7XX_PERF_PC_TESS_PC_UV_PATCHES"/>
+	<value value="38" name="A7XX_PERF_PC_TESS_FACTOR_TRANS"/>
+	<value value="39" name="A7XX_PERF_PC_TAG_CHECKED_VERTICES"/>
+	<value value="40" name="A7XX_PERF_PC_MESH_VS_WAVES"/>
+	<value value="41" name="A7XX_PERF_PC_MESH_DRAWS"/>
+	<value value="42" name="A7XX_PERF_PC_MESH_DEAD_DRAWS"/>
+	<value value="43" name="A7XX_PERF_PC_MESH_MVIS_EN_DRAWS"/>
+	<value value="44" name="A7XX_PERF_PC_MESH_DEAD_PRIM"/>
+	<value value="45" name="A7XX_PERF_PC_MESH_LIVE_PRIM"/>
+	<value value="46" name="A7XX_PERF_PC_MESH_PA_EN_PRIM"/>
+	<value value="47" name="A7XX_PERF_PC_STARVE_CYCLES_FOR_MVIS_STREAM"/>
+	<value value="48" name="A7XX_PERF_PC_STARVE_CYCLES_PREDRAW"/>
+	<value value="49" name="A7XX_PERF_PC_STALL_CYCLES_COMPUTE_GFX"/>
+	<value value="50" name="A7XX_PERF_PC_STALL_CYCLES_GFX_COMPUTE"/>
+	<value value="51" name="A7XX_PERF_PC_TESS_PC_MULTI_PATCH_TRANS"/>
+</enum>
+
+<enum name="a7xx_vfd_perfcounter_select">
+	<value value="0" name="A7XX_PERF_VFD_BUSY_CYCLES"/>
+	<value value="1" name="A7XX_PERF_VFD_STALL_CYCLES_UCHE"/>
+	<value value="2" name="A7XX_PERF_VFD_STALL_CYCLES_VPC_ALLOC"/>
+	<value value="3" name="A7XX_PERF_VFD_STALL_CYCLES_SP_INFO"/>
+	<value value="4" name="A7XX_PERF_VFD_STALL_CYCLES_SP_ATTR"/>
+	<value value="5" name="A7XX_PERF_VFD_STARVE_CYCLES_UCHE"/>
+	<value value="6" name="A7XX_PERF_VFD_RBUFFER_FULL"/>
+	<value value="7" name="A7XX_PERF_VFD_ATTR_INFO_FIFO_FULL"/>
+	<value value="8" name="A7XX_PERF_VFD_DECODED_ATTRIBUTE_BYTES"/>
+	<value value="9" name="A7XX_PERF_VFD_NUM_ATTRIBUTES"/>
+	<value value="10" name="A7XX_PERF_VFD_UPPER_SHADER_FIBERS"/>
+	<value value="11" name="A7XX_PERF_VFD_LOWER_SHADER_FIBERS"/>
+	<value value="12" name="A7XX_PERF_VFD_MODE_0_FIBERS"/>
+	<value value="13" name="A7XX_PERF_VFD_MODE_1_FIBERS"/>
+	<value value="14" name="A7XX_PERF_VFD_MODE_2_FIBERS"/>
+	<value value="15" name="A7XX_PERF_VFD_MODE_3_FIBERS"/>
+	<value value="16" name="A7XX_PERF_VFD_MODE_4_FIBERS"/>
+	<value value="17" name="A7XX_PERF_VFD_TOTAL_VERTICES"/>
+	<value value="18" name="A7XX_PERF_VFDP_STALL_CYCLES_VFD"/>
+	<value value="19" name="A7XX_PERF_VFDP_STALL_CYCLES_VFD_INDEX"/>
+	<value value="20" name="A7XX_PERF_VFDP_STALL_CYCLES_VFD_PROG"/>
+	<value value="21" name="A7XX_PERF_VFDP_STARVE_CYCLES_PC"/>
+	<value value="22" name="A7XX_PERF_VFDP_VS_STAGE_WAVES"/>
+	<value value="23" name="A7XX_PERF_VFD_STALL_CYCLES_PRG_END_FE"/>
+	<value value="24" name="A7XX_PERF_VFD_STALL_CYCLES_CBSYNC"/>
+</enum>
+
+<enum name="a7xx_hlsq_perfcounter_select">
+	<value value="0" name="A7XX_PERF_HLSQ_BUSY_CYCLES"/>
+	<value value="1" name="A7XX_PERF_HLSQ_STALL_CYCLES_UCHE"/>
+	<value value="2" name="A7XX_PERF_HLSQ_STALL_CYCLES_SP_STATE"/>
+	<value value="3" name="A7XX_PERF_HLSQ_STALL_CYCLES_SP_FS_STAGE"/>
+	<value value="4" name="A7XX_PERF_HLSQ_UCHE_LATENCY_CYCLES"/>
+	<value value="5" name="A7XX_PERF_HLSQ_UCHE_LATENCY_COUNT"/>
+	<value value="6" name="A7XX_PERF_HLSQ_RESERVED_6"/>
+	<value value="7" name="A7XX_PERF_HLSQ_RESERVED_7"/>
+	<value value="8" name="A7XX_PERF_HLSQ_RESERVED_8"/>
+	<value value="9" name="A7XX_PERF_HLSQ_RESERVED_9"/>
+	<value value="10" name="A7XX_PERF_HLSQ_COMPUTE_DRAWCALLS"/>
+	<value value="11" name="A7XX_PERF_HLSQ_FS_DATA_WAIT_PROGRAMMING"/>
+	<value value="12" name="A7XX_PERF_HLSQ_DUAL_FS_PROG_ACTIVE"/>
+	<value value="13" name="A7XX_PERF_HLSQ_DUAL_VS_PROG_ACTIVE"/>
+	<value value="14" name="A7XX_PERF_HLSQ_FS_BATCH_COUNT_ZERO"/>
+	<value value="15" name="A7XX_PERF_HLSQ_VS_BATCH_COUNT_ZERO"/>
+	<value value="16" name="A7XX_PERF_HLSQ_WAVE_PENDING_NO_QUAD"/>
+	<value value="17" name="A7XX_PERF_HLSQ_WAVE_PENDING_NO_PRIM_BASE"/>
+	<value value="18" name="A7XX_PERF_HLSQ_STALL_CYCLES_VPC"/>
+	<value value="19" name="A7XX_PERF_HLSQ_RESERVED_19"/>
+	<value value="20" name="A7XX_PERF_HLSQ_DRAW_MODE_SWITCH_VSFS_SYNC"/>
+	<value value="21" name="A7XX_PERF_HLSQ_VSBR_STALL_CYCLES"/>
+	<value value="22" name="A7XX_PERF_HLSQ_FS_STALL_CYCLES"/>
+	<value value="23" name="A7XX_PERF_HLSQ_LPAC_STALL_CYCLES"/>
+	<value value="24" name="A7XX_PERF_HLSQ_BV_STALL_CYCLES"/>
+	<value value="25" name="A7XX_PERF_HLSQ_VSBR_DEREF_CYCLES"/>
+	<value value="26" name="A7XX_PERF_HLSQ_FS_DEREF_CYCLES"/>
+	<value value="27" name="A7XX_PERF_HLSQ_LPAC_DEREF_CYCLES"/>
+	<value value="28" name="A7XX_PERF_HLSQ_BV_DEREF_CYCLES"/>
+	<value value="29" name="A7XX_PERF_HLSQ_VSBR_S2W_CYCLES"/>
+	<value value="30" name="A7XX_PERF_HLSQ_FS_S2W_CYCLES"/>
+	<value value="31" name="A7XX_PERF_HLSQ_LPAC_S2W_CYCLES"/>
+	<value value="32" name="A7XX_PERF_HLSQ_BV_S2W_CYCLES"/>
+	<value value="33" name="A7XX_PERF_HLSQ_VSBR_WAIT_FS_S2W"/>
+	<value value="34" name="A7XX_PERF_HLSQ_FS_WAIT_VS_S2W"/>
+	<value value="35" name="A7XX_PERF_HLSQ_LPAC_WAIT_VS_S2W"/>
+	<value value="36" name="A7XX_PERF_HLSQ_BV_WAIT_FS_S2W"/>
+	<value value="37" name="A7XX_PERF_HLSQ_VS_WAIT_CONST_RESOURCE"/>
+	<value value="38" name="A7XX_PERF_HLSQ_FS_WAIT_SAME_VS_S2W"/>
+	<value value="39" name="A7XX_PERF_HLSQ_FS_STARVING_SP"/>
+	<value value="40" name="A7XX_PERF_HLSQ_VS_DATA_WAIT_PROGRAMMING"/>
+	<value value="41" name="A7XX_PERF_HLSQ_BV_DATA_WAIT_PROGRAMMING"/>
+	<value value="42" name="A7XX_PERF_HLSQ_STPROC_WAVE_CONTEXTS_VS"/>
+	<value value="43" name="A7XX_PERF_HLSQ_STPROC_WAVE_CONTEXT_CYCLES_VS"/>
+	<value value="44" name="A7XX_PERF_HLSQ_STPROC_WAVE_CONTEXTS_FS"/>
+	<value value="45" name="A7XX_PERF_HLSQ_STPROC_WAVE_CONTEXT_CYCLES_FS"/>
+	<value value="46" name="A7XX_PERF_HLSQ_STPROC_WAVE_CONTEXTS_BV"/>
+	<value value="47" name="A7XX_PERF_HLSQ_STPROC_WAVE_CONTEXT_CYCLES_BV"/>
+	<value value="48" name="A7XX_PERF_HLSQ_STPROC_WAVE_CONTEXTS_LPAC"/>
+	<value value="49" name="A7XX_PERF_HLSQ_STPROC_WAVE_CONTEXT_CYCLES_LPAC"/>
+	<value value="50" name="A7XX_PERF_HLSQ_SPTROC_STCHE_WARMUP_INC_VS"/>
+	<value value="51" name="A7XX_PERF_HLSQ_SPTROC_STCHE_WARMUP_INC_FS"/>
+	<value value="52" name="A7XX_PERF_HLSQ_SPTROC_STCHE_WARMUP_INC_BV"/>
+	<value value="53" name="A7XX_PERF_HLSQ_SPTROC_STCHE_WARMUP_INC_LPAC"/>
+	<value value="54" name="A7XX_PERF_HLSQ_SPTROC_STCHE_MISS_INC_VS"/>
+	<value value="55" name="A7XX_PERF_HLSQ_SPTROC_STCHE_MISS_INC_FS"/>
+	<value value="56" name="A7XX_PERF_HLSQ_SPTROC_STCHE_MISS_INC_BV"/>
+	<value value="57" name="A7XX_PERF_HLSQ_SPTROC_STCHE_MISS_INC_LPAC"/>
+</enum>
+
+<enum name="a7xx_vpc_perfcounter_select">
+	<value value="0" name="A7XX_PERF_VPC_BUSY_CYCLES"/>
+	<value value="1" name="A7XX_PERF_VPC_WORKING_CYCLES"/>
+	<value value="2" name="A7XX_PERF_VPC_STALL_CYCLES_UCHE"/>
+	<value value="3" name="A7XX_PERF_VPC_STALL_CYCLES_VFD_WACK"/>
+	<value value="4" name="A7XX_PERF_VPC_STALL_CYCLES_HLSQ_PRIM_ALLOC"/>
+	<value value="5" name="A7XX_PERF_VPC_RESERVED_5"/>
+	<value value="6" name="A7XX_PERF_VPC_STALL_CYCLES_SP_LM"/>
+	<value value="7" name="A7XX_PERF_VPC_STARVE_CYCLES_SP"/>
+	<value value="8" name="A7XX_PERF_VPC_STARVE_CYCLES_LRZ"/>
+	<value value="9" name="A7XX_PERF_VPC_PC_PRIMITIVES"/>
+	<value value="10" name="A7XX_PERF_VPC_SP_COMPONENTS"/>
+	<value value="11" name="A7XX_PERF_VPC_STALL_CYCLES_VPCRAM_POS"/>
+	<value value="12" name="A7XX_PERF_VPC_LRZ_ASSIGN_PRIMITIVES"/>
+	<value value="13" name="A7XX_PERF_VPC_RB_VISIBLE_PRIMITIVES"/>
+	<value value="14" name="A7XX_PERF_VPC_LM_TRANSACTION"/>
+	<value value="15" name="A7XX_PERF_VPC_STREAMOUT_TRANSACTION"/>
+	<value value="16" name="A7XX_PERF_VPC_VS_BUSY_CYCLES"/>
+	<value value="17" name="A7XX_PERF_VPC_PS_BUSY_CYCLES"/>
+	<value value="18" name="A7XX_PERF_VPC_VS_WORKING_CYCLES"/>
+	<value value="19" name="A7XX_PERF_VPC_PS_WORKING_CYCLES"/>
+	<value value="20" name="A7XX_PERF_VPC_STARVE_CYCLES_RB"/>
+	<value value="21" name="A7XX_PERF_VPC_NUM_VPCRAM_READ_POS"/>
+	<value value="22" name="A7XX_PERF_VPC_WIT_FULL_CYCLES"/>
+	<value value="23" name="A7XX_PERF_VPC_VPCRAM_FULL_CYCLES"/>
+	<value value="24" name="A7XX_PERF_VPC_LM_FULL_WAIT_FOR_INTP_END"/>
+	<value value="25" name="A7XX_PERF_VPC_NUM_VPCRAM_WRITE"/>
+	<value value="26" name="A7XX_PERF_VPC_NUM_VPCRAM_READ_SO"/>
+	<value value="27" name="A7XX_PERF_VPC_NUM_ATTR_REQ_LM"/>
+	<value value="28" name="A7XX_PERF_VPC_STALL_CYCLE_TSE"/>
+	<value value="29" name="A7XX_PERF_VPC_TSE_PRIMITIVES"/>
+	<value value="30" name="A7XX_PERF_VPC_GS_PRIMITIVES"/>
+	<value value="31" name="A7XX_PERF_VPC_TSE_TRANSACTIONS"/>
+	<value value="32" name="A7XX_PERF_VPC_STALL_CYCLES_CCU"/>
+	<value value="33" name="A7XX_PERF_VPC_NUM_WM_HIT"/>
+	<value value="34" name="A7XX_PERF_VPC_STALL_DQ_WACK"/>
+	<value value="35" name="A7XX_PERF_VPC_STALL_CYCLES_CCHE"/>
+	<value value="36" name="A7XX_PERF_VPC_STARVE_CYCLES_CCHE"/>
+	<value value="37" name="A7XX_PERF_VPC_NUM_PA_REQ"/>
+	<value value="38" name="A7XX_PERF_VPC_NUM_LM_REQ_HIT"/>
+	<value value="39" name="A7XX_PERF_VPC_CCHE_REQBUF_FULL"/>
+	<value value="40" name="A7XX_PERF_VPC_STALL_CYCLES_LM_ACK"/>
+	<value value="41" name="A7XX_PERF_VPC_STALL_CYCLES_PRG_END_FE"/>
+	<value value="42" name="A7XX_PERF_VPC_STALL_CYCLES_PRG_END_PCVS"/>
+	<value value="43" name="A7XX_PERF_VPC_STALL_CYCLES_PRG_END_VPCPS"/>
+</enum>
+
+<enum name="a7xx_tse_perfcounter_select">
+	<value value="0" name="A7XX_PERF_TSE_BUSY_CYCLES"/>
+	<value value="1" name="A7XX_PERF_TSE_CLIPPING_CYCLES"/>
+	<value value="2" name="A7XX_PERF_TSE_STALL_CYCLES_RAS"/>
+	<value value="3" name="A7XX_PERF_TSE_STALL_CYCLES_LRZ_BARYPLANE"/>
+	<value value="4" name="A7XX_PERF_TSE_STALL_CYCLES_LRZ_ZPLANE"/>
+	<value value="5" name="A7XX_PERF_TSE_STARVE_CYCLES_PC"/>
+	<value value="6" name="A7XX_PERF_TSE_INPUT_PRIM"/>
+	<value value="7" name="A7XX_PERF_TSE_INPUT_NULL_PRIM"/>
+	<value value="8" name="A7XX_PERF_TSE_TRIVAL_REJ_PRIM"/>
+	<value value="9" name="A7XX_PERF_TSE_CLIPPED_PRIM"/>
+	<value value="10" name="A7XX_PERF_TSE_ZERO_AREA_PRIM"/>
+	<value value="11" name="A7XX_PERF_TSE_FACENESS_CULLED_PRIM"/>
+	<value value="12" name="A7XX_PERF_TSE_ZERO_PIXEL_PRIM"/>
+	<value value="13" name="A7XX_PERF_TSE_OUTPUT_NULL_PRIM"/>
+	<value value="14" name="A7XX_PERF_TSE_OUTPUT_VISIBLE_PRIM"/>
+	<value value="15" name="A7XX_PERF_TSE_CINVOCATION"/>
+	<value value="16" name="A7XX_PERF_TSE_CPRIMITIVES"/>
+	<value value="17" name="A7XX_PERF_TSE_2D_INPUT_PRIM"/>
+	<value value="18" name="A7XX_PERF_TSE_2D_ALIVE_CYCLES"/>
+	<value value="19" name="A7XX_PERF_TSE_CLIP_PLANES"/>
+</enum>
+
+<enum name="a7xx_ras_perfcounter_select">
+	<value value="0" name="A7XX_PERF_RAS_BUSY_CYCLES"/>
+	<value value="1" name="A7XX_PERF_RAS_SUPERTILE_ACTIVE_CYCLES"/>
+	<value value="2" name="A7XX_PERF_RAS_STALL_CYCLES_LRZ"/>
+	<value value="3" name="A7XX_PERF_RAS_STARVE_CYCLES_TSE"/>
+	<value value="4" name="A7XX_PERF_RAS_SUPER_TILES"/>
+	<value value="5" name="A7XX_PERF_RAS_8X4_TILES"/>
+	<value value="6" name="A7XX_PERF_RAS_MASKGEN_ACTIVE"/>
+	<value value="7" name="A7XX_PERF_RAS_FULLY_COVERED_SUPER_TILES"/>
+	<value value="8" name="A7XX_PERF_RAS_FULLY_COVERED_8X4_TILES"/>
+	<value value="9" name="A7XX_PERF_RAS_PRIM_KILLED_INVISILBE"/>
+	<value value="10" name="A7XX_PERF_RAS_SUPERTILE_GEN_ACTIVE_CYCLES"/>
+	<value value="11" name="A7XX_PERF_RAS_LRZ_INTF_WORKING_CYCLES"/>
+	<value value="12" name="A7XX_PERF_RAS_BLOCKS"/>
+	<value value="13" name="A7XX_PERF_RAS_SAMPLE_MASK_GEN_LANE_0_WORKING_CC_l2"/>
+	<value value="14" name="A7XX_PERF_RAS_SAMPLE_MASK_GEN_LANE_1_WORKING_CC_l2"/>
+	<value value="15" name="A7XX_PERF_RAS_SAMPLE_MASK_GEN_LANE_2_WORKING_CC_l2"/>
+	<value value="16" name="A7XX_PERF_RAS_SAMPLE_MASK_GEN_LANE_3_WORKING_CC_l2"/>
+	<value value="17" name="A7XX_PERF_RAS_SAMPLE_MASK_GEN_LANE_4_WORKING_CC_l2"/>
+	<value value="18" name="A7XX_PERF_RAS_SAMPLE_MASK_GEN_LANE_5_WORKING_CC_l2"/>
+	<value value="19" name="A7XX_PERF_RAS_SAMPLE_MASK_GEN_LANE_6_WORKING_CC_l2"/>
+	<value value="20" name="A7XX_PERF_RAS_SAMPLE_MASK_GEN_LANE_7_WORKING_CC_l2"/>
+	<value value="21" name="A7XX_PERF_RAS_SAMPLE_MASK_GEN_LANE_8_WORKING_CC_l2"/>
+	<value value="22" name="A7XX_PERF_RAS_SAMPLE_MASK_GEN_LANE_9_WORKING_CC_l2"/>
+	<value value="23" name="A7XX_PERF_RAS_SAMPLE_MASK_GEN_LANE_10_WORKING_CC_l2"/>
+	<value value="24" name="A7XX_PERF_RAS_SAMPLE_MASK_GEN_LANE_11_WORKING_CC_l2"/>
+	<value value="25" name="A7XX_PERF_RAS_SAMPLE_MASK_GEN_LANE_12_WORKING_CC_l2"/>
+	<value value="26" name="A7XX_PERF_RAS_SAMPLE_MASK_GEN_LANE_13_WORKING_CC_l2"/>
+	<value value="27" name="A7XX_PERF_RAS_SAMPLE_MASK_GEN_LANE_14_WORKING_CC_l2"/>
+	<value value="28" name="A7XX_PERF_RAS_SAMPLE_MASK_GEN_LANE_15_WORKING_CC_l2"/>
+	<value value="29" name="A7XX_PERF_RAS_FALSE_PARTIAL_STILE"/>
+
+</enum>
+
+<enum name="a7xx_uche_perfcounter_select">
+	<value value="0" name="A7XX_PERF_UCHE_BUSY_CYCLES"/>
+	<value value="1" name="A7XX_PERF_UCHE_STALL_CYCLES_ARBITER"/>
+	<value value="2" name="A7XX_PERF_UCHE_VBIF_LATENCY_CYCLES"/>
+	<value value="3" name="A7XX_PERF_UCHE_VBIF_LATENCY_SAMPLES"/>
+	<value value="4" name="A7XX_PERF_UCHE_VBIF_READ_BEATS_TP"/>
+	<value value="5" name="A7XX_PERF_UCHE_VBIF_READ_BEATS_VFD"/>
+	<value value="6" name="A7XX_PERF_UCHE_VBIF_READ_BEATS_HLSQ"/>
+	<value value="7" name="A7XX_PERF_UCHE_VBIF_READ_BEATS_LRZ"/>
+	<value value="8" name="A7XX_PERF_UCHE_VBIF_READ_BEATS_SP"/>
+	<value value="9" name="A7XX_PERF_UCHE_READ_REQUESTS_TP"/>
+	<value value="10" name="A7XX_PERF_UCHE_READ_REQUESTS_VFD"/>
+	<value value="11" name="A7XX_PERF_UCHE_READ_REQUESTS_HLSQ"/>
+	<value value="12" name="A7XX_PERF_UCHE_READ_REQUESTS_LRZ"/>
+	<value value="13" name="A7XX_PERF_UCHE_READ_REQUESTS_SP"/>
+	<value value="14" name="A7XX_PERF_UCHE_WRITE_REQUESTS_LRZ"/>
+	<value value="15" name="A7XX_PERF_UCHE_WRITE_REQUESTS_SP"/>
+	<value value="16" name="A7XX_PERF_UCHE_WRITE_REQUESTS_VPC"/>
+	<value value="17" name="A7XX_PERF_UCHE_WRITE_REQUESTS_VSC"/>
+	<value value="18" name="A7XX_PERF_UCHE_EVICTS"/>
+	<value value="19" name="A7XX_PERF_UCHE_BANK_REQ0"/>
+	<value value="20" name="A7XX_PERF_UCHE_BANK_REQ1"/>
+	<value value="21" name="A7XX_PERF_UCHE_BANK_REQ2"/>
+	<value value="22" name="A7XX_PERF_UCHE_BANK_REQ3"/>
+	<value value="23" name="A7XX_PERF_UCHE_BANK_REQ4"/>
+	<value value="24" name="A7XX_PERF_UCHE_BANK_REQ5"/>
+	<value value="25" name="A7XX_PERF_UCHE_BANK_REQ6"/>
+	<value value="26" name="A7XX_PERF_UCHE_BANK_REQ7"/>
+	<value value="27" name="A7XX_PERF_UCHE_VBIF_READ_BEATS_CH0"/>
+	<value value="28" name="A7XX_PERF_UCHE_VBIF_READ_BEATS_CH1"/>
+	<value value="29" name="A7XX_PERF_UCHE_GMEM_READ_BEATS"/>
+	<value value="30" name="A7XX_PERF_UCHE_TPH_REF_FULL"/>
+	<value value="31" name="A7XX_PERF_UCHE_TPH_VICTIM_FULL"/>
+	<value value="32" name="A7XX_PERF_UCHE_TPH_EXT_FULL"/>
+	<value value="33" name="A7XX_PERF_UCHE_VBIF_STALL_WRITE_DATA"/>
+	<value value="34" name="A7XX_PERF_UCHE_DCMP_LATENCY_SAMPLES"/>
+	<value value="35" name="A7XX_PERF_UCHE_DCMP_LATENCY_CYCLES"/>
+	<value value="36" name="A7XX_PERF_UCHE_VBIF_READ_BEATS_PC"/>
+	<value value="37" name="A7XX_PERF_UCHE_READ_REQUESTS_PC"/>
+	<value value="38" name="A7XX_PERF_UCHE_RAM_READ_REQ"/>
+	<value value="39" name="A7XX_PERF_UCHE_RAM_WRITE_REQ"/>
+	<value value="40" name="A7XX_PERF_UCHE_STARVED_CYCLES_VBIF_DECMP"/>
+	<value value="41" name="A7XX_PERF_UCHE_STALL_CYCLES_DECMP"/>
+	<value value="42" name="A7XX_PERF_UCHE_ARBITER_STALL_CYCLES_VBIF"/>
+	<value value="43" name="A7XX_PERF_UCHE_READ_REQUESTS_TP_UBWC"/>
+	<value value="44" name="A7XX_PERF_UCHE_READ_REQUESTS_TP_NONUBWC"/>
+	<value value="45" name="A7XX_PERF_UCHE_READ_REQUESTS_TP_GMEM"/>
+	<value value="46" name="A7XX_PERF_UCHE_LONG_LINE_ALL_EVICTS_KAILUA"/>
+	<value value="47" name="A7XX_PERF_UCHE_LONG_LINE_PARTIAL_EVICTS_KAILUA"/>
+	<value value="48" name="A7XX_PERF_UCHE_TPH_CONFLICT_CL_CCHE"/>
+	<value value="49" name="A7XX_PERF_UCHE_TPH_CONFLICT_CL_OTHER_KAILUA"/>
+	<value value="50" name="A7XX_PERF_UCHE_DBANK_CONFLICT_CL_CCHE"/>
+	<value value="51" name="A7XX_PERF_UCHE_DBANK_CONFLICT_CL_OTHER_CLIENTS"/>
+	<value value="52" name="A7XX_PERF_UCHE_VBIF_WRITE_BEATS_CH0"/>
+	<value value="53" name="A7XX_PERF_UCHE_VBIF_WRITE_BEATS_CH1"/>
+	<value value="54" name="A7XX_PERF_UCHE_CCHE_TPH_QUEUE_FULL"/>
+	<value value="55" name="A7XX_PERF_UCHE_CCHE_DPH_QUEUE_FULL"/>
+	<value value="56" name="A7XX_PERF_UCHE_GMEM_WRITE_BEATS"/>
+	<value value="57" name="A7XX_PERF_UCHE_UBWC_READ_BEATS"/>
+	<value value="58" name="A7XX_PERF_UCHE_UBWC_WRITE_BEATS"/>
+</enum>
+
+<enum name="a7xx_tp_perfcounter_select">
+	<value value="0" name="A7XX_PERF_TP_BUSY_CYCLES"/>
+	<value value="1" name="A7XX_PERF_TP_STALL_CYCLES_UCHE"/>
+	<value value="2" name="A7XX_PERF_TP_LATENCY_CYCLES"/>
+	<value value="3" name="A7XX_PERF_TP_LATENCY_TRANS"/>
+	<value value="4" name="A7XX_PERF_TP_FLAG_FIFO_DELAY_SAMPLES"/>
+	<value value="5" name="A7XX_PERF_TP_FLAG_FIFO_DELAY_CYCLES"/>
+	<value value="6" name="A7XX_PERF_TP_L1_CACHELINE_REQUESTS"/>
+	<value value="7" name="A7XX_PERF_TP_L1_CACHELINE_MISSES"/>
+	<value value="8" name="A7XX_PERF_TP_SP_TP_TRANS"/>
+	<value value="9" name="A7XX_PERF_TP_TP_SP_TRANS"/>
+	<value value="10" name="A7XX_PERF_TP_OUTPUT_PIXELS"/>
+	<value value="11" name="A7XX_PERF_TP_FILTER_WORKLOAD_16BIT"/>
+	<value value="12" name="A7XX_PERF_TP_FILTER_WORKLOAD_32BIT"/>
+	<value value="13" name="A7XX_PERF_TP_QUADS_RECEIVED"/>
+	<value value="14" name="A7XX_PERF_TP_QUADS_OFFSET"/>
+	<value value="15" name="A7XX_PERF_TP_QUADS_SHADOW"/>
+	<value value="16" name="A7XX_PERF_TP_QUADS_ARRAY"/>
+	<value value="17" name="A7XX_PERF_TP_QUADS_GRADIENT"/>
+	<value value="18" name="A7XX_PERF_TP_QUADS_1D"/>
+	<value value="19" name="A7XX_PERF_TP_QUADS_2D"/>
+	<value value="20" name="A7XX_PERF_TP_QUADS_BUFFER"/>
+	<value value="21" name="A7XX_PERF_TP_QUADS_3D"/>
+	<value value="22" name="A7XX_PERF_TP_QUADS_CUBE"/>
+	<value value="23" name="A7XX_PERF_TP_DIVERGENT_QUADS_RECEIVED"/>
+	<value value="24" name="A7XX_PERF_TP_PRT_NON_RESIDENT_EVENTS"/>
+	<value value="25" name="A7XX_PERF_TP_OUTPUT_PIXELS_POINT"/>
+	<value value="26" name="A7XX_PERF_TP_OUTPUT_PIXELS_BILINEAR"/>
+	<value value="27" name="A7XX_PERF_TP_OUTPUT_PIXELS_MIP"/>
+	<value value="28" name="A7XX_PERF_TP_OUTPUT_PIXELS_ANISO"/>
+	<value value="29" name="A7XX_PERF_TP_OUTPUT_PIXELS_ZERO_LOD"/>
+	<value value="30" name="A7XX_PERF_TP_FLAG_CACHE_REQUESTS"/>
+	<value value="31" name="A7XX_PERF_TP_FLAG_CACHE_MISSES"/>
+	<value value="32" name="A7XX_PERF_TP_L1_5_L2_REQUESTS"/>
+	<value value="33" name="A7XX_PERF_TP_2D_OUTPUT_PIXELS"/>
+	<value value="34" name="A7XX_PERF_TP_2D_OUTPUT_PIXELS_POINT"/>
+	<value value="35" name="A7XX_PERF_TP_2D_OUTPUT_PIXELS_BILINEAR"/>
+	<value value="36" name="A7XX_PERF_TP_2D_FILTER_WORKLOAD_16BIT"/>
+	<value value="37" name="A7XX_PERF_TP_2D_FILTER_WORKLOAD_32BIT"/>
+	<value value="38" name="A7XX_PERF_TP_TPA2TPC_TRANS"/>
+	<value value="39" name="A7XX_PERF_TP_L1_MISSES_ASTC_1TILE"/>
+	<value value="40" name="A7XX_PERF_TP_L1_MISSES_ASTC_2TILE"/>
+	<value value="41" name="A7XX_PERF_TP_L1_MISSES_ASTC_4TILE"/>
+	<value value="42" name="A7XX_PERF_TP_L1_5_COMPRESS_REQS"/>
+	<value value="43" name="A7XX_PERF_TP_L1_5_L2_COMPRESS_MISS"/>
+	<value value="44" name="A7XX_PERF_TP_L1_BANK_CONFLICT"/>
+	<value value="45" name="A7XX_PERF_TP_L1_5_MISS_LATENCY_CYCLES"/>
+	<value value="46" name="A7XX_PERF_TP_L1_5_MISS_LATENCY_TRANS"/>
+	<value value="47" name="A7XX_PERF_TP_QUADS_CONSTANT_MULTIPLIED"/>
+	<value value="48" name="A7XX_PERF_TP_FRONTEND_WORKING_CYCLES"/>
+	<value value="49" name="A7XX_PERF_TP_L1_TAG_WORKING_CYCLES"/>
+	<value value="50" name="A7XX_PERF_TP_L1_DATA_WRITE_WORKING_CYCLES"/>
+	<value value="51" name="A7XX_PERF_TP_PRE_L1_DECOM_WORKING_CYCLES"/>
+	<value value="52" name="A7XX_PERF_TP_BACKEND_WORKING_CYCLES"/>
+	<value value="53" name="A7XX_PERF_TP_L1_5_CACHE_WORKING_CYCLES"/>
+	<value value="54" name="A7XX_PERF_TP_STARVE_CYCLES_SP"/>
+	<value value="55" name="A7XX_PERF_TP_STARVE_CYCLES_UCHE"/>
+	<value value="56" name="A7XX_PERF_TP_STALL_CYCLES_UFC"/>
+	<value value="57" name="A7XX_PERF_TP_FORMAT_DECOMP"/>
+	<value value="58" name="A7XX_PERF_TP_FILTER_POINT_FP16"/>
+	<value value="59" name="A7XX_PERF_TP_FILTER_POINT_FP32"/>
+	<value value="60" name="A7XX_PERF_TP_LATENCY_FIFO_FULL"/>
+	<value value="61" name="A7XX_PERF_TP_RESERVED_61"/>
+	<value value="62" name="A7XX_PERF_TP_RESERVED_62"/>
+	<value value="63" name="A7XX_PERF_TP_RESERVED_63"/>
+	<value value="64" name="A7XX_PERF_TP_RESERVED_64"/>
+	<value value="65" name="A7XX_PERF_TP_RESERVED_65"/>
+	<value value="66" name="A7XX_PERF_TP_RESERVED_66"/>
+	<value value="67" name="A7XX_PERF_TP_RESERVED_67"/>
+	<value value="68" name="A7XX_PERF_TP_RESERVED_68"/>
+	<value value="69" name="A7XX_PERF_TP_RESERVED_69"/>
+	<value value="70" name="A7XX_PERF_TP_RESERVED_70"/>
+	<value value="71" name="A7XX_PERF_TP_RESERVED_71"/>
+	<value value="72" name="A7XX_PERF_TP_RESERVED_72"/>
+	<value value="73" name="A7XX_PERF_TP_RESERVED_73"/>
+	<value value="74" name="A7XX_PERF_TP_RESERVED_74"/>
+	<value value="75" name="A7XX_PERF_TP_RESERVED_75"/>
+	<value value="76" name="A7XX_PERF_TP_RESERVED_76"/>
+	<value value="77" name="A7XX_PERF_TP_RESERVED_77"/>
+	<value value="78" name="A7XX_PERF_TP_RESERVED_78"/>
+	<value value="79" name="A7XX_PERF_TP_RESERVED_79"/>
+	<value value="80" name="A7XX_PERF_TP_RESERVED_80"/>
+	<value value="81" name="A7XX_PERF_TP_RESERVED_81"/>
+	<value value="82" name="A7XX_PERF_TP_RESERVED_82"/>
+	<value value="83" name="A7XX_PERF_TP_RESERVED_83"/>
+	<value value="84" name="A7XX_PERF_TP_RESERVED_84"/>
+	<value value="85" name="A7XX_PERF_TP_RESERVED_85"/>
+	<value value="86" name="A7XX_PERF_TP_RESERVED_86"/>
+	<value value="87" name="A7XX_PERF_TP_RESERVED_87"/>
+	<value value="88" name="A7XX_PERF_TP_RESERVED_88"/>
+	<value value="89" name="A7XX_PERF_TP_RESERVED_89"/>
+	<value value="90" name="A7XX_PERF_TP_RESERVED_90"/>
+	<value value="91" name="A7XX_PERF_TP_RESERVED_91"/>
+	<value value="92" name="A7XX_PERF_TP_RESERVED_92"/>
+	<value value="93" name="A7XX_PERF_TP_RESERVED_93"/>
+	<value value="94" name="A7XX_PERF_TP_RESERVED_94"/>
+	<value value="95" name="A7XX_PERF_TP_RESERVED_95"/>
+	<value value="96" name="A7XX_PERF_TP_RESERVED_96"/>
+	<value value="97" name="A7XX_PERF_TP_RESERVED_97"/>
+	<value value="98" name="A7XX_PERF_TP_RESERVED_98"/>
+	<value value="99" name="A7XX_PERF_TP_RESERVED_99"/>
+	<value value="100" name="A7XX_PERF_TP_RESERVED_100"/>
+	<value value="101" name="A7XX_PERF_TP_RESERVED_101"/>
+	<value value="102" name="A7XX_PERF_TP_RESERVED_102"/>
+	<value value="103" name="A7XX_PERF_TP_RESERVED_103"/>
+	<value value="104" name="A7XX_PERF_TP_RESERVED_104"/>
+	<value value="105" name="A7XX_PERF_TP_RESERVED_105"/>
+	<value value="106" name="A7XX_PERF_TP_RESERVED_106"/>
+	<value value="107" name="A7XX_PERF_TP_RESERVED_107"/>
+	<value value="108" name="A7XX_PERF_TP_RESERVED_108"/>
+	<value value="109" name="A7XX_PERF_TP_RESERVED_109"/>
+	<value value="110" name="A7XX_PERF_TP_RESERVED_110"/>
+	<value value="111" name="A7XX_PERF_TP_RESERVED_111"/>
+	<value value="112" name="A7XX_PERF_TP_RESERVED_112"/>
+	<value value="113" name="A7XX_PERF_TP_RESERVED_113"/>
+	<value value="114" name="A7XX_PERF_TP_RESERVED_114"/>
+	<value value="115" name="A7XX_PERF_TP_RESERVED_115"/>
+	<value value="116" name="A7XX_PERF_TP_RESERVED_116"/>
+	<value value="117" name="A7XX_PERF_TP_RESERVED_117"/>
+	<value value="118" name="A7XX_PERF_TP_RESERVED_118"/>
+	<value value="119" name="A7XX_PERF_TP_RESERVED_119"/>
+	<value value="120" name="A7XX_PERF_TP_RESERVED_120"/>
+	<value value="121" name="A7XX_PERF_TP_RESERVED_121"/>
+	<value value="122" name="A7XX_PERF_TP_RESERVED_122"/>
+	<value value="123" name="A7XX_PERF_TP_RESERVED_123"/>
+	<value value="124" name="A7XX_PERF_TP_RESERVED_124"/>
+	<value value="125" name="A7XX_PERF_TP_RESERVED_125"/>
+	<value value="126" name="A7XX_PERF_TP_RESERVED_126"/>
+	<value value="127" name="A7XX_PERF_TP_RESERVED_127"/>
+	<value value="128" name="A7XX_PERF_TP_FORMAT_DECOMP_BILINEAR"/>
+	<value value="129" name="A7XX_PERF_TP_PACKED_POINT_BOTH_VALID_FP16"/>
+	<value value="130" name="A7XX_PERF_TP_PACKED_POINT_SINGLE_VALID_FP16"/>
+	<value value="131" name="A7XX_PERF_TP_PACKED_POINT_BOTH_VALID_FP32"/>
+	<value value="132" name="A7XX_PERF_TP_PACKED_POINT_SINGLE_VALID_FP32"/>
+</enum>
+
+<enum name="a7xx_sp_perfcounter_select">
+	<value value="0" name="A7XX_PERF_SP_BUSY_CYCLES"/>
+	<value value="1" name="A7XX_PERF_SP_ALU_WORKING_CYCLES"/>
+	<value value="2" name="A7XX_PERF_SP_EFU_WORKING_CYCLES"/>
+	<value value="3" name="A7XX_PERF_SP_STALL_CYCLES_VPC"/>
+	<value value="4" name="A7XX_PERF_SP_STALL_CYCLES_TP"/>
+	<value value="5" name="A7XX_PERF_SP_STALL_CYCLES_UCHE"/>
+	<value value="6" name="A7XX_PERF_SP_STALL_CYCLES_RB"/>
+	<value value="7" name="A7XX_PERF_SP_NON_EXECUTION_CYCLES"/>
+	<value value="8" name="A7XX_PERF_SP_WAVE_CONTEXTS"/>
+	<value value="9" name="A7XX_PERF_SP_WAVE_CONTEXT_CYCLES"/>
+	<value value="10" name="A7XX_PERF_SP_STAGE_WAVE_CYCLES"/>
+	<value value="11" name="A7XX_PERF_SP_STAGE_WAVE_SAMPLES"/>
+	<value value="12" name="A7XX_PERF_SP_VS_STAGE_WAVE_CYCLES"/>
+	<value value="13" name="A7XX_PERF_SP_VS_STAGE_WAVE_SAMPLES"/>
+	<value value="14" name="A7XX_PERF_SP_FS_STAGE_DURATION_CYCLES"/>
+	<value value="15" name="A7XX_PERF_SP_VS_STAGE_DURATION_CYCLES"/>
+	<value value="16" name="A7XX_PERF_SP_WAVE_CTRL_CYCLES"/>
+	<value value="17" name="A7XX_PERF_SP_WAVE_LOAD_CYCLES"/>
+	<value value="18" name="A7XX_PERF_SP_WAVE_EMIT_CYCLES"/>
+	<value value="19" name="A7XX_PERF_SP_WAVE_NOP_CYCLES"/>
+	<value value="20" name="A7XX_PERF_SP_WAVE_WAIT_CYCLES"/>
+	<value value="21" name="A7XX_PERF_SP_WAVE_FETCH_CYCLES"/>
+	<value value="22" name="A7XX_PERF_SP_WAVE_IDLE_CYCLES"/>
+	<value value="23" name="A7XX_PERF_SP_WAVE_END_CYCLES"/>
+	<value value="24" name="A7XX_PERF_SP_WAVE_LONG_SYNC_CYCLES"/>
+	<value value="25" name="A7XX_PERF_SP_WAVE_SHORT_SYNC_CYCLES"/>
+	<value value="26" name="A7XX_PERF_SP_WAVE_JOIN_CYCLES"/>
+	<value value="27" name="A7XX_PERF_SP_LM_LOAD_INSTRUCTIONS"/>
+	<value value="28" name="A7XX_PERF_SP_LM_STORE_INSTRUCTIONS"/>
+	<value value="29" name="A7XX_PERF_SP_LM_ATOMICS"/>
+	<value value="30" name="A7XX_PERF_SP_GM_LOAD_INSTRUCTIONS"/>
+	<value value="31" name="A7XX_PERF_SP_GM_STORE_INSTRUCTIONS"/>
+	<value value="32" name="A7XX_PERF_SP_GM_ATOMICS"/>
+	<value value="33" name="A7XX_PERF_SP_VS_STAGE_TEX_INSTRUCTIONS"/>
+	<value value="34" name="A7XX_PERF_SP_VS_STAGE_EFU_INSTRUCTIONS"/>
+	<value value="35" name="A7XX_PERF_SP_VS_STAGE_FULL_ALU_INSTRUCTIONS"/>
+	<value value="36" name="A7XX_PERF_SP_VS_STAGE_HALF_ALU_INSTRUCTIONS"/>
+	<value value="37" name="A7XX_PERF_SP_FS_STAGE_TEX_INSTRUCTIONS"/>
+	<value value="38" name="A7XX_PERF_SP_FS_STAGE_CFLOW_INSTRUCTIONS"/>
+	<value value="39" name="A7XX_PERF_SP_FS_STAGE_EFU_INSTRUCTIONS"/>
+	<value value="40" name="A7XX_PERF_SP_FS_STAGE_FULL_ALU_INSTRUCTIONS"/>
+	<value value="41" name="A7XX_PERF_SP_FS_STAGE_HALF_ALU_INSTRUCTIONS"/>
+	<value value="42" name="A7XX_PERF_SP_FS_STAGE_BARY_INSTRUCTIONS"/>
+	<value value="43" name="A7XX_PERF_SP_VS_INSTRUCTIONS"/>
+	<value value="44" name="A7XX_PERF_SP_FS_INSTRUCTIONS"/>
+	<value value="45" name="A7XX_PERF_SP_ADDR_LOCK_COUNT"/>
+	<value value="46" name="A7XX_PERF_SP_UCHE_READ_TRANS"/>
+	<value value="47" name="A7XX_PERF_SP_UCHE_WRITE_TRANS"/>
+	<value value="48" name="A7XX_PERF_SP_EXPORT_VPC_TRANS"/>
+	<value value="49" name="A7XX_PERF_SP_EXPORT_RB_TRANS"/>
+	<value value="50" name="A7XX_PERF_SP_PIXELS_KILLED"/>
+	<value value="51" name="A7XX_PERF_SP_ICL1_REQUESTS"/>
+	<value value="52" name="A7XX_PERF_SP_ICL1_MISSES"/>
+	<value value="53" name="A7XX_PERF_SP_HS_INSTRUCTIONS"/>
+	<value value="54" name="A7XX_PERF_SP_DS_INSTRUCTIONS"/>
+	<value value="55" name="A7XX_PERF_SP_GS_INSTRUCTIONS"/>
+	<value value="56" name="A7XX_PERF_SP_CS_INSTRUCTIONS"/>
+	<value value="57" name="A7XX_PERF_SP_GPR_READ"/>
+	<value value="58" name="A7XX_PERF_SP_GPR_WRITE"/>
+	<value value="59" name="A7XX_PERF_SP_FS_STAGE_HALF_EFU_INSTRUCTIONS"/>
+	<value value="60" name="A7XX_PERF_SP_VS_STAGE_HALF_EFU_INSTRUCTIONS"/>
+	<value value="61" name="A7XX_PERF_SP_LM_BANK_CONFLICTS"/>
+	<value value="62" name="A7XX_PERF_SP_TEX_CONTROL_WORKING_CYCLES"/>
+	<value value="63" name="A7XX_PERF_SP_LOAD_CONTROL_WORKING_CYCLES"/>
+	<value value="64" name="A7XX_PERF_SP_FLOW_CONTROL_WORKING_CYCLES"/>
+	<value value="65" name="A7XX_PERF_SP_LM_WORKING_CYCLES"/>
+	<value value="66" name="A7XX_PERF_SP_DISPATCHER_WORKING_CYCLES"/>
+	<value value="67" name="A7XX_PERF_SP_SEQUENCER_WORKING_CYCLES"/>
+	<value value="68" name="A7XX_PERF_SP_LOW_EFFICIENCY_STARVED_BY_TP"/>
+	<value value="69" name="A7XX_PERF_SP_STARVE_CYCLES_HLSQ"/>
+	<value value="70" name="A7XX_PERF_SP_NON_EXECUTION_LS_CYCLES"/>
+	<value value="71" name="A7XX_PERF_SP_WORKING_EU"/>
+	<value value="72" name="A7XX_PERF_SP_ANY_EU_WORKING"/>
+	<value value="73" name="A7XX_PERF_SP_WORKING_EU_FS_STAGE"/>
+	<value value="74" name="A7XX_PERF_SP_ANY_EU_WORKING_FS_STAGE"/>
+	<value value="75" name="A7XX_PERF_SP_WORKING_EU_VS_STAGE"/>
+	<value value="76" name="A7XX_PERF_SP_ANY_EU_WORKING_VS_STAGE"/>
+	<value value="77" name="A7XX_PERF_SP_WORKING_EU_CS_STAGE"/>
+	<value value="78" name="A7XX_PERF_SP_ANY_EU_WORKING_CS_STAGE"/>
+	<value value="79" name="A7XX_PERF_SP_GPR_READ_PREFETCH"/>
+	<value value="80" name="A7XX_PERF_SP_GPR_READ_CONFLICT"/>
+	<value value="81" name="A7XX_PERF_SP_GPR_WRITE_CONFLICT"/>
+	<value value="82" name="A7XX_PERF_SP_GM_LOAD_LATENCY_CYCLES"/>
+	<value value="83" name="A7XX_PERF_SP_GM_LOAD_LATENCY_SAMPLES"/>
+	<value value="84" name="A7XX_PERF_SP_EXECUTABLE_WAVES"/>
+	<value value="85" name="A7XX_PERF_SP_ICL1_MISS_FETCH_CYCLES"/>
+	<value value="86" name="A7XX_PERF_SP_WORKING_EU_LPAC"/>
+	<value value="87" name="A7XX_PERF_SP_BYPASS_BUSY_CYCLES"/>
+	<value value="88" name="A7XX_PERF_SP_ANY_EU_WORKING_LPAC"/>
+	<value value="89" name="A7XX_PERF_SP_WAVE_ALU_CYCLES"/>
+	<value value="90" name="A7XX_PERF_SP_WAVE_EFU_CYCLES"/>
+	<value value="91" name="A7XX_PERF_SP_WAVE_INT_CYCLES"/>
+	<value value="92" name="A7XX_PERF_SP_WAVE_CSP_CYCLES"/>
+	<value value="93" name="A7XX_PERF_SP_EWAVE_CONTEXTS"/>
+	<value value="94" name="A7XX_PERF_SP_EWAVE_CONTEXT_CYCLES"/>
+	<value value="95" name="A7XX_PERF_SP_LPAC_BUSY_CYCLES"/>
+	<value value="96" name="A7XX_PERF_SP_LPAC_INSTRUCTIONS"/>
+	<value value="97" name="A7XX_PERF_SP_FS_STAGE_1X_WAVES"/>
+	<value value="98" name="A7XX_PERF_SP_FS_STAGE_2X_WAVES"/>
+	<value value="99" name="A7XX_PERF_SP_QUADS"/>
+	<value value="100" name="A7XX_PERF_SP_CS_INVOCATIONS"/>
+	<value value="101" name="A7XX_PERF_SP_PIXELS"/>
+	<value value="102" name="A7XX_PERF_SP_LPAC_DRAWCALLS"/>
+	<value value="103" name="A7XX_PERF_SP_PI_WORKING_CYCLES"/>
+	<value value="104" name="A7XX_PERF_SP_WAVE_INPUT_CYCLES"/>
+	<value value="105" name="A7XX_PERF_SP_WAVE_OUTPUT_CYCLES"/>
+	<value value="106" name="A7XX_PERF_SP_WAVE_HWAVE_WAIT_CYCLES"/>
+	<value value="107" name="A7XX_PERF_SP_WAVE_HWAVE_SYNC"/>
+	<value value="108" name="A7XX_PERF_SP_OUTPUT_3D_PIXELS"/>
+	<value value="109" name="A7XX_PERF_SP_FULL_ALU_MAD_INSTRUCTIONS"/>
+	<value value="110" name="A7XX_PERF_SP_HALF_ALU_MAD_INSTRUCTIONS"/>
+	<value value="111" name="A7XX_PERF_SP_FULL_ALU_MUL_INSTRUCTIONS"/>
+	<value value="112" name="A7XX_PERF_SP_HALF_ALU_MUL_INSTRUCTIONS"/>
+	<value value="113" name="A7XX_PERF_SP_FULL_ALU_ADD_INSTRUCTIONS"/>
+	<value value="114" name="A7XX_PERF_SP_HALF_ALU_ADD_INSTRUCTIONS"/>
+	<value value="115" name="A7XX_PERF_SP_BARY_FP32_INSTRUCTIONS"/>
+	<value value="116" name="A7XX_PERF_SP_ALU_GPR_READ_CYCLES"/>
+	<value value="117" name="A7XX_PERF_SP_ALU_DATA_FORWARDING_CYCLES"/>
+	<value value="118" name="A7XX_PERF_SP_LM_FULL_CYCLES"/>
+	<value value="119" name="A7XX_PERF_SP_TEXTURE_FETCH_LATENCY_CYCLES"/>
+	<value value="120" name="A7XX_PERF_SP_TEXTURE_FETCH_LATENCY_SAMPLES"/>
+	<value value="121" name="A7XX_PERF_SP_FS_STAGE_PI_TEX_INSTRUCTION"/>
+	<value value="122" name="A7XX_PERF_SP_RAY_QUERY_INSTRUCTIONS"/>
+	<value value="123" name="A7XX_PERF_SP_RBRT_KICKOFF_FIBERS"/>
+	<value value="124" name="A7XX_PERF_SP_RBRT_KICKOFF_DQUADS"/>
+	<value value="125" name="A7XX_PERF_SP_RTU_BUSY_CYCLES"/>
+	<value value="126" name="A7XX_PERF_SP_RTU_L0_HITS"/>
+	<value value="127" name="A7XX_PERF_SP_RTU_L0_MISSES"/>
+	<value value="128" name="A7XX_PERF_SP_RTU_L0_HIT_ON_MISS"/>
+	<value value="129" name="A7XX_PERF_SP_RTU_STALL_CYCLES_WAVE_QUEUE"/>
+	<value value="130" name="A7XX_PERF_SP_RTU_STALL_CYCLES_L0_HIT_QUEUE"/>
+	<value value="131" name="A7XX_PERF_SP_RTU_STALL_CYCLES_L0_MISS_QUEUE"/>
+	<value value="132" name="A7XX_PERF_SP_RTU_STALL_CYCLES_L0D_IDX_QUEUE"/>
+	<value value="133" name="A7XX_PERF_SP_RTU_STALL_CYCLES_L0DATA"/>
+	<value value="134" name="A7XX_PERF_SP_RTU_STALL_CYCLES_REPLACE_CNT"/>
+	<value value="135" name="A7XX_PERF_SP_RTU_STALL_CYCLES_MRG_CNT"/>
+	<value value="136" name="A7XX_PERF_SP_RTU_STALL_CYCLES_UCHE"/>
+	<value value="137" name="A7XX_PERF_SP_RTU_OPERAND_FETCH_STALL_CYCLES_L0"/>
+	<value value="138" name="A7XX_PERF_SP_RTU_OPERAND_FETCH_STALL_CYCLES_INS_FIFO"/>
+	<value value="139" name="A7XX_PERF_SP_RTU_BVH_FETCH_LATENCY_CYCLES"/>
+	<value value="140" name="A7XX_PERF_SP_RTU_BVH_FETCH_LATENCY_SAMPLES"/>
+	<value value="141" name="A7XX_PERF_SP_STCHE_MISS_INC_VS"/>
+	<value value="142" name="A7XX_PERF_SP_STCHE_MISS_INC_FS"/>
+	<value value="143" name="A7XX_PERF_SP_STCHE_MISS_INC_BV"/>
+	<value value="144" name="A7XX_PERF_SP_STCHE_MISS_INC_LPAC"/>
+	<value value="145" name="A7XX_PERF_SP_VGPR_ACTIVE_CONTEXTS"/>
+	<value value="146" name="A7XX_PERF_SP_PGPR_ALLOC_CONTEXTS"/>
+	<value value="147" name="A7XX_PERF_SP_VGPR_ALLOC_CONTEXTS"/>
+	<value value="148" name="A7XX_PERF_SP_RTU_RAY_BOX_INTERSECTIONS"/>
+	<value value="149" name="A7XX_PERF_SP_RTU_RAY_TRIANGLE_INTERSECTIONS"/>
+	<value value="150" name="A7XX_PERF_SP_SCH_STALL_CYCLES_RTU"/>
+</enum>
+
+<enum name="a7xx_rb_perfcounter_select">
+	<value value="0" name="A7XX_PERF_RB_BUSY_CYCLES"/>
+	<value value="1" name="A7XX_PERF_RB_STALL_CYCLES_HLSQ"/>
+	<value value="2" name="A7XX_PERF_RB_STALL_CYCLES_FIFO0_FULL"/>
+	<value value="3" name="A7XX_PERF_RB_STALL_CYCLES_FIFO1_FULL"/>
+	<value value="4" name="A7XX_PERF_RB_STALL_CYCLES_FIFO2_FULL"/>
+	<value value="5" name="A7XX_PERF_RB_STARVE_CYCLES_SP"/>
+	<value value="6" name="A7XX_PERF_RB_STARVE_CYCLES_LRZ_TILE"/>
+	<value value="7" name="A7XX_PERF_RB_STARVE_CYCLES_CCU"/>
+	<value value="8" name="A7XX_PERF_RB_STARVE_CYCLES_Z_PLANE"/>
+	<value value="9" name="A7XX_PERF_RB_STARVE_CYCLES_BARY_PLANE"/>
+	<value value="10" name="A7XX_PERF_RB_Z_WORKLOAD"/>
+	<value value="11" name="A7XX_PERF_RB_HLSQ_ACTIVE"/>
+	<value value="12" name="A7XX_PERF_RB_Z_READ"/>
+	<value value="13" name="A7XX_PERF_RB_Z_WRITE"/>
+	<value value="14" name="A7XX_PERF_RB_C_READ"/>
+	<value value="15" name="A7XX_PERF_RB_C_WRITE"/>
+	<value value="16" name="A7XX_PERF_RB_TOTAL_PASS"/>
+	<value value="17" name="A7XX_PERF_RB_Z_PASS"/>
+	<value value="18" name="A7XX_PERF_RB_Z_FAIL"/>
+	<value value="19" name="A7XX_PERF_RB_S_FAIL"/>
+	<value value="20" name="A7XX_PERF_RB_BLENDED_FXP_COMPONENTS"/>
+	<value value="21" name="A7XX_PERF_RB_BLENDED_FP16_COMPONENTS"/>
+	<value value="22" name="A7XX_PERF_RB_PS_INVOCATIONS"/>
+	<value value="23" name="A7XX_PERF_RB_2D_ALIVE_CYCLES"/>
+	<value value="24" name="A7XX_PERF_RB_2D_STALL_CYCLES_A2D"/>
+	<value value="25" name="A7XX_PERF_RB_2D_STARVE_CYCLES_SRC"/>
+	<value value="26" name="A7XX_PERF_RB_2D_STARVE_CYCLES_SP"/>
+	<value value="27" name="A7XX_PERF_RB_2D_STARVE_CYCLES_DST"/>
+	<value value="28" name="A7XX_PERF_RB_2D_VALID_PIXELS"/>
+	<value value="29" name="A7XX_PERF_RB_3D_PIXELS"/>
+	<value value="30" name="A7XX_PERF_RB_BLENDER_WORKING_CYCLES"/>
+	<value value="31" name="A7XX_PERF_RB_ZPROC_WORKING_CYCLES"/>
+	<value value="32" name="A7XX_PERF_RB_CPROC_WORKING_CYCLES"/>
+	<value value="33" name="A7XX_PERF_RB_SAMPLER_WORKING_CYCLES"/>
+	<value value="34" name="A7XX_PERF_RB_STALL_CYCLES_CCU_COLOR_READ"/>
+	<value value="35" name="A7XX_PERF_RB_STALL_CYCLES_CCU_COLOR_WRITE"/>
+	<value value="36" name="A7XX_PERF_RB_STALL_CYCLES_CCU_DEPTH_READ"/>
+	<value value="37" name="A7XX_PERF_RB_STALL_CYCLES_CCU_DEPTH_WRITE"/>
+	<value value="38" name="A7XX_PERF_RB_STALL_CYCLES_VPC"/>
+	<value value="39" name="A7XX_PERF_RB_2D_INPUT_TRANS"/>
+	<value value="40" name="A7XX_PERF_RB_2D_OUTPUT_RB_DST_TRANS"/>
+	<value value="41" name="A7XX_PERF_RB_2D_OUTPUT_RB_SRC_TRANS"/>
+	<value value="42" name="A7XX_PERF_RB_BLENDED_FP32_COMPONENTS"/>
+	<value value="43" name="A7XX_PERF_RB_COLOR_PIX_TILES"/>
+	<value value="44" name="A7XX_PERF_RB_STALL_CYCLES_CCU"/>
+	<value value="45" name="A7XX_PERF_RB_EARLY_Z_ARB3_GRANT"/>
+	<value value="46" name="A7XX_PERF_RB_LATE_Z_ARB3_GRANT"/>
+	<value value="47" name="A7XX_PERF_RB_EARLY_Z_SKIP_GRANT"/>
+	<value value="48" name="A7XX_PERF_RB_VRS_1x1_QUADS"/>
+	<value value="49" name="A7XX_PERF_RB_VRS_2x1_QUADS"/>
+	<value value="50" name="A7XX_PERF_RB_VRS_1x2_QUADS"/>
+	<value value="51" name="A7XX_PERF_RB_VRS_2x2_QUADS"/>
+	<value value="52" name="A7XX_PERF_RB_VRS_4x2_QUADS"/>
+	<value value="53" name="A7XX_PERF_RB_VRS_4x4_QUADS"/>
+</enum>
+
+<enum name="a7xx_vsc_perfcounter_select">
+	<value value="0" name="A7XX_PERF_VSC_BUSY_CYCLES"/>
+	<value value="1" name="A7XX_PERF_VSC_WORKING_CYCLES"/>
+	<value value="2" name="A7XX_PERF_VSC_STALL_CYCLES_UCHE"/>
+	<value value="3" name="A7XX_PERF_VSC_EOT_NUM"/>
+	<value value="4" name="A7XX_PERF_VSC_INPUT_TILES"/>
+</enum>
+
+<enum name="a7xx_ccu_perfcounter_select">
+	<value value="0" name="A7XX_PERF_CCU_BUSY_CYCLES"/>
+	<value value="1" name="A7XX_PERF_CCU_STALL_CYCLES_RB_DEPTH_RETURN"/>
+	<value value="2" name="A7XX_PERF_CCU_STALL_CYCLES_RB_COLOR_RETURN"/>
+	<value value="3" name="A7XX_PERF_CCU_DEPTH_BLOCKS"/>
+	<value value="4" name="A7XX_PERF_CCU_COLOR_BLOCKS"/>
+	<value value="5" name="A7XX_PERF_CCU_DEPTH_BLOCK_HIT"/>
+	<value value="6" name="A7XX_PERF_CCU_COLOR_BLOCK_HIT"/>
+	<value value="7" name="A7XX_PERF_CCU_PARTIAL_BLOCK_READ"/>
+	<value value="8" name="A7XX_PERF_CCU_GMEM_READ"/>
+	<value value="9" name="A7XX_PERF_CCU_GMEM_WRITE"/>
+	<value value="10" name="A7XX_PERF_CCU_2D_RD_REQ"/>
+	<value value="11" name="A7XX_PERF_CCU_2D_WR_REQ"/>
+	<value value="12" name="A7XX_PERF_CCU_UBWC_COLOR_BLOCKS_CONCURRENT"/>
+	<value value="13" name="A7XX_PERF_CCU_UBWC_DEPTH_BLOCKS_CONCURRENT"/>
+	<value value="14" name="A7XX_PERF_CCU_COLOR_RESOLVE_DROPPED"/>
+	<value value="15" name="A7XX_PERF_CCU_DEPTH_RESOLVE_DROPPED"/>
+	<value value="16" name="A7XX_PERF_CCU_COLOR_RENDER_CONCURRENT"/>
+	<value value="17" name="A7XX_PERF_CCU_DEPTH_RENDER_CONCURRENT"/>
+	<value value="18" name="A7XX_PERF_CCU_COLOR_RESOLVE_AFTER_RENDER"/>
+	<value value="19" name="A7XX_PERF_CCU_DEPTH_RESOLVE_AFTER_RENDER"/>
+	<value value="20" name="A7XX_PERF_CCU_GMEM_EXTRA_DEPTH_READ"/>
+	<value value="21" name="A7XX_PERF_CCU_GMEM_COLOR_READ_4AA"/>
+	<value value="22" name="A7XX_PERF_CCU_GMEM_COLOR_READ_4AA_FULL"/>
+</enum>
+
+<enum name="a7xx_lrz_perfcounter_select">
+	<value value="0" name="A7XX_PERF_LRZ_BUSY_CYCLES"/>
+	<value value="1" name="A7XX_PERF_LRZ_STARVE_CYCLES_RAS"/>
+	<value value="2" name="A7XX_PERF_LRZ_STALL_CYCLES_RB"/>
+	<value value="3" name="A7XX_PERF_LRZ_STALL_CYCLES_VSC"/>
+	<value value="4" name="A7XX_PERF_LRZ_STALL_CYCLES_VPC"/>
+	<value value="5" name="A7XX_PERF_LRZ_STALL_CYCLES_FLAG_PREFETCH"/>
+	<value value="6" name="A7XX_PERF_LRZ_STALL_CYCLES_UCHE"/>
+	<value value="7" name="A7XX_PERF_LRZ_LRZ_READ"/>
+	<value value="8" name="A7XX_PERF_LRZ_LRZ_WRITE"/>
+	<value value="9" name="A7XX_PERF_LRZ_READ_LATENCY"/>
+	<value value="10" name="A7XX_PERF_LRZ_MERGE_CACHE_UPDATING"/>
+	<value value="11" name="A7XX_PERF_LRZ_PRIM_KILLED_BY_MASKGEN"/>
+	<value value="12" name="A7XX_PERF_LRZ_PRIM_KILLED_BY_LRZ"/>
+	<value value="13" name="A7XX_PERF_LRZ_VISIBLE_PRIM_AFTER_LRZ"/>
+	<value value="14" name="A7XX_PERF_LRZ_FULL_8X8_TILES"/>
+	<value value="15" name="A7XX_PERF_LRZ_PARTIAL_8X8_TILES"/>
+	<value value="16" name="A7XX_PERF_LRZ_TILE_KILLED"/>
+	<value value="17" name="A7XX_PERF_LRZ_TOTAL_PIXEL"/>
+	<value value="18" name="A7XX_PERF_LRZ_VISIBLE_PIXEL_AFTER_LRZ"/>
+	<value value="19" name="A7XX_PERF_LRZ_FEEDBACK_ACCEPT"/>
+	<value value="20" name="A7XX_PERF_LRZ_FEEDBACK_DISCARD"/>
+	<value value="21" name="A7XX_PERF_LRZ_FEEDBACK_STALL"/>
+	<value value="22" name="A7XX_PERF_LRZ_STALL_CYCLES_RB_ZPLANE"/>
+	<value value="23" name="A7XX_PERF_LRZ_STALL_CYCLES_RB_BPLANE"/>
+	<value value="24" name="A7XX_PERF_LRZ_RAS_MASK_TRANS"/>
+	<value value="25" name="A7XX_PERF_LRZ_STALL_CYCLES_MVC"/>
+	<value value="26" name="A7XX_PERF_LRZ_TILE_KILLED_BY_IMAGE_VRS"/>
+	<value value="27" name="A7XX_PERF_LRZ_TILE_KILLED_BY_Z"/>
+</enum>
+
+<enum name="a7xx_cmp_perfcounter_select">
+	<value value="0" name="A7XX_PERF_CMPDECMP_STALL_CYCLES_ARB"/>
+	<value value="1" name="A7XX_PERF_CMPDECMP_VBIF_LATENCY_CYCLES"/>
+	<value value="2" name="A7XX_PERF_CMPDECMP_VBIF_LATENCY_SAMPLES"/>
+	<value value="3" name="A7XX_PERF_CMPDECMP_VBIF_READ_DATA_CCU"/>
+	<value value="4" name="A7XX_PERF_CMPDECMP_VBIF_WRITE_DATA_CCU"/>
+	<value value="5" name="A7XX_PERF_CMPDECMP_VBIF_READ_REQUEST"/>
+	<value value="6" name="A7XX_PERF_CMPDECMP_VBIF_WRITE_REQUEST"/>
+	<value value="7" name="A7XX_PERF_CMPDECMP_VBIF_READ_DATA"/>
+	<value value="8" name="A7XX_PERF_CMPDECMP_VBIF_WRITE_DATA"/>
+	<value value="9" name="A7XX_PERF_CMPDECMP_DEPTH_WRITE_FLAG1_COUNT"/>
+	<value value="10" name="A7XX_PERF_CMPDECMP_DEPTH_WRITE_FLAG2_COUNT"/>
+	<value value="11" name="A7XX_PERF_CMPDECMP_DEPTH_WRITE_FLAG3_COUNT"/>
+	<value value="12" name="A7XX_PERF_CMPDECMP_DEPTH_WRITE_FLAG4_COUNT"/>
+	<value value="13" name="A7XX_PERF_CMPDECMP_DEPTH_WRITE_FLAG5_COUNT"/>
+	<value value="14" name="A7XX_PERF_CMPDECMP_DEPTH_WRITE_FLAG6_COUNT"/>
+	<value value="15" name="A7XX_PERF_CMPDECMP_DEPTH_WRITE_FLAG8_COUNT"/>
+	<value value="16" name="A7XX_PERF_CMPDECMP_COLOR_WRITE_FLAG1_COUNT"/>
+	<value value="17" name="A7XX_PERF_CMPDECMP_COLOR_WRITE_FLAG2_COUNT"/>
+	<value value="18" name="A7XX_PERF_CMPDECMP_COLOR_WRITE_FLAG3_COUNT"/>
+	<value value="19" name="A7XX_PERF_CMPDECMP_COLOR_WRITE_FLAG4_COUNT"/>
+	<value value="20" name="A7XX_PERF_CMPDECMP_COLOR_WRITE_FLAG5_COUNT"/>
+	<value value="21" name="A7XX_PERF_CMPDECMP_COLOR_WRITE_FLAG6_COUNT"/>
+	<value value="22" name="A7XX_PERF_CMPDECMP_COLOR_WRITE_FLAG8_COUNT"/>
+	<value value="23" name="A7XX_PERF_CMPDECMP_VBIF_READ_DATA_UCHE_CH0"/>
+	<value value="24" name="A7XX_PERF_CMPDECMP_VBIF_READ_DATA_UCHE_CH1"/>
+	<value value="25" name="A7XX_PERF_CMPDECMP_VBIF_WRITE_DATA_UCHE"/>
+	<value value="26" name="A7XX_PERF_CMPDECMP_DEPTH_WRITE_FLAG0_COUNT"/>
+	<value value="27" name="A7XX_PERF_CMPDECMP_COLOR_WRITE_FLAG0_COUNT"/>
+	<value value="28" name="A7XX_PERF_CMPDECMP_COLOR_WRITE_FLAGALPHA_COUNT"/>
+	<value value="29" name="A7XX_PERF_CMPDECMP_RESOLVE_EVENTS"/>
+	<value value="30" name="A7XX_PERF_CMPDECMP_CONCURRENT_RESOLVE_EVENTS"/>
+	<value value="31" name="A7XX_PERF_CMPDECMP_DROPPED_CLEAR_EVENTS"/>
+	<value value="32" name="A7XX_PERF_CMPDECMP_ST_BLOCKS_CONCURRENT"/>
+	<value value="33" name="A7XX_PERF_CMPDECMP_LRZ_ST_BLOCKS_CONCURRENT"/>
+	<value value="34" name="A7XX_PERF_CMPDECMP_DEPTH_READ_FLAG0_COUNT"/>
+	<value value="35" name="A7XX_PERF_CMPDECMP_DEPTH_READ_FLAG1_COUNT"/>
+	<value value="36" name="A7XX_PERF_CMPDECMP_DEPTH_READ_FLAG2_COUNT"/>
+	<value value="37" name="A7XX_PERF_CMPDECMP_DEPTH_READ_FLAG3_COUNT"/>
+	<value value="38" name="A7XX_PERF_CMPDECMP_DEPTH_READ_FLAG4_COUNT"/>
+	<value value="39" name="A7XX_PERF_CMPDECMP_DEPTH_READ_FLAG5_COUNT"/>
+	<value value="40" name="A7XX_PERF_CMPDECMP_DEPTH_READ_FLAG6_COUNT"/>
+	<value value="41" name="A7XX_PERF_CMPDECMP_DEPTH_READ_FLAG8_COUNT"/>
+	<value value="42" name="A7XX_PERF_CMPDECMP_COLOR_READ_FLAG0_COUNT"/>
+	<value value="43" name="A7XX_PERF_CMPDECMP_COLOR_READ_FLAG1_COUNT"/>
+	<value value="44" name="A7XX_PERF_CMPDECMP_COLOR_READ_FLAG2_COUNT"/>
+	<value value="45" name="A7XX_PERF_CMPDECMP_COLOR_READ_FLAG3_COUNT"/>
+	<value value="46" name="A7XX_PERF_CMPDECMP_COLOR_READ_FLAG4_COUNT"/>
+	<value value="47" name="A7XX_PERF_CMPDECMP_COLOR_READ_FLAG5_COUNT"/>
+	<value value="48" name="A7XX_PERF_CMPDECMP_COLOR_READ_FLAG6_COUNT"/>
+	<value value="49" name="A7XX_PERF_CMPDECMP_COLOR_READ_FLAG8_COUNT"/>
+</enum>
+
+<enum name="a7xx_gbif_perfcounter_select">
+	<value value="0" name="A7XX_PERF_GBIF_RESERVED_0"/>
+	<value value="1" name="A7XX_PERF_GBIF_RESERVED_1"/>
+	<value value="2" name="A7XX_PERF_GBIF_RESERVED_2"/>
+	<value value="3" name="A7XX_PERF_GBIF_RESERVED_3"/>
+	<value value="4" name="A7XX_PERF_GBIF_RESERVED_4"/>
+	<value value="5" name="A7XX_PERF_GBIF_RESERVED_5"/>
+	<value value="6" name="A7XX_PERF_GBIF_RESERVED_6"/>
+	<value value="7" name="A7XX_PERF_GBIF_RESERVED_7"/>
+	<value value="8" name="A7XX_PERF_GBIF_RESERVED_8"/>
+	<value value="9" name="A7XX_PERF_GBIF_RESERVED_9"/>
+	<value value="10" name="A7XX_PERF_GBIF_AXI0_READ_REQUESTS_TOTAL"/>
+	<value value="11" name="A7XX_PERF_GBIF_AXI1_READ_REQUESTS_TOTAL"/>
+	<value value="12" name="A7XX_PERF_GBIF_RESERVED_12"/>
+	<value value="13" name="A7XX_PERF_GBIF_RESERVED_13"/>
+	<value value="14" name="A7XX_PERF_GBIF_RESERVED_14"/>
+	<value value="15" name="A7XX_PERF_GBIF_RESERVED_15"/>
+	<value value="16" name="A7XX_PERF_GBIF_RESERVED_16"/>
+	<value value="17" name="A7XX_PERF_GBIF_RESERVED_17"/>
+	<value value="18" name="A7XX_PERF_GBIF_RESERVED_18"/>
+	<value value="19" name="A7XX_PERF_GBIF_RESERVED_19"/>
+	<value value="20" name="A7XX_PERF_GBIF_RESERVED_20"/>
+	<value value="21" name="A7XX_PERF_GBIF_RESERVED_21"/>
+	<value value="22" name="A7XX_PERF_GBIF_AXI0_WRITE_REQUESTS_TOTAL"/>
+	<value value="23" name="A7XX_PERF_GBIF_AXI1_WRITE_REQUESTS_TOTAL"/>
+	<value value="24" name="A7XX_PERF_GBIF_RESERVED_24"/>
+	<value value="25" name="A7XX_PERF_GBIF_RESERVED_25"/>
+	<value value="26" name="A7XX_PERF_GBIF_RESERVED_26"/>
+	<value value="27" name="A7XX_PERF_GBIF_RESERVED_27"/>
+	<value value="28" name="A7XX_PERF_GBIF_RESERVED_28"/>
+	<value value="29" name="A7XX_PERF_GBIF_RESERVED_29"/>
+	<value value="30" name="A7XX_PERF_GBIF_RESERVED_30"/>
+	<value value="31" name="A7XX_PERF_GBIF_RESERVED_31"/>
+	<value value="32" name="A7XX_PERF_GBIF_RESERVED_32"/>
+	<value value="33" name="A7XX_PERF_GBIF_RESERVED_33"/>
+	<value value="34" name="A7XX_PERF_GBIF_AXI0_READ_DATA_BEATS_TOTAL"/>
+	<value value="35" name="A7XX_PERF_GBIF_AXI1_READ_DATA_BEATS_TOTAL"/>
+	<value value="36" name="A7XX_PERF_GBIF_RESERVED_36"/>
+	<value value="37" name="A7XX_PERF_GBIF_RESERVED_37"/>
+	<value value="38" name="A7XX_PERF_GBIF_RESERVED_38"/>
+	<value value="39" name="A7XX_PERF_GBIF_RESERVED_39"/>
+	<value value="40" name="A7XX_PERF_GBIF_RESERVED_40"/>
+	<value value="41" name="A7XX_PERF_GBIF_RESERVED_41"/>
+	<value value="42" name="A7XX_PERF_GBIF_RESERVED_42"/>
+	<value value="43" name="A7XX_PERF_GBIF_RESERVED_43"/>
+	<value value="44" name="A7XX_PERF_GBIF_RESERVED_44"/>
+	<value value="45" name="A7XX_PERF_GBIF_RESERVED_45"/>
+	<value value="46" name="A7XX_PERF_GBIF_AXI0_WRITE_DATA_BEATS_TOTAL"/>
+	<value value="47" name="A7XX_PERF_GBIF_AXI1_WRITE_DATA_BEATS_TOTAL"/>
+	<value value="48" name="A7XX_PERF_GBIF_RESERVED_48"/>
+	<value value="49" name="A7XX_PERF_GBIF_RESERVED_49"/>
+	<value value="50" name="A7XX_PERF_GBIF_RESERVED_50"/>
+	<value value="51" name="A7XX_PERF_GBIF_RESERVED_51"/>
+	<value value="52" name="A7XX_PERF_GBIF_RESERVED_52"/>
+	<value value="53" name="A7XX_PERF_GBIF_RESERVED_53"/>
+	<value value="54" name="A7XX_PERF_GBIF_RESERVED_54"/>
+	<value value="55" name="A7XX_PERF_GBIF_RESERVED_55"/>
+	<value value="56" name="A7XX_PERF_GBIF_RESERVED_56"/>
+	<value value="57" name="A7XX_PERF_GBIF_RESERVED_57"/>
+	<value value="58" name="A7XX_PERF_GBIF_RESERVED_58"/>
+	<value value="59" name="A7XX_PERF_GBIF_RESERVED_59"/>
+	<value value="60" name="A7XX_PERF_GBIF_RESERVED_60"/>
+	<value value="61" name="A7XX_PERF_GBIF_RESERVED_61"/>
+	<value value="62" name="A7XX_PERF_GBIF_RESERVED_62"/>
+	<value value="63" name="A7XX_PERF_GBIF_RESERVED_63"/>
+	<value value="64" name="A7XX_PERF_GBIF_RESERVED_64"/>
+	<value value="65" name="A7XX_PERF_GBIF_RESERVED_65"/>
+	<value value="66" name="A7XX_PERF_GBIF_RESERVED_66"/>
+	<value value="67" name="A7XX_PERF_GBIF_RESERVED_67"/>
+	<value value="68" name="A7XX_PERF_GBIF_CYCLES_CH0_HELD_OFF_RD_ALL"/>
+	<value value="69" name="A7XX_PERF_GBIF_CYCLES_CH1_HELD_OFF_RD_ALL"/>
+	<value value="70" name="A7XX_PERF_GBIF_CYCLES_CH0_HELD_OFF_WR_ALL"/>
+	<value value="71" name="A7XX_PERF_GBIF_CYCLES_CH1_HELD_OFF_WR_ALL"/>
+	<value value="72" name="A7XX_PERF_GBIF_AXI_CH0_REQUEST_HELD_OFF"/>
+	<value value="73" name="A7XX_PERF_GBIF_AXI_CH1_REQUEST_HELD_OFF"/>
+	<value value="74" name="A7XX_PERF_GBIF_AXI_REQUEST_HELD_OFF"/>
+	<value value="75" name="A7XX_PERF_GBIF_AXI_CH0_WRITE_DATA_HELD_OFF"/>
+	<value value="76" name="A7XX_PERF_GBIF_AXI_CH1_WRITE_DATA_HELD_OFF"/>
+	<value value="77" name="A7XX_PERF_GBIF_AXI_ALL_WRITE_DATA_HELD_OFF"/>
+	<value value="78" name="A7XX_PERF_GBIF_AXI_ALL_READ_BEATS"/>
+	<value value="79" name="A7XX_PERF_GBIF_AXI_ALL_WRITE_BEATS"/>
+	<value value="80" name="A7XX_PERF_GBIF_AXI_ALL_BEATS"/>
+</enum>
+
+<enum name="a7xx_ufc_perfcounter_select">
+	<value value="0" name="A7XX_PERF_UFC_BUSY_CYCLES"/>
+	<value value="1" name="A7XX_PERF_UFC_READ_DATA_VBIF"/>
+	<value value="2" name="A7XX_PERF_UFC_WRITE_DATA_VBIF"/>
+	<value value="3" name="A7XX_PERF_UFC_READ_REQUEST_VBIF"/>
+	<value value="4" name="A7XX_PERF_UFC_WRITE_REQUEST_VBIF"/>
+	<value value="5" name="A7XX_PERF_UFC_LRZ_FILTER_HIT"/>
+	<value value="6" name="A7XX_PERF_UFC_LRZ_FILTER_MISS"/>
+	<value value="7" name="A7XX_PERF_UFC_CRE_FILTER_HIT"/>
+	<value value="8" name="A7XX_PERF_UFC_CRE_FILTER_MISS"/>
+	<value value="9" name="A7XX_PERF_UFC_SP_FILTER_HIT"/>
+	<value value="10" name="A7XX_PERF_UFC_SP_FILTER_MISS"/>
+	<value value="11" name="A7XX_PERF_UFC_SP_REQUESTS"/>
+	<value value="12" name="A7XX_PERF_UFC_TP_FILTER_HIT"/>
+	<value value="13" name="A7XX_PERF_UFC_TP_FILTER_MISS"/>
+	<value value="14" name="A7XX_PERF_UFC_TP_REQUESTS"/>
+	<value value="15" name="A7XX_PERF_UFC_MAIN_HIT_LRZ_PREFETCH"/>
+	<value value="16" name="A7XX_PERF_UFC_MAIN_HIT_CRE_PREFETCH"/>
+	<value value="17" name="A7XX_PERF_UFC_MAIN_HIT_SP_PREFETCH"/>
+	<value value="18" name="A7XX_PERF_UFC_MAIN_HIT_TP_PREFETCH"/>
+	<value value="19" name="A7XX_PERF_UFC_MAIN_HIT_UBWC_READ"/>
+	<value value="20" name="A7XX_PERF_UFC_MAIN_HIT_UBWC_WRITE"/>
+	<value value="21" name="A7XX_PERF_UFC_MAIN_MISS_LRZ_PREFETCH"/>
+	<value value="22" name="A7XX_PERF_UFC_MAIN_MISS_CRE_PREFETCH"/>
+	<value value="23" name="A7XX_PERF_UFC_MAIN_MISS_SP_PREFETCH"/>
+	<value value="24" name="A7XX_PERF_UFC_MAIN_MISS_TP_PREFETCH"/>
+	<value value="25" name="A7XX_PERF_UFC_MAIN_MISS_UBWC_READ"/>
+	<value value="26" name="A7XX_PERF_UFC_MAIN_MISS_UBWC_WRITE"/>
+	<value value="27" name="A7XX_PERF_UFC_UBWC_READ_UFC_TRANS"/>
+	<value value="28" name="A7XX_PERF_UFC_UBWC_WRITE_UFC_TRANS"/>
+	<value value="29" name="A7XX_PERF_UFC_STALL_CYCLES_GBIF_CMD"/>
+	<value value="30" name="A7XX_PERF_UFC_STALL_CYCLES_GBIF_RDATA"/>
+	<value value="31" name="A7XX_PERF_UFC_STALL_CYCLES_GBIF_WDATA"/>
+	<value value="32" name="A7XX_PERF_UFC_STALL_CYCLES_UBWC_WR_FLAG"/>
+	<value value="33" name="A7XX_PERF_UFC_STALL_CYCLES_UBWC_FLAG_RTN"/>
+	<value value="34" name="A7XX_PERF_UFC_STALL_CYCLES_UBWC_EVENT"/>
+	<value value="35" name="A7XX_PERF_UFC_LRZ_PREFETCH_STALLED_CYCLES"/>
+	<value value="36" name="A7XX_PERF_UFC_CRE_PREFETCH_STALLED_CYCLES"/>
+	<value value="37" name="A7XX_PERF_UFC_SPTP_PREFETCH_STALLED_CYCLES"/>
+	<value value="38" name="A7XX_PERF_UFC_UBWC_RD_STALLED_CYCLES"/>
+	<value value="39" name="A7XX_PERF_UFC_UBWC_WR_STALLED_CYCLES"/>
+	<value value="40" name="A7XX_PERF_UFC_PREFETCH_STALLED_CYCLES"/>
+	<value value="41" name="A7XX_PERF_UFC_EVICTION_STALLED_CYCLES"/>
+	<value value="42" name="A7XX_PERF_UFC_LOCK_STALLED_CYCLES"/>
+	<value value="43" name="A7XX_PERF_UFC_MISS_LATENCY_CYCLES"/>
+	<value value="44" name="A7XX_PERF_UFC_MISS_LATENCY_SAMPLES"/>
+	<value value="45" name="A7XX_PERF_UFC_UBWC_REQ_STALLED_CYCLES"/>
+	<value value="46" name="A7XX_PERF_UFC_TP_HINT_TAG_MISS"/>
+	<value value="47" name="A7XX_PERF_UFC_TP_HINT_TAG_HIT_RDY"/>
+	<value value="48" name="A7XX_PERF_UFC_TP_HINT_TAG_HIT_NRDY"/>
+	<value value="49" name="A7XX_PERF_UFC_TP_HINT_IS_FCLEAR"/>
+	<value value="50" name="A7XX_PERF_UFC_TP_HINT_IS_ALPHA0"/>
+	<value value="51" name="A7XX_PERF_UFC_SP_L1_FILTER_HIT"/>
+	<value value="52" name="A7XX_PERF_UFC_SP_L1_FILTER_MISS"/>
+	<value value="53" name="A7XX_PERF_UFC_SP_L1_FILTER_REQUESTS"/>
+	<value value="54" name="A7XX_PERF_UFC_TP_L1_TAG_HIT_RDY"/>
+	<value value="55" name="A7XX_PERF_UFC_TP_L1_TAG_HIT_NRDY"/>
+	<value value="56" name="A7XX_PERF_UFC_TP_L1_TAG_MISS"/>
+	<value value="57" name="A7XX_PERF_UFC_TP_L1_FILTER_REQUESTS"/>
+</enum>
+
 <domain name="A6XX" width="32" prefix="variant" varset="chip">
 	<bitset name="A6XX_RBBM_INT_0_MASK" inline="no" varset="chip">
 		<bitfield name="RBBM_GPU_IDLE" pos="0" type="boolean"/>
@@ -1584,7 +2605,7 @@ to upconvert to 32b float internally?
 	<reg32 offset="0x050e" name="RBBM_PERFCTR_SRAM_INIT_CMD"/>
 	<reg32 offset="0x050f" name="RBBM_PERFCTR_SRAM_INIT_STATUS"/>
 	<reg32 offset="0x0533" name="RBBM_ISDB_CNT"/>
-	<reg32 offset="0x0534" name="RBBM_NC_MODE_CNTL" variants="A7XX-"/>
+	<reg32 offset="0x0534" name="RBBM_NC_MODE_CNTL"/>
 	<reg32 offset="0x0535" name="RBBM_SNAPSHOT_STATUS" variants="A7XX-"/>
 
 	<!---
@@ -2184,13 +3205,28 @@ to upconvert to 32b float internally?
 		<value value="3" name="BUFFERS_IN_SYSMEM"/>
 	</enum>
 
+	<enum name="a6xx_lrz_feedback_mask">
+		<value value="0x0" name="LRZ_FEEDBACK_NONE"/>
+		<value value="0x1" name="LRZ_FEEDBACK_EARLY_Z"/>
+		<value value="0x2" name="LRZ_FEEDBACK_EARLY_LRZ_LATE_Z"/>
+		<!-- We don't have a flag type and this flags combination is often used -->
+		<value value="0x3" name="LRZ_FEEDBACK_EARLY_Z_OR_EARLY_LRZ_LATE_Z"/>
+		<value value="0x4" name="LRZ_FEEDBACK_LATE_Z"/>
+	</enum>
+
 	<reg32 offset="0x80a1" name="GRAS_BIN_CONTROL" usage="rp_blit">
 		<bitfield name="BINW" low="0" high="5" shr="5" type="uint"/>
 		<bitfield name="BINH" low="8" high="14" shr="4" type="uint"/>
 		<bitfield name="RENDER_MODE" low="18" high="20" type="a6xx_render_mode"/>
+		<doc>Disable LRZ feedback writes</doc>
 		<bitfield name="FORCE_LRZ_WRITE_DIS" pos="21" type="boolean"/>
 		<bitfield name="BUFFERS_LOCATION" low="22" high="23" type="a6xx_buffers_location" variants="A6XX"/>
-		<bitfield name="LRZ_FEEDBACK_ZMODE_MASK" low="24" high="26"/>
+		<doc>
+			Allows draws that don't have GRAS_LRZ_CNTL.LRZ_WRITE but have
+			GRAS_LRZ_CNTL.ENABLE to contribute to LRZ during RENDERING pass.
+			In sysmem mode GRAS_LRZ_CNTL.LRZ_WRITE is not considered.
+		</doc>
+		<bitfield name="LRZ_FEEDBACK_ZMODE_MASK" low="24" high="26" type="a6xx_lrz_feedback_mask"/>
 		<bitfield name="UNK27" pos="27"/>
 	</reg32>
 
@@ -2270,7 +3306,7 @@ to upconvert to 32b float internally?
 			- 0.0 if GREATER
 			- 1.0 if LESS
 		</doc>
-		<bitfield name="FC_ENABLE" pos="3" type="boolean"/>
+		<bitfield name="FC_ENABLE" pos="3" type="boolean" variants="A6XX"/>
 		<!-- set when depth-test + depth-write enabled -->
 		<bitfield name="Z_TEST_ENABLE" pos="4" type="boolean"/>
 		<bitfield name="Z_BOUNDS_ENABLE" pos="5" type="boolean"/>
@@ -2284,7 +3320,7 @@ to upconvert to 32b float internally?
 			Disable LRZ based on previous direction and the current one.
 			If DIR_WRITE is not enabled - there is no write to direction buffer.
 		</doc>
-		<bitfield name="DISABLE_ON_WRONG_DIR" pos="9" type="boolean"/>
+		<bitfield name="DISABLE_ON_WRONG_DIR" pos="9" type="boolean" variants="A6XX"/>
 		<bitfield name="Z_FUNC" low="11" high="13" type="adreno_compare_func" variants="A7XX-"/>
 	</reg32>
 
@@ -2357,7 +3393,10 @@ to upconvert to 32b float internally?
 		<bitfield name="BASE_MIP_LEVEL" low="28" high="31" type="uint"/>
 	</reg32>
 
-	<reg32 offset="0x810b" name="GRAS_UNKNOWN_810B" variants="A7XX-" usage="cmd"/>
+	<reg32 offset="0x810b" name="GRAS_LRZ_CNTL2" variants="A7XX-" usage="rp_blit">
+		<bitfield name="DISABLE_ON_WRONG_DIR" pos="0" type="boolean"/>
+		<bitfield name="FC_ENABLE" pos="1" type="boolean"/>
+	</reg32>
 
 	<!-- 0x810c-0x810f invalid -->
 
@@ -2366,7 +3405,10 @@ to upconvert to 32b float internally?
 	<!-- A bit tentative but it's a color and it is followed by LRZ_CLEAR -->
 	<reg32 offset="0x8111" name="GRAS_LRZ_CLEAR_DEPTH_F32" type="float" variants="A7XX-"/>
 
-	<reg32 offset="0x8113" name="GRAS_LRZ_DEPTH_BUFFER_INFO" variants="A7XX-" usage="rp_blit"/>
+	<reg32 offset="0x8113" name="GRAS_LRZ_DEPTH_BUFFER_INFO" variants="A7XX-" usage="rp_blit">
+		<bitfield name="DEPTH_FORMAT" low="0" high="2" type="a6xx_depth_format"/>
+		<bitfield name="UNK3" pos="3"/>
+	</reg32>
 
 	<!-- Always written together and always equal 09510840 00000a62 -->
 	<reg32 offset="0x8120" name="GRAS_UNKNOWN_8120" variants="A7XX-" usage="cmd"/>
@@ -2440,7 +3482,7 @@ to upconvert to 32b float internally?
 		<bitfield name="RENDER_MODE" low="18" high="20" type="a6xx_render_mode"/>
 		<bitfield name="FORCE_LRZ_WRITE_DIS" pos="21" type="boolean"/>
 		<bitfield name="BUFFERS_LOCATION" low="22" high="23" type="a6xx_buffers_location"/>
-		<bitfield name="LRZ_FEEDBACK_ZMODE_MASK" low="24" high="26"/>
+		<bitfield name="LRZ_FEEDBACK_ZMODE_MASK" low="24" high="26" type="a6xx_lrz_feedback_mask"/>
 	</reg32>
 
 	<reg32 offset="0x8800" name="RB_BIN_CONTROL" variants="A7XX-" usage="rp_blit">
@@ -2448,7 +3490,7 @@ to upconvert to 32b float internally?
 		<bitfield name="BINH" low="8" high="14" shr="4" type="uint"/>
 		<bitfield name="RENDER_MODE" low="18" high="20" type="a6xx_render_mode"/>
 		<bitfield name="FORCE_LRZ_WRITE_DIS" pos="21" type="boolean"/>
-		<bitfield name="LRZ_FEEDBACK_ZMODE_MASK" low="24" high="26"/>
+		<bitfield name="LRZ_FEEDBACK_ZMODE_MASK" low="24" high="26" type="a6xx_lrz_feedback_mask"/>
 	</reg32>
 
 	<reg32 offset="0x8801" name="RB_RENDER_CNTL" variants="A6XX" usage="rp_blit">
@@ -2605,6 +3647,7 @@ to upconvert to 32b float internally?
 			<bitfield name="UNK10" pos="10"/>
 			<bitfield name="LOSSLESSCOMPEN" pos="11" type="boolean"/>
 			<bitfield name="COLOR_SWAP" low="13" high="14" type="a3xx_color_swap"/>
+			<bitfield name="MUTABLEEN" pos="16" type="boolean" variants="A7XX-"/>
 		</reg32>
 		<!--
 		at least in gmem, things seem to be aligned to pitch of 64..
@@ -2770,6 +3813,7 @@ to upconvert to 32b float internally?
 		<bitfield name="COLOR_SWAP" low="5" high="6" type="a3xx_color_swap"/>
 		<bitfield name="COLOR_FORMAT" low="7" high="14" type="a6xx_format"/>
 		<bitfield name="UNK15" pos="15" type="boolean"/>
+		<bitfield name="MUTABLEEN" pos="16" type="boolean" variants="A7XX-"/>
 	</reg32>
 	<reg64 offset="0x88d8" name="RB_BLIT_DST" type="waddress" align="64" usage="rp_blit"/>
 	<reg32 offset="0x88da" name="RB_BLIT_DST_PITCH" low="0" high="15" shr="6" type="uint" usage="rp_blit"/>
@@ -2886,13 +3930,12 @@ to upconvert to 32b float internally?
 	<reg32 offset="0x8c00" name="RB_2D_BLIT_CNTL" type="a6xx_2d_blit_cntl" usage="rp_blit"/>
 	<reg32 offset="0x8c01" name="RB_2D_UNKNOWN_8C01" low="0" high="31" usage="rp_blit"/>
 
-	<bitset name="a6xx_2d_surf_info" inline="yes">
+	<bitset name="a6xx_2d_src_surf_info" inline="yes">
 		<bitfield name="COLOR_FORMAT" low="0" high="7" type="a6xx_format"/>
 		<bitfield name="TILE_MODE" low="8" high="9" type="a6xx_tile_mode"/>
 		<bitfield name="COLOR_SWAP" low="10" high="11" type="a3xx_color_swap"/>
 		<bitfield name="FLAGS" pos="12" type="boolean"/>
 		<bitfield name="SRGB" pos="13" type="boolean"/>
-		<!-- the rest is only for src -->
 		<bitfield name="SAMPLES" low="14" high="15" type="a3xx_msaa_samples"/>
 		<bitfield name="FILTER" pos="16" type="boolean"/>
 		<bitfield name="UNK17" pos="17" type="boolean"/>
@@ -2903,11 +3946,21 @@ to upconvert to 32b float internally?
 		<bitfield name="UNK22" pos="22" type="boolean"/>
 		<bitfield name="UNK23" low="23" high="26"/>
 		<bitfield name="UNK28" pos="28" type="boolean"/>
+		<bitfield name="MUTABLEEN" pos="29" type="boolean" variants="A7XX-"/>
+	</bitset>
+
+	<bitset name="a6xx_2d_dst_surf_info" inline="yes">
+		<bitfield name="COLOR_FORMAT" low="0" high="7" type="a6xx_format"/>
+		<bitfield name="TILE_MODE" low="8" high="9" type="a6xx_tile_mode"/>
+		<bitfield name="COLOR_SWAP" low="10" high="11" type="a3xx_color_swap"/>
+		<bitfield name="FLAGS" pos="12" type="boolean"/>
+		<bitfield name="SRGB" pos="13" type="boolean"/>
+		<bitfield name="SAMPLES" low="14" high="15" type="a3xx_msaa_samples"/>
+		<bitfield name="MUTABLEEN" pos="17" type="boolean" variants="A7XX-"/>
 	</bitset>
 
 	<!-- 0x8c02-0x8c16 invalid -->
-	<!-- TODO: RB_2D_DST_INFO has 17 valid bits (doesn't match a6xx_2d_surf_info) -->
-	<reg32 offset="0x8c17" name="RB_2D_DST_INFO" type="a6xx_2d_surf_info" usage="rp_blit"/>
+	<reg32 offset="0x8c17" name="RB_2D_DST_INFO" type="a6xx_2d_dst_surf_info" usage="rp_blit"/>
 	<reg64 offset="0x8c18" name="RB_2D_DST" type="waddress" align="64" usage="rp_blit"/>
 	<reg32 offset="0x8c1a" name="RB_2D_DST_PITCH" low="0" high="15" shr="6" type="uint" usage="rp_blit"/>
 	<!-- this is a guess but seems likely (for NV12/IYUV): -->
@@ -2927,7 +3980,10 @@ to upconvert to 32b float internally?
 	<reg32 offset="0x8c2d" name="RB_2D_SRC_SOLID_C1" usage="rp_blit"/>
 	<reg32 offset="0x8c2e" name="RB_2D_SRC_SOLID_C2" usage="rp_blit"/>
 	<reg32 offset="0x8c2f" name="RB_2D_SRC_SOLID_C3" usage="rp_blit"/>
-	<!-- 0x8c34-0x8dff invalid -->
+
+	<reg32 offset="0x8c34" name="RB_UNKNOWN_8C34" variants="A7XX-" usage="cmd"/>
+
+	<!-- 0x8c35-0x8dff invalid -->
 
 	<!-- always 0x1 ? either doesn't exist for a650 or write-only: -->
 	<reg32 offset="0x8e01" name="RB_UNKNOWN_8E01" usage="cmd"/>
@@ -4275,7 +5331,7 @@ to upconvert to 32b float internally?
 	badly named or the functionality moved in a6xx.  But downstream kernel
 	calls this "a6xx_sp_ps_tp_2d_cluster"
 	 -->
-	<reg32 offset="0xb4c0" name="SP_PS_2D_SRC_INFO" type="a6xx_2d_surf_info" variants="A6XX" usage="rp_blit"/>
+	<reg32 offset="0xb4c0" name="SP_PS_2D_SRC_INFO" type="a6xx_2d_src_surf_info" variants="A6XX" usage="rp_blit"/>
 	<reg32 offset="0xb4c1" name="SP_PS_2D_SRC_SIZE" variants="A6XX" usage="rp_blit">
 		<bitfield name="WIDTH" low="0" high="14" type="uint"/>
 		<bitfield name="HEIGHT" low="15" high="29" type="uint"/>
@@ -4286,7 +5342,7 @@ to upconvert to 32b float internally?
 		<bitfield name="PITCH" low="9" high="23" shr="6" type="uint"/>
 	</reg32>
 
-	<reg32 offset="0xb2c0" name="SP_PS_2D_SRC_INFO" type="a6xx_2d_surf_info" variants="A7XX-" usage="rp_blit"/>
+	<reg32 offset="0xb2c0" name="SP_PS_2D_SRC_INFO" type="a6xx_2d_src_surf_info" variants="A7XX-" usage="rp_blit"/>
 	<reg32 offset="0xb2c1" name="SP_PS_2D_SRC_SIZE" variants="A7XX">
 		<bitfield name="WIDTH" low="0" high="14" type="uint"/>
 		<bitfield name="HEIGHT" low="15" high="29" type="uint"/>
@@ -4329,7 +5385,12 @@ to upconvert to 32b float internally?
 	<!-- always 0x100000 or 0x1000000? -->
 	<reg32 offset="0xb600" name="TPL1_DBG_ECO_CNTL" low="0" high="25" usage="cmd"/>
 	<reg32 offset="0xb601" name="TPL1_ADDR_MODE_CNTL" type="a5xx_address_mode"/>
-	<reg32 offset="0xb602" name="TPL1_DBG_ECO_CNTL1" usage="cmd"/>
+	<reg32 offset="0xb602" name="TPL1_DBG_ECO_CNTL1" usage="cmd">
+		<!-- Affects UBWC in some way, if BLIT_OP_SCALE is done with this bit set
+		     and if other blit is done without it - UBWC image may be copied incorrectly.
+		 -->
+		<bitfield name="TP_UBWC_FLAG_HINT" pos="18" type="boolean"/>
+	</reg32>
 	<reg32 offset="0xb604" name="TPL1_NC_MODE_CNTL">
 		<bitfield name="MODE" pos="0" type="boolean"/>
 		<bitfield name="LOWER_BIT" low="1" high="2" type="uint"/>
@@ -4351,7 +5412,8 @@ to upconvert to 32b float internally?
 	<reg32 offset="0xb60b" name="TPL1_BICUBIC_WEIGHTS_TABLE_3" low="0" high="29" variants="A7XX" usage="cmd"/>
 	<reg32 offset="0xb60c" name="TPL1_BICUBIC_WEIGHTS_TABLE_4" low="0" high="29" variants="A7XX" usage="cmd"/>
 
-	<array offset="0xb610" name="TPL1_PERFCTR_TP_SEL" stride="1" length="12"/>
+	<array offset="0xb610" name="TPL1_PERFCTR_TP_SEL" stride="1" length="12" variants="A6XX"/>
+	<array offset="0xb610" name="TPL1_PERFCTR_TP_SEL" stride="1" length="18" variants="A7XX"/>
 
 	<!-- TODO: 4 more perfcntr sel at 0xb620 ? -->
 
@@ -4582,15 +5644,15 @@ to upconvert to 32b float internally?
 		<bitfield name="UNK6" pos="6" type="boolean"/>
 	</reg32>
 
-	<reg32 offset="0xbb00" name="HLSQ_DRAW_CMD">
+	<reg32 offset="0xbb00" name="HLSQ_DRAW_CMD" variants="A6XX">
 		<bitfield name="STATE_ID" low="0" high="7"/>
 	</reg32>
 
-	<reg32 offset="0xbb01" name="HLSQ_DISPATCH_CMD">
+	<reg32 offset="0xbb01" name="HLSQ_DISPATCH_CMD" variants="A6XX">
 		<bitfield name="STATE_ID" low="0" high="7"/>
 	</reg32>
 
-	<reg32 offset="0xbb02" name="HLSQ_EVENT_CMD">
+	<reg32 offset="0xbb02" name="HLSQ_EVENT_CMD" variants="A6XX">
 		<!-- I think only the low bit is actually used? -->
 		<bitfield name="STATE_ID" low="16" high="23"/>
 		<bitfield name="EVENT" low="0" high="6" type="vgt_event_type"/>
@@ -4623,6 +5685,19 @@ to upconvert to 32b float internally?
 		<bitfield name="GFX_BINDLESS" low="14" high="18" type="hex"/>
 	</reg32>
 
+	<reg32 offset="0xab1c" name="HLSQ_DRAW_CMD" variants="A7XX-">
+		<bitfield name="STATE_ID" low="0" high="7"/>
+	</reg32>
+
+	<reg32 offset="0xab1d" name="HLSQ_DISPATCH_CMD" variants="A7XX-">
+		<bitfield name="STATE_ID" low="0" high="7"/>
+	</reg32>
+
+	<reg32 offset="0xab1e" name="HLSQ_EVENT_CMD" variants="A7XX-">
+		<bitfield name="STATE_ID" low="16" high="23"/>
+		<bitfield name="EVENT" low="0" high="6" type="vgt_event_type"/>
+	</reg32>
+
 	<reg32 offset="0xab1f" name="HLSQ_INVALIDATE_CMD" variants="A7XX-" usage="cmd">
 		<doc>
 			This register clears pending loads queued up by
@@ -4791,7 +5866,7 @@ to upconvert to 32b float internally?
 	<reg32 offset="3" name="3"/>
 </domain>
 
-<domain name="A6XX_TEX_CONST" width="32">
+<domain name="A6XX_TEX_CONST" width="32" varset="chip">
 	<doc>Texture constant dwords</doc>
 	<enum name="a6xx_tex_swiz"> <!-- same as a4xx? -->
 		<value name="A6XX_TEX_X" value="0"/>
@@ -4831,6 +5906,7 @@ to upconvert to 32b float internally?
 	<reg32 offset="1" name="1">
 		<bitfield name="WIDTH" low="0" high="14" type="uint"/>
 		<bitfield name="HEIGHT" low="15" high="29" type="uint"/>
+		<bitfield name="MUTABLEEN" pos="31" type="boolean" variants="A7XX-"/>
 	</reg32>
 	<reg32 offset="2" name="2">
 		<!--

-- 
2.31.1


