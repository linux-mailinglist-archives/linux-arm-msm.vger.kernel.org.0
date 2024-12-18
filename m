Return-Path: <linux-arm-msm+bounces-42600-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F829F5B6D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 01:28:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 59A091891EBD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 00:28:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA3DB1E487;
	Wed, 18 Dec 2024 00:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CZlFSf/n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00971EAF9;
	Wed, 18 Dec 2024 00:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734481713; cv=none; b=gcyn2i4OsF6o3/pUZRSN1vpuQxQPqoDbyQCPB7xUJgspRw8mFSnUU1sbLOLSAB/Kbe8/4q9pGKeK4EjJrZBPCQ6Je2j64TzEcXVeefpkNxDqxiTGcEV8q+1tmFTu/vSR5UKoH9Ow9iNxMpaUGPyMorGvKJ+H0PiowwIImdKp4S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734481713; c=relaxed/simple;
	bh=JXa4jf5z1eYmMq5BD+knAESQVitUbJWnYJC0jiZQi8M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=GTzb8GODUNu9Mde26WspHHt0dWOR9qCze2NvrP1ubB/2bcClJtAidPIQDjN20DtzmTsOdeuKu0pGtwh9Ipu23YhGWG4qwqIbWHvsKOuuld/3gJTxvOoOG5heC0f3xf10WuyuN1xObaO9fHut8LxcDWzm71OUkX32lMG/ZrNa9DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CZlFSf/n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BHIJua9013414;
	Wed, 18 Dec 2024 00:28:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k7k8mes5yRRlpNBEP7IJ8UGnzSSiNPkLMMVxc3mv8wY=; b=CZlFSf/n9BHljKvq
	KeyDsUyrFem0DpFT+xrM82lHPV7RrUltZv3nK71wqHOodDmthxsEi9CcWtnZSS7S
	xpL+cReloTnha7W3uwW727wWiIvjS+upG09OxRnJuISOlWsJmJEIRW/fGsr8Tx7z
	4BROcbCu9+q2pUCC+VbM2DFPiEgBaBTGB+dwUmHrVQRfAIIrYvSmvG9IgmmV9Ogr
	uYde/TeMOBIUmTgu4YUNHqKMzB5b9QCdkAyjP2NlgaZjFE0ATg+zsav/ScCLAEJQ
	FTpFwc8qyiCB7K7+oLDCCJ0ziNJT5OG7ux+UDTFk3T4uZd9O2HKWkW4ytrPbWLmi
	qp7DMg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43kefxgpe0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 00:28:23 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BI0SM07032542
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 00:28:22 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 17 Dec 2024 16:28:22 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Tue, 17 Dec 2024 16:27:53 -0800
Subject: [PATCH v2 1/5] drm/msm: register a fault handler for display mmu
 faults
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241217-abhinavk-smmu-fault-handler-v2-1-451377666cad@quicinc.com>
References: <20241217-abhinavk-smmu-fault-handler-v2-0-451377666cad@quicinc.com>
In-Reply-To: <20241217-abhinavk-smmu-fault-handler-v2-0-451377666cad@quicinc.com>
To: Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>
CC: <quic_abhinavk@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734481701; l=1752;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=ifcZn0k66J0EOjrxa290NN1+zLmQPksCvDyffR0jPWw=;
 b=uHoC2sqU7Tt8b9hMGGRaLsPh9dJO5frboQ2jPFuqBtCeTJBZ2XSkco8LZ7afzbx1QgXvGHLV+
 TwZPvbiAFxFBbbRlpHCyYpzZrTajrjbiET/USiRxj+4mkUDPXn53YSw
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: T4w_VNUBWFJMvPST0bO_AoTlAJO4-8-y
X-Proofpoint-ORIG-GUID: T4w_VNUBWFJMvPST0bO_AoTlAJO4-8-y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 adultscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412180001

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

In preparation to register a iommu fault handler for display
related modules, register a fault handler for the backing
mmu object of msm_kms.

Currently, the fault handler only captures the display snapshot
but we can expand this later if more information needs to be
added to debug display mmu faults.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/msm_kms.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index f3326d09bdbce19d40d0b48549c330c2b836476f..cf5f15b9cd16a23e9bea820cfc096caa0d7da175 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -164,12 +164,23 @@ void msm_crtc_disable_vblank(struct drm_crtc *crtc)
 	vblank_ctrl_queue_work(priv, crtc, false);
 }
 
+static int msm_kms_fault_handler(void *arg, unsigned long iova, int flags, void *data)
+{
+	struct msm_kms *kms = arg;
+
+	msm_disp_snapshot_state(kms->dev);
+
+	return -ENOSYS;
+}
+
 struct msm_gem_address_space *msm_kms_init_aspace(struct drm_device *dev)
 {
 	struct msm_gem_address_space *aspace;
 	struct msm_mmu *mmu;
 	struct device *mdp_dev = dev->dev;
 	struct device *mdss_dev = mdp_dev->parent;
+	struct msm_drm_private *priv = dev->dev_private;
+	struct msm_kms *kms = priv->kms;
 	struct device *iommu_dev;
 
 	/*
@@ -197,6 +208,8 @@ struct msm_gem_address_space *msm_kms_init_aspace(struct drm_device *dev)
 		mmu->funcs->destroy(mmu);
 	}
 
+	msm_mmu_set_fault_handler(aspace->mmu, kms, msm_kms_fault_handler);
+
 	return aspace;
 }
 

-- 
2.34.1


