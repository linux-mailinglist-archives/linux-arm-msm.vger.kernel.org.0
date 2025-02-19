Return-Path: <linux-arm-msm+bounces-48554-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EBCA3C924
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 20:50:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 346E13AE014
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 19:50:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 339B922E3FA;
	Wed, 19 Feb 2025 19:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="G5q6QLgS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD7522B8A4;
	Wed, 19 Feb 2025 19:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739994608; cv=none; b=oByU/XY3plbq6C7NvPQkWtFix7ozFBbWKIzHgEHP0NFK9pPIkiw9QT+88CF1WxoajVbU2nPMRRC3+12FFaeaoPqSYEpVkyDRQYa5M8XcZ4UGScuZz/csuxy788bdm1GgMuBCwHGAGURxCtazducwSH0y8sGWf5xXV/Mtjpfn5dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739994608; c=relaxed/simple;
	bh=72PUKYyhd6rZz+cPjixJZy7iPD7oAhYxKTLnPSPOZrs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=oAKMQ3bZQQz3fl7W02b98xFVvnHpgUDjw36c0zpeQlqxMZ2PU4k7rL/t1kssBvev+yMbZBUtCOH9YT+/w43KYakoEAcqvdWnad0p8tSgCe5DnsvqiDkVELkwQ9j+KlGWwNYy3LIDNg5GHqSC2Mp9CS6QsQNBVE9TgIqGTagsyyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=G5q6QLgS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51JH4MAF009730;
	Wed, 19 Feb 2025 19:49:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PxYXWn/TUNGT9PBFWUBYkw6q7ID3r4rvvm4gQoUMvPM=; b=G5q6QLgSdS3O41I0
	zcC2500ipiY3nrnm61U5ouQeTLBlILr7EEPlDXOheZ63g8kNXRkVH8y8dFo9hbt9
	j/SGN4DCWJ84jX6MJJmnXvmYxNjsGj+3JQTpDPJtvVaBynM+bcLZ/DODuKzorAkK
	IbMA8tM7fPH5hEdo7mZ2jCBh00qXty/lt7BpPFda0aIHHUDjcCFLpBPd5L+LavhK
	h2W+iltruLkpkv1S9o3MIrzRXABUaPC86K3I3QKQqbuta1Dvuw7GYw/RKsx1JGkh
	LItZruxGcpdf31lj/hRZKcf2jSQNAgoxYukgfCfxU057aed0sLohU3OcRzmltMfS
	5TIGow==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy1uuqa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 19:49:58 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51JJnv48010712
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 19:49:57 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 19 Feb 2025 11:49:57 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Wed, 19 Feb 2025 11:49:17 -0800
Subject: [PATCH v3 1/5] drm/msm: register a fault handler for display mmu
 faults
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250219-abhinavk-smmu-fault-handler-v3-1-aa3f0bf4434a@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739994597; l=1696;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=wK9DdHjkNqpU+pRwsudY908n0ZWa/XAtsAxmvcZdX2s=;
 b=LaSYs6ZwYBUkBAwSDemyI/Qrr/UImGB85DHQevqft1YSazxttPxJq1gCqIoON248D+AOUfHEo
 LphzwYMtPOiDkBaX2sIB2ZjruamB+0dfYE2wF18/jmqO4tiR4R+VY2h
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: vNtlS6LREfpKQ9xemga2PDPnxsJSUYOs
X-Proofpoint-ORIG-GUID: vNtlS6LREfpKQ9xemga2PDPnxsJSUYOs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_08,2025-02-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502190153

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
index 4cfad12f4dc1..1a9f551ea031 100644
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
2.48.1


