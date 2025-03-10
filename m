Return-Path: <linux-arm-msm+bounces-50888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4C8A5A5E8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 22:15:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0A7D57A7D6A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 21:14:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66ADD1F8739;
	Mon, 10 Mar 2025 21:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="h4iZK4WV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA42A1FDE39;
	Mon, 10 Mar 2025 21:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741641196; cv=none; b=haDmrgdO2n16B4fGAaE2nAf+pjEdl7OLsUiVfXjmXBwvnfFmvY4CfrCog+mIqV3sekzbxVZga2w0khsOp/GcBoL/RE7GMCLH3lM0JFbRZK98mQ/Gu7ANWYJg/4WOgYG4A+Tl3vLEke95idBsg8Na2LeJet0VuD1jw49FtI5bCt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741641196; c=relaxed/simple;
	bh=0cREfP9G2ZnggkRCCbwjbn4Pg7K5hLXT+9RXV3m6hmg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=C+yl8frq+tAXq87hkCJCX/zQ1de8b23fEEdKgbzSxuo4c6rZuR9q2d9xarKxzdZaDSsTPaPmq8UFr3Do2KsPqcZOuyq3Q4K8s22CvBuM0ylMJ2A7SM+ocsAmmtKkydQMHENp0I6bBlb6ulrRaBGPRnj5LG9w8znL1D2xaSgMKSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=h4iZK4WV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52AL12Al031435;
	Mon, 10 Mar 2025 21:12:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OfpNpZLvIGiAm8u29rn2am3Pmpw+8fOJbddSkv4rNLQ=; b=h4iZK4WVKc2AFH5z
	j9/A3golj1buY87B2sAoLhVfvTGpNdD4HYrrH4M4sy4n/5n9gT+2r+g554kg9CSE
	VAY9Gjg8878hf1rEx2J9eNBIJMDKR+OW2ecy5CyPSJUlXMcGTsijX1oohaoybRVa
	RiBfCTM4+3RY03E34UG/chuz5IzJAuXhhjVrn+yRlALTOu8g5M9er03UrjNsLP4N
	muOh5DAZcRQGJa7V4UvpnJQBQ848RIth1FwLBXf0BjTD5L2e216Fp/Da6PkYjUxJ
	IIXEq0UHPyfndXpzyTRU6cAqsLcNcFlhmttQ4/cjSTO09Xot30wcteESrqAegZJb
	fxWClQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458f0px4y5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Mar 2025 21:12:50 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52ALCheu001370
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Mar 2025 21:12:43 GMT
Received: from hu-molvera-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 10 Mar 2025 14:12:42 -0700
From: Melody Olvera <quic_molvera@quicinc.com>
Date: Mon, 10 Mar 2025 14:12:31 -0700
Subject: [PATCH v2 3/6] dt-bindings: ufs: qcom: Document the SM8750 UFS
 Controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250310-sm8750_ufs_master-v2-3-0dfdd6823161@quicinc.com>
References: <20250310-sm8750_ufs_master-v2-0-0dfdd6823161@quicinc.com>
In-Reply-To: <20250310-sm8750_ufs_master-v2-0-0dfdd6823161@quicinc.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Satya Durga Srinivasu Prabhala
	<quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-scsi@vger.kernel.org>, Nitin Rawat <quic_nitirawa@quicinc.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741641161; l=1058;
 i=quic_molvera@quicinc.com; s=20241204; h=from:subject:message-id;
 bh=DUEH42A48gdtdBr4cr2mhYc1Ml2OgfICtAOxDh0w7kc=;
 b=fhNUs2Mg/M5hnNt3+HxR13Hz448ocMT8PCe483lGWiynEwgtoYRI1mpq9zwptW8mKQ8FNmLBF
 StGsnnGhNYYBEupKEMJXdLSyBV+jQypmKvW0HjrxoVtw9GRlWvpDDRQ
X-Developer-Key: i=quic_molvera@quicinc.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: AzkzpPvxcahHom6hVSeoZn-nQ2vw3gPo
X-Authority-Analysis: v=2.4 cv=KK2gDEFo c=1 sm=1 tr=0 ts=67cf55d2 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=3H110R4YSZwA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=u0-Bzi-a7h-vFBLzmccA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: AzkzpPvxcahHom6hVSeoZn-nQ2vw3gPo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-10_08,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=987
 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503100162

From: Nitin Rawat <quic_nitirawa@quicinc.com>

Document the UFS Controller on the SM8750 Platform.

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
---
 Documentation/devicetree/bindings/ufs/qcom,ufs.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
index a03fff5df5ef2c70659371bf302c59b5940be984..6c6043d9809e1d6bf489153ab0aea5186d3563cc 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
@@ -43,6 +43,7 @@ properties:
           - qcom,sm8450-ufshc
           - qcom,sm8550-ufshc
           - qcom,sm8650-ufshc
+          - qcom,sm8750-ufshc
       - const: qcom,ufshc
       - const: jedec,ufs-2.0
 
@@ -158,6 +159,7 @@ allOf:
               - qcom,sm8450-ufshc
               - qcom,sm8550-ufshc
               - qcom,sm8650-ufshc
+              - qcom,sm8750-ufshc
     then:
       properties:
         clocks:

-- 
2.46.1


