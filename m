Return-Path: <linux-arm-msm+bounces-49138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F64AA4198C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 10:51:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4480D3AC411
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 09:51:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48C9E2451F1;
	Mon, 24 Feb 2025 09:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CGbq4i/V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE2024BBF5;
	Mon, 24 Feb 2025 09:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740390658; cv=none; b=U9/gl+rossJm6ujLJ8mAbEBe4aNUnMYYysdqZqhqF96My9fxWpRIQoXXdwiBjmxMyH+UrpuYvdaYeyzU7nKZSTkpLHZdA9gKvX3ffAtY/Unr7oOEGEz0iiHVYVKc6hzEtRlesVU2c7mrT4q/shiPnrXo2pXytD6FOqQTK2HPX08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740390658; c=relaxed/simple;
	bh=AW+V/3m9BUBJyT7p7GWgL2ZMcj7ir6r/SScWqZ+2LjE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Jn00Rt6GJywlq6Kn7aX+nNGglCUpXL1ogyAgluXoA8UErKYDXLBd7OTsBGBREgGq2kpX/Py7btIGPHJ6qY9ESRRB9GH2FbUkS+XyIrLmy40fD4zxzQ6AtqLwDFwE45ujkdHJf5c3Gq58d2TUhFRLbdnkxokeWtIcFWQdyUVkVeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CGbq4i/V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51NMf8rD030604;
	Mon, 24 Feb 2025 09:50:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PX82TbmITA0Q84CW35eCU1R22/DtHs9lW3Mx1JZv8B0=; b=CGbq4i/VFzIuzkV6
	osKmJiBR0op5LAQowpJvQzjaf95FeCKg8DxqtbRcbfFdKmEi7AnD90DYBSwQSI9A
	HNmearmqOSz+51ie333XRhw7sfOE3tnYMj2EmMu4CVKME1RLrMHIvvOWItF8nq2k
	V2IfreG49ojbtR8JnEP/gvucV/jnvAaKEUGUzlvgGsJoMhybLFL7zg2dHVkZCI7T
	8rJ+WNsIOz3pfAVLZirXgyKsDq4RCrHgQKdzvTTVNpUrdKQ/gXaavVzmGFguFDKz
	i/C9m13FXSQ2jXHqS6GNR37zHM0el8cXoA4IhzAZjU6+A6Vh4ZqFD1yGrkaLs8OX
	UtjbHA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y65xvg1b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Feb 2025 09:50:50 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51O9onqq028561
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Feb 2025 09:50:49 GMT
Received: from hu-arakshit-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 24 Feb 2025 01:50:45 -0800
From: Abhinaba Rakshit <quic_arakshit@quicinc.com>
Date: Mon, 24 Feb 2025 15:20:09 +0530
Subject: [PATCH 2/2] arm64: dts: qcom: qcs615: add TRNG node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250224-enable-trng-for-qcs615-v1-2-3243eb7d345a@quicinc.com>
References: <20250224-enable-trng-for-qcs615-v1-0-3243eb7d345a@quicinc.com>
In-Reply-To: <20250224-enable-trng-for-qcs615-v1-0-3243eb7d345a@quicinc.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller"
	<davem@davemloft.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul
	<vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Abhinaba
 Rakshit" <quic_arakshit@quicinc.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: vEqY2ew4vgb1ocp8Jt-FkkCzF5rxZPAj
X-Proofpoint-ORIG-GUID: vEqY2ew4vgb1ocp8Jt-FkkCzF5rxZPAj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-24_04,2025-02-24_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 mlxlogscore=772 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502240071

The qcs615 SoC has a True Random Number Generator, add the node
with the correct compatible set.

Signed-off-by: Abhinaba Rakshit <quic_arakshit@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
index f4abfad474ea62dea13d05eb874530947e1e8d3e..ab0bf68fdd8c2e223c242f70e779a3d9374292ea 100644
--- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
@@ -973,6 +973,11 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			};
 		};
 
+		rng@793000 {
+			compatible = "qcom,qcs615-trng", "qcom,trng";
+			reg = <0x0 0x00793000 0x0 0x1000>;
+		};
+
 		config_noc: interconnect@1500000 {
 			reg = <0x0 0x01500000 0x0 0x5080>;
 			compatible = "qcom,qcs615-config-noc";

-- 
2.34.1


