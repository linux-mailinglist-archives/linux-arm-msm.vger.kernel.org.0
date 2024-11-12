Return-Path: <linux-arm-msm+bounces-37518-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 805629C4B04
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 01:36:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E4012845D4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 00:36:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51CE81F7077;
	Tue, 12 Nov 2024 00:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lp4u7dem"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB73F1EBA19;
	Tue, 12 Nov 2024 00:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731371766; cv=none; b=hc1c8jyt5DT/D4xMuttd5uhtH64PJeZ9Jw7ViQGn7Znj3AxeOjObaCSXWrJDRBLkGtcuiN13ozJr0yFieUDEw+HIGbDHNcOcfZxw7DZGcmZV/kkKy/ikb99t29+P5dWLimla7VbnlOm6kKn+pHtndYYSlKji1Hje/ubkD7vUyWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731371766; c=relaxed/simple;
	bh=rJ0pgUZqcmzDs+qozJHJNF65vkXc0SZlYOLOvMmbkiI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Rcl7eHP4lAawm4CW8z90rpLnyzGmMogG2ea4fbmHyzF6DM0OHElQuNvBNDLT/t5H4YkgZCHeQ+dpfNFQEBXxUVC+hmz8bFAm0rG/juS6iBAZ0SipUm1s3if2SPpoLIF2YP+30rmH4GegAEZ9p8Zob4bXpcMTNT/ob6oYOW6ekOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lp4u7dem; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ABBvbsr021648;
	Tue, 12 Nov 2024 00:36:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PVCB2RdRRc7JX9abm692h9
	RChG5YYkbb2XnRi3i4MV8=; b=lp4u7demNZnMaTNMHD+q2qjCf0gBhUSl4Kvb92
	7alxZlX1lAhN73f2cUIh3CYLprkf9jX14oS34YX61LtxVGJak+nBcP097Da7ymgw
	aDmhywh3vWoae+ciEMa34qZkC4nl1S2SWPno0GvTNJWlLs7JHeHWmFY9fizRbCz7
	Cq9Lo35x/FSpiKCph0cJertjKSwY2TVfk5068gBApXofCNerI3okgvuWMFL7m55f
	AW1xEDRVDMDHr0ZTqB/1oqVMjY+PrBYOv/e03z2hi724NHSQB+iYs2EQfPBFSatE
	d7m1LdjfBjvXamNSHwZyYhSMA1pBTyScSrGH0idJHVAbPw0w==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42sytsnp34-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 00:36:00 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AC0ZxWB006094
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 00:35:59 GMT
Received: from hu-molvera-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 11 Nov 2024 16:35:59 -0800
From: Melody Olvera <quic_molvera@quicinc.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Abel
 Vesa" <abel.vesa@linaro.org>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        "Satya
 Durga Srinivasu Prabhala" <quic_satyap@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Melody Olvera <quic_molvera@quicinc.com>
Subject: [PATCH] regulator: dt-bindings: qcom,rpmh: Correct PM8550VE supplies
Date: Mon, 11 Nov 2024 16:35:44 -0800
Message-ID: <20241112003544.2807368-1-quic_molvera@quicinc.com>
X-Mailer: git-send-email 2.46.1
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
X-Proofpoint-GUID: PAvW_uOLYE29E6PtNZfdZ0PaRyItDyK5
X-Proofpoint-ORIG-GUID: PAvW_uOLYE29E6PtNZfdZ0PaRyItDyK5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0
 mlxlogscore=876 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411120003

The PM8550VE has two more supplies (s1-8) than the PM8550VS (s1-6),
so move to a correct if:then: clause to accurately reflect that.

Fixes: 902f8c9830c3 ("regulator: dt-bindings: qcom,rpmh: Correct PM8550 family supplies")
Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
---
 .../devicetree/bindings/regulator/qcom,rpmh-regulator.yaml      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
index 27c6d5152413..3a5a0a6cf5cc 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
@@ -349,7 +349,6 @@ allOf:
       properties:
         compatible:
           enum:
-            - qcom,pm8550ve-rpmh-regulators
             - qcom,pm8550vs-rpmh-regulators
     then:
       patternProperties:
@@ -385,6 +384,7 @@ allOf:
         compatible:
           enum:
             - qcom,pmc8380-rpmh-regulators
+            - qcom,pm8550ve-rpmh-regulators
     then:
       patternProperties:
         "^vdd-l[1-3]-supply$": true

base-commit: 6d59cab07b8d74d0f0422b750038123334f6ecc2
-- 
2.46.1


