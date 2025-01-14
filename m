Return-Path: <linux-arm-msm+bounces-44966-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E57BCA10110
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 08:01:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F39EC167811
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 07:01:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57DF3233556;
	Tue, 14 Jan 2025 07:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZG9gifP6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754241CD219;
	Tue, 14 Jan 2025 07:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736838062; cv=none; b=OdUW32eYFHuSjJB1+Q+1Z3z7oMKpIzwNGGHBMqGfsOLkVqgN194TkooZRyVkKPnWJ7tUiKiebDqFxRy7riNEcJNVJML46bkryXBM5TRhe8xa8vVokTEXI0MwGP/RVIz/ZYTiMtuXDWio9pf0Pp+p2P8oRUd20JztwJy/ZBcTFyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736838062; c=relaxed/simple;
	bh=CKTobbp4ULY1aX7s8Z/DztXNhnaog8JBA19XvX3v/KE=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=FQ7sVyTxb5EXuoBK8MR63c9TGditelxtX+Mt2EsuW2SyirQajrEB+dlA2RjQ3rjVX5cQX3IOc5ODMmaKVGUHKBaHiFZlV/W58mRCcpzgfKbEgYfm/jcQ0qFMKEx5vEtmq7ukKs38N5rAQEBxRd7pK5EEn+XdyR0FGfDsM+PVBvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZG9gifP6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50E21lQA015693;
	Tue, 14 Jan 2025 07:00:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9SSZoYKlRpg2zPI20ZXbWh
	uvZ7qrzB4frXs6Nb5YHRg=; b=ZG9gifP6JoFXykJ9QvZwT1HV3e1hCM4s+367BO
	6bcE8H82hQRPdwdvvbSyDJ8nWMPtItKngstXbRlnTz2QCaL35CXTOTFfyIkRcCcL
	N2vDSlvGZVWpifJLezpf2DgFlHjjnqx8QFVX60EjEj5Od/wqIW6shjIvqATF0YFx
	++FXUIYuaIHdABCdx2CqbBv/g4BhPzxUF8TNQ3yLlpXQVK1aJHpiTt0da1Q9dQ/d
	lSyPrJ0PuJ5sVpF08P4N9CX6au260S2sBW3vy80q5tAopSd2We5d8TXYGPl+gg77
	1F4bX6AXDu7JcyKLJjq4+nBQvEcpmFITOwLI9OKNBS47aTvQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 445esfrhr2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 07:00:56 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50E70ti6001513
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 07:00:55 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 13 Jan 2025 23:00:52 -0800
From: Yongxing Mou <quic_yongmou@quicinc.com>
Subject: [PATCH v3 0/2] Enable DPU and Display Port for Qualcomm
 QCS8300-ride platform
Date: Tue, 14 Jan 2025 14:59:03 +0800
Message-ID: <20250114-dts_qcs8300-v3-0-d114cc5e4af9@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE8LhmcC/22Q22rDMBBEf8XouSq6ruQQSv+jhKLLutaDL7Fc0
 xD875WdUlqSx1mYszNzJRmnhJkcqiuZcEk5DX0R8qkioXX9B9IUiyaCCcWF0DTO+f0cspWMURW
 VqGsGRjIgxTFO2KSvnfZ2uukJz58FOt+OpMOc3Q49VMfC1IxzSeM4tpeNWm/UhVNOrRKmtgERj
 X0tiJD68ByG7mX785jSxZzj/BtukZRRCBZrqXQNjN1hvMtIi+jSXBobLsE3OkgHDXiwEI1qFLf
 SOFAMPAbwxgeyFWtTnofpsq+2iL3Zw4EWUTJwoZ0X3Ahj/d8MW4QfF9y7MNioGg86ePfPdVrX9
 RuSS6ErtwEAAA==
X-Change-ID: 20241225-dts_qcs8300-4d4299067306
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Yongxing Mou <quic_yongmou@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736838049; l=2276;
 i=quic_yongmou@quicinc.com; s=20241121; h=from:subject:message-id;
 bh=CKTobbp4ULY1aX7s8Z/DztXNhnaog8JBA19XvX3v/KE=;
 b=7zTgDzGfD6kHciHhticHedvp7ax28iDVejElXK4hW5TfzP4DfIKOV0UXEZWuty72/jgV0LjLm
 rlyXh+iwXdaCGuYzU0urE3Thy8Fd9H/yBc4k9p8Va8IxHkCs0E5n5+a
X-Developer-Key: i=quic_yongmou@quicinc.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: NdS7jiFVJ4E0pWbKYRj7letPlVUrS0xu
X-Proofpoint-ORIG-GUID: NdS7jiFVJ4E0pWbKYRj7letPlVUrS0xu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 priorityscore=1501 malwarescore=0 mlxlogscore=503 impostorscore=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501140056

This series adds the MDSS, DPU and DPTX0 node on Qualcomm QCS8300 SoC.
It also enables Display Port on Qualcomm QCS8300-ride platform.

Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
---
This series depends on following series:
https://lore.kernel.org/all/20250113-dpphy_qcs9300-v1-1-842798ceee78@quicinc.com/
https://lore.kernel.org/all/20250113-mdssdt_qcs8300-v3-0-6c8e93459600@quicinc.com/
---
Changes in v3:Fixed review comments from Konrad, Dmitry.
- Correct the Power-domain for DP PHY should be
  RPMHPD_MX.[Dmitry][Konrad]
- Correct the interconnects path for mdp and align the property order
  with x1e80100.dtsi.[Konrad]
- Rebase the patch to latest code base and update the dependencies in
  the cover letter.
- Link to v2: https://lore.kernel.org/r/20241226-dts_qcs8300-v2-0-ec8d4fb65cba@quicinc.com

Changes in v2:Fixed review comments from Konrad, Dmitry and Krzysztof.
- Reuse eDP PHY and DPU of SA8775 Platform.[Dmitry][Krzysztof]
- Reuse DisplayPort controller of SM8650.[Dmitry]
- Correct the regs length, format issues and power-domains.[Konrad]
- Integrate the dt changes of DPU and DP together.
- Link to v1: https://lore.kernel.org/all/20241127-dp_dts_qcs8300-v1-0-e3d13dec4233@quicinc.com/
~

---
Yongxing Mou (2):
      arm64: dts: qcom: qcs8300: add display dt nodes for MDSS, DPU, DisplayPort and eDP PHY
      arm64: dts: qcom: qcs8300-ride: Enable Display Port

 arch/arm64/boot/dts/qcom/qcs8300-ride.dts |  42 ++++++
 arch/arm64/boot/dts/qcom/qcs8300.dtsi     | 205 +++++++++++++++++++++++++++++-
 2 files changed, 246 insertions(+), 1 deletion(-)
---
base-commit: 37136bf5c3a6f6b686d74f41837a6406bec6b7bc
change-id: 20241225-dts_qcs8300-4d4299067306
prerequisite-message-id: <20250113-dpphy_qcs9300-v1-1-842798ceee78@quicinc.com>
prerequisite-patch-id: 2ea89bba3c9c6ba37250ebd947c1d4acedc78a5d
prerequisite-message-id: <20250113-mdssdt_qcs8300-v3-0-6c8e93459600@quicinc.com>
prerequisite-patch-id: b798711c6a9bd9c4f0b692835865235e78cd2adb
prerequisite-patch-id: 146c61567c42bf5268d1005f8e9b307ea2af93d9
prerequisite-patch-id: 3ce5246ad3470d7392df23a52b3c8b8bd1662db6
prerequisite-patch-id: e81de8a09467a49eaeb4af73a0e197e4156ce202

Best regards,
-- 
Yongxing Mou <quic_yongmou@quicinc.com>


