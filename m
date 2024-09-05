Return-Path: <linux-arm-msm+bounces-31006-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F08ED96E185
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 20:06:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF0D9289154
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 18:06:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D7B1183CDB;
	Thu,  5 Sep 2024 18:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FCg1FySB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB65917B51A;
	Thu,  5 Sep 2024 18:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725559597; cv=none; b=dLQtRQe/UhTaoFdlsSIZhrXmH3ZNW+EyhQq7Jc+SUlnaZQxzHqLnFXhqMfZnOf4IYMwvckGsGXL5mWaCKpmdtP9Np3Opg+lIV11Yg2p076aClXsXNLrPIFAG2Eo/C4HLONsBGPcCuuILPROjSaTsL0OEx9l8wWVqn6ZmeS/8HAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725559597; c=relaxed/simple;
	bh=Igs2yFIp+pWCOiSSXSYk/H3lyu1/KWdiP9m372yePY8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MxYxXWClxHYUgC/DdjqmqN+bxRFSpq1Wf02Y1zvJhP9htytQ9MWIOZkaF8N5vvGWetVUmxEIkSlZItE4pEHoeAObnkdHhQvjK1PNBT0KpDyzBDzaDiMz6zloPDGGG0kuZhuuHXWXXxE3K03CkPQhcADQHiep4sZJpPEKMlDCR3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FCg1FySB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 485976KZ017534;
	Thu, 5 Sep 2024 18:06:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7u3jQr4BnWQUZGOpL/ca0WT3lCGtYvtNTRZCdcyAxAw=; b=FCg1FySBa6Fk5/ig
	jjplUTPogrOmvsJ20e7v04Z7agBZOwDL/CZE5x2J9C7hOo9j0d78tYntONAktpe7
	vJFsZBCLuSXMBTExK0+0pM8BpUrpYoFzHG06Zjm+O5yNlpBnMl6M2VHX8WMR2o0S
	b+/pUmsw5UX7rLUKfWSNHkBCUmwHXhx8wslZGb7yutkiE5bqSn6nVXvEiXQoOwYR
	SVOvblA9nN9bohYVAM7Ooh28ZKxfRw0nDt3ZDFcNZPkxWadQe7DcoVOPAj0eXfgY
	06pGwcY/ZfasL1+Dgq98+7EpSxBRKnO1ZzRDAnecuDdOhrl8yNC0o9Mc+68x6xeX
	sTIstg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41enbwmpvq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Sep 2024 18:06:31 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 485I6U25013125
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Sep 2024 18:06:30 GMT
Received: from hu-nkela-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 5 Sep 2024 11:06:26 -0700
From: Nikunj Kela <quic_nkela@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <kernel@quicinc.com>,
        <quic_psodagud@quicinc.com>, Nikunj Kela <quic_nkela@quicinc.com>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 1/2] dt-bindings: arm: qcom: add the SoC ID for SA8255P
Date: Thu, 5 Sep 2024 11:05:55 -0700
Message-ID: <20240905180556.3737896-2-quic_nkela@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240905180556.3737896-1-quic_nkela@quicinc.com>
References: <20240905180556.3737896-1-quic_nkela@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 5YcDPz2v7-Fz0wvN8cnWWKMJTc5i0Mw0
X-Proofpoint-GUID: 5YcDPz2v7-Fz0wvN8cnWWKMJTc5i0Mw0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-05_12,2024-09-05_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=794 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409050134

Add the SoC ID entry for SA8255P.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
---
 include/dt-bindings/arm/qcom,ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index 8332f8d82f96..16f00ecdcc09 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -257,6 +257,7 @@
 #define QCOM_ID_QRB2210			524
 #define QCOM_ID_SM8475			530
 #define QCOM_ID_SM8475P			531
+#define QCOM_ID_SA8255P			532
 #define QCOM_ID_SA8775P			534
 #define QCOM_ID_QRU1000			539
 #define QCOM_ID_SM8475_2		540
-- 
2.34.1


