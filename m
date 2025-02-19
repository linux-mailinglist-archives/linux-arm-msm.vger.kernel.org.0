Return-Path: <linux-arm-msm+bounces-48552-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE3CA3C92A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 20:51:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 88D6D188FFA2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 19:50:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17F5122D7A0;
	Wed, 19 Feb 2025 19:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HRj/HmBm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD1B22B8A2;
	Wed, 19 Feb 2025 19:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739994607; cv=none; b=jgy2q0N8QIyAVJME1AmAKz8opePP2oEF9o+6zpp00JUwp5/SzUreVvL3ZmLhaSMvpXE+7DP0JiKiwrZR5Ljy9U5PzsEgSWxKIFXtrm+CDMaVx4KoPItBg6/8Eojk/qGIlOrzOkcY0llTDu4h96bbviyoGM/QJcVmZ8n/B3zYAqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739994607; c=relaxed/simple;
	bh=9PlUEEYxH08wAwhdw62BisiVOeCwatso0UgX5B7P5C8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=gxcGc/uraySefMmA01KiXb8i2ON9EResnoXNlfETPVeQQu9unByQvSOXbNU20Mdt2d6gqwsra4/v4kdXltiiNDRTdwu65WjC8n9ciNZUhSAxRGiJiCragK759fhLzZqO9Tc06QBvGQXOGayViDeF3s/e9SeQXCxKXPacaYyrvEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HRj/HmBm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51JG5p60031803;
	Wed, 19 Feb 2025 19:50:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1EWUUlwm2G96CO62BDO6hGlhzRNJXuxFuU+fUUbj5kk=; b=HRj/HmBmTovs8srP
	iw5GYbARhF8iB2l8i1FkR7KHFHjTxPp1qtVtd7SfjpuVuVhbviiIiRS24k3y7UXC
	x0nDqwxv6Ygmv5JXVTdEidLvpd1Beni6NDHYJ39cPtp8luqdXxsbAFW52RGR5IaW
	5HB7thTX5eMXxFogdWyxS/9OlZzC5RcxCgRQYYy9JrznU4X4bDFjwLhr/IDRVvRZ
	8enKlEl/3vaKjP1OnCHQGbC7tYKRP/8/BpQyEN0TcSDifKlt0Tq8+HvAwSpmcLpd
	HGj5NsBAjtSL15mYjqYwEydpOD4tJPO8fp2uIon7IPre6plSJKmaOcSoM6F2cK4o
	DM3gqg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy5bsvy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 19:49:59 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51JJnw6j030046
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 19:49:58 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 19 Feb 2025 11:49:58 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Wed, 19 Feb 2025 11:49:21 -0800
Subject: [PATCH v3 5/5] drm/msm/dpu: rate limit snapshot capture for mmu
 faults
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250219-abhinavk-smmu-fault-handler-v3-5-aa3f0bf4434a@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739994597; l=2497;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=YPsv+J85E4gynCzjg0PYiO7irsKepAIrFxrCrUa1rpg=;
 b=ZKKbF2fG1ioYQ9g/42QWly7ev9sYIll9RRJScfkJcfdnhV3bTwvFbUXpvpSpkXWAcWWsYLiku
 zkU1+lapdpQD8YKAsl11lyhIh/wws0weMK9J9TZOG1qMwTK6mQyptfI
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: SJvQ1ZOvKB2ZCzG_8Ws_akan444aioYt
X-Proofpoint-GUID: SJvQ1ZOvKB2ZCzG_8Ws_akan444aioYt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_08,2025-02-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=921 spamscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502190153

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
Changes in v3:
- Clear fault_snapshot_capture before calling prepare_commit() (Dmitry)
- Make fault_snapshot_capture an atomic variable (Dmitry, Abhinav)
---
 drivers/gpu/drm/msm/msm_atomic.c | 2 ++
 drivers/gpu/drm/msm/msm_kms.c    | 5 ++++-
 drivers/gpu/drm/msm/msm_kms.h    | 3 +++
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
index 9c45d641b521..44b402e70925 100644
--- a/drivers/gpu/drm/msm/msm_atomic.c
+++ b/drivers/gpu/drm/msm/msm_atomic.c
@@ -221,6 +221,8 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
 	kms->funcs->wait_flush(kms, crtc_mask);
 	trace_msm_atomic_wait_flush_finish(crtc_mask);
 
+	atomic_set(&kms->fault_snapshot_capture, 0);
+
 	/*
 	 * Now that there is no in-progress flush, prepare the
 	 * current update:
diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index 1d3dae3d4c93..171462a8e08c 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -168,7 +168,10 @@ static int msm_kms_fault_handler(void *arg, unsigned long iova, int flags, void
 {
 	struct msm_kms *kms = arg;
 
-	msm_disp_snapshot_state(kms->dev);
+	if (atomic_read(&kms->fault_snapshot_capture) == 0) {
+		msm_disp_snapshot_state(kms->dev);
+		atomic_inc(&kms->fault_snapshot_capture);
+	}
 
 	return -ENOSYS;
 }
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index e60162744c66..3e28c4e012d2 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -128,6 +128,9 @@ struct msm_kms {
 	int irq;
 	bool irq_requested;
 
+	/* rate limit the snapshot capture to once per attach */
+	atomic_t fault_snapshot_capture;
+
 	/* mapper-id used to request GEM buffer mapped for scanout: */
 	struct msm_gem_address_space *aspace;
 

-- 
2.48.1


