Return-Path: <linux-arm-msm+bounces-23300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA2690F87E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 23:28:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4883B28136F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 21:28:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 179927E58C;
	Wed, 19 Jun 2024 21:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OwF5y7Xi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DAAA1DA23;
	Wed, 19 Jun 2024 21:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718832484; cv=none; b=pc3MzDFE8DvstfayrzGByseNhfpwOYwdWFpM+R7s8LRRSY0jJhVNZTInIYpKiWnDO/CIwiMNyY1wHseSitB+yFEGvL0U6qmum7hwn5KRqd4alW9pYteR8gKhzQFmPVFN5kaiVraT0CRaKUFaBUnspyTyeA39AY8v8uCCLwg+3WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718832484; c=relaxed/simple;
	bh=7OAssoj9OLVsWv23P9hH16pO7JYZdb1nf9ARyZvLu0A=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dX33k7HnG1b169yn8mIAWsFSQ+o8EaO/MvtDLGZPbCNbevyQbRluKzbbXqfGeoYEWbrqWy4dYewEUnHtBQl9jvCvDkg39Kytv4f1IZImyR2iqC3JRqr9X6knLgFnJaFhWH6pQ/+QfeE71JIVv+7PqIwbCa/w5lY+EUGsmufHQRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OwF5y7Xi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45J9I8GG001969;
	Wed, 19 Jun 2024 21:27:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=22KJS395DkYRHCIqw9H8NQ
	JIII2/9hyHBU/Ma3qGvk0=; b=OwF5y7Xib2g8dWKqzQre7H7VnJMBMSvIVh1+h7
	QzlHUMw94EoEdmISQOO2ervPvJvlbf0NplreLcrdU44mAbR+j4AOtE/KrqnMB9Oj
	NpJWCIk/nJiK7zYmq8JuIN4Azwb3YGLtxnqcRLsh8QvnIUM5850qhxaKnms+mQv/
	JRRgrr7HDqPEUS8nVWJAEQWm8yMIteXIqxwJN6seiUdAxtLT0M8/8MF6CFvn0e5R
	wguY8XhZ6zPecaljg75l6wnFI8s6nwqrizMnewABDTWxiYiTKCXUmZ6s+Pz+oqbI
	g9v13pflGcCo3dGstoZHqyDB1J2Hp4l7ZdMAxhqwBaI8BOZw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yujag2ran-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jun 2024 21:27:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45JLRrvE022656
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jun 2024 21:27:53 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 19 Jun 2024 14:27:53 -0700
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
        <dan.carpenter@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/msm/dpu: protect ctl ops calls with validity checks
Date: Wed, 19 Jun 2024 14:27:43 -0700
Message-ID: <20240619212743.3193985-1-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.44.0
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
X-Proofpoint-GUID: W92zjECzWAQiHOK8btOVWMm52mEXTpRJ
X-Proofpoint-ORIG-GUID: W92zjECzWAQiHOK8btOVWMm52mEXTpRJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-19_02,2024-06-19_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 clxscore=1011 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 malwarescore=0 phishscore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406190163

dpu_encoder_helper_phys_cleanup() calls the ctl ops without checking if
the ops are assigned causing discrepancy between its callers where the
checks are performed and the API itself which does not.

Two approaches can be taken: either drop the checks even in the caller
OR add the checks even in dpu_encoder_helper_phys_cleanup().

Adopt the latter approach as ctl ops are assigned revision based so may not
be always assigned.

Fixes: d7d0e73f7de3 ("drm/msm/dpu: introduce the dpu_encoder_phys_* for writeback")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/all/464fbd84-0d1c-43c3-a40b-31656ac06456@moroto.mountain/T/
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 708657598cce..7f7e6d4e974b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2180,9 +2180,12 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
 	if (ctl->ops.reset_intf_cfg)
 		ctl->ops.reset_intf_cfg(ctl, &intf_cfg);
 
-	ctl->ops.trigger_flush(ctl);
-	ctl->ops.trigger_start(ctl);
-	ctl->ops.clear_pending_flush(ctl);
+	if (ctl->ops.trigger_flush)
+		ctl->ops.trigger_flush(ctl);
+	if (ctl->ops.trigger_start)
+		ctl->ops.trigger_start(ctl);
+	if (ctl->ops.clear_pending_flush)
+		ctl->ops.clear_pending_flush(ctl);
 }
 
 void dpu_encoder_helper_phys_setup_cdm(struct dpu_encoder_phys *phys_enc,
-- 
2.44.0


