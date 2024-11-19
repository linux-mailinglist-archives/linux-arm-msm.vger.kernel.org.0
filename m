Return-Path: <linux-arm-msm+bounces-38264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D66F39D1E14
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 03:22:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97791284386
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 02:22:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6862136337;
	Tue, 19 Nov 2024 02:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YO1OnWT2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015AD7DA84;
	Tue, 19 Nov 2024 02:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731982912; cv=none; b=Jw9+Cavbm1p77y6x+3In4NGpjOIcoCYEL6/7KJE95SB352Oki88Mgo7LjKzz7h055IsMDKF0cPtJj9q2yu3LqlZvkowEWFy4LlZd5N49SqH3sPSODbtcXUSS/lRpv8TZTASqpnX0Polr0MdRPs2ZhA2RvH3co81nYmXeJqcIP8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731982912; c=relaxed/simple;
	bh=7SL43tch81e4oDvOZQhg43YW2yt8frGpglvbtPYs8Q0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Zn8334lHeelgmslDCY+GjWdqqAm0oXOJl5j4d4+CFHfR2MUMGL/30vf2VZw0dLwHKOgtMWNHMn+XH3WTdaKJGHqapgLI/i6NwtJyFI4OS05JZwq8etSMWPZO1BrfMB73xqQIFsis0FlWJ1GEX3ibdIzA5MsvLIIb7lPWfV+/zuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YO1OnWT2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AIGGhRK028554;
	Tue, 19 Nov 2024 02:21:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=SeaC2NyM77Sf41ZMIHFVuN
	BuRtQtRhVsb2GmS2eavso=; b=YO1OnWT2aoS33lu+a5eLLdUafow8A4XZsAhLRL
	D7GTnxlcGcZ6qosG2wf6cGp3w/hmNkU6+CR83WmG2lAS2cUuxx6gahm5X8k/oO/1
	/5Gl8653Wb6re93ZxjSOverCWN49hpSxxL/cpIW3zES1Xqk78xpX60UFvJTvyhST
	eCrY8nwI63y+ANzVemz6VCzEsaGlZw6Mjg/RmFv29gp573Lu1N13+G3dvoKRpdOv
	vrPaTCZf8Sn6v+sOr8JO5h4QCHJ8Z5cJnqO1Xl01aUpRbzNVkUFOxzNigsxT5SRL
	ua60WW6Dc1qTx4waMDoUe1TcEqX8nRfrKtEx4IQOOWtY5y1w==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4308y814x6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 02:21:28 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AJ2LRD1020828
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 02:21:27 GMT
Received: from liuxin-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 18 Nov 2024 18:21:21 -0800
From: Xin Liu <quic_liuxin@quicinc.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>, Andy Gross <agross@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-scsi@vger.kernel.org>, <quic_jiegan@quicinc.com>,
        <quic_aiquny@quicinc.com>, <quic_tingweiz@quicinc.com>,
        <quic_sayalil@quicinc.com>
Subject: [PATCH v2 0/3] Enable UFS on QCS615
Date: Tue, 19 Nov 2024 10:20:47 +0800
Message-ID: <20241119022050.2995511-1-quic_liuxin@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: GXPaPUiJ3RWVHI6XKpolS0l-NernmBHQ
X-Proofpoint-GUID: GXPaPUiJ3RWVHI6XKpolS0l-NernmBHQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 mlxscore=0 spamscore=0 adultscore=0 suspectscore=0 malwarescore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411190019

From: Sayali Lokhande <quic_sayalil@quicinc.com>

Add UFS support to the QCS615 Ride platform. The UFS host controller and
QMP UFS PHY hardware of QCS615 are derived from SM6115. Include the
relevant binding documents accordingly. Additionally, configure UFS-related
clock, power, and interconnect settings in the device tree.

This patch series depends on below patch series:
https://lore.kernel.org/all/20240926-add_initial_support_for_qcs615-v3-0-e37617e91c62@quicinc.com/
https://lore.kernel.org/all/20241011063112.19087-1-quic_qqzhou@quicinc.com/

Signed-off-by: Xin Liu <quic_liuxin@quicinc.com>
---
Changes in v2:
- PATCH 1/3: Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
- PATCH 2/3：Use an OPP table instead of freq-table-hz.And modify
  some formatting issues.
- PATCH 3/3：Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
- Link to v1: https://lore.kernel.org/all/20241017042300.872963-1-quic_liuxin@quicinc.com/

--- 

Xin Liu (3):
  dt-bindings: ufs: qcom: Add UFS Host Controller for QCS615
  arm64: dts: qcom: qcs615: add UFS node
  arm64: dts: qcom: qcs615-ride: Enable UFS node

 .../devicetree/bindings/ufs/qcom,ufs.yaml     |   2 +
 arch/arm64/boot/dts/qcom/qcs615-ride.dts      |  16 +++
 arch/arm64/boot/dts/qcom/qcs615.dtsi          | 112 ++++++++++++++++++
 3 files changed, 130 insertions(+)
---
base-commit: 0abcfdffcf872e4ef00e329b2013fb338acf3a57

-- 
2.34.1


