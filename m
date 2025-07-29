Return-Path: <linux-arm-msm+bounces-67020-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DD4B14FC6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 16:57:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE8511781A7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 14:57:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5374C287253;
	Tue, 29 Jul 2025 14:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IiqUseA7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37211EA7E4
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 14:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753801064; cv=none; b=X6NLjMJKryshpcbc4C9gxzWasRHgGYSdVdmvApEmDp2LQY7T6t1Gu9pINMpNBMlCmHgRKE8tSlwuabqU+ka6LTi8ZM2m7pQ/TpV733rJyyWVu6+7KJ6Fd1maC/6GWuJH3g6CcocRxNLjF5O9ysaROeYjTSSXQ1ct5az/BDx17mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753801064; c=relaxed/simple;
	bh=e6x/dDP5ia/NlQH+0MKdj/wLpx5h4B+ZdMfBV+aj6qw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TxTxh2A5aD9RbgpKpVjbY0GZhxNywUnx6iESVkU9/USoWQJTMTrtNg/yTUYLSReqXjedPIeCsuROEVszS12Lnm6ozJN64V3vZ2OzeFpasqOPxTvtNrr8MBTkI9hTbvLjJkG9ccc+WB6XoRGbuWVUM4tUv4bmzAAvs83xwmuvJfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IiqUseA7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56T8b7bk014622
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 14:57:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0qBkf9JDSmf
	FwdkCS8a187SNR+0cTRqqV9Ya3fpJH68=; b=IiqUseA7ZxZPmNVf5O8ZEZd1UjI
	snNXRY+1zeGSC0McZYDyiy3tCUSqCWZKN5mQJbLK7Gg89m1ZgWtPV7/p5wxlq/0M
	nUW2js4rF28MoR8IZJtfLwdB/+SxEZ89AZ+20387HNM3Kn+TtpUzc35HkkOFAIVs
	nH1ChZ1XwEWuKW3c5gGgc3o0iB4rr6pbROPIU/K4mEft3R6ED0X+eTIEyXzIyeF7
	VU+Nly8soc0ZPqljK5L8SNDaqD7O77bs1yKd8CMMaKukeSBWyMWe0LsrGAjgprF5
	tMmhAUIJX1songUbbQ2tXmdkk7UJ8uc48fv8Jjua/b88SH1Qvuium1K34Ig==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484q3xrfqt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 14:57:40 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-24004ac2ecdso35102245ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 07:57:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753801059; x=1754405859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0qBkf9JDSmfFwdkCS8a187SNR+0cTRqqV9Ya3fpJH68=;
        b=U1J6TMdR9baweFdzgbHz1AHAJF06/dnuuMO5EBX4NyBLtxFlKZV270J1DfnXdTrCTC
         avGO8YqV1mzuHh+COwR3sfVdKt7OuXTmrR1SJTtFvzEakgFRXhLF4gFRBB4wpg5ontix
         yf2l8pl8k3dvzlwtlCZiQa6emg29Xu1FEz63yZ3qYeqhtJ9UAN66vOCwGv4b9oYiNmCD
         SINucBFjJJ69qH2j5dkNexy2R8jzqjIpKupkgYBkUrUNcZuuSeHVyTY1tAIhjgRtuj5J
         2he/7mlM2BN43vu9YFDjN0pbl4R/qZO7i7xdYZ/e5Gfi/2euX+B7z6nQ657Rd6uX8R0K
         NmLg==
X-Gm-Message-State: AOJu0YwsY0YWofTW93gaNLH66F1HoJmF18ZynC1KA8+AIVtq4tTvVWKF
	+8bkMDJ+sx4lkT9rWLBGRfKaMO6WkJUkdjDQ5HUzji0XbQIWNw1IJLcTymm9xk1wHvuUG6hh7hS
	kAemjXfGVza/IuKELroTXJLplDcSVUL1WyVzpLMKsQzSUFEL3inYhsol+4v/U1gZhQSrq
X-Gm-Gg: ASbGncvQnWEAmsh99NFgJWSvJ7HJek3F/O7Jc1RQz5Om63t8crKS3I0SMFY4cAJGpxk
	+H30X1nIo2kz6aBqi/B9Km9yTTDDfmaGiQvpYVyXcFlCtUeymVfiN14ubMazHnnLMz/NR7mF1/X
	wybyY3HWiwxkBfiSWpvBNw2DJbVvJAlLvjjVpqiMxCUqdk5DPWmYZKyRX8VbEpQMM3ezPGtQ9BN
	kmS33OSoTN6uxfFrTEsuabljjbjgiREizORQZ4P/da7o0nKfJ1X6yoZRGJ05O4eJHZ9HLA9RZaA
	Yf7ZZOVSMY+mN6IO9WZO3fFUHNW3aibvTHxCsAee7mnzFJaEywk=
X-Received: by 2002:a17:903:ace:b0:240:1953:f9a with SMTP id d9443c01a7336-24019531719mr133423265ad.2.1753801059449;
        Tue, 29 Jul 2025 07:57:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGD4GKtP2sJEpJJxujTV2ZRkIuCi7nOh6GWilBcpkOTveTX8D8XdwMAVNRZGCDv3ocJrDEVyw==
X-Received: by 2002:a17:903:ace:b0:240:1953:f9a with SMTP id d9443c01a7336-24019531719mr133422875ad.2.1753801058983;
        Tue, 29 Jul 2025 07:57:38 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24029726586sm48279835ad.19.2025.07.29.07.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 07:57:38 -0700 (PDT)
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
Subject: [PATCH v2 1/7] drm/msm: Add missing "location"s to devcoredump
Date: Tue, 29 Jul 2025 07:57:18 -0700
Message-ID: <20250729145729.10905-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250729145729.10905-1-robin.clark@oss.qualcomm.com>
References: <20250729145729.10905-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=JovxrN4C c=1 sm=1 tr=0 ts=6888e164 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=YFM8xwheDJGXjHaRWHsA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: Ue1XK_hUdDUjRYSnsZepII30bdBXkvIB
X-Proofpoint-GUID: Ue1XK_hUdDUjRYSnsZepII30bdBXkvIB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDExNCBTYWx0ZWRfX56mtcJ5cf0wn
 IKuLyJr6VQ2vi1JIEcTTYP5r635Fr9LOk+ZVDqtzVi6sz4kk9R5AdsY7VMsV+cNdiiqnpUv5l/x
 oQtX10qu4cdZC6EeTCIBwYe6/eVixh8SdxVh2ZF4FlNJGgWuyz11FYSvO+S8JIfYlMvq+p7t4A1
 3yMXyyOrAwgzI311G0ns6WSOxuCckzQfyLm22m9wp5bxcYGERKS3AT2qYCMwUrcStzPZm3Rlq7a
 9VpjOY/gF4Vx6bawm8W3ZjLnYYm7zItgCb3eQDVLPzbujedhdcsUAsANLUPaM2Tndanpv2BK7Ah
 oLmIfr+N6EaxnF2090CoG1alPSO1qxRjemVGtTfVsTROTuMmYAArKylP7zkZNnLCCQTRtuWtJUs
 j+Ccs4KxuBsZIECuOStxuiUryW1YcNdOX5wEHc68kdzqxrOCdovVZ2U9PDT/IGSz4stnKg/B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 mlxlogscore=999
 mlxscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507290114

This is needed to properly interpret some of the sections.

v2: Fix missing \n

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index fe38ea9328d4..a35cec606d59 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -1800,6 +1800,7 @@ static void a7xx_show_shader(struct a6xx_gpu_state_obj *obj,
 
 	print_name(p, "  - type: ", a7xx_statetype_names[block->statetype]);
 	print_name(p, "    - pipe: ", a7xx_pipe_names[block->pipeid]);
+	drm_printf(p, "    - location: %d\n", block->location);
 
 	for (i = 0; i < block->num_sps; i++) {
 		drm_printf(p, "      - sp: %d\n", i);
@@ -1877,6 +1878,7 @@ static void a7xx_show_dbgahb_cluster(struct a6xx_gpu_state_obj *obj,
 		print_name(p, "  - pipe: ", a7xx_pipe_names[dbgahb->pipe_id]);
 		print_name(p, "    - cluster-name: ", a7xx_cluster_names[dbgahb->cluster_id]);
 		drm_printf(p, "      - context: %d\n", dbgahb->context_id);
+		drm_printf(p, "      - location: %d\n", dbgahb->location_id);
 		a7xx_show_registers_indented(dbgahb->regs, obj->data, p, 4);
 	}
 }
-- 
2.50.1


