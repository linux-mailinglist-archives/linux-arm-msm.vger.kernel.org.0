Return-Path: <linux-arm-msm+bounces-81721-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F899C5A95B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 00:31:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4E3AF3525F3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 23:31:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD4AF329C63;
	Thu, 13 Nov 2025 23:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BfMAHJwY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NjlExZzL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8722B32AAB1
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 23:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763076641; cv=none; b=spW8oA0BUv5HhHmnVxFFjj9OdJeHocSDCEshb4OZ9HHCgoojrou57sRlsEILv3GiKZnBhShW/jI2u+RVn7rLUshGnp9um50Hy8opCuhYxjdvKyuvznAfk28Bcy13bUpn8pwqNpBGQijXaevfG4FzN2esCis2RTCX19DN912TbOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763076641; c=relaxed/simple;
	bh=aLTgU8jaf8pYFojJF1knRYGUYls1un+XUkalxDsrrq0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ls51UP3YYYn556bL+A7yHFGGWMkYP8cmIAEOP9GM7UJnqYNBjMCzIMs+9UNCLmYDM2ksWPIeN0MfsFXYfBlICzcfPDgbHeYOcSDFXU04cW9vF+sTEGQLy9+y/5dLdUw9DC6xb1C93s6gF0742PcGrXcMGo4OsZvMoW1KiW3dryo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BfMAHJwY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NjlExZzL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADMakgf1745319
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 23:30:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hhSbfQfsXDYo5k86Qy1lI4a/r5FL2WPHyWoclA524Ig=; b=BfMAHJwY5fxflr8P
	IXw0KyTixDRZMxONIjC8C5SVj9SF0YbfculQH5Q4xUy5qHHqli1kA7y5jhD20O/c
	pUG5GfnGViNRoG4LxV/HVdrwP8NKJvlgoN9gT6S0ZmHxCETGdfmjQquvxqaeWJm6
	us0rc7eUJM7sSh+2yEuhjeu+nOYohKRDFDS5kttL58rDPgbqdgEo5lJk/HUCCqvR
	iMBfrQWPMspWTEx+O//AyKxez+HIvs6zB1eHQsAs3vzGZ6KeXVIHNv+aB1NZRqY1
	0BdPBPDkMx/HsPhy93CyflRAd4f2rNqtLfjHQDqNY2Sd5WH/l7N14hm5rau/zu7A
	jSkYbQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9eg40u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 23:30:38 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b6ce1b57b9cso1348487a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 15:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763076638; x=1763681438; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hhSbfQfsXDYo5k86Qy1lI4a/r5FL2WPHyWoclA524Ig=;
        b=NjlExZzLExi1bFKSE3yGPYx8GikrbDDohqTHy6xNE3FvfNmYycnLkRvXXyKwegjdV9
         8ViRsejLoiX48JDpkZFVOTiWoFcpj6WW34B8ujuKl82Q1z4WChTj7P63JKfCJFTioDVZ
         VY+0ttcnHnhkV7m07ucP/rT0uQXBKk0AZ7Gq7lay+FggLVjnC0zxjbGHxxRBFJpE/eCO
         s+ADw3D7G2lrQPfif2RUUT7bt85u92K6cY3tHCPfjfD/Z7GTwpJAVXVNsbG4Ee5Dobdq
         DG6TaOaI2OyHX1a+/Adtik0YJM/ZMUFVe3hCHJ+jYmuiqWFN/7cRbUE6KECvoqJyu6OC
         IU1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763076638; x=1763681438;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hhSbfQfsXDYo5k86Qy1lI4a/r5FL2WPHyWoclA524Ig=;
        b=P+Y1Fr6I7BAV7t7j2mU2PAP6EadwgJ+opIa2n3Wa4AkIlSgZrthK929cmlhJN4YX69
         yM1ta1HMQWJwdM7ILPIUwk0lJ84r9sq4nNDsGO4Nl++jJgLaHJ4FIBH8+aeR57Ix6gpI
         LAYDs5yM7kyctqtNXIqz0jEoIGIUJKfdfmBZEJoxNBwaKVA1JIwh1ZhOzLLgUdKj1iKr
         aR+EwA0VfoBvN8K5mXZUvXTEi57ug5xFtV68NtkPP5MslhHnTaC2kk9L0THO8C1nDJGV
         eGgcvsy5bbxZjCJJbhl/lIm+51tutMGn8HnRKx0XJL+iXFtjSf6DSywPKyr+LKn8Elcg
         /sKw==
X-Gm-Message-State: AOJu0YwMiiGgvaRFvMDo16RL6oY2tDNQnwR6awh8FgkyC52Co7THzLkH
	swLxCj71HobWDulEJKMLt9JwrGe9+ka05O6INRKQQAcmLd4mHYEn+F15szpgRB3cHW82xHgladU
	REXEDky0xCfwxm1zhG/PDHtOGsLJ3X8PVhBr2nIicIuZT2PUh2OEY9V301j6M6BIlh1tk
X-Gm-Gg: ASbGncuWej69rCFmHeKEgWFJhNcL5+PR8y6BDgaKNDLVV7tSzAQfPmkio8tqsP0enCQ
	Y79BeLqRymXAmTFHdBqhg5fbdgdyuKWUC7goPpgKmpYJy8ccRyHc0j8i+ndtp5MtX9qi0hhYMrN
	eD+mRNI8TlBx8CaZXrfSP607/tu5ywVNtQQFHMFTjg3IwcP6FQyS11yHTJM/TqRyrLfP8hSz7BQ
	381qSTjnBir00GAaCvvkwVo9XyzgFih/rYboqg9uBTDHSd7IqjqPmEkDe++4BoUkAOWaRz0KynF
	Sci7M0lPQS2YAqCjvvfmWv9RAY8HvRPKynLPEiKrYDUw4OYsURLg4yf1hJDHUUDFKaV2ajmhAAp
	S/hmb1xkp5VBA7MklhZyh9Fg=
X-Received: by 2002:a05:6a21:6d85:b0:334:95d7:3305 with SMTP id adf61e73a8af0-35ba22a4e5cmr1764914637.28.1763076637791;
        Thu, 13 Nov 2025 15:30:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHEn2fDftnkPr0EHpOpGMZQLIPAqXnlxWXCkdgBWD+7nx4rt/A++vHmEwuulwWe68hN+6xKeg==
X-Received: by 2002:a05:6a21:6d85:b0:334:95d7:3305 with SMTP id adf61e73a8af0-35ba22a4e5cmr1764869637.28.1763076637246;
        Thu, 13 Nov 2025 15:30:37 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc36ed72cd1sm3049486a12.11.2025.11.13.15.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 15:30:37 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 04:59:04 +0530
Subject: [PATCH v3 07/20] drm/msm/adreno: Add MMU fault handler to
 adreno_gpu_func
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-kaana-gpu-support-v3-7-92300c7ec8ff@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763076574; l=2452;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=aLTgU8jaf8pYFojJF1knRYGUYls1un+XUkalxDsrrq0=;
 b=Tk4URntM++zmLSb6MOWmkLrsE9HFNdTk7nCYDUKwhHi9SospA9oJhyJsDSjF4eU3RjzsTrddk
 U5TuaRXL3yADupie5aIE/4U2SHV05LRHE+SWVpJw7MFgF3uJWO4lapH
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDE4NSBTYWx0ZWRfX0C1ehNG6wci2
 BNgfTD/NxIKsd8pJoo3CWufxD9LvuOUjiv6a/TO8/WZumFRbNWZiAbh5d5zvBySwNEJwvV45w+6
 vpPxse9vlMjaS3TSZ8s/t2ArsF5rWhCCq0eoOT9ifAYDL1JHb36HsvbeACcs+uFQoRZSEL3IKgx
 kis4rML6ghR7EInxfLF7EnYZDw96J5WkvllVc4Iuk1JsT8H8CuaKVqHEnTXOXieuASVVuxLv08t
 /gl4E5od/7nesAJQKZZjNqYCWN5tPKLdOVLq5e2uTPz47IefBbukslfBYW4MzrkHOMdOK/UObVA
 +cmUrxNg88NjLUPK7DP6tMYzoc3Do9DmcEDysoLGeuz/H+5XsrpZABOdgmuPB0hHZnvySsiLYCV
 C0TJSk/caCdf/dhzwEGa2yTLNB4RCA==
X-Proofpoint-ORIG-GUID: qtIGn8hjd-soqc-8rrE6fuL6GKf6tgLR
X-Authority-Analysis: v=2.4 cv=Afu83nXG c=1 sm=1 tr=0 ts=69166a1e cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=i9YFFn0sWQDpYGFnbDoA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: qtIGn8hjd-soqc-8rrE6fuL6GKf6tgLR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_06,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511130185

Move MMU fault handler for each generation to adreno function list. This
will help to use common code for mmu pagefault handler registration between
a6x/a7x and a8x layer.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 5 ++++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 1 +
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 9c6af226b076..685763c12690 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2615,7 +2615,7 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 	adreno_gpu->uche_trap_base = 0x1fffffffff000ull;
 
 	msm_mmu_set_fault_handler(to_msm_vm(gpu->vm)->mmu, gpu,
-				  a6xx_fault_handler);
+				  adreno_gpu->funcs->mmu_fault_handler);
 
 	ret = a6xx_calc_ubwc_config(adreno_gpu);
 	if (ret) {
@@ -2660,6 +2660,7 @@ const struct adreno_gpu_funcs a6xx_gpu_funcs = {
 	.init = a6xx_gpu_init,
 	.get_timestamp = a6xx_gmu_get_timestamp,
 	.bus_halt = a6xx_bus_clear_pending_transactions,
+	.mmu_fault_handler = a6xx_fault_handler,
 };
 
 const struct adreno_gpu_funcs a6xx_gmuwrapper_funcs = {
@@ -2691,6 +2692,7 @@ const struct adreno_gpu_funcs a6xx_gmuwrapper_funcs = {
 	.init = a6xx_gpu_init,
 	.get_timestamp = a6xx_get_timestamp,
 	.bus_halt = a6xx_bus_clear_pending_transactions,
+	.mmu_fault_handler = a6xx_fault_handler,
 };
 
 const struct adreno_gpu_funcs a7xx_gpu_funcs = {
@@ -2724,4 +2726,5 @@ const struct adreno_gpu_funcs a7xx_gpu_funcs = {
 	.init = a6xx_gpu_init,
 	.get_timestamp = a6xx_gmu_get_timestamp,
 	.bus_halt = a6xx_bus_clear_pending_transactions,
+	.mmu_fault_handler = a6xx_fault_handler,
 };
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 19a1a1f699bc..34b09cb127ed 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -78,6 +78,7 @@ struct adreno_gpu_funcs {
 	struct msm_gpu *(*init)(struct drm_device *dev);
 	int (*get_timestamp)(struct msm_gpu *gpu, uint64_t *value);
 	void (*bus_halt)(struct adreno_gpu *adreno_gpu, bool gx_off);
+	int (*mmu_fault_handler)(void *arg, unsigned long iova, int flags, void *data);
 };
 
 struct adreno_reglist {

-- 
2.51.0


