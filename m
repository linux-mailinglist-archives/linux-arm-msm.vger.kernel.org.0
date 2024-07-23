Return-Path: <linux-arm-msm+bounces-26850-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86658939C62
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 10:16:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36B3D2821BE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 08:16:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B277D14A4D4;
	Tue, 23 Jul 2024 08:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZwzkfePv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5D08814;
	Tue, 23 Jul 2024 08:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721722587; cv=none; b=QmDlX+SnvmqZlFhf62PNR4pBUUaINolyB4mMYCllzTDxWQXau11HD8qoEld7h/hStLC+CzxT0r9iv8L/ydGbFb4/RqEaCaDkYrbgQrEz9K6KRu+3pL1Ad2kUGFS09tks1fyZgKhU3aIs/Vz6euuDz5JByrsKnkVCSmIk9LOF2Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721722587; c=relaxed/simple;
	bh=SK0+bzsZh3ZCbkerLryatWAG6auL1UKYvQrLzqcZTO8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=B0nkl0DPXC9f1cS8fhEYrCjRPC89AyjuuTUaHc7sHDkEnt53ko7fDG8Q4h+3cHPBFuDVk6lzyauBLLFkIcvoyUYn60dGXGas0wgwcw/uihCMIncGRqqLRvLnjupBE7CAH0UI1rhUlNJrP6+1fld5KE3eQjPFjaUDy/kl+NMx7R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZwzkfePv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46MN4POa029235;
	Tue, 23 Jul 2024 08:16:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4ieOMxIde3rpYFXESOUVkk
	kSP2X9YlmVf4Y7Ad7TYsM=; b=ZwzkfePvBGxewYkhD7GWiVbKdI4dpywzEgYlJ9
	EJrqTT1Wy66H7l74daeyZpNVmXXI5sA8qfKKuGlZ2e9qcbEY5dwXQHqtZsIcrCkc
	GxVnYxBuCFpkoP/U8INhIZMddwmWa74FTDIFDq/hMzyNEkVbxdQAVWErnvMyzvX/
	NaAMT9bpnsfaaOkRDcf/bs60qhkr4g268SOFjJCvmXUlhvuEhdvBwxIJcxyllSeb
	RdlHHiQGYRnOu4pXgvt16UdoUMMghiXUpHetnmEDb+YjZFUlW5PgxCNk/p9gSja/
	06ls/Dm32/NRDVuvI33FITuAhzm9MTLF8YS1ELtWYMVIQ5XQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40g487e2e1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Jul 2024 08:16:21 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46N8GKvQ025960
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Jul 2024 08:16:20 GMT
Received: from hu-rjendra-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 23 Jul 2024 01:16:17 -0700
From: Rajendra Nayak <quic_rjendra@quicinc.com>
To: <andersson@kernel.org>, <konrad.dybcio@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Rajendra
 Nayak" <quic_rjendra@quicinc.com>
Subject: [PATCH] soc: qcom: llcc: Update configuration data for x1e80100
Date: Tue, 23 Jul 2024 13:45:42 +0530
Message-ID: <20240723081542.1522249-1-quic_rjendra@quicinc.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-ORIG-GUID: rz4dNsIHohbJa4PgsCXCBxzmbs8ia2QU
X-Proofpoint-GUID: rz4dNsIHohbJa4PgsCXCBxzmbs8ia2QU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-22_18,2024-07-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 mlxlogscore=999
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2407230060

Update the configuration table for x1e80100 with the latest recommendations
from the SCT table.

Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
---
 drivers/soc/qcom/llcc-qcom.c | 32 +++++++++++++++-----------------
 1 file changed, 15 insertions(+), 17 deletions(-)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index 37e11e501728..8fa4ffd3a9b5 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -453,26 +453,24 @@ static const struct llcc_slice_config qdu1000_data_8ch[] = {
 };
 
 static const struct llcc_slice_config x1e80100_data[] = {
-	{LLCC_CPUSS,	 1, 6144, 1, 1, 0xFFF, 0x0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0},
-	{LLCC_VIDSC0,	 2,  512, 3, 1, 0xFFF, 0x0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
-	{LLCC_AUDIO,	 6, 3072, 1, 1, 0xFFF, 0x0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
+	{LLCC_CPUSS,	 1, 6144, 1, 1, 0xFFF, 0x0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
+	{LLCC_VIDSC0,	 2,  512, 4, 1, 0xFFF, 0x0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
+	{LLCC_AUDIO,	 6, 1024, 1, 1, 0xFFF, 0x0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
 	{LLCC_CMPT,     10, 6144, 1, 1, 0xFFF, 0x0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
-	{LLCC_GPUHTW,   11, 1024, 1, 1, 0xFFF, 0x0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
-	{LLCC_GPU,       9, 4096, 1, 1, 0xFFF, 0x0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0},
-	{LLCC_MMUHWT,   18,  512, 1, 1, 0xFFF, 0x0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
+	{LLCC_GPUHTW,   11,  512, 1, 1, 0xFFF, 0x0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
+	{LLCC_GPU,       9, 4608, 1, 0, 0xFFF, 0x0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0},
+	{LLCC_MMUHWT,   18,  512, 1, 1, 0xFFF, 0x0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
 	{LLCC_AUDHW,    22, 1024, 1, 1, 0xFFF, 0x0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
-	{LLCC_CVP,       8,  512, 3, 1, 0xFFF, 0x0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
-	{LLCC_WRCACHE,  31,  512, 1, 1, 0xFFF, 0x0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
-	{LLCC_CAMEXP1,   7, 3072, 2, 1, 0xFFF, 0x0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
-	{LLCC_LCPDARE,  30,  512, 3, 1, 0xFFF, 0x0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
+	{LLCC_CVP,       8,  512, 4, 1, 0xFFF, 0x0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
+	{LLCC_WRCACHE,  31, 1024, 1, 1, 0xFFF, 0x0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
+	{LLCC_CAMEXP0,   4,  256, 4, 1,   0x3, 0x0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
+	{LLCC_CAMEXP1,   7, 3072, 3, 1, 0xFFC, 0x0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
+	{LLCC_LCPDARE,  30,  512, 3, 1, 0xFFF, 0x0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0},
 	{LLCC_AENPU,     3, 3072, 1, 1, 0xFFF, 0x0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
-	{LLCC_ISLAND1,  12,  512, 7, 1,   0x1, 0x0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
-	{LLCC_ISLAND2,  13,  512, 7, 1,   0x2, 0x0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
-	{LLCC_ISLAND3,  14,  512, 7, 1,   0x3, 0x0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
-	{LLCC_ISLAND4,  15,  512, 7, 1,   0x4, 0x0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
-	{LLCC_CAMEXP2,  19, 3072, 3, 1, 0xFFF, 0x0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
-	{LLCC_CAMEXP3,  20, 3072, 3, 1, 0xFFF, 0x0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
-	{LLCC_CAMEXP4,  21, 3072, 3, 1, 0xFFF, 0x0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
+	{LLCC_ISLAND1,  12, 2048, 7, 1,   0x0, 0xF, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
+	{LLCC_CAMEXP2,  19, 3072, 3, 1, 0xFFC, 0x0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
+	{LLCC_CAMEXP3,  20, 3072, 2, 1, 0xFFC, 0x0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
+	{LLCC_CAMEXP4,  21, 3072, 2, 1, 0xFFC, 0x0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
 };
 
 static const struct llcc_edac_reg_offset llcc_v1_edac_reg_offset = {
-- 
2.34.1


