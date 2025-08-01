Return-Path: <linux-arm-msm+bounces-67423-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CA0B1870D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 20:01:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF6871AA6ECA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 18:01:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D2AA28DF3D;
	Fri,  1 Aug 2025 18:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d6czJdrb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E8528DB5B
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Aug 2025 18:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754071225; cv=none; b=iqCuLYXF9DSVX2HvqVZ+9cbYrlmdlhdBlFUe3aN4DNGk9TJ6bd8f8Vwv05wRYo+LEueAzSs1OFDOkz0id1c/7chItzkvvdenyhPt6Q+HhwiC+aHUieW2tha0eO3FSa2kyCwSKPBPJ+jTjFg2SwWiriov0PC9/r/TKusQCEfmek0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754071225; c=relaxed/simple;
	bh=ZlKkmrc5VgBg7YhDd9UGaHUUv0BCefJviYgw3wueiDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KXt1T5l+ziViEsiIxxFtTuq9xb4isfFy3UTsdU4oopZ66Ola2Ej8GmK4UKSlesmzSSRS9+bd+T5eQXXxFP/k8V0RPwUOSTIFNj4X+/3L4ZIS+s9LdjlO7Z2OmRQEFgzfkPPyK+oIIwxY7K6cySo2dbdDvjwdycZ9dTF0v+nkryY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d6czJdrb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 571HfAcM021559
	for <linux-arm-msm@vger.kernel.org>; Fri, 1 Aug 2025 18:00:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=hi1vgMO0Vv7
	J21nNKfYLDG2T1ayUhJgydMOm04m2eGY=; b=d6czJdrbXACfHnZPn6JhECTGRA3
	mTXLVnmT7RJABZleG2bEQfdlPuaRDGH9xFvd23aQ85qz26JZRjUUs/+DVD8+RuTB
	99ovOLDtgKNVhmiTQCe2a8VWClrKwdwAfwbQ6Du0iwWKnrJJ5j1JxzGX69lt/PMx
	Q15/Y7/zPHnzaVeMh5vVvZeEuzK8jlAo9TRMJAC4lOIZYuUSRGzxOoX++LqVyJaz
	UBh3EWzgyRXPPZRadC/Nb0uYIzIb29MTguRlN10ecV145yDOlhVusKV0yjjC4SHr
	i7NGWY7k0PZM45NhUfvzAQolgeUdmr2epa23em2vtJQGtX67fERg62TCyLA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 488u651fax-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 18:00:22 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-74b185fba41so2452346b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 11:00:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754071221; x=1754676021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hi1vgMO0Vv7J21nNKfYLDG2T1ayUhJgydMOm04m2eGY=;
        b=wMOoj6PJCCVwjdur4ogEKUrr7mo3LK2hNxUMuHwNh67egZlVYJNFS8kweumlPGZkWX
         okJc1UNS4PK+MLrFzoME/ykYVEMKtG51atw9yvVm9kvbaLeuBmT5nzkcPlkHKazl0jo5
         Hlf+gXFjHnDjKGvbe7OTsQG0wMzzAMOw3cW4SdIU+VO0Rrkj1cVnRGIslac609O+x2ys
         am3a3SdNFyha8Ax+MECl/TLtRRGneNV1VRAI3AWJla6yhKemePnyEBwakqMzHHHFwv+Z
         Qh1OZomY+m/twvDIHPvStJPCVDqLWOD7GbP+bj4lExU2EqKVtUlojV+LOtXceyIWZ0qH
         uwhA==
X-Gm-Message-State: AOJu0Yy1M/J9VcFTtpI+MsHpwGxXZf+/JjnyRrevb6MkGIL/wTcBOUqq
	Qb2x4t1aEalkYkV7hr2SxUswD3n4IXp3VbkqBo5jmT5M9rvYtIaE2ty0UNlwiIpIO5rSClULmRc
	AFKhGE65b9EBvk0+/KMIdQUDzVO7wBgFEUB0WkmPvAAWvaVsPQIHLd3ZZ8ptcFLYjpW4t
X-Gm-Gg: ASbGncuV9x0mO0z8R2+2DDNuxhGfidiP3lTZyivBRg/wWf3wSzfDaWfCzSSAkjsW3ht
	7comfSEkxgIb0i33N5GtAkAbsz3PxigymG/d7lLigL7ITcCMbGUjUsJwbEGo2H8hRhlirg14N1j
	DVR6JnzgoLekicorfoJ1j4gkEgywXC1EnXYawfqjmynapK5/vx8pOU33Rlhp2e0upRqRekgkwWh
	+os7YVE+frLSWS/Ym8CDpRhLjA8gEZQMC7BH4Ui2FIhUSxW2NTpVl6I3aMsvGKHtR4VD1FLtuTc
	NzyU+lceWkjwhnBje2IxzIdQXjdDRPN5aXxEKTTGpulkTOAbHDk=
X-Received: by 2002:a05:6a20:7486:b0:22d:fd6:95e0 with SMTP id adf61e73a8af0-23df8fa1de7mr868837637.11.1754071220367;
        Fri, 01 Aug 2025 11:00:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6mgJb3hkI3FjCFdZoHfiotilqYID1iNK88urHoLYa/fSW4RsyuIEp7AhFOrCT6Y4ZIAhoow==
X-Received: by 2002:a05:6a20:7486:b0:22d:fd6:95e0 with SMTP id adf61e73a8af0-23df8fa1de7mr868773637.11.1754071219906;
        Fri, 01 Aug 2025 11:00:19 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b422baedf5csm4238296a12.47.2025.08.01.11.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 11:00:19 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 4/7] drm/msm: Constify snapshot tables
Date: Fri,  1 Aug 2025 11:00:01 -0700
Message-ID: <20250801180009.345662-5-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250801180009.345662-1-robin.clark@oss.qualcomm.com>
References: <20250801180009.345662-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Uy9bLFBdaye8kwXxliFJ9hkniLREYqPB
X-Proofpoint-GUID: Uy9bLFBdaye8kwXxliFJ9hkniLREYqPB
X-Authority-Analysis: v=2.4 cv=f+RIBPyM c=1 sm=1 tr=0 ts=688d00b6 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=EUspDBNiAAAA:8 a=3YnKlkqyfxy5QV46dWoA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDEzOCBTYWx0ZWRfX24oLRbWdyLQO
 h19NtA66OhTu/qXB/58XuLbY9ssmGM+pORts3GsmQll44PNG7NyS4sEU543efPDqLd+CENLoo+M
 kOhebBuytPpyat+umamvYBoLz+co9mavQPADLOzZoEvp3gVl41Mi3zUj5aPUK4SvbAQEXe9jOIc
 4ol0oexPNEKNh/2bfj7U810zlVa4fzhOPKM2RzODKUEzJ1TxQn2IExY263/HEdel8KK7sO1w/mO
 K4/Ss0CR5P14uyIilSK9W+NCc9WsEoSQ+T2nOD4zfYp5e32ZAzmGnnNob2bth/yL2qpH6HNIFWe
 PE8flVsGcv7jZMXukK5cmGCblaeQjPnVV+Y3eDCq6aqA9SC2sCAnGzTA+KarSzmSAAFmqpTTq7W
 zf4zaMEsOkQObY7V1/DRUoNGsMUshHGTTBvdosnwJOc9BzwQ3XlO44mUYlqtRgNeaXAQyV2h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_06,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508010138

A bit of divergence from the downstream driver from which these headers
were imported.  But no need for these tables not to be const.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c           |  2 +-
 drivers/gpu/drm/msm/adreno/adreno_gen7_0_0_snapshot.h |  8 ++++----
 drivers/gpu/drm/msm/adreno/adreno_gen7_2_0_snapshot.h |  8 ++++----
 drivers/gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h | 10 +++++-----
 4 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index 5204b28fd7f9..173c14f215a7 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -11,7 +11,7 @@
 static const unsigned int *gen7_0_0_external_core_regs[] __always_unused;
 static const unsigned int *gen7_2_0_external_core_regs[] __always_unused;
 static const unsigned int *gen7_9_0_external_core_regs[] __always_unused;
-static struct gen7_sptp_cluster_registers gen7_9_0_sptp_clusters[] __always_unused;
+static const struct gen7_sptp_cluster_registers gen7_9_0_sptp_clusters[] __always_unused;
 static const u32 gen7_9_0_cx_debugbus_blocks[] __always_unused;
 
 #include "adreno_gen7_0_0_snapshot.h"
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gen7_0_0_snapshot.h b/drivers/gpu/drm/msm/adreno/adreno_gen7_0_0_snapshot.h
index cb66ece6606b..afcc7498983f 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gen7_0_0_snapshot.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gen7_0_0_snapshot.h
@@ -81,7 +81,7 @@ static const u32 gen7_0_0_debugbus_blocks[] = {
 	A7XX_DBGBUS_USPTP_7,
 };
 
-static struct gen7_shader_block gen7_0_0_shader_blocks[] = {
+static const struct gen7_shader_block gen7_0_0_shader_blocks[] = {
 	{A7XX_TP0_TMO_DATA,                 0x200, 4, 2, A7XX_PIPE_BR, A7XX_USPTP},
 	{A7XX_TP0_SMO_DATA,                  0x80, 4, 2, A7XX_PIPE_BR, A7XX_USPTP},
 	{A7XX_TP0_MIPMAP_BASE_DATA,         0x3c0, 4, 2, A7XX_PIPE_BR, A7XX_USPTP},
@@ -695,7 +695,7 @@ static const struct gen7_sel_reg gen7_0_0_rb_rbp_sel = {
 	.val = 0x9,
 };
 
-static struct gen7_cluster_registers gen7_0_0_clusters[] = {
+static const struct gen7_cluster_registers gen7_0_0_clusters[] = {
 	{ A7XX_CLUSTER_NONE, A7XX_PIPE_BR, STATE_NON_CONTEXT,
 		gen7_0_0_noncontext_pipe_br_registers, },
 	{ A7XX_CLUSTER_NONE, A7XX_PIPE_BV, STATE_NON_CONTEXT,
@@ -764,7 +764,7 @@ static struct gen7_cluster_registers gen7_0_0_clusters[] = {
 		gen7_0_0_vpc_cluster_vpc_ps_pipe_bv_registers, },
 };
 
-static struct gen7_sptp_cluster_registers gen7_0_0_sptp_clusters[] = {
+static const struct gen7_sptp_cluster_registers gen7_0_0_sptp_clusters[] = {
 	{ A7XX_CLUSTER_NONE, A7XX_SP_NCTX_REG, A7XX_PIPE_BR, 0, A7XX_HLSQ_STATE,
 		gen7_0_0_sp_noncontext_pipe_br_hlsq_state_registers, 0xae00 },
 	{ A7XX_CLUSTER_NONE, A7XX_SP_NCTX_REG, A7XX_PIPE_BR, 0, A7XX_SP_TOP,
@@ -914,7 +914,7 @@ static const u32 gen7_0_0_dpm_registers[] = {
 };
 static_assert(IS_ALIGNED(sizeof(gen7_0_0_dpm_registers), 8));
 
-static struct gen7_reg_list gen7_0_0_reg_list[] = {
+static const struct gen7_reg_list gen7_0_0_reg_list[] = {
 	{ gen7_0_0_gpu_registers, NULL },
 	{ gen7_0_0_cx_misc_registers, NULL },
 	{ gen7_0_0_dpm_registers, NULL },
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gen7_2_0_snapshot.h b/drivers/gpu/drm/msm/adreno/adreno_gen7_2_0_snapshot.h
index 6f8ad50f32ce..6569f12bf12f 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gen7_2_0_snapshot.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gen7_2_0_snapshot.h
@@ -95,7 +95,7 @@ static const u32 gen7_2_0_debugbus_blocks[] = {
 	A7XX_DBGBUS_CCHE_2,
 };
 
-static struct gen7_shader_block gen7_2_0_shader_blocks[] = {
+static const struct gen7_shader_block gen7_2_0_shader_blocks[] = {
 	{A7XX_TP0_TMO_DATA,                 0x200, 6, 2, A7XX_PIPE_BR, A7XX_USPTP},
 	{A7XX_TP0_SMO_DATA,                  0x80, 6, 2, A7XX_PIPE_BR, A7XX_USPTP},
 	{A7XX_TP0_MIPMAP_BASE_DATA,         0x3c0, 6, 2, A7XX_PIPE_BR, A7XX_USPTP},
@@ -489,7 +489,7 @@ static const struct gen7_sel_reg gen7_2_0_rb_rbp_sel = {
 	.val = 0x9,
 };
 
-static struct gen7_cluster_registers gen7_2_0_clusters[] = {
+static const struct gen7_cluster_registers gen7_2_0_clusters[] = {
 	{ A7XX_CLUSTER_NONE, A7XX_PIPE_BR, STATE_NON_CONTEXT,
 		gen7_2_0_noncontext_pipe_br_registers, },
 	{ A7XX_CLUSTER_NONE, A7XX_PIPE_BV, STATE_NON_CONTEXT,
@@ -558,7 +558,7 @@ static struct gen7_cluster_registers gen7_2_0_clusters[] = {
 		gen7_0_0_vpc_cluster_vpc_ps_pipe_bv_registers, },
 };
 
-static struct gen7_sptp_cluster_registers gen7_2_0_sptp_clusters[] = {
+static const struct gen7_sptp_cluster_registers gen7_2_0_sptp_clusters[] = {
 	{ A7XX_CLUSTER_NONE, A7XX_SP_NCTX_REG, A7XX_PIPE_BR, 0, A7XX_HLSQ_STATE,
 		gen7_0_0_sp_noncontext_pipe_br_hlsq_state_registers, 0xae00 },
 	{ A7XX_CLUSTER_NONE, A7XX_SP_NCTX_REG, A7XX_PIPE_BR, 0, A7XX_SP_TOP,
@@ -737,7 +737,7 @@ static const u32 gen7_2_0_dpm_registers[] = {
 };
 static_assert(IS_ALIGNED(sizeof(gen7_2_0_dpm_registers), 8));
 
-static struct gen7_reg_list gen7_2_0_reg_list[] = {
+static const struct gen7_reg_list gen7_2_0_reg_list[] = {
 	{ gen7_2_0_gpu_registers, NULL },
 	{ gen7_2_0_cx_misc_registers, NULL },
 	{ gen7_2_0_dpm_registers, NULL },
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h b/drivers/gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h
index b1f8bbf1d843..0956dfca1f05 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h
@@ -117,7 +117,7 @@ static const u32 gen7_9_0_cx_debugbus_blocks[] = {
 	A7XX_DBGBUS_GBIF_CX,
 };
 
-static struct gen7_shader_block gen7_9_0_shader_blocks[] = {
+static const struct gen7_shader_block gen7_9_0_shader_blocks[] = {
 	{ A7XX_TP0_TMO_DATA, 0x0200, 6, 2, A7XX_PIPE_BR, A7XX_USPTP },
 	{ A7XX_TP0_SMO_DATA, 0x0080, 6, 2, A7XX_PIPE_BR, A7XX_USPTP },
 	{ A7XX_TP0_MIPMAP_BASE_DATA, 0x03C0, 6, 2, A7XX_PIPE_BR, A7XX_USPTP },
@@ -1116,7 +1116,7 @@ static const struct gen7_sel_reg gen7_9_0_rb_rbp_sel = {
 	.val = 0x9,
 };
 
-static struct gen7_cluster_registers gen7_9_0_clusters[] = {
+static const struct gen7_cluster_registers gen7_9_0_clusters[] = {
 	{ A7XX_CLUSTER_NONE, A7XX_PIPE_BR, STATE_NON_CONTEXT,
 		gen7_9_0_non_context_pipe_br_registers,  },
 	{ A7XX_CLUSTER_NONE, A7XX_PIPE_BV, STATE_NON_CONTEXT,
@@ -1185,7 +1185,7 @@ static struct gen7_cluster_registers gen7_9_0_clusters[] = {
 		gen7_9_0_vpc_pipe_bv_cluster_vpc_ps_registers,  },
 };
 
-static struct gen7_sptp_cluster_registers gen7_9_0_sptp_clusters[] = {
+static const struct gen7_sptp_cluster_registers gen7_9_0_sptp_clusters[] = {
 	{ A7XX_CLUSTER_NONE, A7XX_SP_NCTX_REG, A7XX_PIPE_BR, 0, A7XX_HLSQ_STATE,
 		gen7_9_0_non_context_sp_pipe_br_hlsq_state_registers, 0xae00},
 	{ A7XX_CLUSTER_NONE, A7XX_SP_NCTX_REG, A7XX_PIPE_BR, 0, A7XX_SP_TOP,
@@ -1294,7 +1294,7 @@ static struct gen7_sptp_cluster_registers gen7_9_0_sptp_clusters[] = {
 		gen7_9_0_tpl1_pipe_br_cluster_sp_ps_usptp_registers, 0xb000},
 };
 
-static struct a6xx_indexed_registers gen7_9_0_cp_indexed_reg_list[] = {
+static const struct a6xx_indexed_registers gen7_9_0_cp_indexed_reg_list[] = {
 	{ "CP_SQE_STAT", REG_A6XX_CP_SQE_STAT_ADDR,
 		REG_A6XX_CP_SQE_STAT_DATA, 0x00040},
 	{ "CP_DRAW_STATE", REG_A6XX_CP_DRAW_STATE_ADDR,
@@ -1337,7 +1337,7 @@ static struct a6xx_indexed_registers gen7_9_0_cp_indexed_reg_list[] = {
 		REG_A7XX_CP_AQE_STAT_DATA_1, 0x00040},
 };
 
-static struct gen7_reg_list gen7_9_0_reg_list[] = {
+static const struct gen7_reg_list gen7_9_0_reg_list[] = {
 	{ gen7_9_0_gpu_registers, NULL},
 	{ gen7_9_0_cx_misc_registers, NULL},
 	{ gen7_9_0_cx_dbgc_registers, NULL},
-- 
2.50.1


