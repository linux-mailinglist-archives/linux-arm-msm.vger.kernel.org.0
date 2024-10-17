Return-Path: <linux-arm-msm+bounces-34746-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E29B9A230A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 15:08:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F96F1C2142E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 13:08:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B271C1DE2A6;
	Thu, 17 Oct 2024 13:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jDsjTfQs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408831DDC31;
	Thu, 17 Oct 2024 13:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729170468; cv=none; b=k+qutdXlYqRslOzKzjWsbSl7px1e6HmEtcjDxbfvEB3RLPv3RbVcnfKtsY31GyI6smWlW5VrA1w9KGNjEgt7b1mJ8JTqlHavWcuQS73Es/9aXuLH18qSZBM4pRFagFxFJbwEOdskQuzkW+1C3rFH5qR4pCuslm6e0xDZS6t8Ycg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729170468; c=relaxed/simple;
	bh=9FuDBpUMXkBWbkqYcSIurBKwp0UZld5MarGu9qtGosI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VQX/FeJ6p9dr8Wot7DCXZT+hf9bJbeostlL/uklzRMKRsD32OWRSBJCmSpISCTx5AnPj35Ufd3vGMlSFGN0+G8XvtFy782YG+lyrKw773kTL/2hjZMP6Ly6DbMpyv7USPgiNrHxfZwNFBvKn7KE9E3kTPAI/L+O5AFViHkIKM24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jDsjTfQs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49H8LbKw001599;
	Thu, 17 Oct 2024 13:07:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0UQbZ4LIRhU+Et8LlFmmwq
	mxv0dWesyFmsh0udmtciw=; b=jDsjTfQs60xK1dlUgLuWGwX4uO/QSU1VV3PCLL
	GcTXhBBFIhnIQrBkaVBH2n3IQ9kNhL7D77ig02najMVUxL5ZwPa2bvhGhiv34vsP
	dQdZBLbmGVWQREJDy6Bm/Pk17C6djsSqFggzdI9Br4XBNTD31iDM2DowzKDge/IZ
	tLu2McgGutytsFUG4WkL+8Z4RSP3gmb7OvhQYFbO5DXhuE3Ogz/+wpj6JUDOVyyD
	NsQOUdN2JDrVaWKsLRDAH3lZU60TAZkSDmFhLoSKFHHrgd4qGf8DgMd8qjtNQVkm
	2wGXzFVRFbfeG9lIov6fZJHh7WAmooAxJ2rsVVpUIo6l47Cg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42ajm5akss-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 13:07:34 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49HD7HRx019606
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 13:07:17 GMT
Received: from hu-kriskura-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 17 Oct 2024 06:07:11 -0700
From: Krishna Kurapati <quic_kriskura@quicinc.com>
To: Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Wesley Cheng
	<quic_wcheng@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>
CC: <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <quic_ppratap@quicinc.com>,
        <quic_jackp@quicinc.com>, Krishna Kurapati <quic_kriskura@quicinc.com>
Subject: [PATCH v2 0/5] Add support for primary USB controller on QCS615
Date: Thu, 17 Oct 2024 18:36:56 +0530
Message-ID: <20241017130701.3301785-1-quic_kriskura@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 99nY2Llk_ttiPL6X0F1AlXvmKuXmSq7_
X-Proofpoint-ORIG-GUID: 99nY2Llk_ttiPL6X0F1AlXvmKuXmSq7_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 mlxscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410170090

This series aims at enabling USB on QCS615 which has 2 USB controllers.
The primary controller is SuperSpeed capable and secondary one is
High Speed only capable. The High Speed Phy is a QUSB2 phy and the
SuperSpeed Phy is a QMP Uni Phy which supports non-concurrent DP.

Device tree patches will sent separately after the SMMU node is acked [1]
on upstream. DT Binding checks done on the binding patches.

Bindings have been added only for the first controller.
Kept the ACKs as is obtained from v1.

[1]: https://lore.kernel.org/all/20241011063112.19087-1-quic_qqzhou@quicinc.com/

Gave only a compile test on v2 as there are no code changes
that can affect the functionality.

Changes in v2:
Addressed comments in v1 by using lowercase for reg values.
Removed explicitly setting of struct params to false (as they are
already false).

Link to v1:
https://lore.kernel.org/all/20241014084432.3310114-1-quic_kriskura@quicinc.com/

Krishna Kurapati (5):
  dt-bindings: usb: qcom,dwc3: Add QCS615 to USB DWC3 bindings
  dt-bindings: phy: qcom,qusb2: Add bindings for QCS615
  dt-bindings: phy: qcom,msm8998-qmp-usb3-phy: Add support for QCS615
  phy: qcom-qusb2: Add support for QCS615
  phy: qcom: qmp-usbc: Add qmp configuration for QCS615

 .../phy/qcom,msm8998-qmp-usb3-phy.yaml        |  2 ++
 .../bindings/phy/qcom,qusb2-phy.yaml          |  1 +
 .../devicetree/bindings/usb/qcom,dwc3.yaml    |  3 +++
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c      |  3 +++
 drivers/phy/qualcomm/phy-qcom-qusb2.c         | 27 +++++++++++++++++++
 5 files changed, 36 insertions(+)

-- 
2.34.1


