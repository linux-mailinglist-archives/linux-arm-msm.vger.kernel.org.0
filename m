Return-Path: <linux-arm-msm+bounces-72517-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3B3B48723
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 10:30:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E87416CA01
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 08:29:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C4052F1FE8;
	Mon,  8 Sep 2025 08:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nqgU229t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38F12EE61D
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 08:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757320072; cv=none; b=a2wjJKZM0cn/zRaiEGtulqotwfADBwvZcuXjZt2EwH9eUdNDIDczDX7IirfM1qOLFfsyOxFIMwm9hmoZ2QfC61+MYZ/1qYxa95TlZyD2gWhQk0J2BbD1VwsoS+gt4aXtqgYwCvEdMTUGvDXHpoGHm6jT++Cd7yav9EtoAGbw2Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757320072; c=relaxed/simple;
	bh=YQ2FW8mrQywbHukXvi9BRZ8Zf2lAQF8Asu7HWpVsQ6w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZVg9aCpQcTsfAPVSmVk5c8AIun4kG12d9B+F9IOnLPnj24P6b1DxadBJVwPSEh1YYvGCpjL99RAZchLNoQ5y3N+bp3haxvJe8XjboHbmTk/htW0fipD/LpJr5jFugVYs5apZXi678VlwkGUMTacZJJcVLQWz0xE7gXnvM3u36AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nqgU229t; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587LnPTm028663
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 08:27:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1nUyUpKi7e4ePG1N5pB+4o6pcKvcsMs745pR85FFLuM=; b=nqgU229tcFj8ljF9
	nUifj4avGfh7JDdoMTPeFRsPolELSloHpT+VVWbsJilpefCLQztprAAp7vNeJZU9
	alHYzaRcUdEBLhJ1i5Qy8DZQBWs03vGpmbNiUV+1OkRk/xUiAOyl0FYxmaywt+Zp
	J/S2tlXWDxhgna2sfAm0FG+FmZ0gtkT4DWBgZ3O46T+BflchZMnlv3YrnhkdqYRK
	dpx+ROt7RNiZ3HEWKmiWIfd76pMh6Q7qO9dIypQzsEwB7GSzeNVukbu6/P13NPLm
	WEzYyB9XzXTikWdQKyR/6e9pQMWhQgwTH7JiigsaJZ7DjAk5eYhoBAytytNi4yc0
	7iNOQA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490c9j3ve9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 08:27:49 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7725a76dcb4so3675293b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 01:27:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757320068; x=1757924868;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1nUyUpKi7e4ePG1N5pB+4o6pcKvcsMs745pR85FFLuM=;
        b=rCO/WB3ME+yBRfHYcEUdkGYuHwiDObCMyn48Wo1LoyXSWzW9oInTLRr9g+7MZZOiqM
         mLQED5VN3rmOvkiaorAij7Kl80tgqgm9Y0DaksHa+u3rayJNchnzqhtqI3t/ZgGRQiKP
         n0hrD6Gc9+9g43qTBldV+ptekTI3ErY7yKWSNfmW94rHLPluRDrC52SK95ZumQY3P+50
         vi5lyLzitPMFaTWMVVQ77b3lQb9jThtxbKbv7vFchyGVnnCYak5tijFRF+1IhjSOIAtg
         xxeNydYRRXpDRSWGrZqODskIW8J6DRj8c+hP49yQeizTWQxAy9XB/gDHxOSbhloxFUK2
         vV+w==
X-Gm-Message-State: AOJu0Yy6gAYjmDN2TMn0hFpJ8izz8ncneLcBli3CYg5l8hqfpykPVwQm
	tmiEYhGGepepnua9owcJ6lcyGu5pkXAXivqAfgwCmDjur/Jyx4SzP9FVN4Ukk1uHXm03n7PVW/l
	XQFmFow5rLUGlZRduYpWH3FJ5DqtAH/0b02kwnKdiVOrehC2oazTmRYgVZ62D8Ga0rMMZ
X-Gm-Gg: ASbGncsCH+0nTjPyg0Wmp+N9jmdRGJ0DrsmG5w8jf4nBssO54LWiMxSjI2TkhNf/2RX
	d2aOIBZrZbhNrMj0cwQspmLqC91yc2M2ORQv13rYcfv22LRZmbwolcw+T2ql9PSVMXrEypSj+aP
	Mys2PZGG93hnk84CwqcyYTKdBKlp0eLQ2NuUfJIKYSTLAvSBOu+GlT6fZV/2PLbkGu6vyKGihQj
	NA22zI8Boe624z24gzEmfvl/VOkgPx/L++rzb6rRHV94clrdxSJ+dheKPQNFc6rUuS6A2iFu/M+
	OdfrkgzFcnWfuD4zqrfyZCrlo0UN1fsLdokb8o2nUlmM0/OihOxiTaBZj1NtFNCl
X-Received: by 2002:a05:6a00:140d:b0:772:7b9b:b1b6 with SMTP id d2e1a72fcca58-7742e4744e3mr8523405b3a.9.1757320068403;
        Mon, 08 Sep 2025 01:27:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVjuJK/G+P4YvXM69DGczHhw72zFeO7sf37Efafvi/Vxh1TICLvoz+DFmTAkwbSZSkIWwwyA==
X-Received: by 2002:a05:6a00:140d:b0:772:7b9b:b1b6 with SMTP id d2e1a72fcca58-7742e4744e3mr8523381b3a.9.1757320067910;
        Mon, 08 Sep 2025 01:27:47 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a26bc9csm29157523b3a.18.2025.09.08.01.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 01:27:47 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 08 Sep 2025 13:56:59 +0530
Subject: [PATCH v2 06/16] drm/msm: Add an ftrace for gpu register access
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-ifpc-support-v2-6-631b1080bf91@oss.qualcomm.com>
References: <20250908-ifpc-support-v2-0-631b1080bf91@oss.qualcomm.com>
In-Reply-To: <20250908-ifpc-support-v2-0-631b1080bf91@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757320036; l=2909;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=YQ2FW8mrQywbHukXvi9BRZ8Zf2lAQF8Asu7HWpVsQ6w=;
 b=FnEKqw7xBdZgbmj77T8HCgPsmNDKyxAmJ3IKiWW8PFY/RpSu7S3o7rVgi8HfZRBx2G/WFi4M5
 P08U8MzeCGKBhSzx7qW04sC7hddFrieB7QxtnW1+nsqpzBIt+J7Mew4
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyMiBTYWx0ZWRfX6B+UtT0rhMxh
 ncF+tWgIqIfZRlmGC/s6JSWBSLAa6l0lbIbAnoNsa7ka0Qftz6Z/jA2d90SEfyb1iPgyZEMKrMl
 IniM0VPxRKOS4QuX35t4M20CakQh5h5Ro0VHV/7m4Sb0Uq+ny0+MfsqvOh4S+E0J6wwrmTugdDC
 wpY+AS5ikjGSnJ7YK/H3KzAperm9Ts1ffKtnhRXDn7YUODocreGyxFvVWSI9+O3iTecPZXeyZlV
 qith+E3hSrPtgUBHzXl+TkaueJ1UBsBK70+bWEe0RCi/s5xuBtY2oGHOT2XKQ78ZDCZKF86oecr
 QdO5Jjvim3hg5rGGeDXSMc+PaObY7lC1ZdHKUFjQ/WZCMtw1haNDbW68IXvTq5c/pO29VWXp57F
 x8RVmpUv
X-Proofpoint-ORIG-GUID: YmCa6TI_LTVhCC3e53TbLsC6LPflWfiE
X-Authority-Analysis: v=2.4 cv=PpOTbxM3 c=1 sm=1 tr=0 ts=68be9385 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=exQ2vEUdbx4SU7VtH2AA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: YmCa6TI_LTVhCC3e53TbLsC6LPflWfiE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_02,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060022

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
index b2a96544f92a55cdb372729498b8f0b0f9ca80bd..866bb090af064666586cea7125254bd375b7a35c 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -16,6 +16,7 @@
 
 #include "msm_drv.h"
 #include "msm_fence.h"
+#include "msm_gpu_trace.h"
 #include "msm_ringbuffer.h"
 #include "msm_gem.h"
 
@@ -613,16 +614,19 @@ struct msm_gpu_state {
 
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
 
@@ -644,7 +648,9 @@ static inline u64 gpu_read64(struct msm_gpu *gpu, u32 reg)
 	 * when the lo is read, so make sure to read the lo first to trigger
 	 * that
 	 */
+	trace_msm_gpu_regaccess(reg);
 	val = (u64) readl(gpu->mmio + (reg << 2));
+	trace_msm_gpu_regaccess(reg+1);
 	val |= ((u64) readl(gpu->mmio + ((reg + 1) << 2)) << 32);
 
 	return val;
@@ -652,8 +658,10 @@ static inline u64 gpu_read64(struct msm_gpu *gpu, u32 reg)
 
 static inline void gpu_write64(struct msm_gpu *gpu, u32 reg, u64 val)
 {
+	trace_msm_gpu_regaccess(reg);
 	/* Why not a writeq here? Read the screed above */
 	writel(lower_32_bits(val), gpu->mmio + (reg << 2));
+	trace_msm_gpu_regaccess(reg+1);
 	writel(upper_32_bits(val), gpu->mmio + ((reg + 1) << 2));
 }
 
diff --git a/drivers/gpu/drm/msm/msm_gpu_trace.h b/drivers/gpu/drm/msm/msm_gpu_trace.h
index 781bbe5540bde6d9cd6758050229fd0406fad232..5417f8d389a370e8d0b9c7e447050e2965011c0a 100644
--- a/drivers/gpu/drm/msm/msm_gpu_trace.h
+++ b/drivers/gpu/drm/msm/msm_gpu_trace.h
@@ -219,6 +219,18 @@ TRACE_EVENT(msm_mmu_prealloc_cleanup,
 		TP_printk("count=%u, remaining=%u", __entry->count, __entry->remaining)
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


