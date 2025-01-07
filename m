Return-Path: <linux-arm-msm+bounces-44102-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A54E9A03C17
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 11:18:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 72CC1166107
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 10:18:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A78561E9B38;
	Tue,  7 Jan 2025 10:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QJIb4EPB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0491E9B24;
	Tue,  7 Jan 2025 10:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736245056; cv=none; b=dGbyZ7RftbvvZDjeMHCjwwvwMg9RlPwkXfwywBYb+/KoQTt/axQnY+AkafaesLTqG6OOHYk/Xb21K/MuPhe2xTKOfKA+tz6G9uS/gyjKQy0IbAuDMn3Jv0c2CQpDj0UnI9cdgetKVqy7ZT/D0rEJIz4SjqqvR94LJ4hMnjN9aVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736245056; c=relaxed/simple;
	bh=jnExkCaZDf5twmwh8xVktfg1zglJuetR+DK0Wk7OYkI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UkV0LVhoNr8SpEsTplCc34GXjf8xVVi4gXL9X0ox47KqOD1l8lN6RlLzYC8OuuHotakDI7eb8zuFTlOdQxm3bM8mPwTbonxSnjC+BDpIn2UHeOe1h4+StUrgbwHltuZ6o5ZhUchvmnTfJjNaXZba3utmPpGGL0+mc9DGSHhHjDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QJIb4EPB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5073xbLQ008686;
	Tue, 7 Jan 2025 10:17:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QyfLd8YV/IyhgYW4K4o7/3bfFo3ppCVogxjBa/JrsTk=; b=QJIb4EPB+f6WU530
	nmNqdSE5zohOrNqnRUXD5LJyzQeA3X5dki2V5cXJgcudH+OadK4LxONPlYHuf+Zy
	Hqeyqw388ciyGbGCYodk/mSV2tSetbsJ13PAGuL1czw7Xb6m7E6MO36AiLwMfu30
	0Ft51QfcHO/c24Wvwn3wDAMv7a3csSAUoVYbRP/9YJ+ePdPMjrZFymVXxbVD+2n/
	UFp/fq4l4ElOk1OowRaRg3bICgs4yZfWj+YqOLGhz+Ti74TyzT+Bv5qn1dVy4eEo
	+2hBvlMF8S6fNbN1ijnWN6Jjd3ga+cuvmq4f8c2YwvUl/GCtIm80tldUmhxgw79h
	dAr/2A==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 440vuq8tj2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jan 2025 10:17:27 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 507AHQcD027143
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 7 Jan 2025 10:17:26 GMT
Received: from hu-gokulsri-blr.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 7 Jan 2025 02:17:21 -0800
From: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
To: <jassisinghbrar@gmail.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <mathieu.poirier@linaro.org>, <konradybcio@kernel.org>,
        <quic_mmanikan@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <dmitry.baryshkov@linaro.org>
CC: <quic_gokulsri@quicinc.com>, <quic_viswanat@quicinc.com>,
        <quic_srichara@quicinc.com>
Subject: [PATCH V3 3/8] dt-bindings: mailbox: qcom: Add IPQ5424 APCS compatible
Date: Tue, 7 Jan 2025 15:46:42 +0530
Message-ID: <20250107101647.2087358-4-quic_gokulsri@quicinc.com>
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
X-Proofpoint-ORIG-GUID: yLbwh5V6F1o0cQCC2mj5X-Uk17UkCSEV
X-Proofpoint-GUID: yLbwh5V6F1o0cQCC2mj5X-Uk17UkCSEV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 clxscore=1015 malwarescore=0
 phishscore=0 suspectscore=0 adultscore=0 spamscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501070085

Add compatible for the Qualcomm IPQ5424 APCS block.

Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
---
 .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
index 9d2dfd85b207..9b2438726303 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
@@ -20,6 +20,7 @@ properties:
           - enum:
               - qcom,ipq5018-apcs-apps-global
               - qcom,ipq5332-apcs-apps-global
+              - qcom,ipq5424-apcs-apps-global
               - qcom,ipq8074-apcs-apps-global
               - qcom,ipq9574-apcs-apps-global
           - const: qcom,ipq6018-apcs-apps-global
-- 
2.34.1


