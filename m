Return-Path: <linux-arm-msm+bounces-40270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83ABE9E3CEB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 15:37:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D6C85B37AA0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 14:14:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F10821FC100;
	Wed,  4 Dec 2024 14:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pV9sanAf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7015F1F9AAC;
	Wed,  4 Dec 2024 14:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733321682; cv=none; b=fMSI3DX7MN9iCz+Hg9JmD5gxTpEVMlWrqV2/Uftzv0Vw2Q0dX0Q8HCMQ0AXM9M30E4d2YD5KiMh96AuZo6dlWAQD8ZQ933wMXoTpcUYzj9/m+rSBWR3fBlZX6TRO6mQJaUX1gGuOEGb3G7n/1Wl/iOSDqnoYCLvHcaVIMF/0rD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733321682; c=relaxed/simple;
	bh=CtEfPJasm6oaHjUl72B7C681vXxuaHrypNYwSR6IcUk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GAAI4+w6GGgXLjwFc9cV15pCI/Zg19awf8b51hzDXmAjbtlJUof229cB/vSemBX/zXhKTbi0oD/FuTQGb3di2Vlqami14L/tKn0/q8Pzfj4p9I8hsJVyv1PtXcXymydxtDAmAtUb5cE3L6/5Uel2VUnDrQQFAfwneaYH9DNuR4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pV9sanAf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B44NtU9001285;
	Wed, 4 Dec 2024 14:14:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ymbfYI4089i3T4Xni5IgXHWzEn1EH0stftruZjAadng=; b=pV9sanAfASAyqhwf
	bAPtmTQyAfEM8rAiVLZ/VvgpXui9mcQq7uUZHXnNjti16EzgC2GvDM7fTZtTv3Bv
	3oEeCyogXkyTgQxDx7rmmRebVMukqUprpHn2SIx0EuWqNldckgJSQdp/r/ADAHv8
	pEJq6qPYXxrTpglrgUwc3XlTf76ZuSD/bJ98PXpr2ZiDUVZbvMQ7/7mEpHek0tEA
	ihh8RT9GG7bFTMHfrS9tgjTCCoP/JNsZwn1QQIsHicJpJvQlgzmJAZM7f2wwPrfP
	kwHeqOsoqxny3knLyWtRI4rsuSz7FbeQLvNRhIDffJ7F2wQJXPRqoBLAEeLBzoEL
	unp2pA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 439trbmvvr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Dec 2024 14:14:38 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B4EEbYK031469
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Dec 2024 14:14:37 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 4 Dec 2024 06:14:34 -0800
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
Subject: [PATCH 1/2] dt-bindings: mfd: qcom,tcsr: Add compatible for ipq5424
Date: Wed, 4 Dec 2024 19:44:15 +0530
Message-ID: <20241204141416.1352545-2-quic_mmanikan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241204141416.1352545-1-quic_mmanikan@quicinc.com>
References: <20241204141416.1352545-1-quic_mmanikan@quicinc.com>
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
X-Proofpoint-GUID: Rr1iJB8zbh6GzSg-a0HMVCiPjKQ9QOtK
X-Proofpoint-ORIG-GUID: Rr1iJB8zbh6GzSg-a0HMVCiPjKQ9QOtK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=872 mlxscore=0
 suspectscore=0 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412040108

Document the qcom,tcsr-ipq5424 compatible.

Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
---
 Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
index 79add913e35c..a503b67f2dbe 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
@@ -42,6 +42,7 @@ properties:
           - qcom,tcsr-apq8064
           - qcom,tcsr-apq8084
           - qcom,tcsr-ipq5332
+          - qcom,tcsr-ipq5424
           - qcom,tcsr-ipq6018
           - qcom,tcsr-ipq8064
           - qcom,tcsr-ipq8074
-- 
2.34.1


