Return-Path: <linux-arm-msm+bounces-25677-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3CB92BD60
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 16:48:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3EDE6B22971
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 14:48:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CBF615B57D;
	Tue,  9 Jul 2024 14:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="R+QwylVN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01B41E864;
	Tue,  9 Jul 2024 14:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720536498; cv=none; b=FhGTJcAd5SPHlCKGCtkmBskmeaGa2buX44A1itcbYf0NFp1YDgK4ucbTGZsSfc0q6PGBgtcgK1I0lp5qd7H0rPVavxquzB7AwcQLgJZt/vBX553Zd+sN1NiDiIm9SGrpnFrYxV9EGU1OVR2KEBpt/OOr0nInJe1/yjgKw7dLvPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720536498; c=relaxed/simple;
	bh=obvu4AFTHypPGBDGsMt159u0CvdKU5rXLIZAGwgZKQY=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=W0/3NCKdlnIOmpr/CazlpkfhTucZ15nM32Aa/MBwMmEd4TRCfWgwPn3JkGQH9BGSlIn/GjKpueJLyLdan0O3fpvKRwhUKfPNhRSN0Lgjw3Xfy90mxp6ow1KoJAEml98Wtdd7WUPDfVLDf0rrf+cSRIs3+au2xd4+vgDImlcBRHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=R+QwylVN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 469BaWrs012241;
	Tue, 9 Jul 2024 14:48:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=h/oZ+UH0tyjqddH19wO2+Q
	w5NyLzsBuiaahhLERuhEk=; b=R+QwylVNFe1fpvr0jHayQRg5NwElJfVPC9rlP/
	hLVDmp+V11cZgJksqAAPznCFLaWl8zFtB1IG53aIGg1lfQuImI5un47LoXsJ1i/h
	5tB44xcGA5E3R1SaW436pKfS5i0PT4rXyvn9NmLMASMyjdv45VQHPhYirK6DLqlV
	hau3I0wF0hExpmgip2YOQmkCSxJAt+jBcgNGEq3MiyxqS9tqx5srhqcAhT6cTr+z
	PJcZodeXFRUGc4NyfdGKHeALy8PF+ScSUa1E7wJcJV4ynukjcOCcmPdtmbBY3fQg
	GVVyaQ8dGxDSgrU0anHXech6PCxNdFGPRyDxWjXTETRgSXtw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406wmmpvr0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jul 2024 14:48:09 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 469Em8aS014922
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Jul 2024 14:48:08 GMT
Received: from tengfan-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 9 Jul 2024 07:48:03 -0700
From: Tengfei Fan <quic_tengfan@quicinc.com>
Subject: [PATCH v2 0/2] phy: qcom-qmp-pcie: Add QCS9100 x4 lane EP
 compatible
Date: Tue, 9 Jul 2024 22:47:53 +0800
Message-ID: <20240709-add_qcs9100_pcie_phy_compatible-v2-0-c68f1e38560b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJlNjWYC/zXNQQ6DIBCF4asY1sXMYI3aVe/RGEIBdZIWEaypM
 d69aNLl9xbv31i0gWxkt2xjwS4UaXQJ4pIxPSjXW04mmQkQV6ig4coYOenYIID0mqz0wyr1+PZ
 qpufL8rJAhcJoUSCy9OKD7eh7Fh5t8kBxHsN6Bhc81v93AaKsS8gFVgKg5sinD2k5W9d3yt0Pk
 NN5arF23/cf4dg9DLsAAAA=
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Tengfei Fan <quic_tengfan@quicinc.com>
X-Mailer: b4 0.15-dev-a66ce
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720536482; l=1699;
 i=quic_tengfan@quicinc.com; s=20240709; h=from:subject:message-id;
 bh=obvu4AFTHypPGBDGsMt159u0CvdKU5rXLIZAGwgZKQY=;
 b=V7VBNC5phjCRasjn68VAavnYa0yjw49YHVN7U42lsPH51cg9hZ/rt3RIx5eXoO1GfdKX+7nc7
 9aRDHY4csbzCU/eSqVSYQenKyjDS3xH4sXv1BuBzWPyAfsBr7d4mU13
X-Developer-Key: i=quic_tengfan@quicinc.com; a=ed25519;
 pk=4VjoTogHXJhZUM9XlxbCAcZ4zmrLeuep4dfOeKqQD0c=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: JHJaTF6Gud-9QiMBMOuBP0AlehMEgJa-
X-Proofpoint-ORIG-GUID: JHJaTF6Gud-9QiMBMOuBP0AlehMEgJa-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-09_04,2024-07-09_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 mlxscore=0 mlxlogscore=768
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407090096

Introduce support for the QCS9100 SoC device tree (DTSI) and the
QCS9100 RIDE board DTS. The QCS9100 is a variant of the SA8775p.
While the QCS9100 platform is still in the early design stage, the
QCS9100 RIDE board is identical to the SA8775p RIDE board, except it
mounts the QCS9100 SoC instead of the SA8775p SoC.

The QCS9100 SoC DTSI is directly renamed from the SA8775p SoC DTSI, and
all the compatible strings will be updated from "SA8775p" to "QCS9100".
The QCS9100 device tree patches will be pushed after all the device tree
bindings and device driver patches are reviewed.

The final dtsi will like:
https://lore.kernel.org/linux-arm-msm/20240703025850.2172008-3-quic_tengfan@quicinc.com/

The detailed cover letter reference:
https://lore.kernel.org/linux-arm-msm/20240703025850.2172008-1-quic_tengfan@quicinc.com/

Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
---
Changes in v2:
  - Split huge patch series into different patch series according to
    subsytems
  - Update patch commit message

prevous disscussion here:
[1] v1: https://lore.kernel.org/linux-arm-msm/20240703025850.2172008-1-quic_tengfan@quicinc.com/

---
Tengfei Fan (2):
      dt-bindings: phy: qcom,qmp: Add qcs9100 QMP PCIe PHY
      phy: qcom-qmp-pcie: add x4 lane EP support for QCS9100

 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml         | 4 ++++
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c                            | 6 ++++++
 2 files changed, 10 insertions(+)
---
base-commit: 0b58e108042b0ed28a71cd7edf5175999955b233
change-id: 20240709-add_qcs9100_pcie_phy_compatible-531a12dc2311

Best regards,
-- 
Tengfei Fan <quic_tengfan@quicinc.com>


