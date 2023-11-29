Return-Path: <linux-arm-msm+bounces-2362-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 39AAC7FCF93
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 07:58:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 763F7281F3F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 06:58:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CF94101ED;
	Wed, 29 Nov 2023 06:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MhyDXVGh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 118DB19B2;
	Tue, 28 Nov 2023 22:58:39 -0800 (PST)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AT6TUvj029936;
	Wed, 29 Nov 2023 06:58:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=Q7Eo3vpdohYXLFmaNH6MxYH+ey+Ukm3rOcHE30o7GKY=;
 b=MhyDXVGhim8S/e4EB389lFhSFxoBEEtzUQnSkvanPmSqp9WPHyfNY8JAbIJ5C7iolmRa
 dBQIAI/KllkaZACWsvDSEUPH8D3NiIwOgpx4RNRvWFx3+TTFKD109XVOO/dLOp3DKQEG
 xbLQMqcV4gGeE9sBYR8lwovuCRAI08XrDxhIGYqw/BAejn3tp0RidsQg8NNlUfa3FNzT
 rHv6AbD+dHYlhEm36bFTnfoNNyFr65hh4IeVrVdzwJ9kxYrrp6RL3NuC7WdAIyw/zcez
 Ay2lUKz0vfEZPB9FGUXv3Y8kVFDU4k8LGtaVhn84d8uU8oGwqB23W3AQowbpJWNcEYLo JQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3up02xr2uj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Nov 2023 06:58:35 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AT6wYD9020382
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Nov 2023 06:58:34 GMT
Received: from hu-kbajaj-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 28 Nov 2023 22:58:31 -0800
From: Komal Bajaj <quic_kbajaj@quicinc.com>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Komal Bajaj <quic_kbajaj@quicinc.com>
Subject: [PATCH v7 0/3] Add support for qcm6490 idp and qcs6490 rb3gen2 board
Date: Wed, 29 Nov 2023 12:28:13 +0530
Message-ID: <20231129065816.26409-1-quic_kbajaj@quicinc.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: uFgYpuQ6dxCJRfXuN-lSUWC0zSQVi2ZO
X-Proofpoint-GUID: uFgYpuQ6dxCJRfXuN-lSUWC0zSQVi2ZO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-29_03,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=616 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311290049

This series adds the dt-binding and base devicetree files for
QCM6490 IDP based off QCM6490 SoC derived from SC7280 meant for
various form factor including IoT and QCS6490 RB3Gen2 based
off QCS6490 SoC derivative of QCM6490 without internal modem.
See more at:
https://www.qualcomm.com/content/dam/qcomm-martech/dm-assets/documents/qcs-qcm6490-soc-product-brief_87-28733-1-b.pdf

----
Changes from v6:
* Add chassis-type in qcm6490-idp.dts as suggested by Caleb
* Added reviewed tag by Caleb in p2 and p3
* Link to v6: https://lore.kernel.org/linux-arm-msm/20231124121305.1954-1-quic_kbajaj@quicinc.com/

Changes from v5:
* Added vph-pwr-regulator node and regulator supply
* Added the voltage range for ldo7 and ldo9 and removed regulator allowed modes for rb3gen2 board
* Link to v5: https://lore.kernel.org/linux-arm-msm/20231120134754.9526-1-quic_kbajaj@quicinc.com/

Changes from v4:
* Described the usecases for gpio-reserved-ranges
* Added reviewed tag by Konrad in p2 and p3
* Link to v4: https://lore.kernel.org/linux-arm-msm/20231117125056.32503-1-quic_kbajaj@quicinc.com/

Changes from v3:
* Removed qcm6490.dtsi file and moved all the contents to board file instead
* Introducing QCS6490-RB3Gen2 board
* Link to v3: https://lore.kernel.org/linux-arm-msm/20231003175456.14774-1-quic_kbajaj@quicinc.com/

Changes from v2:
* Sorted nodes alphabetically
* Link to v2: https://lore.kernel.org/all/20231003055655.30994-1-quic_kbajaj@quicinc.com/

Changes from v1:
* Dropped suffix platform from model name
* Removed few nodes as they were identical to ones in sc7280
* Specified regulator-initial-mode property to vregs
* Dropped deletion of lpass and swr nodes
* Link to v1: https://lore.kernel.org/lkml/20230928133312.11371-1-quic_kbajaj@quicinc.com/

Komal Bajaj (3):
  dt-bindings: arm: qcom: Add QCM6490 IDP and QCS6490 RB3Gen2 board
  arm64: dts: qcom: Add base qcm6490 idp board dts
  arm64: dts: qcom: Add base qcs6490-rb3gen2 board dts

 .../devicetree/bindings/arm/qcom.yaml         |   2 +
 arch/arm64/boot/dts/qcom/Makefile             |   2 +
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts      | 465 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts  | 452 +++++++++++++++++
 4 files changed, 921 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/qcm6490-idp.dts
 create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts

--
2.42.0


