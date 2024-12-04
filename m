Return-Path: <linux-arm-msm+bounces-40260-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CECB29E3B62
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 14:37:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59EDD161244
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 13:37:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86ABD1F6663;
	Wed,  4 Dec 2024 13:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YOK9ddFe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8731EF08A;
	Wed,  4 Dec 2024 13:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733319416; cv=none; b=gKagHmlYvjCHsnt7exTxJUHvwYCRZ+1wUgux4kpGZDaT2Do6Fbtf90KbfNp2FtKQglBGmltWvSnl3xGzO5EJXUyLjkRWLif1LOMDqhNi3kxHXXGudwDOpjlFZUEo6gCHRG7XbWr3yYTtT2G4Rjjd9unDx3RlzvNh0N5/CqEjDSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733319416; c=relaxed/simple;
	bh=tA80keeZsHZqku278oH9+HLWf0lfogqZyFRjaDqpSxQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q3KHG0NMAZzp5/Q7s7pN3QYxwgLYjcIVAnLqooBWxAoLDLo3A5C7qYHqSGWNkkYX02EvkuXGpEhm4svH1QTMo4ge79c0+pGsSHOX14FWGojigk1TwHCT01OGFBTk5hjuhVkuhO2MJAYB18dGN9ot/Ij8HDLuUpy8zT501IkdWHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YOK9ddFe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B460ci3027821;
	Wed, 4 Dec 2024 13:36:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d6g0fGfUue+3svKt8FwxOdVjGInye60baDh4uMFjruY=; b=YOK9ddFeA0Wp8yPa
	RR5YMjnHNbtIlTYc3VxeAe0yeMpPjTrbI3sH3y2l78TZOC+YcJNTPj8sOpfBL8TY
	wcRdwbW+4DB6uHneso3+VEPONWqXr3GOMoreRmqgmKWWa4dUEohn4aNkioEUjaUY
	WecSWd4dNrijCXR4PVS9gYLsfQJyIflpC8Kpl/CT5Zawz5zMj0vi70CmkRf9bhbE
	oSDHZ6otDQyrt8EjolzmZEsYo8Ba56L8bAAJARkAPL5pKv7PjUwd+pxlGL9vuB5T
	CW6mlq3dSGlYHx3QK9zIFKymCHoCwVohkZEfmnh5ZQWyXIBoO/fQfmc6qay6VYo8
	WtgD6g==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 439vcemgru-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Dec 2024 13:36:51 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B4DaoVB022328
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Dec 2024 13:36:50 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 4 Dec 2024 05:36:46 -0800
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <robimarko@gmail.com>,
        <quic_gurus@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
Subject: [PATCH 1/2] dt-bindings: firmware: qcom,scm: Document ipq5424 SCM
Date: Wed, 4 Dec 2024 19:06:26 +0530
Message-ID: <20241204133627.1341760-2-quic_mmanikan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241204133627.1341760-1-quic_mmanikan@quicinc.com>
References: <20241204133627.1341760-1-quic_mmanikan@quicinc.com>
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
X-Proofpoint-GUID: u0m9MMcTNdtloI9eQoT9gab34QhHExkH
X-Proofpoint-ORIG-GUID: u0m9MMcTNdtloI9eQoT9gab34QhHExkH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 adultscore=0 suspectscore=0 spamscore=0
 impostorscore=0 phishscore=0 mlxscore=0 malwarescore=0 clxscore=1011
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412040104

Document the scm compatible for ipq5424 SoC.

Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 2ee030000007..7ed1782d6ccb 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -26,6 +26,7 @@ properties:
           - qcom,scm-ipq4019
           - qcom,scm-ipq5018
           - qcom,scm-ipq5332
+          - qcom,scm-ipq5424
           - qcom,scm-ipq6018
           - qcom,scm-ipq806x
           - qcom,scm-ipq8074
-- 
2.34.1


