Return-Path: <linux-arm-msm+bounces-42603-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF859F5B74
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 01:29:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CBF991893D0B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 00:29:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75B603595A;
	Wed, 18 Dec 2024 00:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bt9uSA1l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C622D182C5;
	Wed, 18 Dec 2024 00:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734481714; cv=none; b=VNlyZuhktqbnpeAcqJ3Khk/uq8wJapa/7D64FPW8dFJp3smDzYiUs756wVl2kh9+BX+JHWQLbSJlqtxPZToe7cdn7hoONsxZWzXphfkZ3gWm0BD51tNQoIdrxQmj5tMuW6kEEic/2XN/ncaVHm5Ygvi2XumSEs0ZNEDnA0/lNEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734481714; c=relaxed/simple;
	bh=CgB25oDrgH3vu0qg6yMsEeOgwVFjTuDng/tVI9ro8cE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=tOOj8gjxbd0eR+Q6j6w23oWOIX4OQRvuc6pDdrV118OhevO/NwN4sdZzumZObxhSy+KbeuGN+6OwNl+ybytbujXk/p9ISCiYMdjEAPthVleIgZE7CGWAOiJTHQBB5gr9zRS9e3Y0nyPzs+1idywRxIhqbm92hn+resTKH6SgyGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bt9uSA1l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BHE4rI6026168;
	Wed, 18 Dec 2024 00:28:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9zPu5578fHXgKm6aG05j7Ltg6oSrBHiTo7Y8BTLCckE=; b=bt9uSA1llNkPCvKw
	sscrYdwQnwT0FBsv5gvp0weD2L5sa94OHUa4EJ5hBJs8OOPFdrH4Y6e+Dw9RISed
	o0aN1f2RVQ+8QgKIaKo2vxe2xgqmb7nRQTvtu2yZFrYnhH2rysLkR6KB1lvyw0GH
	RaB2UO1n9DG2beuO9/4BTIhxo128FZM3Vx/0cUuL9ztm6vcCiSEuMd0l5vQWJ3Di
	ljGPH6BQV6+NghHqJHzsE7Kr3K5yuxldFV1lS2jGECRfppORql/33ghAHlC8hnNE
	tDsb/TBLYlmB1Pcm5IP0p4DMFPQFno3fzY2nhnOJ+8uuPeZWIKSVhMedeHTSOe35
	qnfQcg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43kare9cwt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 00:28:25 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BI0SOfP023110
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 00:28:24 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 17 Dec 2024 16:28:23 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Tue, 17 Dec 2024 16:27:57 -0800
Subject: [PATCH v2 5/5] drm/msm/dpu: rate limit snapshot capture for mmu
 faults
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241217-abhinavk-smmu-fault-handler-v2-5-451377666cad@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734481701; l=2414;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=HJ7RWgRkY6ApuZm7VqpdWzwUZGEUtmUze9UqrXO46Rc=;
 b=SZKgJifpUAfV+o3W/8J+inQAcLfsV+XDEwFGK9mukoJAlfYknzGRKYLvtcNIS9BV8r4197Guk
 HIb3qEvWYO6CAH/8PK+YQZwRYxfLleovo/bSJpOscjWRBlMnFx5EXfa
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: sfg_IKGFsAKEca6aFbgzJaf_ankWKESf
X-Proofpoint-ORIG-GUID: sfg_IKGFsAKEca6aFbgzJaf_ankWKESf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 mlxlogscore=937 mlxscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412180001

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

There is no recovery mechanism in place yet to recover from mmu
faults for DPU. We can only prevent the faults by making sure there
is no misconfiguration.

Rate-limit the snapshot capture for mmu faults to once per
msm_atomic_commit_tail() as that should be sufficient to capture
the snapshot for debugging otherwise there will be a lot of DPU
snapshots getting captured for the same fault which is redundant
and also might affect capturing even one snapshot accurately.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/msm_atomic.c | 2 ++
 drivers/gpu/drm/msm/msm_kms.c    | 5 ++++-
 drivers/gpu/drm/msm/msm_kms.h    | 3 +++
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
index 9c45d641b5212c11078ab38c13a519663d85e10a..9ad7eeb14d4336abd9d8a8eb1382bdddce80508a 100644
--- a/drivers/gpu/drm/msm/msm_atomic.c
+++ b/drivers/gpu/drm/msm/msm_atomic.c
@@ -228,6 +228,8 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
 	if (kms->funcs->prepare_commit)
 		kms->funcs->prepare_commit(kms, state);
 
+	kms->fault_snapshot_capture = 0;
+
 	/*
 	 * Push atomic updates down to hardware:
 	 */
diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index 78830e446355f77154fa21a5d107635bc88ba3ed..3327caf396d4fc905dc127f09515559c12666dc8 100644
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
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index e60162744c669773b6e5aef824a173647626ab4e..3ac089e26e14b824567f3cd2c62f82a1b9ea9878 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -128,6 +128,9 @@ struct msm_kms {
 	int irq;
 	bool irq_requested;
 
+	/* rate limit the snapshot capture to once per attach */
+	int fault_snapshot_capture;
+
 	/* mapper-id used to request GEM buffer mapped for scanout: */
 	struct msm_gem_address_space *aspace;
 

-- 
2.34.1


