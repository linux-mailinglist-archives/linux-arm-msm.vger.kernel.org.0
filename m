Return-Path: <linux-arm-msm+bounces-71802-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3B4B41C4F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 12:53:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 975361A87B95
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 10:53:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09EAE2F8BF1;
	Wed,  3 Sep 2025 10:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e6U74QPb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C48C2F6582
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 10:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756896724; cv=none; b=WnSMbHvEMTCF/kTneWzgvX9TR5b6yRTFqzKVSu+m4XH116/UF3YpsRVZYseye1McCd3BSrW/Crs4WDFH0bNFKjnfuNLvHzfiJXko7QAORXTYr6th/DHWAmV4tnHDZNbJlW84jzE9I/ErAvb6V+17D3B/2RI0xISW1Uxk8eVe0qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756896724; c=relaxed/simple;
	bh=AgKTuTphksgFdjbRBscbGOKdDdsPzucjkQBsXfU1L0U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=biabY5WVL/fazMlf3QK2992uVfOKoT1T6gEGoYD0N2c3wSN8f1iI4iYZNtsDv193MUB02enc8MOqFonv8HHXPUiKoIPmksEKy9W1kiiWyTnP4EyTioURL3RsXo7xOOo2GdCDayXXKoFgdKdx0v9UkOeF9iar+SvaHJbLQWOBRtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e6U74QPb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583A4fIl018535
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Sep 2025 10:52:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OwmE1FNHyvfTAhAmN4j1rp824OtCLZj2GOAqHhiwg4A=; b=e6U74QPb/N7zGnP6
	s+sxCMTohZzHnMvhKBWCdKwxmvW/SDpeKZGnK4VO5JfFiIfQa2YleN9/hqDoPtLl
	0B5SsETXDzYGzN+nSMmC53mJWDK9AEh7a6PCezm6mNT+ix3zDu5NFRROVuYEBsTY
	0DO2KD7bsPiLae0KI7Kq02d+Hnxn41JX5BZUJ+dCVaW9JTI4MO3duHeD3k3FADnY
	JkoMZ7/uiI9aYBApmN8aG9N32PUuLx7W2Y2/xX0sw4JQ5z2x/Sq/yCk75TvSQFXv
	Tv+Bvh9MlvzzLdqYt9JFuK5Ek7UtX0zXywJG/xz1TvRaKa/z1DsmLNO/B1SWBqvn
	CMlyBQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48wqvwd20u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 10:52:02 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-720408622c3so28388906d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 03:52:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756896721; x=1757501521;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OwmE1FNHyvfTAhAmN4j1rp824OtCLZj2GOAqHhiwg4A=;
        b=OHFUCRmriuadnOzuRWA3TKqucAW2y57ndj+FDrOs9JO0/5hFeXLBw6ynak2sXR6YEk
         GDJnkK9KVT/Lo7Vw3to8wrgwDxcxTO6Na9nC/jsF+8qjGiAOfv/WrFrpxJpCeo32YtWk
         7ZOK5mp7wnt3nBKfyJsLq8h9+Ievag3xIY1zikfgUzjSoqhm57ayRrS/3ErHy8d3Oj8/
         fmVbL5V9AHJ2QXsRJq4B49JgN5DkhtvgkhI3/43dSh7CWWtVRDnNhLlnBQKO3E+fdT3e
         xGXRS50gg6IGR3t+0reVHe1PORcBhY44n1UOT1Y0YVYPiGPrvppfrU8bwStY+he9QrpC
         zXzw==
X-Gm-Message-State: AOJu0YzePlzR+rz/4yiJ13mUx5OKk/EuS9itd83TYlYq3I0lKGqQ0PQP
	pwS07D7+ESwmYg9eMeV/F+FKSNfZXv+yxx8ohCgkSHUfVx+nJaDZLVJdxUcUyqKBMJ3uYqUJmY1
	m/wa4jNOEVpj94QAalo+Z/qpzxXgF+lzAVvQscMI15GfSq/YNrs3hGRr5UO8FXB1jS0So
X-Gm-Gg: ASbGncsd3yui+IWmGohSQstLHDHL76+jl9YHP9+8/m7VMegEmgTVD9W/ChnGJ3+UaoP
	0sSQvU3fa7g5weFL5CSG+6zOj0csmYVFQFZMZ6DuMjIspQtpxJ/YP5+fnnNVDOTt/BiPpjX2/Yp
	S432zfKZ/eK8phi5nXx58w2y5LFyinuycxMj/A6y3QIl5/6CPi3gGCgSVRqGkBDPcYDswq4PCW5
	uh5LJPshnBxrxZ1LRhW2CDTaveT2AFJOndLriACrCwEJcTRdNSIwzSBfKhpFto8ckStq6YSm/zy
	5wHmg7sUzcWAsi5rn1ubsndReVmxSbqX87c9W+er3NT13C70QKZBHc7KnRrQ/qfkgeIs6TYFr1a
	NH+WXxhIoBsag0WhpuRaChB191n+aAeq/JjFC5rrPQU9bHrRZ3w+t
X-Received: by 2002:a05:6214:1245:b0:704:f7d8:7030 with SMTP id 6a1803df08f44-70fac8e562fmr189976756d6.50.1756896720632;
        Wed, 03 Sep 2025 03:52:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFz3YLnuQheLnctM3oOo4lxrx9NLlPPW3v2YzHyl9FZ5QeuhI/S48AL9YBg7OeJCK0FwoFezQ==
X-Received: by 2002:a05:6214:1245:b0:704:f7d8:7030 with SMTP id 6a1803df08f44-70fac8e562fmr189976356d6.50.1756896720171;
        Wed, 03 Sep 2025 03:52:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-337f5032df6sm9373431fa.39.2025.09.03.03.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 03:51:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 03 Sep 2025 13:51:52 +0300
Subject: [PATCH v2 4/4] drm/msm/mdp4: use msm_kms_init_vm() instead of
 duplicating it
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-msm-no-iommu-v2-4-993016250104@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5112;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=AgKTuTphksgFdjbRBscbGOKdDdsPzucjkQBsXfU1L0U=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBouB3Hyns3bJmUAeJWzCRLgAN6ruv2VcZVu6b1W
 St6rwyfI9mJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLgdxwAKCRCLPIo+Aiko
 1ZmICACBatdifNHq+RNnmtvLJqxuWiOBZ0gmol+G/G31x1B9tK7hwPbFI/ZneQuj9aQuFtTQt68
 r+Is4bOuwuS53H25Zj9SIWKWFbUgwvg23l117x+Se9C8FYpg/Vi8y9aYRzMYNfrHamGQcqxH8Qp
 XMyRMpe2S9c+V1fRmxXb/4wlAceycYENzRnheqQu8mqxmDPDxA5Y85trDxynmALGTXpvoAOtSRf
 GCPGbkOUUM4fDSbNtVJW1sH21f5S1BELVF4oVChcnBrV1etTzBO82HkD5YpzdmNrOC3WDe6akkH
 wp6m+DF960c+UGTRu5NK+u5kbu09PuQjrEtaBqJPKMBNoGPU
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAyMDAyNCBTYWx0ZWRfXzRxD5AqR4u6Y
 tATvCbSHSi3dQGdmFbSZBFR2EMeD5I/Qv42yS92VBkJBLXz3L+9a/+6qOPPws/V3ecjNO9YXgKA
 Cqe+mDuIoH7Y1l6bxiFdPPwJwsx8X+KF12lN6eWf92UOPFo5PDXCe5t4ZMfPD3d5gVYnxEBxBKR
 Mme8wvIB3GkCPzA0bJaoBh1gTvsWDlzN+TzVWYkufjeEUhqaPNvI2F93u1SqQBZsgB75QrLJ+2D
 zWZyWUBjRHNxj/WQwTiG3rG3dzcoh9sPQ7XdQ22MoyzXVgDWswlRv4I5dXJ6ub8vy2VLIWnnQa6
 h3oDpXLYa9IDou+9H1H7jJPppvzOoyjwbwEbW/BeWOdW91GcRJvQmoEPSE+14DzsuZ9LMudkbjD
 cz8r+96i
X-Authority-Analysis: v=2.4 cv=WKh/XmsR c=1 sm=1 tr=0 ts=68b81dd2 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=gwGsY3v9svKR4hS8clgA:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: tzRIAL6FbMbXQqMRbx5YQP34Me0pG-R4
X-Proofpoint-ORIG-GUID: tzRIAL6FbMbXQqMRbx5YQP34Me0pG-R4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0
 spamscore=0 malwarescore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509020024

Use the msm_kms_init_vm() function to allocate memory manager instead of
hand-coding a copy of it. Although MDP4 platforms don't have MDSS
device, it's still safe to use the function as all MDP4 devices have
IOMMU and the parent of the MDP4 is the root SoC device.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  |  2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 27 ++++-----------------------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c |  2 +-
 drivers/gpu/drm/msm/msm_drv.h            |  2 +-
 drivers/gpu/drm/msm/msm_kms.c            |  5 ++---
 5 files changed, 9 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index a306077647c317af9345eeff13082230906b5767..4e5a8ecd31f7570beb45fd1629a131e70aaefea8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1110,7 +1110,7 @@ static int _dpu_kms_mmu_init(struct dpu_kms *dpu_kms)
 {
 	struct drm_gpuvm *vm;
 
-	vm = msm_kms_init_vm(dpu_kms->dev);
+	vm = msm_kms_init_vm(dpu_kms->dev, dpu_kms->dev->dev->parent);
 	if (IS_ERR(vm))
 		return PTR_ERR(vm);
 
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 66bfa96965be275270751cba770521cfde2a7004..1d2a1e4f6ce7d02516b9497a494bb1e46297f55a 100644
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
@@ -458,30 +456,13 @@ static int mdp4_kms_init(struct drm_device *dev)
 	mdp4_disable(mdp4_kms);
 	mdelay(16);
 
-	if (!device_iommu_mapped(&pdev->dev)) {
-		DRM_DEV_INFO(dev->dev, "no IOMMU, bailing out\n");
-		ret = -ENODEV;
+	vm = msm_kms_init_vm(mdp4_kms->dev, NULL);
+	if (IS_ERR(vm)) {
+		ret = PTR_ERR(vm);
 		goto fail;
 	}
 
-	mmu = msm_iommu_new(&pdev->dev, 0);
-	if (IS_ERR(mmu)) {
-		ret = PTR_ERR(mmu);
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
-	}
+	kms->vm = vm;
 
 	ret = modeset_init(mdp4_kms);
 	if (ret) {
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 5b6ca8dd929e1870b7228af93da03886524f5f20..61edf6864092664afe474cc8d1fd097ca495ebb8 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -534,7 +534,7 @@ static int mdp5_kms_init(struct drm_device *dev)
 	}
 	mdelay(16);
 
-	vm = msm_kms_init_vm(mdp5_kms->dev);
+	vm = msm_kms_init_vm(mdp5_kms->dev, pdev->dev.parent);
 	if (IS_ERR(vm)) {
 		ret = PTR_ERR(vm);
 		goto fail;
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 9875ca62e9adb12dca9bcc74e2825b0364372a54..f4c20dc91cc600d8ab72bce002cbe6b9fdf9a720 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -229,7 +229,7 @@ void msm_crtc_disable_vblank(struct drm_crtc *crtc);
 int msm_register_mmu(struct drm_device *dev, struct msm_mmu *mmu);
 void msm_unregister_mmu(struct drm_device *dev, struct msm_mmu *mmu);
 
-struct drm_gpuvm *msm_kms_init_vm(struct drm_device *dev);
+struct drm_gpuvm *msm_kms_init_vm(struct drm_device *dev, struct device *mdss_dev);
 bool msm_use_mmu(struct drm_device *dev);
 
 int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index 725367157d90e45854cb8a22ea25a3fa3bb218be..6e5e94f5c9a7474d014e73b0b7bd06a94939ed1e 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -177,12 +177,11 @@ static int msm_kms_fault_handler(void *arg, unsigned long iova, int flags, void
 	return -ENOSYS;
 }
 
-struct drm_gpuvm *msm_kms_init_vm(struct drm_device *dev)
+struct drm_gpuvm *msm_kms_init_vm(struct drm_device *dev, struct device *mdss_dev)
 {
 	struct drm_gpuvm *vm;
 	struct msm_mmu *mmu;
 	struct device *mdp_dev = dev->dev;
-	struct device *mdss_dev = mdp_dev->parent;
 	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_kms *kms = priv->kms;
 	struct device *iommu_dev;
@@ -193,7 +192,7 @@ struct drm_gpuvm *msm_kms_init_vm(struct drm_device *dev)
 	 */
 	if (device_iommu_mapped(mdp_dev))
 		iommu_dev = mdp_dev;
-	else if (device_iommu_mapped(mdss_dev))
+	else if (mdss_dev && device_iommu_mapped(mdss_dev))
 		iommu_dev = mdss_dev;
 	else {
 		drm_info(dev, "no IOMMU, bailing out\n");

-- 
2.47.2


