Return-Path: <linux-arm-msm+bounces-52408-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DFAA6E467
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 21:30:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A4D133AE512
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 20:29:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 287C21DB924;
	Mon, 24 Mar 2025 20:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kQgrncS7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB321C861E;
	Mon, 24 Mar 2025 20:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742848191; cv=none; b=YlN7QmTvPi+gAp1qyVhVf7VCiXJYY/UVqfoWKU+ajx25cz0Um5Fsmt0NkhovHSB+1agmSVyVIzNMeApfR8/bMecb8MfAHXYUsCK/RFjDGB9DhaIGoyzJw9IfegKHV226TB1CcR+t+xJwBCA0L89mwmIFKF0/jFeM58QBGVy7bvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742848191; c=relaxed/simple;
	bh=zWpYaYxQrbbMvgOJLf7MYqr/5byJDRuQpeI0eARcsxE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Upt+wOWCXpzkpOtYs7do7I/s35WlM3QRBNKtIqPRwUDlMuTqiCEK32sRAiA8zxb6KaLsNOVPpFpAMMzoLZM7GqH4L/xAg2W42ATXcoqPBL4yRX0zMYUjsIF21g7ozv+LqRyEj+hXzpcPzosC6pvuY6uKka8/sqI3aachqF6xOSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kQgrncS7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52OJ6LlS004163;
	Mon, 24 Mar 2025 20:29:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mTh5mzUrYlJ1RM+gtopllBDFR/lR5uXm4DrABK8z0Ro=; b=kQgrncS7qCpkAgU1
	VwaTGbSi9uUoyshiU15JzwtzeV6HXJ4wEoDS8hJmBmEQP+cbUX0NxxFG3Ca5CUBV
	zCkOH5n8kuxRDHmdkBsPtDPkyyTRHvi+zU/vaMdJwzLLYqOe3RyYEW7xVDqn04iW
	0SyID+kIL0szfsaRM0ieF4gt8lgKkDTCgraBFkzd3yvsZFxugDzwBbkdbUiTU21N
	ZA0DgAaoQPAXieCLmP3YDmCfJrREIvQrKGTmCDMUzyD7t6IvDpdTkjeSBfUBaXHQ
	K61OIvfi9D9ZBFOw5iiDNbj9gTxT0OxkBPStruHIzadPbWvjbUmsSig74+HCIkv4
	Q15Q+Q==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45hnk8nk65-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Mar 2025 20:29:44 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52OKThYL001670
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Mar 2025 20:29:43 GMT
Received: from hu-molvera-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 24 Mar 2025 13:29:42 -0700
From: Melody Olvera <quic_molvera@quicinc.com>
Date: Mon, 24 Mar 2025 13:29:37 -0700
Subject: [PATCH v3 1/4] dt-bindings: cache: qcom,llcc: Document SM8750 LLCC
 block
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250324-sm8750_llcc_master-v3-1-2afd5c0fdbde@quicinc.com>
References: <20250324-sm8750_llcc_master-v3-0-2afd5c0fdbde@quicinc.com>
In-Reply-To: <20250324-sm8750_llcc_master-v3-0-2afd5c0fdbde@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Satya Durga Srinivasu Prabhala
	<quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742848182; l=1014;
 i=quic_molvera@quicinc.com; s=20241204; h=from:subject:message-id;
 bh=zWpYaYxQrbbMvgOJLf7MYqr/5byJDRuQpeI0eARcsxE=;
 b=PIVhLauOr+TUx5CfxCGHMqH0p4aOyzGpHpItU0diDCw9o0dEZ5v4VPrV/62kjgShPsuEhCd5d
 DVIi3ZNQSnWDKcWzJIiS0rMHSezPVE3Z+bQ/zWPKnCqFWiELWYzD8IV
X-Developer-Key: i=quic_molvera@quicinc.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: sJYnMBOgf_Kpjmds5FnqtvCvs4iTOjlg
X-Authority-Analysis: v=2.4 cv=KMlaDEFo c=1 sm=1 tr=0 ts=67e1c0b8 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=3H110R4YSZwA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=XYAwZIGsAAAA:8 a=sCV_76e64iQtlowYmxsA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-GUID: sJYnMBOgf_Kpjmds5FnqtvCvs4iTOjlg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-24_07,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=694
 bulkscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503240144

Add documentation for the SM8750 LLCC.

Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/cache/qcom,llcc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
index e5effbb4a606b1ba2d9507b6ca72cd1bdff51344..37e3ebd554874f0fbbb8956a718dcb717ee82155 100644
--- a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
+++ b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
@@ -40,6 +40,7 @@ properties:
       - qcom,sm8450-llcc
       - qcom,sm8550-llcc
       - qcom,sm8650-llcc
+      - qcom,sm8750-llcc
       - qcom,x1e80100-llcc
 
   reg:
@@ -274,6 +275,7 @@ allOf:
               - qcom,sm8450-llcc
               - qcom,sm8550-llcc
               - qcom,sm8650-llcc
+              - qcom,sm8750-llcc
     then:
       properties:
         reg:

-- 
2.48.1


