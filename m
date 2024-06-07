Return-Path: <linux-arm-msm+bounces-22052-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3847590023D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 13:35:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59EE31C22283
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 11:35:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35412188CC0;
	Fri,  7 Jun 2024 11:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hNoIhkN/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B203F2837F;
	Fri,  7 Jun 2024 11:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717760112; cv=none; b=I8q4NuirYuxPgF1Waj1KGSIaIgtC8njebnt1TJX7GbSmA5Jj0PlABARfeNF2ON97iydS4ZTMIbj28nnSKVk+FdgRWm9eH7T885DZByeG8IkkrK+06Isx1jisjifMh6zYInCFx0VwZQtCIAm29xjv2Pa/EtJzPkMCBgdg9AgU5g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717760112; c=relaxed/simple;
	bh=/kbLTCxrHbwf56ynyvIbJjEEZktlB0hG7QhbDg3RaGY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=le2DHtGh+3o9uHjXhCK9hpl7NiOr5QSy5fVTwBIae8Q4frdZEGrCUhz2be0d+JXxxHLJHbnU6lifaabHSq4BgCP4cH6yC84h6Vj4wFsIUvdI2KFsM3znh7oaqDyp5dv+7qB3p61W9FZNCpA/yuhlxjze6UiBiZPNse3B7tocd3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hNoIhkN/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 457BF75B026761;
	Fri, 7 Jun 2024 11:35:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=98ffrLViHhUBJ6gaUpb/ni
	3uAB8Etx5f4yMxRQqCv8U=; b=hNoIhkN/yvC2zX/JakhtvEsb8trT76rF/CSB54
	6dvh01STmrJgTMblqGd71oFzWSkLo9ena1hDPDT/SosYAJ/7v07QzlmxJayJ6X6k
	2zm1By9oBU3ArF1Qm9lLB1SSiDydsOc1athYaGIiFl/0hIu88x2/+ip8Hm2mStA8
	HBRmzr1P8IRxBnuSViWSQsc/pRwL71ndWUjx0YxCMnWrzxHrV/qbS6EckLT46VLz
	qUbb9XmzPjW2RTRUpVOXfbAPctIjv12aOHCF4eTaLDvmFvg+keMe7e7bRVzMlsFQ
	xFcxeAPL7rg+Mi+yt1FfRiYGzGo+HydjL3vULFkrHnQ7f8KA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yjq2tnndq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Jun 2024 11:35:06 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 457BZ5k4005439
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 7 Jun 2024 11:35:05 GMT
Received: from hu-kbajaj-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 7 Jun 2024 04:35:02 -0700
From: Komal Bajaj <quic_kbajaj@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Komal Bajaj <quic_kbajaj@quicinc.com>
Subject: [PATCH] arm64: dts: qcom: qdu1000: Add secure qfprom node
Date: Fri, 7 Jun 2024 17:04:45 +0530
Message-ID: <20240607113445.2909-1-quic_kbajaj@quicinc.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 1-dExAvQjMVsDND-MK99iC_lL1Pdm7r9
X-Proofpoint-ORIG-GUID: 1-dExAvQjMVsDND-MK99iC_lL1Pdm7r9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-07_06,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 impostorscore=0 clxscore=1011 spamscore=0 malwarescore=0
 mlxlogscore=741 mlxscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406070084

Add secure qfprom node and also add properties for multi channel
DDR. This will be required for LLCC driver to pick the correct
LLCC configuration.

Signed-off-by: Komal Bajaj <quic_kbajaj@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qdu1000.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qdu1000.dtsi b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
index 7a77f7a55498..d8df1bab63d5 100644
--- a/arch/arm64/boot/dts/qcom/qdu1000.dtsi
+++ b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
@@ -1584,6 +1584,21 @@ system-cache-controller@19200000 {
 			reg-names = "llcc0_base",
 				    "llcc_broadcast_base";
 			interrupts = <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
+
+			nvmem-cell-names = "multi-chan-ddr";
+			nvmem-cells = <&multi_chan_ddr>;
+		};
+
+		sec_qfprom: efuse@221c8000 {
+			compatible = "qcom,qdu1000-sec-qfprom", "qcom,sec-qfprom";
+			reg = <0 0x221c8000 0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			multi_chan_ddr: multi-chan-ddr@12b {
+				reg = <0x12b 0x1>;
+				bits = <0 2>;
+			};
 		};
 	};

--
2.42.0


