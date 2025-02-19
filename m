Return-Path: <linux-arm-msm+bounces-48551-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BD315A3C928
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 20:50:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E217188F6C1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 19:50:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC5E022CBEA;
	Wed, 19 Feb 2025 19:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TIeFGsec"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC5221B19E;
	Wed, 19 Feb 2025 19:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739994606; cv=none; b=WX8IqDp9Y6R/CiVqflCHh87IP0+5XswowKQqCZ4Umdt4uchzDWW2uLXhYCtvvK3Ul+xyeoJGwd2p1JBSrAcWozI4kmARs358B+KBc7zyx9s5H6g1zAtUNLphFZ+tmDFxXKYkpuxqdH4lWe+TBg61MUfPWJWtU9f3SMRjfGQnRLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739994606; c=relaxed/simple;
	bh=na6tRMY2nDLZLDxp6DUxdR2j8PPKYFVxpSitdTsBMT4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=i47ijVczFBLtfGQwjapXGiQr4h4vLorhHRstR51eOWqCfsxqmOBge7BICTqRaKs1x9+tD7XqrwnkOB76mV2ZiCH9JXAfgxWpRpPJ0Hec/spKQh2UmSvnFYLLOlUlz3yGrAJc+NE0BeUNsYaliWKMOJWEyyfJgPUASuhdOYAkgE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TIeFGsec; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51JG5AqL011626;
	Wed, 19 Feb 2025 19:49:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MvvT+DAcnXh2DZoZQ+WrszmWm0FnhK3YiKXvc4Y/A0Y=; b=TIeFGsecpm4V2UtD
	mL7wgojmwa/XlZbgZACeYT9WU/GsrzxXG9RuAAzHCKKMlzcpijM2DeBQe8b2h77D
	0Rou1AwNYc9CyNHFA2D8/KGzybdKvTBy3SSwE4oMPgZMV3NoGlDVKKhw23i2Kg1I
	MNXcv93fcMkqcJ37nCwkThyfCzJ5v1YvlElWJ3pShvXbLoCI6hnk6NXwBczUJRGb
	tLjQa5ogT2wU9rtgsbaxCc1sdJQZ28g9E/xDms0a4Fx0uYuQh+7SLUfS0IdBwoO/
	9KAc916baHFb9vnPO9vt2cDEmzA20DLKnyqUfFV645BytpE46ZKIeyWVItZROexk
	d4Q1iw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy3ksmd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 19:49:59 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51JJnwLi010722
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 19:49:58 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 19 Feb 2025 11:49:58 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Wed, 19 Feb 2025 11:49:20 -0800
Subject: [PATCH v3 4/5] drm/msm: switch msm_kms to use msm_iommu_disp_new()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250219-abhinavk-smmu-fault-handler-v3-4-aa3f0bf4434a@quicinc.com>
References: <20250219-abhinavk-smmu-fault-handler-v3-0-aa3f0bf4434a@quicinc.com>
In-Reply-To: <20250219-abhinavk-smmu-fault-handler-v3-0-aa3f0bf4434a@quicinc.com>
To: Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>
CC: Abhinav Kumar <quic_abhinavk@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>,
        "Jessica
 Zhang" <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.15-dev-f0f05
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739994597; l=865;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=YyfUWthfUVhSwt8MIJf9DYWrG9IFT6JTRe2gToz7Vdg=;
 b=XqHnW+vQJTbOpuirAj/6dv2dOTat+llI2ZbF6VfyWkdk0QzHQ9n2oNu8AsVt230teV7ELcNhC
 19FgWQDNuZlAJVXrTOeu4EJdEzX7DXuvkO3KLIPH0P0p/wJhP/cSZ6n
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: tcJ9kb6Rr_V7kqQrY8215058KcSWnPQP
X-Proofpoint-GUID: tcJ9kb6Rr_V7kqQrY8215058KcSWnPQP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_08,2025-02-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2502190153

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Switch msm_kms to use msm_iommu_disp_new() so that the newly
registered fault handler will kick-in during any mmu faults.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/msm_kms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index 1a9f551ea031..1d3dae3d4c93 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -192,7 +192,7 @@ struct msm_gem_address_space *msm_kms_init_aspace(struct drm_device *dev)
 	else
 		iommu_dev = mdss_dev;
 
-	mmu = msm_iommu_new(iommu_dev, 0);
+	mmu = msm_iommu_disp_new(iommu_dev, 0);
 	if (IS_ERR(mmu))
 		return ERR_CAST(mmu);
 

-- 
2.48.1


