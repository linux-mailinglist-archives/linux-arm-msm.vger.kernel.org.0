Return-Path: <linux-arm-msm+bounces-2405-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0617FD441
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 11:34:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5757F1F2101B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 10:34:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E158A1BDC0;
	Wed, 29 Nov 2023 10:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jxsMe45T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD5B1D73;
	Wed, 29 Nov 2023 02:34:38 -0800 (PST)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AT4ughY024554;
	Wed, 29 Nov 2023 10:34:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=QDF2WawLzwRZKRh22xM3P4YpiNnaDTbDAxEW24mUccI=;
 b=jxsMe45TPij4BI/VPLCjFxMPnqNT18Ri6TXKuYU9vsbvCoBDaKpUdsJx1pwFGMcAJKXU
 n5cP4/2cJDOpv3MWeFDf2QmcGbXjOPlblWsxgDlzL38jDyT+tZ7bI2MyCqPYd1YsmqbV
 6N+UmHe76kqk94uhfQDDDpqXYaH+lxJX251/s5dGVAiCs5vVfxJPy87a0AIrok3CQw3O
 qkXSkP1CwoBUqYVSBMW85kc4GY4e8Lcu0nvccP0aC/90FKPjibq5oQkwhssjhN7oLXNr
 CIH/865FZThA9X3PaHYqLQDzvRcq+Eij3ZkAI6o9n3Kvt6XmvNjx6IT6OaAEV/2EArtQ vg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3unjdtjmqu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Nov 2023 10:34:34 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3ATAYXRB030795
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Nov 2023 10:34:33 GMT
Received: from tengfan2-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 29 Nov 2023 02:34:28 -0800
From: Tengfei Fan <quic_tengfan@quicinc.com>
To: <agross@kernel.org>, <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        Tengfei Fan
	<quic_tengfan@quicinc.com>
Subject: [PATCH v7 0/6] soc: qcom: Add uart console support for SM4450
Date: Wed, 29 Nov 2023 18:33:19 +0800
Message-ID: <20231129103325.24854-1-quic_tengfan@quicinc.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: uMzD8ojoPFbBOWDJezKEcmtRX5s0xcAc
X-Proofpoint-ORIG-GUID: uMzD8ojoPFbBOWDJezKEcmtRX5s0xcAc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-29_07,2023-11-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 mlxscore=0 mlxlogscore=444
 impostorscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311290078

This series add base description of UART, TLMM, RPMHCC, GCC and RPMh PD
nodes which helps SM4450 boot to shell with console on boards with this
SoC.

Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
---
"[PATCH v4 0/2] pinctl: qcom: Add SM4450 pinctrl driver"
https://lore.kernel.org/linux-arm-msm/20230920082102.5744-1-quic_tengfan@quicinc.com/
"[PATCH 0/2] pinctrl: qcom: fix some sm4450 pinctrl issue"
https://lore.kernel.org/linux-arm-msm/20231129100422.16659-1-quic_tengfan@quicinc.com/

v6 -> v7:
  - drop reserve gpio 136, pinctrl driver issue cause gpio 136
    accessed issue

v5 -> v6:
  - remove link that depend on clock patch from cover letter
  - remove patch which already mainline

v4 -> v5:
  - separate reserved gpios setting from enable UART console patch

v3 -> v4:
  - adjustment the sequence of property and property-names
  - update 0 to 0x0 for reg params
  - remove unrelated change
  - separate SoC change and board change

v2 -> v3:
  - fix dtbs_check warning
  - remove interconnect, iommu, scm and tcsr related code
  - rearrangement dt node
  - remove smmu, scm and tcsr related documentation update
  - enable CONFIG_SM_GCC_4450 in defconfig related patch

v1 -> v2:
  - setting "qcom,rpmh-rsc" compatible to the first property
  - keep order by unit address
  - move tlmm node into soc node
  - update arm,smmu.yaml
  - add enable pinctrl and interconnect defconfig patches
  - remove blank line
  - redo dtbs_check check

previous discussion here:
[1] v6: https://lore.kernel.org/linux-arm-msm/20231031075004.3850-1-quic_tengfan@quicinc.com
[1] v5: https://lore.kernel.org/linux-arm-msm/20231011031415.3360-1-quic_tengfan@quicinc.com
[2] v4: https://lore.kernel.org/linux-arm-msm/20230922081026.2799-1-quic_tengfan@quicinc.com
[3] v3: https://lore.kernel.org/linux-arm-msm/20230920082102.5744-1-quic_tengfan@quicinc.com
[4] v2: https://lore.kernel.org/linux-arm-msm/20230915021509.25773-1-quic_tengfan@quicinc.com
[4] v1: https://lore.kernel.org/linux-arm-msm/20230908065847.28382-1-quic_tengfan@quicinc.com

Ajit Pandey (1):
  arm64: dts: qcom: sm4450: Add apps_rsc and cmd_db node

Tengfei Fan (5):
  arm64: dts: qcom: sm4450: Add RPMH and Global clock
  arm64: dts: qcom: add uart console support for SM4450
  arm64: dts: qcom: sm4450-qrd: add QRD4450 uart support
  arm64: dts: qcom: sm4450-qrd: mark QRD4450 reserved gpios
  arm64: defconfig: enable clock controller and pinctrl

 arch/arm64/boot/dts/qcom/sm4450-qrd.dts |  18 +++-
 arch/arm64/boot/dts/qcom/sm4450.dtsi    | 107 ++++++++++++++++++++++++
 arch/arm64/configs/defconfig            |   2 +
 3 files changed, 125 insertions(+), 2 deletions(-)


base-commit: 1f5c003694fab4b1ba6cbdcc417488b975c088d0
-- 
2.17.1


