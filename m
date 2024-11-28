Return-Path: <linux-arm-msm+bounces-39428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B571B9DB72C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 13:10:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB44B163EC3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 12:10:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B4D519AA56;
	Thu, 28 Nov 2024 12:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HnSrniC5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7167D19DF75;
	Thu, 28 Nov 2024 12:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732795793; cv=none; b=crUsIXhlibvu3wC6ivitlpNP9jtBXCXIYmhVZQD/4Yn1plhPpqLZMD9WOIwYULmfPneT5eBuSdte5yPCXZXx9uDItCKXLaaPMWvxSxh+xWjp1Sb77YrwG7TpRT1P1bp9ZatwUG0WJWvRKnnGoT7qapTELUF9tfQ5L6ca2b3317I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732795793; c=relaxed/simple;
	bh=AnExJ9k/5qyo7/AoLejfcf/2E/Zw3PtEFeecYvD90G0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QkVTA05K6X7Q5Gd33RgcZC52dIJWZ0hkTpRIlCeySDus9WK9++2FnqzBbQK64vNA/juPKD71vPtDgZPA3EjX/3FqEo+dYdW4BV9PlBB2PnkD6uz/9orqkWf0DGKTgJqYqIfloIlv7J7gI8t6/xOzkVnLIXDRSQVD0+JLBplAm8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HnSrniC5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AS8TXeo005742;
	Thu, 28 Nov 2024 12:09:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PkXhys7dLwx9B4towdrMekVfjN3mbP8VKj26qtO7uwg=; b=HnSrniC5+tPZwvKE
	WYj5GRGqjEl+BIGDWzAwv2NpfffpYR2O1F6xBkFr6SLsq65NlBQC2rWina0Eqnbw
	tt6xrFlWA9B4W2KFk691Cf4++URCH4oacHSlB4BgLt5eE91wsoFv2bsvFUqSwMTy
	FEmb8EP5HAAcOOou3CdkOwH6QoI9FxB0B5j4Q/9WId4ZIgjy+N3vWIEDtOnKquYn
	ghNn1ZOmiPvFpx9erSM6QCs/Xqp6aB+Y3KYfOuKOS75KNBKZ9Vw5ubEI+4TuQxxe
	B4wPq0hNNcYRg3JO6qDEs2r/FPWk30MrQUzslyoa5pM4JtZCsuPJgvOFx9X1yf+M
	zsa9kA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4366xvjjxe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Nov 2024 12:09:47 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ASC9kIe031800
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Nov 2024 12:09:46 GMT
Received: from bt-iot-sh01-lnx.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 28 Nov 2024 04:09:42 -0800
From: Cheng Jiang <quic_chejiang@quicinc.com>
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz
	<luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Balakrishna
 Godavarthi" <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>
CC: <linux-bluetooth@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_bt@quicinc.com>
Subject: [PATCH v1 2/3] dt-bindings: net: Add QCA6698 Bluetooth
Date: Thu, 28 Nov 2024 20:09:21 +0800
Message-ID: <20241128120922.3518582-3-quic_chejiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241128120922.3518582-1-quic_chejiang@quicinc.com>
References: <20241128120922.3518582-1-quic_chejiang@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: VcgytjpIBZ2kujpzW_q3YL02fLYsj7YT
X-Proofpoint-ORIG-GUID: VcgytjpIBZ2kujpzW_q3YL02fLYsj7YT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 mlxlogscore=978 clxscore=1015 adultscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 spamscore=0 impostorscore=0
 bulkscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2411280095

Add the compatible for the Bluetooth part of the Qualcomm QCA6698 chipset.

Signed-off-by: Cheng Jiang <quic_chejiang@quicinc.com>
---
 .../devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml   | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
index 7bb68311c..82105382a 100644
--- a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
+++ b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
@@ -18,6 +18,7 @@ properties:
     enum:
       - qcom,qca2066-bt
       - qcom,qca6174-bt
+      - qcom,qca6698-bt
       - qcom,qca9377-bt
       - qcom,wcn3988-bt
       - qcom,wcn3990-bt
@@ -170,6 +171,7 @@ allOf:
           contains:
             enum:
               - qcom,wcn6855-bt
+              - qcom,qca6698-bt
     then:
       required:
         - vddrfacmn-supply
-- 
2.25.1


