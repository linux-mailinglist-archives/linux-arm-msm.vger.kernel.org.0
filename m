Return-Path: <linux-arm-msm+bounces-24688-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E73D091C887
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 23:49:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C9621F21414
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 21:49:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9946F81748;
	Fri, 28 Jun 2024 21:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="K0+QlJgU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9717A7F7F7;
	Fri, 28 Jun 2024 21:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719611359; cv=none; b=BSHlsUUnvCmRZ5gLbXjLoIAnI6xz9u4LJlaIgpATcO6ZN9n+K5I57gc6HA2TL0YRpxn4+YqcCtTIDEUPZX/bE+KE3MvcdyrR9vmU4n2CfnTQmjfjhtl+VtoX2dz2TIcFPVngZOY22ISp2N8dRwyZd0zy9hkKXTR/lqVc1sdC1dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719611359; c=relaxed/simple;
	bh=KVv15TCBlr/3OlE7u3q1NVhY3YIWEx1DUoVIOmE+Nz0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ra3GD1MzgPoqwmY+Xe7bOqSp0Xee0bIIHAKEJHhBNjBYzyTi/6kgRPLUQEmgkXdVz4tXzqBZg9eMyhgrM0+ORMBvJKfrkD5ZuV8wUGQ20AE6GnpJ6tZbAHCmwb4CjOn0OB4iWYW9bQqtrdwx9PwMZky3htr+Xz16GJhku9+1IVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=K0+QlJgU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45SEwC2O015144;
	Fri, 28 Jun 2024 21:49:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jm7Cf/Q39JQalwuzHNAv49M3o2JwsID+UdsKSQlM8eQ=; b=K0+QlJgUHiH4hm92
	H+vHf98TGogbijDznplTolcO1IDgvf9Kv3q5OHoKTjbWa7f4MDRP7icgOWOk51tJ
	VNndVLAMDBnvPkWNQSFy0KyvPghkkil+BIcET/tyukfvdnuZbhiPgCFKo1wNTG1B
	iBztSELWOBiK0t6zp2lO35lKt8Iqw5DIiNoM5NbWpqA7CiPKMttyYfBVKWWMCjxd
	BJ9HnRD4G75URAbYFS7aAkhh0t3mj+DW8qQ4nzfh+sdUt82fgKKFzGYFznP+zrXN
	Rngt7RMvUh1/rheQBUaxNh+m8DR0JtVqX0wTIYAG6mTnlJ4ljppmVMHPg1OoSPtO
	xlco/A==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywqsj1ffe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jun 2024 21:49:08 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45SLn7wp032577
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jun 2024 21:49:07 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 28 Jun 2024 14:49:07 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <quic_jesszhan@quicinc.com>,
        <swboyd@chromium.org>, <dianders@chromium.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 5/5] drm/msm/dpu: rate limit snapshot capture for mmu faults
Date: Fri, 28 Jun 2024 14:48:47 -0700
Message-ID: <20240628214848.4075651-6-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240628214848.4075651-1-quic_abhinavk@quicinc.com>
References: <20240628214848.4075651-1-quic_abhinavk@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: D2rY39SGmFw3r9mIXf-cT9g1pF3whRcx
X-Proofpoint-GUID: D2rY39SGmFw3r9mIXf-cT9g1pF3whRcx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-28_16,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 bulkscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 mlxscore=0 impostorscore=0 mlxlogscore=999 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2406280164

There is no recovery mechanism in place yet to recover from mmu
faults for DPU. We can only prevent the faults by making sure there
is no misconfiguration.

Rate-limit the snapshot capture for mmu faults to once per
msm_kms_init_aspace() as that should be sufficient to capture
the snapshot for debugging otherwise there will be a lot of
dpu snapshots getting captured for the same fault which is
redundant and also might affect capturing even one snapshot
accurately.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/msm_kms.c | 6 +++++-
 drivers/gpu/drm/msm/msm_kms.h | 3 +++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index d5d3117259cf..90a333920c01 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -168,7 +168,10 @@ static int msm_kms_fault_handler(void *arg, unsigned long iova, int flags, void
 {
 	struct msm_kms *kms = arg;
 
-	msm_disp_snapshot_state(kms->dev);
+	if (!kms->fault_snapshot_capture) {
+		msm_disp_snapshot_state(kms->dev);
+		kms->fault_snapshot_capture++;
+	}
 
 	return -ENOSYS;
 }
@@ -208,6 +211,7 @@ struct msm_gem_address_space *msm_kms_init_aspace(struct drm_device *dev)
 		mmu->funcs->destroy(mmu);
 	}
 
+	kms->fault_snapshot_capture = 0;
 	msm_mmu_set_fault_handler(aspace->mmu, kms, msm_kms_fault_handler);
 
 	return aspace;
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index 1e0c54de3716..240b39e60828 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -134,6 +134,9 @@ struct msm_kms {
 	int irq;
 	bool irq_requested;
 
+	/* rate limit the snapshot capture to once per attach */
+	int fault_snapshot_capture;
+
 	/* mapper-id used to request GEM buffer mapped for scanout: */
 	struct msm_gem_address_space *aspace;
 
-- 
2.44.0


