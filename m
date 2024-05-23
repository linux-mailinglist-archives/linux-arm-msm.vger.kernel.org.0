Return-Path: <linux-arm-msm+bounces-20301-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B35F58CD1AB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 May 2024 14:04:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 69E941F21E10
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 May 2024 12:04:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 357C713B7A1;
	Thu, 23 May 2024 12:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bGjQPoQG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD52B13B5B0;
	Thu, 23 May 2024 12:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716465855; cv=none; b=PIuRiSg8rHFDjIusU6OqJ/EjYEVIQQYeov85LLMyP/xuHPZbBA2NcSlvV0BJHd81c3TkX5e+5oBsNzz3+wBcJ5jl4Xtpoz1Vn5gmVU07dN12TjRxToQ0oEY3Xuynf4/VJqYSNBHEG6UUrkqLW86BqESXdZjNxrwe1IDWtu+Azjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716465855; c=relaxed/simple;
	bh=HgC9TVuJDL0Gxu+T0SW+6KJaOfIiSm5IJ7kzEtOwfn0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YqCywrm9ttoMFX2YIRPAJpzBauv011OcYoSs8vQxlj/nCAlOL9leWkPukB99CS4LqjNbNItrDnUNi16ecJ3FckHTSy2/QBxbTKOo3ZgEXeQ1+csSNkUkAUsKwwEG/I3Cj5Z84gkmzcwhOZiz/7K/RkvjsI7yMF4RgtaAJnYYs0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bGjQPoQG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44N4kAL6013120;
	Thu, 23 May 2024 12:04:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZrL88IawaIl55f5X99a7wwfG
	NdPBNplE1/fKAm5VbNo=; b=bGjQPoQGJCOMoUH/zbhHkun2nvCjaljlfRDAaP4k
	PNSD9Du/6FQm9a04lFKR7uLdzaBuUF3XkfltS+H43KuB21OTEe+f7FqJCBuCLXso
	bh4oSA2Zyo5hrEbdz2H+Df61mM/mFbJFdqrfEJCX6dTgXxkS2CJ0NwjU90ZV1yCu
	HON4hAAEOg69yBkWt79n0vz1UFnHK+SCsOzCLKrb7b0alMsy8bFLLL2rtRdc1nWn
	1ZcceoNVnRJNE8qqH3oHz+qombfKMTftEk6/tXODSwWZ1ttT9igN6d7gjn/jDuch
	1jKPn/ZzV9lKHpx2nvH3h4ugduXn2sc4gW3wr1ioGXqk7A==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y9y29s0me-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 May 2024 12:04:10 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44NC49oC002469
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 May 2024 12:04:09 GMT
Received: from hyd-e160-a01-3-01.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 23 May 2024 05:04:05 -0700
From: Naina Mehta <quic_nainmeht@quicinc.com>
To: <ulf.hansson@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <bhupesh.sharma@linaro.org>
CC: <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_nainmeht@quicinc.com>
Subject: [PATCH v2 1/3] dt-bindings: mmc: sdhci-msm: Document the SDX75 compatible
Date: Thu, 23 May 2024 17:33:35 +0530
Message-ID: <20240523120337.9530-2-quic_nainmeht@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240523120337.9530-1-quic_nainmeht@quicinc.com>
References: <20240523120337.9530-1-quic_nainmeht@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: P_RtDrR5AsO49KUlbiuD7eZ15fciGUvB
X-Proofpoint-GUID: P_RtDrR5AsO49KUlbiuD7eZ15fciGUvB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-23_07,2024-05-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 mlxlogscore=999
 mlxscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405010000
 definitions=main-2405230082

Document the compatible for SDHCI on SDX75 SoC.

Signed-off-by: Naina Mehta <quic_nainmeht@quicinc.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
index c24c537f62b1..11979b026d21 100644
--- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
+++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
@@ -51,6 +51,7 @@ properties:
               - qcom,sdm845-sdhci
               - qcom,sdx55-sdhci
               - qcom,sdx65-sdhci
+              - qcom,sdx75-sdhci
               - qcom,sm6115-sdhci
               - qcom,sm6125-sdhci
               - qcom,sm6350-sdhci
-- 
2.17.1


