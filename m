Return-Path: <linux-arm-msm+bounces-33173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A44619914F2
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Oct 2024 08:44:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D194283F91
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Oct 2024 06:44:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36D9913B2BB;
	Sat,  5 Oct 2024 06:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jwOXHA1u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13B2135A53;
	Sat,  5 Oct 2024 06:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728110647; cv=none; b=iQo6dD2yrR1QnXpDjoJZEni6Jbba8OTdI6oX6uXTqU9G9SHO/8sDXTMSw9MxPgE/38dIYyO1ggpc/ZhmlIz2cvkRn5ebF3Uv2VygjHnglQLnrc7wzHs/n7esQPUTlufLBncwAsSQiyoK95qsQpEJjNphlhT6bn0YFklEmCiH/08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728110647; c=relaxed/simple;
	bh=iponTEKaYcuKSYexlCAqtnTxrejs5FGRNYr06Ek3RHg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u8GMJzwO3vRhqKEwP9GFRRoLYtf5fO+4lMhnV1pcyQNeAi9w24WHI01M7aCro1KDZ4d/JPNXG+RX+1hksACr292uVhTyl4YP0wxtV0HliYOTJhL/+FazkD+ZZ5Pvb+95ly2sFM0cXeL309wFR3Wu15Zezazj5LmY1A38Y+gLVZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jwOXHA1u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4956NlTv001328;
	Sat, 5 Oct 2024 06:43:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QDkm8AzYQrufvOKJzedh8tLaecGWi4YgqJcmnZUjzfg=; b=jwOXHA1ukuh3oMwf
	624hK2aypBz+bxvqMoEpX7OYn4mQ84rZxP9rOu37tEwPCrEkdy5gbbrLZ6PLa4bq
	l13sYaNgB/EV3F1u1YxiJsJ/Hc23RXiQP9ZUUeA9K9P3IRT/GiBth7lLEZphmhmB
	i/zrvE4dSIAYcogzuWSPjCjKILih/bGQGfR6H1oGp9jj58VdALTdNptGR48OX6N5
	1ENoCjSVWOiIyPY+hgXA2sR50UZTwn5VErtwiKtG/L5A6oxaVIR1ke1ToCbk1uj+
	sGoC9jxDB2kSSvCuVUWJVUtqQ6iyGQgXq0zixawscu4rvNoJ/BFiVFr1n+VZ5mnv
	kBvivA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 422xu683he-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 05 Oct 2024 06:43:44 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4956hhxf020646
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 5 Oct 2024 06:43:43 GMT
Received: from hu-rdwivedi-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 4 Oct 2024 23:43:37 -0700
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
To: <manivannan.sadhasivam@linaro.org>, <alim.akhtar@samsung.com>,
        <avri.altman@wdc.com>, <bvanassche@acm.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <James.Bottomley@HansenPartnership.com>,
        <martin.petersen@oracle.com>, <agross@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_narepall@quicinc.com>, <quic_nitirawa@quicinc.com>,
        <quic_rdwivedi@quicinc.com>
Subject: [PATCH V1 1/3] dt-bindings: ufs: qcom: Document ice configuration table
Date: Sat, 5 Oct 2024 12:13:05 +0530
Message-ID: <20241005064307.18972-2-quic_rdwivedi@quicinc.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241005064307.18972-1-quic_rdwivedi@quicinc.com>
References: <20241005064307.18972-1-quic_rdwivedi@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: WLXkhoAiNb5PvGyV8qjKZXzhAWQotnJQ
X-Proofpoint-ORIG-GUID: WLXkhoAiNb5PvGyV8qjKZXzhAWQotnJQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 spamscore=0 mlxscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410050045

There are three algorithms supported for inline crypto engine:
Floor based, Static and Instantaneous algorithm.

Document the compatible used for the algorithm configurations
for inline crypto engine found.

Co-developed-by: Naveen Kumar Goud Arepalli <quic_narepall@quicinc.com>
Signed-off-by: Naveen Kumar Goud Arepalli <quic_narepall@quicinc.com>
Co-developed-by: Nitin Rawat <quic_nitirawa@quicinc.com>
Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
---
 .../devicetree/bindings/ufs/qcom,ufs.yaml     | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
index 25a5edeea164..5ac56e164643 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
@@ -108,6 +108,11 @@ properties:
     description:
       GPIO connected to the RESET pin of the UFS memory device.
 
+  ice-config:
+    type: object
+    description:
+      ICE configuration table for Qualcom SOC
+
 required:
   - compatible
   - reg
@@ -350,5 +355,24 @@ examples:
                             <0 0>,
                             <0 0>;
             qcom,ice = <&ice>;
+
+            ice_cfg: ice-config {
+                alg1 {
+                     alg-name = "alg1";
+                     rx-alloc-percent = <60>;
+                     status = "disabled";
+                };
+
+                alg2 {
+                     alg-name = "alg2";
+                     status = "disabled";
+                };
+
+                alg3 {
+                     alg-name = "alg3";
+                     num-core = <28 28 15 13>;
+                     status = "ok";
+                };
+            };
         };
     };
-- 
2.46.0


