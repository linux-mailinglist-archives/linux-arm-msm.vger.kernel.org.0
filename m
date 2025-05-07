Return-Path: <linux-arm-msm+bounces-57064-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B863AAD668
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 08:51:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A89A21BC5088
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 06:51:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BD54213E69;
	Wed,  7 May 2025 06:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="k7KvQ0CH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD7D149C64;
	Wed,  7 May 2025 06:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746600695; cv=none; b=X6MBlwfWRloVj4BNAXbC+Fx7p4bjnrwlaOFO+AiCYzuCneLepbxn5LC645PEl0EW0nQCnb6MGeDKuq1jzPxNCjIA4UZAXVHC/W63QtxEQSjORIcoruFMSrv55yuXSUcUXdCRatlxC+96sk2yM6vAb93XZrQIJ6HJ2vSXNuoa/+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746600695; c=relaxed/simple;
	bh=2eox1JskpnrK2uN/QhchQ/mOQRxsqEKg3pRH7YzBoyk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HoDJp6n7FK0qgcA/OplpkW8ZK1M+cbl+5vX2GoAXPcJyFSoJrkU8CeNDekr01DrzOCBR4XPC91b2G2vYpx7ehGoNw7n9jFudx7NqM/kkdStIzsaQLRb/wx/qClvQiZSGgeRSAU7C4Q85U9s5Yf8voYwm/VqwCQ0k6O4xqu1ReAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=k7KvQ0CH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5471H37I024563;
	Wed, 7 May 2025 06:51:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YeJnO1EU4eS
	5pksUJ8tTKuPoJq5nyqYM/tD9WhTkU7Q=; b=k7KvQ0CH9MwTDcoVCftgSWGV/xs
	HGYBcmi3ysC7Sn+LLpEHwsA8cdhtFl3hG9pmDaOoDscm09wlhfOljTKP5JAGo4Bc
	1Dot0f6/8mL73beUbdCznA07R+F6kUxlXAEZT7YH0/hLB+1HwThR/DqZBWWWypgz
	iujPDeH0jy0tNQSJMdeGrXt5KoEW1XsKxKXaiMw2y7VlbWjW9MgXdMqZh66V4lbn
	uVCubqQwHbdGtqU0pzU3Pxdf8GHcshRNDJM3cpkA31Tp66pccw4MuVNGt0L/g2JV
	9VhnSA9HMojQC9Qj0fvGWP8mmxFUqbYOBOD89NKae5iBRbeVkMp1bodfosg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5w3cq3t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 06:51:29 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5476pP8u009511;
	Wed, 7 May 2025 06:51:26 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 46dc7ms9s5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 06:51:26 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5476pQkx009543;
	Wed, 7 May 2025 06:51:26 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-wasimn-hyd.qualcomm.com [10.147.246.180])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 5476pPNx009540
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 06:51:26 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3944840)
	id 42CD75B5; Wed,  7 May 2025 12:21:23 +0530 (+0530)
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        kernel@quicinc.com, kernel@oss.qualcomm.com,
        Wasim Nazir <quic_wasimn@quicinc.com>
Subject: [PATCH 5/8] dt-bindings: arm: qcom: Add bindings for qam8775p SOM
Date: Wed,  7 May 2025 12:21:13 +0530
Message-ID: <20250507065116.353114-6-quic_wasimn@quicinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507065116.353114-1-quic_wasimn@quicinc.com>
References: <20250507065116.353114-1-quic_wasimn@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDA2MiBTYWx0ZWRfXz2yhC9p39CKp
 kTDVQnwQhYtrcJlt7528ROzu4Fl9tRqEN8GPcEZaDSEsuWzMFt6hleEW3YiXZ41TmcxduV9NDrn
 fUy/SZvWAPFv8Usvbw7/7yv3rbG6swn+X40rMYezzmsb6gIfJ4Vmz1HzYTFN51rroVeR0Zx9wYh
 5ghwfUArHvcd1dJiwLTFGJ6MPNea5n+JENG7aMuJIAiHK8yxtggPqIuQs36QJZa+MvOjVSu8pW/
 7LHt8LK5KAa52jEPp4jutgJ+70uBhx4r0An2aNAdou87rchiSJbA8+vQnqcMwUC2VOXNoc9eZfL
 8uesCc5+mk3i4t+o2l/pOJkVtRgtlRGeBSqDuuqoPDLEIeGYOJLhcWrkxKGWR9XB5YAc/I+u8uY
 NtHjyYQrmmRFwZ6QL3SHvtcdT+5vefwYDlVZZAiXuMaXvg9xf2DdQ8+4bNGv23G+zKYiTlRa
X-Proofpoint-GUID: KXRuoAB68SRXD2UJ8vXakJDUyn6mkv5A
X-Proofpoint-ORIG-GUID: KXRuoAB68SRXD2UJ8vXakJDUyn6mkv5A
X-Authority-Analysis: v=2.4 cv=W+s4VQWk c=1 sm=1 tr=0 ts=681b02f1 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=eYfBXBLyOUA_aQLshGEA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_02,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0
 mlxlogscore=911 spamscore=0 bulkscore=0 mlxscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505070062

Add devicetree bindings for QAM8775p SOM which is based on sa8775p SOC.
QAM8775p SOM have sa8775p SOC, PMICs and DDR and it is stacked on
ride/ride-r3 boards.

Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 96420c02a800..671f2d571260 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -958,6 +958,7 @@ properties:
           - enum:
               - qcom,sa8775p-ride
               - qcom,sa8775p-ride-r3
+          - const: qcom,qam8775p-som
           - const: qcom,sa8775p

       - items:
--
2.49.0


