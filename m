Return-Path: <linux-arm-msm+bounces-31015-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5827E96E314
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 21:23:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0436F1F273D1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 19:23:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76FB918C342;
	Thu,  5 Sep 2024 19:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iScUXFLO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E5A18037;
	Thu,  5 Sep 2024 19:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725564226; cv=none; b=J+RV/wmL1Gu7KpQ89CIbv+vkjCbk5g7y2m7BeWVO33N2XqdaLyzS8nuO4jPoxCMRr0RS07T0T5puAzJPkuqirgXgLjJhgh8A8HoOrX1nmOHcK5jH1NC3OYJMpI2zFQczr9vmL0Gl4ARAiUFgrceA1C+ytYlek0JNwApTebqfmZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725564226; c=relaxed/simple;
	bh=99Aayfwr64C8h/uSTsDHwgjTG3uwPXVeNP+Xr7sRXh8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ijmKZO+4+eHgDfqTjzqWRf437U59f+v8XdpW/L4dP7JlM0UtDxUgq2oPJjWWcvDT2fa35wbUOtYHfnjHasxXGK0rI/48Vnafv4sHFKHd4qEfJL2AfnkaL6YkQ+KZO0WTMB6OMjcfk0LcVWCxEP/Y1/WquQ6Z/hLm4wD6y2m83WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iScUXFLO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 485IPvit019634;
	Thu, 5 Sep 2024 19:23:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=S0UiDBMYHSMboXZOqz10Ss
	rAQ9QSZA1WieMfCAzgYxE=; b=iScUXFLOZpdt4AoyNaqmxjMhQd4AT/661vZlHB
	fgreGcBx/665B/YRzls2WAcWFOfRVdNWkEgyCTJd9N+UBx0VsMV41gVAcm5RA6EW
	+x34CxtNN+qJKTk0d3AHzcMs8zhnHH+NjAoRn2VtJA7ehHHfAKwB2UA6kRboD0cp
	luH4dodKJdDTuw7xA0RZpmALepNYfuCmZ4bEeUfd3VOs1wBYYFZ2L6N8EN84Znpv
	+dJRttn+auY0AGG/H8S/9Baa23FLWHPtKo0bvU5tj7QE1+dYGjbWUwjavp0zOdwv
	EmrmSKORHHhiFjYyg3nN9s0NfjAG6rWFKpkuEIDgvaTUV87A==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41fhwu03gs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Sep 2024 19:23:41 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 485JNekK009671
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Sep 2024 19:23:40 GMT
Received: from hu-nkela-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 5 Sep 2024 12:23:37 -0700
From: Nikunj Kela <quic_nkela@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        <quic_psodagud@quicinc.com>, Nikunj Kela <quic_nkela@quicinc.com>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3] dt-bindings: soc: qcom: aoss-qmp: document support for SA8255p
Date: Thu, 5 Sep 2024 12:23:28 -0700
Message-ID: <20240905192328.3778542-1-quic_nkela@quicinc.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-ORIG-GUID: ww9bIEgp-xtPlqW2drt0EgJWhea22cT7
X-Proofpoint-GUID: ww9bIEgp-xtPlqW2drt0EgJWhea22cT7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-05_15,2024-09-05_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=0
 clxscore=1015 mlxscore=0 mlxlogscore=966 phishscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409050144

Add compatible for AOSS QMP representing support on SA8255p.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
---

Changes in v3:
	- Removed the patch from original series[1]

Changes in v2:
	- Added Reviewed-by tag

[1]: https://lore.kernel.org/all/20240903220240.2594102-1-quic_nkela@quicinc.com/
---
 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
index 7afdb60edb22..bd873e7e4ae5 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
@@ -26,6 +26,7 @@ properties:
     items:
       - enum:
           - qcom,qdu1000-aoss-qmp
+          - qcom,sa8255p-aoss-qmp
           - qcom,sa8775p-aoss-qmp
           - qcom,sc7180-aoss-qmp
           - qcom,sc7280-aoss-qmp
-- 
2.34.1


