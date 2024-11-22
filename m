Return-Path: <linux-arm-msm+bounces-38886-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B999D6637
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Nov 2024 00:09:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 005A2B21776
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 23:09:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCA78189BBA;
	Fri, 22 Nov 2024 23:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pz+qUQ9o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52F312E4A;
	Fri, 22 Nov 2024 23:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732316979; cv=none; b=CtUGpuQSRqPqraTrzG7LDXfneVbfThZX2FuregHRzNCyUHcGPw+eFmUKLHRglc/NSqyYgiwJ0dtIOiWodoaGLqerCm8wHQUkWQUz8/GtCuKajrpydgu/r5fpVms12Kzuys6VhXco9vzYp8zSoerRikObKfS9ClRXqwxss37Ov2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732316979; c=relaxed/simple;
	bh=TJOLdSpE1fHET9ApFeylxGcqytAo8E17FRHaAgSGC40=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=chWLotZcLaXJmSaAU3jmvpDlmynPfqMMZwCJkhBD0tABa58dM/NmexBS7W1eIxCNnAY5gH0roJiTRxTMT9SVnM+kT9SGguu7IENjc4fjSkJWanWJ2zzP3+m/mJT5f1gEMM0sX22X4+XMT5c5GJ9hYpOFLzULtIiQ+faIJjEU3gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pz+qUQ9o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AMHVGQf015521;
	Fri, 22 Nov 2024 23:09:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WiMlvrwkPosfBz2ctCmK2s
	nOyJ8A+EyYdYrryfeNcEI=; b=pz+qUQ9o0cbnMCszL2VYgXzUKPDJomFUg5t6li
	lzROxzFsHX+w7Ao9tjL/RhkyEL6egC9FdgwwnFTrJWA03o4sTOy16tuBT/XHWYtj
	oWFgq0Zyds/VOgi+aInZrnX/D9/E7MYt6Fqfju5YpRjdBCCYF41V/dS0cy27tSVf
	mKxgTT4vWd1HJHV1/ui+OkRnSNaSYJX8J/qPYAaU8KT5QT8AKbo0bHDqXVhMfjYd
	z73/k+sF0JZdu6FukOPboCQmfHVeCe8nJYjum6w+r/dWC0r+uc9NxnVO5Vo8cXbs
	5b55d8y06Ris4GAuFA21ND06uK4o92jq/7lt4WkCzOsguU+g==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4320y9nhd6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 23:09:27 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AMN9RlM025232
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 23:09:27 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 22 Nov 2024 15:09:26 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Fri, 22 Nov 2024 15:09:10 -0800
Subject: [PATCH] drm/msm/dpu: Add VBIF to DPU snapshot
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241122-vbif-snapshot-v1-1-6e8fedd16fdf@quicinc.com>
X-B4-Tracking: v=1; b=H4sIABUPQWcC/x3MQQqAIBBA0avIrBNSo6KrRAuzsWaj4oQE0t2Tl
 m/xfwXGTMiwiAoZCzHF0KA6Ae6y4URJRzPoXg9KaS3LTl5ysImveMt9nMzsj8lY56E1KaOn5/+
 t2/t+ZW9+Q18AAAA=
X-Change-ID: 20241122-vbif-snapshot-b6738fd73acf
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
X-Mailer: b4 0.15-dev-355e8
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732316966; l=1222;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=TJOLdSpE1fHET9ApFeylxGcqytAo8E17FRHaAgSGC40=;
 b=Iizvuq/vZQmlQPiypKszQNU+lN/yHM7hbto87+25xTZtAHzuTMU65pKQazOpyAPcKKxT5FSnV
 mPemYxkt6ABCBiqe6kdtqRt6osXDm/kVs6Gmt+JP8NgyYMPvm9+gTmT
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Q695kx613nNHlAvXGyWyEbtsvLBl0AP8
X-Proofpoint-ORIG-GUID: Q695kx613nNHlAvXGyWyEbtsvLBl0AP8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 mlxlogscore=915 spamscore=0 mlxscore=0 malwarescore=0 clxscore=1011
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411220196

Add VBIF registers to the DPU snapshot to help with debugging.

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index ca4847b2b73876c59dedff1e3ec4188ea70860a7..df90b080be5a1a07bea76bad4f282d80cc0e4397 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1024,6 +1024,14 @@ static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_k
 		msm_disp_snapshot_add_block(disp_state, cat->cdm->len,
 					    dpu_kms->mmio + cat->cdm->base, cat->cdm->name);
 
+	for (i = 0; i < dpu_kms->catalog->vbif_count; i++) {
+		const struct dpu_vbif_cfg *vbif = &dpu_kms->catalog->vbif[i];
+
+		msm_disp_snapshot_add_block(disp_state, vbif->len,
+					    dpu_kms->vbif[vbif->id] + vbif->base,
+					    vbif->name);
+	}
+
 	pm_runtime_put_sync(&dpu_kms->pdev->dev);
 }
 

---
base-commit: 86313a9cd152330c634b25d826a281c6a002eb77
change-id: 20241122-vbif-snapshot-b6738fd73acf

Best regards,
-- 
Jessica Zhang <quic_jesszhan@quicinc.com>


