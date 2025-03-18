Return-Path: <linux-arm-msm+bounces-51699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4FBA67010
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 10:44:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A84EA7A38E3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 09:43:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AFF51422AB;
	Tue, 18 Mar 2025 09:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TbAt2wxJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B66224CC;
	Tue, 18 Mar 2025 09:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742291048; cv=none; b=CNcgfzWCnpFSXYlf5PpZWZ6JZNLWQahUB/UEaCSsfOYzMXoD+AYsqR1/qidhqHSUKkhEtzHKomeOUSNI6aTISQSGDuPvfy4NfnWi/tWco0L7H9qQZI12q7BTRPKo6CjnG192mh4TKmXiANacCjR6NdmkLQFTPx1TIdVgFPHptx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742291048; c=relaxed/simple;
	bh=fO0N91sKg6UmgHAk27a8Ze+v8c8xR6a4t21eOWUbCIM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=qwGSgAEEUNWhmcgYN+15Xlf3Kvq/m5Cnl0PG7A3SKcQ3UpTTXbmZMK09z2SFcqMhUG7sinibFr+Mb2X3GLturx2D9IUAqYK20iXdIpZDUjP0nACMFmZgPMAmPTgi9I1+KpHx4ZAwuWibabmOL18sp+NhLoELrNBbSVzbFF91JcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TbAt2wxJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52I9MOOg027250;
	Tue, 18 Mar 2025 09:43:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MVeIWEpBpbFCUriLBgiAOdy9BSmbWVGJyIgSh/R0Ooo=; b=TbAt2wxJWCQw5dDb
	BnnsbA/JF5XnU2+YGuucAc1vZUGKBorhXdtlipAFltU/Jl3SKOtg5okfpDqqiaVv
	BNnVdO9xSDUJjRoryW9uMt56hWlbF4XeENkL94mmoEpL7PFCcWQUzUMsY6gpTBB1
	8jFmKuyTSL/lIt13r7kMmsCT5kiK/MVWLg+LLDWvQW+GxxURWhFbPJOpbjlkSTDw
	e/Ogm9zbInPL7F+xoStFc1ko2e9NzBMZwHV/wLejT1xD90y3EVDDjrj+I4uf8w5P
	ssVivrRb025HMKzZbNQnWCF8SWyq27cHC5QrYvl8ePWAZVn9xtwBZxDYlX5XuWAs
	WgTufA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1sxynxc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Mar 2025 09:43:58 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52I9hv5D020385
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Mar 2025 09:43:57 GMT
Received: from hu-arakshit-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 18 Mar 2025 02:43:52 -0700
From: Abhinaba Rakshit <quic_arakshit@quicinc.com>
Date: Tue, 18 Mar 2025 15:13:23 +0530
Subject: [PATCH v2 1/2] dt-bindings: crypto: qcom-qce: document QCS615
 crypto engine
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250318-enable-qce-for-qcs615-v2-1-c5e05fe22572@quicinc.com>
References: <20250318-enable-qce-for-qcs615-v2-0-c5e05fe22572@quicinc.com>
In-Reply-To: <20250318-enable-qce-for-qcs615-v2-0-c5e05fe22572@quicinc.com>
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu
	<herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad Dybcio" <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Abhinaba
 Rakshit" <quic_arakshit@quicinc.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: r_P3UKwTuuYYQwHShhyiBTqPyx_xlFdH
X-Proofpoint-ORIG-GUID: r_P3UKwTuuYYQwHShhyiBTqPyx_xlFdH
X-Authority-Analysis: v=2.4 cv=XKcwSRhE c=1 sm=1 tr=0 ts=67d9405e cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=D6xDKhzkZE5L37BfSJYA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_04,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1015 phishscore=0
 impostorscore=0 adultscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180070

Document the crypto engine on the QCS615 platform.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Abhinaba Rakshit <quic_arakshit@quicinc.com>
---
 Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
index 3ed56d9d378e38a7ed3f5cd606c4dc20955194f0..acc1eef9d85825d0331db314dd103b8c7a8e2ab3 100644
--- a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
@@ -45,6 +45,7 @@ properties:
 
       - items:
           - enum:
+              - qcom,qcs615-qce
               - qcom,qcs8300-qce
               - qcom,sa8775p-qce
               - qcom,sc7280-qce

-- 
2.34.1


