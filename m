Return-Path: <linux-arm-msm+bounces-63848-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 763AEAFA49D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Jul 2025 12:51:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88B093BEA51
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Jul 2025 10:50:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 838DF20C01B;
	Sun,  6 Jul 2025 10:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fHKp6e+E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EBAD20B218
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Jul 2025 10:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751799053; cv=none; b=fgTiKH+ny4wJCmNh0iekLopX2UXAGOwnBKlIm300iJpzQsOwDTfCoHfsidqhrfEmvfSu/kjgHPN19b6vaTY7fNZDTB5lEL3GdhC5t421ozTPm69iPqhBo7AZcz0SnQEmPf+NpOnbOlKorYEDmXVL98rpwg/Db1N942HeNaUQlO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751799053; c=relaxed/simple;
	bh=EUOM9GC2j9wX5WPerbms/C/z2nxGawxsehEkeu7mMVA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z1L6Gc6nYPp0P6zP7H/KPEXUx9DX3jCQDjBzJdphkvQ6ECd5YaOatOrojhcunj5ZtpMPd0OhKTQ3PokXjWt73uty1qzDjVNq1n082EfH3AY28s6cbli5ONiATB+V3JrnRDI3Vp+rZxkvthwLlCK3zpZ+rThL8WxmUjmhPeVfbOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fHKp6e+E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5665KKie025935
	for <linux-arm-msm@vger.kernel.org>; Sun, 6 Jul 2025 10:50:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8nwUz2+wfrG4Z9KqAAvjHu9al6EBZNSbjiTXJPQqpbE=; b=fHKp6e+E5wKL979D
	UnR1gN6ha9yFki6avKH/Fsri4APqx5kmjffLbIKqaSvrmfwanadRDoBT/Dt04oRq
	oMb6VxACsRFOktD2jkvuhypBnIJDDdohgkRBZ+aVx1C/XNZqg5Kk/cwaY+LmvxFI
	IwhpvbW0QpNqyl69fdMMeI1d+NxstMa8HstENuZo7CZkNVgYkVDmuSY9NZQSJHTY
	sYvjUhM1ylooZMp9AxAYU59qFI7k9oXduZTox3UVPLYC77yznQpJXnZCVlHFmvjE
	Xe52J4UPbyMmDgGoqHZPer9ZNQhqvJ/I+g2Ayh9AAatPB6NuconL3cE6fY63t0E1
	WzLm3g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pv973f44-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 06 Jul 2025 10:50:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d446ce0548so373644185a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Jul 2025 03:50:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751799050; x=1752403850;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8nwUz2+wfrG4Z9KqAAvjHu9al6EBZNSbjiTXJPQqpbE=;
        b=hkMbn1FaLeRfuUw2Fyc5Nt56eP3nCCHTFSNYnmGslyquJ64sBgSYUS4ZVtWZpGsIrT
         0kwtqAmGxuU/1PC5dHnrPZ0sZ79j1TFJdcjS8a4Nm59SChquoqx436sGG/cg19GsySLs
         NJGLFgzKv0iLGdW55ZtWose15dg1zghKU7FArvApY1GKz2KoraQO4RC49IVsYbtLrWQj
         Xq2qFsc83pTaoXNf6/ZvG0bNmRryir7vvbYWTpLfrGMDgrzUH8KSCx+CVAy1saqhHPMr
         Td6NyNEBjqL9wwRkneUI7WKsKE/1jW77wMRAsnZv97Kmu4pUtSuLOJxIKXcFT/lg8eFz
         Lg5A==
X-Gm-Message-State: AOJu0YxvAW7sbBwxpbud9zFYaycjQKTA1qn48jTD6RSaQgZGt/S4qvVw
	nprzgzhsbVa7bIzClGjSEOH6FBdw/2StjrMzubVdBTOeglWLUefXmlJ8vU0Z/G/El/DbvIK3v1u
	ZU1t76yL8B1povHGbRA775+FQsqPDmUSZIk3200axXoNlXHN1SyuuZFsthIOtg9JLUveE
X-Gm-Gg: ASbGncv6+GJgu64Pkh8InjKxjj68pjoZY1s+vj/G7gTVTTdQHWPFWj13oDbidWeWodN
	wawd34GzRK6PUSskV28oMyiahjmdw+dXbsctc8Z9qzk/nJwEvVdDY+XBUbzKdxP4sYNd9s7a3df
	4svVXT4jY7bO/h6rgXMz+LfNylSBqm6K0yCnfTi7/qRjpJkfDcZ0f6OiqUY6H0qYDGbPpI9LhCY
	d4Fqs+hqxhAADTYEsFsB/qV1UV3NQKV8CEvvUxVbTAY38A8akG32YkfVT/pM0NP+bfVd9nShCCW
	oK0WFDx7dr9apkBC1z2Wr2asOR5zakPG7IQswuuGDpAFUC39BplcJbdYdfi+wVcPHjRD/M+z1zx
	fKVC5JZMtcWRY9/P7ig1+ToAZpsYtfbdxf2c=
X-Received: by 2002:a05:620a:4396:b0:7d5:d018:1bf6 with SMTP id af79cd13be357-7d5df119e79mr1104797085a.14.1751799049933;
        Sun, 06 Jul 2025 03:50:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnbXcyMALNSAIMrbcV1bErIvj9gLgHlW+lpPLzxeJcvFUcUsGsOmoX7j1K8yEeXnyxMSvpeQ==
X-Received: by 2002:a05:620a:4396:b0:7d5:d018:1bf6 with SMTP id af79cd13be357-7d5df119e79mr1104795385a.14.1751799049538;
        Sun, 06 Jul 2025 03:50:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383bb555sm920621e87.20.2025.07.06.03.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 03:50:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 06 Jul 2025 13:50:38 +0300
Subject: [PATCH 3/3] drm/msm/mdp4: use msm_kms_init_vm() instead of
 duplicating it
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250706-msm-no-iommu-v1-3-9e8274b30c33@oss.qualcomm.com>
References: <20250706-msm-no-iommu-v1-0-9e8274b30c33@oss.qualcomm.com>
In-Reply-To: <20250706-msm-no-iommu-v1-0-9e8274b30c33@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2046;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=EUOM9GC2j9wX5WPerbms/C/z2nxGawxsehEkeu7mMVA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoalUC3CxjmG2qO1jRWXx5gPkOE/BU/KfOLjFAd
 21zJFA0vaaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGpVAgAKCRCLPIo+Aiko
 1bLnB/9zMeuT+8VKzUaMNF0llrx3m3vtO2VrQ+Z5tjOtNMvw7pklBRfaSZrOrQEXcY8eVpcTjkZ
 byftNEf0tObHUHcrk2nwEsjJ5+F3HmLK9Iu2uR0cPW7nbMm4Pzu3foT+1K83LKrNYBvj4kWnMI7
 rkyeAiI7yqTKGAPFvV7Wp9JfzNqLUFxs1FL9FoZG6qaYtfxuWbyAlDYr0pK6ZkejjH8nb9JhLqI
 cBOweeTjQaTa2ltWjkv+vKbJxvLiHo2Ta49zkUdZ4EA3OBtbrDnVZgXc8aw1ISv1M5h0gQeczmZ
 /0NvYh4t+H2gxp1SabuYOj+1Hzfoqm0JF6ysG3FDegD10Kd8
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=FrUF/3rq c=1 sm=1 tr=0 ts=686a550b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=OZ-Rx8C-MikYIJhCyHkA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA2MDA2NyBTYWx0ZWRfXwYjo3fTZYQHC
 CEtj2ykz8TXkGgJLCQ5Ie48WnsDi/8caTru11/z+ScGEMkAN328xf9ZxnqmuB+WSejwethZlLeC
 G6I5WJzSrzgg37qcWVjfckO4gEr2yMihGLIp1zZjQh9jBbJOo7nLya/OFK3rwAIpopbKYdBDnJp
 /qdouagJj2esd3nSDA5X6AaXF2P7Q3W/VSjRT/QEnpRX5/NmSu+DTYBPTUfnowtlgAiLo8zL5xq
 8Gm4grjv5OzYYg917+etGoWuyMllG2BjSHuBMQkLGfWKH9+Zg4QHD0FXJ7/pQLX3sCK8bWjoGtw
 k1XxgSbHIHk5ROi+rP6zp/XlfrUU/Dgzmnfvce2gwjRF/ViuW0zop5Px9uK0+Lxup4Ia+L4Upm+
 cHSmCWbqL+pbElSurE0bIYYgR0Jp0AcKkmTw+QlzeN4Ti7q/2SZNq4MpJQtQ8xWZg/IRr3Gm
X-Proofpoint-GUID: Od8rvZ6bpcrPevAlhbIuj86CNkNV_4VY
X-Proofpoint-ORIG-GUID: Od8rvZ6bpcrPevAlhbIuj86CNkNV_4VY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 mlxscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507060067

Use the msm_kms_init_vm() function to allocate memory manager instead of
hand-coding a copy of it. Although MDP4 platforms don't have MDSS
device, it's still safe to use the function as all MDP4 devices have
IOMMU and the parent of the MDP4 is the root SoC device.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 27 +++++----------------------
 1 file changed, 5 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 88296c41d1a5eb0e16cb6ec4d0475000b6318c4e..41d236d30e71ebb6ac8a59052529f36fadf15cd7 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -391,11 +391,9 @@ static void read_mdp_hw_revision(struct mdp4_kms *mdp4_kms,
 
 static int mdp4_kms_init(struct drm_device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev->dev);
 	struct msm_drm_private *priv = dev->dev_private;
 	struct mdp4_kms *mdp4_kms = to_mdp4_kms(to_mdp_kms(priv->kms));
 	struct msm_kms *kms = NULL;
-	struct msm_mmu *mmu;
 	struct drm_gpuvm *vm;
 	int ret;
 	u32 major, minor;
@@ -458,29 +456,14 @@ static int mdp4_kms_init(struct drm_device *dev)
 	mdp4_disable(mdp4_kms);
 	mdelay(16);
 
-	mmu = msm_iommu_new(&pdev->dev, 0);
-	if (IS_ERR(mmu)) {
-		ret = PTR_ERR(mmu);
+	vm = msm_kms_init_vm(mdp4_kms->dev);
+	if (IS_ERR(vm)) {
+		ret = PTR_ERR(vm);
 		goto fail;
-	} else if (!mmu) {
-		DRM_DEV_INFO(dev->dev, "no IOMMU configuration is no longer supported\n");
-		ret = -ENODEV;
-		goto fail;
-	} else {
-		vm  = msm_gem_vm_create(dev, mmu, "mdp4",
-					0x1000, 0x100000000 - 0x1000,
-					true);
-
-		if (IS_ERR(vm)) {
-			if (!IS_ERR(mmu))
-				mmu->funcs->destroy(mmu);
-			ret = PTR_ERR(vm);
-			goto fail;
-		}
-
-		kms->vm = vm;
 	}
 
+	kms->vm = vm;
+
 	ret = modeset_init(mdp4_kms);
 	if (ret) {
 		DRM_DEV_ERROR(dev->dev, "modeset_init failed: %d\n", ret);

-- 
2.39.5


