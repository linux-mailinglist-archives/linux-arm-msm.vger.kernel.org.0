Return-Path: <linux-arm-msm+bounces-30254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B86096630B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 15:39:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A7068B20521
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 13:39:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAA881A4AB3;
	Fri, 30 Aug 2024 13:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="L7aY1pXW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3BF61D1305;
	Fri, 30 Aug 2024 13:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725025170; cv=none; b=CNunh4XsH9nXKI9of8WwOZPXUTuL1S+Rb/ilZwXJhN0ZCdp01MyBE//6224HH78MNYs5lSZZjeaQQvbf7x296DNA+xHXAOQXv6wougmHrxmvKlxsSXFjA4D6ACeQjnkFiSvUs/e2l2+qfC7ltW72ZggbTTfjpbUGErAoeHBqJn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725025170; c=relaxed/simple;
	bh=uVq1JUP82sSYRL8HVnjc53Jwj+KQIHIMQcKZeNj96Mw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=B0iV2tq/NNsd3ukD1uiV0iNjysbvaTnOwpByWmlplY4bszoPtBmJLcAY0vcADLxwAHDwX2c35MhI+10y0weHnXmn2VTYonPDM8Q+q4njm+RpF/ZBF8JQ4y4WBHMPFaq612Ys3uzf8BU69iNtjFYdzjDvotEAV9KegFSPaPxpGN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=L7aY1pXW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47U80BZI011434;
	Fri, 30 Aug 2024 13:39:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CoOr2HN15nF8r7fQEfoG1Y
	3ol5UgNAjHoywlmgPJch8=; b=L7aY1pXWoTJH4mJ0bRvvqODeFwkQfspQmFGhkY
	w/Q9YFlXddw6uxt7X3wJUTv6pCZye43U6R41EymhonkSn8CyfpVS2NFybX1ak4sn
	LjJ+CJakhISwcGzeXLH8EslWaIz45UCR3ct05kQs2IDvsS75HLBNc42YEI2bt/Qe
	K9uEvkXwBQsogSIETXHZ/NYsDBDEWqlsHox+JZX/qiT2scewUV9z4SHCwq7FJz3V
	6oHa7tZMKTKQNi2cN8IrLR4IBqpobs6iu2rkXA1jqiL9Uiltn8k6yjsV+B839l/1
	KoPMle5UfDhIl5MbcpctV7qEbz2QXbH94vpE5Cc+ayQ1ZUtA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419pv0s4d0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Aug 2024 13:39:25 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47UDdNpa011828
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Aug 2024 13:39:23 GMT
Received: from hu-mojha-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 30 Aug 2024 06:39:20 -0700
From: Mukesh Ojha <quic_mojha@quicinc.com>
To: <conor+dt@kernel.org>, <krzk+dt@kernel.org>, <robh@kernel.org>,
        <konradybcio@kernel.org>, <andersson@kernel.org>, <lee@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Mukesh Ojha <quic_mojha@quicinc.com>,
        "Elliot
 Berman" <quic_eberman@quicinc.com>
Subject: [PATCH v2 1/2] dt-bindings: mfd: qcom,tcsr: Add compatible for sa8775p
Date: Fri, 30 Aug 2024 19:09:07 +0530
Message-ID: <20240830133908.2246139-1-quic_mojha@quicinc.com>
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
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: e_ImQjHIbGK6EzfyfyQk0uuEYvUkIZa0
X-Proofpoint-ORIG-GUID: e_ImQjHIbGK6EzfyfyQk0uuEYvUkIZa0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-30_08,2024-08-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=968 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1011
 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408300104

Document the compatible for sa8775p SoC.

Reviewed-by: Elliot Berman <quic_eberman@quicinc.com>
Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
---
Changes in v2:
 - Added R-by tag and rebased it.

 Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
index c6bd14ec5aa0..7d0b0b403150 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
@@ -21,6 +21,7 @@ properties:
           - qcom,msm8998-tcsr
           - qcom,qcm2290-tcsr
           - qcom,qcs404-tcsr
+          - qcom,sa8775p-tcsr
           - qcom,sc7180-tcsr
           - qcom,sc7280-tcsr
           - qcom,sc8280xp-tcsr
-- 
2.34.1


