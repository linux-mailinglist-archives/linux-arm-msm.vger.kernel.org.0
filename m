Return-Path: <linux-arm-msm+bounces-55308-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8C6A9A80C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 11:31:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C584445C0A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 09:31:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F8A7224243;
	Thu, 24 Apr 2025 09:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DUU67ApW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E963B221FB6
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 09:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487048; cv=none; b=kzBHrF7W9EYz1mYvLs3kBIH98dTE4I7gwbXPVXEG72iT4y475y9Vzf1VDqLyc+jLfqy/qeVcq4GJcS0oBzCy7J0OcfkdU6R/UwhvHiVwnnLrY/jDUPbbt8SQsrkzz/eDrPym6G100h7IhIY2e4q/kP/wcylcx5ck1aOrxJiY6J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487048; c=relaxed/simple;
	bh=NOFMD1nYVEYJjjfMb34qEI79sZOjl0v7XF7HN3hOgww=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VdMnAkMZWSgg4Xs3ZZ2YMXG2BdupAufI7kcj8UjSYVYRB8DdVmhgLKIu6wg0LVL075nZQ8qT2PrWq6f9VM5NmHCRRkgWLGSu8BqWiZBnu7GAjlqaAj/Dcb2KOfTtoxcZ9bW+IlwS+4V6ng+f3YlkHnqnVy7mu54SZD7ZZQmg22Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DUU67ApW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F6Q1028369
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 09:30:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yY8Yo5pYvT9Z4+o3bkCAq7zmpRUaxk4DK2Ff/7M+6kI=; b=DUU67ApWdav6G6YN
	WSn9hzjcyQpko/leMcfLmBQHGOuFdmU58cgfwWEfPpiOxNgKDePVC0IE4ucyQcr+
	QZ0StuljrOnKQjkzAJX1uK66u+G3djk4RwUliwcbqTzvhYryXkK/PdEobHTZQ6lP
	SxTsICXP7K6ehLMHMkFsTfaowddULEaIG3aFm2Ddv8qD56CINo1bC++Y/q/kqW+2
	dd5QsBW2nVcDwr0BIvGWBLkw4HuYnp6EmZ80iWC7VBndX2w6oHTTigkwkb/pOqYc
	uDlJewCRAOk0OCXSaWVVLXAtuGDzc5KjaGbSc2t+xCASuaVVJ9tCtgNJsqvbtrB1
	NdR3OA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jgy4yxt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 09:30:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5f876bfe0so133857885a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 02:30:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745487042; x=1746091842;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yY8Yo5pYvT9Z4+o3bkCAq7zmpRUaxk4DK2Ff/7M+6kI=;
        b=sFthvTGhxja33m1wyXVk137GKousHecM+S9hTiGA5Aoqll6kE9jqVw6LErAy9nWs/K
         0cqqcHR7yPi3yYYV/+6vA3zdcDpO6PYob1sxHROo+9Xbij0JwVUzAR5SN5L8eY7Uwcbk
         ANdjzGyFafgFDTIAXyRwZYTZF3+q9UJT5XmmTCLkm/ilAeTK8wDiKjq6W2VY/zpP+XGM
         iMwN+eGdrei6SxfOoItIBmUY8jfARo5AjnZNIos4hPiSs41M+xuujxzDRd+rLX9nrtMe
         Rw6gK1cN2ZeKEix7cUYoJQw9D/Ld3YAw8twP8fxRNBJMpGT4C1uA2pU4cYRT9wtNTpaa
         +JIg==
X-Gm-Message-State: AOJu0YzSARPbaslogDmUidydfM9NhXcErrJmVCa+E5rh+hkTAbJ94xto
	oUKezDcOF3q0A0F9wmQnxTsyqZIteiAHwdNPMEpr0gsBy8JI77Gk+pCqPYoGEehCCHp3T4+SsMc
	H8+8vQSWfLl18uIFOhuuBxDA882SlLxRkJxcanb2Xh4GNv4CU+7/GQKsBgpMEy2/a
X-Gm-Gg: ASbGncuYHHeX4xhQdYuJmEcOkAX8s3RqLuhN6sjbXQr8fXDimZ+4VAnXPyiGa79f0Ri
	FeMAt+O3H4HNme2ZEGxhNpGBYDIT983CG2RDZqMu8x0JEAc0f7lAymHlOKKMaLVp5nW13/GZIpX
	Pp23RpESeyv/xQv1sMKyaoUZtJ+72hX2ziOBti/JcEbQtRiGSHz6+N1q84Jwl2vp+keUHY8Vv/5
	5YXmDizAnRb0OJXr9jaCwOPbIRTtWt3XayulIlybBcPj0ZsQboLADJBmtDWYRxXlwKJjvyWR41p
	IArrAifR/qI1OA2E6m0eQZ/GjhwFV2GTQBvRrGIq47mhjECmGA8EFnS0gGTT/3rwyqwsBEl39xd
	efpOwyY6LJKO4lnxkghyju5H0
X-Received: by 2002:a05:620a:6106:b0:7c7:93ae:fe56 with SMTP id af79cd13be357-7c956f88f47mr243299085a.51.1745487042464;
        Thu, 24 Apr 2025 02:30:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUa/6yCoT6mZ5aizKzpe4+iNnRS2svRyasrbIHuoR01W3sgsHGigRTnWpApWKWi3FaFl+b0w==
X-Received: by 2002:a05:620a:6106:b0:7c7:93ae:fe56 with SMTP id af79cd13be357-7c956f88f47mr243295385a.51.1745487042042;
        Thu, 24 Apr 2025 02:30:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d1b9a304sm1820461fa.99.2025.04.24.02.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 02:30:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 12:30:14 +0300
Subject: [PATCH v3 10/33] drm/msm/dpu: get rid of DPU_CTL_FETCH_ACTIVE
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v3-10-cdaca81d356f@oss.qualcomm.com>
References: <20250424-dpu-drop-features-v3-0-cdaca81d356f@oss.qualcomm.com>
In-Reply-To: <20250424-dpu-drop-features-v3-0-cdaca81d356f@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2516;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=DsDYyaEtmcEU0Q3DXm3LKbekIuXiOgkLRrmoNbxq0Rs=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQwYXyxqGhQ1r1BdqhZq2OsZ/T4t6t3pvffUUrueP03ZrH
 H+Tmbeqk9GYhYGRi0FWTJHFp6Blasym5LAPO6bWwwxiZQKbwsUpABO5fov9n5GQ2W9pP7PSvoiz
 i/UFnTh1vuTFP/xinsR6V/B88tyDvTb8mzlcz12cWtlw+En2kl9f5AWrVkTMm/2/mvFISfKSisJ
 Usxz7d9Lf8p64ldbc4985uz9Pj/v3prkbJ5vZlFcJF53fPruY1SXvp72YvdssMc7ewxGfvtalbw
 04+fG3bmTd3c2bpTUzqoJ2vDi/XOuzjPR/6dT0aYujlm0sdTmzaoPOy+cPjTTEY6rymnWnLet+W
 LSye1qs7Q/P9JPFJ60WBmkJF6+ScBD74KXV21HzQzfF1bEmuHZ7S/zd0yFWjSs72t5+1Oh5Xtvu
 JHOP70OWyrswR9eloncWfjblu+q97qCllry2UHDWBiUA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MyBTYWx0ZWRfX/wuHZB+aXPRR d0awJuglz3d4wX52UhhAbzycX1gWLxSAetiI2QM8hyELsmm35kT6O2k5Xh1rm5N3LtnbXQ2ho4V uEzGid6gD1rqmvVOGXR1BNFPddFPRRckuDpUFxxBD1qDQlOHyyyoiLUfCx5t9vLHZJvQnY1ChvC
 ufruKu802JK4Y6VXqHmcK9ZcA8iovKm4wwwgrlAEXwSFou9TeoiiAgxZXf9gdwrX4BBqAQ/+7Gc onxWMSBr6u63kCmSjkqp6zJUJ4H4hQqxg89eW9t72zDEOz8ysegGDstZwkkqdI+eE3/hYvyBWit K6VXU9cU0KAl0e+IbNmJD96z7xAlMwjdLLRdQQTyoh6yrmdQP4rPf42Ly9QtKYEvW/Nw3rWaqTh
 c1ubQqqNL48/DHjPe6uttmTXO/qwHOVIG8BbWLG7DKbgWlAThtHfOAuAH9AWHN7N07jKd9MZ
X-Proofpoint-GUID: LUFMlr3cAvThwWwvviGtE3ppKTIOBGej
X-Proofpoint-ORIG-GUID: LUFMlr3cAvThwWwvviGtE3ppKTIOBGej
X-Authority-Analysis: v=2.4 cv=M5VNKzws c=1 sm=1 tr=0 ts=680a04c4 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=k2A94KsD3O5M_qN9siwA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=901 malwarescore=0 impostorscore=0 clxscore=1015
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240063

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Continue migration to the MDSS-revision based checks and replace
DPU_CTL_FETCH_ACTIVE feature bit with the core_major_ver >= 7 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c     | 2 +-
 3 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 0fcc9fb975c0955f459ba4264b6a114a4b17af52..3431b3c956486aee99664ea9b7c2e00f5c130b7f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -111,8 +111,7 @@
 	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
 
 #define CTL_SC7280_MASK \
-	(BIT(DPU_CTL_FETCH_ACTIVE) | \
-	 BIT(DPU_CTL_VM_CFG) | \
+	(BIT(DPU_CTL_VM_CFG) | \
 	 BIT(DPU_CTL_DSPP_SUB_BLOCK_FLUSH))
 
 #define INTF_SC7180_MASK \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index b6c45ed4fa3d18ed21c2a2547b0d5af4debd974e..ae168e73026d8ebbe605397c6bbd95552193498c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -134,14 +134,12 @@ enum {
 /**
  * CTL sub-blocks
  * @DPU_CTL_SPLIT_DISPLAY:	CTL supports video mode split display
- * @DPU_CTL_FETCH_ACTIVE:	Active CTL for fetch HW (SSPPs)
  * @DPU_CTL_VM_CFG:		CTL config to support multiple VMs
  * @DPU_CTL_DSPP_BLOCK_FLUSH:	CTL config to support dspp sub-block flush
  * @DPU_CTL_MAX
  */
 enum {
 	DPU_CTL_SPLIT_DISPLAY = 0x1,
-	DPU_CTL_FETCH_ACTIVE,
 	DPU_CTL_VM_CFG,
 	DPU_CTL_DSPP_SUB_BLOCK_FLUSH,
 	DPU_CTL_MAX
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index c63a6cbd07d94acae04b6edf534b1a7f5d4119b1..593da532d40042ca31fb452679d3de04c3b0d1a7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -786,7 +786,7 @@ struct dpu_hw_ctl *dpu_hw_ctl_init(struct drm_device *dev,
 	else
 		c->ops.update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp;
 
-	if (c->caps->features & BIT(DPU_CTL_FETCH_ACTIVE))
+	if (mdss_ver->core_major_ver >= 7)
 		c->ops.set_active_pipes = dpu_hw_ctl_set_fetch_pipe_active;
 
 	c->idx = cfg->id;

-- 
2.39.5


