Return-Path: <linux-arm-msm+bounces-50788-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2FBA58EA1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 09:54:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 895003A48B1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 08:54:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53AB9223302;
	Mon, 10 Mar 2025 08:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VSLQUb2Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614FD380;
	Mon, 10 Mar 2025 08:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741596886; cv=none; b=J0ojaVk3muoYnS1xAJ/CvTASDN68fys8bkpclK78YILT3LhvVganzbnhIof0XqJ18rwVG3aS5OTBAm6/eDqN60q05a/1QIfrXhakVbYVHCLHPgo7jpPBL2rfKqFnU/N7J5DAYnM4dkoTdGuDAMBkbRwf5APo2+0icNMAft3Ts9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741596886; c=relaxed/simple;
	bh=79MIzmJSgb0AEYlsUc0kmUThbSkSIYSRseZNAmMcOtE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=q5lagk1EmsBhMVHJ0qQ3jSLzGnoLn8x74M3Ey639Im5cd3xVKSEBY6/nXReXm0cwgpgs6r2ydZ3zl5QCwd4n9TRDf5FiqJ3qaqU9NhXS4+cmaQQa0GZXyepw7CoBDZk1+WHny1FjZt+XcxBSgCJT1+gqaPfIC1bEpjBcGhm3NbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VSLQUb2Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 529NI9dY028287;
	Mon, 10 Mar 2025 08:54:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=h+dLEhJ2HnsiI/7pbyyqsuhYD2EbS9UfMhuK8jIsEqA=; b=VS
	LQUb2ZuFycoEMP6Z6K/ndFByYlwSkTlnbcZGqYJeWDM/+vqTGw4s3AmrD4lVZ6oY
	0oU5XbyulwWoBS50DLpRZUCO/QpZr2R2ysXbWF62ZNlPeEQhc0So1TWFgxHjTKu4
	VgbfH5v0KeqGwqHgdui8bd0kbLnrMzvFLuD/CyZF5uZjkqRYHVaiEHnOtK7X8Sct
	QAECKR6eKJLww/ixLI0zbl731F9qSRMyb0S359o+wLhsgDtLSNkHdBIsTrOtMpEF
	YSPX8g39oK2IhEBeJzWH2QsWizoM4968YprmZJj1DccmxqXha1l7Hr5k7Ky8pVxI
	mfgJzs4doWoXty+MPRQA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458ewk46gy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Mar 2025 08:54:36 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52A8sZYH013853
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Mar 2025 08:54:35 GMT
Received: from hu-anane-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 10 Mar 2025 01:54:32 -0700
From: Anandu Krishnan E <quic_anane@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
        <quic_ekangupt@quicinc.com>, <linux-kernel@vger.kernel.org>,
        <quic_chennak@quicinc.com>, <dri-devel@lists.freedesktop.org>,
        <arnd@arndb.de>
Subject: [PATCH v3] misc: fastrpc: Add meaningful labels for exit paths
Date: Mon, 10 Mar 2025 14:24:17 +0530
Message-ID: <20250310085417.25559-1-quic_anane@quicinc.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Tr8chCXh c=1 sm=1 tr=0 ts=67cea8cc cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=i2-9LFCxhnPdUyQ0F-UA:9
 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: kgi2LM1fQr1hJpiRCwqlv8ONm9Paf955
X-Proofpoint-ORIG-GUID: kgi2LM1fQr1hJpiRCwqlv8ONm9Paf955
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-10_03,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 mlxlogscore=999 spamscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1011 phishscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503100069

In the fastrpc_rpmsg_probe function, the exit path labels are not
intuitive and do not clearly indicate the purpose of the goto
statements. Rename goto labels to make it more intuitive and to
align with labels of other functions.

Signed-off-by: Anandu Krishnan E <quic_anane@quicinc.com>
---
Changes in v3:
 - moved out from patch series to stand-alone patch.
 - Link to v2: https://lore.kernel.org/all/20241223100101.29844-1-quic_anane@quicinc.com/

Changes in v2:
 - Added Fixes: tag and cc:stable.
 - Fixed author name.
 - Link to v1: https://lore.kernel.org/all/20241220061854.24428-1-quic_anane@quicinc.com/

 drivers/misc/fastrpc.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 7b7a22c91fe4..378923594f02 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -2313,7 +2313,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 		rmem = of_reserved_mem_lookup(rmem_node);
 		if (!rmem) {
 			err = -EINVAL;
-			goto fdev_error;
+			goto err_free_data;
 		}
 
 		src_perms = BIT(QCOM_SCM_VMID_HLOS);
@@ -2334,7 +2334,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 		data->unsigned_support = false;
 		err = fastrpc_device_register(rdev, data, secure_dsp, domains[domain_id]);
 		if (err)
-			goto fdev_error;
+			goto err_free_data;
 		break;
 	case CDSP_DOMAIN_ID:
 	case CDSP1_DOMAIN_ID:
@@ -2342,15 +2342,15 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 		/* Create both device nodes so that we can allow both Signed and Unsigned PD */
 		err = fastrpc_device_register(rdev, data, true, domains[domain_id]);
 		if (err)
-			goto fdev_error;
+			goto err_free_data;
 
 		err = fastrpc_device_register(rdev, data, false, domains[domain_id]);
 		if (err)
-			goto populate_error;
+			goto err_deregister_fdev;
 		break;
 	default:
 		err = -EINVAL;
-		goto fdev_error;
+		goto err_free_data;
 	}
 
 	kref_init(&data->refcount);
@@ -2367,17 +2367,17 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 
 	err = of_platform_populate(rdev->of_node, NULL, NULL, rdev);
 	if (err)
-		goto populate_error;
+		goto err_deregister_fdev;
 
 	return 0;
 
-populate_error:
+err_deregister_fdev:
 	if (data->fdevice)
 		misc_deregister(&data->fdevice->miscdev);
 	if (data->secure_fdevice)
 		misc_deregister(&data->secure_fdevice->miscdev);
 
-fdev_error:
+err_free_data:
 	kfree(data);
 	return err;
 }
-- 
2.17.1


