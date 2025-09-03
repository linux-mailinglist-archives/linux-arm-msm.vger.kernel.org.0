Return-Path: <linux-arm-msm+bounces-71799-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 48898B41C46
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 12:52:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD6991A86CC9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 10:53:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C55302F4A04;
	Wed,  3 Sep 2025 10:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CaIZcbKX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38CFC2F3C0C
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 10:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756896720; cv=none; b=PzoL2tOCuBl8dWUaU1DlAmUniGybfGon4Vr9YSny6BRMFFY9kzdPgsXflUTm92mL+uptnhv+BfCiuL0N/IcfSQW1XT9lSSGT0JKk/MQFOIqD8RrLH60QctiuX2hsBGuyehKcrP4unzw1yLN9gST6DuXGBKPRUyJACjz1FeJudm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756896720; c=relaxed/simple;
	bh=VVcVNBxTp77RP3lwxz41p40biwqdBr8Vq4owPjMXldU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R/de8Gaoy7k1vDv0Lf1G7Tyr9WU/rUz4SdDeMG4pwcy4gZywKAl2o9U4OIv/OiHlz5m11xNt1y13ViSyOBQiL2IatbXSng4A2YCceb3CorVERzR4hhAH+0xFgUzCZ0F5sUQ83KDDryrg72A9yddv04MRRkDkWHcYPg3PqNF0tm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CaIZcbKX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583A8jI2012695
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Sep 2025 10:51:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W+Fa5j+SX+JfM1Vod9bwyFNqvrYwDkttQ9oWzqXY34U=; b=CaIZcbKXWECiS5OQ
	MmeFWv6gFsrU3AVys1QT7S+kvuEomX4yJ5AjI+Tc3p+bVFpcNL4T4JA2zcHeNF/E
	kNorE3Y+kWGNSnDqtq9ena4quKt552GrN5VsM9CJJeBHG2FFJIpHu54dL452NvDh
	LiCh6jBFbCkcNlOa/sDUo35jRwS+TkMT0Wy5vnlsBMM2IMoP3EKtvHJc6MS1uesB
	zXF3YTf7U16yKnRjCAO+Xbczldu1IeA4MxALD9PxEpuXUSTu5h3/YDI/nktyJObt
	MpcvicV7Us+hajupksmw7FhOEcfc/KlKbVoFcWUNBlYpGd29vgDvdCeG+daHJ067
	dmEqaw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48utk9350m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 10:51:58 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-7224cb09e84so15629076d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 03:51:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756896717; x=1757501517;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W+Fa5j+SX+JfM1Vod9bwyFNqvrYwDkttQ9oWzqXY34U=;
        b=Jz5Ho0LS2jq9EBUSSJphw+g39almhgGhQIqrW4RE7AGVBYpiNoSLPF5jWVnTqOI/4F
         zUHQrmpx1kY3Kd2RXtmzYkogaqxBT4IN/9wS9SFZbmAL/YXCEHfDfQpimEgKnMHNUiWi
         vE/l9gJujE/Tr5NJ5sLyAVqX1SNS7aDCEFhNHxgEJODk3VurskGDaN20DUBcmnp0RUbc
         NGgb6DAiIB6eBnAdL9ok+EUk3MMbTAoLfXbFFcfuDBTyW5Jrnqj9Ab/SRikGUg+TUfnG
         AWZDFHQVfluvpSR1zZ5GRP1yaK3EbKqCt8ORlen7ta8gdFO1HRDnvzVPTdMYdpDF5UvF
         TCpA==
X-Gm-Message-State: AOJu0YyKR25357DTUT2vfvmiaif132Ch1m0qooRfyeGe+TaVISqyfZpI
	kzT6qdWFCYNu8cDc5qwy5wTpT6be7lRAXax1tm5vr+5HurLmd8ov1oPOcXhBIRSCMKy5NNWI6RA
	Jh5luL5Aghyg5KMfLJtoCltABs/iozUuyaD54XzZ7py2v3cvOp9XGLb4he2anT/zz6Zhd
X-Gm-Gg: ASbGncvPE6CuTjdoYL2k4NhIpzeHWVccNarp14mbGV91gfUdb0ABSWQNrUSlhQoYET+
	YpCdq8GqcQfuDKeal2mEneKOTKQV3F+X/c7MoP2yz1Nzws3Vkmn+03v6QuJDCbPh8KUQk5U1SVt
	C7hpSgEGXz9LXKLKzno6wNlhJhyvoQySm9WIxS4io8QQIFQ7cBZGHcBxAbrI0QNGVO1YVKCG4Za
	E0MA83/NXAD/HFwXeLKh7rFGbeNNKem+M9Mb7tfCbUBkgfLgRtvcI4pZByakjX5P9UnhhGqMlDv
	NzkL1erkjVpp20xX8YWWnmxxCpeIZeww7rAZYuwbdBPchxheAkydD834kWukyJEXzNhezemtZkt
	3qvK4LrsBgApBDVRN5GwZEHeSONnBXmnNvZS5dVs0+Y9Mvbhk6HpW
X-Received: by 2002:a05:6214:5005:b0:721:93da:1071 with SMTP id 6a1803df08f44-72193da141amr56362806d6.34.1756896716996;
        Wed, 03 Sep 2025 03:51:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExVl9GBAf8uXT9a8bpVa29NuOzWFwU6sdfVsGQld/IevSNRhQnIWf4CLWyosX6NvmXF0Tlaw==
X-Received: by 2002:a05:6214:5005:b0:721:93da:1071 with SMTP id 6a1803df08f44-72193da141amr56362476d6.34.1756896716456;
        Wed, 03 Sep 2025 03:51:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-337f5032df6sm9373431fa.39.2025.09.03.03.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 03:51:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 03 Sep 2025 13:51:50 +0300
Subject: [PATCH v2 2/4] drm/msm: stop supporting no-IOMMU configuration
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-msm-no-iommu-v2-2-993016250104@oss.qualcomm.com>
References: <20250903-msm-no-iommu-v2-0-993016250104@oss.qualcomm.com>
In-Reply-To: <20250903-msm-no-iommu-v2-0-993016250104@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1138;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=VVcVNBxTp77RP3lwxz41p40biwqdBr8Vq4owPjMXldU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBouB3GdCx4xIfhZaEHEPNvhz+Nhq0FHAFd+JqVM
 hN82WJGwZeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLgdxgAKCRCLPIo+Aiko
 1QDjB/4zbCpsE9Fapn0XIU3XUXuutlBGlGPfODt0yYr1IF7hO8FNc+gXhAPhbcemMkO4je6iUqb
 aYGyplYUcCTYuPaGRX3ot14Yksn6QNBF9ljJkoSmhHR9/GGcacndWC7L05c2vqgSE+SRJRfFG2W
 Zn+JG44gcPcJ7Wh0bCL5tXMjCttXjwY5VR/DN1QesdUuAx8ZMlvqdB/INnQc22yZ+0rJ+usDuIK
 tu5/Xivh7lZpD6vLk3G5ojERUsV3k8V0Wr4XWfsZrtG2GKtWa7OoG7j1cQ1ZWxSkMfWTgPPot+p
 GcLUTZOAMGTKDJLemyZzj4bxZC+N37L/0pVsp2wlLN5xVUEe
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: EHkKZZGq7RpiJuXF3IT4tqQgXZbrdb2n
X-Proofpoint-ORIG-GUID: EHkKZZGq7RpiJuXF3IT4tqQgXZbrdb2n
X-Authority-Analysis: v=2.4 cv=ccnSrmDM c=1 sm=1 tr=0 ts=68b81dce cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Y8FF1qk0yU6lqu3lwJcA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDA0MiBTYWx0ZWRfXwc4Cc704e26E
 wnIYL1Gp/OLJ5lYr2YCFSjSlZcJkiMSQrWg3yHvX2Uqmm/6mVzokpwMxi2QxBof35Z3HNaw57Yh
 zvM1bQVAZ29ujCfnsHhiKRL49H0wdMNjpwXIud6yBLPqVPyprVd3vR4dAT9skKKB/JrfrVzWGvw
 IIbiyg2u14k5Id94UDJPw7Kb3+K4jPELIzLZKca9dP0noR/eahyeDokwqjT2EshnNNtBe0E9eez
 3xr3keracwpINwWcCApeKONDlqM2uf4/Rdx329C9U8wZc7uSrXCqNNm8vY0hDc9RKNjU/B1UJSD
 h801THhRZ5cNMFJbvM2dsQUyQkBcPmztEv1A1t9mcCDJ0yVVy+AWJ8afC+0YimEr+r/eYEHCm9l
 su6m1/Af
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300042

With the switch to GPUVM the msm driver no longer supports the no-IOMMU
configurations (even without the actual GPU). Return an error in case we
face the lack of the IOMMU.

Fixes: 111fdd2198e6 ("drm/msm: drm_gpuvm conversion")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_kms.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index 56828d218e88a5fa597755c8ea20da781929386c..4c4dcb095c4df97de42d0673aa2842010a249dca 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -195,14 +195,13 @@ struct drm_gpuvm *msm_kms_init_vm(struct drm_device *dev)
 		iommu_dev = mdp_dev;
 	else
 		iommu_dev = mdss_dev;
-
 	mmu = msm_iommu_disp_new(iommu_dev, 0);
 	if (IS_ERR(mmu))
 		return ERR_CAST(mmu);
 
 	if (!mmu) {
-		drm_info(dev, "no IOMMU, fallback to phys contig buffers for scanout\n");
-		return NULL;
+		drm_info(dev, "no IOMMU, bailing out\n");
+		return ERR_PTR(-ENODEV);
 	}
 
 	vm = msm_gem_vm_create(dev, mmu, "mdp_kms",

-- 
2.47.2


