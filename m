Return-Path: <linux-arm-msm+bounces-44104-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30548A03C1E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 11:18:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2598A1660CC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 10:18:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B725B1EBA1E;
	Tue,  7 Jan 2025 10:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jUuf8kMZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93BBF1E573B;
	Tue,  7 Jan 2025 10:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736245065; cv=none; b=rVcOvhYkOuxqhxBN2JqzZiyPH9jTGz8R4G69mOb4CgCHLI0kxxa7LAhY/JjZZVHyeVYtFwK8jeoFsoHHY/tgskfS8++RPYRlc/4AkCEqX5+YdjYxqHz6mmbzMYuQ4kah2zN0vIykk5iF8FQ6WsIl8oeY8VZQMeSIE5b3Zi4+o0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736245065; c=relaxed/simple;
	bh=hkHIL5Own1pCTR27Yq7+Hf9OobkLroXI1UDm9NUK4Hk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=alZ7pHEZXCvPIvDpc7mXGcPDABbY7hRWq07WPe6RGgRy4otJWt8vV4WSDRJ4o/DaYO/M7nQeS6jfQc7jgL+Nn7t6L6rf0a6gFuZO9O98R8FVOPpGh86NPW5TqI883hgYlYpvJ49KVs1O0ouNI6qXH7dca5msLD+PM38ikttyE70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jUuf8kMZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 507A8w6E023720;
	Tue, 7 Jan 2025 10:17:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mHYet4W5Ozykh/cgeRUVx9m91W8+16EcHWtkJcKKd8g=; b=jUuf8kMZ/QGzJLMo
	RbfDDHA0MyBG7IJyGFJ+oSaMl1y5aJ638dBdMta+QPK2fyC0fiKUFD8US9lIj1Sv
	gYtLqpKtpfMyOmui7/wTnUYof7pZemKqWKJ/0QjO6m9mtfsoZU4Tys9FnE+JyDsA
	5JOUcxlJL2JSbUVA6WMQX0WVvhEdEyklBUC7vXbo77o0SSHdRh+ax+/TwSJD1pvk
	p50H/PDIc933WQf4gM0dML0snIbS3tdwTcA/W/JKvnkWklBXi+Z5S7HhoC80VjzA
	+mJvYXqMGjPOHa3NpVJxVIW9SnxMYtZbsqSNu757cHuy5rRVDZ5jM1mb7WD1EZOO
	CEuiRg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44128nr0sb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jan 2025 10:17:36 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 507AHa5Y029131
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 7 Jan 2025 10:17:36 GMT
Received: from hu-gokulsri-blr.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 7 Jan 2025 02:17:31 -0800
From: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
To: <jassisinghbrar@gmail.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <mathieu.poirier@linaro.org>, <konradybcio@kernel.org>,
        <quic_mmanikan@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <dmitry.baryshkov@linaro.org>
CC: <quic_gokulsri@quicinc.com>, <quic_viswanat@quicinc.com>,
        <quic_srichara@quicinc.com>
Subject: [PATCH V3 5/8] mailbox: qcom: Add support for IPQ5424 APCS IPC
Date: Tue, 7 Jan 2025 15:46:44 +0530
Message-ID: <20250107101647.2087358-6-quic_gokulsri@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250107101647.2087358-1-quic_gokulsri@quicinc.com>
References: <20250107101647.2087358-1-quic_gokulsri@quicinc.com>
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
X-Proofpoint-GUID: jeHefE-2HRZorEYmIDc9SytFw_8WwpXE
X-Proofpoint-ORIG-GUID: jeHefE-2HRZorEYmIDc9SytFw_8WwpXE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 priorityscore=1501 bulkscore=0 clxscore=1011 suspectscore=0 mlxscore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501070085

IPQ5424 mailbox do not have clock support and reuses msm8994_apcs_data.

Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
---
 drivers/mailbox/qcom-apcs-ipc-mailbox.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
index f0d1fc0fb9ff..11c41e935a36 100644
--- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
+++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
@@ -157,6 +157,7 @@ static const struct of_device_id qcom_apcs_ipc_of_match[] = {
 	{ .compatible = "qcom,sm6125-apcs-hmss-global", .data = &msm8994_apcs_data },
 	{ .compatible = "qcom,sm6115-apcs-hmss-global", .data = &msm8994_apcs_data },
 	{ .compatible = "qcom,ipq5332-apcs-apps-global", .data = &ipq6018_apcs_data },
+	{ .compatible = "qcom,ipq5424-apcs-apps-global", .data = &msm8994_apcs_data },
 	{ .compatible = "qcom,ipq8074-apcs-apps-global", .data = &ipq6018_apcs_data },
 	{ .compatible = "qcom,sc7180-apss-shared", .data = &apps_shared_apcs_data },
 	{ .compatible = "qcom,sc8180x-apss-shared", .data = &apps_shared_apcs_data },
-- 
2.34.1


