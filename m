Return-Path: <linux-arm-msm+bounces-43362-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE7A9FCAA9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 12:45:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 421B2161D83
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 11:45:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70F701D54C0;
	Thu, 26 Dec 2024 11:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YchiPrZh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E926E1D47CB;
	Thu, 26 Dec 2024 11:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735213532; cv=none; b=rN634JekdCuXo5cCPxF8Yg011x3z18nvEylEGc+0fJ6Z7K0uH020s/jt3YPx66RfkpOTy6kilsAaZoa9vmVZfFBK+xc6QCfXMyg0/OW3SHVwC6b5yNhLpVR9NJ2471WDPT9YNcLG0OdexUz4/uKjdb1tdXhCz/IfLlNmqyPCqEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735213532; c=relaxed/simple;
	bh=hmz3HHE2bxYGCV9TVhcNuaWyAq44E9O5w405OVem8yQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KKaJ4D1WrSdcQdbc7BBRCQP51DVQd26Ay67D4XRGuOEO8BKjZISXRB93e7KOmYGrmbdG/dEWhMXOw7VqY1vq/pYOvc20wDneS+x2mvKoqmglMDurRQY/pMSWJ22cF5aL/EBpZ9ggkZKMHd7FQVsOCHb6OS0VBSw3OcKelf5z6fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YchiPrZh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BQAE4CU030987;
	Thu, 26 Dec 2024 11:45:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AU+NpUSkUajrOzn58bGNXb/EhCwWRAMBTsBQJiv0Te0=; b=YchiPrZhALFPhh1D
	eX3myrLL/ZexrSBK3ZjSCzbMG+qUwOnfT+RHkFvudWJ6Zyd3xwXvKZG5QYap5gNf
	xs5VY2YMirK7MWZP/BfQwCIqR0/ha1iFJFoZbDvc+VxtAxrDTXbQPsvjEk/elUXN
	pIXosHxHzESbgGqlPrzBESnN/Ag3/tHWFVd+v/nfdxJf7Gmiyymijjg+be17Ukys
	88eBctdqt7CqBa/PIBzo7IYKu3mvA4pbiDeGM/a7aSiQ9u5ahuW1XZDNgqy8IAyW
	WmjhBlYj2ptyK2vECwx38EYK5L4QjbC5AdsEemzRT/GVjJcwKTZ7BZM6CbZAky6o
	wXlI+Q==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43s5730m85-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Dec 2024 11:45:25 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BQBjPr2003825
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Dec 2024 11:45:25 GMT
Received: from hu-mdalam-blr.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 26 Dec 2024 03:45:20 -0800
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: <herbert@gondor.apana.org.au>, <davem@davemloft.net>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <vkoul@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>,
        <quic_mdalam@quicinc.com>, <quic_mmanikan@quicinc.com>
Subject: [PATCH v3 1/4] dt-bindings: crypto: qcom,prng: document ipq9574, ipq5424 and ipq5322
Date: Thu, 26 Dec 2024 17:14:57 +0530
Message-ID: <20241226114500.2623804-2-quic_mdalam@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241226114500.2623804-1-quic_mdalam@quicinc.com>
References: <20241226114500.2623804-1-quic_mdalam@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: OEV3F7tZHtKngnsDcTpinWmwcZwKL54F
X-Proofpoint-ORIG-GUID: OEV3F7tZHtKngnsDcTpinWmwcZwKL54F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 spamscore=0
 mlxscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412260104

Document ipq9574, ipq5424 and ipq5322 compatible for the True Random Number
Generator.

Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
---

Change in [v3]

* Organized the device tree binding changes in sorted order

Change in [v2]

* Added device tree binding change

Change in [v1]

* This patch was not included in [v1]

 Documentation/devicetree/bindings/crypto/qcom,prng.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
index 2c959162e428..d38e8d3b2f3a 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
@@ -17,6 +17,9 @@ properties:
           - qcom,prng-ee  # 8996 and later using EE
       - items:
           - enum:
+              - qcom,ipq5332-trng
+              - qcom,ipq5424-trng
+              - qcom,ipq9574-trng
               - qcom,qcs8300-trng
               - qcom,sa8255p-trng
               - qcom,sa8775p-trng
-- 
2.34.1


