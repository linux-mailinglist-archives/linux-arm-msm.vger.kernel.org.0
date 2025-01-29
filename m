Return-Path: <linux-arm-msm+bounces-46525-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D8EA22107
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 16:56:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0C623A35E3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 15:56:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAF0C1DE885;
	Wed, 29 Jan 2025 15:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JegPAI6V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB9E1BD9E6
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 15:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738166184; cv=none; b=H9lTyJYvrkHuTifIK+BhusM5OVD9+Jxm9tKRU8KpW3BczkW8VRSRmov8ZgRz8kmHBBpIKqKADyxS/sreDZOuwU9s4g+COFxzAdbOb1CNPhfqTbHVS4tC6Opo2MSoOyS+dLQfYSXkW43km9dvm5zoY7Wu8P551plXGhQzzjhvLiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738166184; c=relaxed/simple;
	bh=Dt7xkAk4I2Scvbht6IKyvbEclkFIJDnQUwr7f8DbyTg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hX5CbbIpFVS7EI9H4/lhAzj3sMohM5Y6wDJiGY7a9TiC5t9vRVPzVaWKQKuYb+JNvk0h1RhDjPI6IoOkqEb5ltFFUPCXik84PMHGa5GgLNMug0jHlXJoH+3e993ftWp2G1XcB1PmmrHzMo1n12aFxvy6N4tGBO02FoypzqRNRWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JegPAI6V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50TB51ga025544
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 15:56:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=DxY0icfYFDPYpLy0SN45Y3l8ipVx2gW7otJ
	CvY2psTE=; b=JegPAI6VLv/mjpZGwYAIvo4eRCROAsoZpDS6YXmEpZLTukASaZv
	NoVT4yrXIbsmFWMmm9nTgPod+qJ6PazaDvd3gHcU/sbCn/hJkYhN2+Ak9IIAj9jI
	nJsQOiJLRge7WVz3qfTv2K78W35fL7rl0elpnpUTim2k7etoRDXzawhPmwFuhSq4
	KYE+cZmX/Mv1PM6iNzQVwhg5xVRlabDAlE5TmZWaDAAkXdsl7HTlwKQEmRYErjgZ
	9LiUJQ7N6MSssjNOPLLn13Py8OIIAT3tpZozzoqiCqU6gOvTI5/MFvNKr+TcUomC
	UQ8nEWooVrknm9A6XWELtfqi2P+u4S48oGw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44fk500j80-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 15:56:22 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2164fad3792so122735325ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 07:56:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738166181; x=1738770981;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DxY0icfYFDPYpLy0SN45Y3l8ipVx2gW7otJCvY2psTE=;
        b=czMzQaHygU7Q6abrKnXwxoP3p5W02ZFwJfN0sNEoLWUcGrxFZ0KhZ3A4+FcIh+MTQ+
         4A/0OF60zJgELaA/Dhe7jUK0CpK2We4wZXquPjxP8A8V9fbVtVQyidn7yC+bco3/DWgG
         N6i5kPsN5mcIwu+OOvsrwPhzU3XtYVVI79l4xUohsBjXO1+n6nOTKr9k5IXYQ17bX5jv
         qGMyfl3Kce2mc9VqGe4b2Ospw+oHtU0BXdQNkkGog3mKQgq1+QY9Qrx53UAtAFT4YPLs
         zu/TdbqtKVaeWkOCKTSLzIi1iEe3B7xkIhXPGbvgJwgms/BWFmSr07clTEcnjPfM6siH
         8v+Q==
X-Gm-Message-State: AOJu0YwBjGb+Sl17/ewTmh87UuPj5ausxStCA0jdeVDPRodeMtUPJfAr
	X6zHGoEXkYWlkZL+MiEXhLTNKV/QA+VTKn0ozRPBl+YMfErQuLR+rOp/8nojbRXsECENzwV32sA
	bcELrEruJ9gdl3pMpgjIDstA83Z6s4ntqTjUHiVvtvsasw/a/GhdgXAAHUmE21c8D
X-Gm-Gg: ASbGncsGYtHoOJ4mBQja4SzDuM0Hnq+l5Y82mNrc/ba3jK5GoyTHc6oVZtEDdN0pY93
	zjE52C9OvhzlYuVzDq3F2qNgEavkaCtLZ0i3Sb2CrYwqE2Hg47xbKkQ3VdTkQ5QiTf93BE4am2e
	zNQjJ7IZo24r0AJEb/yxbfJbeFPSjBVRvWFDOtaFNHVwpB+GCcjsB1E6xupqlmK5VKdCXxC88L4
	QCTbZSryTFFCRUlv1Syb8fnOiapV73zkyaKM6wCV3kO81pJd2Bl/lGp5NTOUEYq1aJYI4yK0N1A
	ezff0OcliIBhdJ/nc6bsaAVJIxiC1IuO
X-Received: by 2002:a17:903:244b:b0:212:67a5:ab2d with SMTP id d9443c01a7336-21dd7df2d21mr59553625ad.44.1738166181298;
        Wed, 29 Jan 2025 07:56:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF2B4B+YcV7qGpZDw1PDGvvKfkjXAwRuH8rb5D436/nFHKW3TBRf6iKCQFl+v3k5Lh4v3r6VA==
X-Received: by 2002:a17:903:244b:b0:212:67a5:ab2d with SMTP id d9443c01a7336-21dd7df2d21mr59553325ad.44.1738166180910;
        Wed, 29 Jan 2025 07:56:20 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da414edb3sm100898975ad.202.2025.01.29.07.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 07:56:20 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, stable@vger.kernel.org,
        Saranya R <quic_sarar@quicinc.com>
Subject: [PATCH v2] soc: qcom: pdr: Fix the potential deadlock
Date: Wed, 29 Jan 2025 21:25:44 +0530
Message-Id: <20250129155544.1864854-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: NcE_PPUE37unZhIWwWBwLrvI2RQRT8jL
X-Proofpoint-ORIG-GUID: NcE_PPUE37unZhIWwWBwLrvI2RQRT8jL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-29_03,2025-01-29_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501290128

When some client process A call pdr_add_lookup() to add the look up for
the service and does schedule locator work, later a process B got a new
server packet indicating locator is up and call pdr_locator_new_server()
which eventually sets pdr->locator_init_complete to true which process A
sees and takes list lock and queries domain list but it will timeout due
to deadlock as the response will queued to the same qmi->wq and it is
ordered workqueue and process B is not able to complete new server
request work due to deadlock on list lock.

       Process A                        Process B

                                     process_scheduled_works()
pdr_add_lookup()                      qmi_data_ready_work()
 process_scheduled_works()             pdr_locator_new_server()
                                         pdr->locator_init_complete=true;
   pdr_locator_work()
    mutex_lock(&pdr->list_lock);

     pdr_locate_service()                  mutex_lock(&pdr->list_lock);

      pdr_get_domain_list()
       pr_err("PDR: %s get domain list
               txn wait failed: %d\n",
               req->service_name,
               ret);

Fix it by removing the unnecessary list iteration as the list iteration
is already being done inside locator work, so avoid it here and just
call schedule_work() here.

Fixes: fbe639b44a82 ("soc: qcom: Introduce Protection Domain Restart helpers")
CC: stable@vger.kernel.org
Signed-off-by: Saranya R <quic_sarar@quicinc.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Changes in v2:
 - Added Fixes tag,

 drivers/soc/qcom/pdr_interface.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/soc/qcom/pdr_interface.c b/drivers/soc/qcom/pdr_interface.c
index 328b6153b2be..71be378d2e43 100644
--- a/drivers/soc/qcom/pdr_interface.c
+++ b/drivers/soc/qcom/pdr_interface.c
@@ -75,7 +75,6 @@ static int pdr_locator_new_server(struct qmi_handle *qmi,
 {
 	struct pdr_handle *pdr = container_of(qmi, struct pdr_handle,
 					      locator_hdl);
-	struct pdr_service *pds;
 
 	mutex_lock(&pdr->lock);
 	/* Create a local client port for QMI communication */
@@ -87,12 +86,7 @@ static int pdr_locator_new_server(struct qmi_handle *qmi,
 	mutex_unlock(&pdr->lock);
 
 	/* Service pending lookup requests */
-	mutex_lock(&pdr->list_lock);
-	list_for_each_entry(pds, &pdr->lookups, node) {
-		if (pds->need_locator_lookup)
-			schedule_work(&pdr->locator_work);
-	}
-	mutex_unlock(&pdr->list_lock);
+	schedule_work(&pdr->locator_work);
 
 	return 0;
 }
-- 
2.34.1


