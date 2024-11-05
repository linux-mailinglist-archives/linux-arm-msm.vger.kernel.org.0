Return-Path: <linux-arm-msm+bounces-36993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0CF9BC3CE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2024 04:22:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ADD91282AC7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2024 03:22:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC0DD18C93C;
	Tue,  5 Nov 2024 03:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZDG8Ggh4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DFE81885AA;
	Tue,  5 Nov 2024 03:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730776907; cv=none; b=XQI0lBEa8lIONJXbdJV5egJJ4t9yOPo4Bav8dsqNCwbDsKr2h+zHHSi/WnsauvRQ5xO5BaQs6aL8cqJaQ/Bc3blcEuwb27a0vgAkdC2b8Sr3pC27R8zSUNluuAdgtqlDhqIf71brAnBa/ic58+WyTjTDWoJUvPtEv9Wz6zx2Iww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730776907; c=relaxed/simple;
	bh=dQAp/VTVX6hMOEqst3RvxaXJ5Bmt1XUxqLjsvVUfAmY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WsZ9Zn1WM7iv4XzaZIywceh/O6uF9+FhSRnmBsCEcAUELZlLo442sWxvWrHw9U7Jogw6wRGDysDbTnsLqDoEAIZQyhVtVEMe0m4/kWo3VJ9puFDBXzyZnjzW3AKdxFd5/+12MkhIikka1JkBee80HjRmVshUiIcc0XS2sBt8pIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZDG8Ggh4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4LJ9iZ005384;
	Tue, 5 Nov 2024 03:21:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nSCTkC0A14h9EzgcnXIRiovN
	oEDasIREAiWAuMGILoU=; b=ZDG8Ggh44G7fGyl8EJs/ZH7wlpR99EF5PoS7KFQv
	GjlHpJ3WT7gtXgncfz6FH+YN5fDvgJBDKZ2AmLBX5Vz6SQv3z5QMAkyTkv8KauQG
	bb5f5B5K0mUMlThgcnItUjvDQELj+lcyVcfOyEHMWDJVa4VgYjiZ9yRMtq5JunkX
	rlwa0ifsrmxHz4ToSS8YQMZSwQCmUCJI+ZNRq+UhU7RoXhm54pbNYsDcTx6H6hUo
	+MJ6mEUZ9q8IfjJ+IvM9OxvMOfCd0f3Jl1GmlX8AUx3N3bOfUnV8sNK5b4LsSDIs
	eA0vaY+u1qgsx7mzwwM0pFuCYOWOXG91IilPiNoebboI1g==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42ndc6x6na-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Nov 2024 03:21:37 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A53LaE1011852
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 5 Nov 2024 03:21:36 GMT
Received: from hu-qqzhou-sha.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 4 Nov 2024 19:21:32 -0800
From: Qingqing Zhou <quic_qqzhou@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <robimarko@gmail.com>,
        <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>,
        Qingqing Zhou
	<quic_qqzhou@quicinc.com>
Subject: [PATCH v4 2/3] arm64: dts: qcom: qcs615: add the SCM node
Date: Tue, 5 Nov 2024 08:51:06 +0530
Message-ID: <20241105032107.9552-3-quic_qqzhou@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241105032107.9552-1-quic_qqzhou@quicinc.com>
References: <20241105032107.9552-1-quic_qqzhou@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: uLyhN6KyTd8XB_XFQglSIK9NFe0lnTxG
X-Proofpoint-GUID: uLyhN6KyTd8XB_XFQglSIK9NFe0lnTxG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 adultscore=0 clxscore=1015 mlxscore=0
 phishscore=0 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411050025

Add the SCM node for QCS615 platform. It is an interface to
communicate to the secure firmware.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Qingqing Zhou <quic_qqzhou@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
index ac4c4c751da1..027c5125f36b 100644
--- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
@@ -278,6 +278,13 @@
 		reg = <0 0x80000000 0 0>;
 	};
 
+	firmware {
+		scm {
+			compatible = "qcom,scm-qcs615", "qcom,scm";
+			qcom,dload-mode = <&tcsr 0x13000>;
+		};
+	};
+
 	camnoc_virt: interconnect-0 {
 		compatible = "qcom,qcs615-camnoc-virt";
 		#interconnect-cells = <2>;
-- 
2.17.1


