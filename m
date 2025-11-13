Return-Path: <linux-arm-msm+bounces-81720-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A73C5A93E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 00:31:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 724EE20888
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 23:31:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AE13329E69;
	Thu, 13 Nov 2025 23:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ImtBloQj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eafngMQ7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC821329C47
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 23:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763076634; cv=none; b=FL7g+MagO9ziTK3qrc8CcfjKWCedqJ9QdPem1PXJqbF/RJ9AyIz9Ewp8sWmswvTyp1ugKD0MfNKkDMQ7ePOji3ZP431bDaJcd/iOtxP3003+eAlFqHXEkKoj9JH9nNzvbABP7urkcmICqn2NWAOmxrqm+9BgbbnWftvOsLW4f5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763076634; c=relaxed/simple;
	bh=IGpokplXYyShZVLotE0neZI18HJLZ3KUnvDyUGOCvso=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MZSRkFdSHAtaInSou9HVkxbNLuNAxEDi9PS8LXy32hPKgxwAa1Fa04hlEM7hLYzvlwfk+ycSrZ14uFk/x7axyTMZmTT8xxmz80w+JznAF5xUCgZNIwBAn47CbLX45WbjaGXdWDXfzZnyT6pB/2H5rrCEe5/wRMXRbNCuIOen/1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ImtBloQj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eafngMQ7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADMamGJ1629517
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 23:30:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gcf5l/K/LPI1X3Fga8TbV7X9VmsrDisI7kJ0hOFQ884=; b=ImtBloQjs3VbC6QK
	+PNa3ucCYR4LChcWkDL/0pay7FCkI0Fitv0oEgepxh7a/E3b6ekwOE+DGRXVibez
	X7soR84lC1lKKXaCC2LPLCF9klr0oQeh7LByi5aTu6q+Ism8XJZPw2J/w9lWfy6S
	dQsLilzzvYJ7gnyNxXYr6Y180sB04B6Psjr94kBYn1woDUMeaG+bqj8l3LJ8kGs6
	Aai/RoKT1uX97Gqtp4lvZVVW2tE3qAUjybkZz3hWqpP9cIhgNMcxdbY+LKtoliYT
	aI93A+BVCxjvtZMd46+GH/lXu9lnC4+DJO58L1Is55xfTOpguZfkgGeG75LJI0DO
	+gSemw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9d83xv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 23:30:31 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-ba4c6ac8406so1151515a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 15:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763076630; x=1763681430; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gcf5l/K/LPI1X3Fga8TbV7X9VmsrDisI7kJ0hOFQ884=;
        b=eafngMQ7WrMgtuprVSJJD0V5KH9vqZ3JMB33P5G4I0CVZRhVYFQYi+1ug2tSlUdDwP
         iNEKuFP3N9Z5iVyvptzAbi8QN/ABUrea9i0dFyqJixjkeZgxKo98j599/UIxfOXKR8bZ
         VZe6YYuPBneclqUx+y3ldi9n6Tmprctcsk4SKr8YoC1xoka9HUBLHS2Y2f7wkWbNt1dV
         Ev8T9ZyY1l+vB3HPeoho2PhCKIvdAjBajzRYEGDbj4/wKq+AA/nu+Q9jn+pIJV7TVV8Q
         Pc8MeUjfYqe/1WA6sRw63KD3wqj3YQKBpevA3voYuOToGJOSAT/L6ilYFh3+CSlGlHOu
         WpTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763076630; x=1763681430;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gcf5l/K/LPI1X3Fga8TbV7X9VmsrDisI7kJ0hOFQ884=;
        b=a9ELm3az8VnRoD9rKzVGJrQE2v96+VY6C7KzztFDNK3gu/iOv6gHVna+U4sQQ4aOm/
         OmCU53QsC98ZbpdxZiepjFMcVStvNX4a+leXWQmveagg4rsNgpAAvNKBk0CoTVOwopgl
         WQ36JRurAtyI1uTznuKr4bj4kYZaAg5o1nSHrpppU/3st2Y4YjiHm1k/BqAb+nypsEZb
         FkUEG9HyKUGUZ3HQ34ZVAXm5HhFMpYQ5+LiaIjPsos3P8M6ybn4bpnmHHBHPzwojx2u2
         VWXNlvJWoBcdW9eJGyzhjkQ8IXBc6yUNpdFHzKh38PfUxn40SVMAPKj454J2VM5RMn0q
         ou/Q==
X-Gm-Message-State: AOJu0Yy0hZtsztqsyzdxZN4HMN/ZvtvfrUS3DiAZWK/rh/o4Nhy3Ctc0
	xCKkNuZ/D7A4C5oBR1cUCpBvrIBgKrl74u1OPlxFkZ+iqe7FSzXvkexjztlsz2UfAZ3kTRH+3K/
	uuqNuI98iGXaatuWSl7wzvxKgiThSr1ba4ep6X5RPvWU0P/+TXPQpGsNooUyg9ghpqzpJ
X-Gm-Gg: ASbGnctzxQR/rCVQaO5kyrCZKD5OH7Il+w423mwxyl3hAANf1TeOwRPzHDukejze0un
	SWWKodiCeCkYvdxHXJUlMhpxHkpazCRGopb77pphYMPth3AdqLCDaZpKuf6w4a+7K19kfcK4djJ
	mb9uDIZxYvnu0CA9RWO51PfxwJqqp5oj+ktcfeLMh6rWl9VNgbUQpuaPyi9PEx+I3LK+LmXju39
	vGcf1rPj37/x40eInPAxLCk8d96zjTsGQ+RASI/wC1U1yqX2/fRisayZXtlR4UWUXjsUzuXg3gP
	27sLKpfoa5OJz3jzxVEUBW9PbORt+k4iHB66GQ5F/0ZiRoj1eFLHe15n5YOJftBk1pSm3T5gqeb
	O/eXV1ZhXpaTMysFu+hp9qCU=
X-Received: by 2002:a05:6a20:7f81:b0:334:7bce:8394 with SMTP id adf61e73a8af0-35ba2c7f49fmr1558592637.51.1763076630324;
        Thu, 13 Nov 2025 15:30:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFF7D8yPEUPkp+NbY22BN0Y1kfgJd40q6G3P0giPrxIE2bqHGm6311EF07g9YkzAqUjbYGJXQ==
X-Received: by 2002:a05:6a20:7f81:b0:334:7bce:8394 with SMTP id adf61e73a8af0-35ba2c7f49fmr1558536637.51.1763076629730;
        Thu, 13 Nov 2025 15:30:29 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc36ed72cd1sm3049486a12.11.2025.11.13.15.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 15:30:29 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 04:59:03 +0530
Subject: [PATCH v3 06/20] drm/msm/adreno: Move gbif_halt() to
 adreno_gpu_func
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-kaana-gpu-support-v3-6-92300c7ec8ff@oss.qualcomm.com>
References: <20251114-kaana-gpu-support-v3-0-92300c7ec8ff@oss.qualcomm.com>
In-Reply-To: <20251114-kaana-gpu-support-v3-0-92300c7ec8ff@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763076574; l=3572;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=IGpokplXYyShZVLotE0neZI18HJLZ3KUnvDyUGOCvso=;
 b=NVUVcDEzAp6sPGf+/YDVc97AOPQtMk6i7AKTEir8UVywiJ16mJrlqBXgy1BYJHHWn73Ng1nrJ
 TotY0EkaIRQAalvppoalIedeEivFRiO8/utpOvZ946ECcbG8esPdnuq
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: pEc_9KXzkc3xdABsCsLfd0AujK4u5qA_
X-Authority-Analysis: v=2.4 cv=Rdidyltv c=1 sm=1 tr=0 ts=69166a17 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=W_sW28Yvd0frASqVc48A:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: pEc_9KXzkc3xdABsCsLfd0AujK4u5qA_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDE4NSBTYWx0ZWRfX1SgwWhfgChiT
 g8tckrlFCpBlrF/FUITdFuvT4kwz3UKh9xrIullgZ7FhwzKpbHxfsn8fovc7WTAGRI5dBRV1Urf
 JyAics4lPPXPrg3L9lmVa9LHLC7CJKv2kS4fxEwseLRy8bYkIjJkPrRtAffNR7ht6uH4eH06Bc/
 kaolBvtSHj8/mcXHYKZHdI1ekVFBKPP7HoXoSVAVi9ynV/NV048up3MgcSnj1ZN0wpwyqPKEETf
 ix6k437yJDrNWPN5gn+c8yPdb2kluhD4cuDOkXZdkxt0aDMNINakNUvnvrFgEMNjzzoEiuPXGxV
 LkT0/JmVfDJ7+mFnRPdZFaNKueVRW7ctL/CiQjqw06uULfEYYoKe3liYr+Wibrc9DkFchJ6n0Jw
 iAfeDOB5FUk8JAKm9BkA9lfm89xblQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_06,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 impostorscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130185

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
index 605bb55de8d5..306fc08492e4 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1053,7 +1053,7 @@ static void a6xx_gmu_force_off(struct a6xx_gmu *gmu)
 	/* Halt the gmu cm3 core */
 	gmu_write(gmu, REG_A6XX_GMU_CM3_SYSRESET, 1);
 
-	a6xx_bus_clear_pending_transactions(adreno_gpu, true);
+	adreno_gpu->funcs->bus_halt(adreno_gpu, true);
 
 	/* Reset GPU core blocks */
 	a6xx_gpu_sw_reset(gpu, true);
@@ -1225,7 +1225,7 @@ static void a6xx_gmu_shutdown(struct a6xx_gmu *gmu)
 	if (ret)
 		goto force_off;
 
-	a6xx_bus_clear_pending_transactions(adreno_gpu, a6xx_gpu->hung);
+	adreno_gpu->funcs->bus_halt(adreno_gpu, a6xx_gpu->hung);
 
 	/* tell the GMU we want to slumber */
 	ret = a6xx_gmu_notify_slumber(gmu);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index e9a0ee1262cc..9c6af226b076 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1580,7 +1580,7 @@ static void a6xx_recover(struct msm_gpu *gpu)
 
 	if (adreno_has_gmu_wrapper(adreno_gpu)) {
 		/* Drain the outstanding traffic on memory buses */
-		a6xx_bus_clear_pending_transactions(adreno_gpu, true);
+		adreno_gpu->funcs->bus_halt(adreno_gpu, true);
 
 		/* Reset the GPU to a clean state */
 		a6xx_gpu_sw_reset(gpu, true);
@@ -2291,7 +2291,7 @@ static int a6xx_pm_suspend(struct msm_gpu *gpu)
 	mutex_lock(&a6xx_gpu->gmu.lock);
 
 	/* Drain the outstanding traffic on memory buses */
-	a6xx_bus_clear_pending_transactions(adreno_gpu, true);
+	adreno_gpu->funcs->bus_halt(adreno_gpu, true);
 
 	if (adreno_is_a619_holi(adreno_gpu))
 		a6xx_sptprac_disable(gmu);
@@ -2659,6 +2659,7 @@ const struct adreno_gpu_funcs a6xx_gpu_funcs = {
 	},
 	.init = a6xx_gpu_init,
 	.get_timestamp = a6xx_gmu_get_timestamp,
+	.bus_halt = a6xx_bus_clear_pending_transactions,
 };
 
 const struct adreno_gpu_funcs a6xx_gmuwrapper_funcs = {
@@ -2689,6 +2690,7 @@ const struct adreno_gpu_funcs a6xx_gmuwrapper_funcs = {
 	},
 	.init = a6xx_gpu_init,
 	.get_timestamp = a6xx_get_timestamp,
+	.bus_halt = a6xx_bus_clear_pending_transactions,
 };
 
 const struct adreno_gpu_funcs a7xx_gpu_funcs = {
@@ -2721,4 +2723,5 @@ const struct adreno_gpu_funcs a7xx_gpu_funcs = {
 	},
 	.init = a6xx_gpu_init,
 	.get_timestamp = a6xx_gmu_get_timestamp,
+	.bus_halt = a6xx_bus_clear_pending_transactions,
 };
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 2c8b38eae7b6..19a1a1f699bc 100644
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


