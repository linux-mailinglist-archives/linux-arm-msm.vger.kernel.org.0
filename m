Return-Path: <linux-arm-msm+bounces-82210-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F186AC68550
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 09:53:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id D6BCD2A3F9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 08:53:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35350314D00;
	Tue, 18 Nov 2025 08:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i4kJqj7H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UTOt7i6C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD7BB3126D2
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 08:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763455936; cv=none; b=PyhHkTsyiVxju6YpzS8V7so+ulcKk9Lz5dcw7OQrSJHalA5QVqut1jeytwqcrRUnlLvLGVJSfVYTo2fdsYgxOlotSND4hiceE4ZB4BZ5U0Yj66hSCGjkuQif1Rj69DK2xf6yC4IKLwdIdX8ugr3iNlb0GEXdPBvcWDvz/neDtJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763455936; c=relaxed/simple;
	bh=vVeIWVb6/O65xXMPCwHkJepVe1RNfzVF3KjNUn+Tu2I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r6weVzDK4TwzlYbRxIh2dPJKm4F8YU4TC/oUJ/Wy02CCjJPZ/IzcrPtzdwm16O2Z9lt+TmJlaJDynjzj/7ps0Evn1aKaApQb1FMZIFFYl2bBgru/7MjRhvNhCIV/yu3h6mhvot4Au2eF2lS/OXyJc/Yml9qP3ZVkhNzHn9KIlR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i4kJqj7H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UTOt7i6C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI8VQQW2249905
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 08:52:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eLaq0rEgvGtAfaQgBbzK+2z25S35G2xyAjIzDCq9mo8=; b=i4kJqj7HGJxBNHRd
	pTEmc03++M247mGtaHLvboxPV3bu9Cx4W7q9AzCFwldc6x6PFEwFQzlLT9olFPP6
	2F5xkVympvifrfPP/vdT0hCLa5elzwumkQ5poAPy/8MnxSpxRIziIjxzlIms8yKN
	R/aiXuF+BX5ORsP3dQ0xnf0QJccd8vVxxA7NYJVWNWM8nW/zEk2aSmMfEKqTYSNv
	5Tuh7izfesavFYjF8D7zHjqiIw8nvVZuvRHuDoNjaspnkdyhWR7JkOliPrFy3Yx/
	I6VcanGEQ4/4exxEZ9IAo8tBmPAamx+JagxHjp/S4KHGnDrl1G4MLd7XD8i9Hpba
	gYAZSg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agnc5g1rn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 08:52:12 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-297f587dc2eso95587985ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 00:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763455932; x=1764060732; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eLaq0rEgvGtAfaQgBbzK+2z25S35G2xyAjIzDCq9mo8=;
        b=UTOt7i6CIOYlZqEahPw6b4tzL1pYwz3pH/APqOhlbAYTkDK+pjPXOVDXSIsat/0aw7
         ulPuhF6Z70uIl5U98DM0/q2DcGWs+IIKshOWwPr2GDDx2OeFzuLFMeJA1uvJIIONdkP6
         rCg4m0f9GvkESeN+u/XHcBM1Y0s7VUB5WaqBcJ1b3HEX3ZMB7SJZyGPnQDBzdvGAK7bM
         KngxemGtxCQSoIdaTXf076yG1+7yNNjcUTF22eOVA3HW2Izt2HT/b6N1w+E0HVubKGlY
         9umSpg514E2AuKMmcOhL1rBmte65M4fcYpHXin/VDNcVsMjvwyNZQ7BxQJdFHct7ERzb
         W6yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763455932; x=1764060732;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eLaq0rEgvGtAfaQgBbzK+2z25S35G2xyAjIzDCq9mo8=;
        b=BOgAoGTbxMlgXTylFK1hEX/X6Qcf6RBAVLWjT5tRN/X+ecQrsZlIwT09iQgH/NRBNU
         O3ZCwBkozpCqSAWd6TBoo/72HiZBGJUsQlNvYNAUVq/9Dh/bRpCUvRRayBtiJy+a0B/Z
         q2i7KkVWxpqGcBjSoR/vVLHuu0kkU2myS4JtQynotcCqfEX4Ur6KgVyCkVmXamhhEdDB
         extGF8YTSYU8K4oRJLvYv5zeL033LEdsbs/ogsruIiXAGPKX99F+xeTP4LwkIFjwdSFd
         WonMELvRZcpfoc3YvkmegLWO5a4grVEK6sodY+FwPMn47zVuv72363LitR2kcotJOFNB
         yBHg==
X-Gm-Message-State: AOJu0Yw3TzY2tBX+/dDRGT0EowAh48jtD0z1IUWBcHzaodnPWOV80OjW
	TGFwHIJ0ZQQmGMLeNkzooZWd7FfbVJsbPm5MHX2zIVdJNJi7mIeljqD9ZaMuey+dFd1+cdsaJFT
	22nWYHEBiiUrUxQk0P+aaQ5q91AP/HaXsZLlyo+e+atMOqYQDUyallyPNArOs0WqUjJpa
X-Gm-Gg: ASbGncuoNXoZLEggp86162uYpJj93NmowUBHE9mVCV1Z/c8MZBbliL56buUe2qjIOSP
	2fPldvAJIPbyZv1jKcPYUaZmfZ4Z6/qDHuiBKeOlP58yxwhT/ukJmkVcfeEWhkqcPJDKr3EgYmN
	HrzBTDonXGoUEUslKd68MbzbE5yf/fmzZYSo3zRdmT3jeCQpBQqelT4cLRxnAamW4m63ss7O5lK
	ENAq/S0j779QlA36OQddDy0S/92y1/n5dvqHNSBkwd/ULahkPWxoro3+d9n7vsmnQV3ZKgwJkub
	t//s6af3c1wlbCLpvjVc5wNMrdxWVUOQp8CQVeFNcRKCYZizP3rdZnDKfzFshlrD6NLPmtgGBA0
	fwtF5azuLR0Rs45fD6qD/twE=
X-Received: by 2002:a17:903:40c9:b0:295:98a1:7ddb with SMTP id d9443c01a7336-2986a76b80emr187942345ad.61.1763455932065;
        Tue, 18 Nov 2025 00:52:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHuRmrBbc/dLnfpzW67vqiSzLvO2GCc3zw2G2+R4D6v4gByj5OD0N9KHMTWShzhMrZVfqzGpA==
X-Received: by 2002:a17:903:40c9:b0:295:98a1:7ddb with SMTP id d9443c01a7336-2986a76b80emr187942015ad.61.1763455931526;
        Tue, 18 Nov 2025 00:52:11 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2568c1sm162910695ad.47.2025.11.18.00.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 00:52:11 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 14:20:34 +0530
Subject: [PATCH v4 07/22] drm/msm/adreno: Move gbif_halt() to
 adreno_gpu_func
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-kaana-gpu-support-v4-7-86eeb8e93fb6@oss.qualcomm.com>
References: <20251118-kaana-gpu-support-v4-0-86eeb8e93fb6@oss.qualcomm.com>
In-Reply-To: <20251118-kaana-gpu-support-v4-0-86eeb8e93fb6@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763455868; l=3603;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=vVeIWVb6/O65xXMPCwHkJepVe1RNfzVF3KjNUn+Tu2I=;
 b=mn64hAX+PZCwaGr9mtLhPoTUQxvBfGlWdpJjGyPWSsKD2Excv+y0rvk1aaeOYO1krY2o7l16G
 MVdWNEfEquICZqxHjf1KDyr3BVVz/H3kL63znYGY+Af/M1j6u9EoU4w
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: mQ4LQsidAd9X8p4iwblGsERosBgBljsI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA2OSBTYWx0ZWRfX8Uo+3pkJutJ8
 y4LfwdE+cRQpTxmlKPY7eiWjbWBKQrz0qIOMlRs3BjA+vfeKO0gSagSL6O31kH5I0Nw4hrPsyYW
 RR7TgPXRf3di/5e5kessQgZfgPZQyAgWIkTRa/LzAKn7eWSDIPLMRJb3HkbNvTgbxcDVMxDzcmv
 JeP+GaPmd8kK/YC0MZCNEtE3KUwOLRpGLu1XGgqeJTUA7w5Xqn/MWTi2KguR/4OFrhydmBYmOuQ
 Q3M2vYu1V0OyYEF4TGC6YV+RhRnaXl3xAltDzLL6CBawv7a3vBuguaFGW0Swtky2ZeCCoNQ/wCV
 Lt5Vg/nZAKGVYbL5n4pe5QrUeZP1rEoYvxaDcPNbV4l4XuISlW3FVh+ITMqobZmrGE0HFNsIPyi
 JEngE6Sl+LVRNYp0YC8V5A2sgL7jVg==
X-Authority-Analysis: v=2.4 cv=BYTVE7t2 c=1 sm=1 tr=0 ts=691c33bc cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=W_sW28Yvd0frASqVc48A:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: mQ4LQsidAd9X8p4iwblGsERosBgBljsI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180069

Move the gbif halt fn to adreno_gpu_func so that we can call different
implementation from common code. This will come handy when we implement
A8x layer.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c   | 4 ++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 7 +++++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 1 +
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 52653ad376fc..b0be246b44ab 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1079,7 +1079,7 @@ static void a6xx_gmu_force_off(struct a6xx_gmu *gmu)
 	/* Halt the gmu cm3 core */
 	gmu_write(gmu, REG_A6XX_GMU_CM3_SYSRESET, 1);
 
-	a6xx_bus_clear_pending_transactions(adreno_gpu, true);
+	adreno_gpu->funcs->bus_halt(adreno_gpu, true);
 
 	/* Reset GPU core blocks */
 	a6xx_gpu_sw_reset(gpu, true);
@@ -1251,7 +1251,7 @@ static void a6xx_gmu_shutdown(struct a6xx_gmu *gmu)
 	if (ret)
 		goto force_off;
 
-	a6xx_bus_clear_pending_transactions(adreno_gpu, a6xx_gpu->hung);
+	adreno_gpu->funcs->bus_halt(adreno_gpu, a6xx_gpu->hung);
 
 	/* tell the GMU we want to slumber */
 	ret = a6xx_gmu_notify_slumber(gmu);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index ba95b29855a3..575f2f9d3b1d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1595,7 +1595,7 @@ static void a6xx_recover(struct msm_gpu *gpu)
 
 	if (adreno_has_gmu_wrapper(adreno_gpu) || adreno_has_rgmu(adreno_gpu)) {
 		/* Drain the outstanding traffic on memory buses */
-		a6xx_bus_clear_pending_transactions(adreno_gpu, true);
+		adreno_gpu->funcs->bus_halt(adreno_gpu, true);
 
 		/* Reset the GPU to a clean state */
 		a6xx_gpu_sw_reset(gpu, true);
@@ -2316,7 +2316,7 @@ static int a6xx_pm_suspend(struct msm_gpu *gpu)
 	mutex_lock(&a6xx_gpu->gmu.lock);
 
 	/* Drain the outstanding traffic on memory buses */
-	a6xx_bus_clear_pending_transactions(adreno_gpu, true);
+	adreno_gpu->funcs->bus_halt(adreno_gpu, true);
 
 	if (adreno_is_a619_holi(adreno_gpu))
 		a6xx_sptprac_disable(gmu);
@@ -2685,6 +2685,7 @@ const struct adreno_gpu_funcs a6xx_gpu_funcs = {
 	},
 	.init = a6xx_gpu_init,
 	.get_timestamp = a6xx_gmu_get_timestamp,
+	.bus_halt = a6xx_bus_clear_pending_transactions,
 };
 
 const struct adreno_gpu_funcs a6xx_gmuwrapper_funcs = {
@@ -2715,6 +2716,7 @@ const struct adreno_gpu_funcs a6xx_gmuwrapper_funcs = {
 	},
 	.init = a6xx_gpu_init,
 	.get_timestamp = a6xx_get_timestamp,
+	.bus_halt = a6xx_bus_clear_pending_transactions,
 };
 
 const struct adreno_gpu_funcs a7xx_gpu_funcs = {
@@ -2747,4 +2749,5 @@ const struct adreno_gpu_funcs a7xx_gpu_funcs = {
 	},
 	.init = a6xx_gpu_init,
 	.get_timestamp = a6xx_gmu_get_timestamp,
+	.bus_halt = a6xx_bus_clear_pending_transactions,
 };
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 335acd5feb82..08bb601b3bd3 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -77,6 +77,7 @@ struct adreno_gpu_funcs {
 	struct msm_gpu_funcs base;
 	struct msm_gpu *(*init)(struct drm_device *dev);
 	int (*get_timestamp)(struct msm_gpu *gpu, uint64_t *value);
+	void (*bus_halt)(struct adreno_gpu *adreno_gpu, bool gx_off);
 };
 
 struct adreno_reglist {

-- 
2.51.0


