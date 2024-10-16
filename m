Return-Path: <linux-arm-msm+bounces-34609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 308789A0DD4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 17:16:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A38EFB2686D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 15:16:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28E2820F5C6;
	Wed, 16 Oct 2024 15:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VbKfXqS8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC8120F5B8;
	Wed, 16 Oct 2024 15:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729091771; cv=none; b=mcdm9JxxGUS6kjgCQQEpk3uSNtcoI9jpH0hPeAwa4OFRsQZCPM8/sqrTLIkoTNLMIcCmdCuY8Bc78O5MelvXQCJ/BV1o8TAMwWVJhwFFFGsS8Rtwc/skCWn1F4VmvVPBegeANl5LGWzM8Z95zZKqFS+RZP0jCFr8mvPlRDAPwOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729091771; c=relaxed/simple;
	bh=A15bVy4QR6amY9Osz/avR9XQ6vB8WAWL1O2wHtJg2iY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q6h4GrZzyH+HR77BtBLqMPSZsAWm8BS9ComBItzGgJtYA1G5OUVUlk6Ca3HggnVdJXlHoPw9Cvj52c3LCaRTIZuyZnFqcqCmkU/OMa5H0nNAD9+BveE4JT+6rur68QE/OHms/OB6w+QyKF9rHo/CY93/yLjs2GlKZ+OiupzzJQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VbKfXqS8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49GAIG2U011615;
	Wed, 16 Oct 2024 15:16:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ht9UKBLAHr0uqCFzzBclWaNUCGsXtD0HFHVHMtY3xTU=; b=VbKfXqS8RK3kQJP1
	jX3hW7lVrkeJzavNNpsju9lhTQdTQSB3UFwbhefxb6zTXBcVqU18rCeP38vmTxrF
	/sUUWRnyrwOiNLY25LwX4As8T2xqZvqjC+As0UZsmcF3dTdZeavyj4G5A+7NEhZ5
	gXKYe9xGDB1/zcM0tj0oIo6mCCIN4MHIgGsbD1PJUpmeZmq8busj7c9enkA+seYm
	f7v0zdlkUPwHtLipqb5CkzEGT5fmg0MMzw0f6HSCGcdpmWMlpF3PJtFyDC9aoK3l
	MgygTPcz9kmp3rwzB4HTpI30UaGI+oWPZ+KtdhoPJkGo+BWlCLwF0eDuDi1HQhrj
	h7w/DQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42abm5h0pc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Oct 2024 15:16:06 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49GFG50j004577
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Oct 2024 15:16:05 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 16 Oct 2024 08:16:02 -0700
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
Subject: [PATCH 2/3] soc: qcom: socinfo: add IPQ5424/IPQ5404 SoC ID
Date: Wed, 16 Oct 2024 20:45:27 +0530
Message-ID: <20241016151528.2893599-3-quic_mmanikan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241016151528.2893599-1-quic_mmanikan@quicinc.com>
References: <20241016151528.2893599-1-quic_mmanikan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: KVTowbbs8C43Gvhq9SOdGGLBw_YSQHDB
X-Proofpoint-GUID: KVTowbbs8C43Gvhq9SOdGGLBw_YSQHDB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0
 mlxlogscore=794 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410160095

Add SoC ID for Qualcomm IPQ5424/IPQ5404.

Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
---
 drivers/soc/qcom/socinfo.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index ecfd3da9d5e8..c297aec752d5 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -443,6 +443,8 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(QCM8550) },
 	{ qcom_board_id(IPQ5300) },
 	{ qcom_board_id(IPQ5321) },
+	{ qcom_board_id(IPQ5424) },
+	{ qcom_board_id(IPQ5404) },
 	{ qcom_board_id(QCS8300) },
 	{ qcom_board_id(QCS8275) },
 };
-- 
2.34.1


