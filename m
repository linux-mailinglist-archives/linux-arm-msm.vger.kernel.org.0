Return-Path: <linux-arm-msm+bounces-65795-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F31AB0B5FD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Jul 2025 14:18:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 108FD189B88B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Jul 2025 12:18:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FD3E21C9E8;
	Sun, 20 Jul 2025 12:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o1lNwsmu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C990021B9E5
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jul 2025 12:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753013838; cv=none; b=rGl/jb/YiULEwn3znYU+aOtvuYJaGqXUE2daeDMi+1okZjpmA4G3ePWaCeS5oigEoVCoGV6q0PgrNjbXi/8KZp3NPxzMyPqhZ4nF5EQI3wSggpCoExNMtG71vqybKMUicbkyY+SoEi2sFt9IVfvpQ3eKcOebjwsqyv7I/EHTTqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753013838; c=relaxed/simple;
	bh=Bix42dg0qNYgpzOcauSDsSEviuQA7o0gZ10lc64yFRA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cx/thEDXNgFY7oJcsmXelUX1+y+Mqmt+JUZgyqjO4eocxDBVcFpQk/nX1ADeCigTH6pT0LlZ0oJ1E6XrgvfgES1BaP2ANBdTOmp3EMABxI/tV+zgKpJGuSEL7qC+7tsKTzHgKDih3lqedfpgSCzbDOpVp2Q/lmbVWEwvIAu5iKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o1lNwsmu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56KAMfLH016052
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jul 2025 12:17:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dR6sJoRx42AUBHrEb7MmdRjO9rtN5rgEN4p3npPlmaw=; b=o1lNwsmubhRzA/MS
	hLpfMpaha9gGnARu5/Cv1lRhRzNcttZd6Ik6Bn/kWu3M6Z0AUOG5VFUqbc3c0qUA
	A+rw9X/j1xSQyPk/EJsuKd5bBCuK6tum5yE7l4XSNKXKY7dAFpsrGwnEbiuihZ64
	XzpW8FrCD9Ys5vrn682IM3qIkeskpQYLVFBqMTHzcJbQOqI21s8xARLalmo/jPCu
	fqii/qScMLpBrPFT7MA+C8PncqWcFuAi2hjwMs/y/bkoZ4Gm85RL6EPYN8oSpSpK
	I+1ZfnkdvxI/xq4kOrgUABR+urkbj31XwrodsN/u1x1AAV5ZuL1GSy3ebMUNRWSn
	8RuHTg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4804hmj40v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jul 2025 12:17:15 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-74ea5d9982cso2538915b3a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jul 2025 05:17:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753013835; x=1753618635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dR6sJoRx42AUBHrEb7MmdRjO9rtN5rgEN4p3npPlmaw=;
        b=HfguBtQgvRYwS7CbDvy5ZzKoVexAJJDarMAGi02drr3tmBdr2aeyrWLu/upQbO4Zt3
         WmaSUyjqVCm1ljyS7JQ221FxZyRk6axOzP9yaixoUevZc/XD/X8Uas5SbfXnhatTbblA
         a+JggAVzxdLmdCpmz/PRfgGlm2gfisn8WTc3j0QSPqN7hYrl/o6Osi67hQnORqxTe8m1
         bzpdmeYp6+qfVBZvdOMjTagc6SNyZAu9LNcQzJBVCguiz+emuU71s4100yEWKxetj+RN
         FBbsL9zmgoEchflCaM9GBwfqx9OJDDsSUAB1Cs0UF5QXeqX4udeohZk9Mpo1iQOfXqcV
         owfQ==
X-Gm-Message-State: AOJu0YwISWHClVL2E318vfKaXyPFN+kAqRz4gi5oQvZvKqRySowffL6d
	nNRUbwijB9/LfsMiaUUFaRGePrw1QZRi3ANA/b3Gks/qqBj28h39bx5NtJkdzc54WVYtcGUOBea
	7CIP24UKFmW+Se2QCVnAfccSbeKkjegvjTDqbWR90olT+smssnZnGFIfJYhsK7+ztQTpx3wmvCJ
	y7
X-Gm-Gg: ASbGncvK+0XBLXmOHYpnvD18ZVPTV0dtca42els8XGqya0H2xR5WMULUYjW0DjwFvQx
	1VkT1OCniO7De5z7ztZIqAOGcwRSRI5+yLPRvZpUnKCEj0grhPq3kC3oiTtzq1KHiM7c4oEajI4
	OBvzn6umjpLjbkmKde7mLITMI/my24UBfLwey1zKzHpdZr01NN9I/eX65oj3zyEjbeOIHblyA+p
	01xc5DlkJPArMNvIGWRbaRUCB8/Fsk96HpysyzCaC6pWM0qpGQd1/bJkGuF+ZTAjR2H+StQgQEn
	akT4L41qMx3zMWDWhN92g8gTZ8RvdfccUJkY4m6NXwJ2veCbeqkeaaLVMx791XqJ
X-Received: by 2002:aa7:88cd:0:b0:736:50d1:fc84 with SMTP id d2e1a72fcca58-759adede58fmr12673873b3a.21.1753013834622;
        Sun, 20 Jul 2025 05:17:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcUStfPYDQTBrk5cKGxg9YMZv8SDo8dk5ZyQbi7KZdgKDGTRDIDq4rMokvtBoMwA8YBTbBSA==
X-Received: by 2002:aa7:88cd:0:b0:736:50d1:fc84 with SMTP id d2e1a72fcca58-759adede58fmr12673847b3a.21.1753013834116;
        Sun, 20 Jul 2025 05:17:14 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cb154755sm4097933b3a.69.2025.07.20.05.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 05:17:13 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 20 Jul 2025 17:46:07 +0530
Subject: [PATCH 06/17] drm/msm: Add an ftrace for gpu register access
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250720-ifpc-support-v1-6-9347aa5bcbd6@oss.qualcomm.com>
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
In-Reply-To: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753013805; l=2882;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=Bix42dg0qNYgpzOcauSDsSEviuQA7o0gZ10lc64yFRA=;
 b=YDcbRCw8zDNRVcb9x3+mPngvXNp74oc1PZwPDltZ9H3uAEhptH18/Sp1nZ5fWdZhqFXz7Nxce
 p70pMJfYquPADo46uV6P3ZE8srdpoHJ6xSt6JO7r5zRcvJ9CNUbWZb9
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: lzWsbaBmqnZlFvNkJ2BhSYkpCkWZ0fHP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIwMDExNyBTYWx0ZWRfX6G4rYzu6N5ca
 R1UCbDf/lmPv5DGNmIhNdbXydevWZm6CHR+pNRmjPGO7z5tFev7GpbPYFU4VerlE4Eo6ie5wpDH
 WP4/6TyTsBJjKDPuv4AGhYAw34kKIYgaeNvb23daZPeakY3od5EAugjgWhlcUey8IZYQlKyoV7T
 ViIQ4puGPesae9/kt4vUEmnNKBBtWPyOi7mAgemgS1vh/tfJBqReb3L2XLuR6SigEgo7bDFhPt4
 yF5wBmxMhzyFEbK5q4dR8V8DWEWUIAeJ0EhBYUpkpb8R3Cz9sIiwnkQVyPqOKQZ3xkZKDHZdRs1
 P2fNp7nu+8c/8zOCsdn622W9xpYKGuguFoqrigqvh7FycUeAAfzyaRLyAgFWtDlthtlHE+/d6V3
 y/uKLYTVtbTCA+8zNiRMQ0B2NTQi1YQC+axuZpVqOeOx/pz4BOyxqhxq6Iyxj/yRXb8LrqpG
X-Authority-Analysis: v=2.4 cv=Navm13D4 c=1 sm=1 tr=0 ts=687cde4b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=exQ2vEUdbx4SU7VtH2AA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: lzWsbaBmqnZlFvNkJ2BhSYkpCkWZ0fHP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-19_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0
 mlxscore=0 impostorscore=0 clxscore=1015 bulkscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507200117

With IFPC, there is a probability of accessing a GX domain register when
it is collapsed, which leads to gmu fence errors. To debug this, we need
to trace every gpu register accesses and identify the one just before a
gmu fence error. So, add an ftrace to track all gpu register accesses.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gpu.h       |  8 ++++++++
 drivers/gpu/drm/msm/msm_gpu_trace.h | 12 ++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 5bf7cd985b9c50e38468fed695234f787919a8aa..a0a0cf9efb3a8035a80cbbbf30ad294a72ccbd48 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -16,6 +16,7 @@
 
 #include "msm_drv.h"
 #include "msm_fence.h"
+#include "msm_gpu_trace.h"
 #include "msm_ringbuffer.h"
 #include "msm_gem.h"
 
@@ -555,16 +556,19 @@ struct msm_gpu_state {
 
 static inline void gpu_write(struct msm_gpu *gpu, u32 reg, u32 data)
 {
+	trace_msm_gpu_regaccess(reg);
 	writel(data, gpu->mmio + (reg << 2));
 }
 
 static inline u32 gpu_read(struct msm_gpu *gpu, u32 reg)
 {
+	trace_msm_gpu_regaccess(reg);
 	return readl(gpu->mmio + (reg << 2));
 }
 
 static inline void gpu_rmw(struct msm_gpu *gpu, u32 reg, u32 mask, u32 or)
 {
+	trace_msm_gpu_regaccess(reg);
 	msm_rmw(gpu->mmio + (reg << 2), mask, or);
 }
 
@@ -586,7 +590,9 @@ static inline u64 gpu_read64(struct msm_gpu *gpu, u32 reg)
 	 * when the lo is read, so make sure to read the lo first to trigger
 	 * that
 	 */
+	trace_msm_gpu_regaccess(reg);
 	val = (u64) readl(gpu->mmio + (reg << 2));
+	trace_msm_gpu_regaccess(reg+1);
 	val |= ((u64) readl(gpu->mmio + ((reg + 1) << 2)) << 32);
 
 	return val;
@@ -594,8 +600,10 @@ static inline u64 gpu_read64(struct msm_gpu *gpu, u32 reg)
 
 static inline void gpu_write64(struct msm_gpu *gpu, u32 reg, u64 val)
 {
+	trace_msm_gpu_regaccess(reg);
 	/* Why not a writeq here? Read the screed above */
 	writel(lower_32_bits(val), gpu->mmio + (reg << 2));
+	trace_msm_gpu_regaccess(reg+1);
 	writel(upper_32_bits(val), gpu->mmio + ((reg + 1) << 2));
 }
 
diff --git a/drivers/gpu/drm/msm/msm_gpu_trace.h b/drivers/gpu/drm/msm/msm_gpu_trace.h
index 7f863282db0d7812c8fd53b3f1fc0cd5635028ba..193dc9c8a7705c8988b8c4b60aa78a74e00af932 100644
--- a/drivers/gpu/drm/msm/msm_gpu_trace.h
+++ b/drivers/gpu/drm/msm/msm_gpu_trace.h
@@ -205,6 +205,18 @@ TRACE_EVENT(msm_gpu_preemption_irq,
 		TP_printk("preempted to %u", __entry->ring_id)
 );
 
+TRACE_EVENT(msm_gpu_regaccess,
+		TP_PROTO(u32 offset),
+		TP_ARGS(offset),
+		TP_STRUCT__entry(
+			__field(u32, offset)
+			),
+		TP_fast_assign(
+			__entry->offset = offset;
+			),
+		TP_printk("offset=0x%x", __entry->offset)
+);
+
 #endif
 
 #undef TRACE_INCLUDE_PATH

-- 
2.50.1


