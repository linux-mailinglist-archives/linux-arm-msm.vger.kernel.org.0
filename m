Return-Path: <linux-arm-msm+bounces-3431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E7D804FE1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 11:11:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 93E801C20921
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 10:11:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DFBF4B5D5;
	Tue,  5 Dec 2023 10:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Ox6oPZcP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EFF1A0;
	Tue,  5 Dec 2023 02:11:09 -0800 (PST)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B58IkWh013552;
	Tue, 5 Dec 2023 10:11:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=EfkS/JL6bKoHbBxqqwxyJIBXn6daMPhSli0NXUGgwoI=;
 b=Ox6oPZcPn/BHjDErVVgiKw9o6MZu/fkZrvZPm2KUGJaib8n2KT+V2R75dJv1rlaIfSjp
 FZQ/VHd0NalikPQJLeu3mMir/6iNOaSUHV7+LsKIEZflDXjdlmCdc9ZOBKXRqoNFsVn2
 wGntgJ839faXBDrSVMSWWPW9LVo9dHEjSoMnJKRMUZVXy7vsVexgHQG7HXbmnq7AFqvn
 YGyj4pCPkYD2laa4Yft5Xt52LkCzSZfE0T9EkuXV2a0ye2u3qoSz8yX485ufwqMqES1i
 sKN5jE9V4+dAhjGPKm1FoycKhJft4fqTpNpyEZqOuzrTRVTWVn6hkNzBhkyA/u489lcQ Aw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3usfu7adju-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Dec 2023 10:11:03 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B5AB27J022613
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 5 Dec 2023 10:11:02 GMT
Received: from hu-namajain-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 5 Dec 2023 02:10:56 -0800
From: Naman Jain <quic_namajain@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
CC: Naman Jain <quic_namajain@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>
Subject: [PATCH] soc: qcom: socinfo: Add few DSPs to get their image details
Date: Tue, 5 Dec 2023 15:40:18 +0530
Message-ID: <20231205101018.6079-1-quic_namajain@quicinc.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Unc1YmbaTt3aY1EsIPf6wyxKnlf11YUd
X-Proofpoint-ORIG-GUID: Unc1YmbaTt3aY1EsIPf6wyxKnlf11YUd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-05_04,2023-12-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 adultscore=0 clxscore=1011 malwarescore=0 bulkscore=0 impostorscore=0
 mlxlogscore=561 priorityscore=1501 mlxscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312050083

Add support to get image details from SMEM for DSPs like
DSPS (Sensors DSP), CDSP (Compute DSP), GPDSP (General purpose DSP)
while also supporting this for more than one DSP of certain types.

Signed-off-by: Naman Jain <quic_namajain@quicinc.com>
---
 drivers/soc/qcom/socinfo.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 51e05bec5bfc..f7169050d33d 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -51,6 +51,11 @@
 #define SMEM_IMAGE_TABLE_ADSP_INDEX     12
 #define SMEM_IMAGE_TABLE_CNSS_INDEX     13
 #define SMEM_IMAGE_TABLE_VIDEO_INDEX    14
+#define SMEM_IMAGE_TABLE_DSPS_INDEX     15
+#define SMEM_IMAGE_TABLE_CDSP_INDEX     16
+#define SMEM_IMAGE_TABLE_CDSP1_INDEX    19
+#define SMEM_IMAGE_TABLE_GPDSP_INDEX    20
+#define SMEM_IMAGE_TABLE_GPDSP1_INDEX   21
 #define SMEM_IMAGE_VERSION_TABLE       469
 
 /*
@@ -65,6 +70,11 @@ static const char *const socinfo_image_names[] = {
 	[SMEM_IMAGE_TABLE_RPM_INDEX] = "rpm",
 	[SMEM_IMAGE_TABLE_TZ_INDEX] = "tz",
 	[SMEM_IMAGE_TABLE_VIDEO_INDEX] = "video",
+	[SMEM_IMAGE_TABLE_DSPS_INDEX] = "dsps",
+	[SMEM_IMAGE_TABLE_CDSP_INDEX] = "cdsp",
+	[SMEM_IMAGE_TABLE_CDSP1_INDEX] = "cdsp1",
+	[SMEM_IMAGE_TABLE_GPDSP_INDEX] = "gpdsp",
+	[SMEM_IMAGE_TABLE_GPDSP1_INDEX] = "gpdsp1",
 };
 
 static const char *const pmic_models[] = {
-- 
2.17.1


