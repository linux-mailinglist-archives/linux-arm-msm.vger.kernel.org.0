Return-Path: <linux-arm-msm+bounces-35865-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA3C9B0266
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 14:33:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6436B283540
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 12:33:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B179C231CBA;
	Fri, 25 Oct 2024 12:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BsgzLS8u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD12120101A;
	Fri, 25 Oct 2024 12:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729859581; cv=none; b=qXVYzf2Ps956Ys6/FjY2qRyWAESf93cTE+9aFaptTpGzlntIK3FYUfvoFoGzv/kY5Fho9PQnusI/xap28QI/Z+p4/ZHxurkTK1J4VcWTq9uRF4lXVyVftGgKUGzRPbsq0b+GsMKNgtuuuFIbyQd8+nClkkO8uBENZ4n9yNNN9Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729859581; c=relaxed/simple;
	bh=g6aQo1d8nVZConYoCIp8C4Lspao/OWyUqdg7RILlB/U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tbve6F79SRyOxnaCRK6vOi763oIo8laxNcgYf0l3MdhUzvHCD+m1L5tlgzCbd2w/zciwJ6xfW9E2D1Rneq/Xx/I05my+dsDaq/XQRvl6Dk57z24UuwltfECjF0BHy1zIxQ1W20ZFKhZClWqPJGC8HjyVsm/N5x8+MAWHQYykKpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BsgzLS8u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PC1kSO009125;
	Fri, 25 Oct 2024 12:32:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+YPkKiCZ7ZqqLkRANLq7T963aWA0QDV5j8K8YOxr74A=; b=BsgzLS8ux1V399JT
	i0h+nrKdJyn9hrQDlQD9XatBDY2QwtckzmLp2fMzxYZz/J2wN3eKz9Kben2qn8id
	HHlHeL7eD3W4hY2G12BhmTzZYKH+zF0HXrcfUl3Qdjs7MpHIvMJHA3jKyuquUTCv
	eFQvoTTJXolbpJx/FvrejP4c+eOFPKkfzO0xKLN/orSWMY2D/yyiwFIx76qdBuX+
	J8bAlUFoNJ2rFK3fjQaFN+nnjTh+w/pmRFvydN5OjMe9v5yJDN5Gli+spYZk3fRa
	SHX3E4OWss55ZFlnaGc1sQmJIRz4wk0a9SuJlSz5BCiaOZMQCws8t9J6YQb+hskA
	hGDs9A==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em43gy93-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 12:32:53 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49PCWqGg026461
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 12:32:52 GMT
Received: from hu-sibis-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 25 Oct 2024 05:32:47 -0700
From: Sibi Sankar <quic_sibis@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <krzk+dt@kernel.org>,
        <robh+dt@kernel.org>, <dmitry.baryshkov@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <quic_sibis@quicinc.com>,
        <conor+dt@kernel.org>, <abel.vesa@linaro.org>,
        <srinivas.kandagatla@linaro.org>, <quic_jjohnson@quicinc.com>,
        <maz@kernel.org>, <jens.glathe@oldschoolsolutions.biz>,
        Rob Herring
	<robh@kernel.org>
Subject: [PATCH V3 1/3] dt-bindings: arm: qcom: Add Snapdragon Devkit for Windows
Date: Fri, 25 Oct 2024 18:02:25 +0530
Message-ID: <20241025123227.3527720-2-quic_sibis@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241025123227.3527720-1-quic_sibis@quicinc.com>
References: <20241025123227.3527720-1-quic_sibis@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: O4ZqQCbmPmBQHHC4WIPHkJ2fFXHLDhFB
X-Proofpoint-ORIG-GUID: O4ZqQCbmPmBQHHC4WIPHkJ2fFXHLDhFB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 impostorscore=0
 phishscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410250095

X1E001DE is the speed binned variant of X1E80100 that supports turbo
boost up to 4.3 GHz.

Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 0f18cb35c774..e672e6ecee56 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1056,6 +1056,12 @@ properties:
               - qcom,sm8650-qrd
           - const: qcom,sm8650
 
+      - items:
+          - enum:
+              - qcom,x1e001de-devkit
+          - const: qcom,x1e001de
+          - const: qcom,x1e80100
+
       - items:
           - enum:
               - lenovo,thinkpad-t14s
-- 
2.34.1


