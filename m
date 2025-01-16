Return-Path: <linux-arm-msm+bounces-45236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D15DFA13653
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 10:13:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D2F8D1888BAA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 09:13:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DCCF1DC99A;
	Thu, 16 Jan 2025 09:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ftfqosbS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB6F1D935C;
	Thu, 16 Jan 2025 09:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737018801; cv=none; b=WFWLNRDKzMxOf/B57HENxIrgWwTB5tZpdISElwtHoGWEsV0iwsWveUbnjh3PMopnSd/ifk4Q7t5oABecczSSWSvmrLhxVfP9GlThDM7qcu+pq1HUjiIJ8zCBx1mqUZG/mxCcmg+haCYGG6lclhwCzlryq9JDgx8ZDrFwCL9YQjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737018801; c=relaxed/simple;
	bh=Pma782VnT/e6AHKzyF3xXZt0OciXKpVFXujxaLhpO38=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=M0oDuacLPdmMhcoVVnhiDPTto4uprz75y8BA/fSYsIdQ7nTjThhRg8tGDuaaacTNFs79vCfQL4JvJoNUn20I3LjWaYOBWAOef1Ok8gDgU20ut4VYKXcBaPVg+KmrQ/pvhdL1FSiuyy9TvDzKRBLZuZrD5IfSwQ30gOy3Rnf32OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ftfqosbS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50G62dHm015712;
	Thu, 16 Jan 2025 09:12:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mtgWdUIF2py
	7UlYzjaOQ8C6PQvF5qtkjKa2D7BhlvxM=; b=ftfqosbSa1kyzv+jRmglzQCoNjU
	MIVAiyANsPFrRnDniuAQNXmG+W2a8pjF+Ina3cGjnfIj9xioPckUsPp0nEDfdaOI
	QyViW6udMf+mR1GBb3qQzEreSbap8zyF9B7DDqQy2WfG7fkKDdf+eeFRAgV6/Zr7
	RIIAylg/F8CdKAAfVImNhm4WNOGOgHlFo5EmbiQlw3amMaN9fl7kpxRxEHx/EHFo
	kkso2+jw7chY3eJ6Rzn2zJNS8bG6NBHzWzjgu2Z2fN0F3+5eWKQbcYdqmDEwmUCp
	rLsOOrAmKWbdkyfHAqp0h3PodbEL654gM9gVfGunuga+M/Iujo7+kllK73Q==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 446vge8f50-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jan 2025 09:12:56 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 50G9Cs7k022789;
	Thu, 16 Jan 2025 09:12:54 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 44426qw50j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jan 2025 09:12:54 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 50G9Cr16022751;
	Thu, 16 Jan 2025 09:12:54 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 50G9CrO0022718
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jan 2025 09:12:53 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 393357)
	id A354740BF9; Thu, 16 Jan 2025 17:12:52 +0800 (CST)
From: Ziqi Chen <quic_ziqichen@quicinc.com>
To: quic_cang@quicinc.com, bvanassche@acm.org, mani@kernel.org,
        beanhuo@micron.com, avri.altman@wdc.com, junwoo80.lee@samsung.com,
        martin.petersen@oracle.com, quic_ziqichen@quicinc.com,
        quic_nguyenb@quicinc.com, quic_nitirawa@quicinc.com,
        quic_rampraka@quicinc.com
Cc: linux-scsi@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM MAILING LIST),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 4/8] scsi: ufs: qcom: Implement the freq_to_gear_speed() vops
Date: Thu, 16 Jan 2025 17:11:45 +0800
Message-Id: <20250116091150.1167739-5-quic_ziqichen@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250116091150.1167739-1-quic_ziqichen@quicinc.com>
References: <20250116091150.1167739-1-quic_ziqichen@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 11WmJpi_t_ZCoCtBCnbv1f0-kr94L64k
X-Proofpoint-GUID: 11WmJpi_t_ZCoCtBCnbv1f0-kr94L64k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-16_03,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 impostorscore=0 suspectscore=0
 clxscore=1015 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501160067

From: Can Guo <quic_cang@quicinc.com>

Implement the freq_to_gear_speed() vops to map the unipro core clock
frequency to the corresponding maximum supported gear speed.

Co-developed-by: Ziqi Chen <quic_ziqichen@quicinc.com>
Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
Signed-off-by: Can Guo <quic_cang@quicinc.com>
---
 drivers/ufs/host/ufs-qcom.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 1e8a23eb8c13..64263fa884f5 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -1803,6 +1803,37 @@ static int ufs_qcom_config_esi(struct ufs_hba *hba)
 	return ret;
 }
 
+static int ufs_qcom_freq_to_gear_speed(struct ufs_hba *hba, unsigned long freq, u32 *gear)
+{
+	int ret = 0;
+
+	switch (freq) {
+	case 403000000:
+		*gear = UFS_HS_G5;
+		break;
+	case 300000000:
+		*gear = UFS_HS_G4;
+		break;
+	case 201500000:
+		*gear = UFS_HS_G3;
+		break;
+	case 150000000:
+	case 100000000:
+		*gear = UFS_HS_G2;
+		break;
+	case 75000000:
+	case 37500000:
+		*gear = UFS_HS_G1;
+		break;
+	default:
+		ret = -EINVAL;
+		dev_err(hba->dev, "Unsupported clock freq\n");
+		break;
+	}
+
+	return ret;
+}
+
 /*
  * struct ufs_hba_qcom_vops - UFS QCOM specific variant operations
  *
@@ -1833,6 +1864,7 @@ static const struct ufs_hba_variant_ops ufs_hba_qcom_vops = {
 	.op_runtime_config	= ufs_qcom_op_runtime_config,
 	.get_outstanding_cqs	= ufs_qcom_get_outstanding_cqs,
 	.config_esi		= ufs_qcom_config_esi,
+	.freq_to_gear_speed	= ufs_qcom_freq_to_gear_speed,
 };
 
 /**
-- 
2.34.1


