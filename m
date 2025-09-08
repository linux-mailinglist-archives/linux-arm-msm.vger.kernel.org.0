Return-Path: <linux-arm-msm+bounces-72522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFE8B4872D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 10:31:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F6F818928A9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 08:31:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39F632F99A5;
	Mon,  8 Sep 2025 08:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bkQ0U1k/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911FF2EACF3
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 08:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757320094; cv=none; b=XoxV9hkGn+qqb1VX6/5jW1Qi2ETC2+0vCNSipepfqCSpHJeckNZc/nB5B86Waif4Py5maPotTzJFFgFUDiLaIymjpvyEOOgv09V9MxJ5YjUmamYKIUcR73Nplp6Evv4Fnz6MM1XEie9HePSK3b4o2780jzgwfymwsHB59uwvGHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757320094; c=relaxed/simple;
	bh=hcHfihbqCnMNLjvYKeukB8x/8H4c4Vf9wDORLxifp3c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZlBSTpo00wGaaX3Rrg0f5Le9VqeL5K+9ch2a5OFpla0tFtUc22rdqn5vMvsnZvavDMO866Yry/XwIlYskxCQ+ZDuAsUG2/yxqBxNmzV9+vp54GbeQ2Qod5kI0LHPNVXJm70ktr0TZmjllnpmFoFPFCkHgYb87519JOnw9VwLVQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bkQ0U1k/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587LN3Qp014574
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 08:28:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A0C4E7Nw7YzjCUNPjzfc7hGVXIhBZt+qciFyEW/6v7I=; b=bkQ0U1k/oSGFwyCO
	7bKvvgQDYYSGUqbaV9ebliIN33m4XHXaidp6cBUW94/UW+e8X/1Me81NFcJXKm2T
	RU+O9W6CsQUwsMQSkc/CEk/dM7tM7ihgVQMmghC7nudPoXL4lUmQOA6J9iEcplFH
	N7yLI4XLV8XioMG0N5rk8EJ6Nx0bs2msNu2KyqlpGuYDrl/vk8OTv17jsqFejwXW
	uxoXT3uCTeAMFjpsBzsjPy4ki4HFabsCqCCgbY+OdCGugrbuyHG5ZIBevR7eFFf9
	5VT5dWfvVUw8k9PCdO2Vtmj28CUQuArjvDy9hCGEFo0OMEqytflnWoELskI76X0J
	o6RhNQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490c9j3vf8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 08:28:11 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b4c928089fdso6615375a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 01:28:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757320090; x=1757924890;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A0C4E7Nw7YzjCUNPjzfc7hGVXIhBZt+qciFyEW/6v7I=;
        b=bGCGjiDEHv5J5uZiKGXyxb9XtBcPha/wPwIDRRkhuTqIF9nzbI1BkcaOmpwyNVFRyS
         RXEDY6jXD8LXWQUQSnt8QDbPztHwZUUySg2kuSVdtJK6GlDhr1WRXe/2LWssjsjtuu5x
         zD6mzzJ8BbfEl6RTX/rV7OvFMJ3mbr8/oX0YbH/IfWZrGDHurRtBcLU7tLmUaSoX/0nd
         SlXttXIONSa/pM+9YcsHgKHOvKdUOfIWO7/vIPJhG84/bpSjoFCVGlVibkmijLr/Vulu
         DwnYGWXpCLlheU89K1XBSknaRbAofiCG9xztaD/9mngW4zAwqIbUlCCBWWbM5bQb/kIx
         GwTg==
X-Gm-Message-State: AOJu0YyfhL55TJzHK/2xnplaa3KkJzZGYZ8g9btmVCH5wh6cm7uDBVMV
	Ar7+q4oO/mo88BwS8SRRc98OM80kP9pxfo+6E1TjXe+YFhFFOEkNraLq9WO7WdwvUBnMlg3gfgg
	G3ehHh1Sy3UqF4tmdjDSQO+SqeMITtxbHQiKbtGM5Y+83XiubdaHBIK+dp21fgFVwtG4S
X-Gm-Gg: ASbGncvUy9mBNgbLGNegTkmI+rpWDPnGvfi/dEUBoYb9sTDpq1jOwHUHnWpqX8b35er
	ly56HjxNfVDZ9kXMM+rXqdUEOt73k2IV6ydLoWRQ50uI34KOV/1s+CezlXzBM5oTxwCRJhSTFrh
	2laRQ/26W5inBYS4Op+NRoMlRnS9Fj6ASZRSBSEFo8XDuVT0/B+RvioUsJbAK2SGko3O9g79wIC
	dKRBuPiNLHcUHm/DbzCML5QL5DkFNOCseyYXsmun5gdjI8S+SnzcHOF0HFzeFTJ6ic2OkeoSr7f
	/fKN2mF2vLZze7wpGrCZuoUKYzIBYoaIpGymB3nMuXnd2EpJz1yh1eI3tu3T76R2
X-Received: by 2002:a05:6a21:998d:b0:246:2c:113 with SMTP id adf61e73a8af0-2533e573539mr9966582637.4.1757320090109;
        Mon, 08 Sep 2025 01:28:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9eglLLYqQpIkbqR7FguLgctxfLEBzAKKqAMxb/nL1fgIXdEAQROcNKw3dgjcDi4rjeIiPMA==
X-Received: by 2002:a05:6a21:998d:b0:246:2c:113 with SMTP id adf61e73a8af0-2533e573539mr9966553637.4.1757320089627;
        Mon, 08 Sep 2025 01:28:09 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a26bc9csm29157523b3a.18.2025.09.08.01.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 01:28:09 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 08 Sep 2025 13:57:04 +0530
Subject: [PATCH v2 11/16] drm/msm: Add support for IFPC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-ifpc-support-v2-11-631b1080bf91@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757320036; l=3943;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=hcHfihbqCnMNLjvYKeukB8x/8H4c4Vf9wDORLxifp3c=;
 b=zetP+yadiCZUchc7jrkjvEtlnEQLCrAdJRJ9OKW+7RAA2wjN8liFMXKKKEZUWHObTkaKk2Ca8
 MK+E5Cj5o6FCtx2/8H6Jur1dX2zKxzqN72jjx1EOQ+/Q0RiOe5BPvNn
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyMiBTYWx0ZWRfX/fFztX4WkjhM
 5h1S+r4PnFZ9kWDhE1NTwdANSWkmKXhxSSWuMmUqeKOHWEn1cplxYIZJ3L0QrJOFke5rSxl5ihp
 lkR3RYVkWImpZn+L2QaJbeACAgL6mXXef0a5UKwmm9R1ezFmPu8Jmv/rbS6IfZgQl7N0jXmitFl
 Zq+g5d49lclhvHhD+Gy3I8CwA7lHZ8aNlJRTtLwEItvTldQLIOAzl4EmmF81IN6OviXPRKO5uZM
 TJL1AIpyNSNoM09dl3ayYyqdA/lXRtlkLBvQ0uwaLTJ3V/sM4+T7v1xIBZiyyeNK58Ed+cuoAQe
 rVzKIHuFwCGO309glASztYPCRcjtXqYJqVNhp7nBxbfgwOQ+60jk99gn4dd0r0f355d0CpCJUsg
 Ztw/eNa/
X-Proofpoint-ORIG-GUID: j-is5jg5atEd5aDQp6yY0NCksdM0IFfM
X-Authority-Analysis: v=2.4 cv=PpOTbxM3 c=1 sm=1 tr=0 ts=68be939b cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=P3MwbOLga73G8009EeoA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: j-is5jg5atEd5aDQp6yY0NCksdM0IFfM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_02,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060022

Add a new quirk to denote IFPC (Inter-Frame Power Collapse) support
for a gpu. Based on this flag send the feature ctrl hfi message to
GMU to enable IFPC support.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c   |  5 +++--
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c   | 34 +++++++++++++++++++++++++++------
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |  1 +
 3 files changed, 32 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 18f5fc2c28e33d81ccc248216cc018300c81eb77..d6297cc7fe664a74224c441e877050612714a3e4 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1961,8 +1961,9 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	if (ret)
 		return ret;
 
-	/* Fow now, don't do anything fancy until we get our feet under us */
-	gmu->idle_level = GMU_IDLE_STATE_ACTIVE;
+	/* Set GMU idle level */
+	gmu->idle_level = (adreno_gpu->info->quirks & ADRENO_QUIRK_IFPC) ?
+		GMU_IDLE_STATE_IFPC : GMU_IDLE_STATE_ACTIVE;
 
 	pm_runtime_enable(gmu->dev);
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
index 8e69b1e8465711837151725c8f70e7b4b16a368e..550de6ad68effacaea09751891c2528464bdfcc5 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
@@ -21,6 +21,7 @@ static const char * const a6xx_hfi_msg_id[] = {
 	HFI_MSG_ID(HFI_H2F_MSG_PERF_TABLE),
 	HFI_MSG_ID(HFI_H2F_MSG_TEST),
 	HFI_MSG_ID(HFI_H2F_MSG_START),
+	HFI_MSG_ID(HFI_H2F_FEATURE_CTRL),
 	HFI_MSG_ID(HFI_H2F_MSG_CORE_FW_START),
 	HFI_MSG_ID(HFI_H2F_MSG_GX_BW_PERF_VOTE),
 	HFI_MSG_ID(HFI_H2F_MSG_PREPARE_SLUMBER),
@@ -765,23 +766,40 @@ static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gmu)
 		NULL, 0);
 }
 
+static int a6xx_hfi_feature_ctrl_msg(struct a6xx_gmu *gmu, u32 feature, u32 enable, u32 data)
+{
+	struct a6xx_hfi_msg_feature_ctrl msg = {
+		.feature = feature,
+		.enable = enable,
+		.data = data,
+	};
+
+	return a6xx_hfi_send_msg(gmu, HFI_H2F_FEATURE_CTRL, &msg, sizeof(msg), NULL, 0);
+}
+
+#define HFI_FEATURE_IFPC 9
+#define IFPC_LONG_HYST 0x1680
+
+static int a6xx_hfi_enable_ifpc(struct a6xx_gmu *gmu)
+{
+	if (gmu->idle_level != GMU_IDLE_STATE_IFPC)
+		return 0;
+
+	return a6xx_hfi_feature_ctrl_msg(gmu, HFI_FEATURE_IFPC, 1, IFPC_LONG_HYST);
+}
+
 #define HFI_FEATURE_ACD 12
 
 static int a6xx_hfi_enable_acd(struct a6xx_gmu *gmu)
 {
 	struct a6xx_hfi_acd_table *acd_table = &gmu->acd_table;
-	struct a6xx_hfi_msg_feature_ctrl msg = {
-		.feature = HFI_FEATURE_ACD,
-		.enable = 1,
-		.data = 0,
-	};
 	int ret;
 
 	if (!acd_table->enable_by_level)
 		return 0;
 
 	/* Enable ACD feature at GMU */
-	ret = a6xx_hfi_send_msg(gmu, HFI_H2F_FEATURE_CTRL, &msg, sizeof(msg), NULL, 0);
+	ret = a6xx_hfi_feature_ctrl_msg(gmu, HFI_FEATURE_ACD, 1, 0);
 	if (ret) {
 		DRM_DEV_ERROR(gmu->dev, "Unable to enable ACD (%d)\n", ret);
 		return ret;
@@ -898,6 +916,10 @@ int a6xx_hfi_start(struct a6xx_gmu *gmu, int boot_state)
 	if (ret)
 		return ret;
 
+	ret = a6xx_hfi_enable_ifpc(gmu);
+	if (ret)
+		return ret;
+
 	ret = a6xx_hfi_send_core_fw_start(gmu);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 9dc93c247196d5b8b3659157f7aeea81809d4056..390fa6720d9b096f4fa7d1639645d453d43b153a 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -59,6 +59,7 @@ enum adreno_family {
 #define ADRENO_QUIRK_HAS_CACHED_COHERENT	BIT(4)
 #define ADRENO_QUIRK_PREEMPTION			BIT(5)
 #define ADRENO_QUIRK_4GB_VA			BIT(6)
+#define ADRENO_QUIRK_IFPC			BIT(7)
 
 /* Helper for formating the chip_id in the way that userspace tools like
  * crashdec expect.

-- 
2.50.1


