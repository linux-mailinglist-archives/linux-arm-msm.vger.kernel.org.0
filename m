Return-Path: <linux-arm-msm+bounces-37877-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CC09C842C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2024 08:48:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA8311F23611
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2024 07:48:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7D9F1F6677;
	Thu, 14 Nov 2024 07:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="puv+Rldv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37CBC1F6661;
	Thu, 14 Nov 2024 07:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731570483; cv=none; b=Q3qD1S7FSIF60jKLwXHMMo7tMnnexnKthxpLLvY4XbWL2dXUElI6kTxk3bqk2Po/1CyoXg2RN4YzZgK/5IgUHColmRielSBA5hZ8Ve34NB0cPSW2Bnt4AfrNvpJnCFKHKYZaGL14XbJACDVreRHCnxdwfw8hf52SXAlZN2gerW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731570483; c=relaxed/simple;
	bh=kv1z4UyuGo8541FjMNKJeB/U/kAwzK4zfLkxgfieP/I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mPQqyaPv3V/fG45xVthyvfIzetq9XAWjGfLStt3KaXwhdBTMHV7wILI5Gh4G7rerN0oVd348IG/IPjDv0DLn7ZTp8IsLG5huW7z+I+JUMlsuqECR7cIkFS6YWk+zGcTRfLJEqWT9H1/XJIVp/u8uhSH90SifakPY9LcGFrGA4ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=puv+Rldv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AE400AU021224;
	Thu, 14 Nov 2024 07:47:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d9aqH3ZHtHo6ncM5PRqX9vBWoHYWCXaY3qMLq4glgGE=; b=puv+RldvbeNS/KFg
	1/mc9GWnKv3H1rHbKTJaTVUssrLn99u67g8fCASxAqasQnCO65hHM69AXb06tWG2
	yM+Z2ZHe/UFng1CzXN1EvWhlKsE/oMuzV39UDB97c3ugQU71jEjjomVjCltMk3B6
	wp+cfix6Sy7R4ADbnk5pYZ8koDKDseYNL6xh5UK3Kl+xCYbjCqX7Dj6kKF5R1r53
	EClo7HbC7BYULFH4UvgDeBX6Hp5tIr+IyqTfLCqCGxgNi/OrJ7k4j3SuLK6MJtU1
	NqkPopMWdZOE/Vn1Cp8SLoOlcjx4LPd2TCo07RNInxkSt1jzFrCna9dEcYsUD8WQ
	OMFDFQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42w9sv168p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Nov 2024 07:47:54 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AE7lsCU027995
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Nov 2024 07:47:54 GMT
Received: from hu-varada-blr.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 13 Nov 2024 23:47:47 -0800
From: Varadarajan Narayanan <quic_varada@quicinc.com>
To: <vkoul@kernel.org>, <kishon@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <gregkh@linuxfoundation.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <dmitry.baryshkov@linaro.org>,
        <mantas@8devices.com>, <quic_kbajaj@quicinc.com>,
        <quic_kriskura@quicinc.com>, <quic_rohiagar@quicinc.com>,
        <abel.vesa@linaro.org>, <quic_varada@quicinc.com>,
        <quic_wcheng@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>
CC: Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/6] dt-bindings: phy: qcom,qusb2: Document IPQ5424 compatible
Date: Thu, 14 Nov 2024 13:17:17 +0530
Message-ID: <20241114074722.4085319-2-quic_varada@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241114074722.4085319-1-quic_varada@quicinc.com>
References: <20241114074722.4085319-1-quic_varada@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: RbMKgF9-EykaSqNgBbVuVw-3M4veROR-
X-Proofpoint-GUID: RbMKgF9-EykaSqNgBbVuVw-3M4veROR-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 bulkscore=0 clxscore=1015
 mlxlogscore=973 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411140058

Document the compatible string used for the qusb2 phy in IPQ5424.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
---
v2: Add 'Acked-by: Conor Dooley'
---
 Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
index 4aed4b5d65ec..39851ba9de43 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
@@ -18,6 +18,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - qcom,ipq5424-qusb2-phy
               - qcom,ipq6018-qusb2-phy
               - qcom,ipq8074-qusb2-phy
               - qcom,ipq9574-qusb2-phy
-- 
2.34.1


