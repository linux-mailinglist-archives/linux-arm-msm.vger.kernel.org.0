Return-Path: <linux-arm-msm+bounces-32468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26734985738
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 12:34:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 500A11C20BF9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 10:34:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33CE31474B9;
	Wed, 25 Sep 2024 10:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VqLgN6br"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744A31304AB;
	Wed, 25 Sep 2024 10:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727260461; cv=none; b=IdjIEPtv6rJt84lTTeLAwUBTE1dSlLtOIf0LbgptssGlDwTEznEOwOJuQOLCgHl+Dw8Z2KnGvAb+73t1px+95nGL/x5tlGV3JGHVxkLY5f1o5C8crj50cNRpzf8D+wQ7bs9rgZnVoaelwdjWeRyvewblEuCOB8Xi4W5ptduSong=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727260461; c=relaxed/simple;
	bh=Ih0eZVGy2u1bgO5w/cU3c0CaCbAcvFxlPkiN+QUaznM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pv+jtGS9+YU//v0DIkW9VqkV6u3HOEXRejPEeRWLc3OSIIvqmg4SzR9FT+ZMHVatelilHAse13EIPFzCG0a9UJuBUaLK3axF+I0esTxO+B1tPvofxHWnGLvn99yA+GEVIqiNomEplxsHetLzXiWa02KjOYHiKgTjtcf9CUsCiig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VqLgN6br; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48P84SAP026808;
	Wed, 25 Sep 2024 10:34:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6NE1TN9QRZJT4d/UVAfDRd
	WL9ww6G38R4/OqvHvAJm4=; b=VqLgN6brQ3HlS756W/ONihmSOKg/tZroDBsi4A
	W+EvjmA0MqqOpsHRK2EEQUIEKWmooVsL8Nrzd7MUpB8nrou+cupZMf0DuZTfT401
	5OBBw05YEqfFSvPAjHHlsZLQw8rUpqqobVNMP7t+FIgUzriMoHP+EyWZcoljxdxC
	FnMzdESPXNP59NiZoq4ZgfLr2+Z4RRbPncDdBMVsUaxAGnmGebrVwR1UaKe1FV+A
	EenodiMxBlKYBpK7Asl0Kd5i3fKskLenPiKbV0sYSipqxufRmfrEQvWXZ+yMmDBm
	DcizQvjOhSIKAGdZutq0WkEl624mAd21instsl/EIVphzxpA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41sqakkcx4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Sep 2024 10:34:15 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48PAYFce014184
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Sep 2024 10:34:15 GMT
Received: from hu-mojha-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 25 Sep 2024 03:34:13 -0700
From: Mukesh Ojha <quic_mojha@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Mukesh Ojha <quic_mojha@quicinc.com>
Subject: [PATCH] remoteproc: qcom: Fix NULL pointer in glink_subdev_stop()
Date: Wed, 25 Sep 2024 16:03:51 +0530
Message-ID: <20240925103351.1628788-1-quic_mojha@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: P5mw_FoXn3xdWA6pA1Eh-xrBLwNCJMMa
X-Proofpoint-GUID: P5mw_FoXn3xdWA6pA1Eh-xrBLwNCJMMa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0
 clxscore=1011 malwarescore=0 lowpriorityscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409250072

Multiple call to glink_subdev_stop() for the same remoteproc can happen
if rproc_stop() fails from Process-A that leaves the rproc state to
RPROC_CRASHED state later a call to recovery_store from user space in
Process B triggers rproc_trigger_recovery() of the same remoteproc to
recover it results in NULL pointer dereference issue in
qcom_glink_smem_unregister().

Fix it by having a NULL check in glink_subdev_stop().

	Process-A                			Process-B

  fatal error interrupt happens

  rproc_crash_handler_work()
    mutex_lock_interruptible(&rproc->lock);
    ...

       rproc->state = RPROC_CRASHED;
    ...
    mutex_unlock(&rproc->lock);

    rproc_trigger_recovery()
     mutex_lock_interruptible(&rproc->lock);

      adsp_stop()
      qcom_q6v5_pas 20c00000.remoteproc: failed to shutdown: -22
      remoteproc remoteproc3: can't stop rproc: -22
     mutex_unlock(&rproc->lock);

						echo enabled > /sys/class/remoteproc/remoteprocX/recovery
						recovery_store()
						 rproc_trigger_recovery()
						  mutex_lock_interruptible(&rproc->lock);
						   rproc_stop()
						    glink_subdev_stop()
						      qcom_glink_smem_unregister() ==|
                                                                                     |
                                                                                     V
						      Unable to handle kernel NULL pointer dereference
                                                                at virtual address 0000000000000358

Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
---
- We can do this NULL check in qcom_glink_smem_unregister() as it is
  exported function however, there is only one user of this. So, doing
  it with current approach should also be fine.

 drivers/remoteproc/qcom_common.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
index 8c8688f99f0a..52d6c9b99fdb 100644
--- a/drivers/remoteproc/qcom_common.c
+++ b/drivers/remoteproc/qcom_common.c
@@ -209,6 +209,9 @@ static void glink_subdev_stop(struct rproc_subdev *subdev, bool crashed)
 {
 	struct qcom_rproc_glink *glink = to_glink_subdev(subdev);
 
+	if (!glink->edge)
+		return;
+
 	qcom_glink_smem_unregister(glink->edge);
 	glink->edge = NULL;
 }
-- 
2.34.1


